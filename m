Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA88BC41535
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:41 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.10520.1648819420538139019
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=3xh13fmM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101017fe54bb9c6-fe82d147-e363-4cee-add1-c5b0d74e9629-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819419;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qiIR8fazD8mc4FIAWTjGO2KZ6TI/gLlMcfk9lNe9oy0=;
	b=3xh13fmM/WP9Q9tuzD8jzDjDX/IJkyZHERru1tDpas/5N9FIlAHrdqwPrxg/HTC9
	eg4Sjyhn6fVzIx/nLFq/Y6DQi/foEUyVdNmZe+tCle2ttXxlLy8oSKWEZlubodVxmoc
	sQNSCgj6yZWOZ8DZ1ksJ7Njg1hcKezp1HiimKICc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819419;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qiIR8fazD8mc4FIAWTjGO2KZ6TI/gLlMcfk9lNe9oy0=;
	b=ao+KjWtTVB/Q8nv1TefZYRCTmSg13pMIsSjH5pNyf4dE/tGGjwW8asRfPXpLHTL+
	FdDMl6oIXG9bzDRGMvwq+Mse4HvGruKKoYHQhy5gDAHMhM/rCXeo4CUsA+Urf+ENqwD
	b5znJ5sVF1dwwbdwR6lv24i1j0RlZJZ5KXRb3qxY=
Content-Type: multipart/mixed; boundary="===============7682458588017103102=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
 =?utf-8?b?QW7DrWJhbCBMaW3Ds24gPGxpbW9uLmFuaWJhbEBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dpkg: upgrading to 1.21.7 SUCCEEDED
Message-ID: 
 <0101017fe54bb9c6-fe82d147-e363-4cee-add1-c5b0d74e9629-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:39 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163892

--===============7682458588017103102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dpkg* to *1.21.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dpkg-upgrade-1.21.4-1.21.7.patch
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
--===============7682458588017103102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dpkg/dpkg-dbg: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-dbg: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-dbg: PKGSIZE changed from 2761580 to 2769604 (+0%)
packages/core2-32-poky-linux/dpkg/dpkg-dev: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-dev: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-dev: PKGSIZE changed from 156413 to 156532 (+0%)
packages/core2-32-poky-linux/dpkg/dpkg-doc: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-doc: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-doc: PKGSIZE changed from 352886 to 353738 (+0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-ast: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ast: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-bs: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-bs: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ca: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ca: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-cs: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-cs: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-da: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-da: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-de: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-de: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-de: PKGSIZE changed from 289896 to 289902 (+0%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-dz: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-dz: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-el: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-el: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-eo: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-eo: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-es: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-es: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-et: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-et: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-eu: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-eu: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-fr: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-fr: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-gl: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-gl: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-hu: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-hu: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-id: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-id: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-it: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-it: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ja: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ja: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-km: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-km: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ko: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ko: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ku: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ku: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-lt: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-lt: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-mr: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-mr: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-nb: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-nb: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ne: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ne: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-nl: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-nl: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-nn: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-nn: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-oc: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-oc: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pa: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pa: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pl: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pl: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt-br: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt-br: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-pt: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ro: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ro: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-ru: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-ru: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-sk: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-sk: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-sv: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-sv: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-sv: PKGSIZE changed from 250274 to 274613 (+10%)
packages/core2-32-poky-linux/dpkg/dpkg-locale-th: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-th: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-tl: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-tl: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-tr: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-tr: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-vi: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-vi: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-cn: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-cn: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-tw: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-locale-zh-tw: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-perl: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-perl: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-perl: PKGSIZE changed from 614010 to 614267 (+0%)
packages/core2-32-poky-linux/dpkg/dpkg-src: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-src: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-src: PKGSIZE changed from 1157871 to 1158618 (+0%)
packages/core2-32-poky-linux/dpkg/dpkg-start-stop: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-start-stop: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-staticdev: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg-staticdev: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg-staticdev: PKGSIZE changed from 980762 to 982870 (+0%)
packages/core2-32-poky-linux/dpkg/dpkg: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/dpkg: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/dpkg: PKGSIZE changed from 1476592 to 1478058 (+0%)
packages/core2-32-poky-linux/dpkg: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg: PKGV changed from 1.21.4 [default] to 1.21.7 [default]
packages/core2-32-poky-linux/dpkg/update-alternatives-dpkg: PV changed from "1.21.4" to "1.21.7"
packages/core2-32-poky-linux/dpkg/update-alternatives-dpkg: PKGV changed from 1.21.4 [default] to 1.21.7 [default]

--===============7682458588017103102==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-dpkg-upgrade-1.21.4-1.21.7.patch"

From 07e8bb963ea8b298314c8fbc31a2e93de4981da7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 06:57:23 +0000
Subject: [PATCH] dpkg: upgrade 1.21.4 -> 1.21.7

---
 .../dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch | 7 ++-----
 .../dpkg/{dpkg_1.21.4.bb => dpkg_1.21.7.bb}                | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.4.bb => dpkg_1.21.7.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index dc0d9bfc2e..8ed5c309c3 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From 839f228556c00739f72534e8635195935eb3752f Mon Sep 17 00:00:00 2001
+From 8a42af35b2246b825a89c4388ec751564fe9a012 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -29,7 +29,7 @@ Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/deb/build.c b/src/deb/build.c
-index 76613ad..7c216d1 100644
+index 76613adec..7c216d1a9 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
 @@ -482,6 +482,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
@@ -51,6 +51,3 @@ index 76613ad..7c216d1 100644
  }
  
  static intmax_t
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.7.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.7.bb
index 681909f0bf..902cc03bcd 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.7.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "5563bdb608b3413639b69f1c76567cb66ff1a961"
+SRCREV = "e61f582015a9c67bbb3791cb93a864cfeb9c7151"
 
 S = "${WORKDIR}/git"
-- 
2.27.0


--===============7682458588017103102==--

