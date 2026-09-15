Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F080FC88E7F
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 05:49:35 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16933.1789451368810519669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 22:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aPBLT6hU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=n7sbS27t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a0a39cf5f0-11f2925a-e923-42ac-b145-f299c72a703e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789451368;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W562CYEKuqxfC8XZw1q5tvh37bx9yQTnGgRuhsrwmzw=;
	b=aPBLT6hUzTwa3jdBssaKKQf9TbBIXnE7AYoYlGNyOVTrfK7h7X+d7LKPUmslRP7X
	VYweX3he9bbQABOq+d5bv1XO4BEMuWE3pVX1Ezo10PSCBmY+5ueAJwK5dumVQ2aB/qm
	OIf9/577JRKLWlsE2NQcypcSBO2NxgeMs74R2ARc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789451368;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W562CYEKuqxfC8XZw1q5tvh37bx9yQTnGgRuhsrwmzw=;
	b=n7sbS27tmLsHiI6FykNAhA24gw/u85BH2eUbbAj6GHZLarBxqK+W2a3QlyH9HdAQ
	knsaZbi8XMxtJTFTwU0BFbWMnVHPPgFYmT8g4sXVB1ITKrl6ZlOMeK1u5+XOyZqPuws
	a31oCzgCxe7YjYVcwWH2XhY3jFG/fPmNXPyeRMxk=
Content-Type: multipart/mixed; boundary="===============1078299477239721265=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] adwaita-icon-theme: upgrading to 51.0 FAILED
Message-ID: <010101a0a39cf5f0-11f2925a-e923-42ac-b145-f299c72a703e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Sep 2026 05:49:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 05:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245817

--===============1078299477239721265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *adwaita-icon-theme* to *51.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-adwaita-icon-theme-upgrade-50.0-51.0.patch
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
From 1d9d07e55364c5bf6091300fde8a73cb245c74c4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Sep 2026 05:44:11 +0000
Subject: [PATCH] adwaita-icon-theme: upgrade 50.0 -> 51.0

Source: NEWS

51.0
51.beta
- XDG Projects folder (issue #219)
---
 .../{adwaita-icon-theme_50.0.bb => adwaita-icon-theme_51.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_50.0.bb => adwaita-icon-theme_51.0.bb} (91%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb
similarity index 91%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb
index b0dc59353d..78dbe000ee 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_50.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
 
 inherit gnomebase allarch gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "fac6e0401fca714780561a081b8f7e27c3bc1db34ebda4da175081f26b24d460"
+SRC_URI[archive.sha256sum] = "ba561cf3c96305a47179fa5605856ad695c9238ea07f7093aebd9ba80c4e323b"
 
 DEPENDS += "librsvg-native"
 
-- 
2.47.1


--===============1078299477239721265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: FILELIST: added "/usr/share/icons/Adwaita/symbolic/places/folder-projects-symbolic.svg"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: PKGSIZE changed from 753232 to 563079 (-25%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: FILELIST: added "/usr/share/icons/Adwaita/scalable/places/folder-projects.svg"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PKGSIZE changed from 497122 to 401509 (-19%)
Changes to packages/all-poky-linux/adwaita-icon-theme (sysroot):
  /usr/share/icons/Adwaita/scalable/places/folder-projects.svg was added
  /usr/share/icons/Adwaita/symbolic/places/folder-projects-symbolic.svg was added

--===============1078299477239721265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: PV changed from "50.0" to "51.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-cursors: PKGV changed from 50.0 [default] to 51.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-dbg: PV changed from "50.0" to "51.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-dbg: PKGV changed from 50.0 [default] to 51.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-dev: PV changed from "50.0" to "51.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-dev: PKGV changed from 50.0 [default] to 51.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-doc: PV changed from "50.0" to "51.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-doc: PKGV changed from 50.0 [default] to 51.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-locale: PV changed from "50.0" to "51.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-locale: PKGV changed from 50.0 [default] to 51.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-src: PV changed from "50.0" to "51.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-src: PKGV changed from 50.0 [default] to 51.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-staticdev: PV changed from "50.0" to "51.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-staticdev: PKGV changed from 50.0 [default] to 51.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: PV changed from "50.0" to "51.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: PKGV changed from 50.0 [default] to 51.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: PKGSIZE changed from 753232 to 563079 (-25%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme-symbolic: FILELIST: added "/usr/share/icons/Adwaita/symbolic/places/folder-projects-symbolic.svg"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PV changed from "50.0" to "51.0"
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PKGV changed from 50.0 [default] to 51.0 [default]
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: PKGSIZE changed from 497122 to 401509 (-19%)
packages/all-poky-linux/adwaita-icon-theme/adwaita-icon-theme: FILELIST: added "/usr/share/icons/Adwaita/scalable/places/folder-projects.svg"
packages/all-poky-linux/adwaita-icon-theme: PV changed from "50.0" to "51.0"
packages/all-poky-linux/adwaita-icon-theme: SRC_URI changed from "https://download.gnome.org/sources//adwaita-icon-theme/50/adwaita-icon-theme-50.0.tar.xz;name=archive" to "https://download.gnome.org/sources//adwaita-icon-theme/51/adwaita-icon-theme-51.0.tar.xz;name=archive"
packages/all-poky-linux/adwaita-icon-theme: PKGV changed from 50.0 [default] to 51.0 [default]
Changes to packages/all-poky-linux/adwaita-icon-theme (sysroot):
  /usr/share/icons/Adwaita/scalable/places/folder-projects.svg was added
  /usr/share/icons/Adwaita/symbolic/places/folder-projects-symbolic.svg was added

--===============1078299477239721265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="adwaita-icon-theme-changelog.txt"

Changelog for adwaita-icon-theme: 50.0 -> 51.0
Source: NEWS

51.0
51.beta
- XDG Projects folder (issue #219)

--===============1078299477239721265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1993 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-c9aeff05360a5ac7d4753bf959126541308ec6ed"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:c9aeff05360a5ac7d4753bf959126541308ec6ed"
meta-yocto-bsp       
meta-poky            = "master:7e41504cd63b099b214f10d92cfdaf358ab98c5f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 955 Local 679 Mirrors 0 Missed 276 Current 382 (71% match, 79% complete)
done.
Removing 11 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 501 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 623 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 645 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 646 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 666 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_create_spdx_setscene)
NOTE: Running setscene task 672 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 688 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 693 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-mako_1.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 696 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 701 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 717 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 724 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 726 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 730 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 732 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.58.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-mako-native-1.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-native-4.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-native-2.44.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 734 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-native-78.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 737 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-protocols-1.49-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 741 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 748 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 750 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/glslang/glslang_1.4.357.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 754 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pango-1.58.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 766 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 767 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-mako-native-1.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 774 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-native-2.44.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-native-4.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 777 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 778 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 779 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 784 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 786 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: recipe icu-native-78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 787 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.58.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glslang-native-1_1.4.357.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 796 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_create_recipe_spdx_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 797 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 806 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyyaml-native-6.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 808 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 809 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pango-1.58.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 810 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_spdx_setscene)
NOTE: recipe glslang-native-1_1.4.357.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 822 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 823 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 828 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 830 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 831 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 833 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_create_spdx_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 836 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 842 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.49-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 847 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 852 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 853 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 854 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 855 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 862 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 873 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 878 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_spdx_setscene)
NOTE: Running setscene task 886 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 887 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 889 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.49.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 893 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-14.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 894 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 895 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe wayland-native-1.26.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 898 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 900 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-native-1.26.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 902 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xorgproto-native-2025.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 903 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 904 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 912 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 913 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shared-mime-info-native-2.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xorgproto-native-2025.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 914 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 920 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 923 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 925 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 926 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 929 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 931 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_26.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 932 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gperf/gperf_3.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 933 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe harfbuzz-14.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 934 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 935 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 938 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 939 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.42.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 940 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 948 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gperf-native-3.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 951 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 954 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 955 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libdrm-2.4.134-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 958 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.42.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 959 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe icu-78.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 960 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-native-2025.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gperf-native-3.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 963 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 966 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 967 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 968 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 971 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-native-2025.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 974 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 975 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 976 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 977 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 978 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 981 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 983 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 985 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 987 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 991 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 997 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 999 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_create_recipe_spdx_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1004 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1006 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1008 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1010 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1011 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1012 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_recipe_spdx_setscene)
NOTE: recipe mesa-2_26.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1013 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.48-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1014 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1015 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1021 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1025 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1026 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1027 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1031 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1033 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1034 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1039 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1041 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1047 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1049 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-native-1.86.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1050 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xmlto-native-0.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1052 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1053 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1055 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.8.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1056 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xmlto-native-0.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1061 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1062 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1063 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1064 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1065 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe expat-2.8.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1068 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1074 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1075 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1076 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1078 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_recipe_qa_setscene)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1081 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1084 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1085 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1086 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1090 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-native-1_1.20.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1092 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1094 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1096 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk-doc-native-1.36.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1099 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1101 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1102 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1103 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1106 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1107 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1109 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1110 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1112 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.18.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1113 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1114 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1115 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1118 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-native-1_2.88.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1119 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1122 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1125 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1126 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1127 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1128 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1130 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1131 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1133 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_recipe_spdx_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1135 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/gettext/gettext_1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1137 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1141 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1143 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1146 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_recipe_qa_setscene)
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1147 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1148 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1149 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe docbook-xml-dtd4-native-4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1152 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1155 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.42.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1157 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1159 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxslt-native-1.1.45-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1160 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1166 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1167 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1168 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1170 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gettext-native-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1172 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1173 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1174 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1175 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe docbook-xsl-stylesheets-native-1.79.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1176 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1177 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1179 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1180 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1183 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1184 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1186 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1187 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1188 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1189 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1190 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1191 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1192 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1193 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1194 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1195 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1197 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1198 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1200 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1202 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1203 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1205 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1208 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.42.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1210 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1211 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1212 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1215 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1216 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1217 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.42.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1218 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1221 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1227 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1229 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1230 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1231 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1232 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1233 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1239 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1241 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1242 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1243 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1245 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1249 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1250 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1251 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1257 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1259 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1260 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.8.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1261 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1263 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1264 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.53.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1265 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1266 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1268 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1269 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1270 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1271 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1272 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1276 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2025.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1277 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1281 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.53.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1282 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1283 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1285 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1291 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1297 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1299 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe bison-native-3.8.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1301 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1302 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1303 of 1337 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/flex/flex_2.6.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 626 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_fetch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1305 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_fetch: Started
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 829 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 894 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_unpack)
NOTE: Running task 906 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_fetch)
NOTE: Running task 920 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_fetch)
NOTE: Running task 922 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_fetch)
NOTE: Running task 929 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_write_config)
NOTE: Running task 934 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_fetch)
NOTE: Running task 942 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_fetch)
NOTE: recipe flex-native-2.6.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1034 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_write_config)
NOTE: Running task 1037 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: Running task 1039 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_fetch)
NOTE: Running task 1041 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_unpack)
NOTE: Running task 1042 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_fetch)
NOTE: Running task 1047 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: Running task 1051 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1309 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.48-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_write_config: Started
NOTE: recipe xorgproto-2025.1-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_fetch: Started
NOTE: recipe util-linux-2.42.3-r0: task do_fetch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_fetch: Succeeded
NOTE: Running task 1052 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_unpack)
NOTE: recipe util-linux-2.42.3-r0: task do_fetch: Succeeded
NOTE: Running task 1053 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_write_config: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Started
NOTE: recipe xorgproto-2025.1-r0: task do_write_config: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: Running task 1054 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: Running task 1055 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_fetch: Started
NOTE: Running task 1056 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_fetch: Succeeded
NOTE: Running task 1062 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_fetch)
NOTE: Running task 1064 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_unpack)
NOTE: Running task 1065 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_unpack)
NOTE: Running task 1066 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_write_config: Succeeded
NOTE: Running task 1074 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe xorgproto-2025.1-r0: task do_unpack: Started
NOTE: Running task 1077 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_unpack)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1310 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.3-r0: task do_unpack: Started
NOTE: Running setscene task 1311 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1314 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: Running setscene task 1315 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.58-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_unpack: Started
NOTE: Running setscene task 1316 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1078 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: Running task 1079 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_patch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1082 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1083 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_patch)
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Started
NOTE: recipe libpng-1.6.58-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Succeeded
NOTE: Running task 1086 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_unpack)
NOTE: Running task 1087 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_patch)
NOTE: Running task 1088 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1089 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1090 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1091 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1092 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Started
NOTE: recipe xorgproto-2025.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 1321 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1322 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1095 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: Running task 1098 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_unpack)
NOTE: recipe libpng-1.6.58-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: Running task 1099 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_patch: Succeeded
NOTE: Running task 1101 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1102 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: Running task 1103 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe xtrans-1_1.6.0-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 1104 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_unpack)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: Running task 1105 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: recipe libpng-1.6.58-r0: task do_patch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1109 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_patch)
NOTE: Running task 1112 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_write_config)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: Running task 1122 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_fetch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: Running task 1125 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_write_config)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1126 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_patch)
NOTE: Running setscene task 1323 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1325 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_patch: Started
NOTE: recipe wayland-1.26.0-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1326 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1327 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: Running task 1138 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_patch)
NOTE: Running task 1139 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1148 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_write_config: Succeeded
NOTE: Running task 1149 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1164 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_fetch)
NOTE: Running task 1173 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_write_config)
NOTE: Running task 1189 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_patch: Started
NOTE: Running task 1190 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_patch)
NOTE: Running task 1195 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_recipe_spdx)
NOTE: recipe wayland-1.26.0-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_fetch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1333 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Started
NOTE: recipe wayland-1.26.0-r0: task do_write_config: Started
NOTE: Running setscene task 1335 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 1209 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_unpack)
NOTE: Running task 1218 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Succeeded
NOTE: Running task 1224 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_fetch)
NOTE: recipe libx11-1_1.8.13-r0: task do_patch: Started
NOTE: recipe wayland-1.26.0-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1226 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_patch)
NOTE: Running task 1229 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.3-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1230 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_patch)
NOTE: recipe icu-78.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Succeeded
NOTE: Running task 1234 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_unpack)
NOTE: recipe freetype-2.14.3-r0: task do_fetch: Started
NOTE: Running task 1235 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_patch)
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Started
NOTE: recipe wayland-1.26.0-r0: task do_patch: Started
NOTE: recipe freetype-2.14.3-r0: task do_fetch: Succeeded
NOTE: Running task 1254 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_patch)
NOTE: recipe libxml2-2.15.4-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1281 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_fetch)
NOTE: Running task 1282 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_unpack)
NOTE: Running task 1284 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_fetch)
NOTE: Running task 1295 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_fetch)
NOTE: Running task 1296 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_unpack)
NOTE: recipe libx11-1_1.8.13-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Started
NOTE: Running task 1310 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Started
NOTE: recipe util-linux-2.42.3-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Succeeded
NOTE: Running task 1311 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_patch)
NOTE: recipe xorgproto-2025.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_patch: Started
NOTE: Running task 1313 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_fetch: Started
NOTE: recipe freetype-2.14.3-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1408 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.26.0-r0: task do_patch: Succeeded
NOTE: Running task 1473 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1478 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1485 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1491 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1492 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1493 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Succeeded
NOTE: Running task 1509 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_patch)
NOTE: recipe xorgproto-2025.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.14.3-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1510 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Started
NOTE: recipe freetype-2.14.3-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1512 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1547 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_fetch)
NOTE: recipe freetype-2.14.3-r0: task do_patch: Succeeded
NOTE: Running task 1549 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 1550 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_configure)
NOTE: Running task 1551 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_configure)
NOTE: recipe libxml2-2.15.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1552 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_configure)
NOTE: Running task 1553 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_unpack: Started
NOTE: Running task 1554 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_configure)
NOTE: Running task 1555 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_configure)
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: Running task 1558 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1566 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_configure: Started
NOTE: Running task 1574 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1575 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_patch)
NOTE: recipe libxml2-2.15.4-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Started
NOTE: recipe libpng-1.6.58-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe xorgproto-2025.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1576 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_fetch: Started
NOTE: Running task 1589 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_fetch)
NOTE: recipe util-linux-2.42.3-r0: task do_patch: Succeeded
NOTE: Running task 1600 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_unpack)
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 1601 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_fetch: Succeeded
NOTE: recipe icu-78.3-r0: task do_fetch: Succeeded
NOTE: Running task 1633 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_write_config)
NOTE: Running task 1634 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_unpack)
NOTE: Running task 1635 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_unpack)
NOTE: recipe xorgproto-2025.1-r0: task do_configure: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1636 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.18.3-r0: task do_fetch: Succeeded
NOTE: Running task 1652 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_unpack)
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe freetype-2.14.3-r0: task do_write_config: Started
NOTE: Running task 1653 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_patch)
NOTE: recipe icu-78.3-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_write_config: Succeeded
NOTE: Running task 1654 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_patch)
NOTE: Running task 1656 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Started
NOTE: recipe icu-78.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: Running task 1658 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1660 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_patch)
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1663 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Started
NOTE: Running task 1664 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1665 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_write_config: Started
NOTE: recipe icu-78.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Succeeded
NOTE: Running task 1669 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_unpack)
NOTE: Running task 1673 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_write_config: Succeeded
NOTE: Running task 1679 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1684 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_unpack)
NOTE: Running task 1686 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_recipe_spdx)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_unpack: Started
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx: Started
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: Running task 1687 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: recipe fontconfig-2.18.3-r0: task do_unpack: Succeeded
NOTE: Running task 1688 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_unpack: Succeeded
NOTE: Running task 1689 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_patch)
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1690 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_recipe_spdx)
NOTE: recipe fontconfig-2.18.3-r0: task do_patch: Started
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: Running task 1692 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpciaccess-0.19-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 1714 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_fetch)
NOTE: Running task 1736 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_fetch)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Started
NOTE: Running task 1749 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_fetch)
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 1750 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Succeeded
NOTE: Running task 1751 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Started
NOTE: Running task 1752 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx)
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 1753 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_fetch)
NOTE: recipe libdrm-2.4.134-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1784 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_write_config)
NOTE: recipe libdrm-2.4.134-r0: task do_fetch: Succeeded
NOTE: Running task 1815 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1818 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_write_config: Started
NOTE: recipe xorgproto-2025.1-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_26.2.2-r0: task do_fetch: Started
NOTE: Running task 1819 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_26.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1827 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_unpack)
NOTE: Running task 1829 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_generate_toolchain_file)
NOTE: recipe libpciaccess-0.19-r0: task do_unpack: Started
NOTE: recipe icu-78.3-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1830 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_recipe_spdx)
NOTE: recipe libpciaccess-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1831 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_patch)
NOTE: Running task 1832 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_patch)
NOTE: recipe xorgproto-2025.1-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1833 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_patch)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_compile: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_patch: Started
NOTE: Running task 1834 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-78.3-r0: task do_patch: Started
NOTE: Running task 1835 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_install)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe icu-78.3-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1837 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_make_icudata)
NOTE: Running task 1838 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_configure)
NOTE: Running task 1841 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_fetch)
NOTE: Running task 1842 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_fetch)
NOTE: Running task 1845 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_write_config)
NOTE: recipe xorgproto-2025.1-r0: task do_install: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_fetch: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_configure: Started
NOTE: recipe icu-78.3-r0: task do_make_icudata: Started
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1846 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_unpack)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_write_config: Succeeded
NOTE: recipe icu-78.3-r0: task do_make_icudata: Succeeded
NOTE: Running task 1867 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1868 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_configure)
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1869 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1871 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe icu-78.3-r0: task do_configure: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Started
NOTE: recipe cairo-1.18.4-r0: task do_fetch: Succeeded
NOTE: Running task 1873 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1875 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: Running task 1881 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1882 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_compile)
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1883 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Started
NOTE: Running task 1884 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 1885 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: Running task 1886 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_compile)
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Started
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1887 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: Running task 1888 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1889 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1890 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_install)
NOTE: recipe xorgproto-2025.1-r0: task do_install: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_unpack: Started
NOTE: Running task 1891 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot)
NOTE: recipe libdrm-2.4.134-r0: task do_unpack: Succeeded
NOTE: Running task 1892 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_package)
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2025.1-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1893 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1894 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_compile)
NOTE: recipe xrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Started
NOTE: recipe xorgproto-2025.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1896 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_populate_sysroot unihash changed to c666135f3c07328cbe309b6075f0733841d4f072a9dd468016e7cd6392c839d3
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1897 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_install)
NOTE: Running task 1898 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1899 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Started
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: Running task 1900 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: Running task 1901 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1902 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1903 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_configure)
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1904 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_compile)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 1905 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_compile: Started
NOTE: Running task 1906 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot)
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1907 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_install)
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Started
NOTE: Running task 1908 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot unihash changed to 42f7de6e0e5dbcf489ce21a1236d4c4347e398aa235f2b3efa8b0f3921584fc6
NOTE: recipe xtrans-1_1.6.0-r0: task do_configure: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2025.1-r0: task do_package: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_package unihash changed to 8fa8506c74e05068a128265129a0eb7c86f046dba839c76ad739af7133f3b020
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot unihash changed to cdb9967ad5b9da823c1b57b2fc38cfdd8efc44b0f4f048fbcb8653594d35c954
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_packagedata_setscene)
NOTE: Running task 1909 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_compile)
NOTE: Running task 1910 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_unpack)
NOTE: Running task 1911 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_patch)
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.134-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1912 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_install)
NOTE: recipe xorgproto-2025.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libdrm-2.4.134-r0: task do_patch: Succeeded
NOTE: Running task 1914 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb:do_create_spdx)
NOTE: Running task 1915 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_patch)
NOTE: recipe xtrans-1_1.6.0-r0: task do_install: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 1916 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_write_config)
NOTE: recipe xtrans-1_1.6.0-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_write_config: Started
NOTE: Running task 1917 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot)
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_write_config: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package unihash changed to 62090a8e8a01036417803faf9948444c009ab9752b97dc1774528900c6422626
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata became valid
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2025.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Succeeded
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running task 1918 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_package)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1923 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_compile)
NOTE: Running task 1924 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_patch)
NOTE: Running task 1932 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_package: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package unihash changed to 376f802beffb6391b0ad6efdfc1c483acec0419f40d240a69bdaf5fb18603a68
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata became valid
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot unihash changed to 2e260ac73c7155f69d120e8ae8bf09c8c73bcb3b5b47e4ea19c02101ad547724
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot unihash changed to 98c5af0e2b75469d1ab72e4809add296fd30a299eeea66dac4e392da5b5e9f7c
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running task 1933 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_install)
NOTE: Running task 1934 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_configure_ptest_base)
NOTE: Running task 1936 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1939 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1943 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: Running task 1955 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_write_config)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.58-r0: task do_configure_ptest_base: Started
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_write_config: Started
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.58-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1956 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_compile)
NOTE: recipe fontconfig-2.18.3-r0: task do_write_config: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: Running task 1984 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: Running task 2019 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_unpack)
NOTE: Running task 2020 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_unpack)
NOTE: recipe libpng-1.6.58-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_unpack: Started
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2021 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_configure)
NOTE: recipe libxi-1_1.8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2024 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_patch)
NOTE: recipe libxml2-2.15.4-r0: task do_configure: Succeeded
NOTE: Running task 2025 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_configure_ptest_base)
NOTE: recipe libxi-1_1.8.3-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f0aa88e3c9fe4568c522cd7c8c986e1f301d8f6a83227a8313f97a5121401199
NOTE: Setscene tasks completed
NOTE: recipe libxml2-2.15.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 2063 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_write_config)
NOTE: recipe libxi-1_1.8.3-r0: task do_patch: Succeeded
NOTE: Running task 2064 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.15.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2065 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_compile)
NOTE: recipe libpciaccess-0.19-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.19-r0: task do_write_config: Succeeded
NOTE: Running task 2078 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_write_config)
NOTE: recipe libxml2-2.15.4-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Succeeded
NOTE: Running task 2079 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_write_config: Succeeded
NOTE: Running task 2080 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package)
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Started
NOTE: recipe icu-78.3-r0: task do_configure: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2081 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_configure_ptest_base)
NOTE: Running task 2082 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_configure)
NOTE: recipe icu-78.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libpciaccess-0.19-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot unihash changed to af228681426d2fe8d6589a95bb71573f76fd0b942dd8ac5c2e1a12b203e6afa4
NOTE: recipe icu-78.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2083 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_compile)
NOTE: recipe xtrans-1_1.6.0-r0: task do_package: Succeeded
NOTE: Running task 2090 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_write_config)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_fetch: Succeeded
NOTE: Running task 2091 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_unpack)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_package unihash changed to 4f15faaa4a8891a9a3c25388b399a8492fbede47de1213f736b73654a4d80094
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata became valid
NOTE: recipe cairo-1.18.4-r0: task do_unpack: Succeeded
NOTE: recipe icu-78.3-r0: task do_compile: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: Running task 2092 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2093 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_patch)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2095 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_patch: Succeeded
NOTE: Running task 2101 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_write_config)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2102 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_unpack)
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_write_config: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2103 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_write_config)
NOTE: Running task 2104 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_write_config)
NOTE: recipe libpcre2-10.48-r0: task do_configure: Succeeded
NOTE: Running task 2105 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_configure_ptest_base)
NOTE: recipe libdrm-2.4.134-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_write_config: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package unihash changed to bfc1bae6a35a30cfa1fac53762fedc6a0a4efd61462462dac3f57d4f2530cf1c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata became valid
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_write_config: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_write_config: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_configure_ptest_base: Started
NOTE: recipe libpcre2-10.48-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running task 2106 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_compile)
NOTE: Running task 2107 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_patch)
NOTE: Running task 2108 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_configure)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.48-r0: task do_compile: Started
NOTE: Running task 2255 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_fetch)
NOTE: Running task 2256 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_fetch)
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_patch: Succeeded
NOTE: Running task 2258 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_generate_toolchain_file)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2260 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_fetch)
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Succeeded
NOTE: Running task 2261 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.48-r0: task do_fetch: Succeeded
NOTE: Running task 2262 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_generate_toolchain_file: Started
NOTE: Setscene tasks completed
NOTE: Running task 2263 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_patch)
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: Running task 2264 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_configure)
NOTE: recipe fribidi-1.0.16-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-14.4.0-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2267 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_write_config)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_patch: Started
NOTE: Running task 2275 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_configure: Started
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2277 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_generate_toolchain_file)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2278 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_install)
NOTE: recipe cairo-1.18.4-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-14.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2302 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx)
NOTE: Running task 2304 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_unpack)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_install: Started
NOTE: Running task 2305 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2306 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_unpack)
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.19-r0: task do_configure: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Succeeded
NOTE: Running task 2307 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.48-r0: task do_unpack: Succeeded
NOTE: Running task 2308 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: Running task 2309 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_compile)
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_install: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2310 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_populate_sysroot)
NOTE: recipe fribidi-1.0.16-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2312 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx)
NOTE: Running task 2313 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx)
NOTE: Running task 2314 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_patch)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_configure: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx: Started
NOTE: Running task 2315 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_compile)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_patch: Succeeded
NOTE: Running task 2316 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_patch)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_compile: Succeeded
NOTE: Running task 2317 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_install)
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_compile: Succeeded
NOTE: Running task 2318 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_install)
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2319 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_install: Started
NOTE: Running task 2320 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Succeeded
NOTE: Running task 2327 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_fetch)
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_populate_sysroot unihash changed to a34b0c19b9e0b03ad2305102ea3263cac1a35edcc7576027b5a92e70cbf421ed
NOTE: recipe libxkbcommon-1.13.2-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2328 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_fetch)
NOTE: recipe libpng-1.6.58-r0: task do_compile: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_patch: Succeeded
NOTE: Running task 2329 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_compile_ptest_base)
NOTE: Running task 2330 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2331 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_fetch)
NOTE: recipe pango-1.58.2-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.58-r0: task do_compile_ptest_base: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe pango-1.58.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Started
NOTE: Running task 2332 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_fetch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 2333 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_fetch)
NOTE: recipe libpng-1.6.58-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2334 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_install)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_install: Succeeded
NOTE: Running task 2335 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2336 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_fetch: Succeeded
NOTE: Running task 2347 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_recipe_spdx)
NOTE: recipe libpng-1.6.58-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx: Started
NOTE: Running task 2356 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe mesa-2_26.2.2-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2357 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_write_config: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_install: Succeeded
NOTE: Running task 2358 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot)
NOTE: recipe mesa-2_26.2.2-r0: task do_write_config: Succeeded
NOTE: Running task 2361 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_recipe_spdx)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2371 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_package)
NOTE: recipe harfbuzz-14.4.0-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2372 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_patch)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot: Started
NOTE: Running task 2384 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_unpack)
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_patch: Started
NOTE: recipe pango-1.58.2-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_populate_sysroot unihash changed to 307eaa691a14c6871e2b08b04ed1cdafb5023dc1c29a21d3d564d429e4d6d34a
NOTE: recipe harfbuzz-14.4.0-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2385 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_install_ptest_base)
NOTE: recipe freetype-2.14.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2386 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe mesa-2_26.2.2-r0: task do_patch: Succeeded
NOTE: Running task 2387 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_unpack)
NOTE: Running task 2388 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_unpack)
NOTE: Setscene tasks completed
NOTE: Running task 2390 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe pango-1.58.2-r0: task do_unpack: Succeeded
NOTE: Running task 2391 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.58-r0: task do_install_ptest_base: Started
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.60.6-r0: task do_unpack: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_rust_gen_targets: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot unihash changed to 9ead20aa79bf81327c31cde72dd09f3ccf8d379ffd1af7a23b1413126b7d28e0
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_26.2.2-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Succeeded
NOTE: recipe at-spi2-core-2.60.6-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2392 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_compile)
NOTE: Running task 2393 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2394 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_patch)
NOTE: Running task 2395 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_patch)
NOTE: Running task 2396 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_patch)
NOTE: Running task 2397 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_patch)
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.134-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.58.2-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.60.6-r0: task do_patch: Succeeded
NOTE: Running task 2403 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2409 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_fetch)
NOTE: Running task 2449 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_write_config)
NOTE: recipe pango-1.58.2-r0: task do_patch: Succeeded
NOTE: Running task 2450 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_write_config: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Succeeded
NOTE: Running task 2451 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_write_config)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_write_config: Succeeded
NOTE: Running task 2452 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_write_config)
NOTE: recipe libxft-1_2.3.9-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2453 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 2454 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_configure)
NOTE: recipe libxft-1_2.3.9-r0: task do_write_config: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Started
NOTE: Running task 2455 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Succeeded
NOTE: Running task 2456 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot)
NOTE: recipe fribidi-1.0.16-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: Running task 2457 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package)
NOTE: Running task 2458 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_unpack)
NOTE: recipe libdrm-2.4.134-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2459 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_write_config)
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 2468 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_unpack)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2469 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_configure)
NOTE: recipe harfbuzz-14.4.0-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Started
NOTE: Running task 2471 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_package)
NOTE: recipe xkeyboard-config-2.48-r0: task do_configure: Started
NOTE: recipe libpng-1.6.58-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2472 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_package: Started
NOTE: recipe fribidi-1.0.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2473 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_package)
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot unihash changed to 6e28b2a1525a556fb9c08043c9295b2cd04e35920866b74e68170557e913f650
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe libpng-1.6.58-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_package unihash changed to 056acf80bfbe871f7387189395609ba71ff805b7e059a39da53c79412b36fda2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_packagedata became valid
NOTE: Running setscene task 1328 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_packagedata_setscene)
NOTE: Running task 2474 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2475 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_compile)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_unpack: Succeeded
NOTE: Running task 2476 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_patch)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_patch: Started
NOTE: recipe libpng-1.6.58-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_populate_sysroot unihash changed to 3f15085cac5331a17e5d8c21b63fd152d00ab3eab228d9b200defd31ee8b5e85
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2477 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_patch: Succeeded
NOTE: Running task 2479 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_configure)
NOTE: recipe libcap-ng-0.9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2484 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_package)
NOTE: Running task 2485 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_configure)
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2486 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_patch)
NOTE: recipe freetype-2.14.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.19-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Succeeded
NOTE: Running task 2522 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_create_recipe_spdx)
NOTE: recipe libxml2-2.15.4-r0: task do_compile: Succeeded
NOTE: Running task 2523 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_compile_ptest_base)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2524 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_install)
NOTE: recipe freetype-2.14.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_compile_ptest_base: Started
NOTE: Running task 2525 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_configure)
NOTE: recipe libxml2-2.15.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Started
NOTE: Running task 2526 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_install)
NOTE: recipe freetype-2.14.3-r0: task do_configure: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2527 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_recipe_spdx)
NOTE: recipe libxml2-2.15.4-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_configure: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2528 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_compile)
NOTE: recipe xkeyboard-config-2.48-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 2529 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot)
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2530 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxml2-2.15.4-r0: task do_install: Succeeded
NOTE: Running task 2531 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_install_ptest_base)
NOTE: recipe libdrm-2.4.134-r0: task do_configure: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_package: Succeeded
NOTE: Running task 2532 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_package unihash changed to f15ca6feccbb4a856bf577392447d7c337970edaf3c070414ffedeb66a36b258
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata became valid
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot unihash changed to c14b410ba106ea40e32e0fbfdd938734cf85c6ace924a6d58dff511873604abb
NOTE: recipe xkeyboard-config-2.48-r0: task do_compile: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_compile: Started
NOTE: recipe libxml2-2.15.4-r0: task do_install_ptest_base: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_package unihash changed to b5cc09cd08d336b6f877c447d174753cd719ae21742183208fc0b29e3ffd93c5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_packagedata became valid
NOTE: Running setscene task 1289 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 1296 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_packagedata_setscene)
NOTE: Running task 2533 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2534 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_install)
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_install: Started
NOTE: recipe fribidi-1.0.16-r0: task do_configure: Succeeded
NOTE: Running task 2535 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_compile)
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2545 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2547 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_write_config)
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2548 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_write_config: Succeeded
NOTE: Running task 2549 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_write_config)
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Started
NOTE: recipe pango-1.58.2-r0: task do_write_config: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2550 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe pango-1.58.2-r0: task do_write_config: Succeeded
NOTE: Running task 2551 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 2552 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_write_config)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_write_config: Succeeded
NOTE: Running task 2600 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_recipe_spdx)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2605 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe libice-1_1.1.2-r0: task do_configure: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2606 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_compile)
NOTE: Running task 2607 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_compile)
NOTE: recipe initscripts-1.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Succeeded
NOTE: Running task 2608 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_install)
NOTE: recipe freetype-2.14.3-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.2-r0: task do_compile: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2610 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_install: Succeeded
NOTE: Running task 2611 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.134-r0: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 2612 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_install)
NOTE: recipe libpcre2-10.48-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package unihash changed to 14e78754f5adce3f40ad166e9ddbc56183b2ebcca09c13c4ad5459b5f68ec64c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: recipe fribidi-1.0.16-r0: task do_compile: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_install: Started
NOTE: recipe libpng-1.6.58-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_package unihash changed to 8c6a2e0a10ebea5414be8e15cc52b823393ab014851f2db7a715218a9ec6697a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_packagedata became valid
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Succeeded
NOTE: Running setscene task 1324 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 1326 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running task 2613 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_compile_ptest_base)
NOTE: Running task 2614 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot)
NOTE: Running task 2615 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package)
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_populate_sysroot unihash changed to bce672163cc7084957037d5165985dae690a4ed7af338951223c4bc69ce99867
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 2616 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_install)
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_compile_ptest_base: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Started
NOTE: recipe libpcre2-10.48-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2617 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_install)
NOTE: recipe libpng-1.6.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_package: Succeeded
NOTE: Running task 2620 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx)
NOTE: recipe fribidi-1.0.16-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package unihash changed to adc8c1da704ca4b356e87b1eb1449c3cf5d38892c1206d9a78720f022feb84d3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata became valid
NOTE: recipe libice-1_1.1.2-r0: task do_compile: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.48-r0: task do_install: Started
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: Running task 2621 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_install)
NOTE: Running task 2622 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.58.bb:do_create_spdx)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot unihash changed to 71afa48390e038dcc4701acc3b02bdeec92ab62d22188cc0c833359a3c9c04aa
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.58-r0: task do_create_spdx: Started
NOTE: recipe libdrm-2.4.134-r0: task do_install: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_install: Started
NOTE: Running task 2623 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_populate_sysroot)
NOTE: Running task 2624 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2631 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_write_config)
NOTE: Setscene tasks completed
NOTE: Running task 2633 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.134-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_write_config: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_write_config: Succeeded
NOTE: Running task 2647 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_package)
NOTE: recipe fribidi-1.0.16-r0: task do_install: Succeeded
NOTE: Running task 2648 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.48-r0: task do_package: Started
NOTE: recipe libice-1_1.1.2-r0: task do_install: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_install: Succeeded
NOTE: Running task 2649 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot)
NOTE: Running task 2650 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_install_ptest_base)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.58-r0: task do_create_spdx: Succeeded
NOTE: Running task 2651 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.48-r0: task do_install_ptest_base: Started
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_populate_sysroot unihash changed to 3ed00c7411ea13d2416edd75e05f5baa5da21472155ea17c88bb85026982b8d5
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_package: Started
NOTE: Running task 2652 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package)
NOTE: Running task 2653 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_recipe_spdx)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot unihash changed to c38e8fa7b871a8c7d3cacea1205f69c7c7160ce814b3f2ea0ab1dcfeb1ff39d9
NOTE: Running task 2654 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_create_recipe_spdx)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot unihash changed to 74fb6f69d8c5f1ce0a96caa0ff322e678a78bcda5134c0d3613d1785a32d5310
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe fribidi-1.0.16-r0: task do_package: Started
NOTE: recipe libpcre2-10.48-r0: task do_install_ptest_base: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libxi-1_1.8.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Succeeded
NOTE: Running task 2655 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_populate_sysroot)
NOTE: Running task 2656 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package unihash changed to 71eaed9cf712ebd3e3ebc2287ae71e8924dc69e06035724700adae01dacbd50c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata became valid
NOTE: recipe libpcre2-10.48-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running task 2657 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_package)
NOTE: recipe cairo-1.18.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2658 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxi-1_1.8.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_package: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 2660 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx)
NOTE: recipe libpcre2-10.48-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package unihash changed to c92c033df3dd067b3020717fe920908dea6d05f84c62924415e2eb1582371d42
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx became valid
NOTE: Running setscene task 1336 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2662 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_configure)
NOTE: Running task 2672 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_create_recipe_spdx)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_configure: Started
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: Running task 2692 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_create_recipe_spdx)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2695 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_recipe_spdx)
NOTE: recipe freetype-2.14.3-r0: task do_compile: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2696 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_populate_sysroot unihash changed to 113c0b5136353104e936e6c86b7a22f7c4e9c94847bbf3d14aee0c2e962b16e1
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 2697 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2700 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_recipe_spdx)
NOTE: Running task 2701 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_recipe_spdx)
NOTE: recipe libxml2-2.15.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2702 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_populate_sysroot)
NOTE: Running task 2703 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_package)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2704 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.15.4-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2751 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2753 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx)
NOTE: Running task 2754 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_create_recipe_spdx)
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2755 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_configure)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe freetype-2.14.3-r0: task do_install: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_package: Succeeded
NOTE: Running task 2756 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_package unihash changed to f3e765e48c8f4bc24826eb64bb53d5c9e8782fbe9cb7c4a3b110b1dad8b104f3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata became valid
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_configure: Started
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot: Started
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb:do_deploy_source_date_epoch unihash changed to c271d950dec61107c04477c724536b5680f5c325261693e6dcec81c01fdc859e
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe mesa-2_26.2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2757 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_package)
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2762 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_recipe_spdx)
NOTE: Running task 2767 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb:do_write_config)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_populate_sysroot unihash changed to cd7d832453421c0429f5ecd4d5358bbefc84dd213dd2369f05f063cdc2c27726
NOTE: recipe libice-1_1.1.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_package: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_package: Started
NOTE: recipe libice-1_1.1.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_package unihash changed to acc03240f8372f5a2c79b42785d462d071dc65d1732cc3dd3f9d9d97906b84c2
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package unihash changed to d8c8b4a6576deb2c046668c0a9c460f55471275fc2ad13f70112ccaa04b196ae
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata became valid
NOTE: Running setscene task 1327 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1332 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_packagedata_setscene)
NOTE: Running task 2768 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2779 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_create_recipe_spdx)
NOTE: Running task 2781 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_create_spdx)
NOTE: recipe freetype-2.14.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_populate_sysroot unihash changed to b7af99dd54eae8a8bb7fbbff4c1f1ddadc74bd6a62d64f7468a4f0bfcc313a84
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_spdx: Started
NOTE: Running task 2782 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_recipe_spdx)
NOTE: Running task 2787 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_create_recipe_spdx)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2789 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_recipe_spdx)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_recipe_spdx: Started
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2791 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_recipe_spdx)
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2792 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_create_recipe_spdx)
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2793 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_recipe_spdx)
NOTE: recipe wayland-1.26.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2796 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_recipe_spdx)
NOTE: Running task 2800 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx)
NOTE: Running task 2801 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_configure)
NOTE: Running task 2805 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.0.bb:do_create_spdx)
NOTE: recipe fribidi-1.0.16-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2812 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_create_recipe_spdx)
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.26.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2813 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_create_recipe_spdx)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_create_spdx: Started
NOTE: recipe pango-1.58.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2814 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx)
NOTE: recipe dbus-1.16.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2815 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_recipe_spdx)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2816 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-0.9.6-r0: task do_configure: Succeeded
NOTE: Running task 2817 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_compile)
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2818 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_create_recipe_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_compile: Started
NOTE: recipe pango-1.58.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe at-spi2-core-2.60.6-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2828 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_create_spdx)
NOTE: recipe libjpeg-turbo-1_3.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2851 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx)
NOTE: recipe libpciaccess-0.19-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2857 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: Running task 2860 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.48-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.60.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2895 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_recipe_spdx)
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_package unihash changed to b4f33450ee2ff0ee889c541a312b0709c2780f0cb8776c91c266e61ac7b65a31
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_create_recipe_spdx: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 2896 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2899 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.48-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_package unihash changed to 63db883c743b3533088338df87d3c7e0f2b181088b44e320d043176bbc093e44
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_packagedata became valid
NOTE: recipe libdrm-2.4.134-r0: task do_create_spdx: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_package unihash changed to 4d73a05ca9e1ba14cf3bcdde290a35fab38c0e9f3950aa6a9e06e2f6cd811b44
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata became valid
NOTE: Running setscene task 1336 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.48-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2901 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.3.bb:do_create_spdx)
NOTE: recipe libpcre2-10.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2903 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.48.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_spdx: Succeeded
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-10.48-r0: task do_create_spdx: Started
NOTE: recipe freetype-2.14.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_compile: Succeeded
NOTE: recipe libpcre2-10.48-r0: task do_create_spdx: Succeeded
NOTE: Running task 2904 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_install)
NOTE: recipe wayland-1.26.0-r0: task do_configure: Succeeded
NOTE: Running task 2905 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_configure_ptest_base)
NOTE: recipe libcap-ng-0.9.6-r0: task do_install: Started
NOTE: recipe wayland-1.26.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.26.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2906 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_compile)
NOTE: recipe wayland-1.26.0-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_install: Succeeded
NOTE: Running task 2907 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot)
NOTE: Running task 2908 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_package)
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_package: Started
NOTE: recipe wayland-1.26.0-r0: task do_compile: Succeeded
NOTE: Running task 2909 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_compile_ptest_base)
NOTE: recipe wayland-1.26.0-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.26.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2910 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot unihash changed to 21e961ac0c24c5e5373a7d9bf1b08b9eacf72334169e6920db441869775700a9
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 2911 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2912 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_compile)
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Started
NOTE: recipe util-linux-2.42.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.26.0-r0: task do_install: Succeeded
NOTE: recipe util-linux-2.42.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2913 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_install_ptest_base)
NOTE: Running task 2914 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_configure)
NOTE: recipe wayland-1.26.0-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.42.3-r0: task do_configure: Started
NOTE: recipe wayland-1.26.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2915 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_populate_sysroot)
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_populate_sysroot unihash changed to e8b32cc3c46c1176571898efa16e8840d39853de30af85343f3259970ea888aa
NOTE: recipe libcap-ng-0.9.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_package unihash changed to 521a16f100f85fb976f4afd5dfafbea24784ddd94f018beb99e080890cee3ba2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata became valid
NOTE: Running setscene task 1331 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2917 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_spdx)
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2918 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_compile)
NOTE: recipe libsm-1_1.2.6-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_compile: Succeeded
NOTE: Running task 2919 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_install)
NOTE: recipe libsm-1_1.2.6-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2920 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_install)
NOTE: recipe libxcb-1.17.0-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_install: Succeeded
NOTE: Running task 2921 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot)
NOTE: Running task 2922 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot unihash changed to 456e568e5df8bec2e7b4c7a293e229d9ff32bdeee1b39cd1c4fbd5ddaac292ae
NOTE: Setscene tasks completed
NOTE: recipe libsm-1_1.2.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package unihash changed to f4d73df4ae2b8abd813f2ca72e1bf800d310ca11370b7e3e0d5adf9ad40e794b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_install: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2924 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot)
NOTE: Running task 2925 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package)
NOTE: Running task 2926 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot unihash changed to dbc63e440c4956d89cfa71eeaa950ff4c3bbc11dac2fe672dc8fee40959a5335
NOTE: Setscene tasks completed
NOTE: Running task 2927 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2928 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2929 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_configure)
NOTE: recipe libx11-1_1.8.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_configure: Succeeded
NOTE: Running task 2930 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_configure_ptest_base)
NOTE: Running task 2931 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_configure)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_configure: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2932 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_compile)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_configure: Succeeded
NOTE: Running task 2933 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_compile)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_compile: Started
NOTE: recipe libxml2-2.15.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_package unihash changed to 70229806ba0ac66fa98abe03bf218a273ff4a6fb9191359a27755056fcb016ef
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2935 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_package)
NOTE: Running task 2936 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_spdx)
NOTE: recipe wayland-1.26.0-r0: task do_package: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.26.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_package unihash changed to 4ca627647f06fc28c6b6f30342098f376f10f8bd9ac256f3ec51a47b12c6d2b4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package unihash changed to ed496c9012de9efed6cc70cb7d836703ce7a835ca05753df4fc94d5becbcad11
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: recipe libxkbcommon-1.13.2-r0: task do_compile: Succeeded
NOTE: Running setscene task 1327 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running task 2938 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_install)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2940 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_compile: Succeeded
NOTE: Running task 2941 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_install: Succeeded
NOTE: Running task 2942 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2943 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_package)
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2944 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_install)
NOTE: Running task 2945 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_package: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_install: Started
NOTE: recipe wayland-1.26.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_populate_sysroot unihash changed to 9f01c4465f5b6ec4b7a1f9f08fd7e537811e6de9fb5d8dc89b89dd6c67f58491
NOTE: Setscene tasks completed
NOTE: recipe wayland-1.26.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_install: Succeeded
NOTE: Running task 2946 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2947 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_package unihash changed to 7d0fd8675bdc03a0031412b9057bfb90da2c311c5cbdd34d8fede330fed2c5d1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_configure: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_populate_sysroot unihash changed to c6c4a14080fd4cba9bf90b79cca8cf32127bcbf514fa3a16476ea44b9434c412
NOTE: recipe libxkbcommon-1.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2948 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2949 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_compile)
NOTE: Running task 2950 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.3.bb:do_create_spdx)
NOTE: Running task 2952 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_create_spdx)
NOTE: recipe libx11-1_1.8.13-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.88.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2953 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Started
NOTE: recipe icu-78.3-r0: task do_compile: Succeeded
NOTE: Running task 2954 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_compile_ptest_base)
NOTE: recipe icu-78.3-r0: task do_compile_ptest_base: Started
NOTE: recipe util-linux-2.42.3-r0: task do_configure: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2955 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_configure_ptest_base)
NOTE: Running task 2956 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_compile)
NOTE: recipe util-linux-2.42.3-r0: task do_configure_ptest_base: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Started
NOTE: recipe util-linux-2.42.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2957 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_compile)
NOTE: recipe util-linux-2.42.3-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_compile: Succeeded
NOTE: Running task 2958 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_install)
NOTE: recipe libx11-1_1.8.13-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Succeeded
NOTE: Running task 2959 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_install)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Started
NOTE: recipe util-linux-2.42.3-r0: task do_compile: Succeeded
NOTE: Running task 2960 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_compile_ptest_base)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Succeeded
NOTE: recipe util-linux-2.42.3-r0: task do_compile_ptest_base: Started
NOTE: Running task 2961 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot)
NOTE: Running task 2962 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot unihash changed to e198a8fef67bb9083248e8dedc4603ecfd0cdc0248d716d8827f6a9fab22be9e
NOTE: Setscene tasks completed
NOTE: recipe libx11-1_1.8.13-r0: task do_install: Succeeded
NOTE: Running task 2963 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot)
NOTE: Running task 2964 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_package)
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_package: Started
NOTE: recipe util-linux-2.42.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2965 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_install)
NOTE: recipe util-linux-2.42.3-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_populate_sysroot unihash changed to c4753a33ab99597c3047658e54b210a50b1647335989d21cde4aaa589bdb3cb1
NOTE: Running task 2966 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2967 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2968 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2969 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxext-1_1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package unihash changed to 9192629312999e7fd5c894ed58e850b69ed3002a2b2a585ab83e2f782f881383
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2970 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_configure)
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2971 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_configure)
NOTE: Running task 2972 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2974 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx)
NOTE: Running task 2975 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.42.3-r0: task do_install: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 2976 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_install_ptest_base)
NOTE: Running task 2977 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Started
NOTE: recipe util-linux-2.42.3-r0: task do_install_ptest_base: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2978 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_install)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Succeeded
NOTE: Running task 2979 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.42.3-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libx11-1_1.8.13-r0: task do_package: Succeeded
NOTE: Running task 2980 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_package unihash changed to 32118159d061c2ec32556bdd8f460db28826d3f5e9c6a41338af6580c6641120
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata became valid
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-2.42.3-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot unihash changed to 9f22bb161b093395a094ed337a8d42f5a40fd03ea62c2d02b9ff67a02687cc3d
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_packagedata_setscene)
NOTE: Running task 2981 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_package)
NOTE: Running task 2982 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.42.3-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2984 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package)
NOTE: Running task 2985 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.13.bb:do_create_spdx)
NOTE: recipe util-linux-2.42.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_populate_sysroot unihash changed to 5e8768c8ea3e7f3a08865c2e4ad79c89222721832028dab3eb9ff565eb41de9a
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 2986 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2987 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2988 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_configure)
NOTE: recipe fontconfig-2.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2989 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2990 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_configure)
NOTE: recipe fontconfig-2.18.3-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package unihash changed to be67cfa3c444f5d70755fdaad67cab789be69ab1b6784b005cbad2967286f184
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2992 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2993 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_compile)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 2994 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_install)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 2995 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot)
NOTE: Running task 2996 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_package)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot unihash changed to c9cbab5f76d200eab4de0e7b36957b0aa659b3b9852868ba86e11426b25f9814
NOTE: Setscene tasks completed
NOTE: recipe libxrender-1_0.9.12-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2997 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_compile)
NOTE: recipe libxrender-1_0.9.12-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2998 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_compile)
NOTE: recipe libxext-1_1.3.7-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2999 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_compile)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_package unihash changed to bb2a48dfe6682426fa2d8eb068b704fd9fffd144d3ab9f18e9cb3741f9d14316
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata became valid
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Started
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_compile: Succeeded
NOTE: Running task 3000 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_install)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3002 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx)
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3003 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_install)
NOTE: Running task 3004 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_install)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_install: Succeeded
NOTE: Running task 3005 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot)
NOTE: Running task 3006 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_package: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_configure: Succeeded
NOTE: Running task 3007 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_compile)
NOTE: recipe fontconfig-2.18.3-r0: task do_compile: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 3008 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 3009 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package)
NOTE: recipe libxext-1_1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3010 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3011 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_package)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot unihash changed to fefd83b68c47c90c2294c7f8a895df1cae4158dcbbbe23327bc29b0a2504975d
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 3012 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot unihash changed to b8476b66272c8b73ef2e9c92459229191e6a232b896585e1c8a2ad5f16e6d815
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot unihash changed to 541cf89a1bcf4b021ad267c5aa52304351a6d8b0f62bbc70d2715c789881bb3d
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3013 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3014 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3015 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3016 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3017 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3018 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_configure)
NOTE: recipe libxi-1_1.8.3-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3019 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_configure)
NOTE: Running task 3020 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3021 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package unihash changed to 2b0c56746aa4b1b0727a923cdbadd311e71b181e8988dadd75112a5ecac2b0c6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata became valid
NOTE: Running setscene task 1336 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package unihash changed to 4d046cbae37e33e7dcfb2b2db4e1f05037f49a069da33f433d6f53d4a0aed1e8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata became valid
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running task 3023 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_package: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3025 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_package unihash changed to 9fd09f0b85c2e81e6cb3ede70e93951c91a824e3268559c914b23da0baa1b414
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata became valid
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Started
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3027 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_configure: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3028 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_compile)
NOTE: Setscene tasks completed
NOTE: Running task 3029 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_compile)
NOTE: Running task 3030 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_compile)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Succeeded
NOTE: Running task 3031 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_install)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_compile: Succeeded
NOTE: Running task 3032 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Running task 3033 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_install)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Succeeded
NOTE: Running task 3034 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot)
NOTE: Running task 3035 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_package)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_install: Succeeded
NOTE: Running task 3036 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot)
NOTE: Running task 3037 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot: Started
NOTE: Running task 3038 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_package: Started
NOTE: Running task 3039 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot unihash changed to dd089997bc6c29b6f0519d20cf332dc2db3175c72ca085af986e586c6fb136b7
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot unihash changed to 6fded1f64c1b8ee410a54b6e6334c304093b753d60a1749dca081b2f467553b9
NOTE: Running task 3040 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3041 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot unihash changed to 2d15f192d821e8cfb4f1cb09d15c9ba23ede8d51ec44135b3e10937f9a4cb4d6
NOTE: Setscene tasks completed
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3042 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_configure)
NOTE: recipe xrandr-1_1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_configure: Started
NOTE: Running task 3043 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_configure)
NOTE: recipe xrandr-1_1.5.4-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_package unihash changed to f47751a596b1502c5d5c6490bc988fe5a9370da87995e1f06917ae40034f6181
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_package unihash changed to f5b1cf2027669beb3229120912a3293eb58c48f451f389db7edbc1daee7119ae
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata became valid
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package: Succeeded
NOTE: Running setscene task 1333 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3045 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_package unihash changed to 9ed0a2befc108e44ffdfcb1923da8d959a86d2483689ab5ed2bdc894eae93375
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata became valid
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3047 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3049 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_spdx)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_compile: Succeeded
NOTE: Running task 3050 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_install)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3051 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_compile)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3052 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_compile)
NOTE: recipe xrandr-1_1.5.4-r0: task do_compile: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_install: Succeeded
NOTE: Running task 3053 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_populate_sysroot unihash changed to 24f90ff3e5f04b9c6460fe729570824412dd4e6dc4307d327f36f95d6ea69d2c
NOTE: Setscene tasks completed
NOTE: Running task 3054 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-78.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3055 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_install)
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3056 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_configure)
NOTE: recipe icu-78.3-r0: task do_install: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 3057 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_install)
NOTE: recipe xrandr-1_1.5.4-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3058 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3059 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_compile)
NOTE: recipe libxi-1_1.8.3-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_install: Succeeded
NOTE: Running task 3060 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_populate_sysroot)
NOTE: Running task 3061 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_package)
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3062 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_install)
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_populate_sysroot unihash changed to e68766510b1644b7bfc44866a12a1317b56f3ddc31a771fed554f5c474416da8
NOTE: Setscene tasks completed
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Succeeded
NOTE: Running task 3063 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Started
NOTE: Running task 3064 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot)
NOTE: Running task 3065 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_package: Succeeded
NOTE: recipe libxi-1_1.8.3-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_package unihash changed to 47c458851724301a3550a440b1c1db31a40a8afcf2fd277cfd0acc8907ef0884
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running task 3066 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_install)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot unihash changed to c6396a53433c8e29abbc1f8a7f900bd037e33bf528842cb417d302642d082a93
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_configure: Succeeded
NOTE: Running task 3067 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_configure_ptest_base)
NOTE: recipe libxi-1_1.8.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3069 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_spdx)
NOTE: Running task 3070 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_install)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3071 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_compile)
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_compile: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_install: Succeeded
NOTE: Running task 3072 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_populate_sysroot)
NOTE: Running task 3073 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_package)
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxi-1_1.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_package: Started
NOTE: recipe icu-78.3-r0: task do_install: Succeeded
NOTE: Running task 3074 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_install_ptest_base)
NOTE: recipe icu-78.3-r0: task do_install_ptest_base: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_populate_sysroot unihash changed to 99f76da57b9cfebd411f3281d668320bb16377865daf8cc1e8540d5f8fcde81b
NOTE: Setscene tasks completed
NOTE: Running task 3075 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3076 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Started
NOTE: recipe icu-78.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3077 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_populate_sysroot)
NOTE: Running task 3078 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_package)
NOTE: recipe libxtst-1_1.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3079 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_configure)
NOTE: recipe icu-78.3-r0: task do_populate_sysroot: Started
NOTE: recipe icu-78.3-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot unihash changed to 7f162ccbcca117dec2a679fe15ed34eb995617c270b57244b96d60a24fa5b948
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package unihash changed to dbd8bcd2f9d80d3ee98d6f4f07e26ce346d3e8df9393545a6d16b3a9bb61e519
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_compile: Succeeded
NOTE: Running task 3080 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_install)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3082 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx)
NOTE: recipe icu-78.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_populate_sysroot unihash changed to 745b9784f2d35517e5060a68e006abb4407e4f64de4507770d7cbb48065a51d4
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_install: Succeeded
NOTE: Running task 3083 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_populate_sysroot)
NOTE: Running task 3084 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_package)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_populate_sysroot unihash changed to 52dd01214f34557070025bba0f01701e30c20dafb789d1de8250a4936130d0fe
NOTE: Running task 3085 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_26.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_package unihash changed to ee174c4365c94f3ab40b6800b09401d8fa1d9029f5a1ad9019d7db51cdfeb0e4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3087 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.3.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.3-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3088 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe mesa-2_26.2.2-r0: task do_rust_create_wrappers: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3089 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe libxi-1_1.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_26.2.2-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_package unihash changed to 326a62e09e826affb7c38d515765e2bed64c7e150df98168a538bfbe3bbc0778
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_packagedata became valid
NOTE: Running setscene task 1334 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3091 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-loader-1.4.357.0-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.42.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_package unihash changed to 1a013a0a0ffe8419038e0861efa8921c78e111686b0787292414caf116a28e96
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.42.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.42.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3093 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_package)
NOTE: Running task 3094 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.3.bb:do_create_spdx)
NOTE: recipe fontconfig-2.18.3-r0: task do_package: Started
NOTE: recipe util-linux-2.42.3-r0: task do_create_spdx: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_package unihash changed to f97c225b12ef3e119bb9068e1fc2e03ba7246b342a0a3fe469e68abf9e1eaaaa
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.18.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3096 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_package)
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Started
NOTE: recipe util-linux-2.42.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3097 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_create_spdx)
NOTE: recipe fontconfig-2.18.3-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3098 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_compile)
NOTE: recipe fontconfig-2.18.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_package unihash changed to 47bb3da0e11b8888f0e59bab0a26c4d5644d667c396c97f03c19fd275d18de2a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata became valid
NOTE: recipe libxtst-1_1.2.5-r0: task do_compile: Succeeded
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: Running task 3099 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_install)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Started
NOTE: recipe icu-78.3-r0: task do_package: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_install: Succeeded
NOTE: Running task 3100 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_packagedata)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3102 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot)
NOTE: Running task 3103 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package)
NOTE: Running task 3104 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_spdx)
NOTE: recipe icu-78.3-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Started
NOTE: recipe icu-78.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_packagedata unihash changed to 64ce8257a20c1a019f0c534c1afd0c30d71fdb135b64bb85bdcb5013c11da45a
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 3105 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.3.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot unihash changed to a9d943ef8fcaf9e2a374c5e49605fd7a92d0547e3b6f63a4118402f3c6f4a210
NOTE: recipe mesa-2_26.2.2-r0: task do_configure: Succeeded
NOTE: recipe icu-78.3-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Setscene tasks completed
NOTE: Running task 3106 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe mesa-2_26.2.2-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package unihash changed to 709edc3f889e5339794fdcd9b0db65b4ccf6eb4be1dbb3b8814ccaac70ca6acb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-78.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3108 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3109 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3110 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_install)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_install: Succeeded
NOTE: Running task 3111 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3112 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_populate_sysroot)
NOTE: Running task 3113 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_package)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_populate_sysroot unihash changed to 60f6c9abf6b567a26c878e720bc15e605a96c3e7fa90af856948939b8cb2a8a7
NOTE: Setscene tasks completed
NOTE: Running task 3114 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3115 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3116 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3117 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_configure)
NOTE: Running task 3118 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_configure)
NOTE: recipe cairo-1.18.4-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3119 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure)
NOTE: recipe dbus-1.16.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3120 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_compile)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_compile: Started
NOTE: recipe cairo-1.18.4-r0: task do_configure: Succeeded
NOTE: Running task 3121 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_compile)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3122 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_install)
NOTE: recipe cairo-1.18.4-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_install: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure: Succeeded
NOTE: Running task 3123 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3124 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile)
NOTE: recipe dbus-1.16.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_install: Succeeded
NOTE: Running task 3125 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_populate_sysroot unihash changed to 3ce3c205eb0668e8fb6c2764c54f0e37bee6c7d6bb8d21a4188d62182f042e5f
NOTE: Setscene tasks completed
NOTE: Running task 3126 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3127 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile: Succeeded
NOTE: Running task 3128 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3129 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install)
NOTE: recipe dbus-1.16.2-r0: task do_install: Started
NOTE: recipe cairo-1.18.4-r0: task do_compile: Succeeded
NOTE: Running task 3130 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_install)
NOTE: recipe cairo-1.18.4-r0: task do_install: Started
NOTE: recipe cairo-1.18.4-r0: task do_install: Succeeded
NOTE: Running task 3131 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot unihash changed to a933c9f5b6b0d9373d086532f0206f96079e68da61c3ff137a98f1caa41db4cb
NOTE: recipe dbus-1.16.2-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3132 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3133 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install_ptest_base)
NOTE: recipe harfbuzz-14.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3134 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3135 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_configure: Succeeded
NOTE: recipe harfbuzz-14.4.0-r0: task do_configure: Started
NOTE: Running task 3136 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot unihash changed to 5752535d917008a749edb5e47f59ab6f263d86e74dae7eb25ebb51b8ad8ed433
NOTE: Running task 3137 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_configure_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3138 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_compile)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3139 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_configure)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_package unihash changed to 0291455e3cf330a3d563783d2dfeb1c607fe120ba24b26289381a77125c0a86f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3141 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_package)
NOTE: Running task 3142 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_package)
NOTE: Running task 3143 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.88.3.bb:do_create_spdx)
NOTE: Running task 3144 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_package)
NOTE: recipe cairo-1.18.4-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.16.2-r0: task do_package: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3145 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_compile)
NOTE: recipe harfbuzz-14.4.0-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3146 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3147 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_compile_ptest_base)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.88.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3148 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_install)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_install: Started
NOTE: recipe cairo-1.18.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_package unihash changed to e79a866e761ecf1d6541708ca06fe44274b4a35cbb501e3b4481e052c09e0512
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata became valid
NOTE: Running setscene task 1336 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3150 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx: Started
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_package unihash changed to 8892c940047624aa9f36968ade4f61e510e8e6e0921984150537e32657922e24
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata became valid
NOTE: Running setscene task 1336 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_install: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 3151 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_install_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3153 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3154 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_populate_sysroot unihash changed to 783c6232c1b08678e278d39a2265a7a6b1cb79321e8d6ca006ab4b2d77195f05
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package: Succeeded
NOTE: recipe at-spi2-core-2.60.6-r0: task do_compile: Succeeded
NOTE: Running task 3155 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_package unihash changed to 143f254705fa1abd0672cecd80765629c0e0f1b4632d0133606c44b39040db49
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3157 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_package)
NOTE: Running task 3158 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_install: Succeeded
NOTE: Running task 3159 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_populate_sysroot)
NOTE: Running task 3160 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_package)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_populate_sysroot unihash changed to 5bc2f67ca1c588e8d6a58fc599e02293677ed532a715040fd0d3cc8354ace526
NOTE: Setscene tasks completed
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.60.6-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_package unihash changed to 2678d783776adfae7fac2bda3b9623100337510ac3850ccd249f4ddad6834c2f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_package unihash changed to 689b7277495ece35e3a3a371156c4010fd0c41076a08bc950ae04a3fd2bdba8a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.60.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3162 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.60.6.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3164 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.60.6-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_26.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3165 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe mesa-2_26.2.2-r0: task do_install: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_install: Succeeded
NOTE: Running task 3166 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: Running task 3167 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package)
NOTE: recipe mesa-2_26.2.2-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_package: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot unihash changed to e4037d9ab44e47b7f48c1d7ea9c5ad403f8b947de10d9f2f154a99a0e7371cfd
NOTE: Setscene tasks completed
NOTE: Running task 3168 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3169 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3170 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package unihash changed to 2da9a4680e4162f1e96dd7d06a2a7a5fba51dce7b2c00de50523d71cd5f9afd9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata became valid
NOTE: Running setscene task 1336 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_26.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3172 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx)
NOTE: recipe mesa-2_26.2.2-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3173 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_install)
NOTE: recipe harfbuzz-14.4.0-r0: task do_install: Started
NOTE: recipe mesa-2_26.2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-14.4.0-r0: task do_install: Succeeded
NOTE: Running task 3174 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_populate_sysroot)
NOTE: Running task 3175 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_package)
NOTE: recipe harfbuzz-14.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_package: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_populate_sysroot unihash changed to 65c2d9a6ccab98a1f16904c02f1adf3fe1d71c8e9046510082772990c5fc18a0
NOTE: Setscene tasks completed
NOTE: Running task 3176 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe pango-1.58.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pango-1.58.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3177 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_configure)
NOTE: recipe pango-1.58.2-r0: task do_configure: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_package unihash changed to da2862c3e4adce1a4689b2fd9467bcb519226422696f17ed8ad0798d1c5758f3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_packagedata became valid
NOTE: Running setscene task 1335 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-14.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3179 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_14.4.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-14.4.0-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-14.4.0-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.58.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3180 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_compile)
NOTE: recipe pango-1.58.2-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3181 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 3182 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 3183 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot unihash changed to abe4d14de655d242f2c9b1013a23bdc6c443e0471983d3883376d9b5cce42b1d
NOTE: Setscene tasks completed
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package unihash changed to dd478942812091e9a3d0a062614868cee475476ba4f8cfe9df18efd537e2f95d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3185 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.58.2-r0: task do_compile: Succeeded
NOTE: Running task 3186 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_install)
NOTE: recipe pango-1.58.2-r0: task do_install: Started
NOTE: recipe pango-1.58.2-r0: task do_install: Succeeded
NOTE: Running task 3187 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_populate_sysroot)
NOTE: Running task 3188 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_package)
NOTE: recipe pango-1.58.2-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.58.2-r0: task do_package: Started
NOTE: recipe pango-1.58.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_populate_sysroot unihash changed to 8dd8367b5b83c555baf0136a6a7207aeaa77a3601764a40b827cb420a9e2d107
NOTE: Setscene tasks completed
NOTE: Running task 3189 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.52-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3190 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_configure)
NOTE: recipe gtk+3-3.24.52-r0: task do_configure: Started
NOTE: recipe pango-1.58.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_package unihash changed to 44bfb258a8b0d632b3acc2689343cc898ff761bfb4753af9bf2c992e5274d19f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_packagedata became valid
NOTE: Running setscene task 1337 of 1337 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_packagedata_setscene)
NOTE: recipe pango-1.58.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.58.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3192 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_create_spdx)
NOTE: recipe pango-1.58.2-r0: task do_create_spdx: Started
NOTE: recipe pango-1.58.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3193 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_compile)
NOTE: recipe gtk+3-3.24.52-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_compile: Succeeded
NOTE: Running task 3194 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_install)
NOTE: recipe gtk+3-3.24.52-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_install: Succeeded
NOTE: Running task 3195 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_package)
NOTE: Running task 3196 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_populate_sysroot)
NOTE: recipe gtk+3-3.24.52-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_populate_sysroot unihash changed to dbf840dc6d92a2c166b27a528ce133bd08a84bfdd160cb3abbac531fee1468d2
NOTE: Setscene tasks completed
NOTE: Running task 3198 of 3212 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb:do_configure)
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_configure: Started
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_configure: Failed
NOTE: recipe gtk+3-3.24.52-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 3198 tasks of which 2519 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260915054039.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260915054039.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/51.0/temp/log.do_configure.335672
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: adwaita-icon-theme-51.0-r0 do_configure: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:extend_recipe_sysroot(d)
     0003:
File: '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/classes-global/staging.bbclass', lineno: 620, function: extend_recipe_sysroot
     0616:                    if "/bin/" in l or "/sbin/" in l:
     0617:                        # defer /*bin/* files until last in case they need libs
     0618:                        binfiles[l] = (targetdir, dest)
     0619:                    else:
 *** 0620:                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
     0621:
     0622:    # Handle deferred binfiles
     0623:    for l in binfiles:
     0624:        (targetdir, dest) = binfiles[l]
File: '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/classes-global/staging.bbclass', lineno: 165, function: staging_copyfile
     0161:        os.symlink(linkto, dest)
     0162:        #bb.warn(c)
     0163:    else:
     0164:        try:
 *** 0165:            os.link(c, dest)
     0166:        except OSError as err:
     0167:            if err.errno == errno.EXDEV:
     0168:                bb.utils.copyfile(c, dest)
     0169:            else:
Exception: FileExistsError: [Errno 17] File exists: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-components/cortexa15t2hf-neon/bsd-headers/usr/include/sys/cdefs.h' -> '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/51.0/recipe-sysroot/usr/include/sys/cdefs.h'

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/51.0/temp/log.do_configure.335672
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb:do_configure) failed with exit code '1'

--===============1078299477239721265==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-adwaita-icon-theme-upgrade-50.0-51.0.patch"

RnJvbSAxZDlkMDdlNTUzNjRjNWJmNjA5MTMwMGZkZThhNzNjYjI0NWM3NGM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgU2VwIDIwMjYgMDU6NDQ6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
ZHdhaXRhLWljb24tdGhlbWU6IHVwZ3JhZGUgNTAuMCAtPiA1MS4wCgpTb3VyY2U6IE5FV1MKCjUx
LjAKNTEuYmV0YQotIFhERyBQcm9qZWN0cyBmb2xkZXIgKGlzc3VlICMyMTkpCi0tLQogLi4uL3th
ZHdhaXRhLWljb24tdGhlbWVfNTAuMC5iYiA9PiBhZHdhaXRhLWljb24tdGhlbWVfNTEuMC5iYn0g
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2dub21lL3thZHdhaXRhLWljb24tdGhlbWVfNTAuMC5i
YiA9PiBhZHdhaXRhLWljb24tdGhlbWVfNTEuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ25vbWUvZ25vbWUvYWR3YWl0YS1pY29uLXRoZW1lXzUwLjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZ25vbWUvYWR3YWl0YS1pY29uLXRoZW1lXzUxLjAuYmIKc2ltaWxhcml0eSBp
bmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2dub21lL2Fkd2FpdGEtaWNv
bi10aGVtZV81MC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZ25vbWUvYWR3YWl0
YS1pY29uLXRoZW1lXzUxLjAuYmIKaW5kZXggYjBkYzU5MzUzZC4uNzhkYmUwMDBlZSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2dub21lL2Fkd2FpdGEtaWNvbi10aGVtZV81MC4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9nbm9tZS9hZHdhaXRhLWljb24tdGhlbWVfNTEuMC5i
YgpAQCAtMTIsNyArMTIsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT1jODRjYWM4OGU0NmZjMDc2NDdlYTA3ZTZjMjRlZWI3YyBcCiAKIGluaGVyaXQgZ25vbWViYXNl
IGFsbGFyY2ggZ3RrLWljb24tY2FjaGUKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAi
ZmFjNmUwNDAxZmNhNzE0NzgwNTYxYTA4MWI4ZjdlMjdjM2JjMWRiMzRlYmRhNGRhMTc1MDgxZjI2
YjI0ZDQ2MCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImJhNTYxY2YzYzk2MzA1YTQ3
MTc5ZmE1NjA1ODU2YWQ2OTVjOTIzOGVhMDdmNzA5M2FlYmQ5YmE4MGM0ZTMyM2IiCiAKIERFUEVO
RFMgKz0gImxpYnJzdmctbmF0aXZlIgogCi0tIAoyLjQ3LjEKCg==

--===============1078299477239721265==--

