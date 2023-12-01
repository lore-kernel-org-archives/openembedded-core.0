Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52989C46CA7
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:14:57 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.22338.1701436493423264351
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MQAMjF+v;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=E+4wu3AE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c25848a6f-8d979a61-a1bd-441b-be0f-29d7897f6980-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mB1hV+ie9RmOKxb9FGthySiF2bqFBNWIS2zErWWBTqE=;
	b=MQAMjF+vjzK17sbtBI9ilylClNNC3ICh5Cf81U4IWHqh3aI3QI+VlxL7SoYhpD4Y
	RVpK4ZFF9M2v3jvH2MzAuphWkRQzUzZb6WQsyDcgVbloM/8zxYtm53IxQhGl3qfx+B1
	vt/csVfWQmxX/2ZMmPL9MugHkKGv4yqgGw1IO8wE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436492;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mB1hV+ie9RmOKxb9FGthySiF2bqFBNWIS2zErWWBTqE=;
	b=E+4wu3AEpyZfBb0sARfK9cExL53OQnwk0XN4RUNH+Tbb3EMBZYb6fXu4lyOc3Ge/
	V4h6WZGf0oXw/bDZIeHJ5lFl2NwR1z1aYdlL3tbpTz9wrdj6pIPVCYbq/vb8fymg17N
	F/KRwlk+pnUBXv+l+tOzeRTsCxomXp4Cz3lTb4dA=
Content-Type: multipart/mixed; boundary="===============8470752863580428359=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.12.4 SUCCEEDED
Message-ID: <0101018c25848a6f-8d979a61-a1bd-441b-be0f-29d7897f6980-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191655

--===============8470752863580428359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk4* to *4.12.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.12.3-4.12.4.patch
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
From 795f5af2cfef33d2f49ee782d709d60169cf62ed Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 11:28:34 +0000
Subject: [PATCH] gtk4: upgrade 4.12.3 -> 4.12.4

---
 meta/recipes-gnome/gtk+/{gtk4_4.12.3.bb => gtk4_4.12.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.12.3.bb => gtk4_4.12.4.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb b/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.12.3.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.12.4.bb
index 001b06934e..1b2b5c0db8 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb
@@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "148ce262f6c86487455fb1d9793c3f58bc3e1da477a29617fadb0420f5870a89"
+SRC_URI[sha256sum] = "ba67c6498e5599f928edafb9e08a320adfaa50ab2f0da6fc6ab2252fc2d57520"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.39.2


--===============8470752863580428359==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.12.3-4.12.4.patch"

RnJvbSA3OTVmNWFmMmNmZWYzM2QyZjQ5ZWU3ODJkNzA5ZDYwMTY5Y2Y2MmVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAxMToyODozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd0
azQ6IHVwZ3JhZGUgNC4xMi4zIC0+IDQuMTIuNAoKLS0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZ3Rr
Ky97Z3RrNF80LjEyLjMuYmIgPT4gZ3RrNF80LjEyLjQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdu
b21lL2d0aysve2d0azRfNC4xMi4zLmJiID0+IGd0azRfNC4xMi40LmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMi4zLmJiIGIvbWV0YS9yZWNp
cGVzLWdub21lL2d0aysvZ3RrNF80LjEyLjQuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjEyLjMuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMi40LmJiCmluZGV4IDAwMWIwNjkzNGUuLjFi
MmI1YzBkYjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMi4z
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMi40LmJiCkBAIC0zNyw3
ICszNyw3IEBAIE1BSl9WRVIgPSAiJHtAb2UudXRpbHMudHJpbV92ZXJzaW9uKCIke1BWfSIsIDIp
fSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImd0ay0oP1A8cHZlcj5cZCtcLihcZCpbMDI0Njhd
KSsoXC5cZCspKylcLnRhci54eiIKIAogU1JDX1VSSSA9ICJodHRwOi8vZnRwLmdub21lLm9yZy9w
dWIvZ25vbWUvc291cmNlcy9ndGsvJHtNQUpfVkVSfS9ndGstJHtQVn0udGFyLnh6IgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjE0OGNlMjYyZjZjODY0ODc0NTVmYjFkOTc5M2MzZjU4YmMzZTFkYTQ3
N2EyOTYxN2ZhZGIwNDIwZjU4NzBhODkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmE2N2M2NDk4
ZTU1OTlmOTI4ZWRhZmI5ZTA4YTMyMGFkZmFhNTBhYjJmMGRhNmZjNmFiMjI1MmZjMmQ1NzUyMCIK
IAogUyA9ICIke1dPUktESVJ9L2d0ay0ke1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============8470752863580428359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 50 skipped, 0 masked, 0 errors.
Removing 120 recipes from the core2-64 sysroot...done.
Removing 124 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-cf28e3a8de162c251f0fc69196069b3d2772d45b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cf28e3a8de162c251f0fc69196069b3d2772d45b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 979 Local 888 Mirrors 0 Missed 91 Current 422 (90% match, 93% complete)
Removing 7 stale sstate objects for arch x86_64...done.
Removing 7 stale sstate objects for arch qemux86_64...done.
Removing 8 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 423 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 435 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 444 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 453 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 461 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 462 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 463 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 464 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 465 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 466 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 468 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 469 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 472 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 479 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_populate_sysroot_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 482 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 485 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 499 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 503 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.70-r0: task do_create_spdx_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 511 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 513 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_packagedata_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 520 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 526 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/gi-docgen/2023.1/temp/log.do_packagedata_setscene.2599820
NOTE: Running setscene task 536 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 537 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 538 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 541 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.70.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 542 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 546 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 549 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 553 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 554 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 555 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 560 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 563 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 564 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 565 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 566 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 572 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 582 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 597 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 598 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 599 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 601 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.118-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 605 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 610 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 611 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 612 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 616 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.118-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 617 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 618 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 620 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_package_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 625 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 628 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 629 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 630 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 631 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 632 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.51.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 633 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 634 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 635 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 636 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 641 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 643 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 645 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 648 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 650 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 651 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 653 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 654 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 656 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.51.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 657 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 658 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_23.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 659 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 661 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_packagedata_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 662 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 663 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 665 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 666 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.118-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 671 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 672 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 673 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.40.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 683 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 685 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.118-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 687 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 688 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 694 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 695 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 696 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 697 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 698 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 702 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 705 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 711 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 714 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 715 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 718 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 720 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 721 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 723 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 726 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 728 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 731 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 733 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 734 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.118-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 735 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 738 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 739 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 742 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 749 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 751 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 754 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 756 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.118-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 757 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 759 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 761 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.118.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 763 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 764 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 765 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.118-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 767 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 769 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 770 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 772 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 774 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 775 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 778 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 779 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.118-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 780 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 784 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 786 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 787 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 788 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 790 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 791 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 792 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 795 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 797 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 802 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 804 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 805 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 807 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 809 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 810 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_create_spdx_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 812 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 814 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 818 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 821 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 822 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 826 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 828 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 832 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 836 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 837 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 839 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 845 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 846 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 848 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 849 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 850 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 852 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 855 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 856 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 860 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 863 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 871 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 872 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 874 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 875 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 876 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 882 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 884 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 886 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 889 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 890 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 892 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 895 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 897 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 901 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 906 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 907 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 909 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 910 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 911 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 913 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 914 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 915 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 919 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 922 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 930 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 932 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 934 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 935 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 938 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 939 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 941 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 943 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 945 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 947 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 948 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 952 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 953 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.13-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 955 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 956 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 961 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 962 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 963 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 964 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 966 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 968 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 971 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 974 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 976 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 977 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vala/0.56.13/temp/log.do_packagedata_setscene.2604944
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 978 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_package_setscene)
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 980 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 982 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_package_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 984 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 986 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 988 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 990 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 992 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 993 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1003 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1004 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1006 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1008 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1009 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1011 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1012 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1013 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1014 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1016 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1018 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1020 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1021 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1022 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1023 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1025 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1034 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1040 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1041 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1043 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1044 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1045 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1048 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1098 of 1401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1173 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1196 of 1401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1198 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1199 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1202 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1203 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1206 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1209 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1210 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1211 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1213 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1216 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1219 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1220 of 1401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/itstool/itstool_2.0.7.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1223 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1224 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1225 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1226 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe itstool-native-2.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe itstool-native-2.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1228 of 1401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1231 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1233 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1235 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1236 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1237 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1238 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1239 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1240 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1241 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1242 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1243 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1244 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1246 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1247 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1248 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1252 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1253 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_package_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1256 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1257 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1259 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1264 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1266 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1271 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1272 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1273 of 1401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_package_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1280 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1283 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1286 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1288 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1290 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1146 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1210 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_fetch)
NOTE: Running task 1212 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: Running task 1215 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_fetch)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1314 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1318 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1319 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: Running task 1372 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-8.3.0-r0: task do_fetch: Started
NOTE: recipe pango-1.51.0-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1398 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: Running task 1401 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_write_config)
NOTE: Running task 1402 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_write_config)
NOTE: recipe harfbuzz-8.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1413 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_fetch)
NOTE: recipe pango-1.51.0-r0: task do_fetch: Succeeded
NOTE: Running task 1421 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_unpack)
NOTE: Running task 1422 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_unpack)
NOTE: Running task 1437 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1438 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1511 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1535 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_write_config)
NOTE: Running task 1541 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_write_config: Started
NOTE: recipe pango-1.51.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe pango-1.51.0-r0: task do_unpack: Started
NOTE: Running task 1599 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: Running task 1617 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_fetch: Succeeded
NOTE: Running task 1629 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_unpack)
NOTE: recipe harfbuzz-8.3.0-r0: task do_write_config: Succeeded
NOTE: Running task 1652 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: recipe pango-1.51.0-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: Running task 1710 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1732 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: Running task 1738 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1747 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1749 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: Running task 1797 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 1799 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1868 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: Running task 1870 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1871 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_fetch: Succeeded
NOTE: Running task 1872 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_unpack)
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_fetch: Started
NOTE: Running task 1876 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_fetch)
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 1877 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_unpack: Succeeded
NOTE: Running task 1878 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_unpack)
NOTE: Running task 1879 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1880 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: Running task 1881 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_unpack: Started
NOTE: Running task 1894 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_fetch: Started
NOTE: Running task 1895 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_unpack: Succeeded
NOTE: Running task 1896 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: Running task 1907 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe pango-1.51.0-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: Running task 1909 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_unpack: Succeeded
NOTE: Running task 1910 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 1917 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 1923 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_patch: Started
NOTE: recipe pango-1.51.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1926 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_write_config)
NOTE: Running task 1927 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1948 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 1951 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_unpack)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_write_config: Started
NOTE: Running task 1952 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_patch: Succeeded
NOTE: Running task 1960 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: Running task 1967 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1970 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_unpack: Succeeded
NOTE: Running task 1974 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_patch)
NOTE: Running task 1988 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_recipe_qa)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_unpack: Started
NOTE: Running task 2056 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2059 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_write_config)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_patch: Succeeded
NOTE: Running task 2060 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_patch: Started
NOTE: recipe gtk4-4.12.4-r0: task do_recipe_qa: Started
NOTE: Running task 2082 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2083 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 2178 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_write_config)
NOTE: recipe gtk+3-3.24.38-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_write_config: Succeeded
NOTE: Running task 2207 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: recipe gtk4-4.12.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 2222 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_fetch)
NOTE: Running task 2256 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_write_config)
NOTE: recipe gtk+3-3.24.38-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 2284 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: Running task 2287 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Started
NOTE: recipe gtk4-4.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 2288 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_unpack)
NOTE: recipe gtk4-4.12.4-r0: task do_write_config: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe gtk4-4.12.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_unpack: Succeeded
NOTE: Running task 2289 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_patch)
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: Running task 2290 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1292 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1293 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1294 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1295 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1296 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1297 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1298 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-8.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2293 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1299 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Succeeded
NOTE: Running task 2296 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1302 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1304 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1305 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1307 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1310 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1312 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1313 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1314 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1315 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1317 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1318 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1319 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1320 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1321 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1322 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1323 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1328 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1330 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1332 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1335 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1336 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1337 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2338 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1340 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.12.4-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.12.4-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2344 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2345 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_populate_lic)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1342 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1343 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1345 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.12.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.12.4-r0: task do_populate_lic: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_populate_lic unihash changed to 47c1b6cbb0faa89f3194b0fb0af8f69896f635f0e32e5c8beabdf804e82c3b3d
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1347 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1348 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1349 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1351 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1353 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1355 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1356 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1358 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1360 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1362 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1363 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1365 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1367 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1368 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1369 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1370 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1372 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1376 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1377 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1379 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1384 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1386 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1387 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1390 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1392 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1393 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1395 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 2419 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1399 of 1401 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1400 of 1401 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 2426 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2930 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2959 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2963 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2982 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3016 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3122 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-8.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3257 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 3267 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3280 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3289 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata)
NOTE: Running task 3307 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 3374 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3434 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3452 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.13-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3453 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: Running task 3462 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3469 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: Running task 3470 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe harfbuzz-8.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5009bfdce64be5968dd9927eeb08146bbc59582b45f2dbfd597d0d6515f565bd
NOTE: recipe vala-0.56.13-r0: task do_packagedata: Succeeded
NOTE: Running task 3485 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3534 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3535 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_configure)
NOTE: recipe harfbuzz-8.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3536 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3537 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: Running task 3548 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3550 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3581 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3591 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_configure: Started
NOTE: Running task 3592 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe harfbuzz-8.3.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3593 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3594 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3595 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3597 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3602 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3623 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3624 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3625 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 8c1d93fdb5af83f39af3309ea452d4bfd3f2ae8db73ec50e40e7a59442e25f13 to hashserv.yocto.io:8686 ({'taskhash': 'a396ad91ecfaf9a7f7aea91933611c2cb973b93013d8dc01cbffc979cd8eb5d5', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '8c1d93fdb5af83f39af3309ea452d4bfd3f2ae8db73ec50e40e7a59442e25f13'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed a396ad91ecfaf9a7f7aea91933611c2cb973b93013d8dc01cbffc979cd8eb5d5 -> 8c1d93fdb5af83f39af3309ea452d4bfd3f2ae8db73ec50e40e7a59442e25f13 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3635 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3638 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: Running task 3639 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: Running task 3640 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Succeeded
NOTE: Running task 3641 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 3642 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Succeeded
NOTE: Running task 3643 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_install)
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3644 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Succeeded
NOTE: Running task 3645 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_package)
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_configure: Succeeded
NOTE: Running task 3646 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_compile)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_configure: Succeeded
NOTE: Running task 3647 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_compile)
NOTE: recipe harfbuzz-8.3.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 3648 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 3649 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_configure: Succeeded
NOTE: Running task 3650 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_configure_ptest_base)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_configure_ptest_base: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3651 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata)
NOTE: Running task 3652 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 3653 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 3654 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata unihash changed to f0df344957f0fa2326d4cb54db699515a4ad1b318d51fd16566c48b20982af99
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 3655 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 3656 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: Running task 3657 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 3658 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: Running task 3659 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3660 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 3661 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3662 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 9f5bd3906a2584b36e2196b9de23cc54e8939a6b90d89e52d14a0eae9d959565
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3663 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: Running task 3664 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: Running task 3665 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: Running task 3666 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3667 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_compile: Succeeded
NOTE: Running task 3668 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_install)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3669 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3670 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 3671 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 3672 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 3673 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_install: Succeeded
NOTE: Running task 3674 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_populate_sysroot)
NOTE: Running task 3675 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata unihash changed to 8aa0a2b588454386f94252519c9c38234cca704d49a6b6f121434742c4f1f525
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3676 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: Running task 3677 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot)
NOTE: Running task 3678 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3679 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.50.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 3680 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3681 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3682 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 3683 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to fd706b8619f404afb34db3a84172e2e09644a0fb418bcc12e43d7c7a9088909b
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3684 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: Running task 3685 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3686 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Succeeded
NOTE: Running task 3687 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Started
NOTE: Running task 3688 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata unihash changed to 086866da6f76a51a2961c2e4f6b900b27c4df15064c977c8818a3cf215cb3e64
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx as unihash 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 to hashserv.yocto.io:8686 ({'taskhash': 'ef12d3fc4bf9bad645e1dca675b0f07bb6898ada2dec937ef11c224c3c7a6064', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx unihash changed ef12d3fc4bf9bad645e1dca675b0f07bb6898ada2dec937ef11c224c3c7a6064 -> 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 3689 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: Running task 3690 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to 7dda99c4504d77ccb69100fb5909f925d70776393b0d0c9cf47ce374f033667f
NOTE: Running task 3691 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata unihash changed to 403488e0e39cfc03de70d8c81ea520af996666d11e0da7047adf06fd82fc1a62
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3692 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: Running task 3693 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk)
NOTE: Running task 3694 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb)
NOTE: Running task 3695 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm)
NOTE: Running task 3696 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_package_write_ipk)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: Running task 3697 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_package_write_deb)
NOTE: Running task 3698 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_package_write_rpm)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 3699 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_package_write_deb: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3700 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 3701 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 3702 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_package: Succeeded
NOTE: Running task 3703 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_packagedata unihash changed to bada25f06d0b699871dde8d2690b35846039f7c2a01b2638c5ee43082dc7dc9e
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx as unihash 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 to hashserv.yocto.io:8686 ({'taskhash': '30b6f41bcfd03beef5e1a6c5d65c3415534a7018242a8e8737687ecb3870c4ed', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx unihash changed 30b6f41bcfd03beef5e1a6c5d65c3415534a7018242a8e8737687ecb3870c4ed -> 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk unihash changed to d9966b707368119d296fc41d310a5b0a238294ab4eb1d1f64a89ab591a86ed31
NOTE: Setscene tasks completed
NOTE: Running task 3704 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.0.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx: Started
NOTE: Running task 3705 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to 55af2504360e414f25b6aa9c32663ce5f53165bee0becf7d88545412db71d0d5
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx as unihash 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 to hashserv.yocto.io:8686 ({'taskhash': '25bb3da352f055d1438642c339b817da7fcb8932ccb02bb38dae1a90a358192c', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx unihash changed 25bb3da352f055d1438642c339b817da7fcb8932ccb02bb38dae1a90a358192c -> 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3706 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb unihash changed to 3248f18abd3353d2c81fdb08a67558bbaefe61ecb540242aed2c8daf22dcb26b
NOTE: Setscene tasks completed
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.50.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: Running task 3707 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3708 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_compile: Succeeded
NOTE: Running task 3709 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3710 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 3711 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_install: Succeeded
NOTE: Running task 3712 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3713 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 3714 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_install_ptest_base: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm unihash changed to 31213a3329527cabf0c51cc387aed344f7379f335f6face26d070b93e617e6a4
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3715 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_populate_sysroot)
NOTE: Running task 3716 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_package_write_deb unihash changed to 0214d0a227297700de297bff70de75144dea06a4fb6b9dd71cf4eb94d73b0362
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: Running task 3717 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_package: Succeeded
NOTE: Running task 3718 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata unihash changed to 6a37dc01a45fa41763ee6b0c677c21f34ed5bb8777c57c41596716688d2e3016
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx as unihash 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 to hashserv.yocto.io:8686 ({'taskhash': '4953d9b6a4f244e90cb1c3c1ca37e570d1f28243a6f330435c43012b965fa1be', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx unihash changed 4953d9b6a4f244e90cb1c3c1ca37e570d1f28243a6f330435c43012b965fa1be -> 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_packagedata unihash changed to 03fe3b1895254cc6d89926fe4c23dab35af551acf7a2663f5f324543980f9a97
NOTE: Setscene tasks completed
NOTE: Running task 3719 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: Running task 3720 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.7.bb:do_create_spdx)
NOTE: Running task 3721 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_ipk)
NOTE: Running task 3722 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_deb)
NOTE: Running task 3723 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_ipk: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_deb: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_package_write_rpm unihash changed to d823663bf6206c249c78747f371b03814c5fa60e14ecaa92be4194ec18224add
NOTE: recipe gstreamer1.0-1.22.7-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_ipk unihash changed to c6d2fdc27d98ab64f8d13cfc50502ed75cc8998d8ea93edc6efe74bed6600b3a
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm unihash changed to b42ec310a9e10254efd4edaffbfeee4c262b9102a5c2f8047790f799c8cad06c
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_package_write_ipk unihash changed to 59c1ee6b6a3ffaa4c28f5035e25fdb6aacbec4187c50979448a489877eb4d277
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_deb unihash changed to 9119c2c560ba00bf29b423440d6c30c262031a4ef6ecfccf5d029cb7f2b574f5
NOTE: recipe harfbuzz-8.3.0-r0: task do_compile: Succeeded
NOTE: Running task 3724 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_install)
NOTE: recipe harfbuzz-8.3.0-r0: task do_install: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_install: Succeeded
NOTE: Running task 3725 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_populate_sysroot)
NOTE: Running task 3726 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_package)
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_package: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3727 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3728 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_configure)
NOTE: recipe pango-1.51.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_package: Succeeded
NOTE: Running task 3729 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_packagedata)
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_packagedata unihash changed to e648b6e4447fcadc7f2647f7f4c4215051e927f4b6e64b5a3c6aeeadc86570b5
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx as unihash 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 to hashserv.yocto.io:8686 ({'taskhash': '99c1faa20f0e10f0d03097d8351510fc8b1f90a1c3f57c88fb474a7d8de60f05', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx unihash changed 99c1faa20f0e10f0d03097d8351510fc8b1f90a1c3f57c88fb474a7d8de60f05 -> 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3730 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.3.0-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3731 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.51.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pango-1.51.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3732 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_configure_ptest_base)
NOTE: recipe pango-1.51.0-r0: task do_configure_ptest_base: Started
NOTE: recipe pango-1.51.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3733 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_compile)
NOTE: recipe pango-1.51.0-r0: task do_compile: Started
NOTE: recipe pango-1.51.0-r0: task do_compile: Succeeded
NOTE: Running task 3734 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_compile_ptest_base)
NOTE: recipe pango-1.51.0-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.51.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3735 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_install)
NOTE: recipe pango-1.51.0-r0: task do_install: Started
NOTE: recipe pango-1.51.0-r0: task do_install: Succeeded
NOTE: Running task 3736 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_install_ptest_base)
NOTE: recipe pango-1.51.0-r0: task do_install_ptest_base: Started
NOTE: recipe pango-1.51.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3737 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_populate_sysroot)
NOTE: Running task 3738 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_package)
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.51.0-r0: task do_package: Started
NOTE: recipe pango-1.51.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3739 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3740 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3741 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3742 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3743 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3744 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe gtk+3-3.24.38-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3745 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe pango-1.51.0-r0: task do_package: Succeeded
NOTE: Running task 3746 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata)
NOTE: recipe pango-1.51.0-r0: task do_packagedata: Started
NOTE: recipe pango-1.51.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_packagedata unihash changed to 1f8cdbf954d4dabcb7e81ea57b33daa6bcb815290c8512287cdcf0d82eb2ea33
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx as unihash 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 to hashserv.yocto.io:8686 ({'taskhash': '713174034defdf2fdeeece825061b428aab06683abb814f024745d02941dbc21', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx unihash changed 713174034defdf2fdeeece825061b428aab06683abb814f024745d02941dbc21 -> 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 3747 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.51.0.bb:do_create_spdx)
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Started
NOTE: recipe pango-1.51.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3748 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: Running task 3749 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3751 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_compile)
NOTE: recipe gtk+3-3.24.38-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3752 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3753 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_compile: Succeeded
NOTE: Running task 3754 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_install: Succeeded
NOTE: Running task 3755 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_populate_sysroot)
NOTE: Running task 3756 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_package: Succeeded
NOTE: Running task 3757 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_packagedata unihash changed to d1d1e78024bc46e8aabb365659142f076744f1182f94d830b78718e5b93c57f0
NOTE: Setscene tasks completed
NOTE: Running task 3758 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.7.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.7-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_compile: Succeeded
NOTE: Running task 3759 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_install)
NOTE: recipe gtk+3-3.24.38-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_install: Succeeded
NOTE: Running task 3760 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_package)
NOTE: recipe gtk+3-3.24.38-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_package: Succeeded
NOTE: Running task 3766 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata unihash changed to 5ea2c5be5a3f9381ec1bff76a2da62417a5d99e6230a4c23bd14931dded0addb
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx as unihash 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 to hashserv.yocto.io:8686 ({'taskhash': '65c3e2c2e6846623181193e4a90c5ba6492b391aef611ad99e7fb3754c11cc9a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx unihash changed 65c3e2c2e6846623181193e4a90c5ba6492b391aef611ad99e7fb3754c11cc9a -> 5ef16d604884d8f7e5fa4c348ce08e949e75ddb5431b72f9172f2beed1d13c05 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3775 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3776 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3777 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3778 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3779 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3780 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata unihash changed to b14c1eb792a89aead9e72299d9787be7a28f154822ffca3fa6e9ac4cf2c7261a
NOTE: Setscene tasks completed
NOTE: Running task 3781 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3782 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3783 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_compile: Succeeded
NOTE: Running task 3784 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_install: Succeeded
NOTE: Running task 3785 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_package)
NOTE: Running task 3786 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3787 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3788 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_configure)
NOTE: recipe gtk4-4.12.4-r0: task do_configure: Started
NOTE: recipe gtk4-4.12.4-r0: task do_configure: Succeeded
NOTE: Running task 3789 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_compile)
NOTE: recipe gtk4-4.12.4-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_package: Succeeded
NOTE: Running task 3790 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_packagedata unihash changed to 2d58b4cab4979464cb321ebb3ca7b2d533954fecb04ea242b246f098f179cbdb
NOTE: Setscene tasks completed
NOTE: Running task 3791 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.7.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3792 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3793 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_install)
NOTE: recipe gtk4-4.12.4-r0: task do_install: Started
NOTE: recipe gtk4-4.12.4-r0: task do_install: Succeeded
NOTE: Running task 3794 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_package)
NOTE: Running task 3795 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.12.4-r0: task do_package: Started
NOTE: recipe gtk4-4.12.4-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.12.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_package: Succeeded
NOTE: Running task 3796 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_packagedata)
NOTE: recipe gtk4-4.12.4-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.12.4-r0: task do_packagedata: Succeeded
NOTE: Running task 3797 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_create_spdx)
NOTE: Running task 3798 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_package_write_ipk)
NOTE: Running task 3799 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_package_write_deb)
NOTE: Running task 3800 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_package_write_rpm)
NOTE: recipe gtk4-4.12.4-r0: task do_create_spdx: Started
NOTE: Running task 3801 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_package_qa)
NOTE: recipe gtk4-4.12.4-r0: task do_package_write_ipk: Started
NOTE: recipe gtk4-4.12.4-r0: task do_package_write_deb: Started
NOTE: recipe gtk4-4.12.4-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.12.4-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.12.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3802 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_create_runtime_spdx)
NOTE: recipe gtk4-4.12.4-r0: task do_create_runtime_spdx: Started
NOTE: recipe gtk4-4.12.4-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gtk4-4.12.4-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 3803 of 3803 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.4.bb:do_build)
NOTE: Tasks Summary: Attempted 3803 tasks of which 3534 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: gi-docgen-2023.1-r0 do_packagedata_setscene: QA Issue: Package version for package gi-docgen-src went backwards which would break package feeds (from 0:2023.3-r0 to 0:2023.1-r0) [version-going-backwards]
ERROR: gi-docgen-2023.1-r0 do_packagedata_setscene: QA Issue: Package version for package gi-docgen-dbg went backwards which would break package feeds (from 0:2023.3-r0 to 0:2023.1-r0) [version-going-backwards]
ERROR: gi-docgen-2023.1-r0 do_packagedata_setscene: QA Issue: Package version for package gi-docgen-staticdev went backwards which would break package feeds (from 0:2023.3-r0 to 0:2023.1-r0) [version-going-backwards]
ERROR: gi-docgen-2023.1-r0 do_packagedata_setscene: QA Issue: Package version for package gi-docgen-dev went backwards which would break package feeds (from 0:2023.3-r0 to 0:2023.1-r0) [version-going-backwards]
ERROR: gi-docgen-2023.1-r0 do_packagedata_setscene: QA Issue: Package version for package gi-docgen-doc went backwards which would break package feeds (from 0:2023.3-r0 to 0:2023.1-r0) [version-going-backwards]
ERROR: gi-docgen-2023.1-r0 do_packagedata_setscene: QA Issue: Package version for package gi-docgen-locale went backwards which would break package feeds (from 0:2023.3-r0 to 0:2023.1-r0) [version-going-backwards]
ERROR: gi-docgen-2023.1-r0 do_packagedata_setscene: QA Issue: Package version for package gi-docgen went backwards which would break package feeds (from 0:2023.3-r0 to 0:2023.1-r0) [version-going-backwards]
ERROR: gi-docgen-2023.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8470752863580428359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 38187056 to 38190168 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.1200.3", added "/usr/lib/.debug/libgtk-4.so.1.1200.4"
packages/core2-64-poky-linux/gtk4/gtk4-dbg: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 14336386 to 14340480 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-dev: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-doc: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn: PKGSIZE changed from 82289 to 81065 (-1%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PKGSIZE changed from 106709 to 106795 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-es: PKGSIZE changed from 106102 to 106188 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fr: PKGSIZE changed from 104101 to 108715 (+4%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hi: PKGSIZE changed from 98178 to 72322 (-26%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kg: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kg: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ro: PKGSIZE changed from 106133 to 105909 (-0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ru: PKGSIZE changed from 127922 to 128027 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tk: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tk: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PKGSIZE changed from 103615 to 103608 (-0%)
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-printbackend-file: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-printbackend-file: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 40298054 to 40306836 (+0%)
packages/core2-64-poky-linux/gtk4/gtk4-src: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-src: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1200.3", added "/usr/lib/libgtk-4.so.1.1200.4"
packages/core2-64-poky-linux/gtk4/gtk4: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4/gtk4: PV changed from "4.12.3" to "4.12.4"
packages/core2-64-poky-linux/gtk4: SRC_URI changed from "http://ftp.gnome.org/pub/gnome/sources/gtk/4.12/gtk-4.12.3.tar.xz" to "http://ftp.gnome.org/pub/gnome/sources/gtk/4.12/gtk-4.12.4.tar.xz"
packages/core2-64-poky-linux/gtk4: PKGV changed from 4.12.3 [default] to 4.12.4 [default]
packages/core2-64-poky-linux/gtk4: PV changed from "4.12.3" to "4.12.4"
Changes to packages/core2-64-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1200.3 to libgtk-4.so.1.1200.4
  /usr/lib/libgtk-4.so.1.1200.3 moved to /usr/lib/libgtk-4.so.1.1200.4

--===============8470752863580428359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gtk4/gtk4-locale-hi: PKGSIZE changed from 98178 to 72322 (-26%)
packages/core2-64-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1200.3", added "/usr/lib/libgtk-4.so.1.1200.4"
Changes to packages/core2-64-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1200.3 to libgtk-4.so.1.1200.4
  /usr/lib/libgtk-4.so.1.1200.3 moved to /usr/lib/libgtk-4.so.1.1200.4

--===============8470752863580428359==--

