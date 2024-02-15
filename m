Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A89C54764
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:39 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20330.1708018344937596863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hEYotTOP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=n9uvkRak;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018dadd3a110-6ecb53c9-1380-4d67-827e-ee835743c64c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=THsroHmD5aRXLgO3V5+8n1INGpi7jM7YlpnyJgQsxRQ=;
	b=hEYotTOPfg4Udt3XsPwbIlDPwKFIsYSmdc/F1FUvV46qWRKcP3x+SS8Wx5s7Sl/T
	3buyaVXAjU+D0BHCVbGi1bB/WdO3zDrlI5eWmmUJtVzaSlD6n4B8XiBst0UXANzVJkl
	oh2JFK4PbD9FVthKCrIWFme+iWGKZ403TH3lyGzo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=THsroHmD5aRXLgO3V5+8n1INGpi7jM7YlpnyJgQsxRQ=;
	b=n9uvkRakicRI+0bDsb38Hj+HuyIGF8JEWxxDPgQI1N4lwcTMS+PLWmLwXhsRVs4R
	ZZssszDt7UOEn4rpQW4eOXLcltdZFrdgU5FWuIJHoBOC+BLvS1qZ55QobbS4bbCZqoX
	LNAcvQAdcSj3ipLqqNd1+JfFjQUP5tjVBKDd27hM=
Content-Type: multipart/mixed; boundary="===============5674750878253684522=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdnf: upgrading to 0.73.0 SUCCEEDED
Message-ID: <0101018dadd3a110-6ecb53c9-1380-4d67-827e-ee835743c64c-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195582

--===============5674750878253684522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdnf* to *0.73.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdnf-upgrade-0.72.0-0.73.0.patch
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
From e9420e6a015514400cdcd6bd8197ca55e808409f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 07:42:59 +0000
Subject: [PATCH] libdnf: upgrade 0.72.0 -> 0.73.0

---
 ...ke-drop-the-requirement-for-GTKDOC_SCA.patch | 10 ++++------
 ...-for-both-libsolv-and-libsolvext-libdn.patch |  2 +-
 .../0001-drop-FindPythonInstDir.cmake.patch     |  6 ++----
 ...riables-with-pkg-config-cmake-s-own-mo.patch |  2 +-
 .../libdnf/libdnf/armarch.patch                 | 17 +++++++++++++----
 .../libdnf/enable_test_data_dir_set.patch       |  2 +-
 .../{libdnf_0.72.0.bb => libdnf_0.73.0.bb}      |  2 +-
 7 files changed, 23 insertions(+), 18 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.72.0.bb => libdnf_0.73.0.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
index 791a32e748..8e2820c1b2 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
@@ -1,7 +1,7 @@
-From 9bb7630915c3e787732463a3e2064fe0e177101b Mon Sep 17 00:00:00 2001
+From 7d8c1916a2e4b7c1fb2a6020a3ea408a9dde6e06 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 24 Nov 2016 14:33:07 +0200
-Subject: [PATCH 1/4] FindGtkDoc.cmake: drop the requirement for
+Subject: [PATCH] FindGtkDoc.cmake: drop the requirement for
  GTKDOC_SCANGOBJ_WRAPPER
 
 For some reason cmake is not able to find it when building in openembedded,
@@ -9,12 +9,13 @@ and it's bundled with the source code anyway.
 
 Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  cmake/modules/FindGtkDoc.cmake | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/cmake/modules/FindGtkDoc.cmake b/cmake/modules/FindGtkDoc.cmake
-index 92b2cc7..39f34bd 100644
+index 92b2cc7e..39f34bd5 100644
 --- a/cmake/modules/FindGtkDoc.cmake
 +++ b/cmake/modules/FindGtkDoc.cmake
 @@ -52,7 +52,7 @@ find_program(GTKDOC_MKHTML_EXE gtkdoc-mkhtml PATH "${GLIB_PREFIX}/bin")
@@ -26,6 +27,3 @@ index 92b2cc7..39f34bd 100644
      VERSION_VAR GtkDoc_VERSION)
  
  # ::
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 08d0859953..1f4d7110df 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -1,4 +1,4 @@
-From b87ae6860ea44996b677ad1c4a9793720b77c67c Mon Sep 17 00:00:00 2001
+From c6e71bca83cb956fde55529c3e5cf742915fc040 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
 Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
index d483dd410b..eda01bbba8 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
@@ -1,4 +1,4 @@
-From c0a465ccae395871ab10932975e37894220bc6a1 Mon Sep 17 00:00:00 2001
+From 8740e452af3ec4bac303c0e302c605c99e3031f4 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 1 Jun 2021 10:23:59 +0800
 Subject: [PATCH] drop FindPythonInstDir.cmake
@@ -21,6 +21,7 @@ Yocto setting
 Upstream-Status: Inappropriate [Yocto specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  cmake/modules/FindPythonInstDir.cmake | 7 +------
  1 file changed, 1 insertion(+), 6 deletions(-)
@@ -37,6 +38,3 @@ index ed098ded..8b137891 100644
 -stdout.write(path)"
 -OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
 +
--- 
-2.18.1
-
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index 32f2bb6ad0..28c033fdb3 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,4 +1,4 @@
-From 0b8eceb9161711003cd25ab400cadde7c1601733 Mon Sep 17 00:00:00 2001
+From 65e9c0bf12bb830fcabad42eea76c7981f6f4b29 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
 Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
diff --git a/meta/recipes-devtools/libdnf/libdnf/armarch.patch b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
index 99eaf1d521..b5138dc727 100644
--- a/meta/recipes-devtools/libdnf/libdnf/armarch.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
@@ -1,3 +1,8 @@
+From 5f4cf0be38ba2a2af4ca30437d316ca90e68a065 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 9 Nov 2023 10:29:31 +0000
+Subject: [PATCH] libdnf: Fix arm arch mapping issues for qemuarmv5
+
 We change the way rpm architectures work, we make the machine name the default machine
 specific package architecture.
 
@@ -6,10 +11,14 @@ armv5hl which doesn't exist and causes errrors. We can simply remove it, we don'
 
 Upstream-Status: Inappropriate [Relies on OE rpm config]
 
-Index: git/libdnf/hy-util.cpp
-===================================================================
---- git.orig/libdnf/hy-util.cpp
-+++ git/libdnf/hy-util.cpp
+---
+ libdnf/hy-util.cpp | 23 -----------------------
+ 1 file changed, 23 deletions(-)
+
+diff --git a/libdnf/hy-util.cpp b/libdnf/hy-util.cpp
+index 9978c8e9..aa1369b6 100644
+--- a/libdnf/hy-util.cpp
++++ b/libdnf/hy-util.cpp
 @@ -117,29 +117,6 @@ hy_detect_arch(char **arch)
      if (uname(&un) < 0)
          return DNF_ERROR_FAILED;
diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
index 8b1a597200..8fb192fe30 100644
--- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
@@ -1,4 +1,4 @@
-From dc83a79053597546b2b42fcf578f3a7727b13f3b Mon Sep 17 00:00:00 2001
+From 02a7bfb370d2b63abc9cd749b352e9d8162426e8 Mon Sep 17 00:00:00 2001
 From: Joe Slater <joe.slater@windriver.com>
 Date: Wed, 22 Jul 2020 13:31:11 -0700
 Subject: [PATCH] libdnf: allow reproducible binary builds
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.73.0.bb
index a8685a1604..dc2ddf9492 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://armarch.patch \
            "
 
-SRCREV = "908dba63c9e18c86a2d81166ce7523559e65338c"
+SRCREV = "1f30b3479528e8b62754f9047195c8e5a31f07ed"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.42.0


--===============5674750878253684522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libdnf: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-dbg: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-dbg: PKGSIZE changed from 58183120 to 58213648 (+0%)
packages/core2-64-poky-linux/libdnf/libdnf-dbg: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-dev: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-dev: PKGSIZE changed from 212911 to 212961 (+0%)
packages/core2-64-poky-linux/libdnf/libdnf-dev: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-doc: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-doc: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-as: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-as: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-bg: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-bg: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn-in: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn-in: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-bn: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ca: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ca: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-cs: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-cs: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-da: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-da: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-de: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-de: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-el: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-el: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-es: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-es: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-eu: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-eu: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fa: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fa: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fi: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fi: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fil: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fil: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fr: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fr: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-fur: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-fur: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-gu: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-gu: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-hi: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-hi: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-hu: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-hu: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ia: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ia: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-id: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-id: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-is: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-is: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-it: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-it: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ja: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ja: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ka: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ka: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-kn: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-kn: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ko: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ko: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-mai: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-mai: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ml: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ml: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-mr: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-mr: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-nb: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-nb: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-nl: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-nl: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-or: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-or: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pa: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pa: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pl: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pl: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt-br: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt-br: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-pt: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ru: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ru: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-si: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-si: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sk: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sk: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sq: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sq: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr+latin: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr+latin: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sr: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-sv: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-sv: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-ta: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-ta: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-te: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-te: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-th: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-th: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-tr: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-tr: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-uk: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-uk: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-cn: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-cn: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-tw: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-locale-zh-tw: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-src: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-src: PKGSIZE changed from 7404018 to 7407867 (+0%)
packages/core2-64-poky-linux/libdnf/libdnf-src: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf-staticdev: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf-staticdev: PV changed from "0.72.0" to "0.73.0"
packages/core2-64-poky-linux/libdnf/libdnf: PKGV changed from 0.72.0 [default] to 0.73.0 [default]
packages/core2-64-poky-linux/libdnf/libdnf: PKGSIZE changed from 5684711 to 5688973 (+0%)
packages/core2-64-poky-linux/libdnf/libdnf: PV changed from "0.72.0" to "0.73.0"
Changes to packages/core2-64-poky-linux/libdnf (sysroot):
  /usr/lib/python3.12/site-packages/libdnf-0.72.0.dist-info moved to /usr/lib/python3.12/site-packages/libdnf-0.73.0.dist-info

--===============5674750878253684522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (0 cached, 914 parsed). 1858 targets, 46 skipped, 0 masked, 0 errors.
Removing 64 recipes from the core2-64 sysroot...done.
Removing 77 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-3cd69b84ee2688fb874202377d962cf21e79dd45"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3cd69b84ee2688fb874202377d962cf21e79dd45"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 613 Local 598 Mirrors 0 Missed 15 Current 215 (97% match, 98% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 220 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 229 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 232 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 233 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 234 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 235 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 240 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 241 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_create_spdx_setscene)
NOTE: Running setscene task 244 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 247 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 248 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 249 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librepo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe librepo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsolv-0.7.28-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsolv-0.7.28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe json-c-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 351 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.17.bb:do_packagedata_setscene)
NOTE: recipe gtk-doc-1.33.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 352 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 353 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe librepo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 355 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe libsolv-0.7.28-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 358 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_packagedata_setscene)
NOTE: recipe libmodulemd-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 360 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe librepo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libsolv-0.7.28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librepo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsolv-0.7.28-r0: task do_packagedata_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 718 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_recipe_qa)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe rpm-1_4.19.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librepo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 393 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 396 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 397 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdnf-0.73.0-r0: task do_recipe_qa: Started
NOTE: recipe libsolv-0.7.28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 406 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 412 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.28.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 413 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 414 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 415 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: recipe gtk-doc-1.33.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gpgme-1.23.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gpgme-1.23.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsolv-0.7.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librepo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 416 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 418 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdnf-0.73.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 419 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libsolv-0.7.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 420 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: recipe librepo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 421 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe gpgme-1.23.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.19.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 427 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 428 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: recipe gpgme-1.23.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 431 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.19.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.bb:do_recipe_qa_setscene)
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.2.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 455 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 488 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.19.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gpgme-1.23.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libassuan-2.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libassuan-2.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 492 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe rpm-1_4.19.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gpgme-1.23.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 503 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libassuan-2.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 505 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 506 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 514 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libassuan-2.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 516 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/elfutils/0.189/temp/log.do_packagedata_setscene.2354896
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 520 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libassuan-2.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libassuan-2.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 522 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 524 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 528 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 537 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 538 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: Running task 855 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_fetch)
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdnf-0.73.0-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 551 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 555 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 556 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 560 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 564 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 575 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 576 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 578 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdnf-0.73.0-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 593 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 594 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 598 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1163 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_unpack)
NOTE: Running task 1178 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 602 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libdnf-0.73.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1204 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1205 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 607 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1232 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1244 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe util-linux-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 612 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 614 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 617 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1245 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libdnf-0.73.0-r0: task do_unpack: Succeeded
NOTE: Running task 1246 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libdnf-0.73.0-r0: task do_patch: Started
NOTE: Running task 1247 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe util-linux-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 625 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 629 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 633 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 641 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 645 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 647 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 648 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdnf-0.73.0-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1278 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1279 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_generate_toolchain_file)
NOTE: Running task 1280 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_populate_lic)
NOTE: Running setscene task 660 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 662 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 663 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1281 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 668 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdnf-0.73.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 670 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdnf-0.73.0-r0: task do_populate_lic: Started
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libdnf-0.73.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 671 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 673 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 674 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 679 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdnf-0.73.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdnf-0.73.0-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 681 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 683 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_populate_lic unihash changed to 693335861d70f9b5577e566238f080779d0490a27e83ca1e524ab74c35286315
NOTE: Running setscene task 684 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 687 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdnf-0.73.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 691 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 692 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 693 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 694 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 697 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 703 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 705 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 706 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 711 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 717 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 719 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 725 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 727 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 730 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 737 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 743 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 744 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 746 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 748 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 749 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 779 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 788 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 789 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 802 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1447 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 815 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 816 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 823 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 828 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2004 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata)
NOTE: Running task 2113 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.73.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdnf-0.73.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2258 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_configure)
NOTE: recipe libdnf-0.73.0-r0: task do_configure: Started
NOTE: recipe libdnf-0.73.0-r0: task do_configure: Succeeded
NOTE: Running task 2259 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_compile)
NOTE: recipe libdnf-0.73.0-r0: task do_compile: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata: Succeeded
NOTE: Running task 2271 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_collect_spdx_deps)
NOTE: recipe libdnf-0.73.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdnf-0.73.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libdnf-0.73.0-r0: task do_compile: Succeeded
NOTE: Running task 2275 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_install)
NOTE: recipe libdnf-0.73.0-r0: task do_install: Started
NOTE: recipe libdnf-0.73.0-r0: task do_install: Succeeded
NOTE: Running task 2276 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_package)
NOTE: Running task 2277 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.73.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.73.0-r0: task do_package: Started
NOTE: recipe libdnf-0.73.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdnf-0.73.0-r0: task do_package: Succeeded
NOTE: Running task 2278 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_packagedata)
NOTE: recipe libdnf-0.73.0-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.73.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2279 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_create_spdx)
NOTE: Running task 2280 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_package_write_ipk)
NOTE: Running task 2281 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_package_write_deb)
NOTE: Running task 2282 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_package_write_rpm)
NOTE: Running task 2283 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_package_qa)
NOTE: recipe libdnf-0.73.0-r0: task do_create_spdx: Started
NOTE: recipe libdnf-0.73.0-r0: task do_package_write_ipk: Started
NOTE: recipe libdnf-0.73.0-r0: task do_package_write_deb: Started
NOTE: recipe libdnf-0.73.0-r0: task do_package_write_rpm: Started
NOTE: recipe libdnf-0.73.0-r0: task do_package_qa: Started
NOTE: recipe libdnf-0.73.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe libdnf-0.73.0-r0: task do_package_qa: Succeeded
NOTE: recipe libdnf-0.73.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2284 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_create_runtime_spdx)
NOTE: recipe libdnf-0.73.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe libdnf-0.73.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe libdnf-0.73.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe libdnf-0.73.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2285 of 2285 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2285 tasks of which 2253 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 20 ERROR messages, returning a non-zero exit code.
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-src went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-dbg went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-binutils went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libelf went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libasm went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libdw went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package libdebuginfod went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-ptest went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-staticdev went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-dev went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-doc went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-de went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-en+boldquot went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-en+quot went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-es went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-ja went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-pl went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils-locale-uk went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: QA Issue: Package version for package elfutils went backwards which would break package feeds (from 0:0.190-r0 to 0:0.189-r0) [version-going-backwards]
ERROR: elfutils-0.189-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5674750878253684522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/libdnf (sysroot):
  /usr/lib/python3.12/site-packages/libdnf-0.72.0.dist-info moved to /usr/lib/python3.12/site-packages/libdnf-0.73.0.dist-info

--===============5674750878253684522==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libdnf-upgrade-0.72.0-0.73.0.patch"

RnJvbSBlOTQyMGU2YTAxNTUxNDQwMGNkY2Q2YmQ4MTk3Y2E1NWU4MDg0MDlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDc6NDI6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJkbmY6IHVwZ3JhZGUgMC43Mi4wIC0+IDAuNzMuMAoKLS0tCiAuLi5rZS1kcm9wLXRoZS1yZXF1
aXJlbWVudC1mb3ItR1RLRE9DX1NDQS5wYXRjaCB8IDEwICsrKystLS0tLS0KIC4uLi1mb3ItYm90
aC1saWJzb2x2LWFuZC1saWJzb2x2ZXh0LWxpYmRuLnBhdGNoIHwgIDIgKy0KIC4uLi8wMDAxLWRy
b3AtRmluZFB5dGhvbkluc3REaXIuY21ha2UucGF0Y2ggICAgIHwgIDYgKystLS0tCiAuLi5yaWFi
bGVzLXdpdGgtcGtnLWNvbmZpZy1jbWFrZS1zLW93bi1tby5wYXRjaCB8ICAyICstCiAuLi4vbGli
ZG5mL2xpYmRuZi9hcm1hcmNoLnBhdGNoICAgICAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysr
KystLS0tCiAuLi4vbGliZG5mL2VuYWJsZV90ZXN0X2RhdGFfZGlyX3NldC5wYXRjaCAgICAgICB8
ICAyICstCiAuLi4ve2xpYmRuZl8wLjcyLjAuYmIgPT4gbGliZG5mXzAuNzMuMC5iYn0gICAgICB8
ICAyICstCiA3IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYve2xpYmRuZl8wLjcyLjAuYmIg
PT4gbGliZG5mXzAuNzMuMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGliZG5mL2xpYmRuZi8wMDAxLUZpbmRHdGtEb2MuY21ha2UtZHJvcC10aGUtcmVxdWly
ZW1lbnQtZm9yLUdUS0RPQ19TQ0EucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5m
L2xpYmRuZi8wMDAxLUZpbmRHdGtEb2MuY21ha2UtZHJvcC10aGUtcmVxdWlyZW1lbnQtZm9yLUdU
S0RPQ19TQ0EucGF0Y2gKaW5kZXggNzkxYTMyZTc0OC4uOGUyODIwYzFiMiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1GaW5kR3RrRG9jLmNtYWtl
LWRyb3AtdGhlLXJlcXVpcmVtZW50LWZvci1HVEtET0NfU0NBLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mLzAwMDEtRmluZEd0a0RvYy5jbWFrZS1kcm9wLXRo
ZS1yZXF1aXJlbWVudC1mb3ItR1RLRE9DX1NDQS5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20g
OWJiNzYzMDkxNWMzZTc4NzczMjQ2M2EzZTIwNjRmZTBlMTc3MTAxYiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gN2Q4YzE5MTZhMmU0YjdjMWZiMmE2MDIwYTNlYTQwOGE5ZGRlNmUwNiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyNCBOb3YgMjAxNiAxNDozMzowNyArMDIwMAot
U3ViamVjdDogW1BBVENIIDEvNF0gRmluZEd0a0RvYy5jbWFrZTogZHJvcCB0aGUgcmVxdWlyZW1l
bnQgZm9yCitTdWJqZWN0OiBbUEFUQ0hdIEZpbmRHdGtEb2MuY21ha2U6IGRyb3AgdGhlIHJlcXVp
cmVtZW50IGZvcgogIEdUS0RPQ19TQ0FOR09CSl9XUkFQUEVSCiAKIEZvciBzb21lIHJlYXNvbiBj
bWFrZSBpcyBub3QgYWJsZSB0byBmaW5kIGl0IHdoZW4gYnVpbGRpbmcgaW4gb3BlbmVtYmVkZGVk
LApAQCAtOSwxMiArOSwxMyBAQCBhbmQgaXQncyBidW5kbGVkIHdpdGggdGhlIHNvdXJjZSBjb2Rl
IGFueXdheS4KIAogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNv
bS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9saWJkbmYvcHVsbC8zMTJdCiBTaWduZWQtb2ZmLWJ5
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KKwogLS0tCiAgY21h
a2UvbW9kdWxlcy9GaW5kR3RrRG9jLmNtYWtlIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY21ha2UvbW9kdWxlcy9G
aW5kR3RrRG9jLmNtYWtlIGIvY21ha2UvbW9kdWxlcy9GaW5kR3RrRG9jLmNtYWtlCi1pbmRleCA5
MmIyY2M3Li4zOWYzNGJkIDEwMDY0NAoraW5kZXggOTJiMmNjN2UuLjM5ZjM0YmQ1IDEwMDY0NAog
LS0tIGEvY21ha2UvbW9kdWxlcy9GaW5kR3RrRG9jLmNtYWtlCiArKysgYi9jbWFrZS9tb2R1bGVz
L0ZpbmRHdGtEb2MuY21ha2UKIEBAIC01Miw3ICs1Miw3IEBAIGZpbmRfcHJvZ3JhbShHVEtET0Nf
TUtIVE1MX0VYRSBndGtkb2MtbWtodG1sIFBBVEggIiR7R0xJQl9QUkVGSVh9L2JpbiIpCkBAIC0y
Niw2ICsyNywzIEBAIGluZGV4IDkyYjJjYzcuLjM5ZjM0YmQgMTAwNjQ0CiAgICAgIFZFUlNJT05f
VkFSIEd0a0RvY19WRVJTSU9OKQogIAogICMgOjoKLS0tIAotMi4xMS4wCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mLzAwMDEtR2V0LXBhcmFtZXRlcnMt
Zm9yLWJvdGgtbGlic29sdi1hbmQtbGlic29sdmV4dC1saWJkbi5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9saWJkbmYvbGliZG5mLzAwMDEtR2V0LXBhcmFtZXRlcnMtZm9yLWJvdGgtbGli
c29sdi1hbmQtbGlic29sdmV4dC1saWJkbi5wYXRjaAppbmRleCAwOGQwODU5OTUzLi4xZjRkNzEx
MGRmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDAx
LUdldC1wYXJhbWV0ZXJzLWZvci1ib3RoLWxpYnNvbHYtYW5kLWxpYnNvbHZleHQtbGliZG4ucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1HZXQtcGFy
YW1ldGVycy1mb3ItYm90aC1saWJzb2x2LWFuZC1saWJzb2x2ZXh0LWxpYmRuLnBhdGNoCkBAIC0x
LDQgKzEsNCBAQAotRnJvbSBiODdhZTY4NjBlYTQ0OTk2YjY3N2FkMWM0YTk3OTM3MjBiNzdjNjdj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjNmU3MWJjYTgzY2I5NTZmZGU1NTUyOWMz
ZTVjZjc0MjkxNWZjMDQwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDcgRmViIDIwMTcg
MTI6MTY6MDMgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gR2V0IHBhcmFtZXRlcnMgZm9yIGJvdGgg
bGlic29sdiBhbmQgbGlic29sdmV4dCAobGliZG5mIGlzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDAxLWRyb3AtRmluZFB5dGhvbkluc3REaXIuY21h
a2UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDAxLWRyb3At
RmluZFB5dGhvbkluc3REaXIuY21ha2UucGF0Y2gKaW5kZXggZDQ4M2RkNDEwYi4uZWRhMDFiYmJh
OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwMS1k
cm9wLUZpbmRQeXRob25JbnN0RGlyLmNtYWtlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9saWJkbmYvbGliZG5mLzAwMDEtZHJvcC1GaW5kUHl0aG9uSW5zdERpci5jbWFrZS5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzBhNDY1Y2NhZTM5NTg3MWFiMTA5MzI5NzVlMzc4OTQy
MjBiYzZhMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODc0MGU0NTJhZjNlYzRiYWMz
MDNjMGUzMDJjNjA1Yzk5ZTMwMzFmNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhv
bmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMSBKdW4gMjAy
MSAxMDoyMzo1OSArMDgwMAogU3ViamVjdDogW1BBVENIXSBkcm9wIEZpbmRQeXRob25JbnN0RGly
LmNtYWtlCkBAIC0yMSw2ICsyMSw3IEBAIFlvY3RvIHNldHRpbmcKIFVwc3RyZWFtLVN0YXR1czog
SW5hcHByb3ByaWF0ZSBbWW9jdG8gc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBK
aWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KKwogLS0tCiAgY21ha2UvbW9kdWxlcy9GaW5k
UHl0aG9uSW5zdERpci5jbWFrZSB8IDcgKy0tLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgNiBkZWxldGlvbnMoLSkKQEAgLTM3LDYgKzM4LDMgQEAgaW5kZXggZWQwOThkZWQu
LjhiMTM3ODkxIDEwMDY0NAogLXN0ZG91dC53cml0ZShwYXRoKSIKIC1PVVRQVVRfVkFSSUFCTEUg
UFlUSE9OX0lOU1RBTExfRElSKQogKwotLS0gCi0yLjE4LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvMDAwNC1TZXQtbGlic29sdi12YXJpYWJsZXMt
d2l0aC1wa2ctY29uZmlnLWNtYWtlLXMtb3duLW1vLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xpYmRuZi9saWJkbmYvMDAwNC1TZXQtbGlic29sdi12YXJpYWJsZXMtd2l0aC1wa2ctY29u
ZmlnLWNtYWtlLXMtb3duLW1vLnBhdGNoCmluZGV4IDMyZjJiYjZhZDAuLjI4YzAzM2ZkYjMgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mLzAwMDQtU2V0LWxp
YnNvbHYtdmFyaWFibGVzLXdpdGgtcGtnLWNvbmZpZy1jbWFrZS1zLW93bi1tby5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi8wMDA0LVNldC1saWJzb2x2LXZh
cmlhYmxlcy13aXRoLXBrZy1jb25maWctY21ha2Utcy1vd24tbW8ucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDBiOGVjZWI5MTYxNzExMDAzY2QyNWFiNDAwY2FkZGU3YzE2MDE3MzMgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY1ZTljMGJmMTJiYjgzMGZjYWJhZDQyZWVhNzZjNzk4
MWY2ZjRiMjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6MjQ6
NTAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gU2V0IGxpYnNvbHYgdmFyaWFibGVzIHdpdGggcGtn
LWNvbmZpZyAoY21ha2UncyBvd24gbW9kdWxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGliZG5mL2xpYmRuZi9hcm1hcmNoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2xpYmRuZi9saWJkbmYvYXJtYXJjaC5wYXRjaAppbmRleCA5OWVhZjFkNTIxLi5iNTEzOGRjNzI3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZi9hcm1hcmNo
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mL2FybWFyY2gu
cGF0Y2gKQEAgLTEsMyArMSw4IEBACitGcm9tIDVmNGNmMGJlMzhiYTJhMmFmNGNhMzA0MzdkMzE2
Y2E5MGU2OGEwNjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBSaWNoYXJkIFB1cmRp
ZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KK0RhdGU6IFRodSwgOSBOb3Yg
MjAyMyAxMDoyOTozMSArMDAwMAorU3ViamVjdDogW1BBVENIXSBsaWJkbmY6IEZpeCBhcm0gYXJj
aCBtYXBwaW5nIGlzc3VlcyBmb3IgcWVtdWFybXY1CisKIFdlIGNoYW5nZSB0aGUgd2F5IHJwbSBh
cmNoaXRlY3R1cmVzIHdvcmssIHdlIG1ha2UgdGhlIG1hY2hpbmUgbmFtZSB0aGUgZGVmYXVsdCBt
YWNoaW5lCiBzcGVjaWZpYyBwYWNrYWdlIGFyY2hpdGVjdHVyZS4KIApAQCAtNiwxMCArMTEsMTQg
QEAgYXJtdjVobCB3aGljaCBkb2Vzbid0IGV4aXN0IGFuZCBjYXVzZXMgZXJycm9ycy4gV2UgY2Fu
IHNpbXBseSByZW1vdmUgaXQsIHdlIGRvbicKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJp
YXRlIFtSZWxpZXMgb24gT0UgcnBtIGNvbmZpZ10KIAotSW5kZXg6IGdpdC9saWJkbmYvaHktdXRp
bC5jcHAKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0KLS0tLSBnaXQub3JpZy9saWJkbmYvaHktdXRpbC5jcHAKLSsrKyBn
aXQvbGliZG5mL2h5LXV0aWwuY3BwCistLS0KKyBsaWJkbmYvaHktdXRpbC5jcHAgfCAyMyAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCAyMyBkZWxldGlvbnMoLSkKKwor
ZGlmZiAtLWdpdCBhL2xpYmRuZi9oeS11dGlsLmNwcCBiL2xpYmRuZi9oeS11dGlsLmNwcAoraW5k
ZXggOTk3OGM4ZTkuLmFhMTM2OWI2IDEwMDY0NAorLS0tIGEvbGliZG5mL2h5LXV0aWwuY3BwCisr
KysgYi9saWJkbmYvaHktdXRpbC5jcHAKIEBAIC0xMTcsMjkgKzExNyw2IEBAIGh5X2RldGVjdF9h
cmNoKGNoYXIgKiphcmNoKQogICAgICBpZiAodW5hbWUoJnVuKSA8IDApCiAgICAgICAgICByZXR1
cm4gRE5GX0VSUk9SX0ZBSUxFRDsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9s
aWJkbmYvbGliZG5mL2VuYWJsZV90ZXN0X2RhdGFfZGlyX3NldC5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9saWJkbmYvbGliZG5mL2VuYWJsZV90ZXN0X2RhdGFfZGlyX3NldC5wYXRjaApp
bmRleCA4YjFhNTk3MjAwLi44ZmIxOTJmZTMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGliZG5mL2xpYmRuZi9lbmFibGVfdGVzdF9kYXRhX2Rpcl9zZXQucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvZW5hYmxlX3Rlc3RfZGF0YV9kaXJf
c2V0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkYzgzYTc5MDUzNTk3NTQ2YjJiNDJmY2Y1
NzhmM2E3NzI3YjEzZjNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMmE3YmZiMzcw
ZDJiNjNhYmM5Y2Q3NDliMzUyZTlkODE2MjQyNmU4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSm9lIFNsYXRlciA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAy
MiBKdWwgMjAyMCAxMzozMToxMSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBsaWJkbmY6IGFsbG93
IHJlcHJvZHVjaWJsZSBiaW5hcnkgYnVpbGRzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGliZG5mL2xpYmRuZl8wLjcyLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGli
ZG5mL2xpYmRuZl8wLjczLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmZfMC43Mi4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvbGliZG5mL2xpYmRuZl8wLjczLjAuYmIKaW5kZXggYTg2ODVhMTYw
NC4uZGMyZGRmOTQ5MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYmRuZi9s
aWJkbmZfMC43Mi4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5m
XzAuNzMuMC5iYgpAQCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
cnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvbGliZG5mO2JyYW5jaD1kbmYtNC1tYXN0ZXI7cAogICAg
ICAgICAgICBmaWxlOi8vYXJtYXJjaC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0g
IjkwOGRiYTYzYzllMThjODZhMmQ4MTE2NmNlNzUyMzU1OWU2NTMzOGMiCitTUkNSRVYgPSAiMWYz
MGIzNDc5NTI4ZThiNjI3NTRmOTA0NzE5NWM4ZTVhMzFmMDdlZCIKIFVQU1RSRUFNX0NIRUNLX0dJ
VFRBR1JFR0VYID0gIig/UDxwdmVyPig/ITRcLjkwKVxkKyhcLlxkKykrKSIKIAogUyA9ICIke1dP
UktESVJ9L2dpdCIKLS0gCjIuNDIuMAoK

--===============5674750878253684522==--

