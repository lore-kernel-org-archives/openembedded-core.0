Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1262.1795158481985084348
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:08:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=li4HN/fp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=P1sqZryN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1f7c8991a-00eb17ea-a96d-43d8-9de8-f66cc12777b9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795158481;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=3ogMZA+gkrw7s5SE08uKSey9Lp7h5JkyAAtmps8d20o=;
	b=li4HN/fpYcEOn+J0UljSfPq940JwtqqCUmTA1CL6NMWYPPjx437KDUepVQq23T95
	pGtd11nQELunRsvhSKCrl3Y8UnYccv9kOz0bL3EDdcBjsQng2uYE8Drz5BLRI2YO5AI
	x7S1MV0PfdX37wV0mrd8SJmpT33DoJ6zwQMu2fR8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795158481;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=3ogMZA+gkrw7s5SE08uKSey9Lp7h5JkyAAtmps8d20o=;
	b=P1sqZryNFG+wL+jW2JIkI+Uj5H18nlwWf7fjUeAfpc2X0qxMxyZalqd96ZErbGIw
	qvW6//aEMfK5FVr+FIChcZaa6pCW3OGbzR1uMSxYCAc37DhsTtwiLtSScRC4OyElE8P
	+wYararCnyi/FytcM7EwcI384ENpP3r1Sb7GdsW8=
Content-Type: multipart/mixed; boundary="===============3033345445754651784=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 51.3 FAILED
Message-ID: <010101a1f7c8991a-00eb17ea-a96d-43d8-9de8-f66cc12777b9-000000@us-west-2.amazonses.com>
Date: Fri, 20 Nov 2026 07:08:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.20-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250738

--===============3033345445754651784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *51.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-51.2-51.3.patch
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
From aeb09511f5bc2058ef7fa19aa26aff87304ef936 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 20 Nov 2026 06:47:51 +0000
Subject: [PATCH] epiphany: upgrade 51.2 -> 51.3

51.3 - November 19, 2026
========================
---
 .../epiphany/{epiphany_51.2.bb => epiphany_51.3.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_51.2.bb => epiphany_51.3.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_51.2.bb b/meta/recipes-gnome/epiphany/epiphany_51.3.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_51.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_51.3.bb
index 1b79d7a4a5..8b53054568 100644
--- a/meta/recipes-gnome/epiphany/epiphany_51.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_51.3.bb
@@ -32,7 +32,7 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "e45d93483d62beeb26b36b39fe2f8cb5511ffe6ddccc7fedff55b1e3cc0a5c30"
+SRC_URI[archive.sha256sum] = "8b8f4603f051c0cbebba3f394e5410d2c9011f80c9cda156da40d8029e030964"
 
 export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 480d0ac0c0..eb2fc0f943 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From fe7d60b87a1d42f130047701d55bf4e20715e6dd Mon Sep 17 00:00:00 2001
+From 8936b57b489a0781c4d082239c2757a8f712bbf5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index 0d858fa637..bbabb91bf0 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From de382c002231a61cb140cdd3e29d6190c853e54f Mon Sep 17 00:00:00 2001
+From 606e8bb97d686f069e722f603f6c5212607cfc85 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index 767a34b..d4dccf6 100644
+index 7ad753d..601cfe1 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 22f8755e7f..908a2dd0c9 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From 3dd7ad6d9540b722716064740d055bd2eb4dce1f Mon Sep 17 00:00:00 2001
+From b65873ff618634fda8701f04e4d74bf35aa70b8b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.47.1


--===============3033345445754651784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 10996600 to 10997328 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PKGSIZE changed from 60946 to 92979 (+53%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lo: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lo: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-my: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-my: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 32694825 to 32695190 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: FILELIST: directory renamed /usr/src/debug/epiphany/51.2/lib/history -> /usr/src/debug/epiphany/51.3/lib/history, directory renamed /usr/src/debug/epiphany/51.2/lib/autofill -> /usr/src/debug/epiphany/51.3/lib/autofill, directory renamed /usr/src/debug/epiphany/51.2/embed/web-process-extension -> /usr/src/debug/epiphany/51.3/embed/web-process-extension, directory renamed /usr/src/debug/epiphany/51.2/src/preferences -> /usr/src/debug/epiphany/51.3/src/preferences, directory renamed /usr/src/debug/epiphany/51.2/src/profile-migrator -> /usr/src/debug/epiphany/51.3/src/profile-migrator, directory renamed /usr/src/debug/epiphany/51.2/lib/sync/debug -> /usr/src/debug/epiphany/51.3/lib/sync/debug, directory renamed /usr/src/debug/epiphany/51.2/src/webextension -> /usr/src/debug/epiphany/51.3/src/webextension, directory renamed /usr/src/debug/epiphany/51.2/src/webextension/api -> /usr/src/debug/epiphany/51.3/src/webextension/api, directory
  renamed /usr/src/debug/epiphany/51.2/embed -> /usr/src/debug/epiphany/51.3/embed, directory renamed /usr/src/debug/epiphany/51.2/third-party/gvdb -> /usr/src/debug/epiphany/51.3/third-party/gvdb, directory renamed /usr/src/debug/epiphany/51.2/lib/sync -> /usr/src/debug/epiphany/51.3/lib/sync, directory renamed /usr/src/debug/epiphany/51.2/third-party -> /usr/src/debug/epiphany/51.3/third-party, directory renamed /usr/src/debug/epiphany/51.2/src/search-provider -> /usr/src/debug/epiphany/51.3/src/search-provider, directory renamed /usr/src/debug/epiphany/51.2/src/webapp-provider -> /usr/src/debug/epiphany/51.3/src/webapp-provider, directory renamed /usr/src/debug/epiphany/51.2/lib -> /usr/src/debug/epiphany/51.3/lib, directory renamed /usr/src/debug/epiphany/51.2/lib/contrib -> /usr/src/debug/epiphany/51.3/lib/contrib, directory renamed /usr/src/debug/epiphany/51.2/src/bookmarks -> /usr/src/debug/epiphany/51.3/src/bookmarks, directory renamed /usr/src/debug/epiphany/51.2/src -> /usr
 /src/debug/epiphany/51.3/src
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGSIZE changed from 6720271 to 6721380 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany: PV changed from "51.2" to "51.3"
packages/x86-64-v3-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/51/epiphany-51.2.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/51/epiphany-51.3.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/x86-64-v3-poky-linux/epiphany: PKGV changed from 51.2 [default] to 51.3 [default]
packages/x86-64-v3-poky-linux/epiphany: PV changed from "51.2" to "51.3"

--===============3033345445754651784==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-51.2-51.3.patch"

RnJvbSBhZWIwOTUxMWY1YmMyMDU4ZWY3ZmExOWFhMjZhZmY4NzMwNGVmOTM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjAgTm92IDIwMjYgMDY6NDc6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA1MS4yIC0+IDUxLjMKCjUxLjMgLSBOb3ZlbWJlciAxOSwgMjAyNgo9
PT09PT09PT09PT09PT09PT09PT09PT0KLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55XzUxLjIu
YmIgPT4gZXBpcGhhbnlfNTEuMy5iYn0gICAgICAgICAgIHwgMiArLQogLi4uL2ZpbGVzLzAwMDIt
aGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCB8IDIgKy0KIG1l
dGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCAgICAgICAg
ICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5w
YXRjaCAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkve2Vw
aXBoYW55XzUxLjIuYmIgPT4gZXBpcGhhbnlfNTEuMy5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNTEuMi5iYiBiL21ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV81MS4yLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNTEuMy5iYgppbmRl
eCAxYjc5ZDdhNGE1Li44YjUzMDU0NTY4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUv
ZXBpcGhhbnkvZXBpcGhhbnlfNTEuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkvZXBpcGhhbnlfNTEuMy5iYgpAQCAtMzIsNyArMzIsNyBAQCBTUkNfVVJJICs9ICJcCiAgICAg
ICAgICAgIGZpbGU6Ly9taWdyYXRvci5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9kaXN0cmli
dXRvci5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
ImU0NWQ5MzQ4M2Q2MmJlZWIyNmIzNmIzOWZlMmY4Y2I1NTExZmZlNmRkY2NjN2ZlZGZmNTViMWUz
Y2MwYTVjMzAiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI4YjhmNDYwM2YwNTFjMGNi
ZWJiYTNmMzk0ZTU0MTBkMmM5MDExZjgwYzljZGExNTZkYTQwZDgwMjllMDMwOTY0IgogCiBleHBv
cnQgR0lfVFlQRUxJQl9QQVRIID0gIiR7U1RBR0lOR19MSUJESVJ9L2dpcmVwb3NpdG9yeS0xLjAv
IgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1o
ZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRo
ZS11c2Utb2YteWVscC5wYXRjaAppbmRleCA0ODBkMGFjMGMwLi5lYjJmYzBmOTQzIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1
aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15ZWxwLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9t
ZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9m
LXllbHAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGZlN2Q2MGI4N2ExZDQyZjEzMDA0Nzcw
MWQ1NWJmNGUyMDcxNWU2ZGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDg5MzZiNTdi
NDg5YTA3ODFjNGQwODIyMzljMjc1N2E4ZjcxMmJiZjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6
IFdlZCwgMzEgSmFuIDIwMTggMTU6NTA6MzggKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gaGVscC9t
ZXNvbi5idWlsZDogZGlzYWJsZSB0aGUgdXNlIG9mIHllbHAKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCBiL21ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaAppbmRleCAwZDg1OGZhNjM3
Li5iYmFiYjkxYmYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmls
ZXMvZGlzdHJpYnV0b3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2Zp
bGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkZTM4MmMwMDIyMzFh
NjFjYjE0MGNkZDNlMjlkNjE5MGM4NTNlNTRmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA2MDZlOGJiOTdkNjg2ZjA2OWU3MjJmNjAzZjZjNTIxMjYwN2NmYzg1IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91
bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDI2IEZlYiAyMDIxIDEwOjE3OjUyICswMDAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIERvbid0IGVuY29kZSB0aGUgZGlzdHJvIGZyb20gL2V0Yy9vcy1yZWxlYXNl
IGludG8gdGhlCkBAIC0xMSw3ICsxMSw3IEBAIFJQIDIwMjEvMi8yNgogIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWls
ZAotaW5kZXggNzY3YTM0Yi4uZDRkY2NmNiAxMDA2NDQKK2luZGV4IDdhZDc1M2QuLjYwMWNmZTEg
MTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKIEBAIC0xNSw2ICsx
NSw3IEBAIGlmIHIucmV0dXJuY29kZSgpID09IDAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1n
bm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9tZS9l
cGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRjaAppbmRleCAyMmY4NzU1ZTdmLi45MDhhMmRkMGM5
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3Iu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzZGQ3YWQ2ZDk1NDBiNzIyNzE2MDY0NzQwZDA1NWJk
MmViNGRjZTFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiNjU4NzNmZjYxODYzNGZk
YTg3MDFmMDRlNGQ3NGJmMzVhYTcwYjhiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
UmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRl
OiBUaHUsIDI1IEZlYiAyMDIxIDE0OjUyOjMyICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGVwaXBo
YW55OiBGaXggcmVwcm9kdWNpYmlsaXR5IGlzc3VlCi0tIAoyLjQ3LjEKCg==

--===============3033345445754651784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PKGSIZE changed from 60946 to 92979 (+53%)

--===============3033345445754651784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 963 .bb files complete (0 cached, 963 parsed). 2014 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-1e2b456fd65bcf6ba773028074180980c9728c70"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:1e2b456fd65bcf6ba773028074180980c9728c70"
meta-yocto-bsp       
meta-poky            = "master:6ee74fbbe3a36dabb7f8f85ee10691eaf8aa3252"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1129 Local 403 Mirrors 0 Missed 726 Current 841 (35% match, 63% complete)
done.
Removing 17 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 844 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_51.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 886 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 895 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 898 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 950 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 955 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 960 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 977 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 988 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1005 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1013 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1026 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.100.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1035 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1049 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Started
NOTE: recipe epiphany-51.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.100.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1050 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1074 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe epiphany-51.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 1099 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1103 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1128 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1137 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.100.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1146 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1167 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_spdx_setscene)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1170 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.100.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1183 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1200 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_package_setscene)
NOTE: recipe libarchive-3.8.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcxx-23.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsoup-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.100.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe appstream-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsoup-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcxx-23.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe appstream-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.100.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1201 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1205 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1211 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1217 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1221 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1224 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1245 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1247 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1248 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_package_setscene)
NOTE: Running setscene task 1252 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1254 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1258 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1269 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1278 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_package_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1279 of 1970 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe nghttp2-1.71.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcxx-23.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa_setscene: Started
NOTE: recipe p11-kit-0.26.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.24.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe nghttp2-1.71.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1282 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1287 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1288 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1289 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe acl-2.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1291 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_spdx_setscene)
NOTE: recipe p11-kit-0.26.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcxx-23.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gtk4-4.24.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1300 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.100.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1303 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1315 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1316 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1317 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1323 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1325 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1326 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Started
NOTE: recipe compiler-rt-23.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.100.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1327 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1330 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1343 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1344 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: recipe compiler-rt-23.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1347 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxmlb-0.3.30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1369 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1377 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: recipe curl-8.23.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1383 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1384 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.100.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1391 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_package_setscene)
NOTE: recipe python3-3.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1392 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1394 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1397 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe tiff-4.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_package_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1401 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_spdx_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1407 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.100.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.11-r0: task do_package_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 1412 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 1417 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1420 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1424 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1429 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1431 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1437 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1440 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1441 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libstd-rs-1.100.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1443 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe compiler-rt-23.1.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgpg-error-1.61-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1457 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1459 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1463 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1464 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1469 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1470 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1471 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1472 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_packagedata_setscene)
NOTE: recipe compiler-rt-23.1.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1473 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1476 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.15.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.58.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1482 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcxx-23.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1487 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1488 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1491 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1492 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_package_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1500 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1502 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.58.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1504 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.15.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1508 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1510 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1511 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcxx-23.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1512 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1513 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_package_setscene: Started
NOTE: recipe libusb1-1.0.30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1515 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librsvg-2.63.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1519 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1521 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1523 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1526 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-4.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1529 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_recipe_qa_setscene)
NOTE: recipe libusb1-1.0.30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1530 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libxi-1_1.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1535 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.100.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1538 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.63.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1541 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libical-4.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1545 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1549 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1553 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcxx-23.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1554 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.100.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1555 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1559 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1560 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1563 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1576 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1578 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1579 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1581 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.100.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.50-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.16.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1586 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1588 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libstd-rs-1.100.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1593 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1595 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1596 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1597 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-2.78-r0: task do_package_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_package_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1598 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe dbus-1.16.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1600 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1601 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_26.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1602 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1604 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libffi-3.8.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1606 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.50-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1607 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcxx-23.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1612 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1613 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1616 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1618 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1620 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1623 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1625 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1627 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1631 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1638 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1639 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1640 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1649 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe compiler-rt-23.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-23.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1650 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1651 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe eudev-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1656 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1659 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libcxx_git.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1661 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1662 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe compiler-rt-23.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe compiler-rt-23.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1666 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1675 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1678 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1680 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1682 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1684 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-15.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1689 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1696 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package_setscene)
NOTE: recipe libcxx-23.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1698 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-79.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1699 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcxx-23.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1702 of 1970 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1705 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_package_setscene: Started
NOTE: recipe python3-3.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-79.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1707 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1709 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1710 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1711 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1715 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1717 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1719 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1721 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1722 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1725 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1727 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/compiler-rt_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1731 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1733 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1734 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1741 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1742 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1744 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1747 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1748 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1749 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1750 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe compiler-rt-23.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1751 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe compiler-rt-23.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1753 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1754 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1757 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1759 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1760 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1761 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.49-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1762 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1765 of 1970 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1766 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1768 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1769 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1772 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1773 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.59-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1776 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1777 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe freetype-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1780 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1781 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1782 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1783 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.59-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1785 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1786 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1787 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1788 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1789 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1790 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1791 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1793 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1794 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1795 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1796 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_packagedata_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1797 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1798 of 1970 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1801 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1803 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1804 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1805 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1807 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1808 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1809 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1810 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1811 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1813 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1814 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1815 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1816 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1819 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1820 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1821 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1822 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1829 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1831 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_package_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1841 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1843 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1844 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1848 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1849 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1850 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_spdx_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1851 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 1852 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1853 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1855 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_package_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1856 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1865 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1869 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1871 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1873 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1875 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1877 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1880 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1883 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1890 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1891 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1892 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1895 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1896 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1899 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1901 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1905 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1906 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1907 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1909 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1911 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1913 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1914 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1915 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2026.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_package_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1916 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1917 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1918 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2026.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1921 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 1922 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1923 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1924 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 1925 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1926 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1927 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_package_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 521 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Started
NOTE: Running task 624 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_fetch)
NOTE: recipe libpcre2-10.49-r0: task do_fetch: Started
NOTE: Running task 680 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_fetch)
NOTE: recipe libpcre2-10.49-r0: task do_fetch: Succeeded
NOTE: Running task 697 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_unpack)
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Started
NOTE: Running task 760 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_fetch)
NOTE: Running task 762 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_fetch)
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 789 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_fetch: Started
NOTE: Running task 816 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_write_config)
NOTE: recipe libpcre2-10.49-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_fetch: Succeeded
NOTE: Running task 864 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_write_config: Started
NOTE: recipe util-linux-2.42.4-r0: task do_fetch: Succeeded
NOTE: Running task 965 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_fetch)
NOTE: Running task 967 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_fetch)
NOTE: Running task 970 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_unpack)
NOTE: Running task 971 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_fetch)
NOTE: Running task 977 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_fetch)
NOTE: Running task 986 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_unpack: Started
NOTE: Running task 998 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_write_config)
NOTE: Running task 1001 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_write_config)
NOTE: Running task 1024 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_write_config)
NOTE: Running task 1035 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_write_config: Succeeded
NOTE: Running task 1037 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1038 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_patch)
NOTE: recipe xorgproto-2026.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Started
NOTE: recipe libpng-1.6.59-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2026.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_fetch: Succeeded
NOTE: recipe libpng-1.6.59-r0: task do_fetch: Succeeded
NOTE: Running task 1039 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Started
NOTE: Running task 1040 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_unpack)
NOTE: recipe libxml2-2.15.4-r0: task do_fetch: Succeeded
NOTE: Running task 1041 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2026.1-r0: task do_write_config: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_write_config: Started
NOTE: Running task 1042 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_unpack)
NOTE: Running task 1043 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1046 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1047 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_write_config: Succeeded
NOTE: Running task 1048 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_unpack)
NOTE: recipe xorgproto-2026.1-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_write_config: Succeeded
NOTE: Running task 1050 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: Running task 1052 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_fetch)
NOTE: recipe xorgproto-2026.1-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.59-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Started
NOTE: Running task 1072 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_fetch)
NOTE: recipe libxml2-2.15.4-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.49-r0: task do_unpack: Succeeded
NOTE: Running task 1073 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_patch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: Running task 1075 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: Running task 1089 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_unpack)
NOTE: Running task 1090 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: recipe xtrans-1_1.6.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2026.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1091 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_patch)
NOTE: recipe xtrans-1_1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.14-r0: task do_fetch: Started
NOTE: Running task 1092 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: Running task 1093 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_unpack)
NOTE: recipe libx11-1_1.8.14-r0: task do_fetch: Succeeded
NOTE: Running task 1098 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: recipe libpng-1.6.59-r0: task do_unpack: Succeeded
NOTE: Running task 1099 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_patch)
NOTE: recipe libpcre2-10.49-r0: task do_patch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2026.1-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: Running task 1100 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_patch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1101 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_patch)
NOTE: Running task 1102 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe libpng-1.6.59-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1103 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe libpcre2-10.49-r0: task do_patch: Succeeded
NOTE: Running task 1104 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_patch)
NOTE: Running task 1105 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Started
NOTE: Running task 1106 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe xorgproto-2026.1-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1107 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1108 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_deploy_source_date_epoch unihash changed to fcd1cf9da9ce96721df22bc630ada391e5aa81088b99ebd628ac8cc32cabbced
NOTE: recipe libpcre2-10.49-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_patch: Succeeded
NOTE: recipe libpng-1.6.59-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2026.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_deploy_source_date_epoch unihash changed to f4de324790f1c294ea42977ac6a0d95cf0a260ca15a87deec764985ded0a2121
NOTE: recipe xorgproto-2026.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_deploy_source_date_epoch unihash changed to 565d1d05e38231ea4df956ed4c897b2bbc560ae905b102a6be5c5fe6f21f6b12
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1633 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1636 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1638 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1109 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1110 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_patch)
NOTE: Running task 1111 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_patch)
NOTE: Running task 1112 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_patch)
NOTE: Running task 1113 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_patch)
NOTE: Running task 1114 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1115 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_deploy_source_date_epoch)
NOTE: Running task 1117 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_unpack)
NOTE: Running task 1124 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_fetch)
NOTE: Running task 1136 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_unpack)
NOTE: Running task 1153 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_fetch)
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1173 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1174 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.59-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_unpack: Started
NOTE: recipe icu-79.1-r0: task do_fetch: Started
NOTE: recipe util-linux-2.42.4-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_patch: Started
NOTE: recipe freetype-2.15.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1931 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe icu-79.1-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1175 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe freetype-2.15.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1176 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 1932 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_package_setscene)
NOTE: Running task 1177 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_patch)
NOTE: recipe libunistring-1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1178 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_write_config)
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Succeeded
NOTE: Running task 1179 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.5-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_write_config: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.14-r0: task do_unpack: Succeeded
NOTE: Running task 1181 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_fetch)
NOTE: Running task 1182 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_patch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_deploy_source_date_epoch unihash changed to 587dc29687a244bc150d1b27d9f1c0c93e8e24d30e22944ef1bb848737c1286a
NOTE: recipe libxml2-2.15.4-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_write_config: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.59-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.14-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_deploy_source_date_epoch unihash changed to 5e4e61096da6c544ceede89a5ade4b796ff809f25e5af084048c21a338a0e57b
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch unihash changed to e43cbfa8af92ccb38bb4155ba3aa4bd370d98ed9750a6fa21ccd6d6deef9b13b
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_deploy_source_date_epoch unihash changed to f3c7de4d8044863ee717838dd0802d0ada8bd4d3a939326cfcea8ebaae4f4be6
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_deploy_source_date_epoch unihash changed to d51643fd991ee9bebf117694dd79e826eb97c8ae016dc20de4f82bb574da60a4
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_deploy_source_date_epoch unihash changed to f4efa8852ce604b2c5dbbd6d99cd41d0e25ca28123e8260fe03e7abdacc8569f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch unihash changed to 6ec9c40bd83ef289acdffc14c9b767bc2e04d2d776345148dffa5462bde5f773
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_deploy_source_date_epoch unihash changed to 17fe59a224be1aa45f2d4760d4cb6d51865f28d19ae3b39ddac422c72be5d13d
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1641 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1934 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1935 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: Running task 1183 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1184 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1185 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1186 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_unpack)
NOTE: Running task 1187 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1188 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1209 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_unpack)
NOTE: Running task 1210 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1212 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_fetch)
NOTE: Running task 1213 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_unpack)
NOTE: Running task 1215 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_fetch)
NOTE: Running task 1217 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_fetch)
NOTE: recipe libunistring-1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1253 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_fetch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-79.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.42.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.15.0-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_unpack: Started
NOTE: recipe wayland-1.26.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_fetch: Started
NOTE: recipe libunistring-1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1936 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_fetch: Started
NOTE: recipe wayland-1.26.0-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.13-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_fetch: Succeeded
NOTE: Running task 1264 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.13-r0: task do_fetch: Succeeded
NOTE: Running task 1266 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_fetch)
NOTE: Running task 1267 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1268 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_patch)
NOTE: Running setscene task 1938 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1940 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.7-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_unpack: Started
NOTE: Running setscene task 1941 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.18.3-r0: task do_fetch: Succeeded
NOTE: Running task 1269 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_unpack)
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1287 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_write_config)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_deploy_source_date_epoch unihash changed to 6e1503f7ff198e2dd58db040a3f9cb7a08743ba084cb6c32a4834b606121433b
NOTE: recipe freetype-2.15.0-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_unpack: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.15.0-r0: task do_write_config: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.15.0-r0: task do_write_config: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_deploy_source_date_epoch unihash changed to 6913a53c85a444c1b7ad9b16ba780af3dda55442aeea56b91f2428f825298576
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_deploy_source_date_epoch unihash changed to 2746c0afb29d46ebde941783a1ab4e494f9752c73ab03af8ffc3053d1399c51f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch unihash changed to ffd1e4ea2329e286e1a709067639fa1f003641715f30d63058a6486f0acee509
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_deploy_source_date_epoch unihash changed to f3c7de4d8044863ee717838dd0802d0ada8bd4d3a939326cfcea8ebaae4f4be6
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_deploy_source_date_epoch unihash changed to 16a0af7fb467af7c4a13a08c066a214b679a585d1e7be22919316cd67a2b5ac3
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1669 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1670 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1946 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 1293 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_patch)
NOTE: Running task 1294 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_patch)
NOTE: Running task 1295 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_unpack)
NOTE: Running task 1296 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_patch)
NOTE: Running task 1297 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_unpack)
NOTE: Running task 1308 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_unpack)
NOTE: Running task 1309 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_unpack)
NOTE: Running task 1313 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_fetch)
NOTE: Running task 1322 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_fetch)
NOTE: Running task 1340 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_write_config)
NOTE: Running task 1341 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1342 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_generate_toolchain_file)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.15.0-r0: task do_patch: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_unpack: Started
NOTE: recipe wayland-1.26.0-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_unpack: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_patch: Started
NOTE: recipe cairo-1.18.6-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1343 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe wayland-1.26.0-r0: task do_write_config: Started
NOTE: recipe cairo-1.18.6-r0: task do_fetch: Succeeded
NOTE: Running task 1346 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.13-r0: task do_unpack: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 1354 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_patch)
NOTE: Running task 1362 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_patch)
NOTE: Running task 1366 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1948 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe freetype-2.15.0-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_write_config: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1949 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1950 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1951 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1953 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_patch: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_unpack: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_write_config: Started
NOTE: Running task 1367 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxext-1_1.3.7-r0: task do_patch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_write_config: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Succeeded
NOTE: Running task 1368 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1369 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_patch)
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_write_config: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_deploy_source_date_epoch unihash changed to e0d7b8dcd855d5a4530a800c21399628898067d730212e118dfb6d741ed5338b
NOTE: recipe wayland-1.26.0-r0: task do_patch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_patch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1907 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1910 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1915 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1916 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1383 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1384 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1386 of 4601 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_fetch)
NOTE: Running task 1389 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_fetch)
NOTE: Running task 1390 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_deploy_source_date_epoch unihash changed to 00078dbbf915d5f6b7b660b44e701adf693c9a8cf95fb948f5ee2619a5e12362
NOTE: recipe fontconfig-2.18.3-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-79.1-r0: task do_unpack: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.26.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_fetch: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1913 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1917 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 1396 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_patch)
NOTE: Running task 1397 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_unpack)
NOTE: Running task 1398 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1402 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1403 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1404 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_write_config)
NOTE: Running task 1406 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_fetch)
NOTE: Running task 1408 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_fetch)
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1970 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_deploy_source_date_epoch unihash changed to 7b47977fc9859dd777b576001edf5af3d4f3b12924f5b3d3dc5af8fd9205bbdd
NOTE: recipe libxrender-1_0.9.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe icu-79.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.6-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_write_config: Started
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_write_config: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_deploy_source_date_epoch unihash changed to 81ee11665ae33d60fa61e9afe0b1b9b5a814841923ffc1da69c5b9a488d4183d
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_deploy_source_date_epoch unihash changed to 9fae7cd7723e7ec01431f2449c06c0c80fb01ddde2e9b3c5a75b1b49331bdea7
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_deploy_source_date_epoch unihash changed to bcdc2eb0e1431fb84ded6d554d651653f6c4ec64d475f4c0f066916a6a91f346
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_deploy_source_date_epoch unihash changed to 8a6822c726dcbf940ae20b2902599ca7a9049e57aae549e5a3dcce48e14744a8
NOTE: recipe icu-79.1-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1495 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1518 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1586 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1587 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1588 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1599 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1600 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1601 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1604 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1609 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_patch)
NOTE: Running task 1614 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1617 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1628 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1635 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_fetch)
NOTE: Running task 1637 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_create_recipe_spdx)
NOTE: recipe libpcre2-10.49-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpng-1.6.59-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2026.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.15.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe icu-79.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe icu-79.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2026.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1645 of 4601 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_unpack)
NOTE: recipe dbus-1.16.4-r0: task do_fetch: Started
NOTE: recipe dbus-1.16.4-r0: task do_fetch: Succeeded
NOTE: Running task 1646 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_unpack)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1647 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_deploy_source_date_epoch)
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_unpack: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-79.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2026.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1648 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 1649 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_configure)
NOTE: recipe libpthread-stubs-0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_deploy_source_date_epoch unihash changed to 016152a54d24197a5b5f9851eee728311b6c0af5753fb8e9fa1924958e93e7f7
NOTE: recipe libpng-1.6.59-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe icu-79.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_deploy_source_date_epoch unihash changed to 95f3cf052444f2b8ca974b00544c55eda9969abfbd11146a98a2a7277c8fa433
NOTE: recipe xorgproto-2026.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1650 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_configure)
NOTE: recipe xcb-proto-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1651 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_configure)
NOTE: Running task 1652 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_configure)
NOTE: Running task 1653 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_configure)
NOTE: Running task 1654 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_configure)
NOTE: Running task 1655 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_configure)
NOTE: Running task 1656 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_configure)
NOTE: Running task 1657 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_make_icudata)
NOTE: Running task 1658 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_configure)
NOTE: Running task 1659 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: Running task 1684 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_fetch)
NOTE: Running task 1685 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_unpack)
NOTE: recipe libpcre2-10.49-r0: task do_configure: Started
NOTE: recipe libpng-1.6.59-r0: task do_configure: Started
NOTE: recipe xorgproto-2026.1-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Started
NOTE: recipe libxml2-2.15.4-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_configure: Started
NOTE: recipe icu-79.1-r0: task do_make_icudata: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe vala-0.56.19-r0: task do_fetch: Started
NOTE: recipe vala-0.56.19-r0: task do_fetch: Succeeded
NOTE: Running task 1689 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_unpack)
NOTE: recipe update-rc.d-0.8+git-r0: task do_unpack: Succeeded
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_unpack: Succeeded
NOTE: Running task 1690 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_patch)
NOTE: recipe cairo-1.18.6-r0: task do_unpack: Succeeded
NOTE: Running task 1691 of 4601 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_patch)
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1692 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_patch)
NOTE: recipe icu-79.1-r0: task do_make_icudata: Succeeded
NOTE: Running task 1693 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1694 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_configure)
NOTE: Running task 1696 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_fetch)
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_patch: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: recipe cairo-1.18.6-r0: task do_patch: Started
NOTE: Running task 1697 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_patch)
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_fetch: Started
NOTE: Running task 1703 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe icu-79.1-r0: task do_configure: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_patch: Succeeded
NOTE: Running task 1706 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1707 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cairo-1.18.6-r0: task do_patch: Succeeded
NOTE: Running task 1708 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1714 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_unpack)
NOTE: Running task 1715 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_fetch: Succeeded
NOTE: Running task 1717 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_fetch)
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1719 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe dbus-1.16.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_deploy_source_date_epoch unihash changed to 92d0f3dec8169e72acdadcfc6f4c3a1cdd77b61e1f61def3bc7702194458695d
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-15.0.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.16.4-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1720 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_patch)
NOTE: Running task 1722 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_fetch)
NOTE: Running task 1723 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1725 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_fetch)
NOTE: Running task 1726 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_write_config)
NOTE: recipe fribidi-1.0.17-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.16.4-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.17-r0: task do_fetch: Succeeded
NOTE: recipe cairo-1.18.6-r0: task do_write_config: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_fetch: Succeeded
NOTE: Running task 1728 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_fetch)
NOTE: Running task 1738 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_fetch)
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1739 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_configure)
NOTE: recipe cairo-1.18.6-r0: task do_write_config: Succeeded
NOTE: Running task 1741 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_fetch)
NOTE: recipe dbus-1.16.4-r0: task do_patch: Succeeded
NOTE: recipe pango-1.58.2-r0: task do_fetch: Started
NOTE: Running task 1743 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_unpack)
NOTE: recipe pango-1.58.2-r0: task do_fetch: Succeeded
NOTE: Running task 1753 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_unpack)
NOTE: recipe librsvg-2.63.4-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Started
NOTE: recipe cairo-1.18.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_deploy_source_date_epoch unihash changed to c39ee3e5981977db70f1c87f2510b2471ab7ff3b835ef88649d27a42c9210644
NOTE: recipe vala-0.56.19-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: recipe librsvg-2.63.4-r0: task do_fetch: Succeeded
NOTE: Running task 1755 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_fetch)
NOTE: Running task 1764 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: Setscene tasks completed
NOTE: Running task 1765 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.5-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1766 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe update-rc.d-0.8+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1767 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_configure)
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_unpack: Succeeded
NOTE: Running task 1768 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_unpack)
NOTE: Running task 1769 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_patch)
NOTE: recipe update-rc.d-0.8+git-r0: task do_configure: Succeeded
NOTE: Running task 1770 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_compile)
NOTE: recipe initscripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2026.1-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch unihash changed to acee399443733717d25be19f3257522d2c4e6d91e886509ba5019f077d94243e
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Started
NOTE: recipe vala-0.56.19-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 1771 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_compile)
NOTE: recipe update-rc.d-0.8+git-r0: task do_compile: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_compile: Succeeded
NOTE: Running task 1772 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: Running task 1773 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_install)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1774 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_patch)
NOTE: recipe vala-0.56.19-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_configure: Started
NOTE: Running task 1775 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_unpack)
NOTE: recipe xorgproto-2026.1-r0: task do_compile: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_install: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2026.1-r0: task do_compile: Succeeded
NOTE: Running task 1776 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe harfbuzz-15.0.0-r0: task do_unpack: Started
NOTE: Running task 1777 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_install)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1778 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_unpack)
NOTE: recipe update-rc.d-0.8+git-r0: task do_install: Succeeded
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_unpack: Succeeded
NOTE: Running task 1779 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_compile: Started
NOTE: Running task 1782 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_compile: Succeeded
NOTE: recipe xorgproto-2026.1-r0: task do_install: Started
NOTE: Running task 1783 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe fribidi-1.0.17-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_patch: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_unpack: Succeeded
NOTE: Running task 1784 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_patch)
NOTE: recipe initscripts-1.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_patch: Succeeded
NOTE: Running task 1785 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_unpack)
NOTE: recipe fribidi-1.0.17-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1786 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_patch)
NOTE: Running task 1787 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_compile)
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Started
NOTE: recipe pango-1.58.2-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.17-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_compile: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_patch: Succeeded
NOTE: Running task 1819 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_unpack)
NOTE: recipe fribidi-1.0.17-r0: task do_patch: Succeeded
NOTE: Running task 1821 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_unpack)
NOTE: recipe pango-1.58.2-r0: task do_unpack: Succeeded
NOTE: Running task 1822 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_patch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Started
NOTE: recipe librsvg-2.63.4-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 1823 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_patch)
NOTE: recipe pango-1.58.2-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Started
NOTE: recipe pango-1.58.2-r0: task do_patch: Succeeded
NOTE: Running task 1824 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_patch: Succeeded
NOTE: Running task 1826 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2026.1-r0: task do_install: Succeeded
NOTE: Running task 1827 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_populate_sysroot)
NOTE: recipe xorgproto-2026.1-r0: task do_populate_sysroot: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch unihash changed to fbe77e97e9d9803c38b2da2aebdc7bb4d9bd0edbffbd24bf7df4826389fa70fd
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch unihash changed to bbad4b7afdf93c85a683ca1d07173a68a5358c1827113a35bb198d26f864b1be
NOTE: recipe initscripts-1.0-r0: task do_install: Succeeded
NOTE: recipe harfbuzz-15.0.0-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1828 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_compile)
NOTE: Running task 1829 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_compile)
NOTE: recipe xorgproto-2026.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1830 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_package)
NOTE: Running task 1831 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_patch)
NOTE: Running task 1832 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1833 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1834 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2026.1-r0: task do_package: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 1835 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_install)
NOTE: recipe harfbuzz-15.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1841 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Started
NOTE: Running task 1843 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1844 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot unihash changed to 98c5af0e2b75469d1ab72e4809add296fd30a299eeea66dac4e392da5b5e9f7c
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1846 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_compile)
NOTE: Running task 1847 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1852 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1853 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_configure: Succeeded
NOTE: Running task 1854 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_compile)
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: Running task 1868 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1869 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Started
NOTE: recipe dbus-1.16.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_compile: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1870 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_install)
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Started
NOTE: recipe dbus-1.16.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_deploy_source_date_epoch unihash changed to 7453294ca43160f1d80f7085e732d7022a3969c32842b71c8548a01f69d27048
NOTE: recipe libpthread-stubs-0.5-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1871 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_write_config)
NOTE: Running task 1872 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe dbus-1.16.4-r0: task do_write_config: Started
NOTE: Running task 1873 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_package)
NOTE: recipe dbus-1.16.4-r0: task do_write_config: Succeeded
NOTE: Running task 1874 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 1875 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2026.1-r0: task do_package: Succeeded
NOTE: Running task 1876 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_package)
NOTE: Running task 1877 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_packagedata)
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Started
NOTE: recipe xorgproto-2026.1-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f0aa88e3c9fe4568c522cd7c8c986e1f301d8f6a83227a8313f97a5121401199
NOTE: Setscene tasks completed
NOTE: Running task 1881 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_fetch)
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1882 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_install)
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2026.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1884 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_fetch)
NOTE: Running task 1890 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_packagedata unihash changed to d3f468b15bc4e548bf6f53a7aed0fa06c50961255b30429afdfc89d151915802
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_configure: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 1891 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_compile)
NOTE: Running task 1893 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_unpack)
NOTE: Running task 1899 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1904 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1905 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_compile)
NOTE: recipe libunistring-1.5-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running task 1907 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_fetch: Succeeded
NOTE: Running task 1908 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_install)
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Started
NOTE: Running task 1916 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_unpack)
NOTE: recipe libdrm-2.4.134-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.134-r0: task do_fetch: Succeeded
NOTE: Running task 1920 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_fetch)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.5-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Started
NOTE: Running task 1921 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 1922 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.5-r0: task do_patch: Started
NOTE: recipe icu-79.1-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 1923 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_install)
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1924 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_configure_ptest_base)
NOTE: recipe libunistring-1.5-r0: task do_patch: Succeeded
NOTE: Running task 1927 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_fetch)
NOTE: recipe icu-79.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_install: Succeeded
NOTE: Running task 1928 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot)
NOTE: recipe icu-79.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe kmod-34.3-r0: task do_fetch: Started
NOTE: Running task 1929 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_compile)
NOTE: recipe vala-0.56.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-34.3-r0: task do_fetch: Succeeded
NOTE: Running task 1930 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_deploy_source_date_epoch unihash changed to 2da1986496c418da83afb44cb901fdb043ef5d0d3d14ca32f5bfa4853f00c92e
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe icu-79.1-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_package: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 1931 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata)
NOTE: Running task 1937 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_fetch: Succeeded
NOTE: Running task 1938 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_fetch)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_unpack: Succeeded
NOTE: Running task 1939 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_patch)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: Running task 1940 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1941 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.5-r0: task do_package: Succeeded
NOTE: Running task 1942 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata)
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_install: Succeeded
NOTE: Running task 1943 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1944 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1945 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1946 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: Running task 1947 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Started
NOTE: recipe libice-1_1.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: Running task 1948 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_configure)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata unihash changed to 91fcbb07acfc5f7e70deea20f376dba9c3234da413529c524824413d41458e52
NOTE: recipe libice-1_1.1.2-r0: task do_configure: Started
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch unihash changed to e46b41b5cf58d21d500910c589b9e5b60e655990a1b20c465aebbe8bdf0e3472
NOTE: recipe libpng-1.6.59-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1949 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_configure_ptest_base)
NOTE: Running task 1950 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1951 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_write_config)
NOTE: Running task 1952 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_deploy_source_date_epoch)
NOTE: Running task 1953 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_write_config)
NOTE: recipe libpng-1.6.59-r0: task do_configure_ptest_base: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fribidi-1.0.17-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_write_config: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_write_config: Started
NOTE: recipe libpng-1.6.59-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1954 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_compile)
NOTE: recipe harfbuzz-15.0.0-r0: task do_write_config: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_write_config: Succeeded
NOTE: Running task 1956 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_fetch)
NOTE: Running task 1957 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_write_config)
NOTE: recipe librsvg-2.63.4-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1958 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_patch)
NOTE: recipe libpng-1.6.59-r0: task do_compile: Started
NOTE: recipe eudev-3.3.0-r0: task do_fetch: Started
NOTE: recipe fribidi-1.0.17-r0: task do_write_config: Started
NOTE: recipe fribidi-1.0.17-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-15.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_deploy_source_date_epoch unihash changed to 4e9b330ac2c9fc55f7fb8f5475dcc5b325180ae381105a86b0faf6dd77591cae
NOTE: recipe fribidi-1.0.17-r0: task do_write_config: Succeeded
NOTE: recipe eudev-3.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_configure: Succeeded
NOTE: recipe librsvg-2.63.4-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_deploy_source_date_epoch unihash changed to 087d28a144f6802e0c64c6772c8f5d5339dd4cc94c70e105f9cf8a8b9a2e83a9
NOTE: Setscene tasks completed
NOTE: Running task 1959 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_configure_ptest_base)
NOTE: Running task 1960 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_install)
NOTE: Running task 1961 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1962 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_unpack)
NOTE: Running task 1963 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.12-r0: task do_package: Succeeded
NOTE: Running task 1965 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_write_config)
NOTE: recipe librsvg-2.63.4-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1967 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata)
NOTE: Running task 1969 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_recipe_spdx)
NOTE: recipe libxml2-2.15.4-r0: task do_configure_ptest_base: Started
NOTE: recipe fribidi-1.0.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_write_config: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_install: Started
NOTE: recipe libxml2-2.15.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1970 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_compile)
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_write_config: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_package: Succeeded
NOTE: Running task 1973 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_unpack)
NOTE: Running task 1974 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata)
NOTE: recipe libxml2-2.15.4-r0: task do_compile: Started
NOTE: recipe libpciaccess-0.19-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.61-r0: task do_unpack: Succeeded
NOTE: Running task 1975 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_patch)
NOTE: recipe libxft-1_2.3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata: Started
NOTE: Running task 1977 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_deploy_source_date_epoch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_deploy_source_date_epoch unihash changed to 0fc2e74ee766140db033c48d87eba5221ebb00de30a60333c6d0df18b48c9300
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Started
NOTE: recipe pango-1.58.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata unihash changed to 854a52519d8de60c3d103f1a319c8c280bf01b46f7153e80750f3b44405070bb
NOTE: recipe fribidi-1.0.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe pango-1.58.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata unihash changed to 756975536be077b91e6741e1d4efb3ed62ecc50a6b39949750911ba5915524b1
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_deploy_source_date_epoch unihash changed to 8f5cba876609aaedf9892467efa8db020bfaa1e42f544ea4cd8806862e1eb185
NOTE: Setscene tasks completed
NOTE: Running task 1978 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_populate_sysroot)
NOTE: Running task 1979 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_install)
NOTE: Running task 1980 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_configure)
NOTE: Running task 1981 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_patch)
NOTE: Running task 1982 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_write_config)
NOTE: Running task 1983 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_recipe_spdx)
NOTE: Running task 1984 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_recipe_spdx)
NOTE: Running task 1985 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_recipe_spdx)
NOTE: Running task 1994 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_fetch)
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe fribidi-1.0.17-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.19-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe pango-1.58.2-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx: Started
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.6-r0: task do_fetch: Succeeded
NOTE: Running task 2042 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: recipe pango-1.58.2-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_patch: Succeeded
NOTE: Running task 2055 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: Running task 2064 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_deploy_source_date_epoch)
NOTE: recipe mesa-2_26.2.4-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_fetch: Succeeded
NOTE: Running task 2065 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_write_config)
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2068 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2069 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_unpack)
NOTE: Running task 2070 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_recipe_spdx)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_write_config: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_unpack: Started
NOTE: Running task 2071 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_write_config: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_configure: Succeeded
NOTE: Running task 2076 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2077 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_configure_ptest_base)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_unpack: Succeeded
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2078 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_deploy_source_date_epoch unihash changed to aa65d7b20b3bda040f824c2d66179591a1e4c6b26dd5f2b5e62860aff57961f5
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.49-r0: task do_configure_ptest_base: Started
NOTE: recipe libdrm-2.4.134-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2079 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_compile)
NOTE: Running task 2080 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_patch)
NOTE: Running task 2082 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_generate_toolchain_file)
NOTE: Running task 2083 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2084 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_recipe_spdx)
NOTE: Running task 2090 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_unpack)
NOTE: Running task 2092 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_unpack)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_deploy_source_date_epoch unihash changed to f575383a8ed851628cf951af1a5dd16e89c8702a99e0fc811c61a1618a3b4881
NOTE: recipe libpcre2-10.49-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe kmod-34.3-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Succeeded
NOTE: recipe kmod-34.3-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2093 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot)
NOTE: Running task 2094 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_patch)
NOTE: Running task 2095 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_patch)
NOTE: Running task 2102 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_fetch)
NOTE: Running task 2103 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_unpack)
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2104 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_unpack)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Started
NOTE: recipe kmod-34.3-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2105 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: Setscene tasks completed
NOTE: Running task 2106 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_configure)
NOTE: recipe xrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_unpack: Succeeded
NOTE: Running task 2108 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_patch)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 2110 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_unpack)
NOTE: recipe kmod-34.3-r0: task do_patch: Succeeded
NOTE: Running task 2111 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_patch)
NOTE: Running task 2113 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_create_recipe_spdx)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: Running task 2120 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_fetch)
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 2121 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: recipe eudev-3.3.0-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_patch: Started
NOTE: recipe libical-4.0.7-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_create_recipe_spdx: Started
NOTE: recipe libical-4.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 2122 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: Running task 2129 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: Running task 2162 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_fetch)
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe eudev-3.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 2166 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2026.1.bb:do_create_spdx)
NOTE: recipe libogg-1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_26.2.4-r0: task do_unpack: Started
NOTE: Running task 2167 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_patch)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_fetch: Started
NOTE: Running task 2168 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_patch)
NOTE: Running task 2169 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.14-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 2170 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2173 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb:do_write_config)
NOTE: recipe xorgproto-2026.1-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.6-r0: task do_patch: Started
NOTE: recipe eudev-3.3.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-protocols-1.50-r0: task do_write_config: Started
NOTE: recipe libgpg-error-1.61-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-protocols-1.50-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_patch: Succeeded
NOTE: Running task 2175 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb:do_configure)
NOTE: recipe eudev-3.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2176 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_deploy_source_date_epoch)
NOTE: Running task 2177 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_write_config)
NOTE: recipe wayland-protocols-1.50-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.19-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_write_config: Started
NOTE: recipe libgpg-error-1.61-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_deploy_source_date_epoch unihash changed to 47cf01e980306c6ad2562b2b1287a4b10c2b38f344779cee3436a75f2b921244
NOTE: recipe libgpg-error-1.61-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2026.1-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2178 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_compile)
NOTE: Running task 2179 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_configure)
NOTE: Running task 2180 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2184 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_fetch)
NOTE: Running task 2185 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_unpack)
NOTE: recipe libpciaccess-0.19-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_deploy_source_date_epoch unihash changed to c01e95b3e296025b072e4a8d043eea08110e76f10641cd2d4c8eb5fa0753ef42
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.3-r0: task do_fetch: Started
NOTE: recipe libical-4.0.7-r0: task do_unpack: Started
NOTE: recipe readline-8.3-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_compile: Succeeded
NOTE: recipe fribidi-1.0.17-r0: task do_configure: Succeeded
NOTE: recipe libical-4.0.7-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2186 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_compile)
NOTE: Running task 2187 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_install)
NOTE: Running task 2188 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_unpack)
NOTE: Running task 2189 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_patch)
NOTE: Running task 2190 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_create_recipe_spdx)
NOTE: recipe fribidi-1.0.17-r0: task do_compile: Started
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Started
NOTE: recipe libical-4.0.7-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_install: Started
NOTE: recipe wayland-protocols-1.50-r0: task do_configure: Succeeded
NOTE: recipe libical-4.0.7-r0: task do_patch: Succeeded
NOTE: Running task 2192 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_recipe_qa)
NOTE: Running task 2193 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb:do_compile)
NOTE: recipe libpciaccess-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2194 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_configure)
NOTE: recipe bluez5-5.88-r0: task do_recipe_qa: Started
NOTE: recipe wayland-protocols-1.50-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2195 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_fetch)
NOTE: recipe libpciaccess-0.19-r0: task do_configure: Started
NOTE: recipe libpng-1.6.59-r0: task do_compile: Succeeded
NOTE: recipe wayland-protocols-1.50-r0: task do_compile: Succeeded
NOTE: Running task 2196 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_compile_ptest_base)
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Succeeded
NOTE: Running task 2197 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb:do_install)
NOTE: Running task 2198 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_patch)
NOTE: recipe libusb1-1.0.30-r0: task do_fetch: Started
NOTE: recipe bluez5-5.88-r0: task do_recipe_qa: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_fetch: Succeeded
NOTE: Running task 2199 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_fetch)
NOTE: Running task 2200 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_install: Succeeded
NOTE: recipe libpng-1.6.59-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-protocols-1.50-r0: task do_install: Started
NOTE: Running task 2201 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_populate_sysroot)
NOTE: recipe libpng-1.6.59-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe bluez5-5.88-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Succeeded
NOTE: Running task 2202 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_install)
NOTE: Running task 2204 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_write_config)
NOTE: recipe bluez5-5.88-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2205 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.63.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.59-r0: task do_install: Started
NOTE: recipe librsvg-2.63.4-r0: task do_write_config: Started
NOTE: recipe librsvg-2.63.4-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.63.4-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2213 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_deploy_source_date_epoch)
NOTE: recipe librsvg-2.63.4-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.63.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2214 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_deploy_source_date_epoch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_deploy_source_date_epoch unihash changed to 7f6b442d04f7fdafcb2b8fed92f8d68cedc491ed749bfaa1dd063f2eaf2e451d
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.134-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2215 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_deploy_source_date_epoch unihash changed to cd7562eb7bc9fdd07d74e606dd8543de4c7af74224f34c494861e2653b12bb0e
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.59-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_deploy_source_date_epoch unihash changed to 053355a84d28b73064a7fb92f82aa13db28ee3a6d0d44ed349b9c24923a63797
NOTE: recipe wayland-protocols-1.50-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2216 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_install_ptest_base)
NOTE: Running task 2218 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_write_config)
NOTE: Running task 2220 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2228 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_generate_toolchain_file)
NOTE: Running task 2229 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_unpack)
NOTE: Running task 2230 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.17-r0: task do_compile: Succeeded
NOTE: Running task 2231 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_install)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.134-r0: task do_write_config: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.59-r0: task do_install_ptest_base: Started
NOTE: recipe curl-8.23.0-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2232 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_compile)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_write_config: Succeeded
NOTE: Running task 2233 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_write_config)
NOTE: Running task 2234 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_deploy_source_date_epoch)
NOTE: recipe fribidi-1.0.17-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_write_config: Started
NOTE: recipe kmod-34.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_deploy_source_date_epoch unihash changed to d30300a7e2c7c545e57d8672ec94f37a8dc6cb22f5c16a32f0c2623a1fa0ad05
NOTE: recipe libxdamage-1_1.1.7-r0: task do_write_config: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_deploy_source_date_epoch unihash changed to b0a6a1fed6ab613b40733d2c654356aa17cb3518541738e35ac3c793dec8fdd9
NOTE: recipe kmod-34.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_deploy_source_date_epoch unihash changed to 0d77d5b8410ec2a3a7475f299a1c5c36a2a26cf39a3e6aeeca7934a8aae36be7
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2235 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_install)
NOTE: Running task 2236 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_patch)
NOTE: Running task 2237 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_write_config)
NOTE: Running task 2245 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2246 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2247 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Succeeded
NOTE: Running task 2248 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot)
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.23.0-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-34.3-r0: task do_write_config: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Started
NOTE: recipe fribidi-1.0.17-r0: task do_install: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.3-r0: task do_write_config: Succeeded
NOTE: Running task 2249 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package)
NOTE: Running task 2250 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_populate_sysroot)
NOTE: recipe curl-8.23.0-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_package: Started
NOTE: Running task 2251 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_write_config)
NOTE: recipe fribidi-1.0.17-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_deploy_source_date_epoch unihash changed to 7887b112bc9246d8a889cfac14511b03464c49d5a644e3875b829f406f01c5d2
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_write_config: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_configure: Succeeded
NOTE: recipe libpng-1.6.59-r0: task do_install_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch unihash changed to f6dc739945e0e58b274cccce70e300f6f9481ce68085a5ad8d7ea5a71a4ba3f7
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_deploy_source_date_epoch unihash changed to 6196f6fa7dcb7e79d081b746bb1b45c5cd1b266176c8e09915c911fc2b1c94c2
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2252 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2253 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot)
NOTE: Running task 2254 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_populate_sysroot)
NOTE: Running task 2255 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package)
NOTE: Running task 2256 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_package)
NOTE: Running task 2257 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_compile)
NOTE: recipe fribidi-1.0.17-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2258 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2259 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_write_config)
NOTE: Running task 2261 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libpng-1.6.59-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Started
NOTE: recipe libpciaccess-0.19-r0: task do_compile: Started
NOTE: recipe libpng-1.6.59-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_write_config: Started
NOTE: recipe kmod-34.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_write_config: Succeeded
NOTE: Running task 2265 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_fetch)
NOTE: recipe libxi-1_1.8.4-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.4-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2273 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_configure)
NOTE: Running task 2277 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_unpack)
NOTE: recipe eudev-3.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_deploy_source_date_epoch unihash changed to 81f25fab75a8da89c1fa52b69198f3a30ba1667669c6ac22acfffad7d7d56872
NOTE: recipe libcap-ng-0.9.6-r0: task do_configure: Started
NOTE: recipe readline-8.3-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2278 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2280 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libpng-1.6.59-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_compile: Succeeded
NOTE: recipe readline-8.3-r0: task do_unpack: Succeeded
NOTE: Running task 2281 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_patch)
NOTE: Running task 2282 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2283 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_install)
NOTE: recipe kmod-34.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2284 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_configure)
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe readline-8.3-r0: task do_patch: Started
NOTE: recipe freetype-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpciaccess-0.19-r0: task do_install: Started
NOTE: recipe kmod-34.3-r0: task do_configure: Started
NOTE: recipe libogg-1.3.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_deploy_source_date_epoch unihash changed to 85a5c4b8629ec22430a49b854e1a6d715adf817baf05fbf045ef306aac47426a
NOTE: recipe mesa-2_26.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe readline-8.3-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2285 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_configure)
NOTE: Running task 2286 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: Running task 2297 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2304 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_unpack)
NOTE: recipe freetype-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2305 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_configure)
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Started
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.30-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.4-r0: task do_compile: Succeeded
NOTE: Running task 2306 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_compile_ptest_base)
NOTE: recipe mesa-2_26.2.4-r0: task do_patch: Started
NOTE: recipe freetype-2.15.0-r0: task do_configure: Started
NOTE: recipe libxml2-2.15.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.30-r0: task do_unpack: Succeeded
NOTE: Running task 2307 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_unpack)
NOTE: recipe libpciaccess-0.19-r0: task do_install: Succeeded
NOTE: recipe libxml2-2.15.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2308 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_install)
NOTE: Running task 2309 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.88-r0: task do_unpack: Started
NOTE: Running task 2310 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_configure)
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot: Started
NOTE: recipe libxml2-2.15.4-r0: task do_install: Started
NOTE: recipe libogg-1.3.6-r0: task do_configure: Started
NOTE: recipe bluez5-5.88-r0: task do_unpack: Succeeded
NOTE: Running task 2319 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_patch)
NOTE: recipe mesa-2_26.2.4-r0: task do_patch: Succeeded
NOTE: Running task 2320 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_patch)
NOTE: recipe libusb1-1.0.30-r0: task do_patch: Started
NOTE: recipe bluez5-5.88-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_patch: Succeeded
NOTE: Running task 2358 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2409 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_recipe_spdx)
NOTE: recipe bluez5-5.88-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2410 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_create_recipe_spdx)
NOTE: recipe util-linux-2.42.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpng-1.6.59-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxml2-2.15.4-r0: task do_install: Succeeded
NOTE: Running task 2411 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_install_ptest_base)
NOTE: recipe libxml2-2.15.4-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.42.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2414 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe libpng-1.6.59-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2415 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_fetch: Started
NOTE: Running task 2420 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_recipe_spdx)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_fetch: Succeeded
NOTE: Running task 2422 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_fetch)
NOTE: recipe libdrm-2.4.134-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_configure: Succeeded
NOTE: Running task 2424 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata)
NOTE: recipe libdrm-2.4.134-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 2425 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_compile)
NOTE: Running task 2434 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8.4-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.2-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxi-1_1.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 2455 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_fetch)
NOTE: Running task 2456 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_patch)
NOTE: recipe libxi-1_1.8.4-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_fetch: Succeeded
NOTE: Running task 2458 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_create_recipe_spdx)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata unihash changed to 522caf80406a84a0ab1dc1899aee032b223cb0f1cfb30a9139e5d9c630465b95
NOTE: recipe libxi-1_1.8.4-r0: task do_patch: Succeeded
NOTE: recipe freetype-2.15.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe freetype-2.15.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2461 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_fetch)
NOTE: Running task 2462 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2463 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_unpack)
NOTE: recipe freetype-2.15.0-r0: task do_configure: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_unpack: Started
NOTE: Running task 2464 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_compile)
NOTE: recipe freetype-2.15.0-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2465 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 2466 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_patch)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 2468 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_patch: Started
NOTE: recipe flac-1.5.0-r0: task do_fetch: Started
NOTE: recipe flac-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 2471 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_unpack)
NOTE: Running task 2472 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_recipe_spdx)
NOTE: recipe kmod-34.3-r0: task do_configure: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_compile: Succeeded
NOTE: Running task 2473 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_compile)
NOTE: Running task 2474 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_compile_ptest_base)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_unpack: Started
NOTE: recipe kmod-34.3-r0: task do_compile: Started
NOTE: recipe libpcre2-10.49-r0: task do_compile_ptest_base: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_unpack: Succeeded
NOTE: Running task 2475 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_patch)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_patch: Succeeded
NOTE: Running task 2477 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_fetch)
NOTE: recipe libpcre2-10.49-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2478 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_install)
NOTE: recipe xkeyboard-config-2.48-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2486 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe nghttp2-1.71.0-r0: task do_fetch: Started
NOTE: recipe nghttp2-1.71.0-r0: task do_fetch: Succeeded
NOTE: Running task 2487 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.1.2-r0: task do_compile: Succeeded
NOTE: Running task 2488 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_install)
NOTE: recipe xkeyboard-config-2.48-r0: task do_patch: Succeeded
NOTE: Running task 2489 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_generate_toolchain_file)
NOTE: recipe libpcre2-10.49-r0: task do_install: Started
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-4.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libical-4.0.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe libice-1_1.1.2-r0: task do_install: Started
NOTE: recipe libical-4.0.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2490 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch unihash changed to aa063ac73930f9993a29ed9021ae2d22fad0ee06a82a0d373f1654ed932dd133
NOTE: recipe libical-4.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_deploy_source_date_epoch unihash changed to eaf99a27910550ac3ce35932bb7f8a9f02566aa595ee4b43d6384a20b8f0db35
NOTE: recipe libpng-1.6.59-r0: task do_package: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2491 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_packagedata)
NOTE: recipe readline-8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2492 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch)
NOTE: Running task 2493 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_deploy_source_date_epoch)
NOTE: Running task 2494 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata)
NOTE: Setscene tasks completed
NOTE: Running task 2495 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_configure)
NOTE: recipe libice-1_1.1.2-r0: task do_install: Succeeded
NOTE: Running task 2496 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot)
NOTE: recipe libpng-1.6.59-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe readline-8.3-r0: task do_configure: Started
NOTE: recipe libpcre2-10.49-r0: task do_install: Succeeded
NOTE: Running task 2497 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_install_ptest_base)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.3-r0: task do_compile: Succeeded
NOTE: Running task 2498 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_install)
NOTE: recipe libpcre2-10.49-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_deploy_source_date_epoch unihash changed to d82010f5f6bd1f785d61926e0d0f3c9c058030ea408fae91e7fdc261fe1c3a37
NOTE: recipe mesa-2_26.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpng-1.6.59-r0: task do_packagedata: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata: Succeeded
NOTE: recipe kmod-34.3-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_packagedata unihash changed to bfe3965bb08c285d0c1a98e1ad30670b45b8570beee8abeae709582fcdaacb88
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata unihash changed to d15cf73bebb92792c954a8774de33de6150fb26a80ff18495f00dd986ddf9d2d
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch unihash changed to a514e4f8a4ff22b771c3dd80eae2dbdbb24fce2c88cf511afc3fa4f3e5a32d31
NOTE: recipe libdrm-2.4.134-r0: task do_configure: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_install_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2499 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2500 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_populate_sysroot)
NOTE: Running task 2501 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_package)
NOTE: Running task 2502 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_compile)
NOTE: Running task 2503 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx)
NOTE: Running task 2504 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_deploy_source_date_epoch)
NOTE: Running task 2505 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe libsm-1_1.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.49-r0: task do_package: Started
NOTE: recipe libdrm-2.4.134-r0: task do_compile: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx: Started
NOTE: recipe bluez5-5.88-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2506 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe mesa-2_26.2.4-r0: task do_write_config: Started
NOTE: recipe kmod-34.3-r0: task do_install: Succeeded
NOTE: recipe bluez5-5.88-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2507 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_populate_sysroot)
NOTE: recipe mesa-2_26.2.4-r0: task do_write_config: Succeeded
NOTE: Running task 2508 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_configure)
NOTE: Running task 2510 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_fetch)
NOTE: Running task 2511 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_recipe_spdx)
NOTE: recipe libsm-1_1.2.6-r0: task do_configure: Started
NOTE: recipe kmod-34.3-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.44-r0: task do_fetch: Started
NOTE: recipe orc-0.4.44-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2512 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_create_recipe_spdx)
NOTE: recipe libxrender-1_0.9.13-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpcre2-10.49-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2513 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2515 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2521 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2522 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_unpack)
NOTE: Running task 2524 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_unpack: Started
NOTE: recipe nghttp2-1.71.0-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_unpack: Started
NOTE: recipe kmod-34.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2525 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package)
NOTE: recipe nghttp2-1.71.0-r0: task do_unpack: Succeeded
NOTE: Running task 2526 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_patch)
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Started
NOTE: recipe nghttp2-1.71.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2527 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_configure)
NOTE: recipe nghttp2-1.71.0-r0: task do_patch: Succeeded
NOTE: Running task 2529 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_unpack)
NOTE: recipe flac-1.5.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_unpack: Succeeded
NOTE: Running task 2530 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_patch)
NOTE: recipe libgcrypt-1.12.4-r0: task do_patch: Started
NOTE: recipe flac-1.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 2531 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx: Started
NOTE: Running task 2532 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_patch)
NOTE: recipe freetype-2.15.0-r0: task do_compile: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 2533 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_install)
NOTE: recipe libxml2-2.15.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2534 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_populate_sysroot)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx: Succeeded
NOTE: recipe freetype-2.15.0-r0: task do_install: Started
NOTE: Running task 2535 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_package)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_patch: Succeeded
NOTE: Running task 2536 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_patch)
NOTE: recipe libgcrypt-1.12.4-r0: task do_patch: Succeeded
NOTE: Running task 2538 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_fetch)
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.134-r0: task do_compile: Succeeded
NOTE: Running task 2539 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_install)
NOTE: recipe flac-1.5.0-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.6-r0: task do_fetch: Started
NOTE: recipe libxml2-2.15.4-r0: task do_package: Started
NOTE: recipe libxtst-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: Running task 2540 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libdrm-2.4.134-r0: task do_install: Started
NOTE: recipe libxi-1_1.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 2542 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_fetch)
NOTE: recipe libsoup-3.8.1-r0: task do_fetch: Started
NOTE: recipe libsoup-3.8.1-r0: task do_fetch: Succeeded
NOTE: Running task 2543 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_deploy_source_date_epoch unihash changed to 980d90d6e229e1fc8d587aa458635f18e3ae8a142492168b383c740082b9c704
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 2544 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx)
NOTE: recipe freetype-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 2545 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_populate_sysroot)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libxml2-2.15.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Succeeded
NOTE: Running task 2546 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2547 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_package)
NOTE: Running task 2548 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata)
NOTE: recipe freetype-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.26.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.15.0-r0: task do_package: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.134-r0: task do_install: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 2549 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_populate_sysroot)
NOTE: Running task 2550 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata unihash changed to f7d8217073772e852f6ccdc06748f5af26e50c5db52771bff8e0d6635a8ef211
NOTE: recipe libgpg-error-1.61-r0: task do_configure: Succeeded
NOTE: recipe freetype-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2551 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_configure_ptest_base)
NOTE: recipe wayland-1.26.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2554 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_package)
NOTE: Running task 2555 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_configure)
NOTE: Running task 2558 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_fetch)
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_configure_ptest_base: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_package: Started
NOTE: recipe wayland-1.26.0-r0: task do_configure: Started
NOTE: Running task 2563 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx)
NOTE: recipe libxmlb-0.3.30-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2564 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_compile)
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx: Started
NOTE: recipe libgpg-error-1.61-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.134-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2569 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_recipe_spdx)
NOTE: recipe libxmlb-0.3.30-r0: task do_fetch: Succeeded
NOTE: Running task 2570 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_unpack)
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe orc-0.4.44-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2601 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2602 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_compile)
NOTE: recipe orc-0.4.44-r0: task do_unpack: Succeeded
NOTE: Running task 2603 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_patch)
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2607 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_compile: Started
NOTE: recipe orc-0.4.44-r0: task do_patch: Started
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.13-r0: task do_fetch: Succeeded
NOTE: Running task 2608 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_fetch)
NOTE: recipe orc-0.4.44-r0: task do_patch: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2609 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_fetch)
NOTE: Running task 2615 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_patch)
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 2622 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2623 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.49-r0: task do_package: Succeeded
NOTE: Running task 2624 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_packagedata)
NOTE: recipe libpcre2-10.49-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch unihash changed to 99d084da23511c66adfbddb0fb686c18e4f6c9a8bd76cc7bf8bb1808b287e2ab
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_deploy_source_date_epoch unihash changed to 6e094e06108a0ef9ea6fc97823f3c93df5381df469f7c260a0fedfb03168a5e3
NOTE: Running task 2625 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2628 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe libpcre2-10.49-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_packagedata unihash changed to ccee3236b052f1e07bdb84b47ecf6667c20e2dd2da4bcf9318f055082478c992
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2629 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_compile)
NOTE: Running task 2630 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.49.bb:do_create_spdx)
NOTE: Running task 2631 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb:do_package)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2632 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2642 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_fetch)
NOTE: recipe libogg-1.3.6-r0: task do_compile: Started
NOTE: recipe libpcre2-10.49-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_configure: Started
NOTE: recipe wayland-protocols-1.50-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_package: Succeeded
NOTE: Running task 2643 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_fetch)
NOTE: Running task 2644 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_fetch: Succeeded
NOTE: Running task 2645 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_deploy_source_date_epoch)
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_packagedata: Started
NOTE: recipe freetype-2.15.0-r0: task do_package: Succeeded
NOTE: recipe readline-8.3-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2646 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_packagedata)
NOTE: Running task 2647 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_compile)
NOTE: recipe freetype-2.15.0-r0: task do_packagedata: Started
NOTE: recipe readline-8.3-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_deploy_source_date_epoch unihash changed to 90de623df11288a5ba08a9445c9df28e5f905a352d9ab1fa1c321c514e2132a9
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.49-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_packagedata unihash changed to 34e86e63101b08803db0b39a1ff46da1a84c8cb888d63abb3f8df3f38b7a2931
NOTE: recipe freetype-2.15.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_packagedata unihash changed to d81fb33d897b5b03fe6cd441c94bb99fefd4547b91ed14bb3b717a625752e6c9
NOTE: recipe libcap-ng-0.9.6-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2648 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_install)
NOTE: Running task 2651 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_write_config)
NOTE: Running task 2652 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2658 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_unpack)
NOTE: Running task 2659 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_create_recipe_spdx)
NOTE: recipe wayland-1.26.0-r0: task do_configure: Succeeded
NOTE: Running task 2660 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_configure_ptest_base)
NOTE: recipe xkeyboard-config-2.48-r0: task do_write_config: Started
NOTE: recipe libxtst-1_1.2.6-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_configure: Succeeded
NOTE: recipe libxtst-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_write_config: Succeeded
NOTE: Running task 2661 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_compile)
NOTE: Running task 2662 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_patch)
NOTE: Running task 2664 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_unpack)
NOTE: recipe wayland-1.26.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-protocols-1.50-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb:do_package unihash changed to 7d04a0a0c080b48b3ccbb4a151ed93ff0ff93167e975ab0b5e5e1703a653dfac
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb:do_packagedata became valid
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Started
NOTE: recipe wayland-1.26.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libxtst-1_1.2.6-r0: task do_patch: Started
NOTE: recipe libogg-1.3.6-r0: task do_compile: Succeeded
NOTE: recipe libsoup-3.8.1-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.6-r0: task do_patch: Succeeded
NOTE: Running setscene task 1970 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb:do_packagedata_setscene)
NOTE: Running task 2665 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_compile)
NOTE: Running task 2666 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_install)
NOTE: Running task 2669 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_unpack)
NOTE: Running task 2670 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_recipe_qa)
NOTE: recipe libsoup-3.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 2671 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_patch)
NOTE: recipe wayland-protocols-1.50-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.26.0-r0: task do_compile: Started
NOTE: recipe libogg-1.3.6-r0: task do_install: Started
NOTE: recipe libxslt-1.1.45-r0: task do_recipe_qa: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.8.1-r0: task do_patch: Started
NOTE: Running task 2672 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_configure)
NOTE: recipe libxmlb-0.3.30-r0: task do_unpack: Started
NOTE: recipe wayland-protocols-1.50-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2675 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.48-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.45-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsoup-3.8.1-r0: task do_patch: Succeeded
NOTE: Running task 2677 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_fetch)
NOTE: Running task 2681 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_package)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2683 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_recipe_qa)
NOTE: recipe libxslt-1.1.45-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.45-r0: task do_fetch: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_package: Started
NOTE: Running task 2684 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_recipe_qa: Started
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.6.0-r0: task do_fetch: Succeeded
NOTE: Running task 2692 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.6-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2693 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_fetch)
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Started
NOTE: Running task 2694 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.13-r0: task do_unpack: Succeeded
NOTE: Running task 2695 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_package)
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.6-r0: task do_install: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_fetch: Started
NOTE: Running task 2696 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_fetch: Succeeded
NOTE: Running task 2697 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_package)
NOTE: recipe libcap-ng-0.9.6-r0: task do_package: Started
NOTE: recipe readline-8.3-r0: task do_compile: Succeeded
NOTE: Running task 2698 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_install)
NOTE: recipe libxmlb-0.3.30-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Started
NOTE: Running task 2699 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_patch)
NOTE: recipe libogg-1.3.6-r0: task do_package: Started
NOTE: recipe wayland-1.26.0-r0: task do_compile: Succeeded
NOTE: recipe libxmlb-0.3.30-r0: task do_patch: Started
NOTE: Running task 2700 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_compile_ptest_base)
NOTE: recipe readline-8.3-r0: task do_install: Started
NOTE: recipe wayland-1.26.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_patch: Succeeded
NOTE: Running task 2701 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2702 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_install)
NOTE: Running task 2703 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2704 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.26.0-r0: task do_install: Started
NOTE: recipe util-linux-2.42.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 2705 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2706 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2707 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libgcrypt-1.12.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.19-r0: task do_package: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2708 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata)
NOTE: Running task 2709 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_configure)
NOTE: recipe xkeyboard-config-2.48-r0: task do_configure: Succeeded
NOTE: recipe libgcrypt-1.12.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.3-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_deploy_source_date_epoch unihash changed to ba01cafe7d3fd98ec2bb3d53e70055b4f1ef3bc3fe2968369296592cfdef3691
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 2710 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot)
NOTE: recipe wayland-1.26.0-r0: task do_install: Succeeded
NOTE: Running task 2711 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_compile)
NOTE: Running task 2712 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_recipe_spdx)
NOTE: Running task 2713 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.42.4-r0: task do_configure: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_compile: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe wayland-1.26.0-r0: task do_install_ptest_base: Started
NOTE: recipe libpciaccess-0.19-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_packagedata unihash changed to 3761da6776eb31d5c4a22ab1612b43ce5105d83c0e8a713d59efbb0c3daa4eea
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe wayland-1.26.0-r0: task do_install_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2714 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_populate_sysroot)
NOTE: Running task 2715 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_package)
NOTE: Running task 2716 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_patch)
NOTE: recipe libxv-1.0.13-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.134-r0: task do_package: Started
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2717 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_patch)
NOTE: recipe libxv-1.0.13-r0: task do_patch: Succeeded
NOTE: Running task 2718 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_patch)
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_compile: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Started
NOTE: Running task 2719 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_install)
NOTE: recipe libtheora-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 2721 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.3-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_install: Started
NOTE: Running task 2722 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.26.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: Running task 2725 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_fetch)
NOTE: recipe libgudev-238-r0: task do_fetch: Started
NOTE: recipe libgudev-238-r0: task do_fetch: Succeeded
NOTE: Running task 2726 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_fetch)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_deploy_source_date_epoch unihash changed to 549b42f5c54a4cd421940996f18bcf3becf186acbed6397e2223333f561f1ed8
NOTE: recipe sbc-2.2-r0: task do_fetch: Started
NOTE: recipe sbc-2.2-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2727 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2728 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_write_config)
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.6-r0: task do_package: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_package: Succeeded
NOTE: Running task 2729 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_write_config: Succeeded
NOTE: Running task 2730 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata)
NOTE: Running task 2731 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.17.0-r0: task do_compile: Succeeded
NOTE: Running task 2732 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_install)
NOTE: recipe flac-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_deploy_source_date_epoch unihash changed to 9bd2ac0a56ae343c79b27974b84a5092b1b65378af2f8b4de023aa91d20e2c7a
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata: Started
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_compile: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_configure: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 2733 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_compile)
NOTE: Running task 2734 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_compile_ptest_base)
NOTE: Running task 2735 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 2736 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_unpack)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata unihash changed to 554ca3d8333a096b42e95681d4673b332e9592b98d137a2205be588e33ae224e
NOTE: recipe flac-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.61-r0: task do_compile_ptest_base: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata unihash changed to 37c06f0191536f54fac1646b9bb46ac716706e3133509352c77b2b361bcd0cc1
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.48-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2737 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_install)
NOTE: Running task 2738 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_populate_sysroot)
NOTE: Running task 2739 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_configure)
NOTE: Running task 2740 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_unpack)
NOTE: Running task 2741 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_recipe_spdx)
NOTE: Running task 2742 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_patch)
NOTE: Running task 2746 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe libgpg-error-1.61-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_unpack: Started
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 2747 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_unpack: Succeeded
NOTE: Running task 2748 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_patch: Succeeded
NOTE: Running task 2752 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_unpack)
NOTE: recipe orc-0.4.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.26.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe at-spi2-core-2.62.1-r0: task do_patch: Started
NOTE: Running task 2753 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_write_config)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2754 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_patch: Succeeded
NOTE: Running task 2757 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_unpack)
NOTE: recipe orc-0.4.44-r0: task do_write_config: Started
NOTE: recipe orc-0.4.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_deploy_source_date_epoch unihash changed to 4993794c500bf66b7f92af92f89846eb961c8b26e9715c7fef92649b34a953e6
NOTE: recipe orc-0.4.44-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.45-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2758 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_patch)
NOTE: Running task 2762 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_recipe_spdx)
NOTE: Running task 2763 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_install)
NOTE: Running task 2764 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_install: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Started
NOTE: recipe libxslt-1.1.45-r0: task do_unpack: Succeeded
NOTE: Running task 2765 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_patch)
NOTE: recipe libwebp-1.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 2766 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_unpack)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2767 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_recipe_spdx)
NOTE: recipe libxslt-1.1.45-r0: task do_patch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2768 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_patch)
NOTE: recipe orc-0.4.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_package: Succeeded
NOTE: recipe libxslt-1.1.45-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2769 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_configure)
NOTE: Running task 2770 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_packagedata)
NOTE: Running task 2771 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2772 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot)
NOTE: recipe orc-0.4.44-r0: task do_configure: Started
NOTE: Running task 2773 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_package)
NOTE: recipe libwebp-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata: Started
NOTE: Running task 2774 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package)
NOTE: Running task 2775 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_patch)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.61-r0: task do_install: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_package: Started
NOTE: Running task 2776 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_deploy_source_date_epoch unihash changed to 360c50a26babff5a6bda9d74b27030294a27601fe782443d9d166a4f3004c82f
NOTE: recipe libdrm-2.4.134-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_install_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_packagedata unihash changed to b29d0606af80344210194470e7d843d1e8b24fbcaa7e4a5182c1f11191d7fbb2
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_install_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2777 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_populate_sysroot)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2778 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: Running task 2788 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_recipe_qa)
NOTE: Running task 2791 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2792 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_fetch)
NOTE: recipe initscripts-1.0-r0: task do_package: Started
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_recipe_qa: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe tiff-4.7.2-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 2793 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_fetch)
NOTE: Running task 2794 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_create_recipe_spdx)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2795 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_fetch)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 2799 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_fetch: Started
NOTE: recipe libarchive-3.8.11-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.8.11-r0: task do_fetch: Succeeded
NOTE: Running task 2800 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_fetch)
NOTE: Running task 2801 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2809 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.61-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Started
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2810 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2812 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_generate_toolchain_file)
NOTE: Running task 2813 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe nghttp2-1.71.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_install: Succeeded
NOTE: Running task 2814 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.71.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nghttp2-1.71.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot: Started
NOTE: recipe nghttp2-1.71.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe nghttp2-1.71.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2815 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_deploy_source_date_epoch unihash changed to 8782155f6eb497ac6f06b05bc0cde85c2a6784a6bc35d498cf1376e279b652d0
NOTE: Setscene tasks completed
NOTE: Running task 2817 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_package: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fribidi-1.0.17-r0: task do_package: Started
NOTE: Running task 2818 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_configure)
NOTE: recipe nghttp2-1.71.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2819 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_configure)
NOTE: recipe libgcrypt-1.12.4-r0: task do_configure: Started
NOTE: recipe nghttp2-1.71.0-r0: task do_configure: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2820 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_package unihash changed to c9b221bab38d70224880c6ef37fe92eb0bb5a4c57e0083ba9c17a5f9a2d3e0d9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata became valid
NOTE: recipe orc-0.4.44-r0: task do_configure: Succeeded
NOTE: Running setscene task 1970 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running task 2821 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2822 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_compile)
NOTE: recipe orc-0.4.44-r0: task do_compile: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2823 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_configure)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_configure: Succeeded
NOTE: Running task 2824 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_compile)
NOTE: recipe libx11-1_1.8.14-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_compile: Started
NOTE: Running task 2826 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2827 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_configure: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_packagedata unihash changed to d2fa85931e04c9446232cfa812948dd414ab3f9767baea08f5539d387545275f
NOTE: recipe fribidi-1.0.17-r0: task do_package: Succeeded
NOTE: Running task 2828 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_spdx)
NOTE: Running task 2829 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_package: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx: Started
NOTE: recipe libgudev-238-r0: task do_unpack: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package unihash changed to c92c033df3dd067b3020717fe920908dea6d05f84c62924415e2eb1582371d42
NOTE: Setscene tasks completed
NOTE: Running task 2830 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe libgudev-238-r0: task do_unpack: Succeeded
NOTE: Running task 2831 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_unpack)
NOTE: recipe initscripts-1.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.2-r0: task do_unpack: Started
NOTE: recipe sbc-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2833 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_create_recipe_spdx)
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 2834 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_patch)
NOTE: recipe cairo-1.18.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata unihash changed to 92805ab96f9cbc68bcf0f11fc7b3090ab94a809159d439f3bc09fd3d9fbd641f
NOTE: Setscene tasks completed
NOTE: Running task 2835 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_patch)
NOTE: recipe sbc-2.2-r0: task do_patch: Started
NOTE: recipe cairo-1.18.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_patch: Succeeded
NOTE: Running task 2836 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 2837 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_deploy_source_date_epoch)
NOTE: Setscene tasks completed
NOTE: Running task 2838 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe sbc-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2839 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_write_config)
NOTE: recipe libxtst-1_1.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsoup-3.8.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libsoup-3.8.1-r0: task do_write_config: Started
NOTE: recipe libsoup-3.8.1-r0: task do_write_config: Succeeded
NOTE: Running task 2842 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_configure: Succeeded
NOTE: Running task 2843 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_configure_ptest_base)
NOTE: recipe libxtst-1_1.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_deploy_source_date_epoch unihash changed to 4278bcb5e99243632789640882d1585cbb5d1589fd73176d6d31e1976137f08e
NOTE: recipe libsoup-3.8.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxmlb-0.3.30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_configure_ptest_base: Started
NOTE: recipe nghttp2-1.71.0-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_deploy_source_date_epoch unihash changed to 570410cf5558c1fc3f51b902e1e148f36977d2b84d4164934a624235e1b867a1
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2844 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_compile)
NOTE: Running task 2845 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_compile)
NOTE: Running task 2846 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.59.bb:do_create_spdx)
NOTE: Running task 2847 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_write_config)
NOTE: recipe libxmlb-0.3.30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_deploy_source_date_epoch unihash changed to 82bbb3f3795074a08c69d72ef4b74aa34996864424c02b6b3fe160f69e7b5ca8
NOTE: recipe nghttp2-1.71.0-r0: task do_compile: Started
NOTE: recipe libpng-1.6.59-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_write_config: Started
NOTE: Setscene tasks completed
NOTE: Running task 2848 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_packagedata)
NOTE: recipe libxmlb-0.3.30-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2861 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe fribidi-1.0.17-r0: task do_packagedata: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe fribidi-1.0.17-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_packagedata unihash changed to bf83aae3c792265d93d6ad291fe4f1f2982f9f37a238f38ed35491c51801c885
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libpng-1.6.59-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2862 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Running task 2866 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_recipe_qa)
NOTE: Running task 2869 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package)
NOTE: recipe libwpe-1.16.3-r0: task do_recipe_qa: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe orc-0.4.44-r0: task do_compile: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_package: Started
NOTE: Running task 2870 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_install)
NOTE: recipe libwpe-1.16.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2871 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_fetch)
NOTE: recipe orc-0.4.44-r0: task do_install: Started
NOTE: recipe libwpe-1.16.3-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_fetch: Succeeded
NOTE: Running task 2873 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_write_config)
NOTE: Running task 2874 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe iso-codes-4.20.1-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_write_config: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 2876 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2877 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_configure)
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_configure: Started
NOTE: recipe libxv-1.0.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_deploy_source_date_epoch unihash changed to 54163e49fc48dcbcfaaf677bc92b8f000407c03700d3b8ca45725b4051f8a219
NOTE: Setscene tasks completed
NOTE: Running task 2878 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.44-r0: task do_install: Succeeded
NOTE: Running task 2879 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_populate_sysroot)
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_configure: Succeeded
NOTE: recipe orc-0.4.44-r0: task do_populate_sysroot: Started
NOTE: Running task 2880 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_compile)
NOTE: recipe libtheora-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_deploy_source_date_epoch unihash changed to a9b754836c9fa8e40209e24f4cdf8b702f20ac8adf12443b6ccfb893ba4969ea
NOTE: recipe nghttp2-1.71.0-r0: task do_compile: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 2881 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_install)
NOTE: Running task 2882 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2883 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: recipe nghttp2-1.71.0-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.44-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2885 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_deploy_source_date_epoch unihash changed to ebdc2e45114cbad322f5ac2197357d4a196c5ee26c67a41794b31a653c87fd85
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_configure: Succeeded
NOTE: recipe nghttp2-1.71.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2886 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_populate_sysroot)
NOTE: Running task 2887 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_compile)
NOTE: Running task 2888 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_write_config)
NOTE: recipe nghttp2-1.71.0-r0: task do_populate_sysroot: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_compile: Started
NOTE: recipe libtheora-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2889 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Started
NOTE: Running task 2892 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.3-r0: task do_write_config: Succeeded
NOTE: Running task 2894 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2895 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nghttp2-1.71.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch unihash changed to 98f4837a1da4f546d54269bf521d01dbea656e66711f635dab2e2dad7f0b4144
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: Running task 2896 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_unpack)
NOTE: Running task 2897 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_unpack)
NOTE: recipe tiff-4.7.2-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2901 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb:do_fetch)
NOTE: Running task 2902 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe libice-1_1.1.2-r0: task do_package: Succeeded
NOTE: Running task 2903 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata)
NOTE: recipe gtk4-4.24.1-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe gtk4-4.24.1-r0: task do_fetch: Succeeded
NOTE: Running task 2904 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe iso-codes-4.20.1-r0: task do_compile: Succeeded
NOTE: Running task 2905 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_install)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 2906 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_unpack: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_install: Started
NOTE: recipe tiff-4.7.2-r0: task do_patch: Started
NOTE: Running task 2907 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_patch)
NOTE: recipe tiff-4.7.2-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2908 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_patch)
NOTE: Running task 2915 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_unpack)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata unihash changed to b03b6c8ba006abd2d2c6bb83bac457e609de010d980d836464759cfcbbd7bca8
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libarchive-3.8.11-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2916 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_unpack)
NOTE: Running task 2917 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.11-r0: task do_unpack: Succeeded
NOTE: Running task 2918 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2919 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package)
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.8.11-r0: task do_patch: Started
NOTE: Running task 2920 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: recipe json-glib-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 2921 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_patch)
NOTE: recipe libsm-1_1.2.6-r0: task do_package: Started
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Started
NOTE: recipe json-glib-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 2922 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.8.11-r0: task do_patch: Succeeded
NOTE: Running task 2923 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2925 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.15.0.bb:do_create_spdx)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe freetype-2.15.0-r0: task do_create_spdx: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_deploy_source_date_epoch unihash changed to c13b23645d9804efe051ee5d6c452657e0a7b382410b6c50b6cda74da1782879
NOTE: recipe at-spi2-core-2.62.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_deploy_source_date_epoch unihash changed to 00da4c038b1574c50d933735cf30eff1bc14d032e650fe4f4e99c59b6ebf9b88
NOTE: Setscene tasks completed
NOTE: Running task 2926 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_create_recipe_spdx)
NOTE: Running task 2930 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_write_config)
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_write_config: Succeeded
NOTE: Running task 2931 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_write_config)
NOTE: recipe freetype-2.15.0-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.62.1-r0: task do_write_config: Started
NOTE: Running task 2934 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_recipe_spdx)
NOTE: recipe libpciaccess-0.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2935 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_deploy_source_date_epoch)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx: Started
NOTE: Running task 2936 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libxslt-1.1.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2939 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxslt-1.1.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_deploy_source_date_epoch unihash changed to c3757d413c26cdaff0b806a61f4b9ea01081ef167a8996e94ecc5e468f00df3b
NOTE: recipe iso-codes-4.20.1-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch unihash changed to 5de919b98aada0212d05a5c702829e6eecbbd84242bfa8a14f295d0fc2f6350e
NOTE: recipe libxslt-1.1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 2944 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: Running task 2945 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_unpack)
NOTE: Running task 2955 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe libwpe-1.16.3-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 2956 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.16.3-r0: task do_unpack: Succeeded
NOTE: recipe libxslt-1.1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2957 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_patch)
NOTE: Setscene tasks completed
NOTE: Running task 2958 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwpe-1.16.3-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.45-r0: task do_configure: Started
NOTE: recipe libwpe-1.16.3-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2960 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_recipe_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_deploy_source_date_epoch unihash changed to 7d5bb68e65cdc2ace55876cebcf1428b5148b79c1e01f7dee9679b4a343be842
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 2965 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2966 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_write_config)
NOTE: recipe libxml2-2.15.4-r0: task do_package: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_write_config: Started
NOTE: Running task 2967 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_packagedata)
NOTE: recipe libdrm-2.4.134-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2982 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_create_recipe_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_write_config: Succeeded
NOTE: Running task 2984 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_package)
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata: Started
NOTE: recipe icu-79.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2985 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_configure)
NOTE: recipe xkeyboard-config-2.48-r0: task do_package: Started
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_compile: Succeeded
NOTE: Running task 2986 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_install)
NOTE: recipe libsm-1_1.2.6-r0: task do_package: Succeeded
NOTE: recipe icu-79.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2987 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata)
NOTE: recipe libxml2-2.15.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2990 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_create_recipe_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_packagedata unihash changed to 8d82bc35ccfaff15402a9155c0be9156eb06786afb8aa767d92d065966256e9b
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 2991 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_package)
NOTE: recipe libxcb-1.17.0-r0: task do_package: Succeeded
NOTE: Running task 2992 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 2993 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_package)
NOTE: recipe wayland-1.26.0-r0: task do_package: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata unihash changed to 32a9637a0f08c793c1c7553af74b4823021144a87267e27eee402fb6a98b2ae9
NOTE: recipe flac-1.5.0-r0: task do_configure: Succeeded
NOTE: recipe kmod-34.3-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 2994 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_compile)
NOTE: Running task 2996 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe flac-1.5.0-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata unihash changed to c3bb1aeabca2c73f05b04615ad7ca33e1d7fa08ec5898cb116ef6dae0017181c
NOTE: recipe libxkbcommon-1.13.2-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2997 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx)
NOTE: Running task 2998 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_populate_sysroot)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2999 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-238-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_deploy_source_date_epoch unihash changed to 01d4157b9c01eaa83a6a16aae2e98691b753172e1371dc6d8dfc60f47f40378f
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3000 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_compile_ptest_base)
NOTE: Running task 3001 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3002 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_install)
NOTE: recipe kmod-34.3-r0: task do_package: Succeeded
NOTE: recipe sbc-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_deploy_source_date_epoch unihash changed to 94a6c2517bccdd98968822043efa731f895ccdf0bd7a979893596d9838d57077
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3005 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_fetch)
NOTE: Running task 3006 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_recipe_spdx)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3007 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb:do_unpack)
NOTE: Running task 3008 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_write_config)
NOTE: recipe gtk4-4.24.1-r0: task do_unpack: Started
NOTE: recipe libgudev-238-r0: task do_write_config: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_write_config: Succeeded
NOTE: Running task 3010 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 3013 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_compile: Succeeded
NOTE: Running task 3014 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_install)
NOTE: recipe wayland-1.26.0-r0: task do_package: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe kmod-34.3-r0: task do_packagedata: Started
NOTE: Running task 3015 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_install: Started
NOTE: recipe wayland-1.26.0-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_configure: Succeeded
NOTE: Running task 3016 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_configure_ptest_base)
NOTE: recipe kmod-34.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_packagedata unihash changed to 02d801e3f5b558109400182ef20a2859edf1741dedcb64ec769b8e5230e67db1
NOTE: recipe libgcrypt-1.12.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3017 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_compile)
NOTE: recipe wayland-1.26.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3020 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.4.bb:do_create_spdx)
NOTE: Running task 3023 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_recipe_spdx)
NOTE: recipe libgcrypt-1.12.4-r0: task do_compile: Started
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3024 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe libx11-1_1.8.14-r0: task do_compile: Started
NOTE: Running task 3025 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe initscripts-1.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3026 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_recipe_spdx)
NOTE: Running task 3027 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_install: Succeeded
NOTE: Running task 3028 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_install_ptest_base)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gtk4-4.24.1-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3030 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_recipe_spdx)
NOTE: Running task 3031 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata unihash changed to 69414a534e3677b13a80a112fd31150a6d5fb2e6d431964f9ca78094bca73b5c
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe gtk4-4.24.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_install_ptest_base: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3032 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_recipe_spdx)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3033 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_packagedata)
NOTE: Running task 3034 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.24.1-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3043 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.48-r0: task do_packagedata: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3048 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_create_recipe_spdx)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_install: Succeeded
NOTE: Running task 3049 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 3050 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_package)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3051 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_package: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3065 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_create_recipe_spdx)
NOTE: recipe xkeyboard-config-2.48-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_packagedata unihash changed to 125ea4772f64fcc2941e7dd4d5d3cf6fc12c1f3641efa25e24c411db2700a4fe
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: recipe harfbuzz-15.0.0-r0: task do_create_recipe_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 3066 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_package)
NOTE: Running task 3068 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_create_recipe_spdx)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3070 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_recipe_qa)
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fribidi-1.0.17-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_package: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3071 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3072 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.90.0.bb:do_create_spdx)
NOTE: recipe aspell-0.60.8.3-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 3073 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_spdx: Started
NOTE: recipe aspell-0.60.8.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe fribidi-1.0.17-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3074 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_fetch)
NOTE: Running task 3075 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_fetch)
NOTE: recipe libfyaml-0.9.6-r0: task do_fetch: Started
NOTE: recipe aspell-0.60.8.3-r0: task do_fetch: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_fetch: Succeeded
NOTE: Running task 3079 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe aspell-0.60.8.3-r0: task do_fetch: Succeeded
NOTE: Running task 3080 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-initial-1_2.90.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3081 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: Setscene tasks completed
NOTE: Running task 3082 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.7.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch unihash changed to f2107469013fd3bfd58c44aace86765c6d855737c1b647f2987eb015354a19c0
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_compile: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3083 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_deploy_source_date_epoch unihash changed to 1f1f51c05eaf16fd53f5000a53c6540400975f531db7dcd8b6f7641eb23ea4f0
NOTE: recipe libxinerama-1_1.1.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3084 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_deploy_source_date_epoch unihash changed to c281a3d99c8bd27e529bd602c74e2656b69344b27ab874a1d7ff6fe0891e965d
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: Running task 3088 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3092 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 3093 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_write_config)
NOTE: Running task 3094 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtheora-1.2.0-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe tiff-4.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_write_config: Succeeded
NOTE: Running task 3095 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_write_config)
NOTE: Running task 3096 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_recipe_spdx)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_write_config: Started
NOTE: recipe json-glib-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_deploy_source_date_epoch unihash changed to 451df596e6da2cc6c4a33461c503cf19deb4a90248c6b6f4662e4d16e429e3fc
NOTE: recipe mesa-2_26.2.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_write_config: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe tiff-4.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3098 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_write_config)
NOTE: Running task 3110 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_unpack)
NOTE: Running task 3111 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_configure)
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Started
NOTE: recipe tiff-4.7.2-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Started
NOTE: recipe json-glib-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 3120 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_recipe_spdx)
NOTE: recipe mesa-2_26.2.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3121 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_create_recipe_spdx)
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe libunistring-1.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtheora-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3122 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3125 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_package)
NOTE: Running task 3126 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_recipe_spdx)
NOTE: recipe icu-79.1-r0: task do_compile: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3127 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_compile_ptest_base)
NOTE: recipe orc-0.4.44-r0: task do_package: Started
NOTE: recipe icu-79.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3132 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_create_recipe_spdx)
NOTE: Running task 3138 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_create_recipe_spdx)
NOTE: recipe pango-1.58.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxi-1_1.8.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_unpack: Succeeded
NOTE: Running task 3139 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_patch)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_package: Succeeded
NOTE: recipe pango-1.58.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3145 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_recipe_spdx)
NOTE: recipe libxi-1_1.8.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3146 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_packagedata)
NOTE: Running task 3153 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_unpack)
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxml2-2.15.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3154 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.26.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_packagedata: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_patch: Succeeded
NOTE: Running task 3155 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_unpack)
NOTE: recipe libfyaml-0.9.6-r0: task do_unpack: Succeeded
NOTE: Running task 3156 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_create_recipe_spdx)
NOTE: recipe wayland-1.26.0-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe aspell-0.60.8.3-r0: task do_unpack: Started
NOTE: Running task 3157 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_patch)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_patch: Started
NOTE: recipe aspell-0.60.8.3-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.13.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3158 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_packagedata unihash changed to ef26657961fb78dd74c34a14013a20dd6c1f508d7aada06911391f56b3966dfd
NOTE: recipe libxslt-1.1.45-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8.3-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: Running task 3159 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_configure_ptest_base)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_package: Succeeded
NOTE: Running task 3162 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_recipe_qa)
NOTE: Running task 3163 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3164 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_recipe_qa)
NOTE: recipe aspell-0.60.8.3-r0: task do_patch: Succeeded
NOTE: recipe enchant2-2.8.21-r0: task do_recipe_qa: Started
NOTE: Running task 3166 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_recipe_qa)
NOTE: recipe libxslt-1.1.45-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.26.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3167 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_recipe_qa)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_recipe_qa: Started
NOTE: recipe libxslt-1.1.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3168 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_recipe_qa: Started
NOTE: recipe cracklib-2.10.4-r0: task do_recipe_qa: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_patch: Succeeded
NOTE: Running task 3169 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_fetch)
NOTE: recipe enchant2-2.8.21-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3170 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_fetch)
NOTE: recipe libxslt-1.1.45-r0: task do_compile: Started
NOTE: recipe appstream-1.2.3-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3171 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_fetch)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe appstream-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe cracklib-2.10.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe p11-kit-0.26.6-r0: task do_fetch: Started
NOTE: Running task 3172 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_fetch)
NOTE: Running task 3173 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_fetch)
NOTE: Running task 3174 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_packagedata unihash changed to 3e4a7bc995e9696cc5541be2f8f088693b5ce8a695ef16a1f37c1a276be73b51
NOTE: recipe enchant2-2.8.21-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_fetch: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_fetch: Started
NOTE: recipe enchant2-2.8.21-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_fetch: Succeeded
NOTE: recipe libsecret-0.21.8.2-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3175 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_fetch)
NOTE: Running task 3176 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3177 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_recipe_spdx)
NOTE: Running task 3179 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb:do_write_config)
NOTE: Running task 3186 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_deploy_source_date_epoch)
NOTE: recipe cracklib-2.10.4-r0: task do_fetch: Started
NOTE: recipe libwebp-1.6.0-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Started
NOTE: recipe libwpe-1.16.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.24.1-r0: task do_write_config: Started
NOTE: Running task 3187 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_compile)
NOTE: recipe gtk4-4.24.1-r0: task do_write_config: Succeeded
NOTE: Running task 3188 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_package)
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_package: Started
NOTE: recipe p11-kit-0.26.6-r0: task do_fetch: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3199 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_create_recipe_spdx)
NOTE: Running task 3201 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_generate_toolchain_file)
NOTE: recipe cracklib-2.10.4-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_deploy_source_date_epoch unihash changed to d2197d192e44378c75256471e83cd0e5eb8bc7079e643ee02b2cb24d18102de9
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb:do_deploy_source_date_epoch unihash changed to 434518bd9449fe8b95033b791a24e9ed489779aebde00ad3f0c70c8ece9e0d8d
NOTE: recipe kmod-34.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libwpe-1.16.3-r0: task do_generate_toolchain_file: Started
NOTE: Setscene tasks completed
NOTE: Running task 3206 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_recipe_spdx)
NOTE: Running task 3207 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_create_recipe_spdx)
NOTE: Running task 3209 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.54.2.bb:do_recipe_qa)
NOTE: recipe orc-0.4.44-r0: task do_package: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 3210 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_install)
NOTE: recipe libwpe-1.16.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 3211 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_packagedata)
NOTE: Setscene tasks completed
NOTE: Running task 3212 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe webkitgtk-2.54.2-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.5.0-r0: task do_install: Started
NOTE: recipe orc-0.4.44-r0: task do_packagedata: Started
NOTE: recipe kmod-34.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3213 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb:do_create_spdx)
NOTE: recipe libtheora-1.2.0-r0: task do_package: Started
NOTE: recipe webkitgtk-2.54.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_create_spdx: Started
NOTE: Running task 3214 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.54.2.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3215 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx)
NOTE: Running task 3216 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_create_recipe_spdx)
NOTE: recipe webkitgtk-2.54.2-r0: task do_fetch: Started
NOTE: recipe orc-0.4.44-r0: task do_packagedata: Succeeded
NOTE: recipe webkitgtk-2.54.2-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_packagedata unihash changed to 47838d2a241d30fbda294be7bf51894b60b516c5a31fe23e537cd96ba414a86a
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_recipe_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 3217 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx)
NOTE: Running task 3249 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_recipe_qa)
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3259 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_create_recipe_spdx)
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.4.363.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3260 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_create_recipe_spdx)
NOTE: Running task 3266 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_deploy_source_date_epoch)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe eudev-3.3.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3267 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_fetch)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_fetch: Succeeded
NOTE: Running task 3269 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_unpack)
NOTE: recipe eudev-3.3.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3270 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_unpack)
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3271 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_unpack)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_configure: Succeeded
NOTE: Running task 3272 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_unpack)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_deploy_source_date_epoch unihash changed to baad68c3d6ab3a7dc5bb7639aa6093b9512eb1b4bf24fa2d53598018dd278bf4
NOTE: recipe appstream-1.2.3-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: Running task 3273 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_compile)
NOTE: recipe p11-kit-0.26.6-r0: task do_unpack: Started
NOTE: recipe enchant2-2.8.21-r0: task do_unpack: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_unpack: Started
NOTE: Running task 3274 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_unpack)
NOTE: recipe enchant2-2.8.21-r0: task do_unpack: Succeeded
NOTE: Running task 3275 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_unpack)
NOTE: recipe libsecret-0.21.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 3276 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_unpack)
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_unpack: Started
NOTE: recipe cracklib-2.10.4-r0: task do_unpack: Started
NOTE: recipe appstream-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_unpack: Succeeded
NOTE: Running task 3287 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_patch)
NOTE: Running task 3288 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_patch)
NOTE: recipe libxt-1_1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 3289 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_patch)
NOTE: recipe enchant2-2.8.21-r0: task do_patch: Started
NOTE: recipe appstream-1.2.3-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_patch: Started
NOTE: recipe enchant2-2.8.21-r0: task do_patch: Succeeded
NOTE: Running task 3290 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_patch)
NOTE: recipe appstream-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 3291 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_patch)
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_patch: Succeeded
NOTE: Running task 3312 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_write_config)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_patch: Started
NOTE: recipe util-linux-2.42.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3313 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_configure_ptest_base)
NOTE: recipe libxt-1_1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 3314 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.50.bb:do_create_spdx)
NOTE: recipe gtk+3-3.24.52-r0: task do_write_config: Started
NOTE: recipe util-linux-2.42.4-r0: task do_configure_ptest_base: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_patch: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_write_config: Succeeded
NOTE: Running task 3316 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_fetch)
NOTE: recipe wayland-protocols-1.50-r0: task do_create_spdx: Started
NOTE: Running task 3324 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_package)
NOTE: recipe cracklib-2.10.4-r0: task do_unpack: Succeeded
NOTE: Running task 3325 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_patch)
NOTE: recipe util-linux-2.42.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe desktop-file-utils-0.29-r0: task do_fetch: Started
NOTE: Running task 3326 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_compile)
NOTE: recipe desktop-file-utils-0.29-r0: task do_fetch: Succeeded
NOTE: Running task 3329 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_create_recipe_spdx)
NOTE: recipe readline-8.3-r0: task do_package: Started
NOTE: recipe cracklib-2.10.4-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe cracklib-2.10.4-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_compile: Started
NOTE: Running task 3330 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_create_recipe_spdx)
NOTE: recipe wayland-protocols-1.50-r0: task do_create_spdx: Succeeded
NOTE: Running task 3334 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_recipe_qa)
NOTE: recipe dbus-1.16.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libadwaita-1.10.0-r0: task do_recipe_qa: Started
NOTE: Running task 3335 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_recipe_qa)
NOTE: recipe gcr-4.4.1-r0: task do_recipe_qa: Started
NOTE: recipe dbus-1.16.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libadwaita-1.10.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3336 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.11.0.bb:do_recipe_qa)
NOTE: Running task 3337 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_recipe_qa)
NOTE: recipe p11-kit-0.26.6-r0: task do_unpack: Succeeded
NOTE: recipe libpwquality-1.4.5-r0: task do_recipe_qa: Started
NOTE: Running task 3338 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_patch)
NOTE: recipe libportal-0.11.0-r0: task do_recipe_qa: Started
NOTE: recipe gcr-4.4.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3339 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_fetch)
NOTE: recipe libxslt-1.1.45-r0: task do_compile: Succeeded
NOTE: Running task 3340 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_compile_ptest_base)
NOTE: recipe p11-kit-0.26.6-r0: task do_patch: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_fetch: Started
NOTE: recipe libpwquality-1.4.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libadwaita-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 3341 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_fetch)
NOTE: recipe libportal-0.11.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3342 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_fetch)
NOTE: Running task 3343 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.11.0.bb:do_fetch)
NOTE: recipe libxslt-1.1.45-r0: task do_compile_ptest_base: Started
NOTE: recipe p11-kit-0.26.6-r0: task do_patch: Succeeded
NOTE: Running task 3344 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.54.2.bb:do_unpack)
NOTE: recipe libpwquality-1.4.5-r0: task do_fetch: Started
NOTE: recipe flac-1.5.0-r0: task do_install: Succeeded
NOTE: recipe libportal-0.11.0-r0: task do_fetch: Started
NOTE: recipe gcr-4.4.1-r0: task do_fetch: Started
NOTE: recipe libtheora-1.2.0-r0: task do_package: Succeeded
NOTE: recipe gcr-4.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 3345 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 3346 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_package)
NOTE: Running task 3347 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata)
NOTE: recipe webkitgtk-2.54.2-r0: task do_unpack: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_package: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libpwquality-1.4.5-r0: task do_fetch: Succeeded
NOTE: recipe libportal-0.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 3360 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_create_recipe_spdx)
NOTE: Running task 3361 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3362 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_install)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata unihash changed to 3afaac1b77755e1581b5af9b7cb4c2e148501dc83fe9621bcb0396d424d20402
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.45-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_deploy_source_date_epoch unihash changed to cbccae34c513b169b504e9ecfd060ad98829342c701b852e9daef4139413c2af
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3363 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3364 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3365 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_recipe_spdx)
NOTE: Running task 3367 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_unpack: Started
NOTE: recipe aspell-0.60.8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_unpack: Succeeded
NOTE: Running task 3368 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe aspell-0.60.8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3369 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3370 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_deploy_source_date_epoch unihash changed to cece52fc4192d22dd5f98c5d5725ef652d90776be8573d642047b4825af5ceff
NOTE: recipe aspell-0.60.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Started
NOTE: Running task 3379 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_patch)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_patch: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3380 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_configure)
NOTE: recipe aspell-0.60.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3381 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_patch: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_configure: Started
NOTE: Running task 3383 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_create_recipe_spdx)
NOTE: recipe aspell-0.60.8.3-r0: task do_configure: Started
NOTE: recipe orc-0.4.44-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxslt-1.1.45-r0: task do_install: Succeeded
NOTE: Running task 3393 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.19.bb:do_create_spdx)
NOTE: recipe orc-0.4.44-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3405 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_unpack)
NOTE: recipe libpciaccess-0.19-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_unpack: Succeeded
NOTE: Running task 3408 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_patch)
NOTE: recipe desktop-file-utils-0.29-r0: task do_patch: Started
NOTE: recipe readline-8.3-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.19-r0: task do_create_spdx: Succeeded
NOTE: Running task 3409 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.29-r0: task do_patch: Succeeded
NOTE: Running task 3410 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.134.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.12.4-r0: task do_compile: Succeeded
NOTE: Running task 3411 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_compile_ptest_base)
NOTE: Running task 3415 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_recipe_spdx)
NOTE: recipe readline-8.3-r0: task do_packagedata: Started
NOTE: recipe libdrm-2.4.134-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3416 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_install)
NOTE: recipe readline-8.3-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.12.4-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata unihash changed to f5dbc25403e5b130954df844911ca814c3cebc57510e107d7b87bd310f1dab33
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3419 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx)
NOTE: Running task 3421 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_unpack)
NOTE: recipe libdrm-2.4.134-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx: Started
NOTE: Running task 3422 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_unpack)
NOTE: recipe libadwaita-1.10.0-r0: task do_unpack: Started
NOTE: recipe gcr-4.4.1-r0: task do_unpack: Started
NOTE: recipe gcr-4.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 3423 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.11.0.bb:do_unpack)
NOTE: recipe libadwaita-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 3424 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_unpack)
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libportal-0.11.0-r0: task do_unpack: Started
NOTE: Running task 3427 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_patch)
NOTE: recipe libpwquality-1.4.5-r0: task do_unpack: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_patch: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 3428 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_patch)
NOTE: recipe libgcrypt-1.12.4-r0: task do_install: Succeeded
NOTE: Running task 3429 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_install_ptest_base)
NOTE: recipe gcr-4.4.1-r0: task do_patch: Started
NOTE: recipe gcr-4.4.1-r0: task do_patch: Succeeded
NOTE: Running task 3431 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_recipe_spdx)
NOTE: recipe libgcrypt-1.12.4-r0: task do_install_ptest_base: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libportal-0.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 3432 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.11.0.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3433 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_create_recipe_spdx)
NOTE: recipe libpwquality-1.4.5-r0: task do_unpack: Succeeded
NOTE: Running task 3434 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_patch)
NOTE: recipe libportal-0.11.0-r0: task do_patch: Started
NOTE: recipe flac-1.5.0-r0: task do_package: Succeeded
NOTE: Running task 3435 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpwquality-1.4.5-r0: task do_patch: Started
NOTE: recipe libportal-0.11.0-r0: task do_patch: Succeeded
NOTE: Running task 3458 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.2.1.bb:do_create_spdx)
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3459 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_populate_sysroot)
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_create_spdx: Started
NOTE: recipe webkitgtk-2.54.2-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3460 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.54.2.bb:do_patch)
NOTE: recipe libxtst-1_1.2.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3462 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_create_recipe_spdx)
NOTE: recipe libgcrypt-1.12.4-r0: task do_populate_sysroot: Started
NOTE: recipe libpwquality-1.4.5-r0: task do_patch: Succeeded
NOTE: Running task 3463 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_write_config)
NOTE: recipe webkitgtk-2.54.2-r0: task do_patch: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_write_config: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata unihash changed to 3ab76aac9a18ae3486088962712cb05850309e0f6d62e15578b4c30d7fcc5d42
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.63.4-r0: task do_create_recipe_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 3465 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_configure)
NOTE: Running task 3484 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.14-r0: task do_compile: Succeeded
NOTE: Running task 3485 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_install)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_configure: Started
NOTE: recipe appstream-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_3.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.63.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3486 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 3487 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.14-r0: task do_install: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3488 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_deploy_source_date_epoch)
NOTE: recipe enchant2-2.8.21-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe p11-kit-0.26.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe appstream-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_deploy_source_date_epoch unihash changed to e3a713d88726d33a559b994f037140518b7f92220d9cdec248d6d7a065b5accf
NOTE: recipe libsecret-0.21.8.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: Running task 3489 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe webkitgtk-2.54.2-r0: task do_patch: Succeeded
NOTE: Running task 3490 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_deploy_source_date_epoch)
NOTE: recipe p11-kit-0.26.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe enchant2-2.8.21-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_deploy_source_date_epoch unihash changed to c66943ea142243c7f96423c60678a5b68641a25e5990ddf5cf2e49cefb82d531
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_deploy_source_date_epoch unihash changed to 1b8a3ceedaf70f1aac27a3c8562e926a59257a278f7982de696643faf8e0fadf
NOTE: recipe libsecret-0.21.8.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_deploy_source_date_epoch unihash changed to 66f80c63ce74826abbd6fc76aa968efb843b15f15755101ba8dd3971708a9e5d
NOTE: Running task 3491 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_deploy_source_date_epoch)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3493 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_deploy_source_date_epoch unihash changed to 5d777dd3a841efbdde7d2c97c82b9f69e402650819abe0b83f6ede472364f3da
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_deploy_source_date_epoch unihash changed to eddbe9043503a4a8992a873bd1b761f37c7a961bddedecb9a1206493b2a278c2
NOTE: recipe cracklib-2.10.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3500 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_write_config)
NOTE: Running task 3501 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_write_config)
NOTE: Running task 3502 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.61-r0: task do_package: Started
NOTE: recipe appstream-1.2.3-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.26.6-r0: task do_write_config: Started
NOTE: recipe p11-kit-0.26.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cracklib-2.10.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_configure: Succeeded
NOTE: recipe appstream-1.2.3-r0: task do_write_config: Succeeded
NOTE: recipe p11-kit-0.26.6-r0: task do_write_config: Succeeded
NOTE: Running task 3503 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_write_config)
NOTE: Running task 3504 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_compile)
NOTE: Running task 3505 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_write_config)
NOTE: Running task 3506 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_configure: Succeeded
NOTE: Running task 3507 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_compile)
NOTE: recipe libsecret-0.21.8.2-r0: task do_write_config: Started
NOTE: recipe tiff-4.7.2-r0: task do_compile: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_write_config: Started
NOTE: recipe cracklib-2.10.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_write_config: Succeeded
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_write_config: Succeeded
NOTE: Running task 3509 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_install_ptest_base)
NOTE: Running task 3514 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_recipe_spdx)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_compile: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_compile: Succeeded
NOTE: recipe libxslt-1.1.45-r0: task do_install_ptest_base: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3515 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_install)
NOTE: recipe cracklib-2.10.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3516 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_configure)
NOTE: recipe p11-kit-0.26.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_install: Started
NOTE: Running task 3517 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_configure)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_compile: Succeeded
NOTE: Running task 3518 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe cracklib-2.10.4-r0: task do_configure: Started
NOTE: Running task 3525 of 4601 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx)
NOTE: recipe p11-kit-0.26.6-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Started
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 3526 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_install)
NOTE: recipe update-rc.d-native-0.8+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 3527 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_install: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx: Started
NOTE: recipe libxslt-1.1.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3528 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 3529 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.17.bb:do_create_spdx)
NOTE: recipe fribidi-1.0.17-r0: task do_create_spdx: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3531 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_recipe_spdx)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe fribidi-1.0.17-r0: task do_create_spdx: Succeeded
NOTE: Running task 3532 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_create_recipe_spdx)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3533 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_recipe_spdx)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_install: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_install: Succeeded
NOTE: recipe at-spi2-core-2.62.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3534 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_recipe_spdx)
NOTE: Running task 3535 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.13-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3536 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_package)
NOTE: recipe libxv-1.0.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3537 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_recipe_spdx)
NOTE: recipe libtheora-1.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3540 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_package)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe nghttp2-1.71.0-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3542 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_51.3.bb:do_recipe_qa)
NOTE: recipe libwebp-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 3543 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot)
NOTE: recipe epiphany-51.3-r0: task do_recipe_qa: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3544 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_package)
NOTE: recipe libx11-1_1.8.14-r0: task do_install: Succeeded
NOTE: Running task 3545 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_populate_sysroot)
NOTE: recipe epiphany-51.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3546 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_package)
NOTE: recipe libwebp-1.6.0-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_package: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_compile: Succeeded
NOTE: Running task 3549 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_51.3.bb:do_fetch)
NOTE: Running task 3550 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_compile_ptest_base)
NOTE: recipe iso-codes-4.20.1-r0: task do_package: Succeeded
NOTE: recipe epiphany-51.3-r0: task do_fetch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_package unihash changed to f7f8feaaad9778114838f76677404df547757834097750ff4fd38405ebc3b1b8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_package_qa became valid
NOTE: recipe epiphany-51.3-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_compile_ptest_base: Started
NOTE: Running setscene task 1942 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 1946 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_package_qa_setscene)
NOTE: recipe iso-codes-4.20.1-r0: task do_package_qa_setscene: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_populate_sysroot: Succeeded
NOTE: Running setscene task 1947 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_package_write_deb_setscene)
NOTE: recipe iso-codes-4.20.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running task 3551 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe iso-codes-4.20.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running task 3552 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe iso-codes-4.20.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 1970 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_packagedata_setscene)
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3553 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_configure)
NOTE: recipe libxext-1_1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3554 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_configure)
NOTE: recipe nghttp2-1.71.0-r0: task do_package: Succeeded
NOTE: Running task 3555 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.13-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.61-r0: task do_package: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_configure: Started
NOTE: Running task 3556 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3558 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata)
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3559 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_configure)
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3560 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_configure)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.61-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_packagedata unihash changed to 74d99e26dfc8bf0742b20245c2289c6ab0fd6f5cd0dbcb81dc213c2d4cbb970c
NOTE: recipe p11-kit-0.26.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3561 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_compile)
NOTE: Running task 3562 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_package)
NOTE: recipe p11-kit-0.26.6-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_package: Started
NOTE: recipe aspell-0.60.8.3-r0: task do_configure: Succeeded
NOTE: Running task 3563 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_compile)
NOTE: recipe aspell-0.60.8.3-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_package: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3564 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_install)
NOTE: Running task 3565 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.42.4-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3566 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_package: Succeeded
NOTE: Running task 3567 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata)
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_configure: Succeeded
NOTE: Running task 3568 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_compile)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Started
NOTE: Running task 3570 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_recipe_spdx)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata unihash changed to d761e2aca5e6b40e87fb3a74d27702c393c1f15330da97c9185fb93079993174
NOTE: Setscene tasks completed
NOTE: Running task 3572 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_compile: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3573 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_packagedata)
NOTE: Running task 3574 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_install)
NOTE: recipe libfyaml-0.9.6-r0: task do_configure: Succeeded
NOTE: Running task 3575 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nghttp2-1.71.0-r0: task do_packagedata: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_deploy_source_date_epoch unihash changed to 06d31016eeab5ec1bb194be167286ca56884c793e61746ae02eeb02b3442d0ad
NOTE: Running task 3583 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_recipe_spdx)
NOTE: recipe nghttp2-1.71.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_packagedata unihash changed to 49a8a4192344a55eb53e37b4d881cd12ce79ec92c8c03048844e2012a7f67a9f
NOTE: Setscene tasks completed
NOTE: Running task 3586 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_create_recipe_spdx)
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libical-4.0.7-r0: task do_create_recipe_spdx: Started
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3590 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_recipe_spdx)
NOTE: recipe libical-4.0.7-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3591 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_create_recipe_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_install: Succeeded
NOTE: Running task 3592 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3630 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_compile: Succeeded
NOTE: Running task 3631 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_create_spdx)
NOTE: Running task 3632 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_write_config: Succeeded
NOTE: Running task 3637 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.5-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.7.2-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3638 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_deploy_source_date_epoch unihash changed to 6cd931437a05aa5322f01c7311b30cceb500c32850fba880c862aaa4ed15460c
NOTE: Setscene tasks completed
NOTE: Running task 3682 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_write_config)
NOTE: recipe desktop-file-utils-0.29-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_write_config: Succeeded
NOTE: recipe cracklib-2.10.4-r0: task do_configure: Succeeded
NOTE: Running task 3691 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_compile)
NOTE: Running task 3695 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_populate_sysroot)
NOTE: recipe util-linux-2.42.4-r0: task do_install: Succeeded
NOTE: Running task 3696 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_install_ptest_base)
NOTE: recipe libx11-1_1.8.14-r0: task do_package: Succeeded
NOTE: recipe cracklib-2.10.4-r0: task do_compile: Started
NOTE: recipe libxslt-1.1.45-r0: task do_populate_sysroot: Started
NOTE: Running task 3697 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_packagedata)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3698 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_configure)
NOTE: recipe util-linux-2.42.4-r0: task do_install_ptest_base: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_packagedata: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Started
NOTE: recipe libunistring-1.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3700 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libadwaita-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3701 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libadwaita-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_deploy_source_date_epoch unihash changed to d503a5c5e9be63ad78056d881089c0704e307edc6115f04f54ce8f82dc926680
NOTE: recipe libx11-1_1.8.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_packagedata unihash changed to b7f229641ee48cc90c3dc52c50afcf7ab632f80d5551dd18920d0f53feef2af0
NOTE: recipe gcr-4.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcr-4.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_deploy_source_date_epoch unihash changed to 68b930d888e1e4bd6f9e5dd360f72cbf9a69b592c8276a94af01bff068d669ec
NOTE: Setscene tasks completed
NOTE: Running task 3702 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package)
NOTE: Running task 3703 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.14.bb:do_create_spdx)
NOTE: Running task 3704 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.12.4-r0: task do_package: Succeeded
NOTE: Running task 3705 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_packagedata)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.14-r0: task do_create_spdx: Started
NOTE: recipe libportal-0.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_packagedata: Started
NOTE: recipe libportal-0.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.11.0.bb:do_deploy_source_date_epoch unihash changed to 4c4b80161d4ad3de61eb687d20fd47459c00e3306ef8ca73812fc690ed172559
NOTE: Running task 3706 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.54.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.12.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_packagedata unihash changed to 9b5352050159cfb9e3748bb5097dfce35bdacd1259166860731b4368c4e45f9e
NOTE: recipe webkitgtk-2.54.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Setscene tasks completed
NOTE: Running task 3707 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libpwquality-1.4.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.10.4-r0: task do_compile: Succeeded
NOTE: recipe webkitgtk-2.54.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3708 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx)
NOTE: Running task 3709 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_install)
NOTE: recipe aspell-0.60.8.3-r0: task do_compile: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3710 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_install)
NOTE: Running task 3711 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_populate_sysroot)
NOTE: recipe libpwquality-1.4.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_deploy_source_date_epoch unihash changed to 15ff4a02e43a8eba286e38e5bf4f6366cad2ff8ab4a6742f8480e1f39d2d5a12
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe cracklib-2.10.4-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3712 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_package)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_configure: Succeeded
NOTE: recipe aspell-0.60.8.3-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3713 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_compile)
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_compile: Started
NOTE: recipe util-linux-2.42.4-r0: task do_package: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libx11-1_1.8.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 3714 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx)
NOTE: Running task 3715 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_create_recipe_spdx)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_compile: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_create_recipe_spdx: Started
NOTE: Running task 3716 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_install)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_install: Started
NOTE: recipe libusb1-1.0.30-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3717 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_create_recipe_spdx)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3718 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_recipe_spdx)
NOTE: Running task 3719 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata)
NOTE: Running task 3720 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.88-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 3721 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.88-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3722 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-238-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3723 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata unihash changed to 50322b3b32d37b5cda9de5dc8db401125d8323e4d902f9a4608641c22ae6b73c
NOTE: recipe eudev-3.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3724 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx)
NOTE: Setscene tasks completed
NOTE: Running task 3725 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_populate_sysroot)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3726 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_configure)
NOTE: Running task 3727 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_configure)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3728 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_configure)
NOTE: recipe eudev-3.3.0-r0: task do_configure: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_configure: Started
NOTE: recipe cracklib-2.10.4-r0: task do_install: Succeeded
NOTE: Running task 3729 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_package)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3730 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe aspell-0.60.8.3-r0: task do_install: Succeeded
NOTE: Running task 3731 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_package: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe aspell-0.60.8.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3732 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_populate_sysroot)
NOTE: recipe cracklib-2.10.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3733 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_configure)
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3734 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_compile)
NOTE: recipe cracklib-2.10.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3735 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_recipe_spdx)
NOTE: recipe aspell-0.60.8.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3740 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_51.3.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.13-r0: task do_compile: Started
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe epiphany-51.3-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3741 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_compile)
NOTE: recipe sbc-2.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3746 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_write_config)
NOTE: recipe libxext-1_1.3.7-r0: task do_compile: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_write_config: Started
NOTE: recipe epiphany-51.3-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_install: Succeeded
NOTE: Running task 3747 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_write_config)
NOTE: recipe libadwaita-1.10.0-r0: task do_write_config: Succeeded
NOTE: Running task 3748 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_populate_sysroot)
NOTE: Running task 3749 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_package)
NOTE: recipe gcr-4.4.1-r0: task do_write_config: Started
NOTE: recipe tiff-4.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.7.2-r0: task do_package: Started
NOTE: recipe gcr-4.4.1-r0: task do_write_config: Succeeded
NOTE: Running task 3750 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.11.0.bb:do_write_config)
NOTE: recipe libxrender-1_0.9.13-r0: task do_compile: Succeeded
NOTE: Running task 3751 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_install)
NOTE: recipe libportal-0.11.0-r0: task do_write_config: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_package: Succeeded
NOTE: recipe libportal-0.11.0-r0: task do_write_config: Succeeded
NOTE: Running task 3752 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.54.2.bb:do_generate_toolchain_file)
NOTE: Running task 3753 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.13-r0: task do_install: Started
NOTE: recipe webkitgtk-2.54.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3754 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_compile)
NOTE: recipe webkitgtk-2.54.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 3755 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3758 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_package)
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Started
NOTE: recipe libpwquality-1.4.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3759 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_install)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_package: Started
NOTE: recipe libxdamage-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: recipe libxrender-1_0.9.13-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_packagedata unihash changed to e102d1f0164b40f38e986ddbdcad13354247d238320f91fdd901e606575bd506
NOTE: recipe libxext-1_1.3.7-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3760 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_populate_sysroot)
NOTE: Running task 3761 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_package)
NOTE: recipe libxshmfence-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 3762 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_install)
NOTE: recipe libxrender-1_0.9.13-r0: task do_populate_sysroot: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_package: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Started
NOTE: recipe libpwquality-1.4.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3763 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.7.bb:do_create_spdx)
NOTE: recipe libxext-1_1.3.7-r0: task do_install: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 3764 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_install)
NOTE: Running task 3765 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot: Started
NOTE: Running task 3766 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_package)
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_install: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_package: Started
NOTE: Running task 3767 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot)
NOTE: recipe libxdamage-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3768 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package)
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3769 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3770 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 3771 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3772 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3773 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_configure)
NOTE: Running task 3774 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_configure)
NOTE: recipe libxi-1_1.8.4-r0: task do_configure: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_configure: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_package unihash changed to 28004dd7be85adf981dfd7e9867554f060f5da403fbc2a6e977da594138fe5a4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata became valid
NOTE: Running setscene task 1970 of 1970 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_package: Succeeded
NOTE: Running task 3775 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_packagedata)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3776 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot)
NOTE: recipe libfyaml-0.9.6-r0: task do_compile: Succeeded
NOTE: Running task 3777 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxrender-1_0.9.13-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_configure: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Started
NOTE: Running task 3778 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_compile)
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_compile: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_packagedata unihash changed to ddcc542c70bfadca4e5b1848043c860f241b91bf59b6d3012864d7db559fb77b
NOTE: recipe libxv-1.0.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3779 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_configure)
NOTE: Running task 3780 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3781 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxshmfence-1.3.3-r0: task do_package: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_configure: Started
NOTE: recipe tiff-4.7.2-r0: task do_package: Succeeded
NOTE: recipe libxext-1_1.3.7-r0: task do_package: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3782 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata)
NOTE: Running task 3783 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata)
NOTE: Running task 3784 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.13.bb:do_create_spdx)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3785 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_compile)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata: Started
NOTE: recipe libxrender-1_0.9.13-r0: task do_create_spdx: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_compile: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3786 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_configure)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_configure: Succeeded
NOTE: Running task 3787 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_compile)
NOTE: recipe libxext-1_1.3.7-r0: task do_packagedata: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_packagedata unihash changed to cedec786a93706dbbe3bd5da2b801727c5f8fa2209715e33d88585fc91080592
NOTE: recipe libxrender-1_0.9.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata unihash changed to 1505f2d1cb512082e14405baa1571027753bfcda99371510f6045424eb5de57d
NOTE: Setscene tasks completed
NOTE: Running task 3788 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_install)
NOTE: Running task 3789 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_configure)
NOTE: Running task 3790 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.7.bb:do_create_spdx)
NOTE: Running task 3791 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3792 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_install: Started
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3793 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_install: Started
NOTE: recipe sbc-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3794 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_configure)
NOTE: recipe libxext-1_1.3.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3795 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_package)
NOTE: recipe sbc-2.2-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3796 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_install: Succeeded
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Started
NOTE: Running task 3797 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_populate_sysroot)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_install: Succeeded
NOTE: Running task 3798 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_populate_sysroot)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3799 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3800 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xrandr-1_1.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_configure: Succeeded
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3801 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_package)
NOTE: Running task 3802 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_configure)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3803 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_configure)
NOTE: recipe xrandr-1_1.5.4-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_configure: Succeeded
NOTE: Running task 3804 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_package)
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_configure: Succeeded
NOTE: Running task 3805 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_compile: Started
NOTE: recipe libxrandr-1_1.5.5-r0: task do_package: Succeeded
NOTE: Running task 3806 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata)
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 3807 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_compile)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_configure: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3808 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_compile)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_packagedata unihash changed to 307c9d7aceda9cfc36e3794e4c6a74916ea6b1ed962fc3e9828afd84df4c6521
NOTE: recipe libxinerama-1_1.1.6-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_compile: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3809 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata)
NOTE: Running task 3810 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata)
NOTE: recipe xrandr-1_1.5.4-r0: task do_configure: Succeeded
NOTE: Running task 3811 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_install)
NOTE: Setscene tasks completed
NOTE: Running task 3812 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_compile)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_compile: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata: Started
NOTE: Running task 3813 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3814 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.5.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_packagedata unihash changed to 28a1cdd353c391635ce34720176180eb43e7a4702c6a2bdcf8339b480d19b7d8
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 3815 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_install)
NOTE: recipe libfyaml-0.9.6-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3816 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_packagedata)
NOTE: Running task 3817 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_populate_sysroot)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_install: Succeeded
NOTE: recipe tiff-4.7.2-r0: task do_packagedata: Started
NOTE: Running task 3818 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_populate_sysroot)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe icu-79.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3819 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_install)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe icu-79.1-r0: task do_install: Started
NOTE: recipe tiff-4.7.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3820 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3821 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_package)
NOTE: recipe libfyaml-0.9.6-r0: task do_install: Succeeded
NOTE: Running task 3822 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_populate_sysroot)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3823 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_package: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_compile: Succeeded
NOTE: recipe libfyaml-0.9.6-r0: task do_populate_sysroot: Started
NOTE: Running task 3824 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_install)
NOTE: recipe libxt-1_1.3.1-r0: task do_compile: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_install: Started
NOTE: recipe eudev-3.3.0-r0: task do_configure: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_compile: Succeeded
NOTE: Running task 3825 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_compile)
NOTE: Running task 3826 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_install)
NOTE: recipe libfyaml-0.9.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3827 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb:do_create_spdx)
NOTE: recipe eudev-3.3.0-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx: Started
NOTE: recipe libxxf86vm-1_1.1.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3828 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx)
NOTE: recipe fontconfig-2.18.3-r0: task do_install: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Started
NOTE: Running task 3829 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_populate_sysroot)
NOTE: recipe fontconfig-2.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_install: Succeeded
NOTE: Running task 3830 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_populate_sysroot)
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3831 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_package)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_package: Succeeded
NOTE: Running task 3832 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata)
NOTE: recipe libxi-1_1.8.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3833 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_compile)
NOTE: recipe xrandr-1_1.5.4-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_package: Succeeded
NOTE: recipe libxi-1_1.8.4-r0: task do_compile: Started
NOTE: Running task 3834 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_packagedata)
NOTE: recipe fontconfig-2.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3835 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata: Started
NOTE: recipe sbc-2.2-r0: task do_configure: Succeeded
NOTE: Running task 3836 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_compile)
NOTE: recipe xrandr-1_1.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3837 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_packagedata unihash changed to 557825633e891b4406bae0c65017711b358808bc9154caf1825b394054d107ab
NOTE: recipe sbc-2.2-r0: task do_compile: Started
NOTE: Setscene tasks completed
NOTE: Running task 3838 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_51.3.bb:do_patch)
NOTE: recipe libpwquality-1.4.5-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_packagedata: Succeeded
NOTE: Running task 3849 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb:do_create_spdx)
NOTE: recipe epiphany-51.3-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3850 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_configure)
NOTE: recipe epiphany-51.3-r0: task do_patch: Succeeded
NOTE: Running task 3851 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_package)
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_package: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3852 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_install)
NOTE: recipe libxt-1_1.3.1-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.48-r0: task do_create_spdx: Succeeded
NOTE: Running task 3853 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_package)
NOTE: recipe libxv-1.0.13-r0: task do_configure: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3854 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_compile)
NOTE: Running task 3855 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_packagedata)
NOTE: recipe aspell-0.60.8.3-r0: task do_package: Started
NOTE: recipe libxv-1.0.13-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8.4-r0: task do_compile: Succeeded
NOTE: Running task 3856 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_install)
NOTE: recipe xrandr-1_1.5.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_packagedata unihash changed to 1edada1301449a804b840cd8aca2d1f536cd5eab24c7b733b18c735d693c13c4
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Succeeded
NOTE: recipe libxi-1_1.8.4-r0: task do_install: Started
NOTE: Setscene tasks completed
NOTE: Running task 3857 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_compile)
NOTE: recipe icu-79.1-r0: task do_install: Succeeded
NOTE: Running task 3858 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.4.bb:do_create_spdx)
NOTE: Running task 3859 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_install_ptest_base)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Started
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_spdx: Started
NOTE: recipe icu-79.1-r0: task do_install_ptest_base: Started
NOTE: recipe sbc-2.2-r0: task do_compile: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3860 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_install)
NOTE: Running task 3861 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.13-r0: task do_compile: Succeeded
NOTE: Running task 3862 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_install)
NOTE: recipe sbc-2.2-r0: task do_install: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8.4-r0: task do_install: Succeeded
NOTE: recipe xrandr-1_1.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_install: Started
NOTE: Running task 3863 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_populate_sysroot)
NOTE: Running task 3864 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_package)
NOTE: recipe libxi-1_1.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8.4-r0: task do_package: Started
NOTE: recipe icu-79.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3865 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_populate_sysroot)
NOTE: recipe sbc-2.2-r0: task do_install: Succeeded
NOTE: recipe icu-79.1-r0: task do_populate_sysroot: Started
NOTE: Running task 3866 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_package)
NOTE: recipe libxt-1_1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3867 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.9-r0: task do_configure: Succeeded
NOTE: Running task 3868 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_compile)
NOTE: recipe icu-79.1-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3869 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_install)
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Started
NOTE: recipe libxv-1.0.13-r0: task do_install: Succeeded
NOTE: recipe libxi-1_1.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3870 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3871 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3872 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_package)
NOTE: recipe libxtst-1_1.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3873 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_configure)
NOTE: recipe libxv-1.0.13-r0: task do_package: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxtst-1_1.2.6-r0: task do_configure: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3874 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_package)
NOTE: Running task 3875 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot)
NOTE: recipe sbc-2.2-r0: task do_package: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe icu-79.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3876 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package)
NOTE: recipe libxft-1_2.3.9-r0: task do_compile: Succeeded
NOTE: Running task 3877 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_install)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_package: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Started
NOTE: Running task 3878 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.2.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3879 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_install)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_spdx: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3880 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_configure: Succeeded
NOTE: Running task 3881 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_configure_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_configure_ptest_base: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3882 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_compile)
NOTE: Running task 3883 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3884 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_package)
NOTE: recipe libxkbcommon-1.13.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3885 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.9.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_compile: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_install: Succeeded
NOTE: Running task 3886 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.28.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3887 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3888 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.7.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.7.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3889 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_recipe_spdx)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3901 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxi-1_1.8.4-r0: task do_package: Succeeded
NOTE: Running task 3902 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_packagedata)
NOTE: recipe libfyaml-0.9.6-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.8.4-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3903 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_spdx)
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_packagedata unihash changed to aee5614ed11dc643f9761a45871a3646e796786646126b420c48e8390bf1ffed
NOTE: recipe mesa-2_26.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3904 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: Running task 3905 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_packagedata unihash changed to 3d1dd0e741bfa2b6f0192f05b215a360c6bc629fdb60b81816e75cab6438bc04
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 3906 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.4.bb:do_create_spdx)
NOTE: recipe mesa-2_26.2.4-r0: task do_rust_create_wrappers: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_package: Succeeded
NOTE: recipe libxi-1_1.8.4-r0: task do_create_spdx: Started
NOTE: Running task 3907 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: Running task 3908 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata)
NOTE: recipe libidn2-2.3.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 3909 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb:do_create_spdx)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_configure: Started
NOTE: recipe sbc-2.2-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_create_spdx: Started
NOTE: Running task 3910 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 3914 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3918 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_package)
NOTE: recipe sbc-2.2-r0: task do_packagedata: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata unihash changed to ad1b096047aafdb9e84a7d2ae61164a84e87f31500ef08eaacaa49ccdf96b027
NOTE: recipe libxslt-1.1.45-r0: task do_package: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3919 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_package)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Succeeded
NOTE: Running task 3920 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_packagedata)
NOTE: Running task 3921 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata)
NOTE: recipe cracklib-2.10.4-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe sbc-2.2-r0: task do_packagedata: Succeeded
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_packagedata: Started
NOTE: Running task 3922 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.3.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_packagedata unihash changed to 170fd6d071016811b3202fb1d671b769f9404773ca1e0110ab1cce473351eb0a
NOTE: recipe alsa-lib-1.2.16.1-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe kmod-34.3-r0: task do_create_spdx: Started
NOTE: Running task 3925 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_recipe_spdx)
NOTE: Running task 3926 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_recipe_spdx)
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Started
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_packagedata: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata unihash changed to dd5f9b4d30e291294c502f6fbd1229d4477c565d65f049294cc405ad638642f0
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_packagedata unihash changed to 5c4df3e6e166ba8994945af5fa9985245427bdf656ce91d1977bc1ae070af192
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libgpg-error-1.61-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe kmod-34.3-r0: task do_create_spdx: Succeeded
NOTE: recipe aspell-0.60.8.3-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3927 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb:do_create_spdx)
NOTE: Running task 3928 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_packagedata)
NOTE: Running task 3931 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.24.1.bb:do_create_recipe_spdx)
NOTE: Running task 3942 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.44.bb:do_create_spdx)
NOTE: Running task 3946 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_51.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3947 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_create_spdx: Started
NOTE: recipe aspell-0.60.8.3-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.24.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe orc-0.4.44-r0: task do_create_spdx: Started
NOTE: recipe epiphany-51.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe epiphany-51.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.12.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3948 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_recipe_spdx)
NOTE: recipe gtk4-4.24.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3949 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-loader-1.4.363.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3953 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_create_recipe_spdx)
NOTE: Running task 3962 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.7.bb:do_create_spdx)
NOTE: recipe libwpe-1.16.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe nghttp2-1.71.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe orc-0.4.44-r0: task do_create_spdx: Succeeded
NOTE: recipe aspell-0.60.8.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3975 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_packagedata unihash changed to 711599f437e662f29cbce0f2c40e8fab686e004f220b4e0271532aef206fa457
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx: Started
NOTE: recipe flac-1.5.0-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 3980 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_spdx)
NOTE: recipe libwpe-1.16.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe nghttp2-1.71.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 3990 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx)
NOTE: Running task 3993 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_51.3.bb:do_write_config)
NOTE: Running task 3999 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb:do_write_config)
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Started
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_write_config: Started
NOTE: recipe epiphany-51.3-r0: task do_write_config: Started
NOTE: recipe libxcomposite-1_0.4.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 4000 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_create_recipe_spdx)
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_write_config: Succeeded
NOTE: Running task 4009 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_fetch)
NOTE: recipe epiphany-51.3-r0: task do_write_config: Succeeded
NOTE: Running task 4011 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe gtk+3-3.24.52-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_fetch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 4014 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_create_spdx)
NOTE: recipe libpsl-0.23.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4016 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_create_recipe_spdx)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Succeeded
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx: Started
NOTE: Running task 4020 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_spdx)
NOTE: recipe flac-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4021 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx)
NOTE: recipe libpwquality-1.4.5-r0: task do_configure: Succeeded
NOTE: recipe libsoup-3.8.1-r0: task do_create_recipe_spdx: Started
NOTE: Running task 4022 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_compile)
NOTE: recipe gtk+3-3.24.52-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4023 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx)
NOTE: recipe curl-8.23.0-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Started
NOTE: Running task 4024 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_spdx)
NOTE: recipe libpwquality-1.4.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libsoup-3.8.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4025 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_spdx)
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4027 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_create_recipe_spdx)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4028 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_create_recipe_spdx)
NOTE: Running task 4032 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_create_recipe_spdx)
NOTE: recipe libfyaml-0.9.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_create_recipe_spdx: Started
NOTE: recipe aspell-0.60.8.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxmlb-0.3.30-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe aspell-0.60.8.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4049 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 4054 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx)
NOTE: Running task 4055 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.2.bb:do_create_spdx)
NOTE: Running task 4056 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.2.bb:do_create_spdx)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe p11-kit-0.26.6-r0: task do_compile: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 4057 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.6.bb:do_create_spdx)
NOTE: Running task 4058 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_install)
NOTE: recipe readline-8.3-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.2-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.7.2-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe p11-kit-0.26.6-r0: task do_install: Started
NOTE: recipe sbc-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4059 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_unpack)
NOTE: recipe readline-8.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4061 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 4070 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_create_recipe_spdx)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 4071 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_patch)
NOTE: recipe appstream-1.2.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 4072 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_create_recipe_spdx)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_patch: Started
NOTE: recipe p11-kit-0.26.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_patch: Succeeded
NOTE: Running task 4073 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_create_recipe_spdx)
NOTE: recipe tiff-4.7.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 4074 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_create_recipe_spdx)
NOTE: recipe appstream-1.2.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4075 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_recipe_spdx)
NOTE: recipe enchant2-2.8.21-r0: task do_create_recipe_spdx: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe p11-kit-0.26.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4076 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_recipe_spdx)
NOTE: recipe libxslt-1.1.45-r0: task do_create_recipe_spdx: Started
NOTE: recipe enchant2-2.8.21-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4077 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_create_recipe_spdx)
NOTE: recipe p11-kit-0.26.6-r0: task do_install: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libsecret-0.21.8.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4079 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_create_recipe_spdx)
NOTE: Running task 4080 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_populate_sysroot)
NOTE: Running task 4081 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_package)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 4082 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe cracklib-2.10.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxslt-1.1.45-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe p11-kit-0.26.6-r0: task do_populate_sysroot: Started
NOTE: Running task 4086 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe p11-kit-0.26.6-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 4087 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4090 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_spdx)
NOTE: recipe cracklib-2.10.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_patch: Started
NOTE: Running task 4091 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.61.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 4092 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_spdx)
NOTE: recipe util-linux-2.42.4-r0: task do_package: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 4093 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb:do_create_spdx)
NOTE: recipe libcap-2.78-r0: task do_create_spdx: Started
NOTE: Running task 4094 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_packagedata)
NOTE: recipe libgpg-error-1.61-r0: task do_create_spdx: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx: Started
NOTE: recipe nghttp2-1.71.0-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata: Started
NOTE: recipe p11-kit-0.26.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4104 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_create_recipe_spdx)
NOTE: recipe curl-8.23.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4106 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_create_recipe_spdx)
NOTE: recipe libarchive-3.8.11-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-2.78-r0: task do_create_spdx: Succeeded
NOTE: Running task 4107 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.10.0.bb:do_create_recipe_spdx)
NOTE: recipe nghttp2-1.71.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4108 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_create_recipe_spdx)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 4109 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_create_recipe_spdx)
NOTE: recipe libadwaita-1.10.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gcr-4.4.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe cracklib-2.10.4-r0: task do_package: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_create_recipe_spdx: Started
NOTE: Running task 4110 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_packagedata)
NOTE: recipe libgpg-error-1.61-r0: task do_create_spdx: Succeeded
NOTE: Running task 4111 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.4.bb:do_create_spdx)
NOTE: recipe libarchive-3.8.11-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4112 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.11.0.bb:do_create_recipe_spdx)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4113 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.54.2.bb:do_create_recipe_spdx)
NOTE: recipe cracklib-2.10.4-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_create_spdx: Started
NOTE: recipe libportal-0.11.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libadwaita-1.10.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4115 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_create_recipe_spdx)
NOTE: recipe json-glib-1.10.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gcr-4.4.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe webkitgtk-2.54.2-r0: task do_create_recipe_spdx: Started
NOTE: Running task 4116 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_create_recipe_spdx)
NOTE: Running task 4117 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_create_recipe_spdx)
NOTE: recipe desktop-file-utils-0.29-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpwquality-1.4.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe nettle-4.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpwquality-1.4.5-r0: task do_compile: Succeeded
NOTE: Running task 4118 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_install)
NOTE: recipe util-linux-2.42.4-r0: task do_packagedata: Succeeded
NOTE: recipe libportal-0.11.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4119 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_package)
NOTE: Running task 4120 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_spdx)
NOTE: recipe libpwquality-1.4.5-r0: task do_install: Started
NOTE: recipe webkitgtk-2.54.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4121 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_package)
NOTE: recipe desktop-file-utils-0.29-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe nettle-4.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe cracklib-2.10.4-r0: task do_packagedata: Succeeded
NOTE: recipe libpwquality-1.4.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4135 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4136 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4139 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4169 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_create_spdx)
NOTE: recipe fontconfig-2.18.3-r0: task do_package: Started
NOTE: recipe eudev-3.3.0-r0: task do_compile: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_create_spdx: Started
NOTE: Running task 4170 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_install)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_package: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.3.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.12.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 4177 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch unihash changed to 978df0107c05e288b5f7a85e28c3874509d2ca71fa49325684142195ae592377
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_deploy_source_date_epoch unihash changed to dcd508773370b3066102df3537a1279eaf76f66e47ba7d95ed7df8bc8cb7ced1
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4178 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 4182 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libfyaml/libfyaml_0.9.6.bb:do_create_spdx)
NOTE: Running task 4186 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/aspell/aspell_0.60.8.3.bb:do_create_spdx)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libfyaml-0.9.6-r0: task do_create_spdx: Started
NOTE: recipe aspell-0.60.8.3-r0: task do_create_spdx: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_deploy_source_date_epoch unihash changed to f5018c1d74075ca6488db3948f99941cb21fba5d090cb8e3dab4e08c35b4cef2
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4187 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_configure)
NOTE: Running task 4190 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/cracklib/cracklib_2.10.4.bb:do_create_spdx)
NOTE: recipe libxslt-1.1.45-r0: task do_package: Succeeded
NOTE: Running task 4191 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_packagedata)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_configure: Started
NOTE: recipe libxtst-1_1.2.6-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4192 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_compile)
NOTE: recipe cracklib-2.10.4-r0: task do_create_spdx: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4193 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_configure)
NOTE: recipe libfyaml-0.9.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxslt-1.1.45-r0: task do_packagedata: Started
NOTE: Running task 4194 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_configure: Succeeded
NOTE: recipe libxtst-1_1.2.6-r0: task do_compile: Started
NOTE: Running task 4195 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_compile)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_compile: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 4196 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_compile)
NOTE: recipe libxslt-1.1.45-r0: task do_packagedata: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_packagedata unihash changed to 82425ed6364da08a38f74aaf07b1fb767ddba51d574d264593e3a584990a5144
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4197 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.45.bb:do_create_spdx)
NOTE: recipe aspell-0.60.8.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 4198 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_install)
NOTE: Running task 4199 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_create_spdx)
NOTE: recipe cracklib-2.10.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4203 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_51.3.bb:do_create_recipe_spdx)
NOTE: recipe libxslt-1.1.45-r0: task do_create_spdx: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe libarchive-3.8.11-r0: task do_create_spdx: Started
NOTE: recipe epiphany-51.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libxtst-1_1.2.6-r0: task do_compile: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 4204 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4205 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: Running task 4206 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_create_spdx)
NOTE: recipe icu-79.1-r0: task do_package: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxtst-1_1.2.6-r0: task do_install: Started
NOTE: recipe epiphany-51.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 4207 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_packagedata)
NOTE: recipe nettle-4.0-r0: task do_create_spdx: Started
NOTE: Running task 4211 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_package_write_rpm)
NOTE: recipe eudev-3.3.0-r0: task do_install: Succeeded
NOTE: Running task 4212 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_populate_sysroot)
NOTE: recipe icu-79.1-r0: task do_packagedata: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_package_write_rpm: Started
NOTE: recipe eudev-3.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot unihash changed to c6001af82ac700d093b7fee47bb0ea454e37f398c73cfcf64d1b80c14b8360ac
NOTE: Setscene tasks completed
NOTE: Running task 4213 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_package)
NOTE: recipe icu-79.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxtst-1_1.2.6-r0: task do_install: Succeeded
NOTE: Running task 4214 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_79.1.bb:do_create_spdx)
NOTE: recipe eudev-3.3.0-r0: task do_package: Started
NOTE: Running task 4215 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.6-r0: task do_populate_sysroot: Started
NOTE: recipe icu-79.1-r0: task do_create_spdx: Started
NOTE: recipe libpwquality-1.4.5-r0: task do_install: Succeeded
NOTE: Running task 4216 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_package)
NOTE: recipe libxslt-1.1.45-r0: task do_create_spdx: Succeeded
NOTE: Running task 4217 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_package)
NOTE: recipe libxtst-1_1.2.6-r0: task do_package: Started
NOTE: recipe eudev-3.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe fontconfig-2.18.3-r0: task do_package: Succeeded
NOTE: Running task 4218 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpwquality-1.4.5-r0: task do_package: Started
NOTE: Running task 4219 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 4220 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_packagedata: Started
NOTE: recipe libpwquality-1.4.5-r0: task do_populate_sysroot: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_packagedata unihash changed to ef11958882dedf8ded6c725b1834f500278b2c3822df07eb3b40e96d5b25a444
NOTE: recipe libarchive-3.8.11-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4223 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_configure)
NOTE: Running task 4224 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_package)
NOTE: Running task 4225 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_install)
NOTE: recipe libusb1-1.0.30-r0: task do_configure: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_install: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_configure: Succeeded
NOTE: recipe libpwquality-1.4.5-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4226 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe mesa-2_26.2.4-r0: task do_compile: Started
NOTE: recipe util-linux-2.42.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4227 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.18.3.bb:do_create_spdx)
NOTE: recipe fontconfig-2.18.3-r0: task do_create_spdx: Started
NOTE: recipe libxt-1_1.3.1-r0: task do_package: Succeeded
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_install: Succeeded
NOTE: Running task 4228 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata)
NOTE: Running task 4229 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_package)
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package: Started
NOTE: recipe fontconfig-2.18.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_packagedata unihash changed to 3222643feec08c1080d5b4d86bade167ecf3b04dd068db7d3f90ed35a5742932
NOTE: Setscene tasks completed
NOTE: Running task 4230 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxt_1.3.1.bb:do_create_spdx)
NOTE: recipe p11-kit-0.26.6-r0: task do_package: Succeeded
NOTE: Running task 4231 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_packagedata)
NOTE: recipe icu-79.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx: Started
NOTE: recipe p11-kit-0.26.6-r0: task do_packagedata: Started
NOTE: recipe iso-codes-4.20.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.20.1.bb:do_package_write_rpm unihash changed to f11d029c73b742ffe89c0333a074dd999b6905fc82e01e6a6f3d52e5542bf264
NOTE: recipe libxt-1_1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe p11-kit-0.26.6-r0: task do_packagedata: Succeeded
NOTE: Running task 4232 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/p11-kit/p11-kit_0.26.6.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.6-r0: task do_package: Succeeded
NOTE: Running task 4233 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_packagedata)
NOTE: recipe p11-kit-0.26.6-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.6-r0: task do_packagedata: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_package: Succeeded
NOTE: Running task 4234 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata)
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_package: Succeeded
NOTE: Running task 4235 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.6-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_packagedata unihash changed to 4f5795407a6b772b49836d5477f349da5537d19c61cbd92b793071f463f4c79e
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Started
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 4236 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.6-r0: task do_create_spdx: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata unihash changed to 352ea6327267c9a73bc2c5944d7fff9a010011b70735c0f79d93ca368adc557f
NOTE: recipe python3-dbusmock-0.38.1-r0: task do_packagedata: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4237 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_create_spdx)
NOTE: recipe p11-kit-0.26.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_create_spdx: Succeeded
NOTE: recipe eudev-3.3.0-r0: task do_package: Succeeded
NOTE: Running task 4238 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_packagedata)
NOTE: recipe eudev-3.3.0-r0: task do_packagedata: Started
NOTE: recipe eudev-3.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_packagedata unihash changed to 0363d382686161245e9f7470b293cb9a9f8ed4a0e15e4fe4d5b9cc4e3026ebd4
NOTE: recipe libpwquality-1.4.5-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4239 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.3.0.bb:do_create_spdx)
NOTE: Running task 4240 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_packagedata)
NOTE: recipe eudev-3.3.0-r0: task do_create_spdx: Started
NOTE: recipe libpwquality-1.4.5-r0: task do_packagedata: Started
NOTE: recipe libpwquality-1.4.5-r0: task do_packagedata: Succeeded
NOTE: Running task 4241 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libpwquality/libpwquality_1.4.5.bb:do_create_spdx)
NOTE: recipe eudev-3.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libpwquality-1.4.5-r0: task do_create_spdx: Started
NOTE: recipe libpwquality-1.4.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.30-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4242 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_configure_ptest_base)
NOTE: recipe libusb1-1.0.30-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.30-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4243 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_compile)
NOTE: recipe libusb1-1.0.30-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.30-r0: task do_compile: Succeeded
NOTE: Running task 4244 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_compile_ptest_base)
NOTE: recipe libusb1-1.0.30-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.30-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4245 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_install)
NOTE: recipe libusb1-1.0.30-r0: task do_install: Started
NOTE: recipe libusb1-1.0.30-r0: task do_install: Succeeded
NOTE: Running task 4246 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_install_ptest_base)
NOTE: recipe libusb1-1.0.30-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.30-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4247 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_populate_sysroot)
NOTE: Running task 4248 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_package)
NOTE: recipe libusb1-1.0.30-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.30-r0: task do_package: Started
NOTE: recipe libusb1-1.0.30-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_compile: Succeeded
NOTE: Running task 4249 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4250 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_install: Started
NOTE: recipe libusb1-1.0.30-r0: task do_package: Succeeded
NOTE: Running task 4251 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_packagedata)
NOTE: recipe libusb1-1.0.30-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.30-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_packagedata unihash changed to 09b0312ad7b12d0696e9c35e6623a768a300f7ea093d0614eb7acce90500e55f
NOTE: Setscene tasks completed
NOTE: Running task 4252 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.30.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.30-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.30-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_install: Succeeded
NOTE: Running task 4253 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4254 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_populate_sysroot)
NOTE: Running task 4255 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_package)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4256 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4257 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4258 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4259 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4260 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4261 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4262 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4263 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4264 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4265 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe cairo-1.18.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4266 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4267 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.16.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 4268 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe enchant2-2.8.21-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4269 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe cairo-1.18.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe enchant2-2.8.21-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4270 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_configure)
NOTE: recipe json-glib-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4271 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_configure)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4272 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_configure)
NOTE: recipe vala-0.56.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4273 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_configure)
NOTE: Running task 4274 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_configure)
NOTE: Running task 4275 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_configure)
NOTE: Running task 4276 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_configure)
NOTE: recipe enchant2-2.8.21-r0: task do_configure: Started
NOTE: Running task 4277 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: Running task 4278 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_configure)
NOTE: recipe cairo-1.18.6-r0: task do_configure: Started
NOTE: Running task 4279 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_configure)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_configure: Started
NOTE: Running task 4280 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_configure)
NOTE: recipe vala-0.56.19-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_configure: Started
NOTE: recipe libgudev-238-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe dbus-1.16.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_configure: Started
NOTE: Running task 4281 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_configure: Started
NOTE: recipe dbus-1.16.4-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_configure: Succeeded
NOTE: Running task 4282 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_compile)
NOTE: recipe desktop-file-utils-0.29-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_configure: Succeeded
NOTE: Running task 4283 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_compile)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_configure: Succeeded
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_configure: Succeeded
NOTE: Running task 4284 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_compile)
NOTE: Running task 4285 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_compile: Succeeded
NOTE: Running task 4286 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_install)
NOTE: recipe desktop-file-utils-0.29-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_compile: Succeeded
NOTE: Running task 4287 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_install: Started
NOTE: recipe json-glib-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 4288 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.10.8-r0: task do_configure_ptest_base: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_configure: Succeeded
NOTE: Running task 4289 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_configure_ptest_base)
NOTE: recipe json-glib-1.10.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4290 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_compile)
NOTE: recipe desktop-file-utils-0.29-r0: task do_install: Succeeded
NOTE: recipe libxmlb-0.3.30-r0: task do_configure_ptest_base: Started
NOTE: Running task 4291 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.10.8-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4292 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_compile)
NOTE: recipe desktop-file-utils-0.29-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 4293 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.29-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4294 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-238-r0: task do_compile: Succeeded
NOTE: Running task 4295 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_install)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_compile: Succeeded
NOTE: Running task 4296 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_install)
NOTE: recipe libgudev-238-r0: task do_install: Started
NOTE: recipe cairo-1.18.6-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_install: Started
NOTE: Running task 4297 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_compile)
NOTE: recipe cairo-1.18.6-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_install: Succeeded
NOTE: Running task 4298 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 4299 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_configure: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: Running task 4300 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.16.4-r0: task do_configure: Succeeded
NOTE: Running task 4301 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.4-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4302 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_compile)
NOTE: recipe dbus-1.16.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4303 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_compile)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_compile: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.16.4-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_install: Succeeded
NOTE: Running task 4304 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_populate_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_populate_sysroot: Started
NOTE: Running task 4305 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4306 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe json-glib-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 4307 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-glib-1.10.8-r0: task do_compile_ptest_base: Started
NOTE: recipe json-glib-1.10.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4308 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_install)
NOTE: recipe libxmlb-0.3.30-r0: task do_compile: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_install: Started
NOTE: Running task 4309 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_compile_ptest_base)
NOTE: recipe libxmlb-0.3.30-r0: task do_compile_ptest_base: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4310 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_configure)
NOTE: recipe libxmlb-0.3.30-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4311 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_install)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_configure: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 4312 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe json-glib-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 4313 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_install_ptest_base)
NOTE: recipe json-glib-1.10.8-r0: task do_install_ptest_base: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_install: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4314 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_install_ptest_base)
NOTE: Running task 4315 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: recipe libxmlb-0.3.30-r0: task do_install_ptest_base: Started
NOTE: Running task 4316 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe json-glib-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4317 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_populate_sysroot)
NOTE: recipe dbus-1.16.4-r0: task do_compile: Succeeded
NOTE: recipe libxmlb-0.3.30-r0: task do_populate_sysroot: Started
NOTE: Running task 4318 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.16.4-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.16.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4319 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_install)
NOTE: recipe cairo-1.18.6-r0: task do_compile: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4320 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_install)
NOTE: recipe dbus-1.16.4-r0: task do_install: Started
NOTE: recipe cairo-1.18.6-r0: task do_install: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_configure: Succeeded
NOTE: Running task 4321 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_compile)
NOTE: recipe vala-0.56.19-r0: task do_compile: Started
NOTE: recipe cairo-1.18.6-r0: task do_install: Succeeded
NOTE: Running task 4322 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_populate_sysroot)
NOTE: recipe cairo-1.18.6-r0: task do_populate_sysroot: Started
NOTE: recipe cairo-1.18.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4323 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-15.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.4-r0: task do_install: Succeeded
NOTE: Running task 4324 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_install_ptest_base)
NOTE: recipe dbus-1.16.4-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.16.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4325 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_populate_sysroot)
NOTE: recipe dbus-1.16.4-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_configure: Succeeded
NOTE: Running task 4326 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_configure_ptest_base)
NOTE: recipe harfbuzz-15.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4327 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_configure_ptest_base: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4328 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_compile: Started
NOTE: recipe dbus-1.16.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4329 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4330 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_configure)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_configure: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_configure: Succeeded
NOTE: Running task 4331 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_compile)
NOTE: recipe harfbuzz-15.0.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package: Succeeded
NOTE: Running task 4332 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_packagedata: Succeeded
NOTE: Running task 4333 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_package)
NOTE: Running task 4334 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_package)
NOTE: Running task 4335 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_create_spdx)
NOTE: Running task 4336 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_package)
NOTE: Running task 4337 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_package)
NOTE: Running task 4338 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 4339 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_package)
NOTE: Running task 4340 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_package)
NOTE: recipe cairo-1.18.6-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package: Started
NOTE: Running task 4341 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_package)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.16.4-r0: task do_package: Started
NOTE: recipe libgudev-238-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_compile: Succeeded
NOTE: Running task 4342 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_compile_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_compile_ptest_base: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_configure: Succeeded
NOTE: Running task 4343 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4344 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_install)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_compile: Succeeded
NOTE: Running task 4345 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4346 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_install)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_install: Succeeded
NOTE: Running task 4347 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_install_ptest_base)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_install_ptest_base: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_package: Succeeded
NOTE: recipe libgudev-238-r0: task do_package: Succeeded
NOTE: Running task 4348 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_packagedata)
NOTE: Running task 4349 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4350 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: Running task 4351 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.29-r0: task do_packagedata: Started
NOTE: recipe libgudev-238-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata: Succeeded
NOTE: Running task 4352 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_package)
NOTE: recipe desktop-file-utils-0.29-r0: task do_packagedata: Succeeded
NOTE: Running task 4353 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_packagedata unihash changed to 72a2b2c4f9775121a2fca75e285ea85d81484e5da6b4f9cde6aa9669e57ec017
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_install: Succeeded
NOTE: Running task 4354 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata unihash changed to 995f4cc03ddac8f212de20e8cb717c833454289116dfc276c5b4e7e865210c98
NOTE: recipe libgudev-238-r0: task do_create_spdx: Started
NOTE: recipe json-glib-1.10.8-r0: task do_package: Started
NOTE: Setscene tasks completed
NOTE: Running task 4355 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_install_ptest_base)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: Running task 4356 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libxmlb-0.3.30-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4357 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb:do_create_spdx)
NOTE: Running task 4358 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_install_ptest_base: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_create_spdx: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx: Succeeded
NOTE: Running task 4359 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_populate_sysroot)
NOTE: Running task 4360 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_package)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.29-r0: task do_create_spdx: Succeeded
NOTE: recipe libxmlb-0.3.30-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_packagedata unihash changed to 269763b3d583c971c5be424851beeee3279a5c2941448cc90c51ddd3a9d1e0f3
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4361 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb:do_create_spdx)
NOTE: recipe cairo-1.18.6-r0: task do_package: Succeeded
NOTE: Running task 4362 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_packagedata)
NOTE: recipe libxmlb-0.3.30-r0: task do_create_spdx: Started
NOTE: recipe cairo-1.18.6-r0: task do_packagedata: Started
NOTE: recipe cairo-1.18.6-r0: task do_packagedata: Succeeded
NOTE: Running task 4363 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.6.bb:do_create_spdx)
NOTE: recipe enchant2-2.8.21-r0: task do_configure: Succeeded
NOTE: Running task 4364 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_compile)
NOTE: recipe cairo-1.18.6-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.8.21-r0: task do_compile: Started
NOTE: recipe libxmlb-0.3.30-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cairo-1.18.6-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.62.1-r0: task do_compile: Succeeded
NOTE: Running task 4365 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_package: Succeeded
NOTE: Running task 4366 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_install: Started
NOTE: recipe dbus-1.16.4-r0: task do_package: Succeeded
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_packagedata: Started
NOTE: Running task 4367 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_packagedata)
NOTE: recipe dbus-1.16.4-r0: task do_packagedata: Started
NOTE: recipe dbus-1.16.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_packagedata unihash changed to 3fb9a02a74b018b8da5b4dd8fe8912173b1d80f998d80e701f6cc5db77234c27
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 4368 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.4.bb:do_create_spdx)
NOTE: Running task 4369 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_packagedata unihash changed to 9a184fe00b896a8ceaa7ea56c56dea5d1315e1070d6a70ef0ed708e43e77b54d
NOTE: Setscene tasks completed
NOTE: Running task 4370 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: Running task 4371 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_package_write_ipk)
NOTE: recipe dbus-1.16.4-r0: task do_create_spdx: Started
NOTE: Running task 4372 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_package_write_deb)
NOTE: Running task 4373 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_package_write_rpm)
NOTE: Running task 4374 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_package_qa)
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_create_spdx: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_package_write_ipk: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_package_write_rpm: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_package_write_deb: Started
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_package_qa: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to fe6ab9f54931f59b317dc784001792a64bdb0c48ff5965d381df357037b2071b
NOTE: Setscene tasks completed
NOTE: recipe at-spi2-core-2.62.1-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4375 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_populate_sysroot)
NOTE: Running task 4376 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_package)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_populate_sysroot: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_package: Started
NOTE: recipe dbus-1.16.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_create_spdx: Succeeded
NOTE: recipe enchant2-2.8.21-r0: task do_compile: Succeeded
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_package_qa: Succeeded
NOTE: Running task 4377 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_package_qa unihash changed to 0aed905954c6140413289a254330bb8ee8c96117b5342c0910123b86de7292ff
NOTE: recipe enchant2-2.8.21-r0: task do_install: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_package_write_deb unihash changed to a54e7bfd87677ffbb263db7b2ebdd46b4f3fa662eed84a9e4e0574734ce35dd3
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_package_write_ipk unihash changed to 986152ea761b1b5badf92df6dc0c698bd8cabd742c678587d6c9a056a4c386e5
NOTE: recipe gsettings-desktop-schemas-51.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_51.0.bb:do_package_write_rpm unihash changed to f8e0d20de44d194f49863dc151d4285036bb45bb43abb7d33b713c3e5248af60
NOTE: recipe enchant2-2.8.21-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_package: Succeeded
NOTE: Running task 4378 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_populate_sysroot)
NOTE: Running task 4379 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_package)
NOTE: Running task 4380 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_packagedata)
NOTE: recipe enchant2-2.8.21-r0: task do_populate_sysroot: Started
NOTE: recipe enchant2-2.8.21-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_packagedata: Started
NOTE: recipe enchant2-2.8.21-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.5.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_packagedata unihash changed to 9fb0c8f788c34081d5b194806900e7bf9e749d028ecc5adf3fd2e46fc5a861da
NOTE: Setscene tasks completed
NOTE: Running task 4381 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_package)
NOTE: Running task 4382 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.5.1.bb:do_create_spdx)
NOTE: Running task 4383 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_packagedata)
NOTE: Running task 4384 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_package_write_ipk)
NOTE: Running task 4385 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_package_write_deb)
NOTE: Running task 4386 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_package_write_rpm)
NOTE: Running task 4387 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_package_qa)
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_spdx: Started
NOTE: recipe json-glib-1.10.8-r0: task do_packagedata: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_write_deb: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_qa: Started
NOTE: recipe json-glib-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_packagedata unihash changed to 46208a07ccb530b4959275a4b2a509a4c56f5e473a5db9e8488852ca19de4d90
NOTE: Setscene tasks completed
NOTE: Running task 4388 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_create_spdx)
NOTE: recipe json-glib-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe json-glib-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe enchant2-2.8.21-r0: task do_package: Succeeded
NOTE: Running task 4389 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_packagedata)
NOTE: recipe enchant2-2.8.21-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe enchant2-2.8.21-r0: task do_packagedata: Succeeded
NOTE: Running task 4390 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/enchant/enchant2_2.8.21.bb:do_create_spdx)
NOTE: recipe enchant2-2.8.21-r0: task do_create_spdx: Started
NOTE: recipe enchant2-2.8.21-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_package: Succeeded
NOTE: Running task 4391 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_packagedata: Succeeded
NOTE: Running task 4392 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.9.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_package: Succeeded
NOTE: Running task 4393 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_packagedata)
NOTE: recipe at-spi2-core-2.62.1-r0: task do_packagedata: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_packagedata: Succeeded
NOTE: Running task 4394 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.62.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.28.9-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.62.1-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.62.1-r0: task do_create_spdx: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_compile: Succeeded
NOTE: Running task 4395 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_install)
NOTE: recipe vala-0.56.19-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_package: Succeeded
NOTE: Running task 4396 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_packagedata)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_packagedata: Started
NOTE: recipe vala-0.56.19-r0: task do_install: Succeeded
NOTE: Running task 4397 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_populate_sysroot)
NOTE: Running task 4398 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_package)
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_packagedata: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_packagedata unihash changed to 8a9d9b573cd9e661cae8a9f38b5f4ac803897e37c462cd735817c32fa2298b87
NOTE: Setscene tasks completed
NOTE: Running task 4399 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.8.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_create_spdx: Started
NOTE: recipe vala-0.56.19-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4400 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4401 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4402 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4403 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4404 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libical-4.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe appstream-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsoup-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcr-4.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_compile: Succeeded
NOTE: Running task 4405 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_install)
NOTE: recipe mesa-2_26.2.4-r0: task do_install: Started
NOTE: recipe libical-4.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsecret-0.21.8.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_qa: Succeeded
NOTE: Running task 4406 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_configure)
NOTE: recipe appstream-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4407 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_configure)
NOTE: recipe gcr-4.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_package_qa unihash changed to c78106c456e7d886aed937357c21fb1758368d225d24f1096a3394468ebcaf49
NOTE: Running task 4408 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_configure)
NOTE: Running task 4409 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_configure)
NOTE: recipe gdk-pixbuf-2.44.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 4410 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_configure)
NOTE: recipe libical-4.0.7-r0: task do_configure: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_configure: Started
NOTE: recipe libsoup-3.8.1-r0: task do_configure: Started
NOTE: recipe appstream-1.2.3-r0: task do_configure: Started
NOTE: recipe gcr-4.4.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.90.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe mesa-2_26.2.4-r0: task do_install: Succeeded
NOTE: Running task 4411 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot)
NOTE: Running task 4412 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_package)
NOTE: recipe mesa-2_26.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_package: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4413 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4414 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4415 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwpe-1.16.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.19-r0: task do_package: Succeeded
NOTE: Running task 4416 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_packagedata)
NOTE: recipe libwpe-1.16.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.19-r0: task do_packagedata: Started
NOTE: Running task 4417 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_configure)
NOTE: recipe libglu-2_9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4418 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4419 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: recipe libwpe-1.16.3-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe vala-0.56.19-r0: task do_packagedata: Succeeded
NOTE: Running task 4420 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.19.bb:do_create_spdx)
NOTE: recipe vala-0.56.19-r0: task do_create_spdx: Started
NOTE: recipe gcr-4.4.1-r0: task do_configure: Succeeded
NOTE: Running task 4421 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_compile)
NOTE: recipe libsecret-0.21.8.2-r0: task do_configure: Succeeded
NOTE: recipe gcr-4.4.1-r0: task do_compile: Started
NOTE: Running task 4422 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_compile)
NOTE: recipe libsecret-0.21.8.2-r0: task do_compile: Started
NOTE: recipe appstream-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 4423 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_compile)
NOTE: recipe appstream-1.2.3-r0: task do_compile: Started
NOTE: recipe vala-0.56.19-r0: task do_create_spdx: Succeeded
NOTE: recipe libsoup-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 4424 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_configure_ptest_base)
NOTE: recipe libwpe-1.16.3-r0: task do_configure: Succeeded
NOTE: Running task 4425 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_compile)
NOTE: recipe libsoup-3.8.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libwpe-1.16.3-r0: task do_compile: Started
NOTE: recipe libsoup-3.8.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4426 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_compile)
NOTE: recipe libsoup-3.8.1-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.3-r0: task do_compile: Succeeded
NOTE: Running task 4427 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_install)
NOTE: recipe libwpe-1.16.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 4428 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_compile)
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.3-r0: task do_install: Succeeded
NOTE: Running task 4429 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_populate_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 4430 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libwpe-1.16.3-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe libwpe-1.16.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mesa-2_26.2.4-r0: task do_package: Succeeded
NOTE: Running task 4431 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata)
NOTE: recipe mesa-2_26.2.4-r0: task do_packagedata: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata unihash changed to c55cec98725ea869b050ef988e51da7e03e149e4e2686f35380111e94c4cd2df
NOTE: Setscene tasks completed
NOTE: Running task 4432 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx)
NOTE: Running task 4433 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_package)
NOTE: recipe libwpe-1.16.3-r0: task do_package: Started
NOTE: recipe mesa-2_26.2.4-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4434 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_install)
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_26.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 4435 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_install)
NOTE: recipe libsecret-0.21.8.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_install: Succeeded
NOTE: Running task 4436 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot)
NOTE: Running task 4437 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_package)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Started
NOTE: recipe libwpe-1.16.3-r0: task do_package: Succeeded
NOTE: Running task 4438 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsecret-0.21.8.2-r0: task do_install: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_packagedata: Started
NOTE: Running task 4439 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_populate_sysroot)
NOTE: Running task 4440 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_package)
NOTE: recipe libsecret-0.21.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_package: Started
NOTE: recipe libwpe-1.16.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_packagedata unihash changed to e9334caf0eb52260dc2785a61c77c8a8a58110a4fe7f8dd485dbf076597bc97c
NOTE: Setscene tasks completed
NOTE: Running task 4441 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/libwpe_1.16.3.bb:do_create_spdx)
NOTE: recipe libical-4.0.7-r0: task do_configure: Succeeded
NOTE: Running task 4442 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_compile)
NOTE: recipe libwpe-1.16.3-r0: task do_create_spdx: Started
NOTE: recipe libical-4.0.7-r0: task do_compile: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwpe-1.16.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gcr-4.4.1-r0: task do_compile: Succeeded
NOTE: Running task 4443 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_install)
NOTE: recipe gcr-4.4.1-r0: task do_install: Started
NOTE: recipe appstream-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 4444 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_install)
NOTE: recipe appstream-1.2.3-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_package: Succeeded
NOTE: Running task 4445 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata)
NOTE: recipe gcr-4.4.1-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Started
NOTE: Running task 4446 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_package)
NOTE: Running task 4447 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_populate_sysroot)
NOTE: recipe gcr-4.4.1-r0: task do_package: Started
NOTE: recipe gcr-4.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata unihash changed to aecbdc64eabe7dfc57559fb717b1b125c6553d619501b3482160fa3d07dd37a5
NOTE: Setscene tasks completed
NOTE: Running task 4448 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx)
NOTE: recipe appstream-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 4449 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Started
NOTE: Running task 4450 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_package)
NOTE: recipe appstream-1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe appstream-1.2.3-r0: task do_package: Started
NOTE: recipe gcr-4.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libsoup-3.8.1-r0: task do_compile: Succeeded
NOTE: Running task 4451 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_compile_ptest_base)
NOTE: recipe libsoup-3.8.1-r0: task do_compile_ptest_base: Started
NOTE: recipe appstream-1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsoup-3.8.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4452 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_install)
NOTE: recipe libsoup-3.8.1-r0: task do_install: Started
NOTE: recipe libsoup-3.8.1-r0: task do_install: Succeeded
NOTE: Running task 4453 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_install_ptest_base)
NOTE: recipe libsoup-3.8.1-r0: task do_install_ptest_base: Started
NOTE: recipe libsoup-3.8.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4454 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_populate_sysroot)
NOTE: Running task 4455 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_package)
NOTE: recipe libsoup-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe libsoup-3.8.1-r0: task do_package: Started
NOTE: recipe libsoup-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsecret-0.21.8.2-r0: task do_package: Succeeded
NOTE: Running task 4456 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_packagedata)
NOTE: recipe libsecret-0.21.8.2-r0: task do_packagedata: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_packagedata unihash changed to 0dba3099917f745a9a9343c13079017057dbd3e0642072f50d148a55dba1f868
NOTE: Setscene tasks completed
NOTE: Running task 4457 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.21.8.2.bb:do_create_spdx)
NOTE: recipe libsecret-0.21.8.2-r0: task do_create_spdx: Started
NOTE: recipe libsecret-0.21.8.2-r0: task do_create_spdx: Succeeded
NOTE: recipe appstream-1.2.3-r0: task do_package: Succeeded
NOTE: Running task 4458 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_packagedata)
NOTE: recipe appstream-1.2.3-r0: task do_packagedata: Started
NOTE: recipe appstream-1.2.3-r0: task do_packagedata: Succeeded
NOTE: Running task 4459 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/appstream/appstream_1.2.3.bb:do_create_spdx)
NOTE: recipe appstream-1.2.3-r0: task do_create_spdx: Started
NOTE: recipe gcr-4.4.1-r0: task do_package: Succeeded
NOTE: Running task 4460 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_packagedata)
NOTE: recipe gcr-4.4.1-r0: task do_packagedata: Started
NOTE: recipe appstream-1.2.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4461 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe gcr-4.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: Running task 4462 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.1.bb:do_create_spdx)
NOTE: recipe gcr-4.4.1-r0: task do_create_spdx: Started
NOTE: recipe libical-4.0.7-r0: task do_compile: Succeeded
NOTE: Running task 4463 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_install)
NOTE: recipe libical-4.0.7-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 4464 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 4465 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe libical-4.0.7-r0: task do_install: Succeeded
NOTE: Running task 4466 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_populate_sysroot)
NOTE: Running task 4467 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_package)
NOTE: recipe gcr-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libical-4.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe libical-4.0.7-r0: task do_package: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4468 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-4.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4469 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.88-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4470 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_configure)
NOTE: recipe libsoup-3.8.1-r0: task do_package: Succeeded
NOTE: Running task 4471 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_configure: Started
NOTE: recipe bluez5-5.88-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsoup-3.8.1-r0: task do_packagedata: Started
NOTE: Running task 4472 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_configure)
NOTE: recipe bluez5-5.88-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Running task 4473 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_compile: Succeeded
NOTE: Running task 4474 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_install)
NOTE: recipe libsoup-3.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 4475 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.8.1.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-15.0.0-r0: task do_install: Started
NOTE: recipe libsoup-3.8.1-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata unihash changed to 52e2c8598920f060377eb17c810c14330c34f7c8b61626cbcb2f98dc5cc5f86c
NOTE: Setscene tasks completed
NOTE: Running task 4476 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-15.0.0-r0: task do_install: Succeeded
NOTE: Running task 4477 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_populate_sysroot)
NOTE: Running task 4478 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_package)
NOTE: recipe libsoup-3.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-15.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_package: Started
NOTE: recipe libical-4.0.7-r0: task do_package: Succeeded
NOTE: Running task 4479 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_packagedata)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4480 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_compile)
NOTE: recipe libical-4.0.7-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_compile: Started
NOTE: recipe libical-4.0.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_packagedata unihash changed to db412bd3aafb0a82f90a231fc8c5db81cca5dcd187499d195dc40bcc039c8cde
NOTE: recipe harfbuzz-15.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4481 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4482 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_4.0.7.bb:do_create_spdx)
NOTE: recipe pango-1.58.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libical-4.0.7-r0: task do_create_spdx: Started
NOTE: recipe libical-4.0.7-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.58.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4483 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_configure)
NOTE: recipe pango-1.58.2-r0: task do_configure: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_compile: Succeeded
NOTE: Running task 4484 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_install)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_install: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_install: Succeeded
NOTE: Running task 4485 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_populate_sysroot)
NOTE: Running task 4486 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_package)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_populate_sysroot: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_package: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-15.0.0-r0: task do_package: Succeeded
NOTE: Running task 4487 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_packagedata)
NOTE: recipe harfbuzz-15.0.0-r0: task do_packagedata: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_package: Succeeded
NOTE: recipe harfbuzz-15.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 4488 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_packagedata)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_packagedata unihash changed to 43ea55e3ea485e4d2dd4a30babbef4f6f8c9f3ae5aeddf75d908ed12eb57a735
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 4489 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_15.0.0.bb:do_create_spdx)
NOTE: recipe harfbuzz-15.0.0-r0: task do_create_spdx: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_packagedata unihash changed to c3b597bb7486218f51dc86e172302636c333d4eaff7ef5c828343848b1b4627f
NOTE: Setscene tasks completed
NOTE: Running task 4490 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/wpebackend-fdo_1.16.1.bb:do_create_spdx)
NOTE: recipe pango-1.58.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4491 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_compile)
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_create_spdx: Started
NOTE: recipe pango-1.58.2-r0: task do_compile: Started
NOTE: recipe bluez5-5.88-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4492 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.88-r0: task do_configure_ptest_base: Started
NOTE: recipe wpebackend-fdo-1.16.1-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.88-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4493 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_compile)
NOTE: recipe bluez5-5.88-r0: task do_compile: Started
NOTE: recipe harfbuzz-15.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.58.2-r0: task do_compile: Succeeded
NOTE: Running task 4494 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_install)
NOTE: recipe pango-1.58.2-r0: task do_install: Started
NOTE: recipe bluez5-5.88-r0: task do_compile: Succeeded
NOTE: Running task 4495 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.88-r0: task do_compile_ptest_base: Started
NOTE: recipe pango-1.58.2-r0: task do_install: Succeeded
NOTE: Running task 4496 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_populate_sysroot)
NOTE: Running task 4497 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_package)
NOTE: recipe pango-1.58.2-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.58.2-r0: task do_package: Started
NOTE: recipe pango-1.58.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4498 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4499 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 4500 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.63.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4501 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4502 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_configure)
NOTE: recipe librsvg-2.63.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4503 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_rust_create_wrappers)
NOTE: recipe gtk+3-3.24.52-r0: task do_configure: Started
NOTE: recipe librsvg-2.63.4-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.63.4-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 4504 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_configure)
NOTE: recipe librsvg-2.63.4-r0: task do_configure: Started
NOTE: recipe pango-1.58.2-r0: task do_package: Succeeded
NOTE: Running task 4505 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_packagedata)
NOTE: recipe pango-1.58.2-r0: task do_packagedata: Started
NOTE: recipe pango-1.58.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_packagedata unihash changed to 276f0d2e368a9164a106dc94708b24311a149cc38207263211b9de86f6ca4355
NOTE: Setscene tasks completed
NOTE: Running task 4506 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.58.2.bb:do_create_spdx)
NOTE: recipe pango-1.58.2-r0: task do_create_spdx: Started
NOTE: recipe pango-1.58.2-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.63.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4507 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_configure_ptest_base)
NOTE: recipe librsvg-2.63.4-r0: task do_configure_ptest_base: Started
NOTE: recipe librsvg-2.63.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 4508 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.63.4.bb:do_compile)
NOTE: recipe librsvg-2.63.4-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4509 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_compile)
NOTE: recipe gtk+3-3.24.52-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4510 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_compile: Started
NOTE: recipe bluez5-5.88-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 4511 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_install)
NOTE: recipe bluez5-5.88-r0: task do_install: Started
NOTE: recipe bluez5-5.88-r0: task do_install: Succeeded
NOTE: Running task 4512 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.88-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.88-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 4513 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_populate_sysroot)
NOTE: Running task 4514 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_package)
NOTE: recipe bluez5-5.88-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.88-r0: task do_package: Started
NOTE: recipe bluez5-5.88-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_compile: Succeeded
NOTE: Running task 4515 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_install: Started
NOTE: recipe bluez5-5.88-r0: task do_package: Succeeded
NOTE: Running task 4516 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_packagedata)
NOTE: recipe bluez5-5.88-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.88-r0: task do_packagedata: Succeeded
NOTE: Running task 4517 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.88.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_install: Succeeded
NOTE: Running task 4518 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_populate_sysroot)
NOTE: Running task 4519 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_package)
NOTE: recipe bluez5-5.88-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bluez5-5.88-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk+3-3.24.52-r0: task do_compile: Succeeded
NOTE: Running task 4520 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_install)
NOTE: recipe gtk+3-3.24.52-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_install: Succeeded
NOTE: Running task 4521 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_populate_sysroot)
NOTE: Running task 4522 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.52.bb:do_package)
NOTE: recipe gtk+3-3.24.52-r0: task do_populate_sysroot: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.52-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 4524 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb:do_configure)
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_package: Succeeded
NOTE: Running task 4525 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_packagedata: Succeeded
NOTE: Running task 4526 of 4601 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.9.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.28.9-r0: task do_create_spdx: Succeeded
NOTE: recipe adwaita-icon-theme-51.0-r0: task do_configure: Failed
NOTE: recipe gtk+3-3.24.52-r0: task do_package: Succeeded
NOTE: recipe librsvg-2.63.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 4526 tasks of which 2915 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261120064304.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261120064304.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/51.0/temp/log.do_configure.2452124
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: adwaita-icon-theme-51.0-r0 do_configure: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:extend_recipe_sysroot(d)
     0003:
File: '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/classes-global/staging.bbclass', lineno: 619, function: extend_recipe_sysroot
     0615:                    if "/bin/" in l or "/sbin/" in l:
     0616:                        # defer /*bin/* files until last in case they need libs
     0617:                        binfiles[l] = (targetdir, dest)
     0618:                    else:
 *** 0619:                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
     0620:
     0621:    # Handle deferred binfiles
     0622:    for l in binfiles:
     0623:        (targetdir, dest) = binfiles[l]
File: '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/classes-global/staging.bbclass', lineno: 164, function: staging_copyfile
     0160:        os.symlink(linkto, dest)
     0161:        #bb.warn(c)
     0162:    else:
     0163:        try:
 *** 0164:            os.link(c, dest)
     0165:        except OSError as err:
     0166:            if err.errno == errno.EXDEV:
     0167:                bb.utils.copyfile(c, dest)
     0168:            else:
Exception: FileExistsError: [Errno 17] File exists: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-components/cortexa15t2hf-neon/bsd-headers/usr/include/sys/cdefs.h' -> '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/51.0/recipe-sysroot/usr/include/sys/cdefs.h'

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/all-poky-linux/adwaita-icon-theme/51.0/temp/log.do_configure.2452124
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb:do_configure) failed with exit code '1'

--===============3033345445754651784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="epiphany-changelog.txt"

51.3 - November 19, 2026
========================

--===============3033345445754651784==--
