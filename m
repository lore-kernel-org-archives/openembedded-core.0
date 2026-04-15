Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76B9F428DC
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:51 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19743.1776261880454230442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PR2/CCib;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qcVcTcFy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d917579b7-2ded8382-52ad-4495-80af-36a2f1fbe76e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261888;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dpM+wzskEY6Bkzy/oNsnu5Dm36QQblHiMja+eeQvYqw=;
	b=PR2/CCibClHJx9CqJj19bSVwZ4cSTiLCrym1yWmerlmPH7Rau9P5xxwCDP9yllzT
	CZaXeua2Qb8pHbT0zn7WFMU87OATQfd+EXKc16D3+ln+mTvMylAfDmELEUbIx+j5pmz
	KLp+GHJdM8JA74/5TUB5WIAK1rVldJ4UW+6c0a6I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261888;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dpM+wzskEY6Bkzy/oNsnu5Dm36QQblHiMja+eeQvYqw=;
	b=qcVcTcFy9+jRqEZxF+OZkGZ0ikW/kWEUcdtbkPTfzpmaZJM7sqyp3LsA38aNa3gg
	jTKO0jTmYlnFXp8N8NawzsYprNtbcD1OurvVSTXb4HJX89/EYUrh9qQPcZvJLZsg86g
	MNXFS0CUdUbsdQeSLifAgCSU0oOfxhohxRNMDOH0=
Content-Type: multipart/mixed; boundary="===============0657349279682449350=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] epiphany: upgrading to 50.3 SUCCEEDED
Message-ID: <0101019d917579b7-2ded8382-52ad-4495-80af-36a2f1fbe76e-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235272

--===============0657349279682449350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *50.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-49.7-50.3.patch
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
From 6831990e1ffcd2e5d95871d6ae3f4adec378aced Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 11:19:53 +0000
Subject: [PATCH] epiphany: upgrade 49.7 -> 50.3

---
 .../epiphany/{epiphany_49.7.bb => epiphany_50.3.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_49.7.bb => epiphany_50.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_49.7.bb b/meta/recipes-gnome/epiphany/epiphany_50.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_49.7.bb
rename to meta/recipes-gnome/epiphany/epiphany_50.3.bb
index e782855c95..d5cacc848a 100644
--- a/meta/recipes-gnome/epiphany/epiphany_49.7.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_50.3.bb
@@ -32,7 +32,7 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "3c590c6fe6d9269412a042aa479c91c3229163e2da85a94a5d24644b2ab9e3b4"
+SRC_URI[archive.sha256sum] = "032d6a41e2a079cd41b05ca7abfb3870adf0353d1566194bed8790953a894640"
 
 export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 6c00ab9b40..92359a1895 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 91045ece41faefbeac14b60d7b19b0c652e586fb Mon Sep 17 00:00:00 2001
+From 53595bb52269be8c0917a5bfedacf3f827e3b5a4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index 54a3305aaf..4b47f4bc88 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 46084da03b5f20423a2946d988c68e9ea9339c9c Mon Sep 17 00:00:00 2001
+From 5323241aa84b4a6d49d69ef6f6085a62a6b1536a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index df0340c..8ec6c79 100644
+index 7bff641..0e899f1 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 8ebcdc9991..eedc15f8aa 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From ca504370b9aa893ceac21141d8f24e28a474b674 Mon Sep 17 00:00:00 2001
+From d0cf1939d9c77b7b2393683573fa41d825927745 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
@@ -14,7 +14,7 @@ RP 2021/2/25
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/lib/ephy-profile-utils.c b/lib/ephy-profile-utils.c
-index a2f6181..5218077 100644
+index ea2ea99..13c27c8 100644
 --- a/lib/ephy-profile-utils.c
 +++ b/lib/ephy-profile-utils.c
 @@ -130,10 +130,10 @@ ephy_profile_utils_do_migration (const char *profile_directory,
-- 
2.47.1


--===============0657349279682449350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-5e4889786fddc3c59476d17c83c22b50dc6ceb28"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:5e4889786fddc3c59476d17c83c22b50dc6ceb28"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1412 Local 996 Mirrors 0 Missed 416 Current 581 (70% match, 79% complete)
done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 685 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 724 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 773 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 780 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 785 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 800 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 809 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.24.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 816 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 820 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 825 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 842 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe epiphany-50.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe libxslt-1.1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe groff-native-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 853 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxslt-1.1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 855 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 867 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 884 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_recipe_spdx_setscene)
NOTE: recipe epiphany-50.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 896 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 910 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 912 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe groff-native-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 919 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 920 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 921 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 934 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 935 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libarchive/3.8.6/temp/log.do_packagedata_setscene.1259285
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 938 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_create_recipe_spdx_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.45-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxslt-1.1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 939 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 946 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxslt-1.1.45-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 947 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-native-4.21.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 949 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_package_setscene)
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-1.1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxslt-1.1.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 957 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 959 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 964 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 965 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.24.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 968 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 974 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.21+cargo-0.95.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 984 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 987 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 993 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 998 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_package_setscene)
NOTE: Running setscene task 999 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1008 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1009 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1012 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1013 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Started
NOTE: recipe groff-native-1.24.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtasn1-native-4.21.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_package_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_package_setscene: Started
NOTE: Running setscene task 1015 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1017 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1019 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1021 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2026.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe curl-8.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe groff-native-1.24.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1025 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1039 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1043 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1048 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1054 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-native-4.21.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1057 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1063 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1066 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx_setscene)
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1068 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_spdx_setscene)
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shaderc-native-2026.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1075 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1081 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1086 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1087 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-1.1.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1094 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shaderc-native-2026.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1098 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1101 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1104 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1105 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package_setscene)
NOTE: Running setscene task 1109 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_package_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1111 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1113 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx_setscene)
NOTE: recipe libsoup-3.6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1115 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1119 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-mako-native-1.3.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsoup-3.6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1120 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe appstream-1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-native-0.4.42-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 1121 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_spdx_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_package_setscene: Started
NOTE: Running setscene task 1131 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libsecret-0.21.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-mako-native-1.3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1132 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1134 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe appstream-1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1139 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-docutils-native-0.22.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe orc-native-0.4.42-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1140 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1149 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1153 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1154 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_spdx_setscene)
NOTE: recipe libsecret-0.21.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1155 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1158 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_recipe_qa_setscene)
NOTE: recipe libical-native-3.0.20-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-native-2.44.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gtk4-4.22.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1162 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe groff-native-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe enchant2-2.8.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1163 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-native-2.44.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1164 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1168 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.47-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1175 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/cargo-c/cargo-c_0.10.21+cargo-0.95.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1180 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe enchant2-2.8.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1182 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1184 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1185 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libwpe-1.16.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1186 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1188 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1190 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_package_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1192 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1193 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx_setscene)
NOTE: recipe groff-native-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1194 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1204 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1209 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1210 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1219 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_recipe_spdx_setscene)
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1225 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1226 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1227 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1229 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata_setscene)
NOTE: recipe nghttp2-1.68.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1231 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cargo-c-native-0.10.21+cargo-0.95.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libnotify-0.8.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1234 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1235 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_create_recipe_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1237 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1238 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_recipe_qa_setscene)
NOTE: recipe libical-native-3.0.20-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1239 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1240 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1242 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/groff/groff_1.24.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1249 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1252 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1253 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: recipe libical-native-3.0.20-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1255 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-native-1.3.10-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1260 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1270 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1271 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1272 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe groff-native-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1273 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-native-1.3.10-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1275 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1277 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1278 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1279 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe groff-native-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1288 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1289 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1293 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1297 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1300 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1304 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1308 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1309 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1313 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1315 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_package_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1317 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1324 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1326 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1327 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1329 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1330 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1331 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1332 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1334 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1336 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1337 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1339 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1340 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1342 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1343 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1344 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1347 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1348 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1349 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1350 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1352 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1355 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1359 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1361 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1362 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1364 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_package_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1370 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1374 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bluez5-5.86-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1381 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1386 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1396 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1398 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libarchive-3.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1405 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1409 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1413 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1414 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_package_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1417 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1418 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1420 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1424 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1426 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1429 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1430 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1433 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1434 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1442 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1446 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe curl-8.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1448 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1451 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-native-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1452 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1454 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1457 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1459 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1461 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1463 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1467 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1468 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1475 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1479 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-native-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1480 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1481 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1482 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1484 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1485 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1486 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1487 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1490 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1494 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1497 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1499 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1502 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1503 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1508 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1509 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1511 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1514 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1516 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1517 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1518 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1519 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1521 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1522 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1524 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.56-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe icu-78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1529 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1531 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1532 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_spdx_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1533 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1534 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1535 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1538 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1539 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1542 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_package_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1543 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1544 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1545 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1546 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1547 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1552 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1553 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1555 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1556 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1559 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1561 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1562 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1563 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1564 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1565 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1567 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1572 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1573 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1576 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1579 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1580 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1581 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1582 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.94.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1584 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1586 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1588 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1591 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-mako-native-1.3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1593 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1598 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1599 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1600 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1601 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1603 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1604 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1606 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-mako-native-1.3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1608 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1609 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1610 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1612 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1613 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1614 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-12.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1615 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1617 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1619 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1620 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1621 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1623 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1624 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1626 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1628 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-native-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1629 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1630 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1632 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-native-2.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1636 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1641 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1642 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_recipe_qa_setscene)
NOTE: recipe libical-native-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1645 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1647 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-native-2.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1648 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1649 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1653 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1656 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1662 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1664 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1667 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.59-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1668 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1669 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1671 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1673 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.59-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1675 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1676 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1677 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1679 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1680 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1681 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1682 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1683 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1684 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1685 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1686 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1687 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1688 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.3.10.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1689 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1691 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1692 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1693 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markupsafe-native-3.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1697 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1699 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1702 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-mako-native-1.3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1703 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1705 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1707 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1708 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1709 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1710 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-mako-native-1.3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1714 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1717 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1718 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1719 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1721 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1722 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1723 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1724 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1725 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1730 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1731 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.341.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1734 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1735 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1736 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1738 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1740 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_package_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1742 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1743 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1745 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1747 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1748 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1749 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1752 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1753 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1756 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1757 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.341.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1759 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1760 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.19.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1761 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1762 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1763 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1765 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1766 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1767 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1769 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxml2-2.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1774 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1776 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1778 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1779 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_packagedata_setscene)
NOTE: Running setscene task 1780 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1782 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1784 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1785 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1786 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1788 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1789 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1792 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1806 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.56.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1809 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1811 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1812 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1813 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1815 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1816 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1817 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1818 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1819 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1820 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1825 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1826 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1828 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1829 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1831 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1833 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1834 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1836 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 894 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 896 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1840 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: Running task 995 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: Running task 996 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_write_config)
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1842 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_fetch: Started
NOTE: Running task 1032 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1093 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1099 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_fetch)
NOTE: Running task 1101 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_fetch)
NOTE: Running task 1104 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_fetch)
NOTE: Running task 1107 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: Running task 1117 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_fetch)
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1176 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1177 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: Running task 1191 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_fetch: Started
NOTE: recipe pango-1.57.0-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: Running task 1213 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: Running task 1221 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_recipe_qa)
NOTE: Running task 1225 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1253 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_write_config)
NOTE: Running task 1254 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1261 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_write_config)
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_recipe_qa: Started
NOTE: recipe libgpg-error-1.59-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_fetch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_write_config: Started
NOTE: Running task 1283 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1292 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1305 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_fetch)
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_write_config: Succeeded
NOTE: Running task 1319 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Started
NOTE: Running task 1375 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1388 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_fetch)
NOTE: recipe mesa-2_26.0.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe mesa-2_26.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1413 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_fetch)
NOTE: Running task 1414 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe libgpg-error-1.59-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_fetch: Succeeded
NOTE: Running task 1415 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_unpack)
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_fetch: Started
NOTE: recipe bluez5-5.86-r0: task do_fetch: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_unpack: Started
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: Running task 1416 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: recipe pango-1.57.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1417 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_unpack)
NOTE: Running task 1418 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.59-r0: task do_unpack: Succeeded
NOTE: Running task 1419 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_patch)
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe pango-1.57.0-r0: task do_unpack: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1420 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1421 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libgpg-error-1.59-r0: task do_patch: Started
NOTE: recipe bluez5-5.86-r0: task do_fetch: Succeeded
NOTE: Running task 1422 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_write_config)
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Succeeded
NOTE: Running task 1423 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_unpack)
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1424 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_patch)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1425 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: recipe pango-1.57.0-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Started
NOTE: Running task 1426 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_patch)
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.59-r0: task do_patch: Succeeded
NOTE: Running task 1429 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe librsvg-2.61.3-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_patch: Started
NOTE: Running task 1445 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_write_config)
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Started
NOTE: recipe pango-1.57.0-r0: task do_patch: Succeeded
NOTE: Running task 1446 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Succeeded
NOTE: Running task 1447 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_patch)
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_patch: Succeeded
NOTE: Running task 1448 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: Running task 1449 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_write_config: Started
NOTE: recipe pango-1.57.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_write_config: Succeeded
NOTE: Running task 1450 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1476 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch unihash changed to bb1ba8e913f38953c8512d41b8ddf04bef8b64cb33950078fa49075fbce4713a
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_deploy_source_date_epoch unihash changed to 66162152275d4d00e1507c398cfb40a19256a828e574051913476ae0a30aa314
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_deploy_source_date_epoch unihash changed to e7e37f108102f340ba85dabccb1b8266e489be9945b3927c5a76ef01a1aae21e
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch unihash changed to 136350031d83ff80d2178fe7f5bb53f40f8ba9323098440c9eeaf382a9eb415c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch unihash changed to f067a1a02e716fb8a003707af091d84c90b8c7b284e864ee06a25fe708d74fe5
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Succeeded
NOTE: Running task 1484 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_unpack)
NOTE: Running task 1485 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_unpack)
NOTE: Running task 1486 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: Running task 1517 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_unpack)
NOTE: Running task 1526 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1527 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_fetch)
NOTE: Running task 1529 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_fetch)
NOTE: Running task 1554 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_fetch)
NOTE: Running task 1559 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_fetch)
NOTE: Running task 1564 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_unpack: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_fetch: Started
NOTE: recipe bluez5-5.86-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Started
NOTE: Running task 1565 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_unpack)
NOTE: recipe mesa-2_26.0.3-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Succeeded
NOTE: Running task 1566 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_patch)
NOTE: recipe xkeyboard-config-2.47-r0: task do_unpack: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 1578 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_fetch)
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: Running task 1579 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.86-r0: task do_unpack: Succeeded
NOTE: Running task 1580 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_patch)
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Succeeded
NOTE: Running task 1581 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.42-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1582 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_patch)
NOTE: recipe mesa-2_26.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1583 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: Running task 1584 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.86-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_patch: Succeeded
NOTE: Running task 1586 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: recipe bluez5-5.86-r0: task do_patch: Succeeded
NOTE: Running task 1587 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_deploy_source_date_epoch)
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1590 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_fetch)
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch unihash changed to 9dd63fc23f766eb264b4568db86fb2a9524594bc06432349977495fdc17231f5
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_fetch: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.12.1-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_fetch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.86-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch unihash changed to c1eecc43650ea01d8c3a6a27fee78b4da6061c95264b05dee8c0e0b53747141b
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_deploy_source_date_epoch unihash changed to 3b887ae10056636cedf350f893eab74cb2d800980cf7a240c29867ef530d8077
NOTE: Running setscene task 1780 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1782 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1837 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1839 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1845 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1846 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1592 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_patch)
NOTE: Running task 1593 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_unpack)
NOTE: Running task 1594 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_unpack)
NOTE: Running task 1595 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_unpack)
NOTE: Running task 1596 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_unpack)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_unpack: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1597 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1849 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1851 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Succeeded
NOTE: Running task 1598 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch)
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 1599 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_patch)
NOTE: Running task 1600 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_patch)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1601 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe harfbuzz-12.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 1854 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1856 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1859 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.6-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Succeeded
NOTE: Running task 1609 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_patch)
NOTE: recipe glib-2.0-1_2.88.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1610 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_26.0.3-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 1616 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_patch)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1617 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe harfbuzz-12.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_deploy_source_date_epoch unihash changed to a6396debd7fb3fbdf8532a8d3ecee0ca7de077650671e6aa00cecf8b2e8506b0
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch unihash changed to a540756ea1f5722a8e591a1d37eb9781525738d0574b64ac91c3469d79fc12cd
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch unihash changed to 14e5fcbcb822c6994e8b3ead4634e2096bf04c5bc70e1b7a4d5aa59ceb4e22c3
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch unihash changed to eacb331d9d5e419a6a0e22481adfd54328191ccc169530c082682382abd64f0f
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1748 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1749 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1754 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1755 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1756 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1757 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1759 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1761 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1764 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1765 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1767 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1769 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1772 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1773 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1774 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1775 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1776 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1780 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1782 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1784 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1785 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1786 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1789 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1798 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1811 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1818 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1819 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1820 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1828 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/xz/5.8.2/temp/log.do_packagedata_setscene.1271408
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1836 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_package_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1857 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1866 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1870 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1871 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1875 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1902 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1904 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1907 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1916 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1917 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_package_setscene: Started
NOTE: Running setscene task 1919 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1920 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1924 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1928 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1932 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1936 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1938 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1940 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe gtk-doc-native-1.35.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1825 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1944 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1944 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1947 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: Running task 1948 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_unpack)
NOTE: Running task 1950 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_unpack)
NOTE: Running task 1967 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1970 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_fetch)
NOTE: Running task 1971 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_fetch)
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1977 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_unpack)
NOTE: Running task 1978 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: Running task 1980 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_fetch)
NOTE: Running task 1983 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_unpack)
NOTE: Running task 1993 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: recipe flac-1.5.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Started
NOTE: Running task 1999 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe orc-0.4.42-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_unpack: Started
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2000 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_fetch)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2001 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_unpack: Succeeded
NOTE: Running task 2002 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2003 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_patch)
NOTE: Running task 2004 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2005 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_deploy_source_date_epoch)
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Started
NOTE: recipe flac-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2006 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe orc-0.4.42-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.5.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2007 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_write_config)
NOTE: recipe orc-0.4.42-r0: task do_patch: Succeeded
NOTE: Running task 2009 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2010 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_write_config: Started
NOTE: Running task 2015 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe flac-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2020 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_unpack)
NOTE: recipe libxmlb-0.3.25-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_deploy_source_date_epoch unihash changed to 0e6dd4b92779ee7f9d4aef6c08a153cd5f194300c4294b28a029766f7a5a9008
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_deploy_source_date_epoch unihash changed to a43a08ece7e6936d9ec387b5e07db4ea8a47a7d11000e0febd5d481489cd481b
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch unihash changed to 31d32bf3418c95d5c02e210d0f86e37a847eae7b5ed2d870bf65f249ca398d3d
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1866 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1872 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1926 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1931 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 2021 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_patch)
NOTE: Running task 2022 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_patch)
NOTE: Running task 2023 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: Running task 2024 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 2025 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_patch)
NOTE: Running task 2026 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_recipe_qa)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_recipe_qa: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_patch: Succeeded
NOTE: Running task 2033 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_fetch)
NOTE: Running task 2038 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_write_config)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1951 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1953 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running setscene task 1954 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1956 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 2039 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Started
NOTE: Running task 2040 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_fetch)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2041 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_write_config: Succeeded
NOTE: Running task 2049 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2057 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_fetch: Succeeded
NOTE: Running task 2063 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: Running task 2065 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: Running task 2066 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.2-r0: task do_fetch: Started
NOTE: Running setscene task 1958 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_patch: Succeeded
NOTE: Running task 2094 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2095 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2096 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_unpack)
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_deploy_source_date_epoch unihash changed to 7627dcc1f3db72a0159690268162ea5a88313780d574bda28f12b8fde6a2e444
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Started
NOTE: recipe sbc-2.2-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch unihash changed to c4a7de96a9bb7389e1b445fac5e770cc45cdb08816f3d741d7188ef1628fcca1
NOTE: Running setscene task 1890 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_deploy_source_date_epoch unihash changed to 736755b861dbf7577e92993c54603a9b8791e85ab3444fc737147dd073400d6e
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1885 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1963 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 2097 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_patch)
NOTE: Running task 2098 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_unpack)
NOTE: Running task 2099 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_patch)
NOTE: Running task 2100 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_unpack)
NOTE: Running task 2101 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2104 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_write_config)
NOTE: Running task 2106 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2107 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2112 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_recipe_qa)
NOTE: Running task 2114 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2118 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_fetch)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.13-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.42-r0: task do_write_config: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_recipe_qa: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_patch: Succeeded
NOTE: Running task 2123 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_unpack)
NOTE: Running task 2124 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe orc-0.4.42-r0: task do_write_config: Succeeded
NOTE: Running task 2136 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1965 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1966 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1967 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.2-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sbc-2.2-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch unihash changed to 7f1872850ef448ee2d1a107118d04c6427fe9b11202e704d9371ab678d2b5a91
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch unihash changed to 24ba60406585344d1350a9f311f0fc2e0634045715030ca49fa0f99972b870ee
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch unihash changed to 28bfd3348bccd791291e882f72f38b3a1f856323f3711b7825f5f6688cd82994
NOTE: recipe libxmlb-0.3.25-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1901 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1902 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1905 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1908 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1912 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 2139 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_patch)
NOTE: Running task 2140 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_unpack)
NOTE: Running task 2141 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_patch)
NOTE: Running task 2142 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_unpack)
NOTE: Running task 2143 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_patch)
NOTE: Running task 2144 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_fetch)
NOTE: Running task 2145 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_patch)
NOTE: Running task 2146 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: Running task 2148 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Started
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Started
NOTE: recipe sbc-2.2-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2149 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2150 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.51-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2158 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2161 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_write_config)
NOTE: Running task 2163 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2167 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_fetch)
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2168 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_fetch)
NOTE: Running task 2169 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1983 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1984 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: Running setscene task 1986 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2170 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_patch)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_write_config: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_fetch: Started
NOTE: Running task 2171 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_fetch)
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Started
NOTE: recipe nettle-3.10.2-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2194 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2195 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2209 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Started
NOTE: Running task 2210 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 2217 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_unpack)
NOTE: recipe libarchive-3.8.6-r0: task do_fetch: Started
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2219 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_fetch)
NOTE: recipe libarchive-3.8.6-r0: task do_fetch: Succeeded
NOTE: Running task 2231 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_deploy_source_date_epoch)
NOTE: Running task 2232 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_write_config)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: Running task 2233 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch unihash changed to 60208da05b72ebc099a80a4ac6494b2c5172c8edb2de9a53e77089b607eb28b7
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_unpack: Started
NOTE: recipe gtk4-4.22.1-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_fetch: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_write_config: Started
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch unihash changed to 85819d071d9c6f524ecaecdb6ff5d8ea039f769e2688a7f3f860b451e72843e8
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_deploy_source_date_epoch unihash changed to 90f34b45a2a937fce7b90dbac77a672be7ef2f32fc47f22ed8444913c6b2c2cf
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch unihash changed to 265e7b3015d8766e8641df65e1d48d4c36c23b694998b1b58be4f7bbf4822843
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch unihash changed to 9042d78ffa5870baf86b2fd57d44a9ad16a63710bf9969910cc6750aa600cc94
NOTE: recipe libxmlb-0.3.25-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_deploy_source_date_epoch unihash changed to 5c9884c54385addf7d5c7da0058f6bf0c7bce0563997bf5ecbcf819a0154f8dc
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch unihash changed to 9d7a4b67d32b4ee63c0e74ae9461ebfc3bfc9fcbbf9070dbb0f4a5482bee5df8
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_unpack: Succeeded
NOTE: recipe gcc-cross-arm-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1976 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running task 2244 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 2245 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_patch)
NOTE: Running task 2248 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_unpack)
NOTE: Running task 2249 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_recipe_spdx)
NOTE: Running task 2257 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_fetch)
NOTE: Running task 2265 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_fetch)
NOTE: Running task 2273 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2274 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2278 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_write_config)
NOTE: Running task 2283 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_unpack)
NOTE: Running task 2284 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_unpack)
NOTE: Running task 2285 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_unpack)
NOTE: Running task 2295 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_patch: Started
NOTE: recipe libwpe-1.16.3-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_fetch: Started
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.16.3-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2296 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_write_config: Started
NOTE: recipe nettle-3.10.2-r0: task do_unpack: Started
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.8.6-r0: task do_unpack: Started
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_write_config: Succeeded
NOTE: Running task 2297 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2301 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_unpack)
NOTE: Running task 2302 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 2303 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_patch)
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Started
NOTE: Running setscene task 1989 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe gtk4-4.22.1-r0: task do_unpack: Started
NOTE: Running setscene task 1991 of 1993 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2304 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_patch)
NOTE: Running task 2306 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_patch)
NOTE: recipe nettle-3.10.2-r0: task do_patch: Started
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2316 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_deploy_source_date_epoch unihash changed to 77df565be99352dcc168daa2e8cec706a2ebd6aa830ddc9a73241e2c713f333b
NOTE: recipe binutils-cross-arm-2.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Started
NOTE: recipe libarchive-3.8.6-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch unihash changed to ac7756db6836583e070d78f3a78cf018cf33cf1493bb0684abe9f8ed18ee9e86
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch unihash changed to 4f9d13590d3c80e4177b4a63bce550a56674fbe0a6d588e2a8e971eee4720d3a
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_patch: Succeeded
NOTE: Running task 2322 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_patch)
NOTE: Running task 2323 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_unpack)
NOTE: Running task 2325 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_fetch)
NOTE: recipe binutils-cross-arm-2.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2332 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_create_recipe_spdx)
NOTE: Running setscene task 1992 of 1993 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2337 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_recipe_spdx)
NOTE: Running task 2342 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx)
NOTE: Running task 2343 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2345 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2346 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_recipe_spdx)
NOTE: Running task 2347 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2348 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_write_config)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libwpe-1.16.3-r0: task do_unpack: Started
NOTE: recipe libpsl-0.21.5-r0: task do_fetch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: Running task 2349 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.68.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2350 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_unpack)
NOTE: Running task 2351 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_patch)
NOTE: recipe libwpe-1.16.3-r0: task do_unpack: Succeeded
NOTE: Running task 2352 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_write_config: Succeeded
NOTE: Running task 2356 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_recipe_spdx)
NOTE: Running task 2359 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_unpack: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe libwpe-1.16.3-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe libwpe-1.16.3-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 2710 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.68.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2816 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2832 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch unihash changed to df565cc150da9ad44a6e90d5f273c5ff654a5f8dcfcd3c8c3451a6e9b1adb457
NOTE: recipe gtk4-4.22.1-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_deploy_source_date_epoch unihash changed to ea7d1af69bd20eacb114257902c0423f308f69a5874cfd7d41f260c6f6bbcd48
NOTE: recipe libpsl-0.21.5-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 8ae1ddcb9257e5872e1c4064bf288667ad39f7f9cdc661481ce515373c37e872 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '5bbc043a319376c618de8227af12f52b72bf1f86db00e575ab69041b524e692d', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '8ae1ddcb9257e5872e1c4064bf288667ad39f7f9cdc661481ce515373c37e872'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 5bbc043a319376c618de8227af12f52b72bf1f86db00e575ab69041b524e692d -> 8ae1ddcb9257e5872e1c4064bf288667ad39f7f9cdc661481ce515373c37e872 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 2835 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2836 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2837 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2860 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata)
NOTE: Running task 2912 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2944 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-12.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2945 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2985 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3011 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3013 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3031 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: Running task 3040 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3065 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3068 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3069 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_configure)
NOTE: recipe mesa-2_26.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3070 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_configure)
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3071 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_configure)
NOTE: recipe xz-5.8.2-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3085 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3086 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_configure)
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Started
NOTE: Running task 3087 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_configure)
NOTE: Running task 3088 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_configure)
NOTE: recipe libogg-1.3.6-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3089 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_configure: Started
NOTE: Running task 3090 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_configure)
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3091 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_configure)
NOTE: Running task 3092 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3093 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_configure)
NOTE: Running task 3094 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_configure)
NOTE: recipe mesa-2_26.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.47-r0: task do_configure: Started
NOTE: Running task 3095 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe harfbuzz-12.3.2-r0: task do_configure: Started
NOTE: recipe orc-0.4.42-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_configure: Started
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3096 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_configure)
NOTE: recipe mesa-2_26.0.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe libxv-1.0.13-r0: task do_configure: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3097 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe mesa-2_26.0.3-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_configure: Succeeded
NOTE: Running task 3098 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_compile)
NOTE: recipe xkeyboard-config-2.47-r0: task do_compile: Started
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Succeeded
NOTE: Running task 3099 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_compile)
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_configure: Succeeded
NOTE: Running task 3100 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: Running task 3101 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe orc-0.4.42-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_compile: Succeeded
NOTE: Running task 3102 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_install)
NOTE: recipe xkeyboard-config-2.47-r0: task do_install: Started
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Succeeded
NOTE: Running task 3103 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_install)
NOTE: recipe fribidi-1.0.16-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_install: Succeeded
NOTE: Running task 3104 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_install: Succeeded
NOTE: Running task 3105 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-12.3.2-r0: task do_configure: Succeeded
NOTE: Running task 3106 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_compile)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3107 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-12.3.2-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3108 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package)
NOTE: recipe fribidi-1.0.16-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 3109 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_configure)
NOTE: Running task 3110 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe orc-0.4.42-r0: task do_compile: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Started
NOTE: Running task 3111 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe orc-0.4.42-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_configure: Succeeded
NOTE: Running task 3112 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.42-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 3113 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3114 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_compile)
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_compile: Started
NOTE: recipe orc-0.4.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 3116 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3117 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata)
NOTE: Running task 3118 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe libxmlb-0.3.25-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata unihash changed to ec573fd9f5cb9465f7a7183e7170a8d2ebdaa02a9374ac6f3a281daf72351865
NOTE: Setscene tasks completed
NOTE: Running task 3119 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe libxmlb-0.3.25-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3120 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: Running task 3121 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxmlb-0.3.25-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3122 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_configure)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_configure: Succeeded
NOTE: Running task 3123 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_compile)
NOTE: recipe libogg-1.3.6-r0: task do_configure: Succeeded
NOTE: Running task 3124 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: Running task 3125 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Started
NOTE: Running task 3126 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_compile)
NOTE: recipe libogg-1.3.6-r0: task do_compile: Started
NOTE: recipe mesa-2_26.0.3-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Succeeded
NOTE: Running task 3127 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_compile)
NOTE: Running task 3128 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_compile: Started
NOTE: Running task 3129 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxv-1.0.13-r0: task do_configure: Succeeded
NOTE: Running task 3130 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_compile)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_configure: Succeeded
NOTE: Running task 3131 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_compile)
NOTE: recipe libxv-1.0.13-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_compile: Started
NOTE: recipe libogg-1.3.6-r0: task do_compile: Succeeded
NOTE: Running task 3132 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Succeeded
NOTE: Running task 3133 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_install)
NOTE: recipe libogg-1.3.6-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Succeeded
NOTE: Running task 3134 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_compile)
NOTE: recipe libxv-1.0.13-r0: task do_compile: Succeeded
NOTE: Running task 3135 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_install)
NOTE: recipe libxv-1.0.13-r0: task do_install: Started
NOTE: recipe vala-0.56.18-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Succeeded
NOTE: Running task 3146 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.6-r0: task do_install: Succeeded
NOTE: Running task 3147 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.13-r0: task do_install: Succeeded
NOTE: Running task 3148 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_package)
NOTE: recipe libogg-1.3.6-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3150 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot)
NOTE: Running task 3151 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_install)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3152 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_configure: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3153 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3154 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: Running task 3155 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_configure)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3156 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3157 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe flac-1.5.0-r0: task do_configure: Started
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3158 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_configure)
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure: Succeeded
NOTE: Running task 3159 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3160 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile: Started
NOTE: recipe libogg-1.3.6-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_compile: Succeeded
NOTE: Running task 3161 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_install)
NOTE: Running task 3162 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Succeeded
NOTE: Running task 3163 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_install)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata unihash changed to 41332f40b6af72caacd20241582c918dbad122ff9446a6631735e0081bc30d58
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3166 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_package)
NOTE: Running task 3167 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.47-r0: task do_package: Started
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_install: Succeeded
NOTE: Running task 3168 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot: Started
NOTE: Running task 3169 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot)
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3170 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_package)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3171 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_configure)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3172 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot)
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3173 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_compile: Succeeded
NOTE: Running task 3174 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_install)
NOTE: recipe libxi-1_1.8.2-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 8ae1ddcb9257e5872e1c4064bf288667ad39f7f9cdc661481ce515373c37e872 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f66e6dc867750d552bd248f043f799aed9189dfdc29b0dd848329b11c9b2a2a4', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '8ae1ddcb9257e5872e1c4064bf288667ad39f7f9cdc661481ce515373c37e872'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed f66e6dc867750d552bd248f043f799aed9189dfdc29b0dd848329b11c9b2a2a4 -> 8ae1ddcb9257e5872e1c4064bf288667ad39f7f9cdc661481ce515373c37e872 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3177 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: Running task 3178 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_install: Succeeded
NOTE: Running task 3179 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3180 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package)
NOTE: recipe libxi-1_1.8.2-r0: task do_package: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3181 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to 0de30892463e2b910bfbe654c6b85b5fa619ed8b4ba1468b05a8ef8a24f6b9fe
NOTE: Setscene tasks completed
NOTE: Running task 3182 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3183 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_configure)
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Succeeded
NOTE: Running task 3184 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata unihash changed to 554c589d0f7294c43b141832e8f30f3d5b42fcb439f281e9bcde0455ba1e2477
NOTE: Setscene tasks completed
NOTE: Running task 3186 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_patch)
NOTE: recipe gtk4-4.22.1-r0: task do_patch: Started
NOTE: recipe gtk4-4.22.1-r0: task do_patch: Succeeded
NOTE: Running task 3190 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_patch)
NOTE: recipe nghttp2-1.68.1-r0: task do_patch: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_patch: Succeeded
NOTE: Running task 3197 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_configure_ptest_base)
NOTE: recipe libxmlb-0.3.25-r0: task do_configure_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: recipe libxmlb-0.3.25-r0: task do_configure_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3198 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: Running task 3199 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_package: Succeeded
NOTE: Running task 3200 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile: Succeeded
NOTE: Running task 3201 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_compile_ptest_base)
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3202 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_install)
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3203 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_compile)
NOTE: recipe libxi-1_1.8.2-r0: task do_package: Succeeded
NOTE: Running task 3204 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata)
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_compile: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_packagedata unihash changed to 73d788881519ecfa52eda71ce71ff71dccd00d3025edff7140f518e792f86e06
NOTE: Setscene tasks completed
NOTE: Running task 3205 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_compile_ptest_base)
NOTE: Running task 3206 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Running task 3207 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata unihash changed to da4d7be41987ef9a432557b4f1477c67bf77e9ae628fd44e28036aef2798feae
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3208 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_install)
NOTE: Running task 3209 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3210 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3212 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3213 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install: Succeeded
NOTE: Running task 3214 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_install_ptest_base)
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3215 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_install)
NOTE: Running task 3216 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.2.0-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3217 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_install: Succeeded
NOTE: Running task 3218 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_install_ptest_base: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3219 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_package)
NOTE: Running task 3220 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package: Started
NOTE: recipe libtheora-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3221 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3222 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_package: Succeeded
NOTE: Running task 3223 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 3224 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3226 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_configure)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3232 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_package)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata unihash changed to f6d2f1c88b1b533a07fa84471c8e7c8e82098154f1277f3c0027d719704b4744
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3239 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_unpack)
NOTE: recipe libpsl-0.21.5-r0: task do_unpack: Started
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Succeeded
NOTE: Running task 3240 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_compile)
NOTE: recipe flac-1.5.0-r0: task do_configure: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 3241 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_compile)
NOTE: recipe flac-1.5.0-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.5-r0: task do_unpack: Succeeded
NOTE: Running task 3242 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk+3-3.24.51-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 3243 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: recipe libxmlb-0.3.25-r0: task do_compile: Succeeded
NOTE: Running task 3244 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_deploy_source_date_epoch unihash changed to 9f281ae700dd469b716e59a81d556f783b322f5e26b0182948194491eff91d5f
NOTE: Setscene tasks completed
NOTE: Running task 3245 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3246 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_patch)
NOTE: Running task 3249 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_recipe_spdx)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_compile: Succeeded
NOTE: Running task 3250 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_install)
NOTE: recipe libpsl-0.21.5-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_install: Started
NOTE: recipe libpsl-0.21.5-r0: task do_patch: Succeeded
NOTE: Running task 3251 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3256 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_recipe_spdx)
NOTE: recipe pango-1.57.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe pango-1.57.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3257 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_write_config)
NOTE: recipe gtk+3-3.24.51-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_write_config: Succeeded
NOTE: Running task 3260 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3261 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe libsoup-3.6.6-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3262 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.6.6-r0: task do_fetch: Succeeded
NOTE: Running task 3263 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: Running task 3268 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_fetch)
NOTE: Running task 3269 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.42-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata unihash changed to 45e36c702de50c18c06c997a253442c282a0906bbf73c0cf824e103196a9e01c
NOTE: recipe libfyaml-0.9.4-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3270 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_compile)
NOTE: Running task 3271 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_package)
NOTE: Running task 3272 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package: Started
NOTE: recipe orc-0.4.42-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3273 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_fetch)
NOTE: recipe libfyaml-0.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 3279 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8.2-r0: task do_fetch: Started
NOTE: recipe orc-0.4.42-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_packagedata unihash changed to 08a31115c8462404fc9b0f85711e68055001e84807043e35da88216a182767bb
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: Running task 3282 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_write_config)
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Started
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_deploy_source_date_epoch unihash changed to 84c49ef177a7f664bbeede84ddf8f910d84f50d0c80817e66d7b29cd998fc153
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3283 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_install)
NOTE: Running task 3284 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3297 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Started
NOTE: recipe json-glib-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3298 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3299 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package)
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3300 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Succeeded
NOTE: Running task 3301 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_configure)
NOTE: recipe json-glib-1.10.8-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3302 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_configure)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3314 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_package: Succeeded
NOTE: Running task 3315 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata unihash changed to a72525fe8a983b0c5d7400964a4e7465161fca4a986548d01063d1485aae4be6
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3316 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3352 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_deploy_source_date_epoch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_packagedata unihash changed to 4ec40053137b434b3f94f1ffa21652ead90e05f0a94528262ca7356f482db275
NOTE: recipe gtk4-4.22.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3353 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata)
NOTE: Running task 3361 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata)
NOTE: recipe gtk4-4.22.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_deploy_source_date_epoch unihash changed to f42625c52a47e4733db64a483b07b04f5e65106cf03709ee5e26b21d18244513
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 3362 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_create_recipe_spdx)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata unihash changed to 4992744af8bc81c1abc459e2cc2d96a98bc4c57ee60ef9596ebe174da16b40e2
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_create_recipe_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata unihash changed to 2b76739be84daf9e45d453ad2dcb1b337fcde460d76c274691076a5c0c64598a
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3363 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_install)
NOTE: Running task 3364 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: Running task 3368 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.22.1.bb:do_write_config)
NOTE: Running task 3382 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_recipe_spdx)
NOTE: Running task 3388 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.22.1-r0: task do_write_config: Started
NOTE: Running task 3389 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_compile)
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_install: Started
NOTE: recipe gtk4-4.22.1-r0: task do_write_config: Succeeded
NOTE: Running task 3395 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_create_recipe_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_compile: Started
NOTE: Running task 3396 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx: Started
NOTE: recipe librsvg-2.61.3-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3397 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3398 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_unpack)
NOTE: recipe aspell-0.60.8.2-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3408 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_recipe_spdx)
NOTE: Running task 3409 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb:do_create_recipe_spdx)
NOTE: Running task 3410 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_unpack)
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Started
NOTE: recipe libsoup-3.6.6-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3411 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 3413 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_patch)
NOTE: Running task 3420 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_recipe_qa)
NOTE: recipe aspell-0.60.8.2-r0: task do_unpack: Started
NOTE: recipe libsoup-3.6.6-r0: task do_unpack: Succeeded
NOTE: Running task 3421 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_patch)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_compile: Succeeded
NOTE: Running task 3422 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_install)
NOTE: recipe libfyaml-0.9.4-r0: task do_patch: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.15.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3424 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_fetch)
NOTE: Running task 3425 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_patch)
NOTE: recipe flac-1.5.0-r0: task do_compile: Succeeded
NOTE: recipe libsoup-3.6.6-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3426 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install)
NOTE: Running task 3427 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_fetch)
NOTE: recipe libfyaml-0.9.4-r0: task do_patch: Succeeded
NOTE: Running task 3428 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_fetch)
NOTE: recipe libsoup-3.6.6-r0: task do_patch: Succeeded
NOTE: Running task 3430 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_fetch)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_install: Started
NOTE: recipe aspell-0.60.8.2-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.8-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.7-r0: task do_fetch: Started
NOTE: recipe enchant2-2.8.15-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_fetch: Started
NOTE: Running task 3431 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_fetch)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_fetch: Succeeded
NOTE: Running task 3432 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_fetch)
NOTE: recipe aspell-0.60.8.2-r0: task do_patch: Succeeded
NOTE: Running task 3433 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_fetch)
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_fetch: Started
NOTE: recipe appstream-1.1.2-r0: task do_fetch: Started
NOTE: recipe appstream-1.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 3440 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_compile_ptest_base)
NOTE: recipe libxmlb-0.3.25-r0: task do_compile_ptest_base: Started
NOTE: recipe libsecret-0.21.7-r0: task do_fetch: Succeeded
NOTE: Running task 3441 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_package)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_install: Succeeded
NOTE: Running task 3442 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_populate_sysroot)
NOTE: recipe libxmlb-0.3.25-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3443 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_install)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.2.0-r0: task do_package: Started
NOTE: Running task 3444 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_packagedata)
NOTE: recipe libwebp-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 3445 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.8.8-r0: task do_fetch: Succeeded
NOTE: Running task 3446 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_package)
NOTE: recipe libxmlb-0.3.25-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.8.15-r0: task do_fetch: Succeeded
NOTE: Running task 3468 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_recipe_spdx)
NOTE: recipe libxv-1.0.13-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3473 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_package: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3474 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3475 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_package)
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3476 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_packagedata: Started
NOTE: recipe libwebp-1.6.0-r0: task do_package: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.16.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_deploy_source_date_epoch unihash changed to 98e7e3cee656fe1a03b9e5aeec327f95499440cc981304a62d2898e66e83a329
NOTE: recipe libxmlb-0.3.25-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3477 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3481 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_generate_toolchain_file)
NOTE: recipe nghttp2-1.68.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3486 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_generate_toolchain_file)
NOTE: recipe libpsl-0.21.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_packagedata: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_generate_toolchain_file: Started
NOTE: Running task 3487 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.68.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libwpe-1.16.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 3488 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_configure: Succeeded
NOTE: recipe nghttp2-1.68.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3492 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_compile)
NOTE: recipe nghttp2-1.68.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3494 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3500 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_configure_ptest_base)
NOTE: recipe webkitgtk-2.50.6-r0: task do_recipe_qa: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_compile: Started
NOTE: recipe libpsl-0.21.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_deploy_source_date_epoch unihash changed to 1d3c9b68c800273faea9ab4a4e3567ae23d2213d281b57b574fae318bcf11a2d
NOTE: recipe json-glib-1.10.8-r0: task do_configure_ptest_base: Started
NOTE: recipe webkitgtk-2.50.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3501 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_fetch)
NOTE: Running task 3506 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb:do_recipe_qa)
NOTE: Running task 3507 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_compile)
NOTE: recipe nghttp2-1.68.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3508 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_recipe_qa: Started
NOTE: recipe webkitgtk-2.50.6-r0: task do_fetch: Started
NOTE: recipe webkitgtk-2.50.6-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 3513 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: Running task 3522 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_unpack)
NOTE: recipe nghttp2-1.68.1-r0: task do_configure: Started
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3523 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb:do_fetch)
NOTE: recipe libpsl-0.21.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnotify-0.8.8-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3524 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_fetch: Started
NOTE: recipe libnotify-0.8.8-r0: task do_unpack: Succeeded
NOTE: Running task 3525 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_unpack)
NOTE: recipe libpsl-0.21.5-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.7-r0: task do_unpack: Started
NOTE: recipe libsecret-0.21.7-r0: task do_unpack: Succeeded
NOTE: Running task 3526 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_unpack)
NOTE: recipe flac-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 3527 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot)
NOTE: recipe enchant2-2.8.15-r0: task do_unpack: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.8.15-r0: task do_unpack: Succeeded
NOTE: Running task 3528 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_package)
NOTE: recipe flac-1.5.0-r0: task do_package: Started
NOTE: recipe libtheora-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3529 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata)
NOTE: recipe harfbuzz-12.3.2-r0: task do_compile: Succeeded
NOTE: Running task 3530 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_install)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3531 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.13-r0: task do_package: Succeeded
NOTE: Running task 3532 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata)
NOTE: recipe harfbuzz-12.3.2-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_fetch: Succeeded
NOTE: Running task 3534 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_unpack)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_unpack: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata unihash changed to 8f0dc3762872a712f3c1e4e2bd7854d908ba00ed4c9d7e4c21274ed0b8853f25
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_unpack: Succeeded
NOTE: Running task 3535 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_configure)
NOTE: Running task 3536 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_unpack)
NOTE: Running task 3537 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_unpack)
NOTE: recipe p11-kit-0.26.2-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_packagedata: Succeeded
NOTE: Running task 3538 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_unpack)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata unihash changed to e3afe005d362a849d718ee452ead4653c974fb37e1dcf6e107308c6422f729db
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Started
NOTE: recipe appstream-1.1.2-r0: task do_unpack: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 3545 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_patch)
NOTE: Running task 3546 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_patch)
NOTE: recipe appstream-1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 3547 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_patch)
NOTE: recipe libnotify-0.8.8-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.7-r0: task do_patch: Started
NOTE: recipe libnotify-0.8.8-r0: task do_patch: Succeeded
NOTE: Running task 3549 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_patch)
NOTE: recipe enchant2-2.8.15-r0: task do_patch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_install: Succeeded
NOTE: recipe libsecret-0.21.7-r0: task do_patch: Succeeded
NOTE: Running task 3550 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_patch)
NOTE: Running task 3551 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_populate_sysroot)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_patch: Started
NOTE: recipe enchant2-2.8.15-r0: task do_patch: Succeeded
NOTE: Running task 3552 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_package)
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot: Started
NOTE: Running task 3553 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_patch)
NOTE: recipe harfbuzz-12.3.2-r0: task do_package: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 3554 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_recipe_spdx)
NOTE: recipe appstream-1.1.2-r0: task do_patch: Started
NOTE: recipe libwebp-1.6.0-r0: task do_package: Succeeded
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 3565 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata)
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3566 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_configure: Succeeded
NOTE: Running task 3567 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_compile)
NOTE: recipe appstream-1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 3569 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.2.bb:do_create_recipe_spdx)
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3579 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_recipe_spdx)
NOTE: recipe nghttp2-1.68.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 79eb3794c03373e51a8ba98fec87c7f4ed777249a90516c8a56878a079e419ee
NOTE: recipe gstreamer1.0-1.28.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe harfbuzz-12.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata unihash changed to 8209c81046e6cb5047a83246084ad1d609c7a5fe90083936acdfdece3410a8b5
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3580 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3582 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.42.bb:do_create_recipe_spdx)
NOTE: Running task 3584 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3586 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_package)
NOTE: Running task 3591 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_recipe_qa)
NOTE: recipe p11-kit-0.26.2-r0: task do_unpack: Succeeded
NOTE: Running task 3592 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_patch)
NOTE: recipe pango-1.57.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.42-r0: task do_create_recipe_spdx: Started
NOTE: recipe libportal-0.9.1-r0: task do_recipe_qa: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe librsvg-2.61.3-r0: task do_unpack: Succeeded
NOTE: recipe p11-kit-0.26.2-r0: task do_patch: Started
NOTE: Running task 3593 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_patch)
NOTE: recipe libportal-0.9.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3594 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_recipe_qa)
NOTE: recipe p11-kit-0.26.2-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.42-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3595 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_recipe_qa)
NOTE: Running task 3596 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_recipe_qa)
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa: Started
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa: Started
NOTE: recipe gcr-4.4.0.1-r0: task do_recipe_qa: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3597 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb:do_recipe_qa)
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcr-4.4.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3598 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_fetch)
NOTE: Running task 3599 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: recipe librsvg-2.61.3-r0: task do_patch: Succeeded
NOTE: Running task 3600 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libadwaita-1.8.4-r0: task do_recipe_qa: Started
NOTE: recipe libportal-0.9.1-r0: task do_fetch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe pango-1.57.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3601 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_configure)
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: Running task 3602 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libadwaita-1.8.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3603 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_fetch)
NOTE: recipe pango-1.57.0-r0: task do_configure: Started
NOTE: recipe libportal-0.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 3604 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_fetch)
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.61.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Started
NOTE: Running task 3605 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb:do_fetch)
NOTE: recipe gcr-4.4.0.1-r0: task do_fetch: Started
NOTE: recipe gcr-4.4.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 3606 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_unpack)
NOTE: recipe librsvg-2.61.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_deploy_source_date_epoch unihash changed to daa1e36eda1a128a569fc10d594fd3a9626a9a488e507d5daba9ea6b7607ec07
NOTE: recipe libadwaita-1.8.4-r0: task do_fetch: Started
NOTE: recipe libadwaita-1.8.4-r0: task do_fetch: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.50.6-r0: task do_unpack: Started
NOTE: recipe flac-1.5.0-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3607 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata)
NOTE: Running task 3611 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_recipe_spdx)
NOTE: Running task 3615 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch)
NOTE: Running task 3619 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx)
NOTE: recipe nghttp2-1.68.1-r0: task do_compile: Succeeded
NOTE: Running task 3620 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_install)
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx: Started
NOTE: recipe json-glib-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3621 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.18-r0: task do_compile: Succeeded
NOTE: recipe nghttp2-1.68.1-r0: task do_install: Started
NOTE: Running task 3622 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_install)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_compile: Succeeded
NOTE: Running task 3623 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_install)
NOTE: recipe libsoup-3.6.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vala-0.56.18-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch unihash changed to 73e76bf06240a91e0b6c22691db78d3dde06dfba8b7b2bd2dc4d89c99b409f41
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3624 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: recipe nghttp2-1.68.1-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata unihash changed to 83b777d67bae489b1a2e78bee0279607edc26636d3fde7213d881757e6327d82
NOTE: recipe libsoup-3.6.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_deploy_source_date_epoch unihash changed to 2b688f747a47bfaa31d6dd881e0fb6471b3c4533cdd4fe77fe32c0cf8cefcae1
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3625 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_populate_sysroot)
NOTE: Running task 3626 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3627 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 3628 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3630 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_write_config)
NOTE: Running task 3631 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx)
NOTE: recipe nghttp2-1.68.1-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe aspell-0.60.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.6.6-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Started
NOTE: recipe libsoup-3.6.6-r0: task do_write_config: Succeeded
NOTE: Running task 3632 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb:do_unpack)
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_unpack: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_deploy_source_date_epoch unihash changed to 463454d62f8b28b7dd9633223a53053c39330c45301bda688395e5a564d1cff0
NOTE: recipe aspell-0.60.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_deploy_source_date_epoch unihash changed to 6e3807d231f808ef3b179b6b49da32c43284c1dc49bc44c9f4c0f6ea2a060b68
NOTE: recipe nghttp2-1.68.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3633 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: Running task 3634 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3635 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3636 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_install_ptest_base)
NOTE: Running task 3637 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_recipe_spdx)
NOTE: Running task 3638 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_create_recipe_spdx)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3639 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_configure)
NOTE: recipe libfyaml-0.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: Running task 3640 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_packagedata)
NOTE: recipe aspell-0.60.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_install_ptest_base: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3641 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb:do_patch)
NOTE: recipe libfyaml-0.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3642 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_configure)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to 21e69c9bf010f4d1fbc7aa2ae950521cf0dc66cf283faab99418a8534d212fdc
NOTE: recipe aspell-0.60.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_patch: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3643 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_packagedata unihash changed to d7d8da1660af99de224c670475940ad1fed04064a93bc3dd495c22e5636fb574
NOTE: Setscene tasks completed
NOTE: Running task 3644 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_package)
NOTE: Running task 3645 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_configure)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3674 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_create_recipe_spdx)
NOTE: Running task 3690 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_recipe_spdx)
NOTE: Running task 3740 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx)
NOTE: Running task 3742 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_unpack)
NOTE: recipe aspell-0.60.8.2-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Started
NOTE: recipe libportal-0.9.1-r0: task do_unpack: Started
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe vala-0.56.18-r0: task do_install: Succeeded
NOTE: Running task 3743 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3744 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_package)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_package: Started
NOTE: recipe librsvg-2.61.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3745 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Succeeded
NOTE: Running task 3746 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_unpack)
NOTE: recipe at-spi2-core-2.60.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3747 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_unpack)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Started
NOTE: recipe webkitgtk-2.50.6-r0: task do_unpack: Succeeded
NOTE: recipe libportal-0.9.1-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3748 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_patch)
NOTE: Running task 3749 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb:do_unpack)
NOTE: recipe harfbuzz-12.3.2-r0: task do_package: Succeeded
NOTE: recipe gcr-4.4.0.1-r0: task do_unpack: Started
NOTE: Running task 3750 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_packagedata)
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 3751 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx)
NOTE: recipe webkitgtk-2.50.6-r0: task do_patch: Started
NOTE: recipe libadwaita-1.8.4-r0: task do_unpack: Started
NOTE: recipe gcr-4.4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 3755 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_patch)
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Started
NOTE: recipe libportal-0.9.1-r0: task do_patch: Started
NOTE: recipe libadwaita-1.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 3756 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: recipe libportal-0.9.1-r0: task do_patch: Succeeded
NOTE: Running task 3757 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_patch)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3758 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_packagedata: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_packagedata unihash changed to 7c80e6f984a4e89ebf2bc2355122e411f67f4982971d75e0175645874241e17c
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gcr-4.4.0.1-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Succeeded
NOTE: recipe gcr-4.4.0.1-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Succeeded
NOTE: recipe webkitgtk-2.50.6-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3759 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_compile)
NOTE: Running task 3760 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb:do_create_spdx)
NOTE: Running task 3761 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_patch)
NOTE: Running task 3762 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb:do_patch)
NOTE: Running task 3774 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_compile_ptest_base)
NOTE: Running task 3780 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_recipe_spdx)
NOTE: Running task 3781 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_recipe_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_spdx: Started
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Started
NOTE: recipe libadwaita-1.8.4-r0: task do_patch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe json-glib-1.10.8-r0: task do_compile_ptest_base: Started
NOTE: recipe libadwaita-1.8.4-r0: task do_patch: Succeeded
NOTE: Running task 3782 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_recipe_spdx)
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Succeeded
NOTE: Running task 3788 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_spdx)
NOTE: recipe json-glib-1.10.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3789 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_install)
NOTE: recipe libxv-1.0.13-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3800 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: recipe json-glib-1.10.8-r0: task do_install: Started
NOTE: Running task 3812 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.25.bb:do_populate_sysroot)
NOTE: recipe libical-3.0.20-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3813 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_configure)
NOTE: recipe libxv-1.0.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: Running task 3816 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_deploy_source_date_epoch)
NOTE: Setscene tasks completed
NOTE: Running task 3817 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_compile)
NOTE: recipe libxmlb-0.3.25-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.20-r0: task do_configure: Started
NOTE: recipe libnotify-0.8.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 3818 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_deploy_source_date_epoch)
NOTE: recipe pango-1.57.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-12.3.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3819 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.21.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe enchant2-2.8.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnotify-0.8.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_deploy_source_date_epoch unihash changed to 76f0c48f8ff622abdba61a48f0770e9256539bea974664e26f760974330453dd
NOTE: Running task 3821 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsecret-0.21.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_deploy_source_date_epoch unihash changed to 117fb312868ee13b7e3a02db275f0962e6f79685fe755933bbd96de6230813f2
NOTE: recipe enchant2-2.8.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.15.bb:do_deploy_source_date_epoch unihash changed to 3013f94b2def9adaa4cda19c9ba69a702c9ee3f172c8dd337ece9768ae9a97f4
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxmlb-0.3.25-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3822 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3823 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_compile)
NOTE: Running task 3824 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3825 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Succeeded
NOTE: Running task 3826 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_install)
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.5-r0: task do_compile: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe appstream-1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3833 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_write_config)
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_deploy_source_date_epoch unihash changed to 12d2763f7a2e569f6b88a141910f976e663ae120d9a8de337a7cbb9c5478ec73
NOTE: recipe libnotify-0.8.8-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.8-r0: task do_write_config: Succeeded
NOTE: Running task 3834 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe appstream-1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3835 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_write_config)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_deploy_source_date_epoch unihash changed to 1fc129d39c2dc93bbc47cd63df3b2257b9c647039727b93f101a2d7d5a40abb8
NOTE: recipe p11-kit-0.26.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnotify-0.8.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.7-r0: task do_write_config: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_deploy_source_date_epoch unihash changed to 1737d26e3b26bc9d38e25ea84093f5fa98531b813c0e4a3a043cb418e2fd613b
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_deploy_source_date_epoch unihash changed to 03494a06ef70538a94edb19fcb4a88aa6b3013c72d4defb4b8cb8edb7830416f
NOTE: recipe libsecret-0.21.7-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3836 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3838 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_write_config)
NOTE: Running task 3839 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3840 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_write_config)
NOTE: Running task 3841 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_write_config: Started
NOTE: recipe libsecret-0.21.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_write_config: Succeeded
NOTE: Running task 3842 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.1.2.bb:do_write_config)
NOTE: recipe p11-kit-0.26.2-r0: task do_write_config: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Succeeded
NOTE: Running task 3846 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_create_recipe_spdx)
NOTE: Running task 3860 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb:do_create_recipe_spdx)
NOTE: recipe appstream-1.1.2-r0: task do_write_config: Started
NOTE: recipe libical-3.0.20-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe appstream-1.1.2-r0: task do_write_config: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3861 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_recipe_spdx)
NOTE: Running task 3862 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_configure)
NOTE: recipe libnotify-0.8.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3863 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_configure)
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3864 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_configure)
NOTE: recipe libnotify-0.8.8-r0: task do_configure: Started
NOTE: recipe libical-3.0.20-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3865 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.28.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3866 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb:do_create_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe p11-kit-0.26.2-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3867 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_configure)
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Started
NOTE: Running task 3872 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_package)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_package: Started
NOTE: recipe libsecret-0.21.7-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3875 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.3.bb:do_recipe_qa)
NOTE: recipe epiphany-50.3-r0: task do_recipe_qa: Started
NOTE: recipe epiphany-50.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3878 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.3.bb:do_fetch)
NOTE: recipe vala-0.56.18-r0: task do_package: Succeeded
NOTE: Running task 3879 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata)
NOTE: recipe epiphany-50.3-r0: task do_fetch: Started
NOTE: recipe epiphany-50.3-r0: task do_fetch: Succeeded
NOTE: Running task 3881 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_recipe_spdx)
NOTE: recipe vala-0.56.18-r0: task do_packagedata: Started
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3882 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_recipe_spdx)
NOTE: recipe gdk-pixbuf-2.44.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3883 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.86.bb:do_create_recipe_spdx)
NOTE: recipe bluez5-5.86-r0: task do_create_recipe_spdx: Started
NOTE: recipe nghttp2-1.68.1-r0: task do_package: Succeeded
NOTE: Running task 3886 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3887 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.86-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe nghttp2-1.68.1-r0: task do_packagedata: Started
NOTE: Running task 3891 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package)
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3900 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb:do_write_config)
NOTE: recipe nghttp2-1.68.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3901 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_write_config: Succeeded
NOTE: Running task 3903 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb:do_create_spdx)
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.8-r0: task do_configure: Succeeded
NOTE: Running task 3904 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libnotify/libnotify_0.8.8.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3905 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb:do_configure)
NOTE: recipe libnotify-0.8.8-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.47-r0: task do_create_spdx: Succeeded
NOTE: Running task 3906 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx: Started
NOTE: recipe libpsl-0.21.5-r0: task do_compile: Succeeded
NOTE: recipe libsecret-0.21.7-r0: task do_configure: Succeeded
NOTE: Running task 3907 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_install)
NOTE: Running task 3908 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.7.bb:do_compile)
NOTE: recipe libpsl-0.21.5-r0: task do_install: Started
NOTE: recipe libsecret-0.21.7-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3932 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_recipe_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe p11-kit-0.26.2-r0: task do_configure: Succeeded
NOTE: Running task 3933 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb:do_compile)
NOTE: recipe p11-kit-0.26.2-r0: task do_compile: Started
NOTE: recipe libical-3.0.20-r0: task do_configure: Succeeded
NOTE: Running task 3934 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Succeeded
NOTE: Running task 3936 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb:do_create_recipe_spdx)
NOTE: Running task 3937 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata)
NOTE: recipe libical-3.0.20-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3938 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_recipe_spdx)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata unihash changed to bc41bfe3782324f02684b879f0604f2a6c07356097658f7126cde09315729c7a
NOTE: recipe at-spi2-core-2.60.0-r0: task do_package: Succeeded
NOTE: Running task 3939 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3940 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_package)
NOTE: Running task 3941 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_packagedata)
NOTE: recipe aspell-0.60.8.2-r0: task do_configure: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot: Started
NOTE: Running task 3942 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.2.bb:do_compile)
NOTE: recipe libpsl-0.21.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe at-spi2-core-2.60.0-r0: task do_packagedata: Started
NOTE: Running task 3968 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8.2-r0: task do_compile: Started
NOTE: recipe libportal-0.9.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3969 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libportal-0.9.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3970 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe webkitgtk-2.50.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.60.0-r0: task do_packagedata: Succeeded
NOTE: recipe webkitgtk-2.50.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.0.bb:do_packagedata unihash changed to b32144295b2c8e59e463d6d29f91f7fea157f866e5bca58c4008f71f54006a46
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_deploy_source_date_epoch unihash changed to ce3e67bb21281239e016f6b4476ab748d7984175a176c14591354f7de40a1751
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_configure: Succeeded
NOTE: Running task 3971 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_compile)
NOTE: Running task 3972 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3973 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3974 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.4.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_configure: Succeeded
NOTE: Running task 3975 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb:do_compile)
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Started
NOTE: recipe libfyaml-0.9.4-r0: task do_compile: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_compile: Started
NOTE: recipe libsoup-3.6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3976 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.6.bb:do_configure)
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3977 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3978 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libsoup-3.6.6-r0: task do_configure: Started
NOTE: recipe gcr-4.4.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpsl-0.21.5-r0: task do_package: Succeeded
NOTE: recipe libadwaita-1.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3979 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata)
NOTE: recipe gcr-4.4.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata: Started
NOTE: Running task 3987 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_50.3.bb:do_unpack)
NOTE: recipe libadwaita-1.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb:do_deploy_source_date_epoch unihash changed to 7d05bbb431c61cf7de7b9c6677ef9d33703105eb7f77af50d977839d4d9ad913
NOTE: recipe epiphany-50.3-r0: task do_unpack: Started
NOTE: Running task 3988 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_write_config)
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3989 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.6.bb:do_generate_toolchain_file)
NOTE: recipe libportal-0.9.1-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_compile: Succeeded
NOTE: Running task 3990 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_50.0.bb:do_install)
NOTE: recipe webkitgtk-2.50.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe libportal-0.9.1-r0: task do_write_config: Succeeded
NOTE: Running task 3991 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: recipe epiphany-50.3-r0: task do_unpack: Succeeded
NOTE: Running task 3992 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_write_config)
NOTE: recipe webkitgtk-2.50.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_packagedata: Failed
NOTE: Running task 3993 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_write_config)
NOTE: Running task 3994 of 4607 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb:do_write_config)
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_install: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: recipe libadwaita-1.8.4-r0: task do_write_config: Started
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Started
NOTE: recipe gcr-4.4.0.1-r0: task do_write_config: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe libadwaita-1.8.4-r0: task do_write_config: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Succeeded
NOTE: recipe gcr-4.4.0.1-r0: task do_write_config: Succeeded
NOTE: recipe gsettings-desktop-schemas-50.0-r0: task do_install: Succeeded
NOTE: recipe libnotify-0.8.8-r0: task do_compile: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Succeeded
NOTE: recipe libsecret-0.21.7-r0: task do_compile: Succeeded
NOTE: recipe libsoup-3.6.6-r0: task do_configure: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_compile: Succeeded
NOTE: recipe aspell-0.60.8.2-r0: task do_compile: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_compile: Succeeded
NOTE: recipe libfyaml-0.9.4-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_26.0.3-r0: task do_compile: Succeeded
NOTE: recipe p11-kit-0.26.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3994 tasks of which 3372 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415111815.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415111815.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vala/0.56.18/temp/log.do_packagedata.1410865
Summary: There were 53 ERROR messages, returning a non-zero exit code.
ERROR: libarchive-3.8.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-src went backwards which would break package feeds (from 0:3.8.7-r0 to 0:3.8.6-r0) [version-going-backwards]
ERROR: libarchive-3.8.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-dbg went backwards which would break package feeds (from 0:3.8.7-r0 to 0:3.8.6-r0) [version-going-backwards]
ERROR: libarchive-3.8.6-r0 do_packagedata_setscene: QA Issue: Package version for package bsdcpio went backwards which would break package feeds (from 0:3.8.7-r0 to 0:3.8.6-r0) [version-going-backwards]
ERROR: libarchive-3.8.6-r0 do_packagedata_setscene: QA Issue: Package version for package bsdtar went backwards which would break package feeds (from 0:3.8.7-r0 to 0:3.8.6-r0) [version-going-backwards]
ERROR: libarchive-3.8.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-ptest went backwards which would break package feeds (from 0:3.8.7-r0 to 0:3.8.6-r0) [version-going-backwards]
ERROR: libarchive-3.8.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-staticdev went backwards which would break package feeds (from 0:3.8.7-r0 to 0:3.8.6-r0) [version-going-backwards]
ERROR: libarchive-3.8.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-dev went backwards which would break package feeds (from 0:3.8.7-r0 to 0:3.8.6-r0) [version-going-backwards]
ERROR: libarchive-3.8.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-doc went backwards which would break package feeds (from 0:3.8.7-r0 to 0:3.8.6-r0) [version-going-backwards]
ERROR: libarchive-3.8.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive-locale went backwards which would break package feeds (from 0:3.8.7-r0 to 0:3.8.6-r0) [version-going-backwards]
ERROR: libarchive-3.8.6-r0 do_packagedata_setscene: QA Issue: Package version for package libarchive went backwards which would break package feeds (from 0:3.8.7-r0 to 0:3.8.6-r0) [version-going-backwards]
ERROR: libarchive-3.8.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-ptest went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ka went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-nl went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.8.3-r0 to 0:5.8.2-r0) [version-going-backwards]
ERROR: xz-5.8.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.19-r0 to 0:0.56.18-r0) [version-going-backwards]
ERROR: vala-0.56.18-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vala/0.56.18/temp/log.do_packagedata.1410865
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata) failed with exit code '1'

--===============0657349279682449350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 6299304 to 10825784 (+72%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PKGSIZE changed from 60611 to 101745 (+68%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4713126 to 32625753 (+592%)
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGSIZE changed from 2131242 to 6648655 (+212%)
packages/x86-64-v3-poky-linux/epiphany: PACKAGES: added "epiphany-locale-my"

--===============0657349279682449350==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-49.7-50.3.patch"

RnJvbSA2ODMxOTkwZTFmZmNkMmU1ZDk1ODcxZDZhZTNmNGFkZWMzNzhhY2VkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTE6MTk6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0OS43IC0+IDUwLjMKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80OS43LmJiID0+IGVwaXBoYW55XzUwLjMuYmJ9ICAgICAgICAgICB8IDIgKy0KIC4uLi9maWxl
cy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggfCAy
ICstCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gg
ICAgICAgICAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWln
cmF0b3IucGF0Y2ggICAgICAgICAgICAgIHwgNCArKy0tCiA0IGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBp
cGhhbnkve2VwaXBoYW55XzQ5LjcuYmIgPT4gZXBpcGhhbnlfNTAuMy5iYn0gKDk0JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDkuNy5iYiBiL21l
dGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MC4zLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80
OS43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNTAu
My5iYgppbmRleCBlNzgyODU1Yzk1Li5kNWNhY2M4NDhhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDkuNy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25v
bWUvZXBpcGhhbnkvZXBpcGhhbnlfNTAuMy5iYgpAQCAtMzIsNyArMzIsNyBAQCBTUkNfVVJJICs9
ICJcCiAgICAgICAgICAgIGZpbGU6Ly9taWdyYXRvci5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly9kaXN0cmlidXRvci5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbYXJjaGl2ZS5zaGEy
NTZzdW1dID0gIjNjNTkwYzZmZTZkOTI2OTQxMmEwNDJhYTQ3OWM5MWMzMjI5MTYzZTJkYTg1YTk0
YTVkMjQ2NDRiMmFiOWUzYjQiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICIwMzJkNmE0
MWUyYTA3OWNkNDFiMDVjYTdhYmZiMzg3MGFkZjAzNTNkMTU2NjE5NGJlZDg3OTA5NTNhODk0NjQw
IgogCiBleHBvcnQgR0lfVFlQRUxJQl9QQVRIID0gIiR7U1RBR0lOR19MSUJESVJ9L2dpcmVwb3Np
dG9yeS0xLjAvIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmls
ZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1k
aXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaAppbmRleCA2YzAwYWI5YjQwLi45MjM1OWExODk1
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxw
LW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10
aGUtdXNlLW9mLXllbHAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDkxMDQ1ZWNlNDFmYWVm
YmVhYzE0YjYwZDdiMTliMGM2NTJlNTg2ZmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDUzNTk1YmI1MjI2OWJlOGMwOTE3YTViZmVkYWNmM2Y4MjdlM2I1YTQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KIERhdGU6IFdlZCwgMzEgSmFuIDIwMTggMTU6NTA6MzggKzAyMDAKIFN1YmplY3Q6IFtQQVRD
SF0gaGVscC9tZXNvbi5idWlsZDogZGlzYWJsZSB0aGUgdXNlIG9mIHllbHAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCBiL21l
dGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaAppbmRleCA1
NGEzMzA1YWFmLi40YjQ3ZjRiYzg4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBp
cGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NjA4
NGRhMDNiNWYyMDQyM2EyOTQ2ZDk4OGM2OGU5ZWE5MzM5YzljIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA1MzIzMjQxYWE4NGI0YTZkNDlkNjllZjZmNjA4NWE2MmE2YjE1MzZhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDI2IEZlYiAyMDIxIDEwOjE3OjUyICsw
MDAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvbid0IGVuY29kZSB0aGUgZGlzdHJvIGZyb20gL2V0Yy9v
cy1yZWxlYXNlIGludG8gdGhlCkBAIC0xMSw3ICsxMSw3IEBAIFJQIDIwMjEvMi8yNgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9t
ZXNvbi5idWlsZAotaW5kZXggZGYwMzQwYy4uOGVjNmM3OSAxMDA2NDQKK2luZGV4IDdiZmY2NDEu
LjBlODk5ZjEgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBA
IC0xNSw2ICsxNSw3IEBAIGlmIHIucmV0dXJuY29kZSgpID09IDAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaCBiL21ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaAppbmRleCA4ZWJjZGM5OTkxLi5l
ZWRjMTVmOGFhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMv
bWlncmF0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21p
Z3JhdG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjYTUwNDM3MGI5YWE4OTNjZWFjMjEx
NDFkOGYyNGUyOGE0NzRiNjc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkMGNmMTkz
OWQ5Yzc3YjdiMjM5MzY4MzU3M2ZhNDFkODI1OTI3NzQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CiBEYXRlOiBUaHUsIDI1IEZlYiAyMDIxIDE0OjUyOjMyICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGVwaXBoYW55OiBGaXggcmVwcm9kdWNpYmlsaXR5IGlzc3VlCkBAIC0xNCw3ICsxNCw3IEBA
IFJQIDIwMjEvMi8yNQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9saWIvZXBoeS1wcm9maWxlLXV0aWxzLmMgYi9saWIvZXBo
eS1wcm9maWxlLXV0aWxzLmMKLWluZGV4IGEyZjYxODEuLjUyMTgwNzcgMTAwNjQ0CitpbmRleCBl
YTJlYTk5Li4xM2MyN2M4IDEwMDY0NAogLS0tIGEvbGliL2VwaHktcHJvZmlsZS11dGlscy5jCiAr
KysgYi9saWIvZXBoeS1wcm9maWxlLXV0aWxzLmMKIEBAIC0xMzAsMTAgKzEzMCwxMCBAQCBlcGh5
X3Byb2ZpbGVfdXRpbHNfZG9fbWlncmF0aW9uIChjb25zdCBjaGFyICpwcm9maWxlX2RpcmVjdG9y
eSwKLS0gCjIuNDcuMQoK

--===============0657349279682449350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 6299304 to 10825784 (+72%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PKGSIZE changed from 127218 to 129093 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PKGSIZE changed from 99742 to 101198 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PKGSIZE changed from 99043 to 100565 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PKGSIZE changed from 94177 to 95528 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PKGSIZE changed from 99656 to 100263 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PKGSIZE changed from 134921 to 136892 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PKGSIZE changed from 90781 to 92044 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PKGSIZE changed from 98222 to 99636 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PKGSIZE changed from 96613 to 98011 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PKGSIZE changed from 75209 to 77798 (+3%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PKGSIZE changed from 98309 to 105437 (+7%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PKGSIZE changed from 94248 to 98787 (+5%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PKGSIZE changed from 97413 to 98854 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PKGSIZE changed from 102094 to 103656 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PKGSIZE changed from 100530 to 102014 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PKGSIZE changed from 47722 to 48762 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PKGSIZE changed from 92922 to 94232 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PKGSIZE changed from 98969 to 100449 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 152974 to 155289 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PKGSIZE changed from 122788 to 124504 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PKGSIZE changed from 99230 to 100648 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PKGSIZE changed from 96543 to 97951 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PKGSIZE changed from 144659 to 143049 (-1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PKGSIZE changed from 60611 to 101745 (+68%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PKGSIZE changed from 98350 to 100429 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PKGSIZE changed from 98177 to 99630 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PKGSIZE changed from 98037 to 99449 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PKGSIZE changed from 98666 to 100198 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PKGSIZE changed from 126492 to 128319 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PKGSIZE changed from 95557 to 96937 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PKGSIZE changed from 125427 to 127739 (+2%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PKGSIZE changed from 94970 to 96344 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PKGSIZE changed from 96006 to 97300 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PKGSIZE changed from 124726 to 126495 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PKGSIZE changed from 124057 to 125756 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PKGSIZE changed from 88921 to 90220 (+1%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PKGSIZE changed from 84523 to 90880 (+8%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: FILELIST: directory renamed /usr/src/debug/epiphany/49.7/lib/autofill -> /usr/src/debug/epiphany/50.3/lib/autofill, directory renamed /usr/src/debug/epiphany/49.7/embed -> /usr/src/debug/epiphany/50.3/embed, directory renamed /usr/src/debug/epiphany/49.7/lib/contrib -> /usr/src/debug/epiphany/50.3/lib/contrib, directory renamed /usr/src/debug/epiphany/49.7/src/webextension -> /usr/src/debug/epiphany/50.3/src/webextension, directory renamed /usr/src/debug/epiphany/49.7/embed/web-process-extension -> /usr/src/debug/epiphany/50.3/embed/web-process-extension, directory renamed /usr/src/debug/epiphany/49.7/third-party/gvdb -> /usr/src/debug/epiphany/50.3/third-party/gvdb, directory renamed /usr/src/debug/epiphany/49.7/lib/sync/debug -> /usr/src/debug/epiphany/50.3/lib/sync/debug, directory renamed /usr/src/debug/epiphany/49.7/src/search-provider -> /usr/src/debug/epiphany/50.3/src/search-provider, directory renamed /usr/src/debug/epipha
 ny/49.7/src/webapp-provider -> /usr/src/debug/epiphany/50.3/src/webapp-provider, directory renamed /usr/src/debug/epiphany/49.7/lib/sync -> /usr/src/debug/epiphany/50.3/lib/sync, directory renamed /usr/src/debug/epiphany/49.7/src/webextension/api -> /usr/src/debug/epiphany/50.3/src/webextension/api, directory renamed /usr/src/debug/epiphany/49.7/lib/history -> /usr/src/debug/epiphany/50.3/lib/history, directory renamed /usr/src/debug/epiphany/49.7/src/bookmarks -> /usr/src/debug/epiphany/50.3/src/bookmarks, directory renamed /usr/src/debug/epiphany/49.7/lib -> /usr/src/debug/epiphany/50.3/lib, directory renamed /usr/src/debug/epiphany/49.7/third-party -> /usr/src/debug/epiphany/50.3/third-party, removed "/usr/src/debug/epiphany/49.7/src/ephy-action-bar.c /usr/src/debug/epiphany/49.7/src/ephy-download-widget.c /usr/src/debug/epiphany/49.7/src/ephy-download-widget.h /usr/src/debug/epiphany/49.7/src/ephy-action-bar.h /usr/src/debug/epiphany/49.7/src/ephy-window.h /usr/src/debug/epiphan
 y/49.7/src/ephy-window.c /usr/src/debug/epiphany/49.7/src/profile-migrator/ephy-profile-migrator.c /usr/src/debug/epiphany/49.7/src/profile-migrator/ephy-legacy-web-app-utils.c /usr/src/debug/epiphany/49.7/src/ephy-encoding-row.c /usr/src/debug/epiphany/49.7/src/preferences/autofill-view.c /usr/src/debug/epiphany/49.7/src/preferences/autofill-view.h /usr/src/debug/epiphany/49.7/src/ephy-action-helper.c /usr/src/debug/epiphany/49.7/src/ephy-history-dialog.h /usr/src/debug/epiphany/49.7/src/preferences/prefs-appearance-page.h /usr/src/debug/epiphany/49.7/src/ephy-fullscreen-box.h /usr/src/debug/epiphany/49.7/src/preferences/prefs-appearance-page.c /usr/src/debug/epiphany/49.7/src/ephy-fullscreen-box.c /usr/src/debug/epiphany/49.7/src/ephy-history-dialog.c /usr/src/debug/epiphany/49.7/src/ephy-action-helper.h /usr/src/debug/epiphany/49.7/src/ephy-title-box.h /usr/src/debug/epiphany/49.7/src/ephy-shell.c /usr/src/debug/epiphany/49.7/src/ephy-main.c /usr/src/debug/epiphany/49.7/src/ephy-
 title-box.c /usr/src/debug/epiphany/49.7/src/ephy-shell.h /usr/src/debug/epiphany/49.7/src/ephy-action-bar-start.c /usr/src/debug/epiphany/49.7/src/ephy-privacy-report.c /usr/src/debug/epiphany/49.7/src/ephy-location-controller.c /usr/src/debug/epiphany/49.7/src/ephy-type-builtins.h /usr/src/debug/epiphany/49.7/src/ephy-action-bar-start.h /usr/src/debug/epiphany/49.7/src/ephy-type-builtins.c /usr/src/debug/epiphany/49.7/src/ephy-location-controller.h /usr/src/debug/epiphany/49.7/src/ephy-privacy-report.h /usr/src/debug/epiphany/49.7/src/ephy-encoding-dialog.h /usr/src/debug/epiphany/49.7/src/ephy-security-dialog.h /usr/src/debug/epiphany/49.7/src/context-menu-commands.c /usr/src/debug/epiphany/49.7/src/context-menu-commands.h /usr/src/debug/epiphany/49.7/src/ephy-encoding-dialog.c /usr/src/debug/epiphany/49.7/src/ephy-security-dialog.c /usr/src/debug/epiphany/49.7/src/epiphany-resources.c /usr/src/debug/epiphany/49.7/src/ephy-downloads-paintable.h /usr/src/debug/epiphany/49.7/src/pr
 eferences/ephy-lang-row.c /usr/src/debug/epiphany/49.7/src/ephy-firefox-sync-dialog.h /usr/src/debug/epiphany/49.7/src/preferences/ephy-lang-row.h /usr/src/debug/epiphany/49.7/src/ephy-downloads-paintable.c /usr/src/debug/epiphany/49.7/src/ephy-firefox-sync-dialog.c /usr/src/debug/epiphany/49.7/src/ephy-downloads-popover.h /usr/src/debug/epiphany/49.7/src/ephy-mouse-gesture-controller.h /usr/src/debug/epiphany/49.7/src/synced-tabs-dialog.c /usr/src/debug/epiphany/49.7/src/ephy-downloads-popover.c /usr/src/debug/epiphany/49.7/src/ephy-mouse-gesture-controller.c /usr/src/debug/epiphany/49.7/src/synced-tabs-dialog.h /usr/src/debug/epiphany/49.7/src/ephy-link.c /usr/src/debug/epiphany/49.7/src/preferences/ephy-data-view.c /usr/src/debug/epiphany/49.7/src/preferences/ephy-data-view.h /usr/src/debug/epiphany/49.7/src/ephy-link.h /usr/src/debug/epiphany/49.7/src/ephy-header-bar.c /usr/src/debug/epiphany/49.7/src/ephy-title-widget.h /usr/src/debug/epiphany/49.7/src/preferences/clear-data-vi
 ew.h /usr/src/debug/epiphany/49.7/src/ephy-title-widget.c /usr/src/debug/epiphany/49.7/src/ephy-header-bar.h /usr/src/debug/epiphany/49.7/src/preferences/clear-data-view.c /usr/src/debug/epiphany/49.7/src/preferences/prefs-extensions-page.c /usr/src/debug/epiphany/49.7/src/preferences/prefs-extensions-page.h /usr/src/debug/epiphany/49.7/src/ephy-certificate-dialog.h /usr/src/debug/epiphany/49.7/src/ephy-lockdown.c /usr/src/debug/epiphany/49.7/src/ephy-certificate-dialog.c /usr/src/debug/epiphany/49.7/src/ephy-lockdown.h /usr/src/debug/epiphany/49.7/src/ephy-site-menu-button.c /usr/src/debug/epiphany/49.7/src/preferences/prefs-features-page.c /usr/src/debug/epiphany/49.7/src/preferences/ephy-search-engine-listbox.h /usr/src/debug/epiphany/49.7/src/ephy-site-menu-button.h /usr/src/debug/epiphany/49.7/src/preferences/prefs-features-page.h /usr/src/debug/epiphany/49.7/src/preferences/ephy-search-engine-listbox.c /usr/src/debug/epiphany/49.7/src/preferences/webapp-additional-urls-dialog.
 h /usr/src/debug/epiphany/49.7/src/preferences/webapp-additional-urls-dialog.c /usr/src/debug/epiphany/49.7/src/ephy-passwords-view.c /usr/src/debug/epiphany/49.7/src/ephy-location-entry.c /usr/src/debug/epiphany/49.7/src/ephy-location-entry.h /usr/src/debug/epiphany/49.7/src/ephy-passwords-view.h /usr/src/debug/epiphany/49.7/src/preferences/prefs-privacy-page.h /usr/src/debug/epiphany/49.7/src/ephy-desktop-utils.c /usr/src/debug/epiphany/49.7/src/ephy-desktop-utils.h /usr/src/debug/epiphany/49.7/src/preferences/prefs-privacy-page.c /usr/src/debug/epiphany/49.7/src/ephy-add-opensearch-engine-button.c /usr/src/debug/epiphany/49.7/src/ephy-add-opensearch-engine-button.h /usr/src/debug/epiphany/49.7/src/ephy-webapp-provider-generated.h /usr/src/debug/epiphany/49.7/src/ephy-webapp-provider-generated.c /usr/src/debug/epiphany/49.7/src/ephy-page-menu-button.c /usr/src/debug/epiphany/49.7/src/ephy-shell-search-provider-generated.c /usr/src/debug/epiphany/49.7/src/ephy-page-menu-button.h /u
 sr/src/debug/epiphany/49.7/src/ephy-shell-search-provider-generated.h /usr/src/debug/epiphany/49.7/src/preferences/ephy-prefs-dialog.h /usr/src/debug/epiphany/49.7/src/ephy-action-bar-end.h /usr/src/debug/epiphany/49.7/src/ephy-action-bar-end.c /usr/src/debug/epiphany/49.7/src/preferences/ephy-prefs-dialog.c /usr/src/debug/epiphany/49.7/src/preferences/prefs-general-page.c /usr/src/debug/epiphany/49.7/src/ephy-tab-view.h /usr/src/debug/epiphany/49.7/src/ephy-suggestion-model.c /usr/src/debug/epiphany/49.7/src/window-commands.c /usr/src/debug/epiphany/49.7/src/ephy-tab-view.c /usr/src/debug/epiphany/49.7/src/preferences/prefs-general-page.h /usr/src/debug/epiphany/49.7/src/window-commands.h /usr/src/debug/epiphany/49.7/src/ephy-suggestion-model.h /usr/src/debug/epiphany/49.7/src/ephy-encoding-row.h /usr/src/debug/epiphany/49.7/src/preferences/extension-view.h /usr/src/debug/epiphany/49.7/src/preferences/ephy-search-engine-row.c /usr/src/debug/epiphany/49.7/src/ephy-session.h /usr/src
 /debug/epiphany/49.7/src/preferences/extension-view.c /usr/src/debug/epiphany/49.7/src/ephy-session.c /usr/src/debug/epiphany/49.7/src/preferences/ephy-search-engine-row.h", added "/usr/src/debug/epiphany/50.3/src/preferences/prefs-privacy-page.c /usr/src/debug/epiphany/50.3/src/ephy-link.c /usr/src/debug/epiphany/50.3/src/preferences/ephy-prefs-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-tab-view.c /usr/src/debug/epiphany/50.3/src/ephy-tab-view.h /usr/src/debug/epiphany/50.3/src/ephy-link.h /usr/src/debug/epiphany/50.3/src/preferences/ephy-prefs-dialog.c /usr/src/debug/epiphany/50.3/src/preferences/prefs-privacy-page.h /usr/src/debug/epiphany/50.3/src/window-commands.h /usr/src/debug/epiphany/50.3/src/window-commands.c /usr/src/debug/epiphany/50.3/src/ephy-title-widget.c /usr/src/debug/epiphany/50.3/src/ephy-fullscreen-box.c /usr/src/debug/epiphany/50.3/src/preferences/extension-view.c /usr/src/debug/epiphany/50.3/src/preferences/extension-view.h /usr/src/debug/epiphany/50.3/src
 /ephy-fullscreen-box.h /usr/src/debug/epiphany/50.3/src/ephy-title-widget.h /usr/src/debug/epiphany/50.3/src/ephy-desktop-utils.c /usr/src/debug/epiphany/50.3/src/ephy-encoding-row.h /usr/src/debug/epiphany/50.3/src/ephy-desktop-utils.h /usr/src/debug/epiphany/50.3/src/ephy-encoding-row.c /usr/src/debug/epiphany/50.3/src/epiphany-resources.c /usr/src/debug/epiphany/50.3/src/ephy-site-menu-button.h /usr/src/debug/epiphany/50.3/src/ephy-site-menu-button.c /usr/src/debug/epiphany/50.3/src/ephy-downloads-paintable.h /usr/src/debug/epiphany/50.3/src/ephy-downloads-paintable.c /usr/src/debug/epiphany/50.3/src/preferences/prefs-general-page.h /usr/src/debug/epiphany/50.3/src/ephy-main.c /usr/src/debug/epiphany/50.3/src/ephy-location-entry.c /usr/src/debug/epiphany/50.3/src/preferences/prefs-extensions-page.h /usr/src/debug/epiphany/50.3/src/ephy-location-entry.h /usr/src/debug/epiphany/50.3/src/preferences/prefs-extensions-page.c /usr/src/debug/epiphany/50.3/src/preferences/prefs-general-p
 age.c /usr/src/debug/epiphany/50.3/src/preferences/prefs-features-page.h /usr/src/debug/epiphany/50.3/src/preferences/prefs-features-page.c /usr/src/debug/epiphany/50.3/src/ephy-window.c /usr/src/debug/epiphany/50.3/src/ephy-action-bar.c /usr/src/debug/epiphany/50.3/src/ephy-suggestion-model.h /usr/src/debug/epiphany/50.3/src/ephy-history-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-suggestion-model.c /usr/src/debug/epiphany/50.3/src/ephy-action-bar.h /usr/src/debug/epiphany/50.3/src/ephy-window.h /usr/src/debug/epiphany/50.3/src/ephy-history-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-header-bar.h /usr/src/debug/epiphany/50.3/src/ephy-header-bar.c /usr/src/debug/epiphany/50.3/src/ephy-passwords-view.c /usr/src/debug/epiphany/50.3/src/ephy-passwords-view.h /usr/src/debug/epiphany/50.3/src/ephy-action-bar-start.c /usr/src/debug/epiphany/50.3/src/ephy-action-bar-start.h /usr/src/debug/epiphany/50.3/src/preferences/ephy-lang-row.c /usr/src/debug/epiphany/50.3/src/ephy-encoding-dia
 log.h /usr/src/debug/epiphany/50.3/src/ephy-privacy-report.h /usr/src/debug/epiphany/50.3/src/ephy-security-dialog.h /usr/src/debug/epiphany/50.3/src/preferences/ephy-lang-row.h /usr/src/debug/epiphany/50.3/src/ephy-privacy-report.c /usr/src/debug/epiphany/50.3/src/ephy-encoding-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-security-dialog.c /usr/src/debug/epiphany/50.3/src/preferences/webapp-additional-urls-dialog.c /usr/src/debug/epiphany/50.3/src/preferences/clear-data-view.c /usr/src/debug/epiphany/50.3/src/ephy-page-menu-button.h /usr/src/debug/epiphany/50.3/src/preferences/webapp-additional-urls-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-page-menu-button.c /usr/src/debug/epiphany/50.3/src/preferences/clear-data-view.h /usr/src/debug/epiphany/50.3/src/ephy-action-bar-end.c /usr/src/debug/epiphany/50.3/src/ephy-certificate-dialog.h /usr/src/debug/epiphany/50.3/src/ephy-certificate-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-action-bar-end.h /usr/src/debug/epiphany/50.3/s
 rc/ephy-firefox-sync-dialog.c /usr/src/debug/epiphany/50.3/src/ephy-firefox-sync-dialog.h /usr/src/debug/epiphany/50.3/src/preferences/ephy-search-engine-row.c /usr/src/debug/epiphany/50.3/src/preferences/ephy-search-engine-row.h /usr/src/debug/epiphany/50.3/src/ephy-download-widget.c /usr/src/debug/epiphany/50.3/src/ephy-download-widget.h /usr/src/debug/epiphany/50.3/src/preferences/autofill-view.c /usr/src/debug/epiphany/50.3/src/profile-migrator/ephy-profile-migrator.c /usr/src/debug/epiphany/50.3/src/preferences/autofill-view.h /usr/src/debug/epiphany/50.3/src/ephy-mouse-gesture-controller.h /usr/src/debug/epiphany/50.3/src/preferences/prefs-appearance-page.h /usr/src/debug/epiphany/50.3/src/ephy-mouse-gesture-controller.c /usr/src/debug/epiphany/50.3/src/preferences/prefs-appearance-page.c /usr/src/debug/epiphany/50.3/src/ephy-webapp-provider-generated.h /usr/src/debug/epiphany/50.3/src/preferences/ephy-data-view.c /usr/src/debug/epiphany/50.3/src/ephy-shell-search-provider-gen
 erated.h /usr/src/debug/epiphany/50.3/src/preferences/ephy-data-view.h /usr/src/debug/epiphany/50.3/src/ephy-webapp-provider-generated.c /usr/src/debug/epiphany/50.3/src/ephy-shell-search-provider-generated.c /usr/src/debug/epiphany/50.3/src/preferences/ephy-search-engine-listbox.c /usr/src/debug/epiphany/50.3/src/synced-tabs-dialog.h /usr/src/debug/epiphany/50.3/src/synced-tabs-dialog.c /usr/src/debug/epiphany/50.3/src/preferences/ephy-search-engine-listbox.h /usr/src/debug/epiphany/50.3/src/context-menu-commands.h /usr/src/debug/epiphany/50.3/src/context-menu-commands.c /usr/src/debug/epiphany/50.3/src/ephy-downloads-popover.h /usr/src/debug/epiphany/50.3/src/ephy-location-controller.h /usr/src/debug/epiphany/50.3/src/ephy-action-helper.h /usr/src/debug/epiphany/50.3/src/preferences/prefs-search-engine-page.h /usr/src/debug/epiphany/50.3/src/ephy-location-controller.c /usr/src/debug/epiphany/50.3/src/preferences/prefs-search-engine-page.c /usr/src/debug/epiphany/50.3/src/ephy-down
 loads-popover.c /usr/src/debug/epiphany/50.3/src/ephy-action-helper.c /usr/src/debug/epiphany/50.3/src/ephy-session.c /usr/src/debug/epiphany/50.3/src/ephy-lockdown.h /usr/src/debug/epiphany/50.3/src/ephy-type-builtins.c /usr/src/debug/epiphany/50.3/src/ephy-title-box.h /usr/src/debug/epiphany/50.3/src/ephy-lockdown.c /usr/src/debug/epiphany/50.3/src/ephy-type-builtins.h /usr/src/debug/epiphany/50.3/src/ephy-session.h /usr/src/debug/epiphany/50.3/src/ephy-title-box.c /usr/src/debug/epiphany/50.3/src/ephy-shell.c /usr/src/debug/epiphany/50.3/src/ephy-shell.h"
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4713126 to 32625753 (+592%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGSIZE changed from 2131242 to 6648655 (+212%)
packages/x86-64-v3-poky-linux/epiphany: PKGV changed from 49.7 [default] to 50.3 [default]
packages/x86-64-v3-poky-linux/epiphany: PV changed from "49.7" to "50.3"
packages/x86-64-v3-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/49/epiphany-49.7.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/50/epiphany-50.3.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/x86-64-v3-poky-linux/epiphany: PACKAGES: added "epiphany-locale-my"

--===============0657349279682449350==--

