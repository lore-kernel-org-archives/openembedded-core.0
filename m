Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAC4C61CE8
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:33 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.27776.1748786130431140761
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hwEvuNpD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hfi+BfK/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101972bc6abd4-6e1ecf89-265d-4bde-abda-6298654a177e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786130;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W4xUFJu30GqBWivR+DQlhpmAOUZj7n2pdi2AWStiYYI=;
	b=hwEvuNpDC/Dpk2IrHqcjKzdY3LSJuIjVSLkV0UzO/Mz7oyy5xVFz9pxKW+cAMD76
	FvSAiQm26m1Zppum8KuyJEkD5ah8BblvAQQg6kbETtbZqZoncxKMpVatPpo1vBk0xet
	rngHCWQ6wxCQqKvns3q3DLvpnZJ1EGyIN2QrbRS4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786130;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W4xUFJu30GqBWivR+DQlhpmAOUZj7n2pdi2AWStiYYI=;
	b=hfi+BfK/7C67jJPr7oR9mKpncfcwMXH02GGfiVoaFPQqIGra8etzdgfTzwK5rvQQ
	aHSR364Op86T71B5cfZo6s1S9cpCms5mXqi9wXcLb6lPQ02hM5objCCBkD83s/P2557
	18FZoiouMYlqpiLHBv7/vnd3UhEK+3lB4+V5zWYI=
Content-Type: multipart/mixed; boundary="===============1326738657295624706=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dnf: upgrading to 4.23.0 SUCCEEDED
Message-ID: <010101972bc6abd4-6e1ecf89-265d-4bde-abda-6298654a177e-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217586

--===============1326738657295624706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dnf* to *4.23.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.22.0-4.23.0.patch
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
From 2b55f2d5194596ba7852790d241f5548cbd92223 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 08:37:08 +0000
Subject: [PATCH] dnf: upgrade 4.22.0 -> 4.23.0

---
 .../0001-Corretly-install-tmpfiles.d-configuration.patch    | 2 +-
 ...1-Do-not-hardcode-etc-and-systemd-unit-directories.patch | 6 +++---
 .../dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch       | 2 +-
 .../dnf/dnf/0001-lock.py-fix-Exception-handling.patch       | 5 +----
 .../dnf/0001-set-python-path-for-completion_helper.patch    | 2 +-
 .../dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch | 6 +++---
 ...29-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 6 +++---
 .../dnf/dnf/0030-Run-python-scripts-using-env.patch         | 6 +++---
 meta/recipes-devtools/dnf/{dnf_4.22.0.bb => dnf_4.23.0.bb}  | 2 +-
 9 files changed, 17 insertions(+), 20 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.22.0.bb => dnf_4.23.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
index fd942228b9..35526ce4b4 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,4 +1,4 @@
-From f70eb308c837f2c944e23bb680a501a605004d65 Mon Sep 17 00:00:00 2001
+From d6b5dee38993938fccf7da826f382c378ad2de24 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:36:20 +0200
 Subject: [PATCH] Corretly install tmpfiles.d configuration
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 37359a5765..f34195ee02 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,4 +1,4 @@
-From 3ca6d14fbc6419ff6239b4ba16f77da20fb31d03 Mon Sep 17 00:00:00 2001
+From 24b7ee6efc8c015d29663e02fe50b3a659342ebe Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
 Subject: [PATCH] Do not hardcode /etc and systemd unit directories
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4aee99fb..9e2e9e9e 100644
+index a76b6ac4..a2ba58c9 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -3,8 +3,8 @@ CMAKE_MINIMUM_REQUIRED (VERSION 2.4)
+@@ -4,8 +4,8 @@ PROJECT (dnf NONE)
  
  INCLUDE (${CMAKE_SOURCE_DIR}/VERSION.cmake)
  
diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index 18f9a30949..9f9a64ea00 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 049e2832284ab883e185d9020c881518a68e6c38 Mon Sep 17 00:00:00 2001
+From 02bbac159eba151448267fa32179573997501feb Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
diff --git a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
index 6bffe9af0a..3e59d5580d 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
@@ -1,4 +1,4 @@
-From 3881757eabfde2ff54400ab127b106ab085d83f0 Mon Sep 17 00:00:00 2001
+From 61a255a7bfd7b2b90e8a3a9d0310b57ceb8eb62a Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 13 Mar 2024 11:22:05 +0800
 Subject: [PATCH] lock.py: fix Exception handling
@@ -57,6 +57,3 @@ index 6817aac9..5718062a 100644
  
      def __exit__(self, *exc_args):
          if self.count == 1:
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
index fcd970a7ae..dcf8484a19 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -1,4 +1,4 @@
-From fa32c7dcabaa3c00d3620a3266e49629365c0cbe Mon Sep 17 00:00:00 2001
+From ccf714214e6d35d8de5ac1b5aee9daa24dfcac4d Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 22:10:02 +0000
 Subject: [PATCH] set python path for completion_helper
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index a1c58d6563..d96f5cf2b8 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,4 +1,4 @@
-From 0e7fc4a8523aad616493e6ad33c509e1e530d852 Mon Sep 17 00:00:00 2001
+From 3e4d60b15b45d03f3954d4c4a24f056bad26c191 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
 Subject: [PATCH] Do not prepend installroot to logdir.
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index d3844df3..ac080f79 100644
+index 62b9434b..14d4757c 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
-@@ -954,7 +954,7 @@ class Cli(object):
+@@ -1002,7 +1002,7 @@ class Cli(object):
              logger.warning(_("Unable to detect release version (use '--releasever' to specify "
                               "release version)"))
  
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 64ea7874d3..3729e5d539 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From d5b154ea69afdcd862299a0b7f255f6ece3686c6 Mon Sep 17 00:00:00 2001
+From 3ca2b7d2f48f14453babfb4370a169470dc4bd54 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9e2e9e9e..2056089d 100644
+index a2ba58c9..98aa9df0 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -19,7 +19,7 @@ ELSE ()
+@@ -20,7 +20,7 @@ ELSE ()
      MESSAGE (FATAL_ERROR "Invalid PYTHON_DESIRED value: " ${PYTHON_DESIRED})
  ENDIF()
  
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index eb46113f3a..4a09c260f6 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,4 +1,4 @@
-From d3556767b84f3687743fdad0a88af0739d736ea9 Mon Sep 17 00:00:00 2001
+From c97a963e7a27152c86ae252659e3cf893366f8a8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:37 +0200
 Subject: [PATCH] Run python scripts using env
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/bin/dnf-automatic.in b/bin/dnf-automatic.in
-index 17e35a05..28827e38 100755
+index 1fb712b0..ce8d4b8f 100755
 --- a/bin/dnf-automatic.in
 +++ b/bin/dnf-automatic.in
 @@ -1,4 +1,4 @@
@@ -23,7 +23,7 @@ index 17e35a05..28827e38 100755
  #
  # Copyright (C) 2014-2016 Red Hat, Inc.
 diff --git a/bin/dnf.in b/bin/dnf.in
-index 55ceb3f2..e38973c7 100755
+index 10716dec..817d7da5 100755
 --- a/bin/dnf.in
 +++ b/bin/dnf.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.23.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.22.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.23.0.bb
index e5ac3c9824..fe3deb4344 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.23.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "da9a7066be8e1628d9453428d33685225cd9c90d"
+SRCREV = "8fa4bb94a99eadaed91ad2ee51f27a4baafcebed"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.47.1


--===============1326738657295624706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dnf/dnf-bash-completion: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dbg: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-dbg: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dev: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-dev: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-doc: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-doc: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-be: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-be: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-da: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-de: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-el: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-es: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-he: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-id: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-it: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-om: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-om: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-or: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-si: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-th: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-src: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-src: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-staticdev: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-dep: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-main: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf-test-main: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf/dnf: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf/dnf: PKGSIZE changed from 962190 to 972308 (+1%)
packages/core2-64-poky-linux/dnf/dnf: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/dnf: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/dnf: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.13/site-packages/dnf-4.22.0.dist-info moved to /usr/lib/python3.13/site-packages/dnf-4.23.0.dist-info

--===============1326738657295624706==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.22.0-4.23.0.patch"

RnJvbSAyYjU1ZjJkNTE5NDU5NmJhNzg1Mjc5MGQyNDFmNTU0OGNiZDkyMjIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwODozNzowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRu
ZjogdXBncmFkZSA0LjIyLjAgLT4gNC4yMy4wCgotLS0KIC4uLi8wMDAxLUNvcnJldGx5LWluc3Rh
bGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoICAgIHwgMiArLQogLi4uMS1Eby1ub3Qt
aGFyZGNvZGUtZXRjLWFuZC1zeXN0ZW1kLXVuaXQtZGlyZWN0b3JpZXMucGF0Y2ggfCA2ICsrKy0t
LQogLi4uL2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2gg
ICAgICAgfCAyICstCiAuLi4vZG5mL2RuZi8wMDAxLWxvY2sucHktZml4LUV4Y2VwdGlvbi1oYW5k
bGluZy5wYXRjaCAgICAgICB8IDUgKy0tLS0KIC4uLi9kbmYvMDAwMS1zZXQtcHl0aG9uLXBhdGgt
Zm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoICAgIHwgMiArLQogLi4uL2RuZi9kbmYvMDAwNS1E
by1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIucGF0Y2ggfCA2ICsrKy0tLQogLi4u
MjktRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gg
fCA2ICsrKy0tLQogLi4uL2RuZi9kbmYvMDAzMC1SdW4tcHl0aG9uLXNjcmlwdHMtdXNpbmctZW52
LnBhdGNoICAgICAgICAgfCA2ICsrKy0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi97ZG5m
XzQuMjIuMC5iYiA9PiBkbmZfNC4yMy4wLmJifSAgfCAyICstCiA5IGZpbGVzIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9kbmYve2RuZl80LjIyLjAuYmIgPT4gZG5mXzQuMjMuMC5iYn0gKDk4JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLUNvcnJldGx5LWluc3RhbGwt
dG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ru
Zi9kbmYvMDAwMS1Db3JyZXRseS1pbnN0YWxsLXRtcGZpbGVzLmQtY29uZmlndXJhdGlvbi5wYXRj
aAppbmRleCBmZDk0MjIyOGI5Li4zNTUyNmNlNGI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZG5mL2RuZi8wMDAxLUNvcnJldGx5LWluc3RhbGwtdG1wZmlsZXMuZC1jb25maWd1
cmF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtQ29y
cmV0bHktaW5zdGFsbC10bXBmaWxlcy5kLWNvbmZpZ3VyYXRpb24ucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGY3MGViMzA4YzgzN2YyYzk0NGUyM2JiNjgwYTUwMWE2MDUwMDRkNjUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQ2YjVkZWUzODk5MzkzOGZjY2Y3ZGE4MjZmMzgyYzM3
OGFkMmRlMjQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjYgSmFuIDIwMTcgMTY6MzY6
MjAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gQ29ycmV0bHkgaW5zdGFsbCB0bXBmaWxlcy5kIGNv
bmZpZ3VyYXRpb24KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAw
MDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Eby1ub3QtaGFyZGNvZGUtZXRj
LWFuZC1zeXN0ZW1kLXVuaXQtZGlyZWN0b3JpZXMucGF0Y2gKaW5kZXggMzczNTlhNTc2NS4uZjM0
MTk1ZWUwMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1E
by1ub3QtaGFyZGNvZGUtZXRjLWFuZC1zeXN0ZW1kLXVuaXQtZGlyZWN0b3JpZXMucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Eby1ub3QtaGFyZGNvZGUtZXRj
LWFuZC1zeXN0ZW1kLXVuaXQtZGlyZWN0b3JpZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDNjYTZkMTRmYmM2NDE5ZmY2MjM5YjRiYTE2Zjc3ZGEyMGZiMzFkMDMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDI0YjdlZTZlZmM4YzAxNWQyOTY2M2UwMmZlNTBiM2E2NTkzNDJlYmUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjYgSmFuIDIwMTcgMTY6MjU6NDcgKzAyMDAK
IFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IGhhcmRjb2RlIC9ldGMgYW5kIHN5c3RlbWQgdW5pdCBk
aXJlY3RvcmllcwpAQCAtMTAsMTAgKzEwLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4dCBi
L0NNYWtlTGlzdHMudHh0Ci1pbmRleCA0YWVlOTlmYi4uOWUyZTllOWUgMTAwNjQ0CitpbmRleCBh
NzZiNmFjNC4uYTJiYTU4YzkgMTAwNjQ0CiAtLS0gYS9DTWFrZUxpc3RzLnR4dAogKysrIGIvQ01h
a2VMaXN0cy50eHQKLUBAIC0zLDggKzMsOCBAQCBDTUFLRV9NSU5JTVVNX1JFUVVJUkVEIChWRVJT
SU9OIDIuNCkKK0BAIC00LDggKzQsOCBAQCBQUk9KRUNUIChkbmYgTk9ORSkKICAKICBJTkNMVURF
ICgke0NNQUtFX1NPVVJDRV9ESVJ9L1ZFUlNJT04uY21ha2UpCiAgCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8t
cm9vdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtZG5mLXdyaXRl
LXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoCmluZGV4IDE4ZjlhMzA5NDkuLjlmOWE2NGVhMDAg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtZG5mLXdyaXRl
LXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSAwNDllMjgzMjI4NGFiODgzZTE4NWQ5MDIwYzg4MTUxOGE2OGU2YzM4IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwMmJiYWMxNTllYmExNTE0NDgyNjdmYTMyMTc5
NTczOTk3NTAxZmViIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDI4IEFwciAyMDIwIDE1
OjU1OjAwICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRuZjogd3JpdGUgdGhlIGxvZyBsb2NrIHRv
IHJvb3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtbG9j
ay5weS1maXgtRXhjZXB0aW9uLWhhbmRsaW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2RuZi9kbmYvMDAwMS1sb2NrLnB5LWZpeC1FeGNlcHRpb24taGFuZGxpbmcucGF0Y2gKaW5kZXgg
NmJmZmU5YWYwYS4uM2U1OWQ1NTgwZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2RuZi9kbmYvMDAwMS1sb2NrLnB5LWZpeC1FeGNlcHRpb24taGFuZGxpbmcucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1sb2NrLnB5LWZpeC1FeGNlcHRpb24t
aGFuZGxpbmcucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM4ODE3NTdlYWJmZGUyZmY1NDQw
MGFiMTI3YjEwNmFiMDg1ZDgzZjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDYxYTI1
NWE3YmZkN2IyYjkwZThhM2E5ZDAzMTBiNTdjZWI4ZWI2MmEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0
ZTogV2VkLCAxMyBNYXIgMjAyNCAxMToyMjowNSArMDgwMAogU3ViamVjdDogW1BBVENIXSBsb2Nr
LnB5OiBmaXggRXhjZXB0aW9uIGhhbmRsaW5nCkBAIC01Nyw2ICs1NywzIEBAIGluZGV4IDY4MTdh
YWM5Li41NzE4MDYyYSAxMDA2NDQKICAKICAgICAgZGVmIF9fZXhpdF9fKHNlbGYsICpleGNfYXJn
cyk6CiAgICAgICAgICBpZiBzZWxmLmNvdW50ID09IDE6Ci0tLSAKLTIuMjUuMQotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLXNldC1weXRob24tcGF0aC1m
b3ItY29tcGxldGlvbl9oZWxwZXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2Ru
Zi8wMDAxLXNldC1weXRob24tcGF0aC1mb3ItY29tcGxldGlvbl9oZWxwZXIucGF0Y2gKaW5kZXgg
ZmNkOTcwYTdhZS4uZGNmODQ4NGExOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2RuZi9kbmYvMDAwMS1zZXQtcHl0aG9uLXBhdGgtZm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtc2V0LXB5dGhvbi1wYXRo
LWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZmEzMmM3
ZGNhYmFhM2MwMGQzNjIwYTMyNjZlNDk2MjkzNjVjMGNiZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gY2NmNzE0MjE0ZTZkMzVkOGRlNWFjMWI1YWVlOWRhYTI0ZGZjYWM0ZCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEplcmVteSBQdWhsbWFuIDxqcHVobG1hbkBtdmlzdGEu
Y29tPgogRGF0ZTogV2VkLCAxMSBNYXIgMjAyMCAyMjoxMDowMiArMDAwMAogU3ViamVjdDogW1BB
VENIXSBzZXQgcHl0aG9uIHBhdGggZm9yIGNvbXBsZXRpb25faGVscGVyCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDA1LURvLW5vdC1wcmVwZW5kLWluc3RhbGxy
b290LXRvLWxvZ2Rpci5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDUt
RG8tbm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGlyLnBhdGNoCmluZGV4IGExYzU4ZDY1
NjMuLmQ5NmY1Y2YyYjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5m
LzAwMDUtRG8tbm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGlyLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDUtRG8tbm90LXByZXBlbmQtaW5zdGFsbHJv
b3QtdG8tbG9nZGlyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwZTdmYzRhODUyM2FhZDYx
NjQ5M2U2YWQzM2M1MDllMWU1MzBkODUyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAz
ZTRkNjBiMTViNDVkMDNmMzk1NGQ0YzRhMjRmMDU2YmFkMjZjMTkxIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
CiBEYXRlOiBXZWQsIDExIEphbiAyMDE3IDE1OjEwOjEzICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hd
IERvIG5vdCBwcmVwZW5kIGluc3RhbGxyb290IHRvIGxvZ2Rpci4KQEAgLTE0LDEwICsxNCwxMCBA
QCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlm
ZiAtLWdpdCBhL2RuZi9jbGkvY2xpLnB5IGIvZG5mL2NsaS9jbGkucHkKLWluZGV4IGQzODQ0ZGYz
Li5hYzA4MGY3OSAxMDA2NDQKK2luZGV4IDYyYjk0MzRiLi4xNGQ0NzU3YyAxMDA2NDQKIC0tLSBh
L2RuZi9jbGkvY2xpLnB5CiArKysgYi9kbmYvY2xpL2NsaS5weQotQEAgLTk1NCw3ICs5NTQsNyBA
QCBjbGFzcyBDbGkob2JqZWN0KToKK0BAIC0xMDAyLDcgKzEwMDIsNyBAQCBjbGFzcyBDbGkob2Jq
ZWN0KToKICAgICAgICAgICAgICBsb2dnZXIud2FybmluZyhfKCJVbmFibGUgdG8gZGV0ZWN0IHJl
bGVhc2UgdmVyc2lvbiAodXNlICctLXJlbGVhc2V2ZXInIHRvIHNwZWNpZnkgIgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgInJlbGVhc2UgdmVyc2lvbikiKSkKICAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMjktRG8tbm90LXNldC1QWVRIT05fSU5T
VEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL2RuZi8wMDI5LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0
aG9uLnBhdGNoCmluZGV4IDY0ZWE3ODc0ZDMuLjM3MjllNWQ1MzkgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMjktRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9E
SVItYnktcnVubmluZy1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ru
Zi9kbmYvMDAyOS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhv
bi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDViMTU0ZWE2OWFmZGNkODYyMjk5YTBiN2Yy
NTVmNmVjZTM2ODZjNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2NhMmI3ZDJmNDhm
MTQ0NTNiYWJmYjQzNzBhMTY5NDcwZGM0YmQ1NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJp
LCAzMCBEZWMgMjAxNiAxODoyOTowNyArMDIwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3Qgc2V0
IFBZVEhPTl9JTlNUQUxMX0RJUiBieSBydW5uaW5nIHB5dGhvbgpAQCAtMTAsMTAgKzEwLDEwIEBA
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAotaW5kZXggOWUyZTllOWUu
LjIwNTYwODlkIDEwMDY0NAoraW5kZXggYTJiYTU4YzkuLjk4YWE5ZGYwIDEwMDY0NAogLS0tIGEv
Q01ha2VMaXN0cy50eHQKICsrKyBiL0NNYWtlTGlzdHMudHh0Ci1AQCAtMTksNyArMTksNyBAQCBF
TFNFICgpCitAQCAtMjAsNyArMjAsNyBAQCBFTFNFICgpCiAgICAgIE1FU1NBR0UgKEZBVEFMX0VS
Uk9SICJJbnZhbGlkIFBZVEhPTl9ERVNJUkVEIHZhbHVlOiAiICR7UFlUSE9OX0RFU0lSRUR9KQog
IEVORElGKCkKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAw
MzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5nLWVudi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9kbmYvZG5mLzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5nLWVudi5wYXRjaAppbmRl
eCBlYjQ2MTEzZjNhLi40YTA5YzI2MGY2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZG5mL2RuZi8wMDMwLVJ1bi1weXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAzMC1SdW4tcHl0aG9uLXNjcmlwdHMtdXNp
bmctZW52LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkMzU1Njc2N2I4NGYzNjg3NzQzZmRh
ZDBhODhhZjA3MzlkNzM2ZWE5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjOTdhOTYz
ZTdhMjcxNTJjODZhZTI1MjY1OWUzY2Y4OTMzNjZmOGE4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRl
OiBGcmksIDMwIERlYyAyMDE2IDE4OjI5OjM3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJ1biBw
eXRob24gc2NyaXB0cyB1c2luZyBlbnYKQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTog
QWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9iaW4v
ZG5mLWF1dG9tYXRpYy5pbiBiL2Jpbi9kbmYtYXV0b21hdGljLmluCi1pbmRleCAxN2UzNWEwNS4u
Mjg4MjdlMzggMTAwNzU1CitpbmRleCAxZmI3MTJiMC4uY2U4ZDRiOGYgMTAwNzU1CiAtLS0gYS9i
aW4vZG5mLWF1dG9tYXRpYy5pbgogKysrIGIvYmluL2RuZi1hdXRvbWF0aWMuaW4KIEBAIC0xLDQg
KzEsNCBAQApAQCAtMjMsNyArMjMsNyBAQCBpbmRleCAxN2UzNWEwNS4uMjg4MjdlMzggMTAwNzU1
CiAgIwogICMgQ29weXJpZ2h0IChDKSAyMDE0LTIwMTYgUmVkIEhhdCwgSW5jLgogZGlmZiAtLWdp
dCBhL2Jpbi9kbmYuaW4gYi9iaW4vZG5mLmluCi1pbmRleCA1NWNlYjNmMi4uZTM4OTczYzcgMTAw
NzU1CitpbmRleCAxMDcxNmRlYy4uODE3ZDdkYTUgMTAwNzU1CiAtLS0gYS9iaW4vZG5mLmluCiAr
KysgYi9iaW4vZG5mLmluCiBAQCAtMSw0ICsxLDQgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9kbmYvZG5mXzQuMjIuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYv
ZG5mXzQuMjMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZG5mL2RuZl80LjIyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9kbmYvZG5mXzQuMjMuMC5iYgppbmRleCBlNWFjM2M5ODI0Li5mZTNkZWI0MzQ0IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjIyLjAuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4yMy4wLmJiCkBAIC0yMCw3ICsyMCw3IEBAIFNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9kbmYuZ2l0
O2JyYW5jaD1tYXN0ZXI7cHJvdG9jCiAKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIg
ZmlsZTovLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoIgogCi1TUkNS
RVYgPSAiZGE5YTcwNjZiZThlMTYyOGQ5NDUzNDI4ZDMzNjg1MjI1Y2Q5YzkwZCIKK1NSQ1JFViA9
ICI4ZmE0YmI5NGE5OWVhZGFlZDkxYWQyZWU1MWYyN2E0YmFhZmNlYmVkIgogVVBTVFJFQU1fQ0hF
Q0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCiBTID0gIiR7V09SS0RJ
Un0vZ2l0IgotLSAKMi40Ny4xCgo=

--===============1326738657295624706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.13/site-packages/dnf-4.22.0.dist-info moved to /usr/lib/python3.13/site-packages/dnf-4.23.0.dist-info

--===============1326738657295624706==--

