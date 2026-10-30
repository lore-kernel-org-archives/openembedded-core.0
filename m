Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6187.1793344582988990220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ddPRrCcl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xOAzX6Ra;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a18baab13e-088c9d1f-b789-4530-9722-4961281e3edb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793344582;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=rSEsR3XtSC2W4vcibGtOTKj9fOheD77VkQj+rfBL8Ls=;
	b=ddPRrCcleHAyvtBeJjnPimOoboBPOc16W+EblwBRYWHv5hcW5xEqr6GsnnzaqMQQ
	TpYaaTRIsAE6JNtRbjFNR8fmstry9vMQdhMfJi0J/kYIETUubnYH0pFRp616P1DLvSv
	DgtBb1g8TssFJD6o8huaTdNQpSDMpqtuaYamwvws=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793344582;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=rSEsR3XtSC2W4vcibGtOTKj9fOheD77VkQj+rfBL8Ls=;
	b=xOAzX6RajyzFK713PA/m1Kh41hufMLGzBeILZ/yGl9Em27ZleEVkevrKL2aDgds0
	TofmZgiW0jx+Aib4WPLmnO2rNEPlGquQOF9CVN1528gTmDKwjkLaUbi3tDrAmuBE8NJ
	QJ+HxlTo3YazLcGb7wx3OA015/+WFBSjnwui6WTo=
Content-Type: multipart/mixed; boundary="===============4084640555852114590=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 51.2 SUCCEEDED
Message-ID: <010101a18baab13e-088c9d1f-b789-4530-9722-4961281e3edb-000000@us-west-2.amazonses.com>
Date: Fri, 30 Oct 2026 07:16:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.30-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248999

--===============4084640555852114590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *51.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-51.1-51.2.patch
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
From 1d3e654b75cd724786fa1bdff3c66a4a11fee093 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 30 Oct 2026 07:09:36 +0000
Subject: [PATCH] epiphany: upgrade 51.1 -> 51.2

51.2 - October 29, 2026
=======================
---
 .../epiphany/{epiphany_51.1.bb => epiphany_51.2.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_51.1.bb => epiphany_51.2.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_51.1.bb b/meta/recipes-gnome/epiphany/epiphany_51.2.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_51.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_51.2.bb
index cf1f69dfd2..317477bc89 100644
--- a/meta/recipes-gnome/epiphany/epiphany_51.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_51.2.bb
@@ -32,7 +32,7 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "beb93b3b86b763092a1175b6e505789b7613071c0dc1ad56cac1979fe879e9dd"
+SRC_URI[archive.sha256sum] = "e45d93483d62beeb26b36b39fe2f8cb5511ffe6ddccc7fedff55b1e3cc0a5c30"
 
 export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index b697b5f640..480d0ac0c0 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 20c45cb379ee910b89175019388df1a63b01c0d4 Mon Sep 17 00:00:00 2001
+From fe7d60b87a1d42f130047701d55bf4e20715e6dd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index 28a961323a..0d858fa637 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 82196d415819d517d8cba2142600be279e499540 Mon Sep 17 00:00:00 2001
+From de382c002231a61cb140cdd3e29d6190c853e54f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index 65324e5..2e70ef0 100644
+index 767a34b..d4dccf6 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 491ff35ea2..22f8755e7f 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From 84c26f054ab3520d06febc2e8a99502d2cff98cf Mon Sep 17 00:00:00 2001
+From 3dd7ad6d9540b722716064740d055bd2eb4dce1f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.47.1


--===============4084640555852114590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 10997480 to 10996600 (-0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-dbg: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-dev: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-doc: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ab: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PKGSIZE changed from 136892 to 136613 (-0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-fy: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ia: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ie: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kab: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lo: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lo: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PKGSIZE changed from 4380 to 8008 (+83%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-my: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-my: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PKGSIZE changed from 73713 to 93771 (+27%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PKGSIZE changed from 90782 to 90768 (-0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 32693968 to 32694825 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: FILELIST: directory renamed /usr/src/debug/epiphany/51.1/src -> /usr/src/debug/epiphany/51.2/src, directory renamed /usr/src/debug/epiphany/51.1/lib -> /usr/src/debug/epiphany/51.2/lib, directory renamed /usr/src/debug/epiphany/51.1/src/webextension -> /usr/src/debug/epiphany/51.2/src/webextension, directory renamed /usr/src/debug/epiphany/51.1/src/search-provider -> /usr/src/debug/epiphany/51.2/src/search-provider, directory renamed /usr/src/debug/epiphany/51.1/lib/history -> /usr/src/debug/epiphany/51.2/lib/history, directory renamed /usr/src/debug/epiphany/51.1/lib/contrib -> /usr/src/debug/epiphany/51.2/lib/contrib, directory renamed /usr/src/debug/epiphany/51.1/lib/sync -> /usr/src/debug/epiphany/51.2/lib/sync, directory renamed /usr/src/debug/epiphany/51.1/src/webapp-provider -> /usr/src/debug/epiphany/51.2/src/webapp-provider, directory renamed /usr/src/debug/epiphany/51.1/embed -> /usr/src/debug/epiphany/51.2/embed, directo
 ry renamed /usr/src/debug/epiphany/51.1/src/webextension/api -> /usr/src/debug/epiphany/51.2/src/webextension/api, directory renamed /usr/src/debug/epiphany/51.1/src/bookmarks -> /usr/src/debug/epiphany/51.2/src/bookmarks, directory renamed /usr/src/debug/epiphany/51.1/src/preferences -> /usr/src/debug/epiphany/51.2/src/preferences, directory renamed /usr/src/debug/epiphany/51.1/lib/autofill -> /usr/src/debug/epiphany/51.2/lib/autofill, directory renamed /usr/src/debug/epiphany/51.1/third-party/gvdb -> /usr/src/debug/epiphany/51.2/third-party/gvdb, directory renamed /usr/src/debug/epiphany/51.1/src/profile-migrator -> /usr/src/debug/epiphany/51.2/src/profile-migrator, directory renamed /usr/src/debug/epiphany/51.1/third-party -> /usr/src/debug/epiphany/51.2/third-party, directory renamed /usr/src/debug/epiphany/51.1/embed/web-process-extension -> /usr/src/debug/epiphany/51.2/embed/web-process-extension, directory renamed /usr/src/debug/epiphany/51.1/lib/sync/debug -> /usr/src/debug/
 epiphany/51.2/lib/sync/debug
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-src: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGSIZE changed from 6719808 to 6720271 (+0%)
packages/x86-64-v3-poky-linux/epiphany/epiphany: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany/epiphany: PKGV changed from 51.1 [default] to 51.2 [default]
packages/x86-64-v3-poky-linux/epiphany: SRC_URI changed from "https://download.gnome.org/sources//epiphany/51/epiphany-51.1.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://download.gnome.org/sources//epiphany/51/epiphany-51.2.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"
packages/x86-64-v3-poky-linux/epiphany: PV changed from "51.1" to "51.2"
packages/x86-64-v3-poky-linux/epiphany: PKGV changed from 51.1 [default] to 51.2 [default]

--===============4084640555852114590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="epiphany-changelog.txt"

51.2 - October 29, 2026
=======================

--===============4084640555852114590==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-51.1-51.2.patch"

RnJvbSAxZDNlNjU0Yjc1Y2Q3MjQ3ODZmYTFiZGZmM2M2NmE0YTExZmVlMDkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMzAgT2N0IDIwMjYgMDc6MDk6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA1MS4xIC0+IDUxLjIKCjUxLjIgLSBPY3RvYmVyIDI5LCAyMDI2Cj09
PT09PT09PT09PT09PT09PT09PT09Ci0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFueV81MS4xLmJi
ID0+IGVwaXBoYW55XzUxLjIuYmJ9ICAgICAgICAgICB8IDIgKy0KIC4uLi9maWxlcy8wMDAyLWhl
bHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggfCAyICstCiBtZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2ggICAgICAgICAg
IHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0
Y2ggICAgICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L3tlcGlw
aGFueV81MS4xLmJiID0+IGVwaXBoYW55XzUxLjIuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzUxLjEuYmIgYi9tZXRhL3JlY2lwZXMt
Z25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNTEuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNTEuMS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzUxLjIuYmIKaW5kZXgg
Y2YxZjY5ZGZkMi4uMzE3NDc3YmM4OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2VwaXBoYW55XzUxLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55
L2VwaXBoYW55XzUxLjIuYmIKQEAgLTMyLDcgKzMyLDcgQEAgU1JDX1VSSSArPSAiXAogICAgICAg
ICAgICBmaWxlOi8vbWlncmF0b3IucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vZGlzdHJpYnV0
b3IucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJi
ZWI5M2IzYjg2Yjc2MzA5MmExMTc1YjZlNTA1Nzg5Yjc2MTMwNzFjMGRjMWFkNTZjYWMxOTc5ZmU4
NzllOWRkIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZTQ1ZDkzNDgzZDYyYmVlYjI2
YjM2YjM5ZmUyZjhjYjU1MTFmZmU2ZGRjY2M3ZmVkZmY1NWIxZTNjYzBhNWMzMCIKIAogZXhwb3J0
IEdJX1RZUEVMSUJfUEFUSCA9ICIke1NUQUdJTkdfTElCRElSfS9naXJlcG9zaXRvcnktMS4wLyIK
IApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVs
cC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUt
dXNlLW9mLXllbHAucGF0Y2gKaW5kZXggYjY5N2I1ZjY0MC4uNDgwZDBhYzBjMCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWls
ZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUv
ZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhlLXVzZS1vZi15
ZWxwLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyMGM0NWNiMzc5ZWU5MTBiODkxNzUwMTkz
ODhkZjFhNjNiMDFjMGQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmZTdkNjBiODdh
MWQ0MmYxMzAwNDc3MDFkNTViZjRlMjA3MTVlNmRkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBX
ZWQsIDMxIEphbiAyMDE4IDE1OjUwOjM4ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGhlbHAvbWVz
b24uYnVpbGQ6IGRpc2FibGUgdGhlIHVzZSBvZiB5ZWxwCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Z25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKaW5kZXggMjhhOTYxMzIzYS4u
MGQ4NThmYTYzNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVz
L2Rpc3RyaWJ1dG9yLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxl
cy9kaXN0cmlidXRvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODIxOTZkNDE1ODE5ZDUx
N2Q4Y2JhMjE0MjYwMGJlMjc5ZTQ5OTU0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ZGUzODJjMDAyMjMxYTYxY2IxNDBjZGQzZTI5ZDYxOTBjODUzZTU0ZiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPgogRGF0ZTogRnJpLCAyNiBGZWIgMjAyMSAxMDoxNzo1MiArMDAwMAogU3ViamVj
dDogW1BBVENIXSBEb24ndCBlbmNvZGUgdGhlIGRpc3RybyBmcm9tIC9ldGMvb3MtcmVsZWFzZSBp
bnRvIHRoZQpAQCAtMTEsNyArMTEsNyBAQCBSUCAyMDIxLzIvMjYKICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQK
LWluZGV4IDY1MzI0ZTUuLjJlNzBlZjAgMTAwNjQ0CitpbmRleCA3NjdhMzRiLi5kNGRjY2Y2IDEw
MDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBAQCAtMTUsNiArMTUs
NyBAQCBpZiByLnJldHVybmNvZGUoKSA9PSAwCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25v
bWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBp
cGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2gKaW5kZXggNDkxZmYzNWVhMi4uMjJmODc1NWU3ZiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODRjMjZmMDU0YWIzNTIwZDA2ZmViYzJlOGE5OTUwMmQy
Y2ZmOThjZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2RkN2FkNmQ5NTQwYjcyMjcx
NjA2NDc0MGQwNTViZDJlYjRkY2UxZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJp
Y2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTog
VGh1LCAyNSBGZWIgMjAyMSAxNDo1MjozMiArMDAwMAogU3ViamVjdDogW1BBVENIXSBlcGlwaGFu
eTogRml4IHJlcHJvZHVjaWJpbGl0eSBpc3N1ZQotLSAKMi40Ny4xCgo=

--===============4084640555852114590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-mi: PKGSIZE changed from 4380 to 8008 (+83%)
packages/x86-64-v3-poky-linux/epiphany/epiphany-locale-nb: PKGSIZE changed from 73713 to 93771 (+27%)

--===============4084640555852114590==--
