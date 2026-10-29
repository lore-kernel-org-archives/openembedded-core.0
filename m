Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5566.1793252421517032155
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 22:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=otUZifW2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nI98xU3p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1862c6b77-d4ec3843-41c5-4d02-8083-b63c5363280b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793252420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1VezYJzHYgORd3Hg2NpEmXqkY+sq5wkYtMIX9WyThsM=;
	b=otUZifW2CSNYKS4CYYC8GvBNSI+7Cd1WIlL5NA99AEg4E+Uk2kwOKwe/yFKtr6PW
	wAD2E+1rlHslCsNmN+f51cF9AU9VKtr+7nzhEsyTwzCbk0kERxdqFLr8qqFq6CDC73B
	cVslh7htqGvIICoC6YefdZO6y7YPH+SFcA8++CRI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793252420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1VezYJzHYgORd3Hg2NpEmXqkY+sq5wkYtMIX9WyThsM=;
	b=nI98xU3p4cOX5m2JvyH3GqasBhdQQI9i6FjfjxZBTOco2J3mMfI3xzfQpG7kF+6P
	TZnoAxMVk+t2ejk8NneuzaM5VaGD6PPVMD8MH7tAeZnsWegIIWxPiebZm5hEWC+GCCX
	OFWjl+FBFUlOcWz0TC4liDCNM/SOCA0jOHFLmzTw=
Content-Type: multipart/mixed; boundary="===============6372119256981484656=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] appstream: upgrading to 1.2.2 SUCCEEDED
Message-ID: <010101a1862c6b77-d4ec3843-41c5-4d02-8083-b63c5363280b-000000@us-west-2.amazonses.com>
Date: Thu, 29 Oct 2026 05:40:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.29-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 05:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248897

--===============6372119256981484656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *appstream* to *1.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-appstream-upgrade-1.2.1-1.2.2.patch
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
From 4bb9c82dabd717887c590507c0bd605c0f31680c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 29 Oct 2026 05:33:43 +0000
Subject: [PATCH] appstream: upgrade 1.2.1 -> 1.2.2

Version 1.2.2
~~~~~~~~~~~~~
Released: 2026-10-28

Features:
Bugfixes:

Contributors:
 Eugenio Depalo, Florian Leander Singer, Matthias Klumpp, Vladimir Romanov
---
 .../appstream/appstream/0002-Do-not-build-qt-tests.patch      | 4 ++--
 ...Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch | 4 ++--
 .../appstream/{appstream_1.2.1.bb => appstream_1.2.2.bb}      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/appstream/{appstream_1.2.1.bb => appstream_1.2.2.bb} (95%)

diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index 5f35a8bf23..9bff6251c6 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From 1110cb5c658de30c63642929c1128ab4f9b9b98e Mon Sep 17 00:00:00 2001
+From 0fdcfaaf3f3cd0ec3958d0a4933789976ee15a69 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
@@ -23,7 +23,7 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/qt/meson.build b/qt/meson.build
-index 488fe60b61c0..83c2715c5fe7 100644
+index 488fe60..83c2715 100644
 --- a/qt/meson.build
 +++ b/qt/meson.build
 @@ -144,5 +144,3 @@ install_data (
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index 3774bfa7c6..1606b651de 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From b8d73820cdb685089c0f805c7ca8163b21a78acd Mon Sep 17 00:00:00 2001
+From 285672eca99731536dfca650321efa04ca439209 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
@@ -39,7 +39,7 @@ Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/qt/cmake/AppStreamQtConfig.cmake.in b/qt/cmake/AppStreamQtConfig.cmake.in
-index 63df65f25676..5ab2d0ec7bd3 100644
+index 63df65f..5ab2d0e 100644
 --- a/qt/cmake/AppStreamQtConfig.cmake.in
 +++ b/qt/cmake/AppStreamQtConfig.cmake.in
 @@ -1,5 +1,5 @@
diff --git a/meta/recipes-support/appstream/appstream_1.2.1.bb b/meta/recipes-support/appstream/appstream_1.2.2.bb
similarity index 95%
rename from meta/recipes-support/appstream/appstream_1.2.1.bb
rename to meta/recipes-support/appstream/appstream_1.2.2.bb
index fcfc1aea6c..a5d6cc3292 100644
--- a/meta/recipes-support/appstream/appstream_1.2.1.bb
+++ b/meta/recipes-support/appstream/appstream_1.2.2.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://www.freedesktop.org/software/appstream/releases/AppStream-${P
            file://0002-Do-not-build-qt-tests.patch \
            file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
            "
-SRC_URI[sha256sum] = "7df664fd3ad3b1640c6a0ff77fa84f9fabe264111bf1fe8f5df3444d6d4caaca"
+SRC_URI[sha256sum] = "2f4f7c29095b905b4347829e39971ef8134d2d5aba663383268bab3bfeab45a9"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 
-- 
2.47.1


--===============6372119256981484656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/appstream/appstream-bash-completion: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-bash-completion: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PKGSIZE changed from 2835216 to 2854496 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: FILELIST: removed "/usr/lib/.debug/libappstream.so.1.2.1", added "/usr/lib/.debug/libappstream.so.1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-dbg: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PKGSIZE changed from 1360901 to 1373260 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-dev: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PKGSIZE changed from 2851570 to 2852568 (+0%)
packages/x86-64-v3-poky-linux/appstream/appstream-doc: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ain: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ain: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ar: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ar: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bg: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bg: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn-bd: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn-bd: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-bn: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ca: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ca: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ckb: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ckb: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-cs: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-cs: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-da: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-da: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-de: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-de: PKGSIZE changed from 116159 to 116651 (+0%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-de: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-en-gb: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-en-gb: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eo: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eo: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-es: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-es: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-et: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-et: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eu: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-eu: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fi: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fi: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fr: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-fr: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gd: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gd: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gl: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-gl: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-he: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-he: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hi: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hi: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hr: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hr: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hu: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-hu: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ia: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ia: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-id: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-id: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-it: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-it: PKGSIZE changed from 103308 to 110553 (+7%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-it: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ja: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ja: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ka: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ka: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kk: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kk: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ko: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ko: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kw: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-kw: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-lt: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-lt: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nb: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nb: PKGSIZE changed from 34644 to 36935 (+7%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nb: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nl: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-nl: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-oc: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-oc: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PKGSIZE changed from 125936 to 131646 (+5%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pl: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt-br: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt-br: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-pt: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ro: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ro: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-rom: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-rom: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ru: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ru: PKGSIZE changed from 150574 to 161454 (+7%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ru: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sk: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sk: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sl: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sl: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr+latin: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr+latin: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sr: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PKGSIZE changed from 119857 to 125382 (+5%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-sv: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ta: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-ta: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-th: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-th: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-tr: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-tr: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PKGSIZE changed from 160784 to 163663 (+2%)
packages/x86-64-v3-poky-linux/appstream/appstream-locale-uk: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-cn: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-cn: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-tw: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-locale-zh-tw: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-src: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-src: PKGSIZE changed from 2081554 to 2101656 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream-src: FILELIST: directory renamed /usr/src/debug/appstream/1.2.1/src -> /usr/src/debug/appstream/1.2.2/src, directory renamed /usr/src/debug/appstream/1.2.1/tools -> /usr/src/debug/appstream/1.2.2/tools
packages/x86-64-v3-poky-linux/appstream/appstream-src: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream-staticdev: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream-staticdev: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream/appstream: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream: PKGSIZE changed from 1110354 to 1120672 (+1%)
packages/x86-64-v3-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.2.1", added "/usr/lib/libappstream.so.1.2.2"
packages/x86-64-v3-poky-linux/appstream/appstream: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
packages/x86-64-v3-poky-linux/appstream: SRC_URI changed from "https://www.freedesktop.org/software/appstream/releases/AppStream-1.2.1.tar.xz file://0002-Do-not-build-qt-tests.patch file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch" to "https://www.freedesktop.org/software/appstream/releases/AppStream-1.2.2.tar.xz file://0002-Do-not-build-qt-tests.patch file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch"
packages/x86-64-v3-poky-linux/appstream: PV changed from "1.2.1" to "1.2.2"
packages/x86-64-v3-poky-linux/appstream: PACKAGES: added "appstream-locale-nn"
packages/x86-64-v3-poky-linux/appstream: PKGV changed from 1.2.1 [default] to 1.2.2 [default]
Changes to packages/x86-64-v3-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.2.1 to libappstream.so.1.2.2
  /usr/lib/libappstream.so.1.2.1 moved to /usr/lib/libappstream.so.1.2.2
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.2.1 to libappstream.so.1.2.2
  /usr/lib/libappstream.so.1.2.1 moved to /usr/lib/libappstream.so.1.2.2

--===============6372119256981484656==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-appstream-upgrade-1.2.1-1.2.2.patch"

RnJvbSA0YmI5YzgyZGFiZDcxNzg4N2M1OTA1MDdjMGJkNjA1YzBmMzE2ODBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjkgT2N0IDIwMjYgMDU6MzM6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
cHBzdHJlYW06IHVwZ3JhZGUgMS4yLjEgLT4gMS4yLjIKClZlcnNpb24gMS4yLjIKfn5+fn5+fn5+
fn5+fgpSZWxlYXNlZDogMjAyNi0xMC0yOAoKRmVhdHVyZXM6CkJ1Z2ZpeGVzOgoKQ29udHJpYnV0
b3JzOgogRXVnZW5pbyBEZXBhbG8sIEZsb3JpYW4gTGVhbmRlciBTaW5nZXIsIE1hdHRoaWFzIEts
dW1wcCwgVmxhZGltaXIgUm9tYW5vdgotLS0KIC4uLi9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDIt
RG8tbm90LWJ1aWxkLXF0LXRlc3RzLnBhdGNoICAgICAgfCA0ICsrLS0KIC4uLkZpeC1QQUNLQUdF
X1BSRUZJWF9ESVItaW4tcXQtY21ha2UtQXBwU3RyZWFtUXRDb25maWcucGF0Y2ggfCA0ICsrLS0K
IC4uLi9hcHBzdHJlYW0ve2FwcHN0cmVhbV8xLjIuMS5iYiA9PiBhcHBzdHJlYW1fMS4yLjIuYmJ9
ICAgICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0ve2FwcHN0cmVhbV8x
LjIuMS5iYiA9PiBhcHBzdHJlYW1fMS4yLjIuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8wMDAyLURvLW5vdC1idWlsZC1xdC10
ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAw
Mi1Eby1ub3QtYnVpbGQtcXQtdGVzdHMucGF0Y2gKaW5kZXggNWYzNWE4YmYyMy4uOWJmZjYyNTFj
NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3RyZWFtL2FwcHN0cmVhbS8w
MDAyLURvLW5vdC1idWlsZC1xdC10ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9hcHBzdHJlYW0vYXBwc3RyZWFtLzAwMDItRG8tbm90LWJ1aWxkLXF0LXRlc3RzLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSAxMTEwY2I1YzY1OGRlMzBjNjM2NDI5MjljMTEyOGFiNGY5Yjli
OThlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwZmRjZmFhZjNmM2NkMGVjMzk1OGQw
YTQ5MzM3ODk5NzZlZTE1YTY5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWFyYyBG
ZXJsYW5kIDxtYXJjLmZlcmxhbmRAc29uYXRlc3QuY29tPgogRGF0ZTogRnJpLCAyNiBKdWwgMjAy
NCAxNTo0MTowMCAtMDQwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3QgYnVpbGQgcXQvdGVzdHMK
QEAgLTIzLDcgKzIzLDcgQEAgU2lnbmVkLW9mZi1ieTogTWFyYyBGZXJsYW5kIDxtYXJjLmZlcmxh
bmRAc29uYXRlc3QuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQogCiBkaWZm
IC0tZ2l0IGEvcXQvbWVzb24uYnVpbGQgYi9xdC9tZXNvbi5idWlsZAotaW5kZXggNDg4ZmU2MGI2
MWMwLi44M2MyNzE1YzVmZTcgMTAwNjQ0CitpbmRleCA0ODhmZTYwLi44M2MyNzE1IDEwMDY0NAog
LS0tIGEvcXQvbWVzb24uYnVpbGQKICsrKyBiL3F0L21lc29uLmJ1aWxkCiBAQCAtMTQ0LDUgKzE0
NCwzIEBAIGluc3RhbGxfZGF0YSAoCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9h
cHBzdHJlYW0vYXBwc3RyZWFtLzAwMDMtRml4LVBBQ0tBR0VfUFJFRklYX0RJUi1pbi1xdC1jbWFr
ZS1BcHBTdHJlYW1RdENvbmZpZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVh
bS9hcHBzdHJlYW0vMDAwMy1GaXgtUEFDS0FHRV9QUkVGSVhfRElSLWluLXF0LWNtYWtlLUFwcFN0
cmVhbVF0Q29uZmlnLnBhdGNoCmluZGV4IDM3NzRiZmE3YzYuLjE2MDZiNjUxZGUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMy1GaXgtUEFD
S0FHRV9QUkVGSVhfRElSLWluLXF0LWNtYWtlLUFwcFN0cmVhbVF0Q29uZmlnLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2FwcHN0cmVhbS9hcHBzdHJlYW0vMDAwMy1GaXgtUEFDS0FH
RV9QUkVGSVhfRElSLWluLXF0LWNtYWtlLUFwcFN0cmVhbVF0Q29uZmlnLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBiOGQ3MzgyMGNkYjY4NTA4OWMwZjgwNWM3Y2E4MTYzYjIxYTc4YWNkIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyODU2NzJlY2E5OTczMTUzNmRmY2E2NTAzMjFl
ZmEwNGNhNDM5MjA5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWFyYyBGZXJsYW5k
IDxtYXJjLmZlcmxhbmRAc29uYXRlc3QuY29tPgogRGF0ZTogTW9uLCAyOSBKdWwgMjAyNCAwOToz
NTo1MSAtMDQwMAogU3ViamVjdDogW1BBVENIXSBGaXggUEFDS0FHRV9QUkVGSVhfRElSIGluIHF0
L2NtYWtlL0FwcFN0cmVhbVF0Q29uZmlnLmNtYWtlLmluCkBAIC0zOSw3ICszOSw3IEBAIFNpZ25l
ZC1vZmYtYnk6IE1hcmMgRmVybGFuZCA8bWFyYy5mZXJsYW5kQHNvbmF0ZXN0LmNvbT4KICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L3F0L2NtYWtlL0FwcFN0cmVhbVF0Q29uZmlnLmNtYWtlLmluIGIvcXQvY21ha2UvQXBwU3RyZWFt
UXRDb25maWcuY21ha2UuaW4KLWluZGV4IDYzZGY2NWYyNTY3Ni4uNWFiMmQwZWM3YmQzIDEwMDY0
NAoraW5kZXggNjNkZjY1Zi4uNWFiMmQwZSAxMDA2NDQKIC0tLSBhL3F0L2NtYWtlL0FwcFN0cmVh
bVF0Q29uZmlnLmNtYWtlLmluCiArKysgYi9xdC9jbWFrZS9BcHBTdHJlYW1RdENvbmZpZy5jbWFr
ZS5pbgogQEAgLTEsNSArMSw1IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9h
cHBzdHJlYW0vYXBwc3RyZWFtXzEuMi4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXBwc3Ry
ZWFtL2FwcHN0cmVhbV8xLjIuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEuMi4xLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9hcHBzdHJlYW0vYXBwc3RyZWFtXzEuMi4yLmJiCmluZGV4
IGZjZmMxYWVhNmMuLmE1ZDZjYzMyOTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2FwcHN0cmVhbS9hcHBzdHJlYW1fMS4yLjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
YXBwc3RyZWFtL2FwcHN0cmVhbV8xLjIuMi5iYgpAQCAtMjIsNyArMjIsNyBAQCBTUkNfVVJJID0g
Imh0dHBzOi8vd3d3LmZyZWVkZXNrdG9wLm9yZy9zb2Z0d2FyZS9hcHBzdHJlYW0vcmVsZWFzZXMv
QXBwU3RyZWFtLSR7UAogICAgICAgICAgICBmaWxlOi8vMDAwMi1Eby1ub3QtYnVpbGQtcXQtdGVz
dHMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMy1GaXgtUEFDS0FHRV9QUkVGSVhfRElS
LWluLXF0LWNtYWtlLUFwcFN0cmVhbVF0Q29uZmlnLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjdkZjY2NGZkM2FkM2IxNjQwYzZhMGZmNzdmYTg0ZjlmYWJlMjY0
MTExYmYxZmU4ZjVkZjM0NDRkNmQ0Y2FhY2EiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmY0Zjdj
MjkwOTViOTA1YjQzNDc4MjllMzk5NzFlZjgxMzRkMmQ1YWJhNjYzMzgzMjY4YmFiM2JmZWFiNDVh
OSIKIAogUyA9ICIke1VOUEFDS0RJUn0vQXBwU3RyZWFtLSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============6372119256981484656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/appstream/appstream: FILELIST: removed "/usr/lib/libappstream.so.1.2.1", added "/usr/lib/libappstream.so.1.2.2"
packages/x86-64-v3-poky-linux/appstream: PACKAGES: added "appstream-locale-nn"
Changes to packages/x86-64-v3-poky-linux/appstream (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.2.1 to libappstream.so.1.2.2
  /usr/lib/libappstream.so.1.2.1 moved to /usr/lib/libappstream.so.1.2.2
Changes to packages/x86_64-linux/appstream-native (sysroot):
  /usr/lib/libappstream.so.5 changed symlink target from libappstream.so.1.2.1 to libappstream.so.1.2.2
  /usr/lib/libappstream.so.1.2.1 moved to /usr/lib/libappstream.so.1.2.2

--===============6372119256981484656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="appstream-changelog.txt"

Version 1.2.2
~~~~~~~~~~~~~
Released: 2026-10-28

Features:
Bugfixes:

Contributors:
 Eugenio Depalo, Florian Leander Singer, Matthias Klumpp, Vladimir Romanov

--===============6372119256981484656==--
