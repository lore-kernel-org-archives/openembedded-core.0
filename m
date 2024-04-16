Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC58C3DA43
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:14 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.13590.1713248038848929704
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eKmOW8DV;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=z519Txj2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018ee58aa2f0-7a5bf17d-7058-4538-a0b7-9eba003e8916-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=moXklLxFoqZ2c3X6OtonJQOjt/3B0jlZm0rJqz7qlzc=;
	b=eKmOW8DVk9k8Dyt1y3I2t9e2k24+eGLuZDnNHZABYN4Po4pcCEKH/AqvwwzxPgkZ
	7JIor+qpTck862+xzHfqUhAeLcx49z6wBtAgB9h6+jlxPAOZW6KTGlSQri5KH7xNZJc
	u4AD//3N/SBQl2eFuzhXVl7XS0asfqpHZxmLsKBk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248052;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=moXklLxFoqZ2c3X6OtonJQOjt/3B0jlZm0rJqz7qlzc=;
	b=z519Txj2JZRa9rNscROcIL5gZzFYQZhuia2fAlW+xxAdhguO6XzoTs/fUGVmyqIk
	rtG2fpIaSPa2EDQHowW6fVd3H03IUxTtjHcB+tMsPhhkr35Sg4lcC9Z/loOwR0UgrzZ
	lZYYebnvAxIzzEL5nUogGGqRT7cvc5E5kv42ApTA=
Content-Type: multipart/mixed; boundary="===============0100724431363750241=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnupg: upgrading to 2.4.5 SUCCEEDED
Message-ID: <0101018ee58aa2f0-7a5bf17d-7058-4538-a0b7-9eba003e8916-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198413

--===============0100724431363750241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnupg* to *2.4.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gnupg-upgrade-2.4.4-2.4.5.patch
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
From 34b4e146772b44c2b814e5c1357c7b0aa55f1a09 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Apr 2024 04:23:41 +0000
Subject: [PATCH] gnupg: upgrade 2.4.4 -> 2.4.5

---
 .../0001-Woverride-init-is-not-needed-with-gcc-9.patch     | 7 ++-----
 ...figure.ac-use-a-custom-value-for-the-location-of-.patch | 5 ++---
 .../gnupg/0002-use-pkgconfig-instead-of-npth-config.patch  | 3 +--
 ...004-autogen.sh-fix-find-version-for-beta-checking.patch | 3 +--
 meta/recipes-support/gnupg/gnupg/relocate.patch            | 3 +--
 .../gnupg/{gnupg_2.4.4.bb => gnupg_2.4.5.bb}               | 2 +-
 6 files changed, 8 insertions(+), 15 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.4.4.bb => gnupg_2.4.5.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 83195b5bd4..33f5e12c43 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From e3adc816d2d56dd929016073937ba24e01e03cb8 Mon Sep 17 00:00:00 2001
+From 24998196309f2a1c622e44f94ab87acde11aaabc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dirmngr/dns.h b/dirmngr/dns.h
-index 024d6dcc8..c6e141e16 100644
+index 1f647e1..334acb6 100644
 --- a/dirmngr/dns.h
 +++ b/dirmngr/dns.h
 @@ -139,7 +139,7 @@ DNS_PUBLIC int *dns_debug_p(void);
@@ -29,6 +29,3 @@ index 024d6dcc8..c6e141e16 100644
  #define DNS_PRAGMA_PUSH _Pragma("GCC diagnostic push")
  #define DNS_PRAGMA_QUIET _Pragma("GCC diagnostic ignored \"-Woverride-init\"")
  #define DNS_PRAGMA_POP _Pragma("GCC diagnostic pop")
--- 
-2.17.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index f957f6b55e..2252e8ee3a 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 6b581c43bd01f815db78a410fd3814fc5994171e Mon Sep 17 00:00:00 2001
+From 925d72a0417edeb6b4e25101b0b7dd36bf107baa Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -8,13 +8,12 @@ This should avoid clashes with the host gpg-agent observed on autobuilders.
 
 Upstream-Status: Inappropriate [oe-core specific, and only for -native]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 26d7f7b..e953c2e 100644
+index ac4f08c..90f77e9 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1921,7 +1921,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 0e58fd4c4d..82c93a1aee 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From d9048788d906774b1475c3bb1b17e22455c2add4 Mon Sep 17 00:00:00 2001
+From 3c96d50c63f4fef43efeeed3b76876af19ca700f Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
@@ -9,7 +9,6 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  m4/npth.m4 | 53 ++++++++---------------------------------------------
  1 file changed, 8 insertions(+), 45 deletions(-)
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index d664c36a1b..1ea86fe9fb 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From 6a7f9b71d936847dcaeeac7d1b69d8299be4dd85 Mon Sep 17 00:00:00 2001
+From bd0934cd1968d47a9d37307efd9d01df5bfffd41 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
@@ -13,7 +13,6 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  autogen.sh | 1 -
  1 file changed, 1 deletion(-)
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index ea0252026a..33cacf2e27 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From c50d0a95fcf8f96c272fadd4ba85f3eeac39fcaf Mon Sep 17 00:00:00 2001
+From 3ef0769bf5d1177b09b35189e3da7020bd216f99 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -8,7 +8,6 @@ Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  common/homedir.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.4.bb b/meta/recipes-support/gnupg/gnupg_2.4.5.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.4.4.bb
rename to meta/recipes-support/gnupg/gnupg_2.4.5.bb
index fff7d8c6da..99996968b1 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.5.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "67ebe016ca90fa7688ce67a387ebd82c6261e95897db7b23df24ff335be85bc6"
+SRC_URI[sha256sum] = "f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.42.0


--===============0100724431363750241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gnupg/gnupg-dbg: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-dbg: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-dbg: PKGSIZE changed from 20025304 to 20050800 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-dev: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-dev: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-doc: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-doc: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-doc: PKGSIZE changed from 1192073 to 1197789 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-gpg: PKGSIZE changed from 1591348 to 1591412 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ca: PKGSIZE changed from 43079 to 43010 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-cs: PKGSIZE changed from 242046 to 241869 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-da: PKGSIZE changed from 131289 to 131114 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-de: PKGSIZE changed from 245737 to 245682 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-el: PKGSIZE changed from 56980 to 56832 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+boldquot: PKGSIZE changed from 223900 to 223838 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-en+quot: PKGSIZE changed from 221524 to 221462 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-eo: PKGSIZE changed from 28129 to 28068 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-es: PKGSIZE changed from 214798 to 214598 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-et: PKGSIZE changed from 41307 to 41196 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-fi: PKGSIZE changed from 42844 to 42743 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-fr: PKGSIZE changed from 201025 to 200784 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-gl: PKGSIZE changed from 42748 to 42679 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-hu: PKGSIZE changed from 44209 to 44132 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-id: PKGSIZE changed from 41136 to 41028 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-it: PKGSIZE changed from 235749 to 235558 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ja: PKGSIZE changed from 252952 to 252874 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-nb: PKGSIZE changed from 209933 to 209765 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-pl: PKGSIZE changed from 239518 to 244708 (+2%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-pt: PKGSIZE changed from 235642 to 235472 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ro: PKGSIZE changed from 82627 to 82533 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-ru: PKGSIZE changed from 289694 to 289444 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-sk: PKGSIZE changed from 43728 to 43653 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-sv: PKGSIZE changed from 131585 to 131364 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-tr: PKGSIZE changed from 240902 to 240726 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-uk: PKGSIZE changed from 295138 to 294862 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-cn: PKGSIZE changed from 219889 to 219732 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-locale-zh-tw: PKGSIZE changed from 174337 to 174172 (-0%)
packages/core2-64-poky-linux/gnupg/gnupg-src: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-src: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg-src: PKGSIZE changed from 8838039 to 8853319 (+0%)
packages/core2-64-poky-linux/gnupg/gnupg-staticdev: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg-staticdev: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg/gnupg: PV changed from "2.4.4" to "2.4.5"
packages/core2-64-poky-linux/gnupg/gnupg: PKGSIZE changed from 4631309 to 4639661 (+0%)
packages/core2-64-poky-linux/gnupg: PKGV changed from 2.4.4 [default] to 2.4.5 [default]
packages/core2-64-poky-linux/gnupg: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.4.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch" to "https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.4.5.tar.bz2 file://0002-use-pkgconfig-instead-of-npth-config.patch file://0004-autogen.sh-fix-find-version-for-beta-checking.patch file://0001-Woverride-init-is-not-needed-with-gcc-9.patch"
packages/core2-64-poky-linux/gnupg: PV changed from "2.4.4" to "2.4.5"

--===============0100724431363750241==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gnupg-upgrade-2.4.4-2.4.5.patch"

RnJvbSAzNGI0ZTE0Njc3MmI0NGMyYjgxNGU1YzEzNTdjN2IwYWE1NWYxYTA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgQXByIDIwMjQgMDQ6MjM6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bnVwZzogdXBncmFkZSAyLjQuNCAtPiAyLjQuNQoKLS0tCiAuLi4vMDAwMS1Xb3ZlcnJpZGUtaW5p
dC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2ggICAgIHwgNyArKy0tLS0tCiAuLi5maWd1
cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoIHwgNSAr
Ky0tLQogLi4uL2dudXBnLzAwMDItdXNlLXBrZ2NvbmZpZy1pbnN0ZWFkLW9mLW5wdGgtY29uZmln
LnBhdGNoICB8IDMgKy0tCiAuLi4wMDQtYXV0b2dlbi5zaC1maXgtZmluZC12ZXJzaW9uLWZvci1i
ZXRhLWNoZWNraW5nLnBhdGNoIHwgMyArLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2du
dXBnL3JlbG9jYXRlLnBhdGNoICAgICAgICAgICAgfCAzICstLQogLi4uL2dudXBnL3tnbnVwZ18y
LjQuNC5iYiA9PiBnbnVwZ18yLjQuNS5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDYgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9nbnVwZy97Z251cGdfMi40LjQuYmIgPT4gZ251cGdfMi40LjUuYmJ9ICg5
NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1X
b3ZlcnJpZGUtaW5pdC1pcy1ub3QtbmVlZGVkLXdpdGgtZ2NjLTkucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLVdvdmVycmlkZS1pbml0LWlzLW5vdC1uZWVkZWQt
d2l0aC1nY2MtOS5wYXRjaAppbmRleCA4MzE5NWI1YmQ0Li4zM2Y1ZTEyYzQzIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAxLVdvdmVycmlkZS1pbml0LWlz
LW5vdC1uZWVkZWQtd2l0aC1nY2MtOS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9n
bnVwZy9nbnVwZy8wMDAxLVdvdmVycmlkZS1pbml0LWlzLW5vdC1uZWVkZWQtd2l0aC1nY2MtOS5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTNhZGM4MTZkMmQ1NmRkOTI5MDE2MDczOTM3YmEy
NGUwMWUwM2NiOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjQ5OTgxOTYzMDlmMmEx
YzYyMmU0NGY5NGFiODdhY2RlMTFhYWFiYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDIwIERlYyAyMDE4IDE3
OjM3OjQ4IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIFdvdmVycmlkZS1pbml0IGlzIG5vdCBuZWVk
ZWQgd2l0aCBnY2MgOQpAQCAtMTcsNyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZGlybW5nci9kbnMuaCBiL2Rpcm1uZ3IvZG5zLmgK
LWluZGV4IDAyNGQ2ZGNjOC4uYzZlMTQxZTE2IDEwMDY0NAoraW5kZXggMWY2NDdlMS4uMzM0YWNi
NiAxMDA2NDQKIC0tLSBhL2Rpcm1uZ3IvZG5zLmgKICsrKyBiL2Rpcm1uZ3IvZG5zLmgKIEBAIC0x
MzksNyArMTM5LDcgQEAgRE5TX1BVQkxJQyBpbnQgKmRuc19kZWJ1Z19wKHZvaWQpOwpAQCAtMjks
NiArMjksMyBAQCBpbmRleCAwMjRkNmRjYzguLmM2ZTE0MWUxNiAxMDA2NDQKICAjZGVmaW5lIERO
U19QUkFHTUFfUFVTSCBfUHJhZ21hKCJHQ0MgZGlhZ25vc3RpYyBwdXNoIikKICAjZGVmaW5lIERO
U19QUkFHTUFfUVVJRVQgX1ByYWdtYSgiR0NDIGRpYWdub3N0aWMgaWdub3JlZCBcIi1Xb3ZlcnJp
ZGUtaW5pdFwiIikKICAjZGVmaW5lIEROU19QUkFHTUFfUE9QIF9QcmFnbWEoIkdDQyBkaWFnbm9z
dGljIHBvcCIpCi0tLSAKLTIuMTcuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9nbnVwZy9nbnVwZy8wMDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRo
ZS1sb2NhdGlvbi1vZi0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8w
MDAxLWNvbmZpZ3VyZS5hYy11c2UtYS1jdXN0b20tdmFsdWUtZm9yLXRoZS1sb2NhdGlvbi1vZi0u
cGF0Y2gKaW5kZXggZjk1N2Y2YjU1ZS4uMjI1MmU4ZWUzYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAwMS1jb25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZh
bHVlLWZvci10aGUtbG9jYXRpb24tb2YtLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2dudXBnL2dudXBnLzAwMDEtY29uZmlndXJlLmFjLXVzZS1hLWN1c3RvbS12YWx1ZS1mb3ItdGhl
LWxvY2F0aW9uLW9mLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmI1ODFjNDNiZDAxZjgx
NWRiNzhhNDEwZmQzODE0ZmM1OTk0MTcxZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
OTI1ZDcyYTA0MTdlZGViNmI0ZTI1MTAxYjBiN2RkMzZiZjEwN2JhYSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgogRGF0ZTogTW9uLCAyMiBKYW4gMjAxOCAxODowMDoyMSArMDIwMAogU3ViamVjdDogW1BBVENI
XSBjb25maWd1cmUuYWM6IHVzZSBhIGN1c3RvbSB2YWx1ZSBmb3IgdGhlIGxvY2F0aW9uIG9mCkBA
IC04LDEzICs4LDEyIEBAIFRoaXMgc2hvdWxkIGF2b2lkIGNsYXNoZXMgd2l0aCB0aGUgaG9zdCBn
cGctYWdlbnQgb2JzZXJ2ZWQgb24gYXV0b2J1aWxkZXJzLgogCiBVcHN0cmVhbS1TdGF0dXM6IElu
YXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWMsIGFuZCBvbmx5IGZvciAtbmF0aXZlXQogU2ln
bmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+Ci0K
IC0tLQogIGNvbmZpZ3VyZS5hYyB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3Vy
ZS5hYwotaW5kZXggMjZkN2Y3Yi4uZTk1M2MyZSAxMDA2NDQKK2luZGV4IGFjNGYwOGMuLjkwZjc3
ZTkgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTE5
MjEsNyArMTkyMSw3IEBAIEFDX0RFRklORV9VTlFVT1RFRChHUEdDT05GX0RJU1BfTkFNRSwgIkdQ
R0NvbmYiLApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGcvMDAw
Mi11c2UtcGtnY29uZmlnLWluc3RlYWQtb2YtbnB0aC1jb25maWcucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAyLXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRo
LWNvbmZpZy5wYXRjaAppbmRleCAwZTU4ZmQ0YzRkLi44MmM5M2ExYWVlIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDAyLXVzZS1wa2djb25maWctaW5zdGVh
ZC1vZi1ucHRoLWNvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9n
bnVwZy8wMDAyLXVzZS1wa2djb25maWctaW5zdGVhZC1vZi1ucHRoLWNvbmZpZy5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gZDkwNDg3ODhkOTA2Nzc0YjE0NzVjM2JiMWIxN2UyMjQ1NWMyYWRk
NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2M5NmQ1MGM2M2Y0ZmVmNDNlZmVlZWQz
Yjc2ODc2YWYxOWNhNzAwZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFNhdWwgV29s
ZCA8c2d3QGxpbnV4LmludGVsLmNvbT4KIERhdGU6IFdlZCwgMTYgQXVnIDIwMTcgMTE6MTY6MzAg
KzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdXNlIHBrZ2NvbmZpZyBpbnN0ZWFkIG9mIG5wdGggY29u
ZmlnCkBAIC05LDcgKzksNiBAQCBTaWduZWQtb2ZmLWJ5OiBTYXVsIFdvbGQgPHNnd0BsaW51eC5p
bnRlbC5jb20+CiAKIFJlYmFzZSB0byAyLjEuMjMKIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEg
PGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KLQogLS0tCiAgbTQvbnB0aC5tNCB8IDUzICsrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAgMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZy8wMDA0LWF1dG9nZW4uc2gtZml4LWZpbmQt
dmVyc2lvbi1mb3ItYmV0YS1jaGVja2luZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2du
dXBnL2dudXBnLzAwMDQtYXV0b2dlbi5zaC1maXgtZmluZC12ZXJzaW9uLWZvci1iZXRhLWNoZWNr
aW5nLnBhdGNoCmluZGV4IGQ2NjRjMzZhMWIuLjFlYTg2ZmU5ZmIgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnLzAwMDQtYXV0b2dlbi5zaC1maXgtZmluZC12ZXJz
aW9uLWZvci1iZXRhLWNoZWNraW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2du
dXBnL2dudXBnLzAwMDQtYXV0b2dlbi5zaC1maXgtZmluZC12ZXJzaW9uLWZvci1iZXRhLWNoZWNr
aW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2YTdmOWI3MWQ5MzY4NDdkY2FlZWFjN2Qx
YjY5ZDgyOTliZTRkZDg1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiZDA5MzRjZDE5
NjhkNDdhOWQzNzMwN2VmZDlkMDFkZjViZmZmZDQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogV2Vuem9uZyBGYW4gPHdlbnpvbmcuZmFuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQs
IDE2IEF1ZyAyMDE3IDExOjIzOjIyICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF1dG9nZW4uc2g6
IGZpeCBmaW5kLXZlcnNpb24gZm9yIGJldGEgY2hlY2tpbmcKQEAgLTEzLDcgKzEzLDYgQEAgU2ln
bmVkLW9mZi1ieTogV2Vuem9uZyBGYW4gPHdlbnpvbmcuZmFuQHdpbmRyaXZlci5jb20+CiAKIFJl
YmFzZSB0byAyLjEuMjMKIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2lu
ZHJpdmVyLmNvbT4KLQogLS0tCiAgYXV0b2dlbi5zaCB8IDEgLQogIDEgZmlsZSBjaGFuZ2VkLCAx
IGRlbGV0aW9uKC0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVw
Zy9yZWxvY2F0ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9j
YXRlLnBhdGNoCmluZGV4IGVhMDI1MjAyNmEuLjMzY2FjZjJlMjcgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9jYXRlLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2dudXBnL2dudXBnL3JlbG9jYXRlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBjNTBkMGE5NWZjZjhmOTZjMjcyZmFkZDRiYTg1ZjNlZWFjMzlmY2FmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAzZWYwNzY5YmY1ZDExNzdiMDliMzUxODllM2RhNzAyMGJkMjE2
Zjk5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVy
dG9uQGludGVsLmNvbT4KIERhdGU6IFdlZCwgMTkgU2VwIDIwMTggMTQ6NDQ6NDAgKzAxMDAKIFN1
YmplY3Q6IFtQQVRDSF0gQWxsb3cgdGhlIGVudmlyb25tZW50IHRvIG92ZXJyaWRlIHdoZXJlIGdu
dXBnIGxvb2tzIGZvciBpdHMKQEAgLTgsNyArOCw2IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHBy
b3ByaWF0ZSBbT0Utc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5i
dXJ0b25AaW50ZWwuY29tPgogCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eEBsaW51dHJvbml4LmRlPgotCiAtLS0KICBjb21tb24vaG9tZWRpci5jIHwgMTQgKysrKysrKy0t
LS0tLS0KICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi40LjQuYmIgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjQuNS5iYgpzaW1pbGFyaXR5IGluZGV4
IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9nbnVwZy9nbnVwZ18yLjQuNC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcvZ251cGdfMi40LjUuYmIKaW5k
ZXggZmZmN2Q4YzZkYS4uOTk5OTY5NjhiMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvZ251cGcvZ251cGdfMi40LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ251cGcv
Z251cGdfMi40LjUuYmIKQEAgLTIzLDcgKzIzLDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0
aXZlID0gIiBmaWxlOi8vMDAwMS1jb25maWd1cmUuYWMtdXNlLWEtY3VzdG9tLXZhbHVlLWZvci0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3JlbG9jYXRlLnBhdGNoIgog
U1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlc2RrID0gIiBmaWxlOi8vcmVsb2NhdGUucGF0Y2gi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2N2ViZTAxNmNhOTBmYTc2ODhjZTY3YTM4N2ViZDgy
YzYyNjFlOTU4OTdkYjdiMjNkZjI0ZmYzMzViZTg1YmM2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImY2OGY3ZDc1ZDA2Y2IxNjM1YzMzNmQzNGQ4NDRhZjk3NDM2YzNmNjRlYTE0YmNiN2M4Njk3ODJm
OTZmNDQyNzciCiAKIEVYVFJBX09FQ09ORiA9ICItLWRpc2FibGUtbGRhcCBcCiAJCS0tZGlzYWJs
ZS1jY2lkLWRyaXZlciBcCi0tIAoyLjQyLjAKCg==

--===============0100724431363750241==--

