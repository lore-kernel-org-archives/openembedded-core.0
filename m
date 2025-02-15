Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65345C282EC
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:35 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8061.1739623336802420466
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iBoR46st;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=sGL+XbKA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019509a1c6ec-69ba5949-0dc3-498d-96ae-0918a3ae436f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ox8cFX6pp9h8skRK5DctbfpHm5TTUXnhIiswsKNyPN0=;
	b=iBoR46stig33l9HGFjz12TAdf4k8nHZa5hD9N+Dp0e0AO/wYls3cLwNb27gUZu6S
	zQpHNSQEKKo45uDNjyfIhlKSGcOPAVfUGtgFsUuWV9eDG9wSJrX7yhk/DTx0KPD0Xd1
	W//H9FFBBDacnsx/O9tdKE0x8FHJplnJZwWP15IE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ox8cFX6pp9h8skRK5DctbfpHm5TTUXnhIiswsKNyPN0=;
	b=sGL+XbKAaf+KNOC9CP0ubsfZvNK/2yWUvjICITJyQXNDjnuqZm3HcD1dhthDE71i
	YKgxnZlDl7tRpgPeU5byim3evMI7kkTnJZEOCXLEQbE54N4zCoS81JUR8kESK5mbuAH
	dNnlKy5RPsIvoJHRjNud6TzpU3BsaAVVShN5AHl4=
Content-Type: multipart/mixed; boundary="===============5465351271863474632=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.5.4 SUCCEEDED
Message-ID: <0101019509a1c6ec-69ba5949-0dc3-498d-96ae-0918a3ae436f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211475

--===============5465351271863474632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnupg* to *2.5.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.5.3-2.5.4.patch
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
From 5c79bfa6a42ae98e090c79cf730007ee7f5120a4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 12:21:48 +0000
Subject: [PATCH] gnupg: upgrade 2.5.3 -> 2.5.4

---
 .../0001-Woverride-init-is-not-needed-with-gcc-9.patch      | 2 +-
 ...nfigure.ac-use-a-custom-value-for-the-location-of-.patch | 6 +++---
 .../gnupg/0002-use-pkgconfig-instead-of-npth-config.patch   | 2 +-
 ...0004-autogen.sh-fix-find-version-for-beta-checking.patch | 2 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch             | 2 +-
 .../gnupg/{gnupg_2.5.3.bb => gnupg_2.5.4.bb}                | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.3.bb => gnupg_2.5.4.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index fcd2528513..6299eb95ce 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From bbf09a439d56ddcae6f641c8f1cf7544e3dd4d6f Mon Sep 17 00:00:00 2001
+From 690faa62529c584cd80c8eaa56210ec1e4a96d7f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 6e2f8d6fe6..ed94145833 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From c9cef60c7be6a5cb5a9557117f4d285278cc6f47 Mon Sep 17 00:00:00 2001
+From c9392c615a95c965dd58b0896cb3b87deafc62a4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6252d57..1da2c6f 100644
+index 23a9101..3e10021 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1911,7 +1911,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1908,7 +1908,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 9c87788e80..2d23ca1e66 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From 7c0163fd17b78284495da382023074ee7dd629b6 Mon Sep 17 00:00:00 2001
+From 9f7cf2e4770697c24f8d24ce9f79b8548120bbf8 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index 3b4b01721a..fc7d964ec4 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From 24ae21dce9fc7546468580ab37db3bf9559e6efc Mon Sep 17 00:00:00 2001
+From 4d8cc1982273d571b4e80fe981878d0fa5884236 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index b67744419e..1ae8a564d4 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From db9e4933176b7919077120cedb8a8b0a40c2115b Mon Sep 17 00:00:00 2001
+From 917a98f9380d581548f3cbb59428cee3a5c29bae Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.5.3.bb b/meta/recipes-support/gnupg/gnupg_2.5.4.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.3.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.4.bb
index cca4feaf6c..e6a7e3fb40 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.3.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.4.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "23128b136aed4e5121e793d1b6c60ee50c8007a9d926c1313e524d05386b54ac"
+SRC_URI[sha256sum] = "f8cb2ac6c9f17f81e3541c62158764910fad5c3a0765e00b398c41a32bc4e0ea"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.44.1


--===============5465351271863474632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 21785896 to 21794496 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-dbg: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-dev: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-doc: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PKGSIZE changed from 1632680 to 1637544 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PKGSIZE changed from 241099 to 240953 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PKGSIZE changed from 130735 to 130594 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PKGSIZE changed from 247454 to 247286 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGSIZE changed from 225410 to 225286 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PKGSIZE changed from 223026 to 222902 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PKGSIZE changed from 213879 to 213743 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PKGSIZE changed from 253564 to 253391 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PKGSIZE changed from 234807 to 234671 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PKGSIZE changed from 254023 to 254492 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PKGSIZE changed from 209022 to 208882 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-nl: PKGSIZE changed from 235518 to 235347 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-nl: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-nl: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PKGSIZE changed from 243903 to 243695 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PKGSIZE changed from 237172 to 237612 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PKGSIZE changed from 288518 to 288312 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PKGSIZE changed from 130977 to 130833 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PKGSIZE changed from 239880 to 241988 (+1%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PKGSIZE changed from 293809 to 293603 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PKGSIZE changed from 219068 to 218937 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PKGSIZE changed from 219511 to 219383 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-src: FILELIST: directory renamed /usr/src/debug/gnupg/2.5.3/dirmngr -> /usr/src/debug/gnupg/2.5.4/dirmngr, directory renamed /usr/src/debug/gnupg/2.5.3/tools -> /usr/src/debug/gnupg/2.5.4/tools, directory renamed /usr/src/debug/gnupg/2.5.3/common -> /usr/src/debug/gnupg/2.5.4/common, directory renamed /usr/src/debug/gnupg/2.5.3/g10 -> /usr/src/debug/gnupg/2.5.4/g10, directory renamed /usr/src/debug/gnupg/2.5.3/regexp -> /usr/src/debug/gnupg/2.5.4/regexp, directory renamed /usr/src/debug/gnupg/2.5.3/scd -> /usr/src/debug/gnupg/2.5.4/scd, directory renamed /usr/src/debug/gnupg/2.5.3/agent -> /usr/src/debug/gnupg/2.5.4/agent, directory renamed /usr/src/debug/gnupg/2.5.3/sm -> /usr/src/debug/gnupg/2.5.4/sm, removed "/usr/src/debug/gnupg/2.5.3/kbx/keybox-search.c /usr/src/debug/gnupg/2.5.3/kbx/keybox-blob.c /usr/src/debug/gnupg/2.5.3/kbx/kbxutil.c /usr/src/debug/gnupg/2.5.3/kbx/keybox-openpgp.c /usr/src/debug/gnupg/2.5.3/kbx/kbx-client-util.h /usr/
 src/debug/gnupg/2.5.3/kbx/keybox-dump.c /usr/src/debug/gnupg/2.5.3/kbx/kbx-client-util.c /usr/src/debug/gnupg/2.5.3/kbx/keybox-defs.h /usr/src/debug/gnupg/2.5.3/kbx/keybox-file.c /usr/src/debug/gnupg/2.5.3/kbx/keybox-init.c /usr/src/debug/gnupg/2.5.3/kbx/keybox.h /usr/src/debug/gnupg/2.5.3/kbx/keybox-util.c /usr/src/debug/gnupg/2.5.3/kbx/keybox-update.c /usr/src/debug/gnupg/2.5.3/kbx/keybox-search-desc.h", added "/usr/src/debug/gnupg/2.5.4/kbx/keybox-search.c /usr/src/debug/gnupg/2.5.4/kbx/keybox-blob.c /usr/src/debug/gnupg/2.5.4/kbx/kbxutil.c /usr/src/debug/gnupg/2.5.4/kbx/keybox-openpgp.c /usr/src/debug/gnupg/2.5.4/kbx/kbx-client-util.h /usr/src/debug/gnupg/2.5.4/kbx/keybox-dump.c /usr/src/debug/gnupg/2.5.4/kbx/keybox-fwddecl.h /usr/src/debug/gnupg/2.5.4/kbx/kbx-client-util.c /usr/src/debug/gnupg/2.5.4/kbx/keybox-file.c /usr/src/debug/gnupg/2.5.4/kbx/keybox-init.c /usr/src/debug/gnupg/2.5.4/kbx/keybox-defs.h /usr/src/debug/gnupg/2.5.4/kbx/keybox.h /usr/src/debug/gnupg/2.5.4/kbx/ke
 ybox-util.c /usr/src/debug/gnupg/2.5.4/kbx/keybox-update.c /usr/src/debug/gnupg/2.5.4/kbx/keybox-search-desc.h"
packages/core2-64-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 9027344 to 9033607 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-src: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-src: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg/gnupg: PKGSIZE changed from 4524896 to 4524701 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg/gnupg: PKGV changed from 2.5.3 [default] to 2.5.4 [default]
packages/core2-64-poky-linux/gnupg: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.3.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch" to "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.5.4.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch"
packages/core2-64-poky-linux/gnupg: PV changed from "2.5.3" to "2.5.4"
packages/core2-64-poky-linux/gnupg: PKGV changed from 2.5.3 [default] to 2.5.4 [default]

--===============5465351271863474632==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.5.3-2.5.4.patch"

RnJvbSA1Yzc5YmZhNmE0MmFlOThlMDkwYzc5Y2Y3MzAwMDdlZTdmNTEyMGE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMTI6MjE6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bnVwZzogdXBncmFkZSAyLjUuMyAtPiAyLjUuNAoKLS0tCiAuLi4vMDAwMS1Xb3ZlcnJpZGUtaW5p
dC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2ggICAgICB8IDIgKy0KIC4uLm5maWd1cmUu
YWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoIHwgNiArKyst
LS0KIC4uLi9nbnVwZy8wMDAyLXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5w
YXRjaCAgIHwgMiArLQogLi4uMDAwNC1hdXRvZ2VuLnNoLWZpeC1maW5kLXZlcnNpb24tZm9yLWJl
dGEtY2hlY2tpbmcucGF0Y2ggfCAyICstCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVw
Zy9yZWxvY2F0ZS5wYXRjaCAgICAgICAgICAgICB8IDIgKy0KIC4uLi9nbnVwZy97Z251cGdfMi41
LjMuYmIgPT4gZ251cGdfMi41LjQuYmJ9ICAgICAgICAgICAgICAgIHwgMiArLQogNiBmaWxlcyBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251cGcve2dudXBnXzIuNS4zLmJiID0+IGdudXBnXzIuNS40LmJifSAoOTcl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtV292
ZXJyaWRlLWluaXQtaXMtbm90LW5lZWRlZC13aXRoLWdjYy05LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdp
dGgtZ2NjLTkucGF0Y2gKaW5kZXggZmNkMjUyODUxMy4uNjI5OWViOTVjZSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1u
b3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
cGcvZ251cGcvMDAwMS1Xb3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJiZjA5YTQzOWQ1NmRkY2FlNmY2NDFjOGYxY2Y3NTQ0
ZTNkZDRkNmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY5MGZhYTYyNTI5YzU4NGNk
ODBjOGVhYTU2MjEwZWMxZTRhOTZkN2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyMCBEZWMgMjAxOCAxNzoz
Nzo0OCAtMDgwMAogU3ViamVjdDogW1BBVENIXSBXb3ZlcnJpZGUtaW5pdCBpcyBub3QgbmVlZGVk
IHdpdGggZ2NjIDkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBn
LzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9m
LS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDEtY29uZmlndXJl
LmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhlLWxvY2F0aW9uLW9mLS5wYXRjaAppbmRleCA2
ZTJmOGQ2ZmU2Li5lZDk0MTQ1ODMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9n
bnVwZy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1s
b2NhdGlvbi1vZi0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcv
MDAwMS1jb25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2Yt
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjOWNlZjYwYzdiZTZhNWNiNWE5NTU3MTE3ZjRk
Mjg1Mjc4Y2M2ZjQ3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjOTM5MmM2MTVhOTVj
OTY1ZGQ1OGIwODk2Y2IzYjg3ZGVhZmM2MmE0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBNb24s
IDIyIEphbiAyMDE4IDE4OjAwOjIxICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZS5h
YzogdXNlIGEgY3VzdG9tIHZhbHVlIGZvciB0aGUgbG9jYXRpb24gb2YKQEAgLTEzLDEwICsxMywx
MCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWls
LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAog
ZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNjI1MmQ1Ny4u
MWRhMmM2ZiAxMDA2NDQKK2luZGV4IDIzYTkxMDEuLjNlMTAwMjEgMTAwNjQ0CiAtLS0gYS9jb25m
aWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTE5MTEsNyArMTkxMSw3IEBAIEFDX0RF
RklORV9VTlFVT1RFRChHUEdDT05GX0RJU1BfTkFNRSwgIkdQR0NvbmYiLAorQEAgLTE5MDgsNyAr
MTkwOCw3IEBAIEFDX0RFRklORV9VTlFVT1RFRChHUEdDT05GX0RJU1BfTkFNRSwgIkdQR0NvbmYi
LAogIAogIEFDX0RFRklORV9VTlFVT1RFRChHUEdUQVJfTkFNRSwgImdwZ3RhciIsIFtUaGUgbmFt
ZSBvZiB0aGUgZ3BndGFyIHRvb2xdKQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZ251cGcvZ251cGcvMDAwMi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAyLXVzZS1wa2djb25m
aWctaW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5wYXRjaAppbmRleCA5Yzg3Nzg4ZTgwLi4yZDIzY2Ex
ZTY2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAyLXVz
ZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAyLXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRo
LWNvbmZpZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2MwMTYzZmQxN2I3ODI4NDQ5NWRh
MzgyMDIzMDc0ZWU3ZGQ2MjliNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWY3Y2Yy
ZTQ3NzA2OTdjMjRmOGQyNGNlOWY3OWI4NTQ4MTIwYmJmOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFNhdWwgV29sZCA8c2d3QGxpbnV4LmludGVsLmNvbT4KIERhdGU6IFdlZCwgMTYg
QXVnIDIwMTcgMTE6MTY6MzAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdXNlIHBrZ2NvbmZpZyBp
bnN0ZWFkIG9mIG5wdGggY29uZmlnCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9n
bnVwZy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQtdmVyc2lvbi1mb3ItYmV0YS1jaGVj
a2luZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDQtYXV0b2dl
bi5zaC1maXgtZmluZC12ZXJzaW9uLWZvci1iZXRhLWNoZWNraW5nLnBhdGNoCmluZGV4IDNiNGIw
MTcyMWEuLmZjN2Q5NjRlYzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBn
L2dudXBnLzAwMDQtYXV0b2dlbi5zaC1maXgtZmluZC12ZXJzaW9uLWZvci1iZXRhLWNoZWNraW5n
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDQtYXV0b2dl
bi5zaC1maXgtZmluZC12ZXJzaW9uLWZvci1iZXRhLWNoZWNraW5nLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAyNGFlMjFkY2U5ZmM3NTQ2NDY4NTgwYWIzN2RiM2JmOTU1OWU2ZWZjIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0ZDhjYzE5ODIyNzNkNTcxYjRlODBmZTk4MTg3OGQw
ZmE1ODg0MjM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogV2Vuem9uZyBGYW4gPHdl
bnpvbmcuZmFuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDE2IEF1ZyAyMDE3IDExOjIzOjIy
ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF1dG9nZW4uc2g6IGZpeCBmaW5kLXZlcnNpb24gZm9y
IGJldGEgY2hlY2tpbmcKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2du
dXBnL3JlbG9jYXRlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVs
b2NhdGUucGF0Y2gKaW5kZXggYjY3NzQ0NDE5ZS4uMWFlOGE1NjRkNCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvcmVsb2NhdGUucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGRiOWU0OTMzMTc2Yjc5MTkwNzcxMjBjZWRiOGE4YjBhNDBjMjExNWIgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDkxN2E5OGY5MzgwZDU4MTU0OGYzY2JiNTk0MjhjZWUzYTVj
MjliYWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5i
dXJ0b25AaW50ZWwuY29tPgogRGF0ZTogV2VkLCAxOSBTZXAgMjAxOCAxNDo0NDo0MCArMDEwMAog
U3ViamVjdDogW1BBVENIXSBBbGxvdyB0aGUgZW52aXJvbm1lbnQgdG8gb3ZlcnJpZGUgd2hlcmUg
Z251cGcgbG9va3MgZm9yIGl0cwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
cGcvZ251cGdfMi41LjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjUu
NC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9nbnVwZy9nbnVwZ18yLjUuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251
cGcvZ251cGdfMi41LjQuYmIKaW5kZXggY2NhNGZlYWY2Yy4uZTZhN2UzZmI0MCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi41LjMuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi41LjQuYmIKQEAgLTIzLDcgKzIzLDcgQEAgU1JD
X1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vMDAwMS1jb25maWd1cmUuYWMtdXNl
LWEtY3VzdG9tLXZhbHVlLWZvci0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmls
ZTovL3JlbG9jYXRlLnBhdGNoIgogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlc2RrID0gIiBm
aWxlOi8vcmVsb2NhdGUucGF0Y2giCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyMzEyOGIxMzZh
ZWQ0ZTUxMjFlNzkzZDFiNmM2MGVlNTBjODAwN2E5ZDkyNmMxMzEzZTUyNGQwNTM4NmI1NGFjIgor
U1JDX1VSSVtzaGEyNTZzdW1dID0gImY4Y2IyYWM2YzlmMTdmODFlMzU0MWM2MjE1ODc2NDkxMGZh
ZDVjM2EwNzY1ZTAwYjM5OGM0MWEzMmJjNGUwZWEiCiAKIEVYVFJBX09FQ09ORiA9ICItLWRpc2Fi
bGUtbGRhcCBcCiAJCS0tZGlzYWJsZS1jY2lkLWRyaXZlciBcCi0tIAoyLjQ0LjEKCg==

--===============5465351271863474632==--

