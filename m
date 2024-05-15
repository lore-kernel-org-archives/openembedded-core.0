Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542C8C2BA2B
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:22 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.1270.1715794337436802080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=L7uUPBne;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=R3z6dvkY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f7d4fe29a-b8a025e8-a35b-4d3c-8029-662d29148b26-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TRNwBQpAyc6bvZWPlu9MYmUXxb16fYrNlj9s1OPghOc=;
	b=L7uUPBneiPPPPfUWBeOpRbQaBWiTbRTgZNkxrjA2bu7Se8LE5JWiK0T02R+/diuk
	3qxCxiW7IZpwXhxbT8E1Uur2JW8GUZkJvbdYO+VXui6RfwYwcgrJMJKBL0Eg18mRdrG
	hK2nIvqenxhK6xkqIBweS4iGzm3NUWrPS1WoJ7sA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TRNwBQpAyc6bvZWPlu9MYmUXxb16fYrNlj9s1OPghOc=;
	b=R3z6dvkYEBGQR6IZj311/XNn7r/AusL5/pm7v4P5PaGNVgTz3rFf8NPGgz781EgO
	1bucwhMkd1mMUhLHWjgWGU8zrD1FdSToeJKuGwx77p88SaqM7yWD9lzCtSNrhJ1pa8K
	vWuNJFiNQRNyQkMlfv6NmV0zF7Pk1TtjGUTokPjY=
Content-Type: multipart/mixed; boundary="===============5017137486214692707=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdk-pixbuf: upgrading to 2.42.12 SUCCEEDED
Message-ID: <0101018f7d4fe29a-b8a025e8-a35b-4d3c-8029-662d29148b26-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199354

--===============5017137486214692707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gdk-pixbuf* to *2.42.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gdk-pixbuf-upgrade-2.42.11-2.42.12.patch
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
From 526d4cd78f98da7597d1bbead34fbe1f00f43728 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 12:41:19 +0000
Subject: [PATCH] gdk-pixbuf: upgrade 2.42.11 -> 2.42.12

---
 ...n.build-allow-a-subset-of-tests-in-cross-compile.patch | 8 ++++----
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch              | 2 +-
 .../{gdk-pixbuf_2.42.11.bb => gdk-pixbuf_2.42.12.bb}      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.11.bb => gdk-pixbuf_2.42.12.bb} (98%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
index 3d685db774..24edda8102 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
@@ -1,4 +1,4 @@
-From 4bfb696fd125f044e3df9f6983c4ad518d9552c7 Mon Sep 17 00:00:00 2001
+From 325a4cde99a00b84116ab7111d27e6973f3c5026 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 26 Jan 2023 20:29:46 +0100
 Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
@@ -19,7 +19,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 78f3683..e0feaee 100644
+index 3eb3fcc..dc7e790 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -390,10 +390,10 @@ subdir('gdk-pixbuf')
@@ -37,7 +37,7 @@ index 78f3683..e0feaee 100644
  endif
  
 diff --git a/tests/meson.build b/tests/meson.build
-index 78d0ad9..0c9e64e 100644
+index 3781066..911b5fb 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -4,7 +4,7 @@
@@ -49,7 +49,7 @@ index 78d0ad9..0c9e64e 100644
    # Resources; we cannot use gnome.compile_resources() here, because we need to
    # override the environment in order to use the utilities we just built instead
    # of the system ones
-@@ -172,9 +172,11 @@ endif
+@@ -164,9 +164,11 @@ endif
  test_deps = gdk_pixbuf_deps + [ gdkpixbuf_dep, ]
  test_args = [ '-k' ]
  test_env = environment()
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 80c93e2166..3b4bf62861 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,4 +1,4 @@
-From 9b4f5738f8ac30f393b6163dcc84757976683d9b Mon Sep 17 00:00:00 2001
+From f78ab4edaee5f62663a9a4bcfa56e5c524da4474 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 1 Apr 2014 17:23:36 +0100
 Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fatal
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
similarity index 98%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index ef0f23f8f7..9f825a68ef 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -22,7 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
            "
 
-SRC_URI[sha256sum] = "49dcb402388708647e8c321d56b6fb30f21e51e515d0c5a942268d23052a2f00"
+SRC_URI[sha256sum] = "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
 
-- 
2.44.0


--===============5017137486214692707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-bin: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-bin: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: FILELIST: removed "/usr/lib/.debug/libgdk_pixbuf-2.0.so.0.4200.11", added "/usr/lib/.debug/libgdk_pixbuf-2.0.so.0.4200.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-doc: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-doc: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-gif: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-gif: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-af: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-af: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ang: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ang: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ar: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ar: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-as: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-as: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ast: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ast: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-az: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-az: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be+latin: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be+latin: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bg: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bg: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn-in: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn-in: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-br: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-br: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bs: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bs: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca+valencia: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca+valencia: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-crh: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-crh: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cs: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cs: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-csb: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-csb: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cy: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cy: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-da: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-da: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-de: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-de: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-dz: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-dz: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-el: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-el: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en+shaw: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en+shaw: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-ca: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-ca: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-gb: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-gb: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eo: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eo: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-es: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-es: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-et: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-et: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eu: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eu: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fa: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fa: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fi: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fi: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fr: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fr: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fur: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fur: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ga: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ga: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gl: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gl: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gu: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gu: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-he: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-he: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hi: PKGSIZE changed from 32421 to 31411 (-3%)
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hi: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hi: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hr: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hr: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hu: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hu: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hy: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hy: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ia: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ia: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-id: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-id: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-io: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-io: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-is: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-is: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-it: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-it: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ja: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ja: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ka: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ka: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kab: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kab: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kk: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kk: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-km: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-km: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kn: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kn: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ko: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ko: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ku: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ku: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-li: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-li: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lt: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lt: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lv: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lv: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mai: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mai: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mi: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mi: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mk: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mk: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ml: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ml: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mn: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mn: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mr: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mr: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ms: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ms: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-my: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-my: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nb: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nb: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nds: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nds: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ne: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ne: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nl: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nl: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nn: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nn: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nso: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nso: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-oc: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-oc: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-or: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-or: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pa: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pa: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pl: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pl: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ps: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ps: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt-br: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt-br: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ro: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ro: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ru: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ru: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-si: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-si: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sk: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sk: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sl: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sl: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sq: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sq: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+ije: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+ije: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+latin: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+latin: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sv: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sv: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ta: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ta: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-te: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-te: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tg: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tg: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-th: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-th: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tk: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tk: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tr: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tr: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tt: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tt: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ug: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ug: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uk: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uk: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz+cyrillic: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz+cyrillic: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-vi: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-vi: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-wa: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-wa: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-xh: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-xh: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-yi: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-yi: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-cn: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-cn: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-hk: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-hk: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-tw: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-tw: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: FILELIST: added "/usr/libexec/installed-tests/gdk-pixbuf/test-images/fail/CVE-2022-48622.ani"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PKGSIZE changed from 19942283 to 19970263 (+0%)
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-staticdev: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-staticdev: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-xlib: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-xlib: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf-2.0.so.0.4200.11", added "/usr/lib/libgdk_pixbuf-2.0.so.0.4200.12"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf: PV changed from "2.42.11" to "2.42.12"
packages/core2-64-poky-linux/gdk-pixbuf: PKGV changed from 2.42.11 [default] to 2.42.12 [default]
packages/core2-64-poky-linux/gdk-pixbuf: SRC_URI changed from "https://download.gnome.org/sources//gdk-pixbuf/2.42/gdk-pixbuf-2.42.11.tar.xz file://run-ptest file://fatal-loader.patch file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch" to "https://download.gnome.org/sources//gdk-pixbuf/2.42/gdk-pixbuf-2.42.12.tar.xz file://run-ptest file://fatal-loader.patch file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch"
packages/core2-64-poky-linux/gdk-pixbuf: PV changed from "2.42.11" to "2.42.12"
Changes to packages/core2-64-poky-linux/gdk-pixbuf (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4200.11 to libgdk_pixbuf-2.0.so.0.4200.12
  /usr/lib/libgdk_pixbuf-2.0.so.0.4200.11 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4200.12
Changes to packages/x86_64-linux/gdk-pixbuf-native (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4200.11 to libgdk_pixbuf-2.0.so.0.4200.12
  /usr/lib/libgdk_pixbuf-2.0.so.0.4200.11 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4200.12

--===============5017137486214692707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: FILELIST: added "/usr/libexec/installed-tests/gdk-pixbuf/test-images/fail/CVE-2022-48622.ani"
packages/core2-64-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf-2.0.so.0.4200.11", added "/usr/lib/libgdk_pixbuf-2.0.so.0.4200.12"
Changes to packages/core2-64-poky-linux/gdk-pixbuf (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4200.11 to libgdk_pixbuf-2.0.so.0.4200.12
  /usr/lib/libgdk_pixbuf-2.0.so.0.4200.11 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4200.12
Changes to packages/x86_64-linux/gdk-pixbuf-native (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4200.11 to libgdk_pixbuf-2.0.so.0.4200.12
  /usr/lib/libgdk_pixbuf-2.0.so.0.4200.11 moved to /usr/lib/libgdk_pixbuf-2.0.so.0.4200.12

--===============5017137486214692707==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gdk-pixbuf-upgrade-2.42.11-2.42.12.patch"

RnJvbSA1MjZkNGNkNzhmOThkYTc1OTdkMWJiZWFkMzRmYmUxZjAwZjQzNzI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTI6NDE6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
ZGstcGl4YnVmOiB1cGdyYWRlIDIuNDIuMTEgLT4gMi40Mi4xMgoKLS0tCiAuLi5uLmJ1aWxkLWFs
bG93LWEtc3Vic2V0LW9mLXRlc3RzLWluLWNyb3NzLWNvbXBpbGUucGF0Y2ggfCA4ICsrKystLS0t
CiAuLi4vZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmL2ZhdGFsLWxvYWRlci5wYXRjaCAgICAgICAgICAg
ICAgfCAyICstCiAuLi4ve2dkay1waXhidWZfMi40Mi4xMS5iYiA9PiBnZGstcGl4YnVmXzIuNDIu
MTIuYmJ9ICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi97Z2RrLXBp
eGJ1Zl8yLjQyLjExLmJiID0+IGdkay1waXhidWZfMi40Mi4xMi5iYn0gKDk4JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmLzAwMDEtbWVzb24u
YnVpbGQtYWxsb3ctYS1zdWJzZXQtb2YtdGVzdHMtaW4tY3Jvc3MtY29tcGlsZS5wYXRjaCBiL21l
dGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWYvMDAwMS1tZXNvbi5idWlsZC1h
bGxvdy1hLXN1YnNldC1vZi10ZXN0cy1pbi1jcm9zcy1jb21waWxlLnBhdGNoCmluZGV4IDNkNjg1
ZGI3NzQuLjI0ZWRkYTgxMDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4
YnVmL2dkay1waXhidWYvMDAwMS1tZXNvbi5idWlsZC1hbGxvdy1hLXN1YnNldC1vZi10ZXN0cy1p
bi1jcm9zcy1jb21waWxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4YnVm
L2dkay1waXhidWYvMDAwMS1tZXNvbi5idWlsZC1hbGxvdy1hLXN1YnNldC1vZi10ZXN0cy1pbi1j
cm9zcy1jb21waWxlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0YmZiNjk2ZmQxMjVmMDQ0
ZTNkZjlmNjk4M2M0YWQ1MThkOTU1MmM3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAz
MjVhNGNkZTk5YTAwYjg0MTE2YWI3MTExZDI3ZTY5NzNmM2M1MDI2IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERh
dGU6IFRodSwgMjYgSmFuIDIwMjMgMjA6Mjk6NDYgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVz
b24uYnVpbGQ6IGFsbG93IChhIHN1YnNldCBvZikgdGVzdHMgaW4gY3Jvc3MgY29tcGlsZQpAQCAt
MTksNyArMTksNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51
dHJvbml4LmRlPgogIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggNzhm
MzY4My4uZTBmZWFlZSAxMDA2NDQKK2luZGV4IDNlYjNmY2MuLmRjN2U3OTAgMTAwNjQ0CiAtLS0g
YS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC0zOTAsMTAgKzM5MCwxMCBAQCBz
dWJkaXIoJ2dkay1waXhidWYnKQpAQCAtMzcsNyArMzcsNyBAQCBpbmRleCA3OGYzNjgzLi5lMGZl
YWVlIDEwMDY0NAogIGVuZGlmCiAgCiBkaWZmIC0tZ2l0IGEvdGVzdHMvbWVzb24uYnVpbGQgYi90
ZXN0cy9tZXNvbi5idWlsZAotaW5kZXggNzhkMGFkOS4uMGM5ZTY0ZSAxMDA2NDQKK2luZGV4IDM3
ODEwNjYuLjkxMWI1ZmIgMTAwNjQ0CiAtLS0gYS90ZXN0cy9tZXNvbi5idWlsZAogKysrIGIvdGVz
dHMvbWVzb24uYnVpbGQKIEBAIC00LDcgKzQsNyBAQApAQCAtNDksNyArNDksNyBAQCBpbmRleCA3
OGQwYWQ5Li4wYzllNjRlIDEwMDY0NAogICAgIyBSZXNvdXJjZXM7IHdlIGNhbm5vdCB1c2UgZ25v
bWUuY29tcGlsZV9yZXNvdXJjZXMoKSBoZXJlLCBiZWNhdXNlIHdlIG5lZWQgdG8KICAgICMgb3Zl
cnJpZGUgdGhlIGVudmlyb25tZW50IGluIG9yZGVyIHRvIHVzZSB0aGUgdXRpbGl0aWVzIHdlIGp1
c3QgYnVpbHQgaW5zdGVhZAogICAgIyBvZiB0aGUgc3lzdGVtIG9uZXMKLUBAIC0xNzIsOSArMTcy
LDExIEBAIGVuZGlmCitAQCAtMTY0LDkgKzE2NCwxMSBAQCBlbmRpZgogIHRlc3RfZGVwcyA9IGdk
a19waXhidWZfZGVwcyArIFsgZ2RrcGl4YnVmX2RlcCwgXQogIHRlc3RfYXJncyA9IFsgJy1rJyBd
CiAgdGVzdF9lbnYgPSBlbnZpcm9ubWVudCgpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25v
bWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmL2ZhdGFsLWxvYWRlci5wYXRjaCBiL21ldGEvcmVjaXBl
cy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWYvZmF0YWwtbG9hZGVyLnBhdGNoCmluZGV4IDgw
YzkzZTIxNjYuLjNiNGJmNjI4NjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9nZGst
cGl4YnVmL2dkay1waXhidWYvZmF0YWwtbG9hZGVyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1n
bm9tZS9nZGstcGl4YnVmL2dkay1waXhidWYvZmF0YWwtbG9hZGVyLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA5YjRmNTczOGY4YWMzMGYzOTNiNjE2M2RjYzg0NzU3OTc2NjgzZDliIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNzhhYjRlZGFlZTVmNjI2NjNhOWE0YmNmYTU2ZTVj
NTI0ZGE0NDc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJv
c3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFR1ZSwgMSBBcHIgMjAxNCAxNzoyMzozNiArMDEw
MAogU3ViamVjdDogW1BBVENIXSBnZGstcGl4YnVmOiBhZGQgYW4gb3B0aW9uIHNvIHRoYXQgbG9h
ZGVyIGVycm9ycyBhcmUgZmF0YWwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9nZGst
cGl4YnVmL2dkay1waXhidWZfMi40Mi4xMS5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4
YnVmL2dkay1waXhidWZfMi40Mi4xMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmXzIuNDIuMTEuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWZfMi40Mi4xMi5i
YgppbmRleCBlZjBmMjNmOGY3Li45ZjgyNWE2OGVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmXzIuNDIuMTEuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zl8yLjQyLjEyLmJiCkBAIC0yMiw3ICsyMiw3IEBA
IFNSQ19VUkkgPSAiJHtHTk9NRV9NSVJST1J9LyR7QlBOfS8ke01BSl9WRVJ9LyR7QlBOfS0ke1BW
fS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1tZXNvbi5idWlsZC1hbGxvdy1hLXN1
YnNldC1vZi10ZXN0cy1pbi1jcm9zcy1jb21waWxlLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNDlkY2I0MDIzODg3MDg2NDdlOGMzMjFkNTZiNmZiMzBmMjFl
NTFlNTE1ZDBjNWE5NDIyNjhkMjMwNTJhMmYwMCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiOTUw
NWIzNDQ1YjlhN2U0OGNlZDM0NzYwYzNiY2I3M2U5NjZkZjNhYzk0Yzk1YTE0OGNiNjY5YWI3NDhl
M2M3IgogCiBpbmhlcml0IG1lc29uIHBrZ2NvbmZpZyBnZXR0ZXh0IHBpeGJ1ZmNhY2hlIHB0ZXN0
LWdub21lIHVwc3RyZWFtLXZlcnNpb24taXMtZXZlbiBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ2kt
ZG9jZ2VuIGxpYl9wYWNrYWdlCiAKLS0gCjIuNDQuMAoK

--===============5017137486214692707==--

