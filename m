Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2E3C54F59
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.14619.1700059029930698307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=C/o8HJhz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=es8382vd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018bd36a1d78-8548b84a-1a0c-4564-98a7-0f87346c68f1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059029;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Pbqbe7fYXKnkMII5B/fg1J4xTps/+8Yuh6gUT+L5aFI=;
	b=C/o8HJhzPcx6azBiqyVDqcDfVh5r6wPGKfQxAicrvqPPFOX/mnLhLjZFjFrzW1Lq
	DlC/EtDz7cEHZ2D/mLbZZPKOplmuUnIjavfimI5Du3AuaBgCsuRtQ6nbcdPlgmFwpW0
	mJPfVweSTvBqIRNO63Z8fpatwC9CYDX7YmBVMb9s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059029;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Pbqbe7fYXKnkMII5B/fg1J4xTps/+8Yuh6gUT+L5aFI=;
	b=es8382vdzZCTRpZvPZhApFV+0Mm5HnPMdHhCvvhkcxbv6DNJCs9lgOlbex2tWL1i
	dUewfgJj//Z4Hatv6qanSQY8BsTIQ+y+BRc8/DI8gbHqR1f/hmEP4kRbpZm/kx+iWoq
	6YOCXN7pdqI6bRRckqpUxQo09+enVF2y7Sm6xbJA=
Content-Type: multipart/mixed; boundary="===============4496738030445107091=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] dpkg: upgrading to 1.22.1 SUCCEEDED
Message-ID: <0101018bd36a1d78-8548b84a-1a0c-4564-98a7-0f87346c68f1-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190619

--===============4496738030445107091==
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
From e0e91e9be7007205e5a87a7487c18509b45b702c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 05:59:24 +0000
Subject: [PATCH] dpkg: upgrade 1.22.0 -> 1.22.1

---
 .../dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch    | 4 ++--
 meta/recipes-devtools/dpkg/{dpkg_1.22.0.bb => dpkg_1.22.1.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.22.0.bb => dpkg_1.22.1.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index f2367c95e9..91bad062e9 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From e3ade3464b8a1129a55c2790cf114d9ae01e3cda Mon Sep 17 00:00:00 2001
+From 555d2dd1e1a98715fd0860c84771b26599b42d60 Mon Sep 17 00:00:00 2001
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


--===============4496738030445107091==
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

--===============4496738030445107091==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dpkg-upgrade-1.22.0-1.22.1.patch"

RnJvbSBlMGU5MWU5YmU3MDA3MjA1ZTVhODdhNzQ4N2MxODUwOWI0NWI3MDJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDU6NTk6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
cGtnOiB1cGdyYWRlIDEuMjIuMCAtPiAxLjIyLjEKCi0tLQogLi4uL2Rwa2cvMDAwMS1idWlsZC5j
LWlnbm9yZS1yZXR1cm4tb2YtMS1mcm9tLXRhci1jZi5wYXRjaCAgICB8IDQgKystLQogbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2Rwa2cve2Rwa2dfMS4yMi4wLmJiID0+IGRwa2dfMS4yMi4xLmJifSB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL3tkcGtnXzEuMjIuMC5iYiA9PiBkcGtn
XzEuMjIuMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBr
Zy9kcGtnLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0
dXJuLW9mLTEtZnJvbS10YXItY2YucGF0Y2gKaW5kZXggZjIzNjdjOTVlOS4uOTFiYWQwNjJlOSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rwa2cvZHBrZy8wMDAxLWJ1aWxkLmMt
aWdub3JlLXJldHVybi1vZi0xLWZyb20tdGFyLWNmLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kcGtnL2Rwa2cvMDAwMS1idWlsZC5jLWlnbm9yZS1yZXR1cm4tb2YtMS1mcm9tLXRh
ci1jZi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTNhZGUzNDY0YjhhMTEyOWE1NWMyNzkw
Y2YxMTRkOWFlMDFlM2NkYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTU1ZDJkZDFl
MWE5ODcxNWZkMDg2MGM4NDc3MWIyNjU5OWI0MmQ2MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFBhdWwgRWdnbGV0b24gPHBhdWwuZWdnbGV0b25AbGludXgubWljcm9zb2Z0LmNvbT4K
IERhdGU6IFR1ZSwgMTYgSnVuIDIwMjAgMDM6NTc6MjUgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0g
YnVpbGQuYzogaWdub3JlIHJldHVybiBvZiAxIGZyb20gdGFyIC1jZgpAQCAtMjksNyArMjksNyBA
QCBTaWduZWQtb2ZmLWJ5OiBQYXVsIEVnZ2xldG9uIDxwYXVsLmVnZ2xldG9uQG1pY3Jvc29mdC5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBk
aWZmIC0tZ2l0IGEvc3JjL2RlYi9idWlsZC5jIGIvc3JjL2RlYi9idWlsZC5jCi1pbmRleCA3NjYx
M2FkZWMuLjdjMjE2ZDFhOSAxMDA2NDQKK2luZGV4IDVkYTc3MTkyNC4uNzc3OTcwNmRiIDEwMDY0
NAogLS0tIGEvc3JjL2RlYi9idWlsZC5jCiArKysgYi9zcmMvZGViL2J1aWxkLmMKIEBAIC00ODIs
NiArNDgyLDcgQEAgdGFyYmFsbF9wYWNrKGNvbnN0IGNoYXIgKmRpciwgZmlsZW5hbWVzX2ZlZWRf
ZnVuYyAqdGFyX2ZpbGVuYW1lc19mZWVkZXIsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZHBrZy9kcGtnXzEuMjIuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kcGtnL2Rw
a2dfMS4yMi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9kcGtnL2Rwa2dfMS4yMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZHBrZy9kcGtnXzEuMjIuMS5iYgppbmRleCA3ZWFhZTlmMjJlLi5hNTZkMDg3MWE2IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnXzEuMjIuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZHBrZy9kcGtnXzEuMjIuMS5iYgpAQCAtMTgsNiArMTgs
NiBAQCBTUkNfVVJJID0gImdpdDovL3NhbHNhLmRlYmlhbi5vcmcvZHBrZy10ZWFtL2Rwa2cuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2
ZSA9ICIgZmlsZTovLzAwMDEtYnVpbGQuYy1pZ25vcmUtcmV0dXJuLW9mLTEtZnJvbS10YXItY2Yu
cGF0Y2giCiAKLVNSQ1JFViA9ICI3NDQ0ODdjOThhNjIyYjliMzhjMjJjNmNhMzMwMzE1YWY0YTMw
YTExIgorU1JDUkVWID0gIjM0NDUxZmFiMDYxZjJjMTlmZWQ2MzM3ZjQ4YTc5NDlmYzFlYjU3ZGQi
CiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCi0tIAoyLjM5LjIKCg==

--===============4496738030445107091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/dpkg/dpkg-locale-ro: PKGSIZE changed from 122788 to 183571 (+50%)

--===============4496738030445107091==--

