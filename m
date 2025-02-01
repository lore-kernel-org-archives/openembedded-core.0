Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA50CC02194
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:12 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.42628.1738416048431017767
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Wl74YPqE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NDVOZSnD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194c1ac2345-fead71de-9584-43fc-b43d-dcfb023d1579-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Cx6l0mWB88dARw04D/VC6/R4V0p/gwtI10tAcR7Gbu0=;
	b=Wl74YPqE5pcPSmgWLKLZt5A+b842H787xzN6m/8qxDjcdjL+1jo9ihSZANWTstNd
	eAeIKZwOZOy6gHoG1TV1ODOd9NUoRq8nRxNct1WMPr2m5FHuuYvSteSPULTDcARiYeY
	9Q6qrqQzfYogtgwkiOnbYYBBvG6PiiKoGUFtNecs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Cx6l0mWB88dARw04D/VC6/R4V0p/gwtI10tAcR7Gbu0=;
	b=NDVOZSnDNjWySDQVz01CZ8u29OQSWiiOoCuWGrt3EwhsEqyaQ13pXf1k8z0E5e4b
	a7lwKMTneJT3n7m3UbvqBQ/yK38+If6EwpSQYHI2IfJGVnoR2WZT1rOoXJl8A5UVWUG
	eEjYms0tGv0kT6KJ2BApoD1bvKUnR+5LoT4isIXk=
Content-Type: multipart/mixed; boundary="===============0591343353221002873=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.5.3 SUCCEEDED
Message-ID: <01010194c1ac2345-fead71de-9584-43fc-b43d-dcfb023d1579-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:21:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210600

--===============0591343353221002873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnupg* to *2.5.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.5.2-2.5.3.patch
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
From 348352dd188c4ed69515532c934326320a59e462 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 13:10:00 +0000
Subject: [PATCH] gnupg: upgrade 2.5.2 -> 2.5.3

---
 .../gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch  | 2 +-
 ...configure.ac-use-a-custom-value-for-the-location-of-.patch | 4 ++--
 .../gnupg/0002-use-pkgconfig-instead-of-npth-config.patch     | 2 +-
 .../0004-autogen.sh-fix-find-version-for-beta-checking.patch  | 2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch               | 2 +-
 meta/recipes-support/gnupg/{gnupg_2.5.2.bb => gnupg_2.5.3.bb} | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.2.bb => gnupg_2.5.3.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 024f4a9f10..fcd2528513 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 69d132c4cca738f148551af24932010fb1029ea1 Mon Sep 17 00:00:00 2001
+From bbf09a439d56ddcae6f641c8f1cf7544e3dd4d6f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 702cba4b71..6e2f8d6fe6 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From d9ef954b602c17839c52a1d7dc73e2354e5fbbbb Mon Sep 17 00:00:00 2001
+From c9cef60c7be6a5cb5a9557117f4d285278cc6f47 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 29592fd..7286862 100644
+index 6252d57..1da2c6f 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1911,7 +1911,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index a7a6f03c7d..9c87788e80 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From d5fc05998d7260fd94a558c53f6e6c35a384d163 Mon Sep 17 00:00:00 2001
+From 7c0163fd17b78284495da382023074ee7dd629b6 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index 8aeb87dfd4..3b4b01721a 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From 21396a6e74d188a2198439aa27403c29c1dbcea8 Mon Sep 17 00:00:00 2001
+From 24ae21dce9fc7546468580ab37db3bf9559e6efc Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 08e70fb444..b67744419e 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 93fef8f493ee66856ef02351da25583eea94202d Mon Sep 17 00:00:00 2001
+From db9e4933176b7919077120cedb8a8b0a40c2115b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.2.bb b/meta/recipes-support/gnupg/gnupg_2.5.3.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.2.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.3.bb
index 8e87382f12..cca4feaf6c 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.2.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.3.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "7f404ccc6a58493fedc15faef59f3ae914831cff866a23f0bf9d66cfdd0fea29"
+SRC_URI[sha256sum] = "23128b136aed4e5121e793d1b6c60ee50c8007a9d926c1313e524d05386b54ac"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.44.1


--===============0591343353221002873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gnupg/gnupg-dbg: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 20352560 to 20353632 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-dev: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-doc: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-doc: PKGSIZE changed from 11392 to 12141 (+7%)
packages/core2-64-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PKGSIZE changed from 246789 to 247454 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGSIZE changed from 224842 to 225410 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PKGSIZE changed from 222458 to 223026 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PKGSIZE changed from 200153 to 253564 (+27%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PKGSIZE changed from 253303 to 254023 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-nl: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-nl: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-src: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 9026285 to 9027344 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-src: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg/gnupg: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg/gnupg: PKGV changed from 2.5.2 [default] to 2.5.3 [default]
packages/core2-64-poky-linux/gnupg: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.2.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch" to "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.3.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch"
packages/core2-64-poky-linux/gnupg: PV changed from "2.5.2" to "2.5.3"
packages/core2-64-poky-linux/gnupg: PKGV changed from 2.5.2 [default] to 2.5.3 [default]

--===============0591343353221002873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PKGSIZE changed from 200153 to 253564 (+27%)

--===============0591343353221002873==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.5.2-2.5.3.patch"

RnJvbSAzNDgzNTJkZDE4OGM0ZWQ2OTUxNTUzMmM5MzQzMjYzMjBhNTllNDYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMzoxMDowMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdu
dXBnOiB1cGdyYWRlIDIuNS4yIC0+IDIuNS4zCgotLS0KIC4uLi9nbnVwZy8wMDAxLVdvdmVycmlk
ZS1pbml0LWlzLW5vdC1uZWVkZWQtd2l0aC1nY2MtOS5wYXRjaCAgfCAyICstCiAuLi5jb25maWd1
cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoIHwgNCAr
Ky0tCiAuLi4vZ251cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcu
cGF0Y2ggICAgIHwgMiArLQogLi4uLzAwMDQtYXV0b2dlbi5zaC1maXgtZmluZC12ZXJzaW9uLWZv
ci1iZXRhLWNoZWNraW5nLnBhdGNoICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBn
L2dudXBnL3JlbG9jYXRlLnBhdGNoICAgICAgICAgICAgICAgfCAyICstCiBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9nbnVwZy97Z251cGdfMi41LjIuYmIgPT4gZ251cGdfMi41LjMuYmJ9IHwgMiArLQog
NiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcve2dudXBnXzIuNS4yLmJiID0+IGdudXBnXzIuNS4z
LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBn
LzAwMDEtV292ZXJyaWRlLWluaXQtaXMtbm90LW5lZWRlZC13aXRoLWdjYy05LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3Qt
bmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2gKaW5kZXggMDI0ZjRhOWYxMC4uZmNkMjUyODUxMyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUt
aW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ251cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgt
Z2NjLTkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY5ZDEzMmM0Y2NhNzM4ZjE0ODU1MWFm
MjQ5MzIwMTBmYjEwMjllYTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGJiZjA5YTQz
OWQ1NmRkY2FlNmY2NDFjOGYxY2Y3NTQ0ZTNkZDRkNmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyMCBEZWMg
MjAxOCAxNzozNzo0OCAtMDgwMAogU3ViamVjdDogW1BBVENIXSBXb3ZlcnJpZGUtaW5pdCBpcyBu
b3QgbmVlZGVkIHdpdGggZ2NjIDkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2du
dXBnL2dudXBnLzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxv
Y2F0aW9uLW9mLS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEt
Y29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRj
aAppbmRleCA3MDJjYmE0YjcxLi42ZTJmOGQ2ZmU2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUt
Zm9yLXRoZS1sb2NhdGlvbi1vZi0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
cGcvZ251cGcvMDAwMS1jb25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9j
YXRpb24tb2YtLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkOWVmOTU0YjYwMmMxNzgzOWM1
MmExZDdkYzczZTIzNTRlNWZiYmJiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjOWNl
ZjYwYzdiZTZhNWNiNWE5NTU3MTE3ZjRkMjg1Mjc4Y2M2ZjQ3IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBE
YXRlOiBNb24sIDIyIEphbiAyMDE4IDE4OjAwOjIxICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNv
bmZpZ3VyZS5hYzogdXNlIGEgY3VzdG9tIHZhbHVlIGZvciB0aGUgbG9jYXRpb24gb2YKQEAgLTEz
LDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDI5
NTkyZmQuLjcyODY4NjIgMTAwNjQ0CitpbmRleCA2MjUyZDU3Li4xZGEyYzZmIDEwMDY0NAogLS0t
IGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0xOTExLDcgKzE5MTEsNyBA
QCBBQ19ERUZJTkVfVU5RVU9URUQoR1BHQ09ORl9ESVNQX05BTUUsICJHUEdDb25mIiwKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZp
Zy1pbnN0ZWFkLW9mLW5wdGgtY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
cGcvZ251cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0Y2gK
aW5kZXggYTdhNmYwM2M3ZC4uOWM4Nzc4OGU4MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ251cGcvZ251cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25m
aWcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMi11c2Ut
cGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGQ1ZmMwNTk5OGQ3MjYwZmQ5NGE1NThjNTNmNmU2YzM1YTM4NGQxNjMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDdjMDE2M2ZkMTdiNzgyODQ0OTVkYTM4MjAyMzA3NGVlN2RkNjI5
YjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTYXVsIFdvbGQgPHNnd0BsaW51eC5p
bnRlbC5jb20+CiBEYXRlOiBXZWQsIDE2IEF1ZyAyMDE3IDExOjE2OjMwICswODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIHVzZSBwa2djb25maWcgaW5zdGVhZCBvZiBucHRoIGNvbmZpZwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwNC1hdXRvZ2VuLnNoLWZpeC1m
aW5kLXZlcnNpb24tZm9yLWJldGEtY2hlY2tpbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9nbnVwZy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lvbi1mb3ItYmV0YS1j
aGVja2luZy5wYXRjaAppbmRleCA4YWViODdkZmQ0Li4zYjRiMDE3MjFhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQt
dmVyc2lvbi1mb3ItYmV0YS1jaGVja2luZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9nbnVwZy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lvbi1mb3ItYmV0YS1j
aGVja2luZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjEzOTZhNmU3NGQxODhhMjE5ODQz
OWFhMjc0MDNjMjljMWRiY2VhOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjRhZTIx
ZGNlOWZjNzU0NjQ2ODU4MGFiMzdkYjNiZjk1NTllNmVmYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFdlbnpvbmcgRmFuIDx3ZW56b25nLmZhbkB3aW5kcml2ZXIuY29tPgogRGF0ZTog
V2VkLCAxNiBBdWcgMjAxNyAxMToyMzoyMiArMDgwMAogU3ViamVjdDogW1BBVENIXSBhdXRvZ2Vu
LnNoOiBmaXggZmluZC12ZXJzaW9uIGZvciBiZXRhIGNoZWNraW5nCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy9yZWxvY2F0ZS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9jYXRlLnBhdGNoCmluZGV4IDA4ZTcwZmI0NDQuLmI2
Nzc0NDQxOWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3Jl
bG9jYXRlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9j
YXRlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5M2ZlZjhmNDkzZWU2Njg1NmVmMDIzNTFk
YTI1NTgzZWVhOTQyMDJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkYjllNDkzMzE3
NmI3OTE5MDc3MTIwY2VkYjhhOGIwYTQwYzIxMTViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IFdlZCwgMTkg
U2VwIDIwMTggMTQ6NDQ6NDAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gQWxsb3cgdGhlIGVudmly
b25tZW50IHRvIG92ZXJyaWRlIHdoZXJlIGdudXBnIGxvb2tzIGZvciBpdHMKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4yLmJiIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZ251cGcvZ251cGdfMi41LjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi41LjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4zLmJiCmluZGV4IDhlODczODJm
MTIuLmNjYTRmZWFmNmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2du
dXBnXzIuNS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnXzIuNS4z
LmJiCkBAIC0yMyw3ICsyMyw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgZmls
ZTovLzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9yZWxvY2F0ZS5wYXRjaCIKIFNSQ19VUkk6YXBw
ZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgZmlsZTovL3JlbG9jYXRlLnBhdGNoIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiN2Y0MDRjY2M2YTU4NDkzZmVkYzE1ZmFlZjU5ZjNhZTkxNDgzMWNmZjg2
NmEyM2YwYmY5ZDY2Y2ZkZDBmZWEyOSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyMzEyOGIxMzZh
ZWQ0ZTUxMjFlNzkzZDFiNmM2MGVlNTBjODAwN2E5ZDkyNmMxMzEzZTUyNGQwNTM4NmI1NGFjIgog
CiBFWFRSQV9PRUNPTkYgPSAiLS1kaXNhYmxlLWxkYXAgXAogCQktLWRpc2FibGUtY2NpZC1kcml2
ZXIgXAotLSAKMi40NC4xCgo=

--===============0591343353221002873==--

