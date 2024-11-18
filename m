Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A324D591CA
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:16:59 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.4643.1731964601777918275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cuYjYSb8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3LluwAkK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101934122c2d3-8fd89975-d971-4095-ba5a-69932d4134c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964617;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kEpDBkrlaF56NOMGt+TpUGOYdyPns31dHC6XGj5m/3I=;
	b=cuYjYSb8AmyTBQMQ8M03LxGXakEu8uQI6eFFTSj0k4WlrYgcGKEllLgwRWyupPBQ
	HxYY3Zt1rweKedjrMUTcJFRzyhjom0LXFJsWLsGKfRT77BdgG8rylDVHqFOa/wbRS0v
	C14FUHxBWg5fDpsohhTcnvJHaaeta6l+IP0hYr64=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964617;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kEpDBkrlaF56NOMGt+TpUGOYdyPns31dHC6XGj5m/3I=;
	b=3LluwAkKeAaSPTVLFuo0blq+jeW/ZVilwOSqFTEq+kCHrdq/2H9W/8Fk3sqvSKkA
	MeYjGxQ5/dWHkmAG01ZjXDiZYhREl3A/TQimiojvHLKSgpqTkSA+5rT2VTxVTnkN0w+
	RZZY27jg+KpttFyAOtgKxwlV8EyvsjbgYtF0FPAQ=
Content-Type: multipart/mixed; boundary="===============8422713228693189060=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdnf: upgrading to 0.73.4 SUCCEEDED
Message-ID: <010101934122c2d3-8fd89975-d971-4095-ba5a-69932d4134c9-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207264

--===============8422713228693189060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libdnf* to *0.73.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdnf-upgrade-0.73.3-0.73.4.patch
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
From 92162c3c0663370c557ecf221f6d7b7f3191f664 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 10:24:25 +0000
Subject: [PATCH] libdnf: upgrade 0.73.3 -> 0.73.4

---
 ...1-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch | 2 +-
 ...1-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch | 2 +-
 .../libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch       | 2 +-
 ...4-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch | 2 +-
 meta/recipes-devtools/libdnf/libdnf/armarch.patch               | 2 +-
 .../libdnf/libdnf/enable_test_data_dir_set.patch                | 2 +-
 .../libdnf/{libdnf_0.73.3.bb => libdnf_0.73.4.bb}               | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.73.3.bb => libdnf_0.73.4.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
index 52e7426371..0bd5eeb1da 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
@@ -1,4 +1,4 @@
-From 09ff4670e0717ea1a79430c14e108f93fb6f5f34 Mon Sep 17 00:00:00 2001
+From 45d06c71976823c610a4719731b68dcd6096888e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 24 Nov 2016 14:33:07 +0200
 Subject: [PATCH] FindGtkDoc.cmake: drop the requirement for
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 3f70b855c8..54b1262672 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -1,4 +1,4 @@
-From 15de1b4266b85ffdf17fad374a43e0ed315b9f22 Mon Sep 17 00:00:00 2001
+From cd8a24156cefab80b673af233f66ff44c1b7c458 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
 Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
index 5d77bcb41a..850a862979 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
@@ -1,4 +1,4 @@
-From 2a4a5f2da7d1b578619a8d0886f6db00bacefdc2 Mon Sep 17 00:00:00 2001
+From 5150fd9be924d2e9e74b2db664229423a4a00238 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 1 Jun 2021 10:23:59 +0800
 Subject: [PATCH] drop FindPythonInstDir.cmake
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index 25d6109525..f55870802f 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,4 +1,4 @@
-From 9fb0e6130ef5d9fa68240c279d235eee8658c0fa Mon Sep 17 00:00:00 2001
+From a921a92f334a2a30741b906c206e041cef2d904d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
 Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
diff --git a/meta/recipes-devtools/libdnf/libdnf/armarch.patch b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
index 54df0aab99..8a36f87227 100644
--- a/meta/recipes-devtools/libdnf/libdnf/armarch.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
@@ -1,4 +1,4 @@
-From 8159808516543237fb110d0883e702385a1a866c Mon Sep 17 00:00:00 2001
+From baf4fc9f157e4c08c67d1a577b0f1e10f213a642 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 9 Nov 2023 10:29:31 +0000
 Subject: [PATCH] libdnf: Fix arm arch mapping issues for qemuarmv5
diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
index 986b71c4e6..5620b51d4c 100644
--- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
@@ -1,4 +1,4 @@
-From 3d77c2ff41b1a65d0f4852ed21d7a8ec41b368a8 Mon Sep 17 00:00:00 2001
+From 05fff53c13fc5969e17f1e887b0b59bf0a088a6e Mon Sep 17 00:00:00 2001
 From: Joe Slater <joe.slater@windriver.com>
 Date: Wed, 22 Jul 2020 13:31:11 -0700
 Subject: [PATCH] libdnf: allow reproducible binary builds
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb b/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.73.3.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
index e4a34f8ff6..0817da7ca6 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.73.3.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.73.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://armarch.patch \
            "
 
-SRCREV = "fbd34472e5edea0a3ed88ae14a47666e23538e4a"
+SRCREV = "79ed383cd5a822e6d8d9d549835383f5c5106204"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.44.1


--===============8422713228693189060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/libdnf (sysroot):
  /usr/lib/python3.13/site-packages/libdnf-0.73.3.dist-info moved to /usr/lib/python3.13/site-packages/libdnf-0.73.4.dist-info

--===============8422713228693189060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libdnf: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-dbg: PKGSIZE changed from 61075512 to 61075560 (+0%)
packages/core2-64-poky-linux/libdnf/libdnf-dbg: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-dbg: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-dev: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-dev: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-doc: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-doc: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-as: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-as: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-bg: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-bg: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn-in: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn-in: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ca: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ca: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-cs: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-cs: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-da: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-da: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-de: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-de: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-el: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-el: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-es: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-es: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-eu: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-eu: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fa: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fa: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fi: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fi: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fil: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fil: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fr: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fr: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fur: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fur: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-gu: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-gu: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-hi: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-hi: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-hu: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-hu: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ia: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ia: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-id: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-id: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-is: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-is: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-it: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-it: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ja: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ja: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ka: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ka: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-kn: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-kn: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ko: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ko: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-mai: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-mai: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ml: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ml: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-mr: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-mr: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-nb: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-nb: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-nl: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-nl: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-or: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-or: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pa: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pa: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pl: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pl: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt-br: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt-br: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ru: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ru: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-si: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-si: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sk: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sk: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sq: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sq: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr+latin: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr+latin: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sv: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sv: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ta: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ta: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-te: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-te: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-th: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-th: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-tr: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-tr: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-uk: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-uk: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-cn: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-cn: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-tw: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-tw: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-src: PKGSIZE changed from 7362122 to 7362271 (+0%)
packages/core2-64-poky-linux/libdnf/libdnf-src: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-src: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf-staticdev: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf-staticdev: PV changed from "0.73.3" to "0.73.4"
packages/core2-64-poky-linux/libdnf/libdnf: PKGV changed from 0.73.3 [default] to 0.73.4 [default]
packages/core2-64-poky-linux/libdnf/libdnf: PV changed from "0.73.3" to "0.73.4"
Changes to packages/core2-64-poky-linux/libdnf (sysroot):
  /usr/lib/python3.13/site-packages/libdnf-0.73.3.dist-info moved to /usr/lib/python3.13/site-packages/libdnf-0.73.4.dist-info

--===============8422713228693189060==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdnf-upgrade-0.73.3-0.73.4.patch"

RnJvbSA5MjE2MmMzYzA2NjMzNzBjNTU3ZWNmMjIxZjZkN2I3ZjMxOTFmNjY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMTA6MjQ6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJkbmY6IHVwZ3JhZGUgMC43My4zIC0+IDAuNzMuNAoKLS0tCiAuLi4xLUZpbmRHdGtEb2MuY21h
a2UtZHJvcC10aGUtcmVxdWlyZW1lbnQtZm9yLUdUS0RPQ19TQ0EucGF0Y2ggfCAyICstCiAuLi4x
LUdldC1wYXJhbWV0ZXJzLWZvci1ib3RoLWxpYnNvbHYtYW5kLWxpYnNvbHZleHQtbGliZG4ucGF0
Y2ggfCAyICstCiAuLi4vbGliZG5mL2xpYmRuZi8wMDAxLWRyb3AtRmluZFB5dGhvbkluc3REaXIu
Y21ha2UucGF0Y2ggICAgICAgfCAyICstCiAuLi40LVNldC1saWJzb2x2LXZhcmlhYmxlcy13aXRo
LXBrZy1jb25maWctY21ha2Utcy1vd24tbW8ucGF0Y2ggfCAyICstCiBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGliZG5mL2xpYmRuZi9hcm1hcmNoLnBhdGNoICAgICAgICAgICAgICAgfCAyICstCiAu
Li4vbGliZG5mL2xpYmRuZi9lbmFibGVfdGVzdF9kYXRhX2Rpcl9zZXQucGF0Y2ggICAgICAgICAg
ICAgICAgfCAyICstCiAuLi4vbGliZG5mL3tsaWJkbmZfMC43My4zLmJiID0+IGxpYmRuZl8wLjcz
LjQuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiA3IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5m
L3tsaWJkbmZfMC43My4zLmJiID0+IGxpYmRuZl8wLjczLjQuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1GaW5kR3RrRG9jLmNt
YWtlLWRyb3AtdGhlLXJlcXVpcmVtZW50LWZvci1HVEtET0NfU0NBLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1GaW5kR3RrRG9jLmNtYWtlLWRyb3AtdGhl
LXJlcXVpcmVtZW50LWZvci1HVEtET0NfU0NBLnBhdGNoCmluZGV4IDUyZTc0MjYzNzEuLjBiZDVl
ZWIxZGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mLzAw
MDEtRmluZEd0a0RvYy5jbWFrZS1kcm9wLXRoZS1yZXF1aXJlbWVudC1mb3ItR1RLRE9DX1NDQS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDAxLUZpbmRH
dGtEb2MuY21ha2UtZHJvcC10aGUtcmVxdWlyZW1lbnQtZm9yLUdUS0RPQ19TQ0EucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDA5ZmY0NjcwZTA3MTdlYTFhNzk0MzBjMTRlMTA4ZjkzZmI2ZjVm
MzQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ1ZDA2YzcxOTc2ODIzYzYxMGE0NzE5
NzMxYjY4ZGNkNjA5Njg4OGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjQgTm92IDIw
MTYgMTQ6MzM6MDcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRmluZEd0a0RvYy5jbWFrZTogZHJv
cCB0aGUgcmVxdWlyZW1lbnQgZm9yCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGliZG5mL2xpYmRuZi8wMDAxLUdldC1wYXJhbWV0ZXJzLWZvci1ib3RoLWxpYnNvbHYtYW5kLWxp
YnNvbHZleHQtbGliZG4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRu
Zi8wMDAxLUdldC1wYXJhbWV0ZXJzLWZvci1ib3RoLWxpYnNvbHYtYW5kLWxpYnNvbHZleHQtbGli
ZG4ucGF0Y2gKaW5kZXggM2Y3MGI4NTVjOC4uNTRiMTI2MjY3MiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1HZXQtcGFyYW1ldGVycy1mb3ItYm90
aC1saWJzb2x2LWFuZC1saWJzb2x2ZXh0LWxpYmRuLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9saWJkbmYvbGliZG5mLzAwMDEtR2V0LXBhcmFtZXRlcnMtZm9yLWJvdGgtbGlic29s
di1hbmQtbGlic29sdmV4dC1saWJkbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTVkZTFi
NDI2NmI4NWZmZGYxN2ZhZDM3NGE0M2UwZWQzMTViOWYyMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gY2Q4YTI0MTU2Y2VmYWI4MGI2NzNhZjIzM2Y2NmZmNDRjMWI3YzQ1OCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogRGF0ZTogVHVlLCA3IEZlYiAyMDE3IDEyOjE2OjAzICswMjAwCiBTdWJqZWN0
OiBbUEFUQ0hdIEdldCBwYXJhbWV0ZXJzIGZvciBib3RoIGxpYnNvbHYgYW5kIGxpYnNvbHZleHQg
KGxpYmRuZiBpcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJk
bmYvMDAwMS1kcm9wLUZpbmRQeXRob25JbnN0RGlyLmNtYWtlLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1kcm9wLUZpbmRQeXRob25JbnN0RGlyLmNtYWtl
LnBhdGNoCmluZGV4IDVkNzdiY2I0MWEuLjg1MGE4NjI5NzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mLzAwMDEtZHJvcC1GaW5kUHl0aG9uSW5zdERpci5j
bWFrZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDAx
LWRyb3AtRmluZFB5dGhvbkluc3REaXIuY21ha2UucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDJhNGE1ZjJkYTdkMWI1Nzg2MTlhOGQwODg2ZjZkYjAwYmFjZWZkYzIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDUxNTBmZDliZTkyNGQyZTllNzRiMmRiNjY0MjI5NDIzYTRhMDAyMzgg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdp
bmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDEgSnVuIDIwMjEgMTA6MjM6NTkgKzA4MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gZHJvcCBGaW5kUHl0aG9uSW5zdERpci5jbWFrZQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwNC1TZXQtbGlic29sdi12YXJpYWJs
ZXMtd2l0aC1wa2ctY29uZmlnLWNtYWtlLXMtb3duLW1vLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwNC1TZXQtbGlic29sdi12YXJpYWJsZXMtd2l0aC1wa2ct
Y29uZmlnLWNtYWtlLXMtb3duLW1vLnBhdGNoCmluZGV4IDI1ZDYxMDk1MjUuLmY1NTg3MDgwMmYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mLzAwMDQtU2V0
LWxpYnNvbHYtdmFyaWFibGVzLXdpdGgtcGtnLWNvbmZpZy1jbWFrZS1zLW93bi1tby5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDA0LVNldC1saWJzb2x2
LXZhcmlhYmxlcy13aXRoLXBrZy1jb25maWctY21ha2Utcy1vd24tbW8ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDlmYjBlNjEzMGVmNWQ5ZmE2ODI0MGMyNzlkMjM1ZWVlODY1OGMwZmEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGE5MjFhOTJmMzM0YTJhMzA3NDFiOTA2YzIwNmUw
NDFjZWYyZDkwNGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6
MjQ6NTAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gU2V0IGxpYnNvbHYgdmFyaWFibGVzIHdpdGgg
cGtnLWNvbmZpZyAoY21ha2UncyBvd24gbW9kdWxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvbGliZG5mL2xpYmRuZi9hcm1hcmNoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xpYmRuZi9saWJkbmYvYXJtYXJjaC5wYXRjaAppbmRleCA1NGRmMGFhYjk5Li44YTM2Zjg3
MjI3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi9hcm1h
cmNoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mL2FybWFy
Y2gucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDgxNTk4MDg1MTY1NDMyMzdmYjExMGQwODgz
ZTcwMjM4NWExYTg2NmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGJhZjRmYzlmMTU3
ZTRjMDhjNjdkMWE1NzdiMGYxZTEwZjIxM2E2NDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4K
IERhdGU6IFRodSwgOSBOb3YgMjAyMyAxMDoyOTozMSArMDAwMAogU3ViamVjdDogW1BBVENIXSBs
aWJkbmY6IEZpeCBhcm0gYXJjaCBtYXBwaW5nIGlzc3VlcyBmb3IgcWVtdWFybXY1CmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi9lbmFibGVfdGVzdF9kYXRh
X2Rpcl9zZXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi9lbmFi
bGVfdGVzdF9kYXRhX2Rpcl9zZXQucGF0Y2gKaW5kZXggOTg2YjcxYzRlNi4uNTYyMGI1MWQ0YyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvZW5hYmxlX3Rl
c3RfZGF0YV9kaXJfc2V0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYv
bGliZG5mL2VuYWJsZV90ZXN0X2RhdGFfZGlyX3NldC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gM2Q3N2MyZmY0MWIxYTY1ZDBmNDg1MmVkMjFkN2E4ZWM0MWIzNjhhOCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gMDVmZmY1M2MxM2ZjNTk2OWUxN2YxZTg4N2IwYjU5YmYwYTA4OGE2
ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvZSBTbGF0ZXIgPGpvZS5zbGF0ZXJA
d2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMjIgSnVsIDIwMjAgMTM6MzE6MTEgLTA3MDAKIFN1
YmplY3Q6IFtQQVRDSF0gbGliZG5mOiBhbGxvdyByZXByb2R1Y2libGUgYmluYXJ5IGJ1aWxkcwpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmZfMC43My4zLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmZfMC43My40LmJiCnNpbWlsYXJp
dHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGli
ZG5mXzAuNzMuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJk
bmZfMC43My40LmJiCmluZGV4IGU0YTM0ZjhmZjYuLjA4MTdkYTdjYTYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mXzAuNzMuMy5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZl8wLjczLjQuYmIKQEAgLTEzLDcgKzEzLDcgQEAg
U1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2xpYmRu
ZjticmFuY2g9ZG5mLTQtbWFzdGVyO3AKICAgICAgICAgICAgZmlsZTovL2FybWFyY2gucGF0Y2gg
XAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICJmYmQzNDQ3MmU1ZWRlYTBhM2VkODhhZTE0YTQ3
NjY2ZTIzNTM4ZTRhIgorU1JDUkVWID0gIjc5ZWQzODNjZDVhODIyZTZkOGQ5ZDU0OTgzNTM4M2Y1
YzUxMDYyMDQiCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICIoP1A8cHZlcj4oPyE0XC45
MClcZCsoXC5cZCspKykiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCi0tIAoyLjQ0LjEKCg==

--===============8422713228693189060==--

