Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1D8CEB2E9
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12118.1763224717820855283
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vkmrTuyJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=M3FN0/dX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a88620775-d6f327b0-329a-4547-9ef3-f01719cf7257-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FBnpMqujeD+d9ZIffo+5JWSWssLY46i26qGJomQM2Qw=;
	b=vkmrTuyJSzoC0xIrHm7LLx0IJImh1yFaray94UEM7rMAdSQdq8wgZCa4GwAIGxFR
	riX5h7/OJ1c04X/PILE9T/psG5H0tcbj+QzELRN6dN04BNGtvJA2ExFviwTxQWFxK9e
	94wACIn6hLlkRBc18WJwAEBL32pFaVioCto7QmMw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FBnpMqujeD+d9ZIffo+5JWSWssLY46i26qGJomQM2Qw=;
	b=M3FN0/dXxDUiYt1Y5QTwBxUmiN8pHN8VpBtVLBtThVCddF+yfBCss1Y83srlFbjH
	svGpUOjhRfQ1V10Jzns1/kdfv/xbDnJE+zc2etQRQz0y5GXRJYsDYtynRQVBmDNQADI
	edQDJa4B3CbfKqksYFkRElB/yuIO/hlUYleiRg68=
Content-Type: multipart/mixed; boundary="===============7044876087687508634=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] dnf: upgrading to 4.24.0 SUCCEEDED
Message-ID: <0101019a88620775-d6f327b0-329a-4547-9ef3-f01719cf7257-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226331

--===============7044876087687508634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dnf* to *4.24.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.23.0-4.24.0.patch
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
From 2162f686f4a43213b40dc4b73944f46725ab14d9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 08:51:07 +0000
Subject: [PATCH] dnf: upgrade 4.23.0 -> 4.24.0

---
 .../0001-Corretly-install-tmpfiles.d-configuration.patch    | 2 +-
 ...1-Do-not-hardcode-etc-and-systemd-unit-directories.patch | 6 +++---
 .../dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch       | 2 +-
 .../dnf/dnf/0001-lock.py-fix-Exception-handling.patch       | 5 +----
 .../dnf/0001-set-python-path-for-completion_helper.patch    | 2 +-
 .../dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch | 6 +++---
 ...29-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 4 ++--
 .../dnf/dnf/0030-Run-python-scripts-using-env.patch         | 6 +++---
 meta/recipes-devtools/dnf/{dnf_4.23.0.bb => dnf_4.24.0.bb}  | 2 +-
 9 files changed, 16 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.23.0.bb => dnf_4.24.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
index fd942228b9..5df6e16be4 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,4 +1,4 @@
-From f70eb308c837f2c944e23bb680a501a605004d65 Mon Sep 17 00:00:00 2001
+From 7a30a0355cce9d08520f59945e3f1726277a4b84 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:36:20 +0200
 Subject: [PATCH] Corretly install tmpfiles.d configuration
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 37359a5765..3cc61edb5f 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,4 +1,4 @@
-From 3ca6d14fbc6419ff6239b4ba16f77da20fb31d03 Mon Sep 17 00:00:00 2001
+From 298569e34746a570397d2398d9662c8246808cf1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
 Subject: [PATCH] Do not hardcode /etc and systemd unit directories
@@ -10,10 +10,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4aee99fb..9e2e9e9e 100644
+index e71e9517..8fcb2069 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -3,8 +3,8 @@ CMAKE_MINIMUM_REQUIRED (VERSION 2.4)
+@@ -3,8 +3,8 @@ PROJECT (dnf NONE)
  
  INCLUDE (${CMAKE_SOURCE_DIR}/VERSION.cmake)
  
diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index 18f9a30949..ea7a37675c 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 049e2832284ab883e185d9020c881518a68e6c38 Mon Sep 17 00:00:00 2001
+From 8afb732c569b98737b5a7f6261f8052cc23e57f9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
diff --git a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
index 6bffe9af0a..83ad8f38d3 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
@@ -1,4 +1,4 @@
-From 3881757eabfde2ff54400ab127b106ab085d83f0 Mon Sep 17 00:00:00 2001
+From 5e0c45cdc333ef1accb50fd1499165af45dfe38e Mon Sep 17 00:00:00 2001
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
index fcd970a7ae..aad111bff8 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -1,4 +1,4 @@
-From fa32c7dcabaa3c00d3620a3266e49629365c0cbe Mon Sep 17 00:00:00 2001
+From 16ff66a4496d3d905fac1ed63f70e744e4774377 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 22:10:02 +0000
 Subject: [PATCH] set python path for completion_helper
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index a1c58d6563..e411a169ef 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,4 +1,4 @@
-From 0e7fc4a8523aad616493e6ad33c509e1e530d852 Mon Sep 17 00:00:00 2001
+From 701678ecf7a97f64dff151526bd0c1c3f085c397 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
 Subject: [PATCH] Do not prepend installroot to logdir.
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index d3844df3..ac080f79 100644
+index e0d88cac..8e540fcd 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
-@@ -954,7 +954,7 @@ class Cli(object):
+@@ -1030,7 +1030,7 @@ class Cli(object):
              logger.warning(_("Unable to detect release version (use '--releasever' to specify "
                               "release version)"))
  
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 64ea7874d3..9062b3329c 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From d5b154ea69afdcd862299a0b7f255f6ece3686c6 Mon Sep 17 00:00:00 2001
+From 2a237f5bf102123efed329faa59202e88af0aef8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9e2e9e9e..2056089d 100644
+index 8fcb2069..59ec6f0b 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -19,7 +19,7 @@ ELSE ()
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index eb46113f3a..f2811f9e34 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,4 +1,4 @@
-From d3556767b84f3687743fdad0a88af0739d736ea9 Mon Sep 17 00:00:00 2001
+From b81feea472266126fe48934c7ce422d0b974db52 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/dnf/dnf_4.23.0.bb b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.23.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.24.0.bb
index 927a8d8930..d40b85c4b0 100644
--- a/meta/recipes-devtools/dnf/dnf_4.23.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.24.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "8fa4bb94a99eadaed91ad2ee51f27a4baafcebed"
+SRCREV = "e47634fbe3565d0580e89ec21adb7c1b308642ce"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake gettext bash-completion setuptools3-base systemd
-- 
2.47.1


--===============7044876087687508634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-bash-completion: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-dbg: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-dbg: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-dev: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-dev: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-doc: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-doc: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ar: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-be: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-be: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-bg: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-bn: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ca: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-cs: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-da: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-de: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-el: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-eo: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-es: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-eu: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fa: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fi: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fil: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fr: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-fur: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-gd: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-gu: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-he: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-hi: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-hr: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-hu: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-id: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ie: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ie: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-it: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ja: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ka: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-kk: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ko: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-lt: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ml: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-mr: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ms: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-nb: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-nl: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-om: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-om: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-or: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pa: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pl: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-pt: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ru: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-si: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sk: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sl: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sl: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sq: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sr: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-sv: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-th: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-tr: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-uk: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-ur: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-vi: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-src: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-src: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-staticdev: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-test-dep: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf-test-main: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf-test-main: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf/dnf: PV changed from "4.23.0" to "4.24.0"
packages/x86-64-v3-poky-linux/dnf/dnf: PKGSIZE changed from 972308 to 976303 (+0%)
packages/x86-64-v3-poky-linux/dnf: PKGV changed from 4.23.0 [default] to 4.24.0 [default]
packages/x86-64-v3-poky-linux/dnf: PV changed from "4.23.0" to "4.24.0"
Changes to packages/x86-64-v3-poky-linux/dnf (sysroot):
  /usr/lib/python3.13/site-packages/dnf-4.23.0.dist-info moved to /usr/lib/python3.13/site-packages/dnf-4.24.0.dist-info

--===============7044876087687508634==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.23.0-4.24.0.patch"

RnJvbSAyMTYyZjY4NmY0YTQzMjEzYjQwZGM0YjczOTQ0ZjQ2NzI1YWIxNGQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDg6NTE6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
bmY6IHVwZ3JhZGUgNC4yMy4wIC0+IDQuMjQuMAoKLS0tCiAuLi4vMDAwMS1Db3JyZXRseS1pbnN0
YWxsLXRtcGZpbGVzLmQtY29uZmlndXJhdGlvbi5wYXRjaCAgICB8IDIgKy0KIC4uLjEtRG8tbm90
LWhhcmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoIHwgNiArKyst
LS0KIC4uLi9kbmYvZG5mLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNo
ICAgICAgIHwgMiArLQogLi4uL2RuZi9kbmYvMDAwMS1sb2NrLnB5LWZpeC1FeGNlcHRpb24taGFu
ZGxpbmcucGF0Y2ggICAgICAgfCA1ICstLS0tCiAuLi4vZG5mLzAwMDEtc2V0LXB5dGhvbi1wYXRo
LWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRjaCAgICB8IDIgKy0KIC4uLi9kbmYvZG5mLzAwMDUt
RG8tbm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGlyLnBhdGNoIHwgNiArKystLS0KIC4u
LjI5LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNo
IHwgNCArKy0tCiAuLi4vZG5mL2RuZi8wMDMwLVJ1bi1weXRob24tc2NyaXB0cy11c2luZy1lbnYu
cGF0Y2ggICAgICAgICB8IDYgKysrLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL3tkbmZf
NC4yMy4wLmJiID0+IGRuZl80LjI0LjAuYmJ9ICB8IDIgKy0KIDkgZmlsZXMgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2RuZi97ZG5mXzQuMjMuMC5iYiA9PiBkbmZfNC4yNC4wLmJifSAoOTglKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtQ29ycmV0bHktaW5zdGFsbC10
bXBmaWxlcy5kLWNvbmZpZ3VyYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5m
L2RuZi8wMDAxLUNvcnJldGx5LWluc3RhbGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNo
CmluZGV4IGZkOTQyMjI4YjkuLjVkZjZlMTZiZTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kbmYvZG5mLzAwMDEtQ29ycmV0bHktaW5zdGFsbC10bXBmaWxlcy5kLWNvbmZpZ3Vy
YXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Db3Jy
ZXRseS1pbnN0YWxsLXRtcGZpbGVzLmQtY29uZmlndXJhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gZjcwZWIzMDhjODM3ZjJjOTQ0ZTIzYmI2ODBhNTAxYTYwNTAwNGQ2NSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gN2EzMGEwMzU1Y2NlOWQwODUyMGY1OTk0NWUzZjE3MjYy
NzdhNGI4NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmlu
IDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyNiBKYW4gMjAxNyAxNjozNjoy
MCArMDIwMAogU3ViamVjdDogW1BBVENIXSBDb3JyZXRseSBpbnN0YWxsIHRtcGZpbGVzLmQgY29u
ZmlndXJhdGlvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAw
MS1Eby1ub3QtaGFyZGNvZGUtZXRjLWFuZC1zeXN0ZW1kLXVuaXQtZGlyZWN0b3JpZXMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLURvLW5vdC1oYXJkY29kZS1ldGMt
YW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaAppbmRleCAzNzM1OWE1NzY1Li4zY2M2
MWVkYjVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLURv
LW5vdC1oYXJkY29kZS1ldGMtYW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLURvLW5vdC1oYXJkY29kZS1ldGMt
YW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
M2NhNmQxNGZiYzY0MTlmZjYyMzliNGJhMTZmNzdkYTIwZmIzMWQwMyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gMjk4NTY5ZTM0NzQ2YTU3MDM5N2QyMzk4ZDk2NjJjODI0NjgwOGNmMSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyNiBKYW4gMjAxNyAxNjoyNTo0NyArMDIwMAog
U3ViamVjdDogW1BBVENIXSBEbyBub3QgaGFyZGNvZGUgL2V0YyBhbmQgc3lzdGVtZCB1bml0IGRp
cmVjdG9yaWVzCkBAIC0xMCwxMCArMTAsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIv
Q01ha2VMaXN0cy50eHQKLWluZGV4IDRhZWU5OWZiLi45ZTJlOWU5ZSAxMDA2NDQKK2luZGV4IGU3
MWU5NTE3Li44ZmNiMjA2OSAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFr
ZUxpc3RzLnR4dAotQEAgLTMsOCArMyw4IEBAIENNQUtFX01JTklNVU1fUkVRVUlSRUQgKFZFUlNJ
T04gMi40KQorQEAgLTMsOCArMyw4IEBAIFBST0pFQ1QgKGRuZiBOT05FKQogIAogIElOQ0xVREUg
KCR7Q01BS0VfU09VUkNFX0RJUn0vVkVSU0lPTi5jbWFrZSkKICAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1y
b290LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUt
dGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2gKaW5kZXggMThmOWEzMDk0OS4uZWE3YTM3Njc1YyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUt
dGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ru
Zi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDA0OWUyODMyMjg0YWI4ODNlMTg1ZDkwMjBjODgxNTE4YTY4ZTZjMzggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhhZmI3MzJjNTY5Yjk4NzM3YjVhN2Y2MjYxZjgw
NTJjYzIzZTU3ZjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMjggQXByIDIwMjAgMTU6
NTU6MDAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gZG5mOiB3cml0ZSB0aGUgbG9nIGxvY2sgdG8g
cm9vdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1sb2Nr
LnB5LWZpeC1FeGNlcHRpb24taGFuZGxpbmcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL2RuZi8wMDAxLWxvY2sucHktZml4LUV4Y2VwdGlvbi1oYW5kbGluZy5wYXRjaAppbmRleCA2
YmZmZTlhZjBhLi44M2FkOGYzOGQzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL2RuZi8wMDAxLWxvY2sucHktZml4LUV4Y2VwdGlvbi1oYW5kbGluZy5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWxvY2sucHktZml4LUV4Y2VwdGlvbi1o
YW5kbGluZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzg4MTc1N2VhYmZkZTJmZjU0NDAw
YWIxMjdiMTA2YWIwODVkODNmMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWUwYzQ1
Y2RjMzMzZWYxYWNjYjUwZmQxNDk5MTY1YWY0NWRmZTM4ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxpQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBXZWQsIDEzIE1hciAyMDI0IDExOjIyOjA1ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxvY2su
cHk6IGZpeCBFeGNlcHRpb24gaGFuZGxpbmcKQEAgLTU3LDYgKzU3LDMgQEAgaW5kZXggNjgxN2Fh
YzkuLjU3MTgwNjJhIDEwMDY0NAogIAogICAgICBkZWYgX19leGl0X18oc2VsZiwgKmV4Y19hcmdz
KToKICAgICAgICAgIGlmIHNlbGYuY291bnQgPT0gMToKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZv
ci1jb21wbGV0aW9uX2hlbHBlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5m
LzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRjaAppbmRleCBm
Y2Q5NzBhN2FlLi5hYWQxMTFiZmY4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL2RuZi8wMDAxLXNldC1weXRob24tcGF0aC1mb3ItY29tcGxldGlvbl9oZWxwZXIucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1zZXQtcHl0aG9uLXBhdGgt
Zm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmYTMyYzdk
Y2FiYWEzYzAwZDM2MjBhMzI2NmU0OTYyOTM2NWMwY2JlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAxNmZmNjZhNDQ5NmQzZDkwNWZhYzFlZDYzZjcwZTc0NGU0Nzc0Mzc3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmVyZW15IFB1aGxtYW4gPGpwdWhsbWFuQG12aXN0YS5j
b20+CiBEYXRlOiBXZWQsIDExIE1hciAyMDIwIDIyOjEwOjAyICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHNldCBweXRob24gcGF0aCBmb3IgY29tcGxldGlvbl9oZWxwZXIKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDUtRG8tbm90LXByZXBlbmQtaW5zdGFsbHJv
b3QtdG8tbG9nZGlyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwNS1E
by1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIucGF0Y2gKaW5kZXggYTFjNThkNjU2
My4uZTQxMWExNjllZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYv
MDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxscm9v
dC10by1sb2dkaXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDBlN2ZjNGE4NTIzYWFkNjE2
NDkzZTZhZDMzYzUwOWUxZTUzMGQ4NTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDcw
MTY3OGVjZjdhOTdmNjRkZmYxNTE1MjZiZDBjMWMzZjA4NWMzOTcgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4K
IERhdGU6IFdlZCwgMTEgSmFuIDIwMTcgMTU6MTA6MTMgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0g
RG8gbm90IHByZXBlbmQgaW5zdGFsbHJvb3QgdG8gbG9nZGlyLgpAQCAtMTQsMTAgKzE0LDEwIEBA
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvZG5mL2NsaS9jbGkucHkgYi9kbmYvY2xpL2NsaS5weQotaW5kZXggZDM4NDRkZjMu
LmFjMDgwZjc5IDEwMDY0NAoraW5kZXggZTBkODhjYWMuLjhlNTQwZmNkIDEwMDY0NAogLS0tIGEv
ZG5mL2NsaS9jbGkucHkKICsrKyBiL2RuZi9jbGkvY2xpLnB5Ci1AQCAtOTU0LDcgKzk1NCw3IEBA
IGNsYXNzIENsaShvYmplY3QpOgorQEAgLTEwMzAsNyArMTAzMCw3IEBAIGNsYXNzIENsaShvYmpl
Y3QpOgogICAgICAgICAgICAgIGxvZ2dlci53YXJuaW5nKF8oIlVuYWJsZSB0byBkZXRlY3QgcmVs
ZWFzZSB2ZXJzaW9uICh1c2UgJy0tcmVsZWFzZXZlcicgdG8gc3BlY2lmeSAiCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAicmVsZWFzZSB2ZXJzaW9uKSIpKQogIApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAyOS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNU
QUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mLzAwMjktRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRo
b24ucGF0Y2gKaW5kZXggNjRlYTc4NzRkMy4uOTA2MmIzMzI5YyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAyOS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJ
Ui1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5m
L2RuZi8wMDI5LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9u
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkNWIxNTRlYTY5YWZkY2Q4NjIyOTlhMGI3ZjI1
NWY2ZWNlMzY4NmM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyYTIzN2Y1YmYxMDIx
MjNlZmVkMzI5ZmFhNTkyMDJlODhhZjBhZWY4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmks
IDMwIERlYyAyMDE2IDE4OjI5OjA3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBzZXQg
UFlUSE9OX0lOU1RBTExfRElSIGJ5IHJ1bm5pbmcgcHl0aG9uCkBAIC0xMCw3ICsxMCw3IEBAIFNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgog
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0t
Z2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAotaW5kZXggOWUyZTllOWUuLjIw
NTYwODlkIDEwMDY0NAoraW5kZXggOGZjYjIwNjkuLjU5ZWM2ZjBiIDEwMDY0NAogLS0tIGEvQ01h
a2VMaXN0cy50eHQKICsrKyBiL0NNYWtlTGlzdHMudHh0CiBAQCAtMTksNyArMTksNyBAQCBFTFNF
ICgpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDMwLVJ1bi1w
eXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5m
L2RuZi8wMDMwLVJ1bi1weXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2gKaW5kZXggZWI0NjEx
M2YzYS4uZjI4MTFmOWUzNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9k
bmYvMDAzMC1SdW4tcHl0aG9uLXNjcmlwdHMtdXNpbmctZW52LnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5nLWVudi5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDM1NTY3NjdiODRmMzY4Nzc0M2ZkYWQwYTg4YWYw
NzM5ZDczNmVhOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjgxZmVlYTQ3MjI2NjEy
NmZlNDg5MzRjN2NlNDIyZDBiOTc0ZGI1MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAz
MCBEZWMgMjAxNiAxODoyOTozNyArMDIwMAogU3ViamVjdDogW1BBVENIXSBSdW4gcHl0aG9uIHNj
cmlwdHMgdXNpbmcgZW52CkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvYmluL2RuZi1hdXRv
bWF0aWMuaW4gYi9iaW4vZG5mLWF1dG9tYXRpYy5pbgotaW5kZXggMTdlMzVhMDUuLjI4ODI3ZTM4
IDEwMDc1NQoraW5kZXggMWZiNzEyYjAuLmNlOGQ0YjhmIDEwMDc1NQogLS0tIGEvYmluL2RuZi1h
dXRvbWF0aWMuaW4KICsrKyBiL2Jpbi9kbmYtYXV0b21hdGljLmluCiBAQCAtMSw0ICsxLDQgQEAK
QEAgLTIzLDcgKzIzLDcgQEAgaW5kZXggMTdlMzVhMDUuLjI4ODI3ZTM4IDEwMDc1NQogICMKICAj
IENvcHlyaWdodCAoQykgMjAxNC0yMDE2IFJlZCBIYXQsIEluYy4KIGRpZmYgLS1naXQgYS9iaW4v
ZG5mLmluIGIvYmluL2RuZi5pbgotaW5kZXggNTVjZWIzZjIuLmUzODk3M2M3IDEwMDc1NQoraW5k
ZXggMTA3MTZkZWMuLjgxN2Q3ZGE1IDEwMDc1NQogLS0tIGEvYmluL2RuZi5pbgogKysrIGIvYmlu
L2RuZi5pbgogQEAgLTEsNCArMSw0IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZG5mL2RuZl80LjIzLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjI0
LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2RuZi9kbmZfNC4yMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5m
L2RuZl80LjI0LjAuYmIKaW5kZXggOTI3YThkODkzMC4uZDQwYjg1YzRiMCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4yMy4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9kbmYvZG5mXzQuMjQuMC5iYgpAQCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvZG5mLmdpdDticmFuY2g9
bWFzdGVyO3Byb3RvYwogCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly8w
MDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCIKIAotU1JDUkVWID0gIjhm
YTRiYjk0YTk5ZWFkYWVkOTFhZDJlZTUxZjI3YTRiYWFmY2ViZWQiCitTUkNSRVYgPSAiZTQ3NjM0
ZmJlMzU2NWQwNTgwZTg5ZWMyMWFkYjdjMWIzMDg2NDJjZSIKIFVQU1RSRUFNX0NIRUNLX0dJVFRB
R1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAogaW5oZXJpdCBjbWFrZSBnZXR0ZXh0
IGJhc2gtY29tcGxldGlvbiBzZXR1cHRvb2xzMy1iYXNlIHN5c3RlbWQKLS0gCjIuNDcuMQoK

--===============7044876087687508634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/dnf (sysroot):
  /usr/lib/python3.13/site-packages/dnf-4.23.0.dist-info moved to /usr/lib/python3.13/site-packages/dnf-4.24.0.dist-info

--===============7044876087687508634==--

