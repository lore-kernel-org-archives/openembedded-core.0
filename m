Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E84E7719C
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:47 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11494.1735723946151979625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=K19Pl/lc;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=K73cG7a6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101942135beaf-0cd9e840-8d97-4025-ab58-b4947c57de8e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723958;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rEX86Mjl9e+h0thaavLg3CYOSKYI/baEAc8Gs3vZlok=;
	b=K19Pl/lc0JqWkiL8O866m11HpnFU04AeZH3lY5LMJLON5pOitNOn0L8xENOWLpDS
	ahJ9mWgEPIArVshjWLHYDkrJi9Occ25Nhl/tWt0RMkhRlFBGd9bMgFwsQjsUgvZveyI
	xhYY5seCMzy5HI00fuAbMlM9sE6aQa//Jbh/TkIU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723958;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rEX86Mjl9e+h0thaavLg3CYOSKYI/baEAc8Gs3vZlok=;
	b=K73cG7a6dKriiNNC4wFLa6BGHxB/pvpgnwPzKnaS6px2mvnzw/FEw71If24grvi/
	zuKo8g3HzuaZjhnV63oP+xwgvU/pW+psSWD0kxobX+1pHdWrsSexXswD5RA7bQrfYzI
	WpAD0oeDiLCfGRbcA4IQNe0YY6x7aQWSr7ItF4Z4=
Content-Type: multipart/mixed; boundary="===============6543810900909748304=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libical: upgrading to 3.0.19 SUCCEEDED
Message-ID: <010101942135beaf-0cd9e840-8d97-4025-ab58-b4947c57de8e-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209247

--===============6543810900909748304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libical* to *3.0.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libical-upgrade-3.0.18-3.0.19.patch
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
From 14797dd7914cf324c8e5bfeea9b3a12510c172cd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 09:18:43 +0000
Subject: [PATCH] libical: upgrade 3.0.18 -> 3.0.19

---
 .../0001-cmake-Do-not-export-CC-into-gir-compiler.patch    | 7 ++-----
 .../libical/{libical_3.0.18.bb => libical_3.0.19.bb}       | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-support/libical/{libical_3.0.18.bb => libical_3.0.19.bb} (96%)

diff --git a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
index 3841c060ee..0a7c696530 100644
--- a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
+++ b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
@@ -1,4 +1,4 @@
-From c06d8a8990c996cbb854508a944202ba70ba7a7c Mon Sep 17 00:00:00 2001
+From 145a0f3919f6884c377a9e6b8a03de707feb45fe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 3 Mar 2022 20:10:04 -0800
 Subject: [PATCH] cmake: Do not export CC into gir compiler
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/cmake/modules/GObjectIntrospectionMacros.cmake b/cmake/modules/GObjectIntrospectionMacros.cmake
-index 83aff931..d7d3f898 100644
+index 83aff93..d7d3f89 100644
 --- a/cmake/modules/GObjectIntrospectionMacros.cmake
 +++ b/cmake/modules/GObjectIntrospectionMacros.cmake
 @@ -50,8 +50,7 @@ macro(gir_add_introspections introspections_girs)
@@ -28,6 +28,3 @@ index 83aff931..d7d3f898 100644
                ${GObjectIntrospection_SCANNER_ARGS}
                --namespace=${_gir_namespace}
                --nsversion=${_gir_version}
--- 
-2.35.1
-
diff --git a/meta/recipes-support/libical/libical_3.0.18.bb b/meta/recipes-support/libical/libical_3.0.19.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.18.bb
rename to meta/recipes-support/libical/libical_3.0.19.bb
index 052ca57cfb..1ee39aa94f 100644
--- a/meta/recipes-support/libical/libical_3.0.18.bb
+++ b/meta/recipes-support/libical/libical_3.0.19.bb
@@ -15,7 +15,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "72b7dc1a5937533aee5a2baefc990983b66b141dd80d43b51f80aced4aae219c"
+SRC_URI[sha256sum] = "6a1e7f0f50a399cbad826bcc286ce10d7151f3df7cc103f641de15160523c73f"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.44.1


--===============6543810900909748304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libical: SRC_URI changed from "https://github.com/libical/libical/releases//download/v3.0.18/libical-3.0.18.tar.gz file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch" to "https://github.com/libical/libical/releases//download/v3.0.19/libical-3.0.19.tar.gz file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch"
packages/core2-64-poky-linux/libical: PV changed from "3.0.18" to "3.0.19"
packages/core2-64-poky-linux/libical: PKGV changed from 3.0.18 [default] to 3.0.19 [default]
packages/core2-64-poky-linux/libical/libical-dbg: PKGSIZE changed from 3560528 to 3570496 (+0%)
packages/core2-64-poky-linux/libical/libical-dbg: FILELIST: removed "/usr/lib/.debug/libicalvcal.so.3.0.18 /usr/lib/.debug/libicalss.so.3.0.18 /usr/lib/.debug/libical-glib.so.3.0.18 /usr/lib/.debug/libical.so.3.0.18 /usr/lib/.debug/libical_cxx.so.3.0.18 /usr/lib/.debug/libicalss_cxx.so.3.0.18", added "/usr/lib/.debug/libical-glib.so.3.0.19 /usr/lib/.debug/libicalss.so.3.0.19 /usr/lib/.debug/libical.so.3.0.19 /usr/lib/.debug/libicalvcal.so.3.0.19 /usr/lib/.debug/libical_cxx.so.3.0.19 /usr/lib/.debug/libicalss_cxx.so.3.0.19"
packages/core2-64-poky-linux/libical/libical-dbg: PV changed from "3.0.18" to "3.0.19"
packages/core2-64-poky-linux/libical/libical-dbg: PKGV changed from 3.0.18 [default] to 3.0.19 [default]
packages/core2-64-poky-linux/libical/libical-dev: PKGSIZE changed from 2984391 to 2984516 (+0%)
packages/core2-64-poky-linux/libical/libical-dev: PV changed from "3.0.18" to "3.0.19"
packages/core2-64-poky-linux/libical/libical-dev: PKGV changed from 3.0.18 [default] to 3.0.19 [default]
packages/core2-64-poky-linux/libical/libical-doc: PV changed from "3.0.18" to "3.0.19"
packages/core2-64-poky-linux/libical/libical-doc: PKGV changed from 3.0.18 [default] to 3.0.19 [default]
packages/core2-64-poky-linux/libical/libical-locale: PV changed from "3.0.18" to "3.0.19"
packages/core2-64-poky-linux/libical/libical-locale: PKGV changed from 3.0.18 [default] to 3.0.19 [default]
packages/core2-64-poky-linux/libical/libical-src: PKGSIZE changed from 3064122 to 3069812 (+0%)
packages/core2-64-poky-linux/libical/libical-src: PV changed from "3.0.18" to "3.0.19"
packages/core2-64-poky-linux/libical/libical-src: PKGV changed from 3.0.18 [default] to 3.0.19 [default]
packages/core2-64-poky-linux/libical/libical-staticdev: PV changed from "3.0.18" to "3.0.19"
packages/core2-64-poky-linux/libical/libical-staticdev: PKGV changed from 3.0.18 [default] to 3.0.19 [default]
packages/core2-64-poky-linux/libical/libical: PKGSIZE changed from 1601887 to 1605983 (+0%)
packages/core2-64-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libical_cxx.so.3.0.18 /usr/lib/libical.so.3.0.18 /usr/lib/libicalvcal.so.3.0.18 /usr/lib/libicalss.so.3.0.18 /usr/lib/libical-glib.so.3.0.18 /usr/lib/libicalss_cxx.so.3.0.18", added "/usr/lib/libical_cxx.so.3.0.19 /usr/lib/libical.so.3.0.19 /usr/lib/libicalvcal.so.3.0.19 /usr/lib/libicalss.so.3.0.19 /usr/lib/libical-glib.so.3.0.19 /usr/lib/libicalss_cxx.so.3.0.19"
packages/core2-64-poky-linux/libical/libical: PV changed from "3.0.18" to "3.0.19"
packages/core2-64-poky-linux/libical/libical: PKGV changed from 3.0.18 [default] to 3.0.19 [default]
Changes to packages/core2-64-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.3 changed symlink target from libical_cxx.so.3.0.18 to libical_cxx.so.3.0.19
  /usr/lib/libical-glib.so.3 changed symlink target from libical-glib.so.3.0.18 to libical-glib.so.3.0.19
  /usr/lib/libical.so.3 changed symlink target from libical.so.3.0.18 to libical.so.3.0.19
  /usr/lib/libicalss_cxx.so.3 changed symlink target from libicalss_cxx.so.3.0.18 to libicalss_cxx.so.3.0.19
  /usr/lib/libicalss.so.3 changed symlink target from libicalss.so.3.0.18 to libicalss.so.3.0.19
  /usr/lib/libicalvcal.so.3 changed symlink target from libicalvcal.so.3.0.18 to libicalvcal.so.3.0.19
  /usr/lib/libical_cxx.so.3.0.18 moved to /usr/lib/libical_cxx.so.3.0.19
  /usr/lib/libical-glib.so.3.0.18 moved to /usr/lib/libical-glib.so.3.0.19
  /usr/lib/libical.so.3.0.18 moved to /usr/lib/libical.so.3.0.19
  /usr/lib/libicalss_cxx.so.3.0.18 moved to /usr/lib/libicalss_cxx.so.3.0.19
  /usr/lib/libicalss.so.3.0.18 moved to /usr/lib/libicalss.so.3.0.19
  /usr/lib/libicalvcal.so.3.0.18 moved to /usr/lib/libicalvcal.so.3.0.19
Changes to packages/x86_64-linux/libical-native (sysroot):
  /usr/lib/libical_cxx.so.3 changed symlink target from libical_cxx.so.3.0.18 to libical_cxx.so.3.0.19
  /usr/lib/libical-glib.so.3 changed symlink target from libical-glib.so.3.0.18 to libical-glib.so.3.0.19
  /usr/lib/libical.so.3 changed symlink target from libical.so.3.0.18 to libical.so.3.0.19
  /usr/lib/libicalss_cxx.so.3 changed symlink target from libicalss_cxx.so.3.0.18 to libicalss_cxx.so.3.0.19
  /usr/lib/libicalss.so.3 changed symlink target from libicalss.so.3.0.18 to libicalss.so.3.0.19
  /usr/lib/libicalvcal.so.3 changed symlink target from libicalvcal.so.3.0.18 to libicalvcal.so.3.0.19
  /usr/lib/libical_cxx.so.3.0.18 moved to /usr/lib/libical_cxx.so.3.0.19
  /usr/lib/libical-glib.so.3.0.18 moved to /usr/lib/libical-glib.so.3.0.19
  /usr/lib/libical.so.3.0.18 moved to /usr/lib/libical.so.3.0.19
  /usr/lib/libicalss_cxx.so.3.0.18 moved to /usr/lib/libicalss_cxx.so.3.0.19
  /usr/lib/libicalss.so.3.0.18 moved to /usr/lib/libicalss.so.3.0.19
  /usr/lib/libicalvcal.so.3.0.18 moved to /usr/lib/libicalvcal.so.3.0.19

--===============6543810900909748304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libical/libical: FILELIST: removed "/usr/lib/libicalss_cxx.so.3.0.18 /usr/lib/libical.so.3.0.18 /usr/lib/libicalss.so.3.0.18 /usr/lib/libical_cxx.so.3.0.18 /usr/lib/libical-glib.so.3.0.18 /usr/lib/libicalvcal.so.3.0.18", added "/usr/lib/libical.so.3.0.19 /usr/lib/libicalss_cxx.so.3.0.19 /usr/lib/libical-glib.so.3.0.19 /usr/lib/libicalss.so.3.0.19 /usr/lib/libical_cxx.so.3.0.19 /usr/lib/libicalvcal.so.3.0.19"
Changes to packages/core2-64-poky-linux/libical (sysroot):
  /usr/lib/libical_cxx.so.3 changed symlink target from libical_cxx.so.3.0.18 to libical_cxx.so.3.0.19
  /usr/lib/libical-glib.so.3 changed symlink target from libical-glib.so.3.0.18 to libical-glib.so.3.0.19
  /usr/lib/libical.so.3 changed symlink target from libical.so.3.0.18 to libical.so.3.0.19
  /usr/lib/libicalss_cxx.so.3 changed symlink target from libicalss_cxx.so.3.0.18 to libicalss_cxx.so.3.0.19
  /usr/lib/libicalss.so.3 changed symlink target from libicalss.so.3.0.18 to libicalss.so.3.0.19
  /usr/lib/libicalvcal.so.3 changed symlink target from libicalvcal.so.3.0.18 to libicalvcal.so.3.0.19
  /usr/lib/libical_cxx.so.3.0.18 moved to /usr/lib/libical_cxx.so.3.0.19
  /usr/lib/libical-glib.so.3.0.18 moved to /usr/lib/libical-glib.so.3.0.19
  /usr/lib/libical.so.3.0.18 moved to /usr/lib/libical.so.3.0.19
  /usr/lib/libicalss_cxx.so.3.0.18 moved to /usr/lib/libicalss_cxx.so.3.0.19
  /usr/lib/libicalss.so.3.0.18 moved to /usr/lib/libicalss.so.3.0.19
  /usr/lib/libicalvcal.so.3.0.18 moved to /usr/lib/libicalvcal.so.3.0.19
Changes to packages/x86_64-linux/libical-native (sysroot):
  /usr/lib/libical_cxx.so.3 changed symlink target from libical_cxx.so.3.0.18 to libical_cxx.so.3.0.19
  /usr/lib/libical-glib.so.3 changed symlink target from libical-glib.so.3.0.18 to libical-glib.so.3.0.19
  /usr/lib/libical.so.3 changed symlink target from libical.so.3.0.18 to libical.so.3.0.19
  /usr/lib/libicalss_cxx.so.3 changed symlink target from libicalss_cxx.so.3.0.18 to libicalss_cxx.so.3.0.19
  /usr/lib/libicalss.so.3 changed symlink target from libicalss.so.3.0.18 to libicalss.so.3.0.19
  /usr/lib/libicalvcal.so.3 changed symlink target from libicalvcal.so.3.0.18 to libicalvcal.so.3.0.19
  /usr/lib/libical_cxx.so.3.0.18 moved to /usr/lib/libical_cxx.so.3.0.19
  /usr/lib/libical-glib.so.3.0.18 moved to /usr/lib/libical-glib.so.3.0.19
  /usr/lib/libical.so.3.0.18 moved to /usr/lib/libical.so.3.0.19
  /usr/lib/libicalss_cxx.so.3.0.18 moved to /usr/lib/libicalss_cxx.so.3.0.19
  /usr/lib/libicalss.so.3.0.18 moved to /usr/lib/libicalss.so.3.0.19
  /usr/lib/libicalvcal.so.3.0.18 moved to /usr/lib/libicalvcal.so.3.0.19

--===============6543810900909748304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1876 targets, 52 skipped, 0 masked, 0 errors.
Removing 40 recipes from the core2-64 sysroot...done.
Removing 40 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:0f4f2563c491f46811daadf3bc2fe8d9aac1772c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 312 Local 298 Mirrors 0 Missed 14 Current 237 (95% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 275 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_populate_lic_setscene)
NOTE: Running setscene task 328 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 331 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 338 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libical-3.0.19-r0: task do_populate_lic_setscene: Started
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 339 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 340 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_recipe_qa_setscene)
NOTE: recipe icu-76-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 341 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 343 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 345 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_create_spdx_setscene)
NOTE: recipe libical-3.0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 945 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_fetch)
NOTE: Running task 947 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_fetch)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 369 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 370 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe icu-76-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_fetch: Started
NOTE: recipe vala-0.56.17-r0: task do_fetch: Started
NOTE: recipe libical-3.0.19-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 948 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_unpack)
NOTE: recipe vala-0.56.17-r0: task do_fetch: Succeeded
NOTE: Running task 949 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_unpack)
NOTE: recipe libxml2-2.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 374 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-76-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 376 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_76-1.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.19-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_unpack: Started
NOTE: recipe libxml2-2.13.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 377 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_unpack: Succeeded
NOTE: Running task 955 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_patch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-76-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_patch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 381 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 386 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 391 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running task 962 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 963 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_generate_toolchain_file)
NOTE: recipe vala-0.56.17-r0: task do_unpack: Succeeded
NOTE: Running task 965 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_patch)
NOTE: recipe glib-2.0-1_2.82.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libical-3.0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-3.0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.17-r0: task do_patch: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 396 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 399 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-75.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_deploy_source_date_epoch unihash changed to 15e5876c034a80ee2431def1cb4874bed1050899550e5001e1c6eda049d41667
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 409 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-75.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_75.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-75.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-75.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 434 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 435 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/bash-completion/2.15.0/temp/log.do_packagedata_setscene.2727615
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 436 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 438 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 439 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb:do_package_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 445 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 459 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 462 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 464 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 470 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 477 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 479 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 480 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 484 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 489 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 490 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 491 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 495 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 497 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.15.0-r0: task do_package_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.15.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 507 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 508 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 522 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 529 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 530 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 533 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 536 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 539 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 541 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 544 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 549 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1474 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb:do_packagedata)
NOTE: Running task 1498 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.15.0-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1556 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1557 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_configure)
NOTE: recipe vala-0.56.17-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_compile)
NOTE: recipe vala-0.56.17-r0: task do_compile: Started
NOTE: recipe vala-0.56.17-r0: task do_compile: Succeeded
NOTE: Running task 1559 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_install)
NOTE: recipe vala-0.56.17-r0: task do_install: Started
NOTE: recipe vala-0.56.17-r0: task do_install: Succeeded
NOTE: Running task 1560 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_package)
NOTE: Running task 1561 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Started
NOTE: recipe vala-0.56.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1562 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1563 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_configure)
NOTE: recipe libical-3.0.19-r0: task do_configure: Started
NOTE: recipe vala-0.56.17-r0: task do_package: Succeeded
NOTE: Running task 1564 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata)
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.17-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_packagedata unihash changed to 97028dfd13c43242c91cbf50d90a553371af9ccfe9ba49f582177b448b66591b
NOTE: Setscene tasks completed
NOTE: Running task 1565 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.17.bb:do_create_spdx)
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 1566 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_collect_spdx_deps)
NOTE: recipe libical-3.0.19-r0: task do_collect_spdx_deps: Started
NOTE: recipe libical-3.0.19-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1567 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_compile)
NOTE: recipe libical-3.0.19-r0: task do_compile: Started
NOTE: recipe libical-3.0.19-r0: task do_compile: Succeeded
NOTE: Running task 1568 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_install)
NOTE: recipe libical-3.0.19-r0: task do_install: Started
NOTE: recipe libical-3.0.19-r0: task do_install: Succeeded
NOTE: Running task 1569 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_package)
NOTE: Running task 1570 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_populate_sysroot)
NOTE: recipe libical-3.0.19-r0: task do_populate_sysroot: Started
NOTE: recipe libical-3.0.19-r0: task do_package: Started
NOTE: recipe libical-3.0.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_package: Succeeded
NOTE: Running task 1571 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_packagedata)
NOTE: recipe libical-3.0.19-r0: task do_packagedata: Started
NOTE: recipe libical-3.0.19-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_packagedata unihash changed to 311ac4c4d9e56b03c95c4a485a36d07a3564041fb0379ed10d3f1ed23fb3fb37
NOTE: Setscene tasks completed
NOTE: Running task 1572 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_create_spdx)
NOTE: Running task 1573 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_package_write_ipk)
NOTE: Running task 1574 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_package_write_deb)
NOTE: Running task 1575 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_package_write_rpm)
NOTE: Running task 1576 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_package_qa)
NOTE: recipe libical-3.0.19-r0: task do_create_spdx: Started
NOTE: recipe libical-3.0.19-r0: task do_package_write_ipk: Started
NOTE: recipe libical-3.0.19-r0: task do_package_write_deb: Started
NOTE: recipe libical-3.0.19-r0: task do_package_write_rpm: Started
NOTE: recipe libical-3.0.19-r0: task do_package_qa: Started
NOTE: recipe libical-3.0.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 1577 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_create_package_spdx)
NOTE: recipe libical-3.0.19-r0: task do_create_package_spdx: Started
NOTE: recipe libical-3.0.19-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_package_qa unihash changed to 8bf1aa25f850ce21cd1704fb762306b5bee52f015ca4cc6822c99894c0d0afa7
NOTE: recipe libical-3.0.19-r0: task do_create_package_spdx: Succeeded
NOTE: recipe libical-3.0.19-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_package_write_rpm unihash changed to 98380d1d12184183ed0a355bab2664901b3f6f571ae2824c37c931ebbb26ab7e
NOTE: recipe libical-3.0.19-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_package_write_deb unihash changed to 7b32f57963f6bb8d483c0948ec4c21ed146cc4ff25dc8c5bd54b899469db7d95
NOTE: recipe libical-3.0.19-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_package_write_ipk unihash changed to cef01e5063d85c7e8c0d4d807832a1ee790f65d548cec4b3e3097e0b42e62db9
NOTE: Running noexec task 1578 of 1578 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.19.bb:do_build)
NOTE: Tasks Summary: Attempted 1578 tasks of which 1545 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: bash-completion-2.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-src went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: bash-completion-2.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-dbg went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: bash-completion-2.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-extra went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: bash-completion-2.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-staticdev went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: bash-completion-2.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-dev went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: bash-completion-2.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-doc went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: bash-completion-2.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion-locale went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: bash-completion-2.15.0-r0 do_packagedata_setscene: QA Issue: Package version for package bash-completion went backwards which would break package feeds (from 0:2.16.0-r0 to 0:2.15.0-r0) [version-going-backwards]
ERROR: bash-completion-2.15.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6543810900909748304==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libical-upgrade-3.0.18-3.0.19.patch"

RnJvbSAxNDc5N2RkNzkxNGNmMzI0YzhlNWJmZWVhOWIzYTEyNTEwYzE3MmNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwOToxODo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YmljYWw6IHVwZ3JhZGUgMy4wLjE4IC0+IDMuMC4xOQoKLS0tCiAuLi4vMDAwMS1jbWFrZS1Eby1u
b3QtZXhwb3J0LUNDLWludG8tZ2lyLWNvbXBpbGVyLnBhdGNoICAgIHwgNyArKy0tLS0tCiAuLi4v
bGliaWNhbC97bGliaWNhbF8zLjAuMTguYmIgPT4gbGliaWNhbF8zLjAuMTkuYmJ9ICAgICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliaWNhbC97bGliaWNhbF8zLjAuMTguYmIgPT4g
bGliaWNhbF8zLjAuMTkuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGliaWNhbC9saWJpY2FsLzAwMDEtY21ha2UtRG8tbm90LWV4cG9ydC1DQy1pbnRvLWdpci1j
b21waWxlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGliaWNhbC8wMDAx
LWNtYWtlLURvLW5vdC1leHBvcnQtQ0MtaW50by1naXItY29tcGlsZXIucGF0Y2gKaW5kZXggMzg0
MWMwNjBlZS4uMGE3YzY5NjUzMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
aWNhbC9saWJpY2FsLzAwMDEtY21ha2UtRG8tbm90LWV4cG9ydC1DQy1pbnRvLWdpci1jb21waWxl
ci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWwvMDAwMS1j
bWFrZS1Eby1ub3QtZXhwb3J0LUNDLWludG8tZ2lyLWNvbXBpbGVyLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBjMDZkOGE4OTkwYzk5NmNiYjg1NDUwOGE5NDQyMDJiYTcwYmE3YTdjIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxNDVhMGYzOTE5ZjY4ODRjMzc3YTllNmI4YTAzZGU3
MDdmZWI0NWZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMyBNYXIgMjAyMiAyMDoxMDowNCAtMDgwMAogU3Vi
amVjdDogW1BBVENIXSBjbWFrZTogRG8gbm90IGV4cG9ydCBDQyBpbnRvIGdpciBjb21waWxlcgpA
QCAtMTUsNyArMTUsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKIAog
ZGlmZiAtLWdpdCBhL2NtYWtlL21vZHVsZXMvR09iamVjdEludHJvc3BlY3Rpb25NYWNyb3MuY21h
a2UgYi9jbWFrZS9tb2R1bGVzL0dPYmplY3RJbnRyb3NwZWN0aW9uTWFjcm9zLmNtYWtlCi1pbmRl
eCA4M2FmZjkzMS4uZDdkM2Y4OTggMTAwNjQ0CitpbmRleCA4M2FmZjkzLi5kN2QzZjg5IDEwMDY0
NAogLS0tIGEvY21ha2UvbW9kdWxlcy9HT2JqZWN0SW50cm9zcGVjdGlvbk1hY3Jvcy5jbWFrZQog
KysrIGIvY21ha2UvbW9kdWxlcy9HT2JqZWN0SW50cm9zcGVjdGlvbk1hY3Jvcy5jbWFrZQogQEAg
LTUwLDggKzUwLDcgQEAgbWFjcm8oZ2lyX2FkZF9pbnRyb3NwZWN0aW9ucyBpbnRyb3NwZWN0aW9u
c19naXJzKQpAQCAtMjgsNiArMjgsMyBAQCBpbmRleCA4M2FmZjkzMS4uZDdkM2Y4OTggMTAwNjQ0
CiAgICAgICAgICAgICAgICAke0dPYmplY3RJbnRyb3NwZWN0aW9uX1NDQU5ORVJfQVJHU30KICAg
ICAgICAgICAgICAgIC0tbmFtZXNwYWNlPSR7X2dpcl9uYW1lc3BhY2V9CiAgICAgICAgICAgICAg
ICAtLW5zdmVyc2lvbj0ke19naXJfdmVyc2lvbn0KLS0tIAotMi4zNS4xCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGliaWNhbF8zLjAuMTguYmIgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJpY2FsL2xpYmljYWxfMy4wLjE5LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGliaWNhbF8zLjAu
MTguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmljYWwvbGliaWNhbF8zLjAu
MTkuYmIKaW5kZXggMDUyY2E1N2NmYi4uMWVlMzlhYTk0ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliaWNhbC9saWJpY2FsXzMuMC4xOC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJpY2FsL2xpYmljYWxfMy4wLjE5LmJiCkBAIC0xNSw3ICsxNSw3IEBAIFNFQ1RJ
T04gPSAibGlicyIKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkL3Yke1BW
fS8ke0JQfS50YXIuZ3ogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1jbWFrZS1Eby1ub3QtZXhw
b3J0LUNDLWludG8tZ2lyLWNvbXBpbGVyLnBhdGNoIFwKICAgICAgICAgICAiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiNzJiN2RjMWE1OTM3NTMzYWVlNWEyYmFlZmM5OTA5ODNiNjZiMTQxZGQ4MGQ0
M2I1MWY4MGFjZWQ0YWFlMjE5YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI2YTFlN2YwZjUwYTM5
OWNiYWQ4MjZiY2MyODZjZTEwZDcxNTFmM2RmN2NjMTAzZjY0MWRlMTUxNjA1MjNjNzNmIgogCiBp
bmhlcml0IGNtYWtlIHBrZ2NvbmZpZyBnb2JqZWN0LWludHJvc3BlY3Rpb24gdmFsYSBnaXRodWIt
cmVsZWFzZXMKIAotLSAKMi40NC4xCgo=

--===============6543810900909748304==--

