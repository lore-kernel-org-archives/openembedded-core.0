Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4186C54EC7
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.36620.1709330716144369960
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TI8JChAj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JaNCKBDd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018dfc0cd84c-180e198c-fd38-434d-a53b-8447e7c83cc6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bHft71R0EDKpFstruuHhOHXzU3x4kRLDMu2qrdiSCXI=;
	b=TI8JChAjli3wkA0B+r17ZfJk5w+x2wv0biDqdLo0jgmtPNG4jus2ht8vWqWblOFc
	qBLDzrLs1+Ac8Vu48p4E3T+RIVd/Pk6l2/sU+0+Iav5o/kcvmL2WEPboVfkm/T69DtD
	6S47riHp7CF0sd/1pYlhzJlv48R4mtIygQ8/NysI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330716;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bHft71R0EDKpFstruuHhOHXzU3x4kRLDMu2qrdiSCXI=;
	b=JaNCKBDdGM9idS7hBdWv/QotWE9nYPw2xRk7DbBBrh+1Cj/f3DtNVU0RHr2Q9q8O
	e95nDZPrlTaX+8VrcKikPA00n4gkEqQRx/ElOfLEdKp5RJu1vKKaLxTGcd85n0hKlIm
	MEbzojwlba/reAJLJTOXTVzKUIqc6KK2VGF7r6qc=
Content-Type: multipart/mixed; boundary="===============4563744473146687941=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 45.3 SUCCEEDED
Message-ID: <0101018dfc0cd84c-180e198c-fd38-434d-a53b-8447e7c83cc6-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196505

--===============4563744473146687941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *45.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-45.1-45.3.patch
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
From e6af7ce1fff757145d409bdbb847878487c11913 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 15:57:46 +0000
Subject: [PATCH] epiphany: upgrade 45.1 -> 45.3

---
 .../{epiphany_45.1.bb => epiphany_45.3.bb}     |  2 +-
 ...p-meson.build-disable-the-use-of-yelp.patch |  3 +--
 .../epiphany/files/distributor.patch           | 17 ++++++++++++-----
 .../epiphany/files/migrator.patch              | 18 +++++++++++++-----
 4 files changed, 27 insertions(+), 13 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_45.1.bb => epiphany_45.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_45.1.bb b/meta/recipes-gnome/epiphany/epiphany_45.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_45.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_45.3.bb
index c8631e05e9..eec52e321a 100644
--- a/meta/recipes-gnome/epiphany/epiphany_45.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_45.3.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "7c994ef34ecd60e915de331ee123c08938f9623cefada6d50b99e3c9c5ad8135"
+SRC_URI[archive.sha256sum] = "6c302e9bdd66290cb0e26f62843cd4c435a4955abdbb4f151f07dc80495d6730"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index a6c4f92c86..e505466764 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 77c9f87dc2b3ad0854a678e234e22dfb31902b82 Mon Sep 17 00:00:00 2001
+From bd45c75fe691e275d7a7d7e641ac66b153369a1c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
@@ -7,7 +7,6 @@ In particular this avoids calling itstool which oe-core doesn't provide.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  help/meson.build | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index b09c9b38d2..a2800eb62d 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,12 +1,19 @@
-Don't encode the distro from /etc/os-release into the binaries.
+From c297f5b89d7c8e98ac98e1d9a7506df6db6fc025 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 26 Feb 2021 10:17:52 +0000
+Subject: [PATCH] Don't encode the distro from /etc/os-release into the
+ binaries.
 
 Upstream-Status: Pending
 RP 2021/2/26
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
 
-Index: epiphany-3.38.2/meson.build
-===================================================================
---- epiphany-3.38.2.orig/meson.build
-+++ epiphany-3.38.2/meson.build
+diff --git a/meson.build b/meson.build
+index e416cc7..ee5f7b1 100644
+--- a/meson.build
++++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
  else
    distributor_name = 'GNOME Web'
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index a9a650a64a..1b4404c8ca 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,15 +1,23 @@
+From b38a4ceaeec05efb1b822d52c43590e7fd518113 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 25 Feb 2021 14:52:32 +0000
+Subject: [PATCH] epiphany: Fix reproducibility issue
+
 We don't want to encide BUILD_ROOT into target packages. This is used
 for build time tests but in our case those would be on target anyway
 do use the target paths.
 
 Upstream-Status: Pending
 RP 2021/2/25
+---
+ lib/ephy-profile-utils.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: epiphany-3.38.2/lib/ephy-profile-utils.c
-===================================================================
---- epiphany-3.38.2.orig/lib/ephy-profile-utils.c
-+++ epiphany-3.38.2/lib/ephy-profile-utils.c
-@@ -130,10 +130,10 @@ ephy_profile_utils_do_migration (const c
+diff --git a/lib/ephy-profile-utils.c b/lib/ephy-profile-utils.c
+index a2f6181..5218077 100644
+--- a/lib/ephy-profile-utils.c
++++ b/lib/ephy-profile-utils.c
+@@ -130,10 +130,10 @@ ephy_profile_utils_do_migration (const char *profile_directory,
    argv[i++] = NULL;
  
  #if DEVELOPER_MODE
-- 
2.42.0


--===============4563744473146687941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/epiphany/epiphany-dbg: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 6308776 to 6308648 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-dbg: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-dev: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-dev: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-doc: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-doc: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGSIZE changed from 89239 to 89238 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGSIZE changed from 81504 to 82021 (+1%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 62073 to 76452 (+23%)
packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-src: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 4546916 to 4546850 (-0%)
packages/core2-64-poky-linux/epiphany/epiphany-src: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany/epiphany: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany/epiphany: PKGSIZE changed from 2091848 to 2092112 (+0%)
packages/core2-64-poky-linux/epiphany/epiphany: PKGV changed from 45.1 [default] to 45.3 [default]
packages/core2-64-poky-linux/epiphany: PV changed from "45.1" to "45.3"
packages/core2-64-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/45/epiphany-45.1.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/45/epiphany-45.3.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/core2-64-poky-linux/epiphany: PKGV changed from 45.1 [default] to 45.3 [default]

--===============4563744473146687941==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-45.1-45.3.patch"

RnJvbSBlNmFmN2NlMWZmZjc1NzE0NWQ0MDliZGJiODQ3ODc4NDg3YzExOTEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxNTo1Nzo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDQ1LjEgLT4gNDUuMwoKLS0tCiAuLi4ve2VwaXBoYW55XzQ1LjEuYmIg
PT4gZXBpcGhhbnlfNDUuMy5iYn0gICAgIHwgIDIgKy0KIC4uLnAtbWVzb24uYnVpbGQtZGlzYWJs
ZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggfCAgMyArLS0KIC4uLi9lcGlwaGFueS9maWxlcy9kaXN0
cmlidXRvci5wYXRjaCAgICAgICAgICAgfCAxNyArKysrKysrKysrKystLS0tLQogLi4uL2VwaXBo
YW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKyst
LS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkve2VwaXBoYW55XzQ1LjEuYmIgPT4g
ZXBpcGhhbnlfNDUuMy5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUv
ZXBpcGhhbnkvZXBpcGhhbnlfNDUuMS5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9l
cGlwaGFueV80NS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80NS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDUuMy5iYgppbmRleCBjODYzMWUwNWU5Li5lZWM1
MmUzMjFhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlf
NDUuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDUuMy5i
YgpAQCAtMzEsNyArMzEsNyBAQCBTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9SfS8ke0dOT01FQk59
LyR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAxKX0vJHtHTgogICAgICAgICAgICBm
aWxlOi8vbWlncmF0b3IucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vZGlzdHJpYnV0b3IucGF0
Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI3Yzk5NGVm
MzRlY2Q2MGU5MTVkZTMzMWVlMTIzYzA4OTM4Zjk2MjNjZWZhZGE2ZDUwYjk5ZTNjOWM1YWQ4MTM1
IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNmMzMDJlOWJkZDY2MjkwY2IwZTI2ZjYy
ODQzY2Q0YzQzNWE0OTU1YWJkYmI0ZjE1MWYwN2RjODA0OTVkNjczMCIKIAogIyBEZXZlbG9wZXIg
bW9kZSBlbmFibGVzIGRlYnVnZ2luZwogUEFDS0FHRUNPTkZJR1tkZXZlbG9wZXItbW9kZV0gPSAi
LURkZXZlbG9wZXJfbW9kZT10cnVlLC1EZGV2ZWxvcGVyX21vZGU9ZmFsc2UiCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxk
LWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBo
YW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5w
YXRjaAppbmRleCBhNmM0ZjkyYzg2Li5lNTA1NDY2NzY0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhl
LXVzZS1vZi15ZWxwLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxl
cy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDc3YzlmODdkYzJiM2FkMDg1NGE2NzhlMjM0ZTIyZGZiMzE5MDJi
ODIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGJkNDVjNzVmZTY5MWUyNzVkN2E3ZDdl
NjQxYWM2NmIxNTMzNjlhMWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMzEgSmFuIDIw
MTggMTU6NTA6MzggKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gaGVscC9tZXNvbi5idWlsZDogZGlz
YWJsZSB0aGUgdXNlIG9mIHllbHAKQEAgLTcsNyArNyw2IEBAIEluIHBhcnRpY3VsYXIgdGhpcyBh
dm9pZHMgY2FsbGluZyBpdHN0b29sIHdoaWNoIG9lLWNvcmUgZG9lc24ndCBwcm92aWRlLgogCiBV
cHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiBTaWduZWQt
b2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KLQogLS0t
CiAgaGVscC9tZXNvbi5idWlsZCB8IDggKysrKy0tLS0KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21l
L2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCmluZGV4IGIwOWM5YjM4ZDIuLmEyODAwZWI2
MmQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmli
dXRvci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJp
YnV0b3IucGF0Y2gKQEAgLTEsMTIgKzEsMTkgQEAKLURvbid0IGVuY29kZSB0aGUgZGlzdHJvIGZy
b20gL2V0Yy9vcy1yZWxlYXNlIGludG8gdGhlIGJpbmFyaWVzLgorRnJvbSBjMjk3ZjViODlkN2M4
ZTk4YWM5OGUxZDlhNzUwNmRmNmRiNmZjMDI1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CitE
YXRlOiBGcmksIDI2IEZlYiAyMDIxIDEwOjE3OjUyICswMDAwCitTdWJqZWN0OiBbUEFUQ0hdIERv
bid0IGVuY29kZSB0aGUgZGlzdHJvIGZyb20gL2V0Yy9vcy1yZWxlYXNlIGludG8gdGhlCisgYmlu
YXJpZXMuCiAKIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogUlAgMjAyMS8yLzI2CistLS0KKyBt
ZXNvbi5idWlsZCB8IDEgKworIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCi1JbmRl
eDogZXBpcGhhbnktMy4zOC4yL21lc29uLmJ1aWxkCi09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLS0gZXBpcGhhbnkt
My4zOC4yLm9yaWcvbWVzb24uYnVpbGQKLSsrKyBlcGlwaGFueS0zLjM4LjIvbWVzb24uYnVpbGQK
K2RpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCitpbmRleCBlNDE2Y2M3Li5l
ZTVmN2IxIDEwMDY0NAorLS0tIGEvbWVzb24uYnVpbGQKKysrKyBiL21lc29uLmJ1aWxkCiBAQCAt
MTUsNiArMTUsNyBAQCBpZiByLnJldHVybmNvZGUoKSA9PSAwCiAgZWxzZQogICAgZGlzdHJpYnV0
b3JfbmFtZSA9ICdHTk9NRSBXZWInCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBp
cGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkv
ZmlsZXMvbWlncmF0b3IucGF0Y2gKaW5kZXggYTlhNjUwYTY0YS4uMWI0NDA0YzhjYSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaApAQCAt
MSwxNSArMSwyMyBAQAorRnJvbSBiMzhhNGNlYWVlYzA1ZWZiMWI4MjJkNTJjNDM1OTBlN2ZkNTE4
MTEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CitEYXRlOiBUaHUsIDI1IEZlYiAyMDIxIDE0
OjUyOjMyICswMDAwCitTdWJqZWN0OiBbUEFUQ0hdIGVwaXBoYW55OiBGaXggcmVwcm9kdWNpYmls
aXR5IGlzc3VlCisKIFdlIGRvbid0IHdhbnQgdG8gZW5jaWRlIEJVSUxEX1JPT1QgaW50byB0YXJn
ZXQgcGFja2FnZXMuIFRoaXMgaXMgdXNlZAogZm9yIGJ1aWxkIHRpbWUgdGVzdHMgYnV0IGluIG91
ciBjYXNlIHRob3NlIHdvdWxkIGJlIG9uIHRhcmdldCBhbnl3YXkKIGRvIHVzZSB0aGUgdGFyZ2V0
IHBhdGhzLgogCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIFJQIDIwMjEvMi8yNQorLS0tCisg
bGliL2VwaHktcHJvZmlsZS11dGlscy5jIHwgNCArKy0tCisgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAotSW5kZXg6IGVwaXBoYW55LTMuMzguMi9saWIv
ZXBoeS1wcm9maWxlLXV0aWxzLmMKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBlcGlwaGFueS0zLjM4LjIub3Jp
Zy9saWIvZXBoeS1wcm9maWxlLXV0aWxzLmMKLSsrKyBlcGlwaGFueS0zLjM4LjIvbGliL2VwaHkt
cHJvZmlsZS11dGlscy5jCi1AQCAtMTMwLDEwICsxMzAsMTAgQEAgZXBoeV9wcm9maWxlX3V0aWxz
X2RvX21pZ3JhdGlvbiAoY29uc3QgYworZGlmZiAtLWdpdCBhL2xpYi9lcGh5LXByb2ZpbGUtdXRp
bHMuYyBiL2xpYi9lcGh5LXByb2ZpbGUtdXRpbHMuYworaW5kZXggYTJmNjE4MS4uNTIxODA3NyAx
MDA2NDQKKy0tLSBhL2xpYi9lcGh5LXByb2ZpbGUtdXRpbHMuYworKysrIGIvbGliL2VwaHktcHJv
ZmlsZS11dGlscy5jCitAQCAtMTMwLDEwICsxMzAsMTAgQEAgZXBoeV9wcm9maWxlX3V0aWxzX2Rv
X21pZ3JhdGlvbiAoY29uc3QgY2hhciAqcHJvZmlsZV9kaXJlY3RvcnksCiAgICBhcmd2W2krK10g
PSBOVUxMOwogIAogICNpZiBERVZFTE9QRVJfTU9ERQotLSAKMi40Mi4wCgo=

--===============4563744473146687941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1864 targets, 46 skipped, 0 masked, 0 errors.
Removing 155 recipes from the core2-64 sysroot...done.
Removing 182 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3a2b49ab3d9167b9b6bd3780b82dd35949e673b1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3a2b49ab3d9167b9b6bd3780b82dd35949e673b1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1206 Local 1009 Mirrors 0 Missed 197 Current 492 (83% match, 88% complete)
Removing 9 stale sstate objects for arch allarch...done.
Removing 8 stale sstate objects for arch x86_64...done.
Removing 6 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 497 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-dbusmock_0.31.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_23.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 516 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 527 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 528 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 542 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 548 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 553 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 558 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 563 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 572 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcr-4.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libadwaita-1.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 573 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 574 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 575 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe gcr-4.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 576 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-23.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libadwaita-1.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 580 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_recipe_qa_setscene)
NOTE: recipe libhandy-1.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 581 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 582 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 583 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 585 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-dbusmock-0.31.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 597 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 598 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 602 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 603 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcr-4.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libadwaita-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 607 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 611 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.37.bb:do_create_spdx_setscene)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libadwaita-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcr-4.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 626 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 627 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 628 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 630 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 631 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 632 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gi-docgen-2023.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 633 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 636 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 642 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 666 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.37-r0: task do_create_spdx_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 667 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.37-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 671 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.37.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 684 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 688 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 695 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 697 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 698 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_package_setscene)
NOTE: recipe orc-0.4.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.12.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.12.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/orc/0.4.37/temp/log.do_packagedata_setscene.2604193
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.37.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.37.bb:do_package_setscene)
NOTE: Running setscene task 707 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 708 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 710 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 725 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 726 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2023.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk4-4.12.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.72-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.12.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 732 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 734 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 735 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 736 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 737 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 739 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 741 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe gi-docgen-2023.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 743 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 748 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 751 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 755 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.52.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 756 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 759 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.72-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 760 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 761 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 762 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 763 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 764 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 766 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 767 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.52.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 769 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_package_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.37-r0: task do_package_setscene: Started
NOTE: recipe orc-0.4.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 772 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.10.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 773 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 774 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 775 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 777 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pango-1.52.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 778 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 780 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.52.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 782 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 783 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 785 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/freetype/freetype_2.13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 786 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 788 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 790 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 792 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 793 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 795 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 796 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.37-r0: task do_package_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 798 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.37.bb:do_recipe_qa_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 803 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 804 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.37-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 809 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 811 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 812 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata_setscene)
NOTE: recipe webkitgtk-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_create_spdx_setscene)
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 820 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 821 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 822 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_create_spdx_setscene)
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtheora-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 825 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_create_spdx_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 828 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 829 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 831 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 832 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_create_spdx_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 836 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 847 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 849 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 851 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 854 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/webp/libwebp_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 855 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_create_spdx_setscene)
NOTE: Running setscene task 856 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 859 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.75.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 860 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 862 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.33-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 863 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe webkitgtk-2.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 865 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 866 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwebp-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 868 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 869 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 871 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 873 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-protocols-1.33-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 876 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 882 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 883 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 884 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 886 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 887 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 888 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 890 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_24.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.33-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 894 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 898 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 899 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 901 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 905 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 907 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 909 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 911 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.120-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 913 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 915 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 916 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 918 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: recipe libwpe-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_24.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 920 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 922 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 923 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 925 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 927 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_24.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 928 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libwpe-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 930 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 931 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 932 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 934 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 935 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 938 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.120-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 945 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 946 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwpe-1.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 947 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 949 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 950 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 955 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 956 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libwpe-1.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 957 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxmlb-0.3.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 959 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 960 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 962 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 963 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 965 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.268.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe appstream-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 967 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 968 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 970 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 971 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 973 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe appstream-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 974 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 975 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 977 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 981 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 983 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libxmlb-0.3.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 985 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 988 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.268.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 989 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 991 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 992 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe appstream-1.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 994 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 996 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 997 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 999 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1003 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe appstream-1.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1004 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1005 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1006 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1007 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.6.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1008 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1010 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe enchant2-2.6.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.14.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1012 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1013 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1015 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1017 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1019 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe enchant2-2.6.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe aspell-0.60.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1021 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1022 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1024 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe at-spi2-core-2.50.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1026 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.14.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1027 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1028 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1029 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1030 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1031 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1032 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx_setscene)
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe enchant2-2.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1034 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1035 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1044 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1048 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1050 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1051 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe enchant2-2.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1053 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1054 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1055 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1057 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1058 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1061 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1062 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1064 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1066 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1067 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.17-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1068 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1072 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1075 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/aspell/aspell_0.60.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1077 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1079 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1081 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1082 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1085 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1087 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1089 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1090 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1093 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1095 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1097 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe aspell-0.60.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1099 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1100 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1102 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1104 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1105 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1108 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1110 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1111 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1112 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1114 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1115 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1116 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1118 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1120 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1123 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1124 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1125 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1127 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1129 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1130 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-74-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1131 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1133 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1134 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1137 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1138 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1139 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1142 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1143 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1144 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1151 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1152 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1154 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe libsoup-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1155 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1156 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1157 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1158 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1159 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1160 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1163 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1167 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1169 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1170 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1171 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-31-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1173 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1174 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1175 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1176 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1178 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1180 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1182 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1184 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1188 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpsl/libpsl_0.21.5.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1191 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1194 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1196 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1197 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-31-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1198 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1200 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1202 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1204 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1206 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1208 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.21.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1209 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1210 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1211 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe kmod-31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1214 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_31.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1217 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1218 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1220 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1221 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1222 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1223 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1225 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1227 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1229 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1231 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-31-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1232 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1233 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1234 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_create_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1235 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_packagedata_setscene)
NOTE: recipe icu-74-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1237 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_74-1.bb:do_recipe_qa_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1238 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1240 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe nghttp2-1.59.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1241 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.59.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1243 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1244 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1245 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1247 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1249 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_create_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1250 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1254 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1255 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1316 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1317 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_packagedata_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-74-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1338 of 1698 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.59.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1377 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1379 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.39.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1399 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1458 of 1698 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nghttp2-1.59.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe p11-kit-0.25.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1464 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxslt-1.1.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-native-2.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1465 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1466 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1467 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1468 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1470 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1471 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1475 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1476 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1477 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1481 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe shared-mime-info-native-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1483 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1484 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1486 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1487 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe p11-kit-0.25.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1490 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nghttp2/nghttp2_1.59.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1492 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1493 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1495 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1498 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1501 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1503 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1508 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1510 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1511 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1512 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe nghttp2-1.59.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librsvg-native-2.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1515 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1518 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1520 of 1698 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/cargo_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.59.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe p11-kit-0.25.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1524 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1525 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1526 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1528 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cargo-native-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1530 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1531 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1532 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1535 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1537 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1538 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1539 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1540 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1541 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1542 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1543 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_setscene: Started
NOTE: Running setscene task 1545 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1546 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1547 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1548 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1550 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1551 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1552 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1556 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1558 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1561 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1563 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1565 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1566 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1569 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1571 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe cargo-native-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1575 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1577 of 1698 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/rust_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1579 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rust-native-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1588 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1589 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1591 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1014 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_fetch)
NOTE: Running task 1067 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_fetch)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1119 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Started
NOTE: Running task 1171 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_fetch)
NOTE: Running task 1175 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_fetch)
NOTE: Running task 1177 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_fetch)
NOTE: recipe fontconfig-2.15.0-r0: task do_fetch: Succeeded
NOTE: Running task 1194 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_unpack)
NOTE: recipe cairo-1.18.0-r0: task do_fetch: Started
NOTE: Running task 1217 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_fetch)
NOTE: Running task 1219 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_fetch)
NOTE: Running task 1222 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_write_config)
NOTE: recipe cairo-1.18.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1250 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1285 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1286 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Started
NOTE: Running task 1336 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_write_config)
NOTE: recipe pango-1.52.0-r0: task do_fetch: Started
NOTE: Running task 1339 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_write_config)
NOTE: Running task 1343 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_fetch)
NOTE: recipe libxft-1_2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 1350 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Started
NOTE: Running task 1355 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_unpack)
NOTE: recipe pango-1.52.0-r0: task do_fetch: Succeeded
NOTE: Running task 1373 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Started
NOTE: Running task 1376 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe cairo-1.18.0-r0: task do_write_config: Started
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_fetch: Succeeded
NOTE: Running task 1377 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_unpack)
NOTE: recipe fontconfig-2.15.0-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_write_config: Succeeded
NOTE: Running task 1378 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_patch)
NOTE: recipe harfbuzz-8.3.0-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pango-1.52.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_unpack: Started
NOTE: Running task 1405 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_fetch: Started
NOTE: Running task 1406 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_write_config)
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe pango-1.52.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1407 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_fetch: Succeeded
NOTE: recipe pango-1.52.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1426 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_unpack)
NOTE: Running task 1428 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_fetch)
NOTE: Running task 1434 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_unpack)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Started
NOTE: Running task 1452 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe fontconfig-2.15.0-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1471 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_patch)
NOTE: Running task 1477 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_fetch)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Started
NOTE: recipe vala-0.56.13-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_unpack: Started
NOTE: Running task 1479 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_write_config: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: recipe rust-native-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Started
NOTE: recipe libical-3.0.17-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_write_config: Succeeded
NOTE: Running task 1511 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_unpack)
NOTE: recipe libical-3.0.17-r0: task do_fetch: Succeeded
NOTE: recipe fontconfig-2.15.0-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1567 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_fetch)
NOTE: Running task 1573 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_unpack)
NOTE: Running task 1576 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_fetch)
NOTE: Running task 1579 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1580 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe pango-1.52.0-r0: task do_unpack: Succeeded
NOTE: Running task 1595 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_patch)
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 1604 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: Running task 1606 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_write_config)
NOTE: recipe vala-0.56.13-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1607 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libical-3.0.17-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_24.0.1-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe pango-1.52.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_write_config: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_24.0.1-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_unpack: Succeeded
NOTE: Running task 1639 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_patch)
NOTE: Running task 1645 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe bluez5-5.72-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_unpack: Succeeded
NOTE: Running task 1663 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_write_config: Succeeded
NOTE: Running task 1681 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_unpack)
NOTE: Running task 1693 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_unpack)
NOTE: Running task 1694 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_unpack)
NOTE: Running task 1695 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1713 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe pango-1.52.0-r0: task do_patch: Succeeded
NOTE: Running task 1761 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_patch: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Started
NOTE: recipe libical-3.0.17-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_unpack: Started
NOTE: recipe bluez5-5.72-r0: task do_unpack: Started
NOTE: recipe mesa-2_24.0.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1879 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_write_config)
NOTE: recipe shared-mime-info-2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1924 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_patch)
NOTE: Running task 1949 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe libical-3.0.17-r0: task do_patch: Succeeded
NOTE: Running task 1950 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_generate_toolchain_file)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_unpack: Succeeded
NOTE: Running task 1955 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 1958 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_fetch)
NOTE: Running task 1959 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_patch)
NOTE: recipe mesa-2_24.0.1-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe mesa-2_24.0.1-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_generate_toolchain_file: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe vala-0.56.13-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_fetch: Started
NOTE: Running task 2015 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: recipe libical-3.0.17-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_patch: Succeeded
NOTE: recipe at-spi2-core-2.50.1-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_unpack: Succeeded
NOTE: Running task 2021 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.72.bb:do_patch)
NOTE: Running task 2024 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 2032 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_unpack)
NOTE: recipe vala-0.56.13-r0: task do_patch: Succeeded
NOTE: Running task 2048 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb:do_fetch)
NOTE: Running setscene task 1593 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1594 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1595 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 1596 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1597 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1598 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe libxmlb-0.3.15-r0: task do_fetch: Started
NOTE: recipe bluez5-5.72-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.10-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.10-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1599 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running task 2053 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1600 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_unpack: Succeeded
NOTE: Running task 2054 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2068 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: Running task 2071 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1603 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.72-r0: task do_patch: Succeeded
NOTE: Running setscene task 1605 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running task 2077 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_unpack)
NOTE: Running task 2098 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb:do_unpack)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: Running task 2111 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1606 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1608 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2120 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.10.bb:do_fetch)
NOTE: Running task 2121 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.10-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2122 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2128 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: Running task 2131 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2138 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.10-r0: task do_fetch: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_patch: Started
NOTE: Running task 2139 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.10-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2143 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2157 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_write_config)
NOTE: Running task 2162 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_fetch)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2163 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1611 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 2183 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: Running task 2186 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb:do_fetch)
NOTE: Running task 2187 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: recipe at-spi2-core-2.50.1-r0: task do_write_config: Started
NOTE: Running task 2188 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 2193 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.10.bb:do_unpack)
NOTE: Running task 2194 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.22.10-r0: task do_unpack: Succeeded
NOTE: Running task 2203 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_unpack)
NOTE: Running task 2204 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb:do_patch)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: Running task 2206 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_fetch)
NOTE: recipe gtk4-4.12.5-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.12.5-r0: task do_fetch: Succeeded
NOTE: Running task 2225 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: Running task 2228 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_unpack)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 2233 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.10-r0: task do_unpack: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_write_config: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1613 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.10-r0: task do_patch: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_unpack: Succeeded
NOTE: recipe libwpe-1.14.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1614 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1615 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe libwpe-1.14.2-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1616 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1618 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running setscene task 1619 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: Running setscene task 1620 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.10-r0: task do_write_config: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.10-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1621 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-glib-1.8.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1622 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.22.10-r0: task do_patch: Succeeded
NOTE: Running setscene task 1623 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1624 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2244 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1627 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1629 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1631 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.12.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1632 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_24.0.1-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 2245 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 2246 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_patch)
NOTE: recipe libxmlb-0.3.15-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2247 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_patch)
NOTE: recipe bash-completion-2.12.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1636 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.12.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.10-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 2258 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.10.bb:do_patch)
NOTE: Running task 2266 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb:do_unpack)
NOTE: Running task 2267 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2278 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_unpack)
NOTE: Running setscene task 1639 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.15-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_24.0.1-r0: task do_patch: Started
NOTE: Running task 2292 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Started
NOTE: Running setscene task 1641 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2297 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.10.bb:do_write_config)
NOTE: recipe libwpe-1.14.2-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.10-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.12.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe json-glib-1.8.0-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.12.5-r0: task do_unpack: Started
NOTE: Running task 2306 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_write_config)
NOTE: Running task 2309 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwpe-1.14.2-r0: task do_unpack: Succeeded
NOTE: Running task 2321 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 2328 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.10-r0: task do_write_config: Started
NOTE: Running task 2347 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_write_config)
NOTE: Running task 2352 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb:do_write_config)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_write_config: Started
NOTE: Running setscene task 1643 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1644 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.10-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1646 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libwpe-1.14.2-r0: task do_patch: Started
NOTE: Running task 2399 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: recipe gtk+3-3.24.38-r0: task do_write_config: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Started
NOTE: recipe libsoup-3.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 2424 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_fetch)
NOTE: Running task 2425 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_unpack)
NOTE: recipe gtk4-4.12.5-r0: task do_write_config: Started
NOTE: recipe libwpe-1.14.2-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_24.0.1-r0: task do_patch: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 2426 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_fetch)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.10-r0: task do_patch: Succeeded
NOTE: Running task 2428 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_fetch)
NOTE: Running task 2430 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_fetch)
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.12.5-r0: task do_write_config: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Succeeded
NOTE: Running task 2432 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_fetch)
NOTE: recipe json-glib-1.8.0-r0: task do_write_config: Succeeded
NOTE: Running task 2433 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_patch)
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: Running task 2434 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_fetch)
NOTE: recipe appstream-1.0.0-r0: task do_fetch: Started
NOTE: recipe enchant2-2.6.7-r0: task do_fetch: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Started
NOTE: recipe appstream-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.6.7-r0: task do_fetch: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2454 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/libwpe_1.14.2.bb:do_generate_toolchain_file)
NOTE: recipe libnotify-0.8.3-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2471 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: Running task 2473 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_fetch)
NOTE: Running task 2476 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_fetch)
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Started
NOTE: Running task 2489 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_unpack)
NOTE: recipe gtk+3-3.24.38-r0: task do_patch: Started
NOTE: Running task 2490 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_unpack)
NOTE: Running task 2491 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_unpack)
NOTE: recipe libsecret-0.21.4-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_fetch: Succeeded
NOTE: Running task 2492 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_unpack)
NOTE: Running task 2494 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_unpack)
NOTE: recipe libwpe-1.14.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_fetch: Started
NOTE: recipe enchant2-2.6.7-r0: task do_unpack: Started
NOTE: recipe libwpe-1.14.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe appstream-1.0.0-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Started
NOTE: Running task 2495 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_patch)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_fetch: Succeeded
NOTE: recipe webkitgtk-2.42.2-r0: task do_fetch: Succeeded
NOTE: Running task 2496 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_unpack)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Started
NOTE: Running setscene task 1648 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1649 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1650 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_patch: Succeeded
NOTE: Running setscene task 1652 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: Running task 2525 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb:do_fetch)
NOTE: recipe enchant2-2.6.7-r0: task do_unpack: Succeeded
NOTE: Running task 2526 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnotify-0.8.3-r0: task do_unpack: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Started
NOTE: Running task 2527 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_patch)
NOTE: recipe libsecret-0.21.4-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2528 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_patch)
NOTE: recipe libxt-1_1.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2529 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_patch)
NOTE: recipe libsoup-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe libadwaita-1.4.3-r0: task do_fetch: Started
NOTE: Running task 2530 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_fetch)
NOTE: recipe libadwaita-1.4.3-r0: task do_fetch: Succeeded
NOTE: recipe enchant2-2.6.7-r0: task do_patch: Started
NOTE: Running task 2531 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_fetch)
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_unpack: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2532 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_patch)
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Started
NOTE: recipe appstream-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2538 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_patch)
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Started
NOTE: Running setscene task 1654 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running task 2539 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.2.0.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1656 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1657 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnotify-0.8.3-r0: task do_patch: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Started
NOTE: Running setscene task 1659 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Started
NOTE: recipe enchant2-2.6.7-r0: task do_patch: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_patch: Succeeded
NOTE: Running task 2540 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_fetch)
NOTE: Running task 2541 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_unpack)
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_fetch: Succeeded
NOTE: Running task 2550 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_write_config)
NOTE: recipe appstream-1.0.0-r0: task do_patch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2554 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_unpack)
NOTE: recipe gcr-4.2.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcr-4.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Started
NOTE: Running task 2577 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_write_config)
NOTE: Running task 2590 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe webkitgtk-2.42.2-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Started
NOTE: recipe appstream-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 2628 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb:do_unpack)
NOTE: Running task 2629 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_unpack)
NOTE: Running task 2630 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_unpack)
NOTE: Running task 2631 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.2.0.bb:do_unpack)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1661 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: Running task 2719 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_write_config)
NOTE: Running task 2723 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_write_config)
NOTE: recipe libhandy-1.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 2724 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_unpack)
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.4.3-r0: task do_unpack: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Started
NOTE: recipe gcr-4.2.0-r0: task do_unpack: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_unpack: Succeeded
NOTE: Running task 2725 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_patch)
NOTE: recipe libsoup-3.4.4-r0: task do_write_config: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2728 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_write_config)
NOTE: recipe appstream-1.0.0-r0: task do_write_config: Started
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Started
NOTE: Running setscene task 1663 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe appstream-1.0.0-r0: task do_write_config: Succeeded
NOTE: recipe libnotify-0.8.3-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running setscene task 1664 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 2729 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3827d1886d21fc285ddcf2fcb9cb1cc58679b8245b5b8a3c52f01f2714d587ae
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash f6371fab29af7aa59ff69cb56f79622302c9a239bf4c2ddb1729b7dae652cfc1 to hashserv.yocto.io:8686 ({'taskhash': '4185b2ade033f93e86f940806d2ecd90d9a7baa819ef29d735d5e07923e98b6e', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'f6371fab29af7aa59ff69cb56f79622302c9a239bf4c2ddb1729b7dae652cfc1'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 4185b2ade033f93e86f940806d2ecd90d9a7baa819ef29d735d5e07923e98b6e -> f6371fab29af7aa59ff69cb56f79622302c9a239bf4c2ddb1729b7dae652cfc1 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcr-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_patch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Started
NOTE: Running setscene task 1666 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 2731 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.2.0.bb:do_patch)
NOTE: Running task 2732 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/wpebackend-fdo_1.14.2.bb:do_write_config)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_patch: Succeeded
NOTE: Running task 2744 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.3.bb:do_recipe_qa)
NOTE: Running task 2755 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_write_config)
NOTE: recipe libsecret-0.21.4-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Started
NOTE: Running task 2801 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb:do_write_config)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_patch: Succeeded
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Started
NOTE: Running task 2802 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_write_config)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcr-4.2.0-r0: task do_patch: Started
NOTE: recipe epiphany-45.3-r0: task do_recipe_qa: Started
NOTE: Running task 2805 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_write_config)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_write_config: Started
NOTE: recipe wpebackend-fdo-1.14.2-r0: task do_write_config: Succeeded
NOTE: recipe gcr-4.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2807 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.2.0.bb:do_write_config)
NOTE: Running task 2809 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_write_config)
NOTE: recipe libportal-0.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libadwaita-1.4.3-r0: task do_write_config: Started
NOTE: Running task 2810 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_patch)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_write_config: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libadwaita-1.4.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1668 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1669 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1670 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Started
NOTE: Running setscene task 1671 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libadwaita-1.4.3-r0: task do_write_config: Succeeded
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Started
NOTE: Running setscene task 1673 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe epiphany-45.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2813 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.3.bb:do_patch)
NOTE: recipe libportal-0.7.1-r0: task do_write_config: Succeeded
NOTE: Running task 2814 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.3.bb:do_fetch)
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Started
NOTE: recipe gtk4-4.12.5-r0: task do_unpack: Succeeded
NOTE: recipe gcr-4.2.0-r0: task do_write_config: Started
NOTE: Running task 2815 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.12.5.bb:do_patch)
NOTE: recipe libportal-0.7.1-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdazzle-3.44.0-r0: task do_write_config: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2827 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb:do_patch)
NOTE: recipe libhandy-1.8.3-r0: task do_unpack: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_write_config: Succeeded
NOTE: Running task 2828 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_patch)
NOTE: recipe gcr-4.2.0-r0: task do_write_config: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2861 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.3.bb:do_write_config)
NOTE: recipe libportal-0.7.1-r0: task do_patch: Succeeded
NOTE: Running task 2872 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gnome/adwaita-icon-theme_45.0.bb:do_write_config)
NOTE: recipe libadwaita-1.4.3-r0: task do_patch: Started
NOTE: recipe epiphany-45.3-r0: task do_fetch: Started
NOTE: recipe gtk4-4.12.5-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe epiphany-45.3-r0: task do_fetch: Succeeded
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2913 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.3.bb:do_unpack)
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libadwaita-1.4.3-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Started
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_write_config: Started
NOTE: recipe epiphany-45.3-r0: task do_write_config: Started
NOTE: recipe gtk4-4.12.5-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1677 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1678 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1680 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libhandy-1.8.3-r0: task do_patch: Succeeded
NOTE: recipe epiphany-45.3-r0: task do_unpack: Started
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-45.3-r0: task do_write_config: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1685 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1687 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1688 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe epiphany-45.3-r0: task do_unpack: Succeeded
NOTE: Running task 3041 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.3.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-45.0-r0: task do_patch: Succeeded
NOTE: recipe epiphany-45.3-r0: task do_patch: Started
NOTE: recipe epiphany-45.3-r0: task do_patch: Succeeded
NOTE: Running task 3061 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3062 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.3.bb:do_populate_lic)
NOTE: recipe epiphany-45.3-r0: task do_populate_lic: Started
NOTE: recipe epiphany-45.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-45.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.3.bb:do_populate_lic unihash changed to ae16ee7e57062f50eef094c8fa4f173c661c0f9cf32c727de494fd4fc2649617
NOTE: recipe epiphany-45.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1691 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1693 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1694 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1696 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe webkitgtk-2.42.2-r0: task do_unpack: Succeeded
NOTE: Running task 3074 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_patch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1698 of 1698 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe webkitgtk-2.42.2-r0: task do_patch: Succeeded
NOTE: Running task 3377 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3456 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3489 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3536 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3549 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3560 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 3626 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3806 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3819 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: Running task 3856 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-2_24.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3880 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_collect_spdx_deps)
NOTE: Running task 3891 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.37.bb:do_packagedata)
NOTE: Running task 3895 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe fontconfig-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3922 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_configure)
NOTE: recipe libxmlb-0.3.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3957 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3964 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe orc-0.4.37-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_configure: Started
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3986 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_collect_spdx_deps)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3987 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5009bfdce64be5968dd9927eeb08146bbc59582b45f2dbfd597d0d6515f565bd
NOTE: Running task 3996 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.37-r0: task do_packagedata: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 4012 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: Running task 4016 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.6.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4017 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_configure)
NOTE: Running task 4018 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4019 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_configure)
NOTE: recipe libxmlb-0.3.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_24.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4020 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_24.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4021 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4022 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: Running task 4023 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_configure)
NOTE: recipe json-glib-1.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4024 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4025 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_configure: Started
NOTE: Running task 4040 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_collect_spdx_deps)
NOTE: recipe vala-0.56.13-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Started
NOTE: recipe libsoup-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4041 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_configure)
NOTE: recipe libxmlb-0.3.15-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Started
NOTE: recipe mesa-2_24.0.1-r0: task do_configure: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Started
NOTE: recipe enchant2-2.6.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4042 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4051 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_collect_spdx_deps)
NOTE: recipe enchant2-2.6.7-r0: task do_configure: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4052 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_configure)
NOTE: recipe vala-0.56.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4053 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_configure)
NOTE: recipe vala-0.56.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4054 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_configure: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4055 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Succeeded
NOTE: Running task 4056 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_configure: Succeeded
NOTE: Running task 4057 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_compile)
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.4-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_configure: Succeeded
NOTE: Running task 4058 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_compile)
NOTE: Running task 4059 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_configure_ptest_base)
NOTE: Running task 4060 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_install)
NOTE: recipe libxmlb-0.3.15-r0: task do_configure: Succeeded
NOTE: Running task 4061 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_configure_ptest_base)
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_configure_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4062 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile)
NOTE: recipe libxmlb-0.3.15-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4063 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_compile)
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_configure: Succeeded
NOTE: Running task 4064 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 4065 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_install: Succeeded
NOTE: Running task 4066 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_compile: Succeeded
NOTE: Running task 4067 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_package)
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4068 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_install)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_configure: Succeeded
NOTE: Running task 4069 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_install: Succeeded
NOTE: Running task 4079 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-sato/webkit/webkitgtk_2.42.2.bb:do_generate_toolchain_file)
NOTE: recipe webkitgtk-2.42.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe webkitgtk-2.42.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 4097 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_configure: Succeeded
NOTE: Running task 4098 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_configure_ptest_base)
NOTE: recipe libstd-rs-1.75.0-r0: task do_unpack: Succeeded
NOTE: Running task 4111 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4112 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_compile: Succeeded
NOTE: Running task 4113 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4126 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.27-r0: task do_package: Succeeded
NOTE: Running task 4127 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4130 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.27-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_packagedata unihash changed to 4cc7b5f50299033b37b60dc58d2171ad2cacc68db16ac2686c74c5c0c6d358fc
NOTE: Setscene tasks completed
NOTE: Running task 4149 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4153 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_populate_sysroot)
NOTE: recipe libstd-rs-1.75.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4154 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_create_spdx)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_populate_sysroot: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4174 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4197 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_install: Succeeded
NOTE: Running task 4198 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4199 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4200 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_collect_spdx_deps)
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsoup-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4201 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 4202 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4203 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_create_spdx: Succeeded
NOTE: Running task 4225 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile: Succeeded
NOTE: Running task 4226 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_compile_ptest_base)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-2_24.0.1-r0: task do_configure: Succeeded
NOTE: Running task 4240 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_collect_spdx_deps)
NOTE: Running task 4241 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.1.bb:do_compile)
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.8.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_collect_spdx_deps: Started
NOTE: Running task 4242 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install)
NOTE: recipe mesa-2_24.0.1-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4247 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_compile: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package: Succeeded
NOTE: Running task 4248 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4249 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure)
NOTE: Running task 4250 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_packagedata)
NOTE: recipe json-glib-1.8.0-r0: task do_install: Started
NOTE: recipe enchant2-2.6.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_packagedata: Started
NOTE: Running task 4251 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_install: Started
NOTE: recipe enchant2-2.6.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4252 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: recipe libxmlb-0.3.15-r0: task do_compile: Succeeded
NOTE: Running task 4253 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_compile_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe vala-0.56.13-r0: task do_configure: Succeeded
NOTE: Running task 4254 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_compile)
NOTE: recipe libxmlb-0.3.15-r0: task do_compile_ptest_base: Started
NOTE: recipe vala-0.56.13-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4255 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_packagedata unihash changed to 1bd56539981681cb973eb149590f2d3482ce2e2e68bfdee61574a8464e4a2318
NOTE: recipe libxt-1_1.3.0-r0: task do_configure: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 4256 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_compile)
NOTE: Running task 4257 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4258 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_collect_spdx_deps)
NOTE: recipe json-glib-1.8.0-r0: task do_install: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Started
NOTE: Running task 4259 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_install_ptest_base)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4268 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_install: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4269 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_populate_sysroot)
NOTE: Running task 4270 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_package)
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_populate_sysroot: Started
NOTE: recipe json-glib-1.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.50.1-r0: task do_package: Started
NOTE: Running task 4271 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_package)
NOTE: recipe libxmlb-0.3.15-r0: task do_install: Succeeded
NOTE: Running task 4272 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.8.0-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_install_ptest_base: Started
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 4273 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe libxmlb-0.3.15-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4274 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4275 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_package)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe libsoup-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 4276 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_install)
NOTE: recipe libxmlb-0.3.15-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxmlb-0.3.15-r0: task do_package: Started
NOTE: Running task 4277 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_populate_sysroot)
NOTE: recipe libsoup-3.4.4-r0: task do_install: Started
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4281 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_ipk)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 4282 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_ipk: Started
NOTE: recipe libsoup-3.4.4-r0: task do_install: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe json-glib-1.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4283 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_sysroot)
NOTE: Running task 4284 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_package)
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 4285 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_compile)
NOTE: recipe libsoup-3.4.4-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to d9e9b7993001e4ad7701076f77aa0a649de645112cfd688c60cb7f293a073649
NOTE: recipe fontconfig-2.15.0-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 4286 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4287 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_deb)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_deb: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 4288 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_rpm)
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure: Succeeded
NOTE: Running task 4289 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_configure_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4290 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile)
NOTE: Running task 4291 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_packagedata)
NOTE: recipe libxt-1_1.3.0-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Started
NOTE: Running task 4292 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_install)
NOTE: recipe libxmlb-0.3.15-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_ipk unihash changed to 13fcab0eb9de5723940be4384f3b4c4e91d97646e0d9d72f0c98c730d9badb7e
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_deb unihash changed to 61ca4f6ea6ea96547d8f78e5db5c14ac779316279aa8cb45bee6124fab66fa5b
NOTE: recipe libxmlb-0.3.15-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_packagedata unihash changed to 0583f2af96d050cc993760f0f32b85c817a8ee3a119e4ddd1cd7f3b166ec061e
NOTE: Setscene tasks completed
NOTE: Running task 4293 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb:do_create_spdx)
NOTE: recipe libxmlb-0.3.15-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.15-r0: task do_create_spdx: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_install: Succeeded
NOTE: Running task 4294 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_populate_sysroot)
NOTE: Running task 4295 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_package)
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package: Succeeded
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Started
NOTE: Running task 4296 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.8.0-r0: task do_package: Succeeded
NOTE: Running task 4297 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata)
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata unihash changed to e57ec155b837057f71a0a4b8894cc0db3164f4d5e8d5a98071a7fdf32151a5a3
NOTE: Setscene tasks completed
NOTE: Running task 4298 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx)
NOTE: Running task 4299 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_ipk)
NOTE: Running task 4300 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_deb)
NOTE: Running task 4301 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_rpm: Started
NOTE: recipe json-glib-1.8.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_packagedata unihash changed to 4c86889d966c28e97c73e2c525059b1dd70a25051237c79c8962cde4672996b2
NOTE: Setscene tasks completed
NOTE: Running task 4302 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_create_spdx)
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.4.4-r0: task do_package: Succeeded
NOTE: Running task 4303 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_package: Succeeded
NOTE: Running task 4304 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_packagedata)
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.50.1-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4305 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe json-glib-1.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_packagedata unihash changed to 5a1de169548cbcaf99130a0dbd4723a1c38e4af2d61cb6c40532bc59d384f609
NOTE: recipe libxt-1_1.3.0-r0: task do_package: Succeeded
NOTE: Running task 4306 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_create_spdx)
NOTE: Running task 4307 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_packagedata unihash changed to 100827a825158b495fe47ed5353f1d664c6f157634b05470710ffccd26f83a95
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Started
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_packagedata unihash changed to 4e1e22e50067ea962e7afdd4218475c892423f42da87eadd25dbfdd5d1eef601
NOTE: Setscene tasks completed
NOTE: Running task 4308 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.50.1.bb:do_create_spdx)
NOTE: Running task 4309 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxt_1.3.0.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.50.1-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 4310 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_install)
NOTE: recipe fontconfig-2.15.0-r0: task do_install: Started
NOTE: recipe libxt-1_1.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libsoup-3.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_ipk unihash changed to eb2b06e8a95d78ff9e5bb14ef6037cf0221fb851abb34b2eb4ff597c3acf08b4
NOTE: recipe at-spi2-core-2.50.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gsettings-desktop-schemas-45.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb:do_package_write_rpm unihash changed to 545aeb5e7471a20ec5d80aa821e222e06ac6abac2fb7a08a57930cff72d8d9bf
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_compile: Succeeded
NOTE: Running task 4311 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_compile_ptest_base)
NOTE: Running task 4312 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_compile_ptest_base)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 4313 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4314 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install)
NOTE: Running task 4315 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_install: Started
NOTE: Running task 4316 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot)
NOTE: Running task 4317 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_package)
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_package: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4318 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4319 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cairo-1.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4320 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_configure)
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 4321 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: Running task 4322 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: recipe cairo-1.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4323 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_install: Succeeded
NOTE: Running task 4324 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install: Succeeded
NOTE: Running task 4325 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_install_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4326 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_populate_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4327 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_package)
NOTE: Running task 4328 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4329 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4330 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot)
NOTE: Running task 4331 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4332 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4333 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4334 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_package: Succeeded
NOTE: Running task 4335 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata)
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.6.7-r0: task do_configure: Succeeded
NOTE: Running task 4336 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_compile)
NOTE: recipe enchant2-2.6.7-r0: task do_compile: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_packagedata unihash changed to bd35197724734647870314d5aa8f445167c54a2502f441c3299fc8901e615b8f
NOTE: recipe libnotify-0.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4337 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_create_spdx)
NOTE: Running task 4338 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_configure)
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Started
NOTE: recipe fontconfig-2.15.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4339 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_collect_spdx_deps)
NOTE: Running task 4340 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe cairo-1.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: Running task 4341 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata unihash changed to e583a688b8fd5c756fa31b5d0a74f2e2fee453d277dab942caed1fcca7f84941
NOTE: Setscene tasks completed
NOTE: Running task 4342 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4343 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 4344 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_collect_spdx_deps)
NOTE: Running task 4345 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Started
NOTE: recipe enchant2-2.6.7-r0: task do_compile: Succeeded
NOTE: Running task 4346 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-238-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe enchant2-2.6.7-r0: task do_install: Started
NOTE: recipe libnotify-0.8.3-r0: task do_configure: Succeeded
NOTE: Running task 4347 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_compile)
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Started
NOTE: recipe enchant2-2.6.7-r0: task do_install: Succeeded
NOTE: Running task 4348 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_populate_sysroot)
NOTE: Running task 4349 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_package)
NOTE: recipe enchant2-2.6.7-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.6.7-r0: task do_package: Started
NOTE: recipe enchant2-2.6.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4350 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_compile)
NOTE: recipe cairo-1.18.0-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 4351 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe enchant2-2.6.7-r0: task do_package: Succeeded
NOTE: Running task 4352 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_packagedata)
NOTE: recipe enchant2-2.6.7-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_deb unihash changed to be8f21d3bf89b88fc4c1668b360bf84ba8b3be8f52d7d7d2d5d62701900fa710
NOTE: recipe enchant2-2.6.7-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_packagedata unihash changed to 95c4ea7934fb067e6b00ec4278664ad9b200d61e49ebd2f9cb7c6eddfa313259
NOTE: Setscene tasks completed
NOTE: Running task 4353 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/enchant/enchant2_2.6.7.bb:do_create_spdx)
NOTE: recipe enchant2-2.6.7-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4354 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_compile)
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Started
NOTE: recipe enchant2-2.6.7-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 4355 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: Running task 4356 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package: Succeeded
NOTE: Running task 4357 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_compile: Succeeded
NOTE: Running task 4358 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_package: Succeeded
NOTE: Running task 4359 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4360 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4361 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_install: Succeeded
NOTE: Running task 4362 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot)
NOTE: Running task 4363 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_packagedata unihash changed to 3818a562801e807ddc37efff310c3209699e07b7d93a5c266045edb71733a553
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.3-r0: task do_compile: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata unihash changed to 83d9305ef80d4b46bedb05f8224ff5eccf3bddb1704ddfb406422959d0b32f0a
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4364 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: Running task 4365 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_install)
NOTE: Running task 4366 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: Running task 4367 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_create_spdx)
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 4368 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata unihash changed to 4c240bca458b1a6275e63788ebeda6e3735ec170d96b15864adac250eb8e2247
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4369 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: Running task 4370 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: recipe libnotify-0.8.3-r0: task do_install: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: Running task 4371 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_populate_sysroot)
NOTE: Running task 4372 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_package)
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libnotify-0.8.3-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: Running task 4373 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libnotify-0.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4374 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 4375 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 4376 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_package: Succeeded
NOTE: Running task 4377 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata)
NOTE: recipe cairo-1.18.0-r0: task do_compile: Succeeded
NOTE: Running task 4378 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_install)
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Started
NOTE: recipe cairo-1.18.0-r0: task do_install: Started
NOTE: recipe libnotify-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata unihash changed to 92bc9f5eed1408ca117392329ce0f6db209636eeeff428de0a16a3fdba0b91d1
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cairo-1.18.0-r0: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_package_write_rpm unihash changed to b79befa88ce4dbe3fcbbe871aa4b5d86f31201dd37c111133d29e75fd2a4def6
NOTE: recipe gstreamer1.0-1.22.10-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4379 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_populate_sysroot)
NOTE: recipe libnotify-0.8.3-r0: task do_package: Succeeded
NOTE: Running task 4380 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_package)
NOTE: Running task 4381 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: Running task 4382 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.0-r0: task do_package: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_packagedata unihash changed to fd2dc21d0142947463a9e75881dfc0a95a469ced23bf6ebc6b7cda9c5c2e1fde
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4383 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb:do_create_spdx)
NOTE: recipe cairo-1.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4384 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 4385 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libnotify-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4386 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata unihash changed to d40286f7c4229a96b81fbfa8a6fde78072e9f63c061d4950811507eda6928064
NOTE: recipe harfbuzz-8.3.0-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 4387 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_compile: Succeeded
NOTE: Running task 4388 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_install)
NOTE: recipe vala-0.56.13-r0: task do_install: Started
NOTE: recipe cairo-1.18.0-r0: task do_package: Succeeded
NOTE: Running task 4389 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata)
NOTE: recipe cairo-1.18.0-r0: task do_packagedata: Started
NOTE: recipe cairo-1.18.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_packagedata unihash changed to 549335ee289c74e84cde34697e542558bf472478fb5d647de1b0b47addb849a1
NOTE: Setscene tasks completed
NOTE: Running task 4390 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.0.bb:do_create_spdx)
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.13-r0: task do_install: Succeeded
NOTE: Running task 4391 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_populate_sysroot)
NOTE: Running task 4392 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_package)
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot: Started
NOTE: recipe vala-0.56.13-r0: task do_package: Started
NOTE: recipe cairo-1.18.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4393 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-8.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vala-0.56.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4394 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4395 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4396 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-3.0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-3.0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4397 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_configure)
NOTE: recipe libsecret-0.21.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4398 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_configure)
NOTE: recipe libical-3.0.17-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Started
NOTE: recipe appstream-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4399 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_configure)
NOTE: recipe appstream-1.0.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-8.3.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4400 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_8.3.0.bb:do_compile)
NOTE: recipe harfbuzz-8.3.0-r0: task do_compile: Started
NOTE: recipe vala-0.56.13-r0: task do_package: Succeeded
NOTE: Running task 4401 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata)
NOTE: recipe vala-0.56.13-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.21.4-r0: task do_configure: Succeeded
NOTE: Running task 4402 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libsecret/libsecret_0.21.4.bb:do_compile)
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Started
NOTE: recipe appstream-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 4403 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/appstream/appstream_1.0.0.bb:do_compile)
NOTE: recipe appstream-1.0.0-r0: task do_compile: Started
NOTE: recipe libical-3.0.17-r0: task do_configure: Succeeded
NOTE: Running task 4404 of 4619 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.17.bb:do_compile)
NOTE: recipe libical-3.0.17-r0: task do_compile: Started
NOTE: recipe vala-0.56.13-r0: task do_packagedata: Failed
NOTE: recipe libsecret-0.21.4-r0: task do_compile: Succeeded
NOTE: recipe appstream-1.0.0-r0: task do_compile: Succeeded
NOTE: recipe libical-3.0.17-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_24.0.1-r0: task do_compile: Succeeded
NOTE: recipe harfbuzz-8.3.0-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 4404 tasks of which 4003 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301155445.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301155445.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata
Summary: There were 19 ERROR messages, returning a non-zero exit code.
ERROR: orc-0.4.37-r0 do_packagedata_setscene: QA Issue: Package version for package orc-src went backwards which would break package feeds (from 0:0.4.38-r0 to 0:0.4.37-r0) [version-going-backwards]
ERROR: orc-0.4.37-r0 do_packagedata_setscene: QA Issue: Package version for package orc-dbg went backwards which would break package feeds (from 0:0.4.38-r0 to 0:0.4.37-r0) [version-going-backwards]
ERROR: orc-0.4.37-r0 do_packagedata_setscene: QA Issue: Package version for package orc-examples went backwards which would break package feeds (from 0:0.4.38-r0 to 0:0.4.37-r0) [version-going-backwards]
ERROR: orc-0.4.37-r0 do_packagedata_setscene: QA Issue: Package version for package orc-staticdev went backwards which would break package feeds (from 0:0.4.38-r0 to 0:0.4.37-r0) [version-going-backwards]
ERROR: orc-0.4.37-r0 do_packagedata_setscene: QA Issue: Package version for package orc-dev went backwards which would break package feeds (from 0:0.4.38-r0 to 0:0.4.37-r0) [version-going-backwards]
ERROR: orc-0.4.37-r0 do_packagedata_setscene: QA Issue: Package version for package orc-doc went backwards which would break package feeds (from 0:0.4.38-r0 to 0:0.4.37-r0) [version-going-backwards]
ERROR: orc-0.4.37-r0 do_packagedata_setscene: QA Issue: Package version for package orc-locale went backwards which would break package feeds (from 0:0.4.38-r0 to 0:0.4.37-r0) [version-going-backwards]
ERROR: orc-0.4.37-r0 do_packagedata_setscene: QA Issue: Package version for package orc went backwards which would break package feeds (from 0:0.4.38-r0 to 0:0.4.37-r0) [version-going-backwards]
ERROR: orc-0.4.37-r0 do_packagedata_setscene: QA Issue: Package version for package liborc-0.4 went backwards which would break package feeds (from 0:0.4.38-r0 to 0:0.4.37-r0) [version-going-backwards]
ERROR: orc-0.4.37-r0 do_packagedata_setscene: QA Issue: Package version for package liborc-test-0.4 went backwards which would break package feeds (from 0:0.4.38-r0 to 0:0.4.37-r0) [version-going-backwards]
ERROR: orc-0.4.37-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.14-r0 to 0:0.56.13-r0) [version-going-backwards]
ERROR: vala-0.56.13-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vala/0.56.13/temp/log.do_packagedata.2738781
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.13.bb:do_packagedata) failed with exit code '1'

--===============4563744473146687941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/epiphany/epiphany-locale-ka: PKGSIZE changed from 62073 to 76452 (+23%)

--===============4563744473146687941==--

