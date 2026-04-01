Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A582610F6FBD
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14665.1775054169697118985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aFjbrO+k;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CgnDCpLl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019d49792431-24a92196-1f0d-4122-a0ec-cbac7ac5dfaf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gxNlpIA+TItg1w41aKyGpxU9rR3V+UraV58tUEgyUdQ=;
	b=aFjbrO+kK/oz/EACC/UNXnxbM46Jb2Lgp1upEJOD6mg3V3Zl7j+Qg4jl4CvTkTct
	VQgjuS07OaO5G18p5O5fV+ULovCKsteNGT22/9kaqPXBntJ0/7tZaOAalZs0H1sJIXC
	aNZcyzSHaFp2qn4+U0OqIerYe9fpsuM50xuo/Oq8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gxNlpIA+TItg1w41aKyGpxU9rR3V+UraV58tUEgyUdQ=;
	b=CgnDCpLlPtHOeaj7R+fw3YSd9ukrJHwQ0pPrAfm4bxAHa1ACrqAWFATdlE8c7v4Q
	JpdxgiS1cNOmiRmAd0UPzYSdL5uboKQ/z9yuxq+t6AUwr9Tyv/0l00eNV2JYNaNeLf5
	z2tUn4LsoA6cyG5jw+Epw4LEew3/UVgK2H8J3DZE=
Content-Type: multipart/mixed; boundary="===============5178835531416067690=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdk-pixbuf: upgrading to 2.44.6 SUCCEEDED
Message-ID: <0101019d49792431-24a92196-1f0d-4122-a0ec-cbac7ac5dfaf-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234405

--===============5178835531416067690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gdk-pixbuf* to *2.44.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gdk-pixbuf-upgrade-2.44.5-2.44.6.patch
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
From cbc42d9462294ee32002f6781f1fd99fce6608b4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 12:32:07 +0000
Subject: [PATCH] gdk-pixbuf: upgrade 2.44.5 -> 2.44.6

---
 ....build-allow-a-subset-of-tests-in-cross-compile.patch | 9 +++------
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch             | 4 ++--
 .../{gdk-pixbuf_2.44.5.bb => gdk-pixbuf_2.44.6.bb}       | 2 +-
 3 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.44.5.bb => gdk-pixbuf_2.44.6.bb} (97%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
index 45b9aa60c4..ba32be16ee 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
@@ -1,4 +1,4 @@
-From 3b6aab24f6844b7d5b3e166bc910bffbcee1f6f5 Mon Sep 17 00:00:00 2001
+From 85b336f71ee0a7ab11c29e623931c9e4d730abb0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 26 Jan 2023 20:29:46 +0100
 Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
@@ -22,10 +22,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  2 files changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index f478326..464ae1d 100644
+index b88ef70..b181054 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -428,10 +428,10 @@ subdir('gdk-pixbuf')
+@@ -434,10 +434,10 @@ subdir('gdk-pixbuf')
  # i18n
  subdir('po')
  
@@ -67,6 +67,3 @@ index 9b96fdc..9c3ed7d 100644
  
  foreach test_name, test_data: installed_tests
    test_sources = [ test_name + '.c', 'test-common.c' ]
--- 
-2.34.1
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 3b4bf62861..4d8264ecad 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,4 +1,4 @@
-From f78ab4edaee5f62663a9a4bcfa56e5c524da4474 Mon Sep 17 00:00:00 2001
+From 442a8740944702bebf08f2d10255653e69578528 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 1 Apr 2014 17:23:36 +0100
 Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fatal
@@ -13,7 +13,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 15 insertions(+), 4 deletions(-)
 
 diff --git a/gdk-pixbuf/queryloaders.c b/gdk-pixbuf/queryloaders.c
-index baa9a5c..9b6fa89 100644
+index 5228c6f..46ffa35 100644
 --- a/gdk-pixbuf/queryloaders.c
 +++ b/gdk-pixbuf/queryloaders.c
 @@ -216,7 +216,7 @@ write_loader_info (GString *contents, const char *path, GdkPixbufFormat *info)
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
similarity index 97%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
index 9ed9a272e0..d9c0d0ab65 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.6.bb
@@ -14,7 +14,7 @@ SECTION = "libs"
 
 DEPENDS = "glib-2.0 shared-mime-info"
 
-SRC_URI[archive.sha256sum] = "69b93e09139b80c0ee661503d60deb5a5874a31772b5184b9cd5462a4100ab68"
+SRC_URI[archive.sha256sum] = "140c2d0b899fcf853ee92b26373c9dc228dbcde0820a4246693f4328a27466fa"
 
 inherit gettext gnomebase pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package manpages
 
-- 
2.47.1


--===============5178835531416067690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.5", added "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.6"
Changes to packages/x86-64-v3-poky-linux/gdk-pixbuf (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.5 to libgdk_pixbuf-2.0.so.0.4400.6
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.5 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.6
Changes to packages/x86_64-linux/gdk-pixbuf-native (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.5 to libgdk_pixbuf-2.0.so.0.4400.6
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.5 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.6

--===============5178835531416067690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-bin: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-bin: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PKGSIZE changed from 2033312 to 2033424 (+0%)
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: FILELIST: removed "/usr/lib/.debug/libgdk_pixbuf-2.0.so.0.4400.5", added "/usr/lib/.debug/libgdk_pixbuf-2.0.so.0.4400.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-doc: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-doc: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ani: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ani: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-bmp: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-bmp: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-gif: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-gif: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-icns: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-icns: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ico: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ico: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-pnm: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-pnm: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-qtif: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-qtif: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-tga: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-tga: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xbm: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xbm: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xpm: PKGSIZE changed from 34832 to 34816 (-0%)
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xpm: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xpm: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-af: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-af: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ang: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ang: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ar: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ar: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-as: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-as: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ast: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ast: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-az: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-az: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be+latin: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be+latin: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bg: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bg: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn-in: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn-in: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-br: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-br: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bs: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bs: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca+valencia: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca+valencia: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-crh: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-crh: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cs: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cs: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-csb: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-csb: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cy: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cy: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-da: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-da: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-de: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-de: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-dz: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-dz: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-el: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-el: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en+shaw: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en+shaw: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-ca: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-ca: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-gb: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-gb: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eo: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eo: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-es: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-es: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-et: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-et: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eu: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eu: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fa: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fa: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fi: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fi: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fr: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fr: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fur: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fur: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ga: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ga: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gl: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gl: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gu: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gu: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-he: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-he: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hi: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hi: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hr: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hr: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hu: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hu: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hy: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hy: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ia: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ia: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-id: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-id: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-io: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-io: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-is: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-is: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-it: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-it: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ja: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ja: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ka: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ka: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kab: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kab: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kk: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kk: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-km: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-km: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kn: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kn: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ko: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ko: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ku: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ku: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-li: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-li: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lt: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lt: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lv: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lv: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mai: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mai: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mi: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mi: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mk: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mk: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ml: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ml: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mn: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mn: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mr: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mr: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ms: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ms: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-my: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-my: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nb: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nb: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nds: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nds: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ne: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ne: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nl: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nl: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nn: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nn: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nso: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nso: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-oc: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-oc: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-or: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-or: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pa: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pa: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pl: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pl: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ps: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ps: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt-br: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt-br: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ro: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ro: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ru: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ru: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-si: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-si: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sk: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sk: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sl: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sl: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sq: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sq: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+ije: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+ije: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+latin: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+latin: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sv: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sv: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ta: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ta: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-te: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-te: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tg: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tg: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-th: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-th: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tk: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tk: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tr: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tr: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tt: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tt: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ug: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ug: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uk: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uk: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz+cyrillic: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz+cyrillic: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-vi: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-vi: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-wa: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-wa: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-xh: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-xh: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-yi: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-yi: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-cn: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-cn: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-hk: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-hk: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-tw: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-tw: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PKGSIZE changed from 1109399 to 1109953 (+0%)
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: FILELIST: directory renamed /usr/src/debug/gdk-pixbuf/2.44.5/tests -> /usr/src/debug/gdk-pixbuf/2.44.6/tests, directory renamed /usr/src/debug/gdk-pixbuf/2.44.5/gdk-pixbuf -> /usr/src/debug/gdk-pixbuf/2.44.6/gdk-pixbuf, directory renamed /usr/src/debug/gdk-pixbuf/2.44.5/gdk-pixbuf/pixops -> /usr/src/debug/gdk-pixbuf/2.44.6/gdk-pixbuf/pixops
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-staticdev: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf-staticdev: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.5", added "/usr/lib/libgdk_pixbuf-2.0.so.0.4400.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf/gdk-pixbuf: PV changed from "2.44.5" to "2.44.6"
packages/x86-64-v3-poky-linux/gdk-pixbuf: SRC_URI changed from "https://download.gnome.org/sources//gdk-pixbuf/2.44/gdk-pixbuf-2.44.5.tar.xz;name=archive file://run-ptest file://fatal-loader.patch file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch" to "https://download.gnome.org/sources//gdk-pixbuf/2.44/gdk-pixbuf-2.44.6.tar.xz;name=archive file://run-ptest file://fatal-loader.patch file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch"
packages/x86-64-v3-poky-linux/gdk-pixbuf: PKGV changed from 2.44.5 [default] to 2.44.6 [default]
packages/x86-64-v3-poky-linux/gdk-pixbuf: PV changed from "2.44.5" to "2.44.6"
Changes to packages/x86-64-v3-poky-linux/gdk-pixbuf (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.5 to libgdk_pixbuf-2.0.so.0.4400.6
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.5 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.6
Changes to packages/x86_64-linux/gdk-pixbuf-native (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4400.5 to libgdk_pixbuf-2.0.so.0.4400.6
  /usr/lib/libgdk_pixbuf-2.0.so.0.4400.5 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4400.6

--===============5178835531416067690==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gdk-pixbuf-upgrade-2.44.5-2.44.6.patch"

RnJvbSBjYmM0MmQ5NDYyMjk0ZWUzMjAwMmY2NzgxZjFmZDk5ZmNlNjYwOGI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMjozMjowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdk
ay1waXhidWY6IHVwZ3JhZGUgMi40NC41IC0+IDIuNDQuNgoKLS0tCiAuLi4uYnVpbGQtYWxsb3ct
YS1zdWJzZXQtb2YtdGVzdHMtaW4tY3Jvc3MtY29tcGlsZS5wYXRjaCB8IDkgKysrLS0tLS0tCiAu
Li4vZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmL2ZhdGFsLWxvYWRlci5wYXRjaCAgICAgICAgICAgICB8
IDQgKystLQogLi4uL3tnZGstcGl4YnVmXzIuNDQuNS5iYiA9PiBnZGstcGl4YnVmXzIuNDQuNi5i
Yn0gICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi97Z2RrLXBpeGJ1
Zl8yLjQ0LjUuYmIgPT4gZ2RrLXBpeGJ1Zl8yLjQ0LjYuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zi8wMDAxLW1lc29uLmJ1aWxk
LWFsbG93LWEtc3Vic2V0LW9mLXRlc3RzLWluLWNyb3NzLWNvbXBpbGUucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmLzAwMDEtbWVzb24uYnVpbGQtYWxsb3ct
YS1zdWJzZXQtb2YtdGVzdHMtaW4tY3Jvc3MtY29tcGlsZS5wYXRjaAppbmRleCA0NWI5YWE2MGM0
Li5iYTMyYmUxNmVlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9n
ZGstcGl4YnVmLzAwMDEtbWVzb24uYnVpbGQtYWxsb3ctYS1zdWJzZXQtb2YtdGVzdHMtaW4tY3Jv
c3MtY29tcGlsZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGst
cGl4YnVmLzAwMDEtbWVzb24uYnVpbGQtYWxsb3ctYS1zdWJzZXQtb2YtdGVzdHMtaW4tY3Jvc3Mt
Y29tcGlsZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2I2YWFiMjRmNjg0NGI3ZDViM2Ux
NjZiYzkxMGJmZmJjZWUxZjZmNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODViMzM2
ZjcxZWUwYTdhYjExYzI5ZTYyMzkzMWM5ZTRkNzMwYWJiMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBU
aHUsIDI2IEphbiAyMDIzIDIwOjI5OjQ2ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lc29uLmJ1
aWxkOiBhbGxvdyAoYSBzdWJzZXQgb2YpIHRlc3RzIGluIGNyb3NzIGNvbXBpbGUKQEAgLTIyLDEw
ICsyMiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5k
cml2ZXIuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggZjQ3
ODMyNi4uNDY0YWUxZCAxMDA2NDQKK2luZGV4IGI4OGVmNzAuLmIxODEwNTQgMTAwNjQ0CiAtLS0g
YS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKLUBAIC00MjgsMTAgKzQyOCwxMCBAQCBz
dWJkaXIoJ2dkay1waXhidWYnKQorQEAgLTQzNCwxMCArNDM0LDEwIEBAIHN1YmRpcignZ2RrLXBp
eGJ1ZicpCiAgIyBpMThuCiAgc3ViZGlyKCdwbycpCiAgCkBAIC02Nyw2ICs2NywzIEBAIGluZGV4
IDliOTZmZGMuLjljM2VkN2QgMTAwNjQ0CiAgCiAgZm9yZWFjaCB0ZXN0X25hbWUsIHRlc3RfZGF0
YTogaW5zdGFsbGVkX3Rlc3RzCiAgICB0ZXN0X3NvdXJjZXMgPSBbIHRlc3RfbmFtZSArICcuYycs
ICd0ZXN0LWNvbW1vbi5jJyBdCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmL2ZhdGFsLWxvYWRlci5wYXRjaCBiL21ldGEv
cmVjaXBlcy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWYvZmF0YWwtbG9hZGVyLnBhdGNoCmlu
ZGV4IDNiNGJmNjI4NjEuLjRkODI2NGVjYWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9t
ZS9nZGstcGl4YnVmL2dkay1waXhidWYvZmF0YWwtbG9hZGVyLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWYvZmF0YWwtbG9hZGVyLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBmNzhhYjRlZGFlZTVmNjI2NjNhOWE0YmNmYTU2ZTVjNTI0ZGE0NDc0
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0NDJhODc0MDk0NDcwMmJlYmYwOGYyZDEw
MjU1NjUzZTY5NTc4NTI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0
b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMSBBcHIgMjAxNCAxNzoyMzoz
NiArMDEwMAogU3ViamVjdDogW1BBVENIXSBnZGstcGl4YnVmOiBhZGQgYW4gb3B0aW9uIHNvIHRo
YXQgbG9hZGVyIGVycm9ycyBhcmUgZmF0YWwKQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1i
eTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2dkay1waXhi
dWYvcXVlcnlsb2FkZXJzLmMgYi9nZGstcGl4YnVmL3F1ZXJ5bG9hZGVycy5jCi1pbmRleCBiYWE5
YTVjLi45YjZmYTg5IDEwMDY0NAoraW5kZXggNTIyOGM2Zi4uNDZmZmEzNSAxMDA2NDQKIC0tLSBh
L2dkay1waXhidWYvcXVlcnlsb2FkZXJzLmMKICsrKyBiL2dkay1waXhidWYvcXVlcnlsb2FkZXJz
LmMKIEBAIC0yMTYsNyArMjE2LDcgQEAgd3JpdGVfbG9hZGVyX2luZm8gKEdTdHJpbmcgKmNvbnRl
bnRzLCBjb25zdCBjaGFyICpwYXRoLCBHZGtQaXhidWZGb3JtYXQgKmluZm8pCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmXzIuNDQuNS5iYiBiL21l
dGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWZfMi40NC42LmJiCnNpbWlsYXJp
dHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4YnVmL2dk
ay1waXhidWZfMi40NC41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1
Zi9nZGstcGl4YnVmXzIuNDQuNi5iYgppbmRleCA5ZWQ5YTI3MmUwLi5kOWMwZDBhYjY1IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmXzIuNDQuNS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmXzIuNDQuNi5i
YgpAQCAtMTQsNyArMTQsNyBAQCBTRUNUSU9OID0gImxpYnMiCiAKIERFUEVORFMgPSAiZ2xpYi0y
LjAgc2hhcmVkLW1pbWUtaW5mbyIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNjli
OTNlMDkxMzliODBjMGVlNjYxNTAzZDYwZGViNWE1ODc0YTMxNzcyYjUxODRiOWNkNTQ2MmE0MTAw
YWI2OCIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjE0MGMyZDBiODk5ZmNmODUzZWU5
MmIyNjM3M2M5ZGMyMjhkYmNkZTA4MjBhNDI0NjY5M2Y0MzI4YTI3NDY2ZmEiCiAKIGluaGVyaXQg
Z2V0dGV4dCBnbm9tZWJhc2UgcGl4YnVmY2FjaGUgcHRlc3QtZ25vbWUgdXBzdHJlYW0tdmVyc2lv
bi1pcy1ldmVuIGdvYmplY3QtaW50cm9zcGVjdGlvbiBnaS1kb2NnZW4gbGliX3BhY2thZ2UgbWFu
cGFnZXMKIAotLSAKMi40Ny4xCgo=

--===============5178835531416067690==--

