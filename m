Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF22FE77191
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:50 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.33350.1734254985912167728
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Fmn4HOvP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EzryX/zL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010193c9a70e9d-9b16dc6e-1571-4a1b-a888-ce11ffc2201e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5OcsXxZbR9Tr1S6IKD44F3euQ/mVkqz/cZRFqwWDWqM=;
	b=Fmn4HOvPm7JGPePyGEwu+0/39wPYtweAOmW04Y68Kk+AmlLyPpKlTjAwxbKgmBI7
	O8qT+rWyp88z8KeM8g9MMa5VQ019B+wYmN1IhNYzsyivWqS+7SDRODon2fbelSCZv6h
	N+tOdTrWCiEBFna6QQLIPTA0jZkHk1w9/KNkDNYc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5OcsXxZbR9Tr1S6IKD44F3euQ/mVkqz/cZRFqwWDWqM=;
	b=EzryX/zL22idHtwqYBTQp9puTz0k3ma7USVQShut4ZyG/NGAhwp19lhKuhreX5Zu
	fAUdRiKIwsFyU3ioLqUgn8zwGCEnoQB1UZ/W0EiLPszluIbUR26bK4wEiABZGY+4b8D
	ZLO2kqmm1WS5/4RxNXJOI4J/4tB9eQBfeceACqUc=
Content-Type: multipart/mixed; boundary="===============5369923511668228475=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.0.4 SUCCEEDED
Message-ID: <01010193c9a70e9d-9b16dc6e-1571-4a1b-a888-ce11ffc2201e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208737

--===============5369923511668228475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-appstream-upgrade-1.0.3-1.0.4.patch
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
From 13ae8013e30d05e12824cdd7ccf629dac62e5b63 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 08:45:58 +0000
Subject: [PATCH] appstream: upgrade 1.0.3 -> 1.0.4

---
 .../appstream/appstream/0001-remove-hardcoded-path.patch    | 6 +++---
 .../appstream/appstream/0002-Do-not-build-qt-tests.patch    | 6 +++---
 ...x-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch | 4 ++--
 .../appstream/{appstream_1.0.3.bb => appstream_1.0.4.bb}    | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.0.3.bb => appstream_1.0.4.bb} (94%)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index d4d5517ab1..f27b200406 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From 03f00252c2fc948c0bce1fc0a6ee87adef71d1bb Mon Sep 17 00:00:00 2001
+From ebc1b9fa1dab4677df16dce47a0140ce46a7cfc8 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 5f2eaa22..4a2483a1 100644
+index 7e89ab0..c34ea74 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -191,10 +191,10 @@ endif
+@@ -194,10 +194,10 @@ endif
  stemmer_inc_dirs = include_directories()
  if get_option('stemming')
      stemmer_lib = cc.find_library('stemmer', required: true)
diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index 9a725ab8e4..186aa7813c 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From a7721cf4f412fbe18fe15127bea7b1457b99f684 Mon Sep 17 00:00:00 2001
+From 8c657ac068af3219234287888d249344d43e9638 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
@@ -23,10 +23,10 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/qt/meson.build b/qt/meson.build
-index 1909bcf7..c3ca20fb 100644
+index 7d9ed7d..e319425 100644
 --- a/qt/meson.build
 +++ b/qt/meson.build
-@@ -148,5 +148,3 @@ install_data (
+@@ -150,5 +150,3 @@ install_data (
  
  # end of Qt version loop
  endforeach
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index e522a92e14..276e130ddb 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From c36b6226479a20ebd910f355deddb9d5c7571213 Mon Sep 17 00:00:00 2001
+From effe14b176320b8d4e36c9a258043747420f5769 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
@@ -39,7 +39,7 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/qt/cmake/AppStreamQtConfig.cmake.in b/qt/cmake/AppStreamQtConfig.cmake.in
-index 63df65f2..5ab2d0ec 100644
+index 63df65f..5ab2d0e 100644
 --- a/qt/cmake/AppStreamQtConfig.cmake.in
 +++ b/qt/cmake/AppStreamQtConfig.cmake.in
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-support/appstream/appstream_1.0.3.bb b/meta/recipes-support/appstream/appstream_1.0.4.bb
similarity index 94%
rename from meta/recipes-support/appstream/appstream_1.0.3.bb
rename to meta/recipes-support/appstream/appstream_1.0.4.bb
index 092d85d1a0..a9c87f7589 100644
--- a/meta/recipes-support/appstream/appstream_1.0.3.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.4.bb
@@ -30,7 +30,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "5ab6f6cf644e7875a9508593962e56bb430f4e59ae0bf03be6be7029deb6baa4"
+SRC_URI[sha256sum] = "2d218348067f98c4f34a3ffe2d8219ad9f504b1b2481f1872dec66c77bf37509"
 
 S = "${WORKDIR}/AppStream-${PV}"
 
-- 
2.44.1


--===============5369923511668228475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/appstream/appstream-dbg: FILELIST: removed "/usr/lib/.debug/libappstream.so.1.0.3", added "/usr/lib/.debug/libappstream.so.1.0.4"
packages/core2-64-poky-linux/appstream/appstream-dbg: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-dbg: PKGSIZE changed from 2588320 to 2589712 (+0%)
packages/core2-64-poky-linux/appstream/appstream-dbg: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-dev: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-dev: PKGSIZE changed from 1314624 to 1315071 (+0%)
packages/core2-64-poky-linux/appstream/appstream-dev: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-doc: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-doc: PKGSIZE changed from 2626434 to 2627630 (+0%)
packages/core2-64-poky-linux/appstream/appstream-doc: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ain: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-ain: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ar: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-ar: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-bn-bd: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-bn-bd: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-bn: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-bn: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ca: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-ca: PKGSIZE changed from 82184 to 115899 (+41%)
packages/core2-64-poky-linux/appstream/appstream-locale-ca: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ckb: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-ckb: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-cs: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-cs: PKGSIZE changed from 26908 to 27946 (+4%)
packages/core2-64-poky-linux/appstream/appstream-locale-cs: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-da: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-da: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-de: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-de: PKGSIZE changed from 109676 to 114119 (+4%)
packages/core2-64-poky-linux/appstream/appstream-locale-de: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-en-gb: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-en-gb: PKGSIZE changed from 91484 to 106795 (+17%)
packages/core2-64-poky-linux/appstream/appstream-locale-en-gb: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-eo: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-eo: PKGSIZE changed from 65198 to 73497 (+13%)
packages/core2-64-poky-linux/appstream/appstream-locale-eo: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-es: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-es: PKGSIZE changed from 115933 to 116011 (+0%)
packages/core2-64-poky-linux/appstream/appstream-locale-es: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-et: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-et: PKGSIZE changed from 16651 to 18073 (+9%)
packages/core2-64-poky-linux/appstream/appstream-locale-et: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-eu: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-eu: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-fi: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-fi: PKGSIZE changed from 18658 to 18781 (+1%)
packages/core2-64-poky-linux/appstream/appstream-locale-fi: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-fr: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-fr: PKGSIZE changed from 100689 to 100489 (-0%)
packages/core2-64-poky-linux/appstream/appstream-locale-fr: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-gd: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-gd: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-gl: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-gl: PKGSIZE changed from 97084 to 96918 (-0%)
packages/core2-64-poky-linux/appstream/appstream-locale-gl: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-he: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-he: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-hi: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-hi: PKGSIZE changed from 1103 to 171195 (+15421%)
packages/core2-64-poky-linux/appstream/appstream-locale-hi: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-hr: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-hr: PKGSIZE changed from 94065 to 93907 (-0%)
packages/core2-64-poky-linux/appstream/appstream-locale-hr: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-hu: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-hu: PKGSIZE changed from 84473 to 84269 (-0%)
packages/core2-64-poky-linux/appstream/appstream-locale-hu: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ia: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-ia: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-id: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-id: PKGSIZE changed from 93351 to 110492 (+18%)
packages/core2-64-poky-linux/appstream/appstream-locale-id: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-it: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-it: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ja: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-ja: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ka: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-ka: PKGSIZE changed from 35605 to 36926 (+4%)
packages/core2-64-poky-linux/appstream/appstream-locale-ka: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ko: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-ko: PKGSIZE changed from 93489 to 93317 (-0%)
packages/core2-64-poky-linux/appstream/appstream-locale-ko: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-lt: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-lt: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-nb: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-nb: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-nl: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-nl: PKGSIZE changed from 59031 to 65704 (+11%)
packages/core2-64-poky-linux/appstream/appstream-locale-nl: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-oc: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-oc: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-pl: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-pl: PKGSIZE changed from 116059 to 115679 (-0%)
packages/core2-64-poky-linux/appstream/appstream-locale-pl: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-pt-br: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-pt-br: PKGSIZE changed from 114242 to 114352 (+0%)
packages/core2-64-poky-linux/appstream/appstream-locale-pt-br: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-pt: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-pt: PKGSIZE changed from 114501 to 114603 (+0%)
packages/core2-64-poky-linux/appstream/appstream-locale-pt: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ro: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-ro: PKGSIZE changed from 53948 to 119060 (+121%)
packages/core2-64-poky-linux/appstream/appstream-locale-ro: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-rom: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-rom: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-ru: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-ru: PKGSIZE changed from 139146 to 148326 (+7%)
packages/core2-64-poky-linux/appstream/appstream-locale-ru: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sk: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-sk: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sl: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-sl: PKGSIZE changed from 12103 to 110962 (+817%)
packages/core2-64-poky-linux/appstream/appstream-locale-sl: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sr+latin: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-sr+latin: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sr: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-sr: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-sv: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-sv: PKGSIZE changed from 110519 to 110155 (-0%)
packages/core2-64-poky-linux/appstream/appstream-locale-sv: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-tr: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-tr: PKGSIZE changed from 113543 to 113184 (-0%)
packages/core2-64-poky-linux/appstream/appstream-locale-tr: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-uk: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-uk: PKGSIZE changed from 151453 to 151555 (+0%)
packages/core2-64-poky-linux/appstream/appstream-locale-uk: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-zh-cn: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-zh-cn: PKGSIZE changed from 101756 to 101901 (+0%)
packages/core2-64-poky-linux/appstream/appstream-locale-zh-cn: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-locale-zh-tw: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-locale-zh-tw: PKGSIZE changed from 30330 to 30868 (+2%)
packages/core2-64-poky-linux/appstream/appstream-locale-zh-tw: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-src: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-src: PKGSIZE changed from 1846561 to 1851011 (+0%)
packages/core2-64-poky-linux/appstream/appstream-src: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream-staticdev: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream-staticdev: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.0.3", added "/usr/lib/libappstream.so.1.0.4"
packages/core2-64-poky-linux/appstream/appstream: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream/appstream: PKGSIZE changed from 1025009 to 1043197 (+2%)
packages/core2-64-poky-linux/appstream/appstream: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream: PV changed from "1.0.3" to "1.0.4"
packages/core2-64-poky-linux/appstream: PKGV changed from 1.0.3 [default] to 1.0.4 [default]
packages/core2-64-poky-linux/appstream: SRC_URI changed from "https://www.freedesktop.org/software/appstream/releases/AppStream-1.0.3.tar.xz file://0001-remove-hardcoded-path.patch file://0002-Do-not-build-qt-tests.patch file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch" to "https://www.freedesktop.org/software/appstream/releases/AppStream-1.0.4.tar.xz file://0001-remove-hardcoded-path.patch file://0002-Do-not-build-qt-tests.patch file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch"
packages/core2-64-poky-linux/appstream: PACKAGES: added "appstream-locale-ta"
Changes to packages/core2-64-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.3 to libappstream.so.1.0.4
  /usr/lib/libappstream.so.1.0.3 moved to /usr/lib/libappstream.so.1.0.4
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.3 to libappstream.so.1.0.4
  /usr/lib/libappstream.so.1.0.3 moved to /usr/lib/libappstream.so.1.0.4

--===============5369923511668228475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/appstream/appstream-locale-ca: PKGSIZE changed from 82184 to 115899 (+41%)
packages/core2-64-poky-linux/appstream/appstream-locale-en-gb: PKGSIZE changed from 91484 to 106795 (+17%)
packages/core2-64-poky-linux/appstream/appstream-locale-eo: PKGSIZE changed from 65198 to 73497 (+13%)
packages/core2-64-poky-linux/appstream/appstream-locale-hi: PKGSIZE changed from 1103 to 171195 (+15421%)
packages/core2-64-poky-linux/appstream/appstream-locale-id: PKGSIZE changed from 93351 to 110492 (+18%)
packages/core2-64-poky-linux/appstream/appstream-locale-nl: PKGSIZE changed from 59031 to 65704 (+11%)
packages/core2-64-poky-linux/appstream/appstream-locale-ro: PKGSIZE changed from 53948 to 119060 (+121%)
packages/core2-64-poky-linux/appstream/appstream-locale-sl: PKGSIZE changed from 12103 to 110962 (+817%)
packages/core2-64-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.0.3", added "/usr/lib/libappstream.so.1.0.4"
packages/core2-64-poky-linux/appstream: PACKAGES: added "appstream-locale-ta"
Changes to packages/core2-64-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.3 to libappstream.so.1.0.4
  /usr/lib/libappstream.so.1.0.3 moved to /usr/lib/libappstream.so.1.0.4
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.0.3 to libappstream.so.1.0.4
  /usr/lib/libappstream.so.1.0.3 moved to /usr/lib/libappstream.so.1.0.4

--===============5369923511668228475==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-appstream-upgrade-1.0.3-1.0.4.patch"

RnJvbSAxM2FlODAxM2UzMGQwNWUxMjgyNGNkZDdjY2Y2MjlkYWM2MmU1YjYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDg6NDU6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
cHBzdHJlYW06IHVwZ3JhZGUgMS4wLjMgLT4gMS4wLjQKCi0tLQogLi4uL2FwcHN0cmVhbS9hcHBz
dHJlYW0vMDAwMS1yZW1vdmUtaGFyZGNvZGVkLXBhdGgucGF0Y2ggICAgfCA2ICsrKy0tLQogLi4u
L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMi1Eby1ub3QtYnVpbGQtcXQtdGVzdHMucGF0Y2ggICAg
fCA2ICsrKy0tLQogLi4ueC1QQUNLQUdFX1BSRUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFt
UXRDb25maWcucGF0Y2ggfCA0ICsrLS0KIC4uLi9hcHBzdHJlYW0ve2FwcHN0cmVhbV8xLjAuMy5i
YiA9PiBhcHBzdHJlYW1fMS4wLjQuYmJ9ICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQv
YXBwc3RyZWFtL3thcHBzdHJlYW1fMS4wLjMuYmIgPT4gYXBwc3RyZWFtXzEuMC40LmJifSAoOTQl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0v
MDAwMS1yZW1vdmUtaGFyZGNvZGVkLXBhdGgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9h
cHBzdHJlYW0vYXBwc3RyZWFtLzAwMDEtcmVtb3ZlLWhhcmRjb2RlZC1wYXRoLnBhdGNoCmluZGV4
IGQ0ZDU1MTdhYjEuLmYyN2IyMDA0MDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMS1yZW1vdmUtaGFyZGNvZGVkLXBhdGgucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAxLXJlbW92ZS1o
YXJkY29kZWQtcGF0aC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDNmMDAyNTJjMmZjOTQ4
YzBiY2UxZmMwYTZlZTg3YWRlZjcxZDFiYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
ZWJjMWI5ZmExZGFiNDY3N2RmMTZkY2U0N2EwMTQwY2U0NmE3Y2ZjOCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IE1hcmt1cyBWb2xrIDxmX2xfa0B0LW9ubGluZS5kZT4KIERhdGU6IE1v
biwgMTIgRGVjIDIwMjIgMTU6NDI6NDIgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gcmVtb3ZlIGhh
cmRjb2RlZCBwYXRoCkBAIC0xNCwxMCArMTQsMTAgQEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJv
cHJpYXRlIFtvZS1zcGVjaWZpY10KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAot
aW5kZXggNWYyZWFhMjIuLjRhMjQ4M2ExIDEwMDY0NAoraW5kZXggN2U4OWFiMC4uYzM0ZWE3NCAx
MDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAotQEAgLTE5MSwxMCAr
MTkxLDEwIEBAIGVuZGlmCitAQCAtMTk0LDEwICsxOTQsMTAgQEAgZW5kaWYKICBzdGVtbWVyX2lu
Y19kaXJzID0gaW5jbHVkZV9kaXJlY3RvcmllcygpCiAgaWYgZ2V0X29wdGlvbignc3RlbW1pbmcn
KQogICAgICBzdGVtbWVyX2xpYiA9IGNjLmZpbmRfbGlicmFyeSgnc3RlbW1lcicsIHJlcXVpcmVk
OiB0cnVlKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0
cmVhbS8wMDAyLURvLW5vdC1idWlsZC1xdC10ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMi1Eby1ub3QtYnVpbGQtcXQtdGVzdHMucGF0Y2gK
aW5kZXggOWE3MjVhYjhlNC4uMTg2YWE3ODEzYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAyLURvLW5vdC1idWlsZC1xdC10ZXN0cy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDItRG8t
bm90LWJ1aWxkLXF0LXRlc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBhNzcyMWNmNGY0
MTJmYmUxOGZlMTUxMjdiZWE3YjE0NTdiOTlmNjg0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA4YzY1N2FjMDY4YWYzMjE5MjM0Mjg3ODg4ZDI0OTM0NGQ0M2U5NjM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogTWFyYyBGZXJsYW5kIDxtYXJjLmZlcmxhbmRAc29uYXRlc3Qu
Y29tPgogRGF0ZTogRnJpLCAyNiBKdWwgMjAyNCAxNTo0MTowMCAtMDQwMAogU3ViamVjdDogW1BB
VENIXSBEbyBub3QgYnVpbGQgcXQvdGVzdHMKQEAgLTIzLDEwICsyMywxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBNYXJjIEZlcmxhbmQgPG1hcmMuZmVybGFuZEBzb25hdGVzdC5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9xdC9tZXNvbi5idWlsZCBiL3F0
L21lc29uLmJ1aWxkCi1pbmRleCAxOTA5YmNmNy4uYzNjYTIwZmIgMTAwNjQ0CitpbmRleCA3ZDll
ZDdkLi5lMzE5NDI1IDEwMDY0NAogLS0tIGEvcXQvbWVzb24uYnVpbGQKICsrKyBiL3F0L21lc29u
LmJ1aWxkCi1AQCAtMTQ4LDUgKzE0OCwzIEBAIGluc3RhbGxfZGF0YSAoCitAQCAtMTUwLDUgKzE1
MCwzIEBAIGluc3RhbGxfZGF0YSAoCiAgCiAgIyBlbmQgb2YgUXQgdmVyc2lvbiBsb29wCiAgZW5k
Zm9yZWFjaApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0
cmVhbS8wMDAzLUZpeC1QQUNLQUdFX1BSRUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFtUXRD
b25maWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAw
MDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5w
YXRjaAppbmRleCBlNTIyYTkyZTE0Li4yNzZlMTMwZGRiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJ
Ui1pbi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJUi1p
bi1xdC1jbWFrZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
YzM2YjYyMjY0NzlhMjBlYmQ5MTBmMzU1ZGVkZGI5ZDVjNzU3MTIxMyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZWZmZTE0YjE3NjMyMGI4ZDRlMzZjOWEyNTgwNDM3NDc0MjBmNTc2OSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcmMgRmVybGFuZCA8bWFyYy5mZXJsYW5k
QHNvbmF0ZXN0LmNvbT4KIERhdGU6IE1vbiwgMjkgSnVsIDIwMjQgMDk6MzU6NTEgLTA0MDAKIFN1
YmplY3Q6IFtQQVRDSF0gRml4IFBBQ0tBR0VfUFJFRklYX0RJUiBpbiBxdC9jbWFrZS9BcHBTdHJl
YW1RdENvbmZpZy5jbWFrZS5pbgpAQCAtMzksNyArMzksNyBAQCBTaWduZWQtb2ZmLWJ5OiBNYXJj
IEZlcmxhbmQgPG1hcmMuZmVybGFuZEBzb25hdGVzdC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9xdC9jbWFrZS9BcHBT
dHJlYW1RdENvbmZpZy5jbWFrZS5pbiBiL3F0L2NtYWtlL0FwcFN0cmVhbVF0Q29uZmlnLmNtYWtl
LmluCi1pbmRleCA2M2RmNjVmMi4uNWFiMmQwZWMgMTAwNjQ0CitpbmRleCA2M2RmNjVmLi41YWIy
ZDBlIDEwMDY0NAogLS0tIGEvcXQvY21ha2UvQXBwU3RyZWFtUXRDb25maWcuY21ha2UuaW4KICsr
KyBiL3F0L2NtYWtlL0FwcFN0cmVhbVF0Q29uZmlnLmNtYWtlLmluCiBAQCAtMSw1ICsxLDUgQEAK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4w
LjMuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEuMC40LmJi
CnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2Fw
cHN0cmVhbS9hcHBzdHJlYW1fMS4wLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4wLjQuYmIKaW5kZXggMDkyZDg1ZDFhMC4uYTljODdmNzU4
OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbV8x
LjAuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEu
MC40LmJiCkBAIC0zMCw3ICszMCw3IEBAIFNSQ19VUkkgPSAiIFwKIAlmaWxlOi8vMDAwMi1Eby1u
b3QtYnVpbGQtcXQtdGVzdHMucGF0Y2ggXAogCWZpbGU6Ly8wMDAzLUZpeC1QQUNLQUdFX1BSRUZJ
WF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFtUXRDb25maWcucGF0Y2ggXAogIgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjVhYjZmNmNmNjQ0ZTc4NzVhOTUwODU5Mzk2MmU1NmJiNDMwZjRlNTlhZTBi
ZjAzYmU2YmU3MDI5ZGViNmJhYTQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmQyMTgzNDgwNjdm
OThjNGYzNGEzZmZlMmQ4MjE5YWQ5ZjUwNGIxYjI0ODFmMTg3MmRlYzY2Yzc3YmYzNzUwOSIKIAog
UyA9ICIke1dPUktESVJ9L0FwcFN0cmVhbS0ke1BWfSIKIAotLSAKMi40NC4xCgo=

--===============5369923511668228475==--

