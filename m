Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4708C25B4E
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:16 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.8479.1698848703453616908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y0mnnnrl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=L8ojj3y6;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b8b4600d7-f1b6bce9-6624-4e1f-93ad-5bd7a234b6d6-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848702;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=0BmB+a3z5ihNMgUdyYaHmrK4qwHDH9uHMEv1xgyjlp8=;
	b=Y0mnnnrl57mwQLVbxmt9u2WssC2k5NQ6wldMVccSpstmSjK+RQ0EzCJlX/3KgXAt
	Id9rQGHCUMQeSfwShEqtGHHZRjyMIQq1AE0mdF8SF06pO9x2+Q4dyQihkXKTzdBCu2I
	Cmh+5SwknblpRwJPOwlbiHmO2c7xyxx/rntPiB+Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848702;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=0BmB+a3z5ihNMgUdyYaHmrK4qwHDH9uHMEv1xgyjlp8=;
	b=L8ojj3y6Jedoot0LnfuOSE040yWcjarfEkJvLaTCT74ZVmoFFAq5dkKyZSqnUQck
	1LXBei8gMPHIpunqP5MLk7rSLh0clTjn8enCeFYVs5eE++I58JXqT2XnNjb6NKeFkzf
	NiS2gQgl/AO5wKN2x9Rs3XNOoJUc4F2b1WxjZx9w=
Content-Type: multipart/mixed; boundary="===============6318757370498791373=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dpkg: upgrading to 1.22.1 SUCCEEDED
Message-ID: <0101018b8b4600d7-f1b6bce9-6624-4e1f-93ad-5bd7a234b6d6-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189929

--===============6318757370498791373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dpkg* to *1.22.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dpkg-upgrade-1.22.0-1.22.1.patch
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
From adc01b8660aaa1f984cfa3bb18212978a18bc498 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 06:48:53 +0000
Subject: [PATCH] dpkg: upgrade 1.22.0 -> 1.22.1

---
 .../dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch    | 4 ++--
 meta/recipes-devtools/dpkg/{dpkg_1.22.0.bb => dpkg_1.22.1.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.22.0.bb => dpkg_1.22.1.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index f2367c95e9..c1c50c0d49 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From e3ade3464b8a1129a55c2790cf114d9ae01e3cda Mon Sep 17 00:00:00 2001
+From e4193893a7374517b19977731850d5d22aa96d05 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -29,7 +29,7 @@ Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/deb/build.c b/src/deb/build.c
-index 76613adec..7c216d1a9 100644
+index 5da771924..7779706db 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
 @@ -482,6 +482,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.1.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.22.1.bb
index 7eaae9f22e..a56d0871a6 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.0.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.1.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "744487c98a622b9b38c22c6ca330315af4a30a11"
+SRCREV = "34451fab061f2c19fed6337f48a7949fc1eb57dd"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


--===============6318757370498791373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dpkg/dpkg-dbg: PKGSIZE changed from 3490728 to 3490208 (-0%)
packages/core2-64-poky-linux/dpkg/dpkg-dbg: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-dbg: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-dev: PKGSIZE changed from 166140 to 168107 (+1%)
packages/core2-64-poky-linux/dpkg/dpkg-dev: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-dev: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-doc: PKGSIZE changed from 397615 to 397789 (+0%)
packages/core2-64-poky-linux/dpkg/dpkg-doc: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-doc: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-ast: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-ast: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-bs: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-bs: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-ca: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-ca: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-cs: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-cs: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-da: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-da: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-de: PKGSIZE changed from 294624 to 296119 (+1%)
packages/core2-64-poky-linux/dpkg/dpkg-locale-de: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-de: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-dz: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-dz: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-el: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-el: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-eo: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-eo: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-es: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-es: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-et: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-et: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-eu: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-eu: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-fr: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-fr: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-gl: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-gl: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-hu: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-hu: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-id: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-id: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-it: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-it: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-ja: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-ja: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-km: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-km: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-ko: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-ko: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-ku: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-ku: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-lt: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-lt: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-mr: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-mr: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-nb: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-nb: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-ne: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-ne: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-nl: PKGSIZE changed from 279975 to 280759 (+0%)
packages/core2-64-poky-linux/dpkg/dpkg-locale-nl: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-nl: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-nn: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-nn: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-oc: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-oc: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-pa: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-pa: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-pl: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-pl: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-pt-br: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-pt-br: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-pt: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-pt: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-ro: PKGSIZE changed from 122788 to 183571 (+50%)
packages/core2-64-poky-linux/dpkg/dpkg-locale-ro: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-ro: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-ru: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-ru: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-sk: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-sk: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-sv: PKGSIZE changed from 268318 to 283498 (+6%)
packages/core2-64-poky-linux/dpkg/dpkg-locale-sv: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-sv: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-th: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-th: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-tl: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-tl: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-tr: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-tr: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-vi: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-vi: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-zh-cn: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-zh-cn: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-locale-zh-tw: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-locale-zh-tw: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-perl: PKGSIZE changed from 676970 to 678262 (+0%)
packages/core2-64-poky-linux/dpkg/dpkg-perl: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-perl: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-src: PKGSIZE changed from 1176206 to 1176812 (+0%)
packages/core2-64-poky-linux/dpkg/dpkg-src: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-src: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-start-stop: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-start-stop: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg-staticdev: PKGSIZE changed from 1533314 to 1533090 (-0%)
packages/core2-64-poky-linux/dpkg/dpkg-staticdev: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg-staticdev: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/dpkg: PKGSIZE changed from 1384834 to 1385715 (+0%)
packages/core2-64-poky-linux/dpkg/dpkg: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/dpkg: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg: PV changed from "1.22.0" to "1.22.1"
packages/core2-64-poky-linux/dpkg/update-alternatives-dpkg: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/core2-64-poky-linux/dpkg/update-alternatives-dpkg: PV changed from "1.22.0" to "1.22.1"

--===============6318757370498791373==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dpkg-upgrade-1.22.0-1.22.1.patch"

RnJvbSBhZGMwMWI4NjYwYWFhMWY5ODRjZmEzYmIxODIxMjk3OGExOGJjNDk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNjo0ODo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRw
a2c6IHVwZ3JhZGUgMS4yMi4wIC0+IDEuMjIuMQoKLS0tCiAuLi4vZHBrZy8wMDAxLWJ1aWxkLmMt
aWdub3JlLXJldHVybi1vZi0xLWZyb20tdGFyLWNmLnBhdGNoICAgIHwgNCArKy0tCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZHBrZy97ZHBrZ18xLjIyLjAuYmIgPT4gZHBrZ18xLjIyLjEuYmJ9IHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cve2Rwa2dfMS4yMi4wLmJiID0+IGRwa2df
MS4yMi4xLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtn
L2Rwa2cvMDAwMS1idWlsZC5jLWlnbm9yZS1yZXR1cm4tb2YtMS1mcm9tLXRhci1jZi5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1idWlsZC5jLWlnbm9yZS1yZXR1
cm4tb2YtMS1mcm9tLXRhci1jZi5wYXRjaAppbmRleCBmMjM2N2M5NWU5Li5jMWM1MGMwZDQ5IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtYnVpbGQuYy1p
Z25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Rwa2cvZHBrZy8wMDAxLWJ1aWxkLmMtaWdub3JlLXJldHVybi1vZi0xLWZyb20tdGFy
LWNmLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlM2FkZTM0NjRiOGExMTI5YTU1YzI3OTBj
ZjExNGQ5YWUwMWUzY2RhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlNDE5Mzg5M2E3
Mzc0NTE3YjE5OTc3NzMxODUwZDVkMjJhYTk2ZDA1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUGF1bCBFZ2dsZXRvbiA8cGF1bC5lZ2dsZXRvbkBsaW51eC5taWNyb3NvZnQuY29tPgog
RGF0ZTogVHVlLCAxNiBKdW4gMjAyMCAwMzo1NzoyNSArMDAwMAogU3ViamVjdDogW1BBVENIXSBi
dWlsZC5jOiBpZ25vcmUgcmV0dXJuIG9mIDEgZnJvbSB0YXIgLWNmCkBAIC0yOSw3ICsyOSw3IEBA
IFNpZ25lZC1vZmYtYnk6IFBhdWwgRWdnbGV0b24gPHBhdWwuZWdnbGV0b25AbWljcm9zb2Z0LmNv
bT4KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS9zcmMvZGViL2J1aWxkLmMgYi9zcmMvZGViL2J1aWxkLmMKLWluZGV4IDc2NjEz
YWRlYy4uN2MyMTZkMWE5IDEwMDY0NAoraW5kZXggNWRhNzcxOTI0Li43Nzc5NzA2ZGIgMTAwNjQ0
CiAtLS0gYS9zcmMvZGViL2J1aWxkLmMKICsrKyBiL3NyYy9kZWIvYnVpbGQuYwogQEAgLTQ4Miw2
ICs0ODIsNyBAQCB0YXJiYWxsX3BhY2soY29uc3QgY2hhciAqZGlyLCBmaWxlbmFtZXNfZmVlZF9m
dW5jICp0YXJfZmlsZW5hbWVzX2ZlZWRlciwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9kcGtnL2Rwa2dfMS4yMi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBr
Z18xLjIyLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2Rwa2cvZHBrZ18xLjIyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9kcGtnL2Rwa2dfMS4yMi4xLmJiCmluZGV4IDdlYWFlOWYyMmUuLmE1NmQwODcxYTYgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMi4wLmJiCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMi4xLmJiCkBAIC0xOCw2ICsxOCw2
IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vc2Fsc2EuZGViaWFuLm9yZy9kcGtnLXRlYW0vZHBrZy5naXQ7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4KIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZl
ID0gIiBmaWxlOi8vMDAwMS1idWlsZC5jLWlnbm9yZS1yZXR1cm4tb2YtMS1mcm9tLXRhci1jZi5w
YXRjaCIKIAotU1JDUkVWID0gIjc0NDQ4N2M5OGE2MjJiOWIzOGMyMmM2Y2EzMzAzMTVhZjRhMzBh
MTEiCitTUkNSRVYgPSAiMzQ0NTFmYWIwNjFmMmMxOWZlZDYzMzdmNDhhNzk0OWZjMWViNTdkZCIK
IAogUyA9ICIke1dPUktESVJ9L2dpdCIKLS0gCjIuMzkuMgoK

--===============6318757370498791373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/dpkg/dpkg-locale-ro: PKGSIZE changed from 122788 to 183571 (+50%)

--===============6318757370498791373==--

