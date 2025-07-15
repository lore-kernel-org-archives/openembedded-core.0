Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3274BC83F37
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:50 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.12493.1752594941733324220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=watDnTe1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=g7qTf3oy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101980ecca17c-cfe42a1b-29b1-4859-b3f6-c171be688da6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594948;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PXVStmU/iCHoWHy4sEAEH9JVVoY76cr69lRplKvZUeg=;
	b=watDnTe1AD9J2hP6PbFVzVgxA2NCZTrbdNNXi4lYvWUmREeIG+kl9A0VjqCYH3a+
	qVxZH4ROmfNfcStRJr2RH0ZTJ/cbxlWUqx696wTSUZTQtSaUcXFmZPXFa+nek/v/+qO
	PLzwFF7vs4Oz/kFjTSYqqJpOw3YkLqk4dJDNL0Jk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594948;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PXVStmU/iCHoWHy4sEAEH9JVVoY76cr69lRplKvZUeg=;
	b=g7qTf3oy9E35h9IXBwVJrZBvfs4PQ5LWW5Uvd5x4KrSfaFE6Lhr+MciFEQgGMGcX
	MPxgM4AKJSvMZN/Ir28w6SZnHW4gTzuNBVtZg1WrQxmFJg7gCs0BjIo92GYgNTu5wFY
	boaQr9Jryk8qiTLqgzX45iKo2jI8el6kWQECmM/o=
Content-Type: multipart/mixed; boundary="===============6717588779745222814=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] epiphany: upgrading to 48.5 SUCCEEDED
Message-ID: <010101980ecca17c-cfe42a1b-29b1-4859-b3f6-c171be688da6-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220370

--===============6717588779745222814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *48.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-48.3-48.5.patch
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
From 205f002d05b1ff6c6e7f67757f701f533adcf1a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 13:11:08 +0000
Subject: [PATCH] epiphany: upgrade 48.3 -> 48.5

---
 .../epiphany/{epiphany_48.3.bb => epiphany_48.5.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.3.bb => epiphany_48.5.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.3.bb b/meta/recipes-gnome/epiphany/epiphany_48.5.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_48.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_48.5.bb
index 74a17be5a5..8129cd79f8 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_48.5.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "da2953e7e2b73bf7473c0a33979104d79362795295eaa0a2a38ea188537daf13"
+SRC_URI[archive.sha256sum] = "0f66552ad6593c7952a3ddee5bf515656c8c434871076d9f1a91a7af9346b1b4"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 929e33b015..6c00ab9b40 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 165ef2bf636c170d81576f7d3e6348fc3d781821 Mon Sep 17 00:00:00 2001
+From 91045ece41faefbeac14b60d7b19b0c652e586fb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index dac4855750..54a3305aaf 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From c43bbbb4154bb9686756297a7e2eecaa72bb1e9f Mon Sep 17 00:00:00 2001
+From 46084da03b5f20423a2946d988c68e9ea9339c9c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index 96554b7..f5c9727 100644
+index df0340c..8ec6c79 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 5407d893d6..8ebcdc9991 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From 4c5f6b0b44b959f0156cb74f76b2db46a0042c4a Mon Sep 17 00:00:00 2001
+From ca504370b9aa893ceac21141d8f24e28a474b674 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.47.1


--===============6717588779745222814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 941 .bb files complete (0 cached, 941 parsed). 1929 targets, 50 skipped, 0 masked, 0 errors.
Removing 160 recipes from the core2-64 sysroot...done.
Removing 164 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-2bdc5c38d2c416edd368ccd9a296cc3d646e4bc9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2bdc5c38d2c416edd368ccd9a296cc3d646e4bc9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1282 Local 1091 Mirrors 0 Missed 191 Current 551 (85% match, 89% complete)
Removing 6 stale sstate objects for arch allarch...done.
Removing 16 stale sstate objects for arch x86_64...done.
Removing 6 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 579 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_48.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 591 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_populate_lic_setscene)
NOTE: Running setscene task 661 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_48.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 676 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.33.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 703 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 707 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 709 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 713 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 724 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb:do_create_spdx_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-48.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-dbusmock-0.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe epiphany-48.5-r0: task do_populate_lic_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.66.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-48.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe epiphany-48.5-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libxslt-1.1.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 728 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.66.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe p11-kit-0.25.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 731 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dbusmock-0.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 741 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 743 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 755 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 756 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 763 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx_setscene)
NOTE: Running setscene task 765 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 767 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 769 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe epiphany-48.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.43-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libportal-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 775 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 777 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe epiphany-48.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libportal-0.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 782 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tiff-4.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 786 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-native-3.24.43-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 790 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 791 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 792 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 793 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 795 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe adwaita-icon-theme-48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-1.1.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-native-3.24.43-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcr-4.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 806 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 809 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-glib-1.10.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 811 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 812 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 813 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: recipe p11-kit-0.25.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 818 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 820 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe webkitgtk-2.48.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcr-4.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 821 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 824 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 825 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb:do_packagedata_setscene)
NOTE: recipe enchant2-2.8.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsoup-3.6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 828 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: recipe webkitgtk-2.48.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 831 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 835 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libadwaita-1.7.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 840 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_create_spdx_setscene)
NOTE: recipe enchant2-2.8.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 842 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo-c_0.10.13+cargo-0.88.0.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 843 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_packagedata_setscene)
NOTE: recipe libnotify-0.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 844 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.66.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libadwaita-1.7.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 845 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe p11-kit-0.25.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 848 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 849 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libnotify-0.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 850 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-native-3.24.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 852 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe nghttp2-1.66.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-glib-1.10.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 854 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libportal-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p11-kit-0.25.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe p11-kit-0.25.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 855 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_recipe_qa_setscene)
NOTE: recipe json-glib-1.10.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 857 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libportal-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nghttp2-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-native-3.24.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cargo-c-native-0.10.13+cargo-0.88.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 863 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 864 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 865 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 868 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 869 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 870 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 871 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 874 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 877 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 884 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 885 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 886 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 889 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe nghttp2-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cargo-c-native-0.10.13+cargo-0.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 891 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gcr-4.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 894 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 901 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: recipe enchant2-2.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 902 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk-2.48.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcr-4.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libadwaita-1.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 903 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.87.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 908 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe webkitgtk-2.48.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 910 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 911 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.18.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 914 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 915 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 916 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 920 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 921 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 923 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 928 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 930 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk4-4.18.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 933 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.43.bb:do_recipe_qa_setscene)
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwpe-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnotify-0.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-native-2.59.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 937 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwpe-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe iso-codes-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 940 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.87.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 942 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 943 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 944 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libnotify-0.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 946 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 947 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxslt-1.1.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 957 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 958 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 960 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 962 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 965 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 966 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 967 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 969 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwpe-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe appstream-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cargo-native-1.87.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 970 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwpe-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 971 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.43-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 972 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 973 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_recipe_qa_setscene)
NOTE: recipe appstream-1.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 974 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-native-2.59.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 976 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe cargo-native-1.87.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 977 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: recipe p11-kit-0.25.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 978 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 983 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: Running setscene task 984 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx_setscene)
NOTE: Running setscene task 985 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 989 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 990 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 993 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 994 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_create_spdx_setscene)
NOTE: recipe libsecret-0.21.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-native-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsecret-0.21.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 995 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-native-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1005 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1007 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1010 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1011 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-native-2.4.125-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1012 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-native-0.193-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-native-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1013 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1014 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1015 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: recipe appstream-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1016 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-native-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-native-2.4.125-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-native-0.193-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-native-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1019 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1021 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1022 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1024 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1025 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1026 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-native-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-native-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1028 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1029 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1031 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-native-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.66.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.18.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1032 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1033 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1034 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.87.0.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1035 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1036 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1039 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 1040 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.66.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.18.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-native-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1042 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1043 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1046 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-native-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1051 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1053 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1055 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1057 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1060 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1062 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_create_spdx_setscene)
NOTE: recipe rust-native-1.87.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-native-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1063 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1064 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1066 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1067 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe rust-native-1.87.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1069 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1072 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1074 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe tiff-4.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1077 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1078 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang-cross_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1079 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 1080 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1081 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_recipe_qa_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1083 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1085 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1087 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1089 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe clang-cross-x86_64-20.1.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1090 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1093 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1096 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1097 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1101 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-cross-x86_64-20.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1102 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.87.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1104 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_create_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1106 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.59.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.87.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1107 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1108 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo-c_0.10.13+cargo-0.88.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-native-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1109 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1111 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1115 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1117 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_create_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1120 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1122 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe librsvg-2.59.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1124 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1125 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1128 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1130 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1131 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1137 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1138 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1139 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1144 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 1145 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1146 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1147 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1149 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1152 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1154 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1155 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cargo-c-native-0.10.13+cargo-0.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1157 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1158 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1159 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-native-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1160 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1166 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1168 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1169 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1170 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1171 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1172 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-native-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1173 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1174 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1175 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1181 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1182 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.87.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1184 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1185 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1191 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunwind-1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1194 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1195 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1196 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1197 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1202 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1203 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 1205 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1207 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1208 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1209 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1212 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.59.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1214 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1217 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.59.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1218 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1221 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1223 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe curl-8.14.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1225 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1226 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1228 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1231 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1232 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1234 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 1235 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1237 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-c-native-0.10.13+cargo-0.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1238 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1240 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1241 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_create_spdx_setscene)
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1242 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1244 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1245 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1247 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1248 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1249 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-11.2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1250 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-native-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1254 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_create_spdx_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1257 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-11.2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1259 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1260 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1261 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1263 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1266 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-native-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1273 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1277 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1279 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1284 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1287 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1288 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1290 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_create_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1291 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1292 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-11.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1293 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1295 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1296 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.87.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1297 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.41.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-11.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1301 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1302 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.87.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1305 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1306 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1307 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1308 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1311 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1313 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1314 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1315 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe cargo-native-1.87.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1317 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.87.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.56.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1322 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1324 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1327 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1328 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1330 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.87.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1333 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1334 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1335 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1336 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1341 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1342 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1343 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cargo-native-1.87.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1345 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1346 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1348 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1349 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1350 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1351 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1352 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1357 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1358 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1360 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1361 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1363 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1364 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1370 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1371 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1372 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1373 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1374 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1375 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1376 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1377 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1379 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1380 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1383 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1389 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1390 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1391 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1396 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1397 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1399 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1400 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1401 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1403 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1406 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1407 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1408 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1410 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1412 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.87.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1413 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1418 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1426 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1428 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1431 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1432 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1434 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang-cross_git.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1437 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1438 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1440 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1441 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe clang-20.1.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rust-native-1.87.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-cross-x86_64-20.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1442 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1443 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1444 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1445 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe clang-20.1.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1448 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1450 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1451 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1452 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1453 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1454 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_packagedata_setscene)
NOTE: recipe clang-cross-x86_64-20.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1455 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1456 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1457 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1459 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1462 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1464 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1465 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1467 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1468 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1469 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1470 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe clang-20.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1471 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1472 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1473 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1474 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1475 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-20.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1476 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1477 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxml2/2.14.3/temp/log.do_packagedata_setscene.2000040
NOTE: Running setscene task 1478 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1482 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1483 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_package_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe rust-native-1.87.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1485 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package_setscene)
NOTE: Running setscene task 1486 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1489 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: Running setscene task 1492 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1494 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1495 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_package_setscene)
NOTE: Running setscene task 1496 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1497 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1499 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1500 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1501 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1502 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1503 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1506 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1507 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1509 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1511 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1512 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1513 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 1514 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1515 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 1516 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1517 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 1518 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1519 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_package_setscene: Started
NOTE: Running setscene task 1520 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package_setscene: Started
NOTE: Running setscene task 1521 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1522 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1525 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1526 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1528 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1529 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1530 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1532 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1534 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1536 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 1540 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1541 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1542 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1546 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1547 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1549 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1552 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 1553 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 1554 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1556 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1558 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1559 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1561 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1564 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_package_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1565 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1566 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1568 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1570 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1572 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1573 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1574 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1575 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1579 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1580 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1581 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1583 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1585 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1586 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1587 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1588 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1589 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1591 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1592 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1593 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1594 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1598 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1599 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1600 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1601 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1602 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1603 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1605 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1606 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1607 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1610 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1611 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1612 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1613 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1617 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1619 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1626 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1629 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1630 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1635 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1636 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1638 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1639 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1640 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 1641 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1643 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1644 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1646 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1649 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1650 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1655 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1657 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1658 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1659 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1661 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1662 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1663 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1664 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1667 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1668 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1669 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1670 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1672 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1674 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.48.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1677 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1680 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1683 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1685 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1282 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1353 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1373 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Started
NOTE: Running task 1435 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1440 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_fetch)
NOTE: Running task 1458 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_fetch: Succeeded
NOTE: Running task 1515 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1577 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_unpack)
NOTE: Running task 1583 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running task 1587 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1606 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: Running task 1623 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Succeeded
NOTE: Running task 1642 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_fetch: Started
NOTE: Running task 1680 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_fetch)
NOTE: Running task 1682 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_fetch: Started
NOTE: Running task 1755 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1686 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1687 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1688 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1689 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1690 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 1691 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_packagedata_setscene)
NOTE: Running task 1781 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_unpack: Succeeded
NOTE: Running task 1787 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1801 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Started
NOTE: Running task 1851 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 1853 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Started
NOTE: Running task 1854 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_write_config)
NOTE: Running setscene task 1692 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1695 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.14.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1696 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1698 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1701 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: Running setscene task 1704 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_25.1.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1876 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_write_config: Succeeded
NOTE: Running task 1881 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_patch: Succeeded
NOTE: Running noexec task 1885 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_fetch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1888 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_generate_toolchain_file)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1894 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_unpack: Started
NOTE: recipe libxml2-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1706 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_packagedata_setscene)
NOTE: recipe clang-20.1.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpcre2-10.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: Running setscene task 1708 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.45.bb:do_recipe_qa_setscene)
NOTE: recipe clang-20.1.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1709 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1711 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1990 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: Running task 1992 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_fetch)
NOTE: Running task 1996 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: Running task 2002 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_fetch)
NOTE: Running task 2003 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_write_config)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2006 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_patch)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 2012 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_patch)
NOTE: Running task 2014 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: recipe harfbuzz-11.2.1-r0: task do_fetch: Started
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_25.1.4-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Started
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_patch: Started
NOTE: Running task 2026 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_patch)
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Succeeded
NOTE: Running task 2037 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: Running task 2039 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_patch: Started
NOTE: Running task 2044 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_fetch)
NOTE: recipe util-linux-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1713 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1714 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1715 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1717 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1718 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1719 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: Running setscene task 1720 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.56.4-r0: task do_fetch: Started
NOTE: recipe bluez5-5.83-r0: task do_fetch: Started
NOTE: recipe pango-1.56.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1722 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1723 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1724 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 1725 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1726 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1727 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1728 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 1729 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1730 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1731 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1732 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1733 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 1734 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1735 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1737 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1739 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1740 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1741 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1743 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1744 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1754 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1755 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1757 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1758 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1761 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1762 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1766 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1767 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1769 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1773 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1774 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1775 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1777 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1780 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1781 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1784 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1786 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1788 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1789 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1790 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2121 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: Running task 2122 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2129 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2148 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_write_config)
NOTE: Running setscene task 1792 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: Running task 2149 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: Running setscene task 1795 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1796 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: Running setscene task 1797 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-11.2.1-r0: task do_unpack: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: Running task 2164 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_generate_toolchain_file)
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_write_config: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2182 of 4999 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: Running task 2186 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_unpack)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2193 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_write_config: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_generate_toolchain_file: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Succeeded
NOTE: Running task 2229 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_patch)
NOTE: recipe pango-1.56.4-r0: task do_unpack: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2236 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_write_config)
NOTE: recipe bluez5-5.83-r0: task do_unpack: Started
NOTE: Running task 2241 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_fetch)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1799 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-native-2_25.1.4-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-native-2_25.1.4-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Started
NOTE: Running task 2261 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: Running task 2267 of 4999 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe harfbuzz-11.2.1-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.56.4-r0: task do_unpack: Succeeded
NOTE: Running task 2272 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_patch)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.1.4-r0: task do_write_config: Started
NOTE: Running task 2274 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: Running setscene task 1800 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1801 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running task 2275 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_write_config)
NOTE: recipe librsvg-2.59.2-r0: task do_fetch: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1804 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.1.4-r0: task do_write_config: Succeeded
NOTE: Running task 2277 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_patch)
NOTE: recipe mesa-native-2_25.1.4-r0: task do_compile: Started
NOTE: recipe pango-1.56.4-r0: task do_patch: Started
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe pango-1.56.4-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.56.4-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe pango-1.56.4-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_patch: Started
NOTE: Running task 2302 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_unpack)
NOTE: Running task 2309 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 2314 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_fetch)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1806 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1807 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1809 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1810 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1811 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_fetch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.83-r0: task do_patch: Succeeded
NOTE: Running task 2352 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_unpack: Started
NOTE: Running task 2359 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2380 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: Running task 2384 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1815 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: Running setscene task 1816 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_fetch: Started
NOTE: Running setscene task 1821 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-11.2.1-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_unpack: Started
NOTE: Running task 2388 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_patch)
NOTE: Running task 2394 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_fetch)
NOTE: Running task 2406 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2410 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe mesa-2_25.1.4-r0: task do_unpack: Succeeded
NOTE: Running task 2429 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1823 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-11.2.1-r0: task do_patch: Started
NOTE: Running setscene task 1824 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1826 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2436 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 2442 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_patch)
NOTE: Running task 2443 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2450 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_fetch)
NOTE: Running task 2451 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe harfbuzz-11.2.1-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_25.1.4-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.56.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: Running task 2482 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_fetch: Started
NOTE: Running task 2487 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_fetch: Succeeded
NOTE: recipe at-spi2-core-2.56.2-r0: task do_patch: Succeeded
NOTE: Running task 2491 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_fetch)
NOTE: Running task 2499 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 2502 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_write_config)
NOTE: Running task 2504 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_fetch)
NOTE: Running task 2506 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2512 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_25.1.4-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_fetch: Succeeded
NOTE: Running task 2531 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe json-glib-1.10.6-r0: task do_fetch: Started
NOTE: recipe json-glib-1.10.6-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.56.2-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 2538 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_patch)
NOTE: Running task 2539 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 2551 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_fetch)
NOTE: recipe librsvg-2.59.2-r0: task do_write_config: Started
NOTE: Running task 2554 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 2555 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe mesa-2_25.1.4-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2557 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 2558 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_write_config)
NOTE: recipe libxmlb-0.3.22-r0: task do_unpack: Succeeded
NOTE: Running task 2564 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_patch)
NOTE: recipe librsvg-2.59.2-r0: task do_write_config: Succeeded
NOTE: Running task 2568 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_patch: Started
NOTE: Running task 2577 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_fetch)
NOTE: recipe gtk4-4.18.6-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe gtk4-4.18.6-r0: task do_fetch: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_write_config: Started
NOTE: Running task 2602 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_unpack)
NOTE: recipe libxmlb-0.3.22-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 2608 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_write_config)
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.16.2-r0: task do_fetch: Started
NOTE: recipe libwpe-1.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 2618 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2625 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_unpack)
NOTE: Running task 2626 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: Running task 2627 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_unpack)
NOTE: Running task 2628 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe json-glib-1.10.6-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_write_config: Started
NOTE: Running task 2641 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_write_config)
NOTE: Running task 2642 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 2644 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_write_config)
NOTE: recipe libxmlb-0.3.22-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_write_config: Succeeded
NOTE: recipe libwpe-1.16.2-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.18.6-r0: task do_unpack: Started
NOTE: Running task 2648 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running setscene task 1828 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_write_config: Started
NOTE: Running task 2661 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_fetch)
NOTE: Running task 2662 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_write_config)
NOTE: recipe json-glib-1.10.6-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Started
NOTE: Running task 2663 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_patch)
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_write_config: Succeeded
NOTE: recipe libwpe-1.16.2-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2667 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_patch)
NOTE: recipe gtk+3-3.24.43-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_fetch: Started
NOTE: recipe json-glib-1.10.6-r0: task do_write_config: Started
NOTE: recipe libsoup-3.6.5-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_patch: Started
NOTE: recipe libwpe-1.16.2-r0: task do_patch: Started
NOTE: Running task 2721 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_write_config)
NOTE: recipe json-glib-1.10.6-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 2731 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: recipe json-glib-1.10.6-r0: task do_patch: Succeeded
NOTE: Running task 2732 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_patch)
NOTE: Running task 2735 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_unpack)
NOTE: Running task 2748 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_fetch)
NOTE: Running task 2750 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_fetch)
NOTE: Running task 2751 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_fetch)
NOTE: Running task 2752 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_fetch)
NOTE: Running task 2753 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1831 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.15.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.18.6-r0: task do_write_config: Started
NOTE: recipe libwpe-1.16.2-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: Running setscene task 1832 of 1833 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_patch: Started
NOTE: recipe libsoup-3.6.5-r0: task do_unpack: Started
NOTE: recipe gtk4-4.18.6-r0: task do_write_config: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Started
NOTE: recipe enchant2-2.8.10-r0: task do_fetch: Started
NOTE: recipe appstream-1.0.5-r0: task do_fetch: Started
NOTE: Running task 2754 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_fetch)
NOTE: recipe libnotify-0.8.6-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.8.10-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe appstream-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.6-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_fetch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: Running task 2765 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: recipe linux-libc-headers-6.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_fetch: Started
NOTE: recipe libsoup-3.6.5-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_fetch: Succeeded
NOTE: Running task 2798 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_patch)
NOTE: Running task 2799 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_generate_toolchain_file)
NOTE: Running task 2804 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_fetch)
NOTE: Running task 2806 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_unpack: Succeeded
NOTE: Running task 2817 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: recipe libwpe-1.16.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsoup-3.6.5-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_fetch: Started
NOTE: Running task 2852 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_unpack)
NOTE: recipe webkitgtk-2.48.2-r0: task do_fetch: Started
NOTE: Running task 2854 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_unpack)
NOTE: Running task 2855 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_unpack)
NOTE: Running task 2856 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_unpack)
NOTE: Running task 2857 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_unpack)
NOTE: Running task 2858 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_unpack)
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.48.2-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.16.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Started
NOTE: Running task 2874 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_fetch)
NOTE: recipe enchant2-2.8.10-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Started
NOTE: Running task 2875 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_fetch)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe appstream-1.0.5-r0: task do_unpack: Started
NOTE: Running task 2876 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: Running task 2877 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_fetch)
NOTE: recipe libnotify-0.8.6-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: recipe libsecret-0.21.6-r0: task do_unpack: Started
NOTE: recipe enchant2-2.8.10-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_patch: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Started
NOTE: recipe libportal-0.9.1-r0: task do_fetch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe gcr-4.3.1-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.6-r0: task do_unpack: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_unpack: Succeeded
NOTE: recipe gcr-4.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.18.6-r0: task do_unpack: Succeeded
NOTE: recipe appstream-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Succeeded
NOTE: recipe libportal-0.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 3393 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3420 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3449 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3472 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3512 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe clang-20.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3533 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.3.bb:do_packagedata)
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3554 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3584 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.14.3-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash d0e0a0643937ab64fbcb6890f61be2349c35027e4abb321b6790e06a548ee4da to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '1691f0c74bdc555de7de7f6844ecf4e797f03a341a3f4015412a08ca053a9ab0', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd0e0a0643937ab64fbcb6890f61be2349c35027e4abb321b6790e06a548ee4da'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 1691f0c74bdc555de7de7f6844ecf4e797f03a341a3f4015412a08ca053a9ab0 -> d0e0a0643937ab64fbcb6890f61be2349c35027e4abb321b6790e06a548ee4da as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3767 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3789 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.14.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3824 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3825 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.56.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3831 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_patch)
NOTE: recipe libxmlb-0.3.22-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3853 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 3867 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3868 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_configure)
NOTE: recipe gtk4-4.18.6-r0: task do_patch: Started
NOTE: Running task 3874 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk4-4.18.6-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3887 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3893 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_configure)
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3920 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_configure)
NOTE: recipe clang-20.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: Running task 3941 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_configure)
NOTE: recipe cairo-1.18.4-r0: task do_configure: Started
NOTE: Running task 3954 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash d0e0a0643937ab64fbcb6890f61be2349c35027e4abb321b6790e06a548ee4da to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '4e8cb84652cc4ce490dc4ab88853f4f8b5d7097ef21063da0cd8976d2837d6d3', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd0e0a0643937ab64fbcb6890f61be2349c35027e4abb321b6790e06a548ee4da'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 4e8cb84652cc4ce490dc4ab88853f4f8b5d7097ef21063da0cd8976d2837d6d3 -> d0e0a0643937ab64fbcb6890f61be2349c35027e4abb321b6790e06a548ee4da as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_configure: Started
NOTE: Running task 3956 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_configure)
NOTE: recipe clang-20.1.7-r0: task do_configure: Started
NOTE: Running task 3958 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx)
NOTE: Running task 3965 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_patch)
NOTE: recipe clang-20.1.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Started
NOTE: recipe appstream-1.0.5-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3966 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_configure)
NOTE: recipe clang-20.1.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3967 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_patch)
NOTE: Running task 3968 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Started
NOTE: Running task 3969 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe appstream-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.56.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3970 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_configure)
NOTE: Running task 3971 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe json-glib-1.10.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3972 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_configure)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3973 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_collect_spdx_deps)
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_configure: Started
NOTE: Running task 3974 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_patch)
NOTE: recipe enchant2-2.8.10-r0: task do_patch: Started
NOTE: recipe json-glib-1.10.6-r0: task do_configure: Started
NOTE: recipe enchant2-2.8.10-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3975 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_patch)
NOTE: recipe libnotify-0.8.6-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.6-r0: task do_patch: Succeeded
NOTE: Running task 3976 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_patch)
NOTE: recipe libsecret-0.21.6-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_patch: Started
NOTE: recipe cairo-1.18.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3979 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_fetch)
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_patch: Succeeded
NOTE: Running task 3980 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_unpack)
NOTE: recipe libsecret-0.21.6-r0: task do_patch: Succeeded
NOTE: Running task 3990 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_unpack)
NOTE: recipe libadwaita-1.7.5-r0: task do_fetch: Started
NOTE: recipe librsvg-2.59.2-r0: task do_unpack: Succeeded
NOTE: recipe webkitgtk-2.48.2-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_fetch: Succeeded
NOTE: Running task 3991 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_patch)
NOTE: Running task 3998 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: Running task 3999 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4003 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_patch)
NOTE: recipe librsvg-2.59.2-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_patch: Succeeded
NOTE: Running task 4004 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_write_config)
NOTE: recipe libsoup-3.6.5-r0: task do_write_config: Started
NOTE: recipe librsvg-2.59.2-r0: task do_patch: Succeeded
NOTE: Running task 4006 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_rust_gen_targets)
NOTE: recipe libsoup-3.6.5-r0: task do_write_config: Succeeded
NOTE: Running task 4111 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_unpack)
NOTE: recipe librsvg-2.59.2-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.59.2-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 4112 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_unpack)
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Started
NOTE: recipe libportal-0.9.1-r0: task do_unpack: Started
NOTE: recipe mesa-native-2_25.1.4-r0: task do_compile: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4113 of 4999 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: Running task 4114 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_configure)
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Started
NOTE: recipe mesa-native-2_25.1.4-r0: task do_install: Started
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 4115 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: recipe libportal-0.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 4116 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_unpack)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe gcr-4.3.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 4117 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 4118 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_unpack)
NOTE: recipe gcr-4.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 4122 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_unpack: Started
NOTE: recipe mesa-native-2_25.1.4-r0: task do_install: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Started
NOTE: Running task 4123 of 4999 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Succeeded
NOTE: Running task 4124 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 4125 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe libadwaita-1.7.5-r0: task do_unpack: Succeeded
NOTE: Running task 4126 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: recipe libportal-0.9.1-r0: task do_patch: Started
NOTE: recipe mesa-native-2_25.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe libportal-0.9.1-r0: task do_patch: Succeeded
NOTE: Running task 4127 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_patch)
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: Running task 4128 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_patch)
NOTE: recipe gcr-4.3.1-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.48.2-r0: task do_unpack: Succeeded
NOTE: Running task 4129 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_patch)
NOTE: recipe libadwaita-1.7.5-r0: task do_patch: Started
NOTE: recipe gcr-4.3.1-r0: task do_patch: Succeeded
NOTE: Running task 4142 of 4999 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe libadwaita-1.7.5-r0: task do_patch: Succeeded
NOTE: recipe webkitgtk-2.48.2-r0: task do_patch: Started
NOTE: Running task 4194 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_write_config)
NOTE: recipe appstream-1.0.5-r0: task do_write_config: Started
NOTE: recipe mesa-native-2_25.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe appstream-1.0.5-r0: task do_write_config: Succeeded
NOTE: Running task 4196 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-native-2_25.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_configure: Succeeded
NOTE: Running task 4197 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4198 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.10.6-r0: task do_configure: Succeeded
NOTE: Running task 4199 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_configure_ptest_base)
NOTE: recipe enchant2-2.8.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_configure_ptest_base: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Succeeded
NOTE: recipe mesa-native-2_25.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot unihash changed to 3cd32b3fe6764706709fe5201cf9ad32b2e0f7d3e690a76de738ac98777a6cd9
NOTE: Setscene task virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx became valid
NOTE: recipe libxmlb-0.3.22-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_configure_ptest_base: Started
NOTE: recipe webkitgtk-2.48.2-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1820 of 1833 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: Running task 4200 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_compile)
NOTE: Running task 4201 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 4202 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_compile)
NOTE: Running task 4203 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: Running task 4204 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_write_config)
NOTE: Running task 4205 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_write_config)
NOTE: recipe libxmlb-0.3.22-r0: task do_compile: Started
NOTE: recipe json-glib-1.10.6-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Started
NOTE: recipe mesa-native-2_25.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe libnotify-0.8.6-r0: task do_write_config: Started
NOTE: recipe libsecret-0.21.6-r0: task do_write_config: Started
NOTE: recipe enchant2-2.8.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4206 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_write_config)
NOTE: recipe libnotify-0.8.6-r0: task do_write_config: Succeeded
NOTE: recipe mesa-native-2_25.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4210 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_configure)
NOTE: Running task 4211 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_configure)
NOTE: Running task 4217 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_collect_spdx_deps)
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_write_config: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Started
NOTE: recipe enchant2-2.8.10-r0: task do_configure: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_write_config: Succeeded
NOTE: Running task 4229 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_fetch)
NOTE: recipe libxft-1_2.3.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-48.5-r0: task do_fetch: Started
NOTE: recipe epiphany-48.5-r0: task do_fetch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4236 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_write_config)
NOTE: Running task 4237 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_write_config: Succeeded
NOTE: Running task 4238 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_configure: Succeeded
NOTE: Running task 4239 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4242 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_collect_spdx_deps)
NOTE: recipe cairo-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 4243 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_compile)
NOTE: recipe at-spi2-core-2.56.2-r0: task do_compile: Started
NOTE: recipe vala-0.56.18-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Succeeded
NOTE: Running task 4244 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_install)
NOTE: recipe cairo-1.18.4-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4245 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_configure)
NOTE: recipe vala-0.56.18-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Started
NOTE: Running task 4307 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_configure: Started
NOTE: Running task 4308 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe epiphany-48.5-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_configure: Succeeded
NOTE: Running task 4309 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_configure_ptest_base)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 4310 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4311 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_compile)
NOTE: recipe epiphany-48.5-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: Running task 4313 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_compile: Started
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Succeeded
NOTE: Running task 4314 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot)
NOTE: Running task 4315 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package)
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 4316 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4317 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4318 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_write_config)
NOTE: recipe libportal-0.9.1-r0: task do_write_config: Started
NOTE: recipe libportal-0.9.1-r0: task do_write_config: Succeeded
NOTE: Running task 4319 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: Running task 4320 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: Running task 4321 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_configure: Succeeded
NOTE: Running task 4322 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4323 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_compile: Succeeded
NOTE: Running task 4324 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_compile_ptest_base)
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_compile_ptest_base: Started
NOTE: Running task 4325 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata)
NOTE: recipe json-glib-1.10.6-r0: task do_compile: Succeeded
NOTE: Running task 4326 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_compile_ptest_base)
NOTE: recipe libxmlb-0.3.22-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4327 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_install)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Succeeded
NOTE: Running task 4328 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_compile_ptest_base: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_compile: Succeeded
NOTE: Running task 4329 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: Running task 4330 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_install)
NOTE: recipe json-glib-1.10.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4331 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_install)
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata unihash changed to 5da17aec2a0d9779a319508103b9f1a7f96b4dbea553e5a342d910444dbc9948
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 4332 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_write_config)
NOTE: recipe json-glib-1.10.6-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4333 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure)
NOTE: recipe gcr-4.3.1-r0: task do_write_config: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 4334 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe gcr-4.3.1-r0: task do_write_config: Succeeded
NOTE: Running task 4335 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_write_config)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_write_config: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_write_config: Succeeded
NOTE: Running task 4336 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_generate_toolchain_file)
NOTE: recipe libxmlb-0.3.22-r0: task do_install: Succeeded
NOTE: Running task 4337 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_install_ptest_base)
NOTE: recipe webkitgtk-2.48.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.48.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 4340 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 8b92a216f3ead25ac047d926ff75c47d6218977f98773c78d4b04e46f06a9eeb
NOTE: recipe epiphany-48.5-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_install_ptest_base: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_install: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_install_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4341 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.10.6-r0: task do_install: Succeeded
NOTE: Running task 4342 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 4343 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.56.2-r0: task do_compile: Succeeded
NOTE: Running task 4344 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_install_ptest_base)
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Succeeded
NOTE: Running task 4345 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_install)
NOTE: Running task 4346 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: Running task 4373 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_package)
NOTE: recipe libxmlb-0.3.22-r0: task do_populate_sysroot: Started
NOTE: recipe epiphany-48.5-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe json-glib-1.10.6-r0: task do_install_ptest_base: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_install: Started
NOTE: Running task 4379 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_package)
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_package: Started
NOTE: recipe json-glib-1.10.6-r0: task do_install_ptest_base: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 4384 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_install)
NOTE: recipe libxmlb-0.3.22-r0: task do_package: Started
NOTE: Running task 4395 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_collect_spdx_deps)
NOTE: recipe cairo-1.18.4-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4398 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.22-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4419 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.56.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4421 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_package)
NOTE: Running task 4422 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot)
NOTE: recipe epiphany-48.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_package: Started
NOTE: Running task 4423 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_package)
NOTE: recipe vala-0.56.18-r0: task do_configure: Succeeded
NOTE: Running task 4424 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_compile)
NOTE: recipe epiphany-48.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_deploy_source_date_epoch unihash changed to 472f504976092a67393620c8dd68957083c6db2dd9fb05b38e26453bdebc9f44
NOTE: recipe vala-0.56.18-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 4428 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_populate_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 4429 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot)
NOTE: recipe at-spi2-core-2.56.2-r0: task do_install: Succeeded
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_populate_sysroot: Started
NOTE: Running task 4430 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_package)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4431 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_populate_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4432 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_package)
NOTE: recipe at-spi2-core-2.56.2-r0: task do_package: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4433 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.56.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-11.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4450 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.10.6-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 4451 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.10.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-11.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4452 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_configure)
NOTE: Running task 4464 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-11.2.1-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to 9ba104cb3d9e41621fa7c4891cb67e0711b2c25801d16ac998340f860d1d88fb
NOTE: recipe epiphany-48.5-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure: Succeeded
NOTE: recipe epiphany-48.5-r0: task do_write_config: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4465 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_configure_ptest_base)
NOTE: Running task 4466 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_packagedata)
NOTE: Running task 4476 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Started
NOTE: Running task 4506 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.22-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 4507 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 4514 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxmlb-0.3.22-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_packagedata unihash changed to 3f7473b1ed9eea556115ce8fa07f4097c04d6785ee6005090e26edc4c01dd40d
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4515 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: Running task 4518 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: Running task 4521 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: Running task 4522 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_compile)
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 4545 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata)
NOTE: recipe libxt-1_1.3.1-r0: task do_compile: Started
NOTE: Running task 4599 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4602 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 4603 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe cairo-1.18.4-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4608 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_create_spdx)
NOTE: Running task 4609 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata unihash changed to 7861832d9923fea5db5965e8db2650dd79307341393ae35775045febd872b718
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4610 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_spdx)
NOTE: Running task 4612 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe desktop-file-utils-0.28-r0: task do_create_spdx: Succeeded
NOTE: Running task 4639 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata unihash changed to 366a2ad31d8e3efa917ee84ef32bf4c6595533ac622805db588f0ea96100b126
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4646 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx)
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_package: Succeeded
NOTE: Running task 4650 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_collect_spdx_deps)
NOTE: Running task 4657 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_packagedata)
NOTE: Running task 4667 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_collect_spdx_deps)
NOTE: Running task 4668 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.22-r0: task do_collect_spdx_deps: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.8.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxmlb-0.3.22-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4669 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.22.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe enchant2-2.8.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4676 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_collect_spdx_deps)
NOTE: recipe libxmlb-0.3.22-r0: task do_create_spdx: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4688 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_collect_spdx_deps)
NOTE: recipe json-glib-1.10.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: Running task 4689 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe harfbuzz-11.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.10.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_packagedata unihash changed to 4418ba94e102f26ba97412be4d937bd2991219095b8b41ac0ce28330dda39073
NOTE: recipe libxmlb-0.3.22-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4690 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-11.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4691 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_package_write_ipk)
NOTE: Running task 4692 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_package_write_deb)
NOTE: Running task 4693 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_package_write_rpm)
NOTE: Running task 4694 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_package_qa)
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_package_write_ipk: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_package_write_deb: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_compile: Succeeded
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_package_write_rpm: Started
NOTE: Running task 4695 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_package_qa: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to 50e2cf0b71fad5772421b312f4b13cac19bda8c145ef9c31d57c30b8954e1c29
NOTE: Setscene tasks completed
NOTE: Running task 4696 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_create_spdx: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_package: Succeeded
NOTE: Running task 4697 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe json-glib-1.10.6-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_package_qa unihash changed to 0e363eb5c97073d7147d4061ee23e3fb6e48f588395d5ebd7f9466901533c301
NOTE: recipe libxt-1_1.3.1-r0: task do_install: Succeeded
NOTE: Running task 4698 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 4699 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_package)
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_package: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_configure: Succeeded
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 4700 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_package_write_ipk unihash changed to ab6237e094cdf13c6e008a33c106e52f75108761f0b32aabac7a658552961764
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_package_write_deb unihash changed to 464977dbb77644f448792c8a054543e16359f27914fb102fdfc862f50cc91a59
NOTE: recipe json-glib-1.10.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_packagedata unihash changed to 4a02c1907fd485ff831474366d327d2b83e4771ba33bbffbcbdff6c932698de3
NOTE: recipe harfbuzz-11.2.1-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 4701 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_create_spdx)
NOTE: recipe gsettings-desktop-schemas-48.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_48.0.bb:do_package_write_rpm unihash changed to 5d777987897e872cc6afbce1f0badf8f70826ed7d9b76a5e759e185932ede4a7
NOTE: recipe json-glib-1.10.6-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4702 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe json-glib-1.10.6-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 4703 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4704 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile: Succeeded
NOTE: Running task 4705 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4706 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_package: Succeeded
NOTE: Running task 4707 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.56.2-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 4708 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe at-spi2-core-2.56.2-r0: task do_packagedata: Succeeded
NOTE: Running task 4709 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_packagedata unihash changed to d1ec664fd52aca469272e0ce7eafc8e8306f132c4f4735f639ccbbe52b22356e
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4710 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_install_ptest_base)
NOTE: Running task 4711 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_package)
NOTE: Running task 4712 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.56.2.bb:do_create_spdx)
NOTE: recipe libxt-1_1.3.1-r0: task do_package: Succeeded
NOTE: Running task 4713 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.56.2-r0: task do_create_spdx: Started
NOTE: recipe clang-20.1.7-r0: task do_configure: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata: Started
NOTE: Running task 4714 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4715 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot)
NOTE: Running task 4716 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_package)
NOTE: recipe clang-20.1.7-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata unihash changed to e44c01d1b30b01220b60c4e466dd2684397f423961fef1850a0165f0107e4a67
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4717 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: Running task 4718 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.56.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4719 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.8.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 4720 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe libnotify-0.8.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4721 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe libnotify-0.8.6-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 4722 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe libnotify-0.8.6-r0: task do_configure: Succeeded
NOTE: Running task 4723 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_compile)
NOTE: recipe libnotify-0.8.6-r0: task do_compile: Started
NOTE: recipe enchant2-2.8.10-r0: task do_configure: Succeeded
NOTE: Running task 4724 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_compile)
NOTE: recipe enchant2-2.8.10-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 4725 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to a68c1006b4537da899ec2af5dd5c363505faa365b4d01ad5ce1aafe6f8134029
NOTE: Setscene tasks completed
NOTE: Running task 4726 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package_write_ipk)
NOTE: Running task 4727 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package_write_deb)
NOTE: Running task 4728 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package_write_rpm)
NOTE: Running task 4729 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package_qa)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package_qa: Started
NOTE: recipe enchant2-2.8.10-r0: task do_compile: Succeeded
NOTE: Running task 4730 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_install)
NOTE: recipe enchant2-2.8.10-r0: task do_install: Started
NOTE: recipe libnotify-0.8.6-r0: task do_compile: Succeeded
NOTE: Running task 4731 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_install)
NOTE: recipe libnotify-0.8.6-r0: task do_install: Started
NOTE: recipe enchant2-2.8.10-r0: task do_install: Succeeded
NOTE: Running task 4732 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_populate_sysroot)
NOTE: Running task 4733 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_package)
NOTE: recipe enchant2-2.8.10-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.8.10-r0: task do_package: Started
NOTE: recipe libnotify-0.8.6-r0: task do_install: Succeeded
NOTE: Running task 4734 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.8.6-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 4735 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_packagedata)
NOTE: recipe enchant2-2.8.10-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_packagedata unihash changed to c79b4df393322e540004c0c6962283f439fd9df8cbc35272f723f070ac995078
NOTE: Setscene tasks completed
NOTE: Running task 4736 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_package: Succeeded
NOTE: Running task 4737 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.26.3-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe enchant2-2.8.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package_write_rpm unihash changed to 00cb3bd9ca44876cd56ac8366040bc9f1cb75e86ef1a0e402b3e2c7720473614
NOTE: Running task 4738 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata unihash changed to ce1faaa3cff31cb6c41b0214db412bfdc6ef63ae02d751c839b02d4e04484ea6
NOTE: recipe enchant2-2.8.10-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 4739 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_create_spdx)
NOTE: Running task 4740 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_package)
NOTE: recipe enchant2-2.8.10-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_packagedata unihash changed to 10ed8581f87a83beac87e5378207142839a2351de7c6f35a782b25707aee0f97
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.6-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 4741 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.8.10.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package_qa: Succeeded
NOTE: recipe enchant2-2.8.10-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package_qa unihash changed to 0485863c90b8578add0bb85b4575f9d48e8a4bc22bc25a0a5b5e49f7a99258e5
NOTE: recipe enchant2-2.8.10-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 4742 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_collect_spdx_deps)
NOTE: recipe libnotify-0.8.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.18-r0: task do_compile: Succeeded
NOTE: Running task 4743 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_install)
NOTE: recipe libnotify-0.8.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_install: Started
NOTE: recipe libnotify-0.8.6-r0: task do_package: Succeeded
NOTE: Running task 4744 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_packagedata)
NOTE: recipe libnotify-0.8.6-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_packagedata unihash changed to e8ba0fd3d9452addd3d65c5b6a53e364bf95c6be7b1a2489681e003cdb265e3c
NOTE: Setscene tasks completed
NOTE: Running task 4745 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.6.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.6-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.18-r0: task do_install: Succeeded
NOTE: Running task 4746 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot)
NOTE: Running task 4747 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_package)
NOTE: recipe libnotify-0.8.6-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_package: Started
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4748 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4749 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4750 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4751 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4752 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_configure)
NOTE: recipe libsoup-3.6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4753 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_configure)
NOTE: Running task 4754 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_configure)
NOTE: recipe libical-3.0.20-r0: task do_configure: Started
NOTE: recipe libsoup-3.6.5-r0: task do_configure: Started
NOTE: recipe appstream-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4755 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_configure)
NOTE: recipe libsecret-0.21.6-r0: task do_configure: Started
NOTE: recipe appstream-1.0.5-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package_write_deb unihash changed to 56a90d7c503b3d1f77e8a9cf96826fab680dd2c1e67f1560aa0d4197fca73f2f
NOTE: recipe vala-0.56.18-r0: task do_package: Succeeded
NOTE: Running task 4756 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.84.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.2.bb:do_package_write_ipk unihash changed to d751b3d8fc85c6ee18a49c81c70591038023671636b82b12a2e25716ce195804
NOTE: recipe vala-0.56.18-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata unihash changed to 46365911d9d6cec31f9afb236ebc6f6f533ed3419787882ba085bea30fd96a7c
NOTE: Setscene tasks completed
NOTE: Running task 4757 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_spdx)
NOTE: recipe vala-0.56.18-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.6.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4758 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_compile)
NOTE: recipe libsecret-0.21.6-r0: task do_configure: Succeeded
NOTE: recipe appstream-1.0.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4759 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_compile)
NOTE: recipe libsoup-3.6.5-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 4760 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_compile)
NOTE: recipe vala-0.56.18-r0: task do_create_spdx: Succeeded
NOTE: Running task 4761 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_collect_spdx_deps)
NOTE: Running task 4762 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_collect_spdx_deps)
NOTE: recipe libsecret-0.21.6-r0: task do_compile: Started
NOTE: Running task 4763 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_collect_spdx_deps)
NOTE: recipe appstream-1.0.5-r0: task do_compile: Started
NOTE: Running task 4764 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.20-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.6.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe appstream-1.0.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsecret-0.21.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.20-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.6.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe appstream-1.0.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4765 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_compile)
NOTE: recipe libical-3.0.20-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.6-r0: task do_compile: Succeeded
NOTE: Running task 4766 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_install)
NOTE: recipe libsecret-0.21.6-r0: task do_install: Started
NOTE: recipe libsecret-0.21.6-r0: task do_install: Succeeded
NOTE: Running task 4767 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_populate_sysroot)
NOTE: Running task 4768 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_package)
NOTE: recipe libsecret-0.21.6-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.21.6-r0: task do_package: Started
NOTE: recipe libsecret-0.21.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-1.0.5-r0: task do_compile: Succeeded
NOTE: Running task 4769 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_install)
NOTE: recipe libsoup-3.6.5-r0: task do_compile: Succeeded
NOTE: Running task 4770 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_install)
NOTE: recipe appstream-1.0.5-r0: task do_install: Started
NOTE: recipe libsoup-3.6.5-r0: task do_install: Started
NOTE: recipe libsoup-3.6.5-r0: task do_install: Succeeded
NOTE: Running task 4771 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_populate_sysroot)
NOTE: Running task 4772 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_package)
NOTE: recipe appstream-1.0.5-r0: task do_install: Succeeded
NOTE: Running task 4773 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_populate_sysroot)
NOTE: Running task 4774 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_package)
NOTE: recipe libsoup-3.6.5-r0: task do_package: Started
NOTE: recipe libsoup-3.6.5-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.0.5-r0: task do_package: Started
NOTE: recipe libsoup-3.6.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe appstream-1.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_compile: Succeeded
NOTE: Running task 4775 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_install)
NOTE: recipe libical-3.0.20-r0: task do_install: Started
NOTE: recipe libical-3.0.20-r0: task do_install: Succeeded
NOTE: Running task 4776 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot)
NOTE: Running task 4777 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_package)
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.20-r0: task do_package: Started
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4778 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsecret-0.21.6-r0: task do_package: Succeeded
NOTE: Running task 4779 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_packagedata)
NOTE: recipe bluez5-5.83-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.6-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.83-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4780 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_configure)
NOTE: recipe libsecret-0.21.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_packagedata unihash changed to 76e1b986486f51601cfb07001247d5413e85dffec08549022b57addd0e72ebbb
NOTE: Setscene tasks completed
NOTE: Running task 4781 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb:do_create_spdx)
NOTE: recipe bluez5-5.83-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.6-r0: task do_create_spdx: Started
NOTE: recipe appstream-1.0.5-r0: task do_package: Succeeded
NOTE: recipe libsecret-0.21.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 4782 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_packagedata)
NOTE: recipe appstream-1.0.5-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.6.5-r0: task do_package: Succeeded
NOTE: Running task 4783 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_packagedata)
NOTE: recipe appstream-1.0.5-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_packagedata unihash changed to 57e263a10061294f11e67b63bd68303f2f2c555307a8896b9631c12b3dd10b4a
NOTE: recipe libsoup-3.6.5-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 4784 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.5.bb:do_create_spdx)
NOTE: recipe libical-3.0.20-r0: task do_package: Succeeded
NOTE: Running task 4785 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata)
NOTE: recipe appstream-1.0.5-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.20-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.20-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata unihash changed to 09b45c2a5291b20f8c666bcc6c7d5d6e1357507b8edec05cc026bc50e191e3c1
NOTE: recipe libsoup-3.6.5-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_packagedata unihash changed to d32bcda355a00b3a9104ee672299b3f401b27cf032c2fa9c78a9d890b63ff980
NOTE: Setscene tasks completed
NOTE: Running task 4786 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_create_spdx)
NOTE: recipe appstream-1.0.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 4787 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_create_spdx)
NOTE: recipe libical-3.0.20-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.6.5-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.20-r0: task do_create_spdx: Succeeded
NOTE: Running task 4788 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.83-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.6.5-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4789 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.83-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.83-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4790 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_compile)
NOTE: recipe bluez5-5.83-r0: task do_compile: Started
NOTE: recipe bluez5-5.83-r0: task do_compile: Succeeded
NOTE: Running task 4791 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.83-r0: task do_compile_ptest_base: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_compile: Succeeded
NOTE: Running task 4792 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_install)
NOTE: recipe harfbuzz-11.2.1-r0: task do_install: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_install: Succeeded
NOTE: Running task 4793 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_populate_sysroot)
NOTE: Running task 4794 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_package)
NOTE: recipe harfbuzz-11.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_package: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4795 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.56.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.56.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4796 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_configure)
NOTE: recipe pango-1.56.4-r0: task do_configure: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_package: Succeeded
NOTE: Running task 4797 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_packagedata)
NOTE: recipe harfbuzz-11.2.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_packagedata unihash changed to b0e854c1c08aa40887af38986d0f87081f57afc8839f2a6d6afd2fa1e43a6497
NOTE: Setscene tasks completed
NOTE: Running task 4798 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_11.2.1.bb:do_create_spdx)
NOTE: recipe harfbuzz-11.2.1-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-11.2.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 4799 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_collect_spdx_deps)
NOTE: recipe pango-1.56.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4800 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_compile)
NOTE: recipe pango-1.56.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.56.4-r0: task do_compile: Started
NOTE: recipe pango-1.56.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pango-1.56.4-r0: task do_compile: Succeeded
NOTE: Running task 4801 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_install)
NOTE: recipe pango-1.56.4-r0: task do_install: Started
NOTE: recipe pango-1.56.4-r0: task do_install: Succeeded
NOTE: Running task 4802 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_populate_sysroot)
NOTE: Running task 4803 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_package)
NOTE: recipe pango-1.56.4-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.56.4-r0: task do_package: Started
NOTE: recipe pango-1.56.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4804 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.59.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.59.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4805 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_rust_create_wrappers)
NOTE: recipe librsvg-2.59.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.59.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 4806 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_configure)
NOTE: recipe librsvg-2.59.2-r0: task do_configure: Started
NOTE: recipe pango-1.56.4-r0: task do_package: Succeeded
NOTE: Running task 4807 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_packagedata)
NOTE: recipe pango-1.56.4-r0: task do_packagedata: Started
NOTE: recipe pango-1.56.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_packagedata unihash changed to 19a8a0394245afd0bd42b06787b7ea8840db91a4adcdf312e0b4bfed01ebc826
NOTE: Setscene tasks completed
NOTE: Running task 4808 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.56.4.bb:do_create_spdx)
NOTE: recipe pango-1.56.4-r0: task do_create_spdx: Started
NOTE: recipe pango-1.56.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4809 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.59.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.59.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4810 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_compile)
NOTE: recipe librsvg-2.59.2-r0: task do_compile: Started
NOTE: recipe bluez5-5.83-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4811 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_install)
NOTE: recipe bluez5-5.83-r0: task do_install: Started
NOTE: recipe bluez5-5.83-r0: task do_install: Succeeded
NOTE: Running task 4812 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.83-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.83-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4813 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_populate_sysroot)
NOTE: Running task 4814 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_package)
NOTE: recipe bluez5-5.83-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.83-r0: task do_package: Started
NOTE: recipe bluez5-5.83-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.83-r0: task do_package: Succeeded
NOTE: Running task 4815 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_packagedata)
NOTE: recipe bluez5-5.83-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.83-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_packagedata unihash changed to 2cdf6930e06d929c130726ddffd8289b9ac3bd4bc0bbce22ef3fa5ac292582b0
NOTE: Setscene tasks completed
NOTE: Running task 4816 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.83.bb:do_create_spdx)
NOTE: recipe bluez5-5.83-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.83-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_compile: Succeeded
NOTE: Running task 4817 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_install)
NOTE: recipe librsvg-2.59.2-r0: task do_install: Started
NOTE: recipe librsvg-2.59.2-r0: task do_install: Succeeded
NOTE: Running task 4818 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_populate_sysroot)
NOTE: Running task 4819 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_package)
NOTE: recipe librsvg-2.59.2-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.59.2-r0: task do_package: Started
NOTE: recipe librsvg-2.59.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.59.2-r0: task do_package: Succeeded
NOTE: Running task 4820 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_packagedata)
NOTE: recipe librsvg-2.59.2-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.59.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_packagedata unihash changed to 2a712ea6ec5e83bf2a206141f8f03a7894db4e4b66e71dfc583bdc0b261d4476
NOTE: Setscene tasks completed
NOTE: Running task 4821 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.59.2.bb:do_create_spdx)
NOTE: recipe librsvg-2.59.2-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.59.2-r0: task do_create_spdx: Succeeded
Bitbake still alive (no events for 600s). Active tasks:
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_compile
NOTE: recipe clang-20.1.7-r0: task do_compile: Succeeded
NOTE: Running task 4822 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_install)
NOTE: recipe clang-20.1.7-r0: task do_install: Started
NOTE: recipe clang-20.1.7-r0: task do_install: Succeeded
NOTE: Running task 4823 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_populate_sysroot)
NOTE: Running task 4824 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_package)
NOTE: recipe clang-20.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe clang-20.1.7-r0: task do_package: Started
NOTE: recipe clang-20.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4825 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4826 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_configure)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_configure: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_configure: Succeeded
NOTE: Running task 4827 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_compile)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_compile: Started
NOTE: recipe clang-20.1.7-r0: task do_package: Succeeded
NOTE: Running task 4828 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_packagedata)
NOTE: recipe clang-20.1.7-r0: task do_packagedata: Started
NOTE: recipe clang-20.1.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_packagedata unihash changed to 7c4c6d424183c13fcdb36c5d951c5fbfac3659769084545abddb803961773089
NOTE: Setscene tasks completed
NOTE: Running task 4829 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_create_spdx)
NOTE: recipe clang-20.1.7-r0: task do_create_spdx: Started
NOTE: recipe clang-20.1.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 4830 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_collect_spdx_deps)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4831 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_install)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_install: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_install: Succeeded
NOTE: Running task 4832 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_populate_sysroot)
NOTE: Running task 4833 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_package)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_package: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4834 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_25.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4835 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe mesa-2_25.1.4-r0: task do_rust_create_wrappers: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 4836 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe mesa-2_25.1.4-r0: task do_configure: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_package: Succeeded
NOTE: Running task 4837 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_packagedata)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_packagedata: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_packagedata unihash changed to 2494220be98cc219e692442effd03e715d480e565f0be8976ec0cfa527888b06
NOTE: Setscene tasks completed
NOTE: Running task 4838 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb:do_create_spdx)
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_create_spdx: Started
NOTE: recipe spirv-llvm-translator-20.1.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4839 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_25.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-2_25.1.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4840 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe mesa-2_25.1.4-r0: task do_compile: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_compile: Succeeded
NOTE: Running task 4841 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe mesa-2_25.1.4-r0: task do_install: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_install: Succeeded
NOTE: Running task 4842 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: Running task 4843 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_package)
NOTE: recipe mesa-2_25.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_package: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4844 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4845 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4846 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4847 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4848 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: Running task 4849 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libwpe-1.16.2-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libwpe-1.16.2-r0: task do_configure: Succeeded
NOTE: Running task 4850 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_compile)
NOTE: recipe libwpe-1.16.2-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.2-r0: task do_compile: Succeeded
NOTE: Running task 4851 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 4852 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libwpe-1.16.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 4853 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.2-r0: task do_install: Succeeded
NOTE: Running task 4854 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_populate_sysroot)
NOTE: recipe libwpe-1.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwpe-1.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 4855 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 4856 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4857 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_package: Succeeded
NOTE: Running task 4858 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_packagedata)
NOTE: recipe mesa-2_25.1.4-r0: task do_packagedata: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_packagedata: Succeeded
NOTE: Running task 4859 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: Running task 4860 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx)
NOTE: Running task 4861 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_create_spdx: Started
NOTE: recipe libwpe-1.16.2-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4862 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_configure: Started
NOTE: recipe mesa-2_25.1.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4863 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 4864 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_collect_spdx_deps)
NOTE: Running task 4865 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwpe-1.16.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwpe-1.16.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 4866 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: recipe libwpe-1.16.2-r0: task do_package: Succeeded
NOTE: Running task 4867 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata unihash changed to 98f079ada043c26e0107dcbe2b69723b70ca78d3c5c2478cfe7f04fe79c823e6
NOTE: recipe libwpe-1.16.2-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 4868 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe libwpe-1.16.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_packagedata unihash changed to e7ffc4e57160c1168481396f7413d3b23804edefc154629d784a3ecfae2d648f
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 4869 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.16.2.bb:do_create_spdx)
NOTE: recipe libwpe-1.16.2-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4870 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_collect_spdx_deps)
NOTE: recipe libwpe-1.16.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 4871 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 4872 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 4873 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4874 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4875 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4876 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4877 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4878 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_configure)
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 4879 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to 90aa2463d94dd54bdd686b122abf32b06f8fbb98789d6680276e801144c0bcac
NOTE: Setscene tasks completed
NOTE: Running task 4880 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 4881 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_collect_spdx_deps)
NOTE: Running task 4882 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_collect_spdx_deps)
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_configure: Succeeded
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: Running task 4883 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 4884 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_install)
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 4885 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_populate_sysroot)
NOTE: Running task 4886 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_package)
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4887 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_compile)
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 4888 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_packagedata unihash changed to a97eab12effd17424601a80be2223ff0a4c48abe7d0220d142b101cb98f8398b
NOTE: Setscene tasks completed
NOTE: Running task 4889 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.16.0.bb:do_create_spdx)
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe wpebackend-fdo-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 4890 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 4891 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_populate_sysroot)
NOTE: Running task 4892 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4893 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4894 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 4895 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_packagedata unihash changed to 5749a9b3fb7a2caee9dceb67bd8b84b2a4516ba342e23581b638ac244bfac95e
NOTE: Setscene tasks completed
NOTE: Running task 4896 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4897 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4898 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk+3-3.24.43-r0: task do_compile: Succeeded
NOTE: Running task 4899 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_install)
NOTE: recipe gtk+3-3.24.43-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_install: Succeeded
NOTE: Running task 4900 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot)
NOTE: Running task 4901 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_package)
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4902 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4903 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libhandy-1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4909 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_configure)
NOTE: recipe libdazzle-3.44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4910 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_configure)
NOTE: recipe libhandy-1.8.3-r0: task do_configure: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Started
NOTE: recipe libhandy-1.8.3-r0: task do_configure: Succeeded
NOTE: Running task 4911 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_compile)
NOTE: recipe libhandy-1.8.3-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_configure: Succeeded
NOTE: Running task 4912 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_compile)
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_compile: Succeeded
NOTE: Running task 4913 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_install: Succeeded
NOTE: Running task 4914 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_populate_sysroot)
NOTE: Running task 4915 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_package: Succeeded
NOTE: Running task 4916 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata)
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4917 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.18.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_packagedata unihash changed to bef8927df2617e8829c9dce720d3cf4c1803b5e5f986b7d26ea42bc530419da8
NOTE: Setscene tasks completed
NOTE: Running task 4919 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.18.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4925 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_configure)
NOTE: recipe gtk4-4.18.6-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.43-r0: task do_create_spdx: Succeeded
NOTE: Running task 4926 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_collect_spdx_deps)
NOTE: Running task 4927 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_collect_spdx_deps)
NOTE: recipe libhandy-1.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libhandy-1.8.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4930 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_install)
NOTE: recipe libhandy-1.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_install: Started
NOTE: recipe libhandy-1.8.3-r0: task do_install: Succeeded
NOTE: Running task 4931 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_package)
NOTE: Running task 4932 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_populate_sysroot)
NOTE: recipe libhandy-1.8.3-r0: task do_package: Started
NOTE: recipe libhandy-1.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libhandy-1.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4933 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_install)
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_install: Succeeded
NOTE: Running task 4934 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_package)
NOTE: Running task 4935 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot)
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.18.6-r0: task do_configure: Succeeded
NOTE: Running task 4936 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_compile)
NOTE: recipe gtk4-4.18.6-r0: task do_compile: Started
NOTE: recipe libhandy-1.8.3-r0: task do_package: Succeeded
NOTE: Running task 4937 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_packagedata)
NOTE: recipe libhandy-1.8.3-r0: task do_packagedata: Started
NOTE: recipe libhandy-1.8.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_packagedata unihash changed to 8be20d2a3141cd94994a78655fa8c0317daea1f6fd1333f362d72c803ca04270
NOTE: Setscene tasks completed
NOTE: Running task 4938 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_create_spdx)
NOTE: recipe libhandy-1.8.3-r0: task do_create_spdx: Started
NOTE: recipe libhandy-1.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_package: Succeeded
NOTE: Running task 4939 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_packagedata unihash changed to 49e483db84ae635ea3bf47d67d6508a47a8229cfe38a93ff9afe5764a5b3b322
NOTE: Setscene tasks completed
NOTE: Running task 4940 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_create_spdx)
NOTE: recipe libdazzle-3.44.0-r0: task do_create_spdx: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_package: Succeeded
NOTE: Running task 4941 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_packagedata unihash changed to 7878045fc960b029a67611cdd80eb614d3e1ec8be2795659842ba0d54e1bad97
NOTE: Setscene tasks completed
NOTE: Running task 4942 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.3.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4943 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.18.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.18.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.18.6-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4944 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_install)
NOTE: recipe gtk4-4.18.6-r0: task do_install: Started
NOTE: recipe gtk4-4.18.6-r0: task do_install: Succeeded
NOTE: Running task 4945 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_populate_sysroot)
NOTE: Running task 4946 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_package)
NOTE: recipe gtk4-4.18.6-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.18.6-r0: task do_package: Started
NOTE: recipe gtk4-4.18.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4947 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4948 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4949 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4950 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libportal-0.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-4.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.48.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libportal-0.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4951 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_configure)
NOTE: recipe libadwaita-1.7.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4952 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_configure)
NOTE: recipe libportal-0.9.1-r0: task do_configure: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_configure: Started
NOTE: recipe webkitgtk-2.48.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4953 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_configure)
NOTE: recipe webkitgtk-2.48.2-r0: task do_configure: Started
NOTE: recipe gcr-4.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4954 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_configure)
NOTE: recipe gcr-4.3.1-r0: task do_configure: Started
NOTE: recipe libportal-0.9.1-r0: task do_configure: Succeeded
NOTE: Running task 4955 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_compile)
NOTE: recipe libportal-0.9.1-r0: task do_compile: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_configure: Succeeded
NOTE: Running task 4956 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_compile)
NOTE: recipe gcr-4.3.1-r0: task do_configure: Succeeded
NOTE: Running task 4957 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_compile)
NOTE: recipe libadwaita-1.7.5-r0: task do_compile: Started
NOTE: recipe gcr-4.3.1-r0: task do_compile: Started
NOTE: recipe gtk4-4.18.6-r0: task do_package: Succeeded
NOTE: Running task 4958 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_packagedata)
NOTE: recipe gtk4-4.18.6-r0: task do_packagedata: Started
NOTE: recipe gcr-4.3.1-r0: task do_compile: Succeeded
NOTE: Running task 4959 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_install)
NOTE: recipe gcr-4.3.1-r0: task do_install: Started
NOTE: recipe gtk4-4.18.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_packagedata unihash changed to 9e41d6dcf71df7610ddb0ec33d7464aa8bbaff2c30291d512b661e7f346ecd88
NOTE: Setscene tasks completed
NOTE: Running task 4960 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb:do_create_spdx)
NOTE: recipe gtk4-4.18.6-r0: task do_create_spdx: Started
NOTE: recipe libportal-0.9.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4961 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_install)
NOTE: recipe libportal-0.9.1-r0: task do_install: Started
NOTE: recipe gcr-4.3.1-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4962 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_package)
NOTE: Running task 4963 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_populate_sysroot)
NOTE: recipe gcr-4.3.1-r0: task do_package: Started
NOTE: recipe gcr-4.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.18.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 4964 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_collect_spdx_deps)
NOTE: Running task 4965 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_collect_spdx_deps)
NOTE: Running task 4966 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_collect_spdx_deps)
NOTE: recipe libportal-0.9.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4967 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_collect_spdx_deps)
NOTE: recipe gcr-4.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libportal-0.9.1-r0: task do_install: Succeeded
NOTE: Running task 4968 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_package)
NOTE: recipe libadwaita-1.7.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4969 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.48.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libportal-0.9.1-r0: task do_package: Started
NOTE: recipe libportal-0.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-4.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libportal-0.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libadwaita-1.7.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gcr-4.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe webkitgtk-2.48.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libportal-0.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libportal-0.9.1-r0: task do_package: Succeeded
NOTE: Running task 4970 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_packagedata)
NOTE: recipe libportal-0.9.1-r0: task do_packagedata: Started
NOTE: recipe libportal-0.9.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_packagedata unihash changed to 0b7fe14c8a36540c454cf2d6172bb521448a7a6d36a3a33f24466ed5046aa547
NOTE: Setscene tasks completed
NOTE: Running task 4971 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_create_spdx)
NOTE: recipe libportal-0.9.1-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4972 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_install)
NOTE: recipe libportal-0.9.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libadwaita-1.7.5-r0: task do_install: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_install: Succeeded
NOTE: Running task 4973 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_package)
NOTE: Running task 4974 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_populate_sysroot)
NOTE: recipe libadwaita-1.7.5-r0: task do_package: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_populate_sysroot: Started
NOTE: recipe gcr-4.3.1-r0: task do_package: Succeeded
NOTE: Running task 4975 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_packagedata)
NOTE: recipe gcr-4.3.1-r0: task do_packagedata: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gcr-4.3.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_packagedata unihash changed to 56ae5db2017ed4df50c06c056d8d80a40f8c490fa0b13a72403793fc99f22fe0
NOTE: Setscene tasks completed
NOTE: Running task 4976 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.1.bb:do_create_spdx)
NOTE: recipe gcr-4.3.1-r0: task do_create_spdx: Started
NOTE: recipe gcr-4.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libadwaita-1.7.5-r0: task do_package: Succeeded
NOTE: Running task 4977 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_packagedata)
NOTE: recipe libadwaita-1.7.5-r0: task do_packagedata: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_packagedata unihash changed to 172590a0ccd419b8ef7d8a112fa308b45e37d18adc94ff5ca27916d32587ad87
NOTE: Setscene tasks completed
NOTE: Running task 4978 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.7.5.bb:do_create_spdx)
NOTE: recipe libadwaita-1.7.5-r0: task do_create_spdx: Started
NOTE: recipe libadwaita-1.7.5-r0: task do_create_spdx: Succeeded
NOTE: recipe webkitgtk-2.48.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4979 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_compile)
NOTE: recipe webkitgtk-2.48.2-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_compile
Bitbake still alive (no events for 1200s). Active tasks:
/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_compile
NOTE: recipe webkitgtk-2.48.2-r0: task do_compile: Succeeded
NOTE: Running task 4980 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_install)
NOTE: recipe webkitgtk-2.48.2-r0: task do_install: Started
NOTE: recipe webkitgtk-2.48.2-r0: task do_install: Succeeded
NOTE: Running task 4981 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_package)
NOTE: Running task 4982 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_populate_sysroot)
NOTE: recipe webkitgtk-2.48.2-r0: task do_package: Started
NOTE: recipe webkitgtk-2.48.2-r0: task do_populate_sysroot: Started
NOTE: recipe webkitgtk-2.48.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4983 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-48.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-48.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4984 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_configure)
NOTE: recipe epiphany-48.5-r0: task do_configure: Started
NOTE: recipe epiphany-48.5-r0: task do_configure: Succeeded
NOTE: Running task 4985 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_compile)
NOTE: recipe epiphany-48.5-r0: task do_compile: Started
NOTE: recipe epiphany-48.5-r0: task do_compile: Succeeded
NOTE: Running task 4986 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_install)
NOTE: recipe epiphany-48.5-r0: task do_install: Started
NOTE: recipe epiphany-48.5-r0: task do_install: Succeeded
NOTE: Running task 4987 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_populate_sysroot)
NOTE: recipe epiphany-48.5-r0: task do_populate_sysroot: Started
NOTE: recipe epiphany-48.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe webkitgtk-2.48.2-r0: task do_package: Succeeded
NOTE: Running task 4988 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_packagedata)
NOTE: recipe webkitgtk-2.48.2-r0: task do_packagedata: Started
NOTE: recipe webkitgtk-2.48.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_packagedata unihash changed to 5be7adb5ce027539d94b761883b17a69557c0a3d2f1c2fc9bed37a311fb58e72
NOTE: Setscene tasks completed
NOTE: Running task 4989 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_package)
NOTE: Running task 4990 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb:do_create_spdx)
NOTE: recipe epiphany-48.5-r0: task do_package: Started
NOTE: recipe webkitgtk-2.48.2-r0: task do_create_spdx: Started
NOTE: recipe webkitgtk-2.48.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4991 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-48.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-48.5-r0: task do_package: Succeeded
NOTE: Running task 4992 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_packagedata)
NOTE: recipe epiphany-48.5-r0: task do_packagedata: Started
NOTE: recipe epiphany-48.5-r0: task do_packagedata: Succeeded
NOTE: Running task 4993 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_package_write_ipk)
NOTE: Running task 4994 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_package_write_deb)
NOTE: recipe epiphany-48.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4995 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_create_spdx)
NOTE: recipe epiphany-48.5-r0: task do_package_write_ipk: Started
NOTE: Running task 4996 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_package_write_rpm)
NOTE: recipe epiphany-48.5-r0: task do_package_write_deb: Started
NOTE: Running task 4997 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_package_qa)
NOTE: recipe epiphany-48.5-r0: task do_create_spdx: Started
NOTE: recipe epiphany-48.5-r0: task do_package_write_rpm: Started
NOTE: recipe epiphany-48.5-r0: task do_package_qa: Started
NOTE: recipe epiphany-48.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 4998 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_create_package_spdx)
NOTE: recipe epiphany-48.5-r0: task do_create_package_spdx: Started
NOTE: recipe epiphany-48.5-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_package_qa unihash changed to 21ed116a678cbbeefe7172fa2cb5078159bac29fc51ad8222cf6b8cdc8d6684c
NOTE: recipe epiphany-48.5-r0: task do_create_package_spdx: Succeeded
NOTE: recipe epiphany-48.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe epiphany-48.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe epiphany-48.5-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 4999 of 4999 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_48.5.bb:do_build)
NOTE: Tasks Summary: Attempted 4999 tasks of which 4397 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.14.4-r0 to 0:2.14.3-r0) [version-going-backwards]
ERROR: libxml2-2.14.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6717588779745222814==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-48.3-48.5.patch"

RnJvbSAyMDVmMDAyZDA1YjFmZjZjNmU3ZjY3NzU3ZjcwMWY1MzNhZGNmMWE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTM6MTE6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0OC4zIC0+IDQ4LjUKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80OC4zLmJiID0+IGVwaXBoYW55XzQ4LjUuYmJ9ICAgICAgICAgICB8IDIgKy0KIC4uLi9maWxl
cy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggfCAy
ICstCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gg
ICAgICAgICAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWln
cmF0b3IucGF0Y2ggICAgICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2VwaXBo
YW55L3tlcGlwaGFueV80OC4zLmJiID0+IGVwaXBoYW55XzQ4LjUuYmJ9ICg5NCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ4LjMuYmIgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDguNS5iYgpzaW1pbGFyaXR5IGluZGV4
IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDgu
My5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ4LjUu
YmIKaW5kZXggNzRhMTdiZTVhNS4uODEyOWNkNzlmOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ4LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21l
L2VwaXBoYW55L2VwaXBoYW55XzQ4LjUuYmIKQEAgLTMxLDcgKzMxLDcgQEAgU1JDX1VSSSA9ICIk
e0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmltX3ZlcnNpb24oIiR7UFZ9
IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiZGEyOTUzZTdlMmI3M2JmNzQ3M2MwYTMzOTc5MTA0ZDc5MzYyNzk1
Mjk1ZWFhMGEyYTM4ZWExODg1MzdkYWYxMyIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
IjBmNjY1NTJhZDY1OTNjNzk1MmEzZGRlZTViZjUxNTY1NmM4YzQzNDg3MTA3NmQ5ZjFhOTFhN2Fm
OTM0NmIxYjQiCiAKICMgRGV2ZWxvcGVyIG1vZGUgZW5hYmxlcyBkZWJ1Z2dpbmcKIFBBQ0tBR0VD
T05GSUdbZGV2ZWxvcGVyLW1vZGVdID0gIi1EZGV2ZWxvcGVyX21vZGU9dHJ1ZSwtRGRldmVsb3Bl
cl9tb2RlPWZhbHNlIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2Zp
bGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQt
ZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKaW5kZXggOTI5ZTMzYjAxNS4uNmMwMGFiOWI0
MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVs
cC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUt
dGhlLXVzZS1vZi15ZWxwLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxNjVlZjJiZjYzNmMx
NzBkODE1NzZmN2QzZTYzNDhmYzNkNzgxODIxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA5MTA0NWVjZTQxZmFlZmJlYWMxNGI2MGQ3YjE5YjBjNjUyZTU4NmZiIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBXZWQsIDMxIEphbiAyMDE4IDE1OjUwOjM4ICswMjAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGhlbHAvbWVzb24uYnVpbGQ6IGRpc2FibGUgdGhlIHVzZSBvZiB5ZWxwCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKaW5kZXgg
ZGFjNDg1NTc1MC4uNTRhMzMwNWFhZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9l
cGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzQz
YmJiYjQxNTRiYjk2ODY3NTYyOTdhN2UyZWVjYWE3MmJiMWU5ZiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gNDYwODRkYTAzYjVmMjA0MjNhMjk0NmQ5ODhjNjhlOWVhOTMzOWM5YyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogRnJpLCAyNiBGZWIgMjAyMSAxMDoxNzo1MiAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBEb24ndCBlbmNvZGUgdGhlIGRpc3RybyBmcm9tIC9ldGMv
b3MtcmVsZWFzZSBpbnRvIHRoZQpAQCAtMTEsNyArMTEsNyBAQCBSUCAyMDIxLzIvMjYKICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIv
bWVzb24uYnVpbGQKLWluZGV4IDk2NTU0YjcuLmY1Yzk3MjcgMTAwNjQ0CitpbmRleCBkZjAzNDBj
Li44ZWM2Yzc5IDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBA
QCAtMTUsNiArMTUsNyBAQCBpZiByLnJldHVybmNvZGUoKSA9PSAwCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2gKaW5kZXggNTQwN2Q4OTNkNi4u
OGViY2RjOTk5MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVz
L21pZ3JhdG9yLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9t
aWdyYXRvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNGM1ZjZiMGI0NGI5NTlmMDE1NmNi
NzRmNzZiMmRiNDZhMDA0MmM0YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gY2E1MDQz
NzBiOWFhODkzY2VhYzIxMTQxZDhmMjRlMjhhNDc0YjY3NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPgogRGF0ZTogVGh1LCAyNSBGZWIgMjAyMSAxNDo1MjozMiArMDAwMAogU3ViamVjdDogW1BB
VENIXSBlcGlwaGFueTogRml4IHJlcHJvZHVjaWJpbGl0eSBpc3N1ZQotLSAKMi40Ny4xCgo=

--===============6717588779745222814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/epiphany/epiphany-dbg: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 5853944 to 5856440 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-dev: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-dev: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-doc: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-doc: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ia: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ia: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PKGSIZE changed from 70447 to 102843 (+46%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kab: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kab: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PKGSIZE changed from 89429 to 92926 (+4%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGSIZE changed from 44106 to 93245 (+111%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PKGSIZE changed from 83889 to 84523 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-src: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 1132482 to 1132203 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany/epiphany: PKGSIZE changed from 2106297 to 2110817 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany: PKGV changed from 48.3 [default] to 48.5 [default]
packages/core2-64-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/48/epiphany-48.3.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/48/epiphany-48.5.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/core2-64-poky-linux/epiphany: PV changed from "48.3" to "48.5"
packages/core2-64-poky-linux/epiphany: PKGV changed from 48.3 [default] to 48.5 [default]

--===============6717588779745222814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PKGSIZE changed from 70447 to 102843 (+46%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGSIZE changed from 44106 to 93245 (+111%)

--===============6717588779745222814==--

