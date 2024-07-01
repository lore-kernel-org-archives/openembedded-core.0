Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF88C52D1F
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.2176.1719853075804603686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=S627YkSM;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=xcD6WlgA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101906f3b4a93-b14d2e51-f244-49a8-9475-f208312205a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Bin44avNe3MRPFCb4uyMcYYRFGNfOJ8qFEEotZlmzC0=;
	b=S627YkSMC51okExJHjJGzrS3IwZeMlIBf/6Ll7U8TyqMPK2E+q5dDrL8OihkSZ/O
	isNuPi/qUjl0/VoaSrGHWQKjr/EKWuxSNnweAsJiPUBgRO7/I49NM42v8KoKpbyN3wt
	oIaKKe7F6jbjU6+U8SOSF3cx2fFWZuUCEJAGB2Lg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853075;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Bin44avNe3MRPFCb4uyMcYYRFGNfOJ8qFEEotZlmzC0=;
	b=xcD6WlgAUdJi/DezxFvcyseAkLRrRFEzu6lmb9uUcT3B7k48Cr95cBBWb+IBmuik
	v+9L7a5cmanQWiPZVlMbVPLIB+a7DfxYq6YJTAPDdTBfWIMN641Ba/035dV1G5p5tOy
	Zb3FwKhJafryxM2Qv8fvlkTEHcTkgP9BcfQnH22c=
Content-Type: multipart/mixed; boundary="===============1545324970372746148=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.21.0 SUCCEEDED
Message-ID: <010101906f3b4a93-b14d2e51-f244-49a8-9475-f208312205a7-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201326

--===============1545324970372746148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.21.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.20.0-4.21.0.patch
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
From 2ba9060162788c4de2344321dca73541e055684a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 07:22:39 +0000
Subject: [PATCH] dnf: upgrade 4.20.0 -> 4.21.0

---
 .../0001-Corretly-install-tmpfiles.d-configuration.patch    | 2 +-
 ...1-Do-not-hardcode-etc-and-systemd-unit-directories.patch | 2 +-
 .../dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch       | 2 +-
 .../dnf/dnf/0001-lock.py-fix-Exception-handling.patch       | 5 +----
 .../dnf/0001-set-python-path-for-completion_helper.patch    | 2 +-
 .../dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch | 6 +++---
 ...29-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 2 +-
 .../dnf/dnf/0030-Run-python-scripts-using-env.patch         | 6 +++---
 meta/recipes-devtools/dnf/{dnf_4.20.0.bb => dnf_4.21.0.bb}  | 2 +-
 9 files changed, 13 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.20.0.bb => dnf_4.21.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
index fd942228b9..3c172560fd 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,4 +1,4 @@
-From f70eb308c837f2c944e23bb680a501a605004d65 Mon Sep 17 00:00:00 2001
+From a2b46608e7e6b3c738bec6fef027974c182f54d7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:36:20 +0200
 Subject: [PATCH] Corretly install tmpfiles.d configuration
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 37359a5765..7e3db61f1d 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,4 +1,4 @@
-From 3ca6d14fbc6419ff6239b4ba16f77da20fb31d03 Mon Sep 17 00:00:00 2001
+From 6103d97e0be39147172fe1b1516170c990ad9945 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
 Subject: [PATCH] Do not hardcode /etc and systemd unit directories
diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index 18f9a30949..fe15756795 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 049e2832284ab883e185d9020c881518a68e6c38 Mon Sep 17 00:00:00 2001
+From 16523c68b9b593679fbccd72242adfc8b2cb7990 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
diff --git a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
index 6bffe9af0a..703b06aeaa 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
@@ -1,4 +1,4 @@
-From 3881757eabfde2ff54400ab127b106ab085d83f0 Mon Sep 17 00:00:00 2001
+From e029f3948efec3d63e251ed2dc56f15970cdac53 Mon Sep 17 00:00:00 2001
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
index fcd970a7ae..9920670fbf 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -1,4 +1,4 @@
-From fa32c7dcabaa3c00d3620a3266e49629365c0cbe Mon Sep 17 00:00:00 2001
+From afa29b252ac79ab89e4ced66e27a404968b749ab Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 22:10:02 +0000
 Subject: [PATCH] set python path for completion_helper
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index cfbda11f77..9479dd9f49 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,4 +1,4 @@
-From c6d03b51e2098fc681e6811790bd5dc6597091eb Mon Sep 17 00:00:00 2001
+From 53af3779e2bce771ddb5831481a7b6b6a77062f0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
 Subject: [PATCH] Do not prepend installroot to logdir.
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index 1824bd00..4dcb1c1c 100644
+index c14f8363..bfc07ab9 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
-@@ -944,7 +944,7 @@ class Cli(object):
+@@ -953,7 +953,7 @@ class Cli(object):
              logger.warning(_("Unable to detect release version (use '--releasever' to specify "
                               "release version)"))
  
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 64ea7874d3..1e1c091157 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From d5b154ea69afdcd862299a0b7f255f6ece3686c6 Mon Sep 17 00:00:00 2001
+From 2e34b8813a79931ea26d9944630fd0a31dd4b7ef Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index eb46113f3a..d7662eb0df 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,4 +1,4 @@
-From d3556767b84f3687743fdad0a88af0739d736ea9 Mon Sep 17 00:00:00 2001
+From 938fc7ef0ea8bc52bb1df1419ad3069f58970d8d Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/dnf/dnf_4.20.0.bb b/meta/recipes-devtools/dnf/dnf_4.21.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.20.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.21.0.bb
index 4757346cbf..66d15bca77 100644
--- a/meta/recipes-devtools/dnf/dnf_4.20.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.21.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "e3cb438c0fd08c79676c0f3276aa7d75cd8557c6"
+SRCREV = "d29dfa0634235d7ad957c4746a749eb1e4a85a88"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.44.0


--===============1545324970372746148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dnf/dnf-bash-completion: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dbg: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-dbg: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dev: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-dev: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-doc: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-doc: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-be: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-be: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-da: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-de: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-el: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-es: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-he: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-id: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-it: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-om: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-om: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-or: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-si: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-th: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-src: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-src: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-staticdev: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-dep: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-main: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf-test-main: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf/dnf: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf/dnf: FILELIST: directory renamed /usr/lib/python3.12/site-packages/dnf-4.20.0.dist-info -> /usr/lib/python3.12/site-packages/dnf-4.21.0.dist-info, removed "/etc/libreport/events.d/collect_dnf.conf"
packages/core2-64-poky-linux/dnf/dnf: PKGSIZE changed from 960915 to 961603 (+0%)
packages/core2-64-poky-linux/dnf/dnf: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
packages/core2-64-poky-linux/dnf: PV changed from "4.20.0" to "4.21.0"
packages/core2-64-poky-linux/dnf: PKGV changed from 4.20.0 [default] to 4.21.0 [default]
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.12/site-packages/dnf-4.20.0.dist-info moved to /usr/lib/python3.12/site-packages/dnf-4.21.0.dist-info

--===============1545324970372746148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/dnf/dnf: FILELIST: directory renamed /usr/lib/python3.12/site-packages/dnf-4.20.0.dist-info -> /usr/lib/python3.12/site-packages/dnf-4.21.0.dist-info, removed "/etc/libreport/events.d/collect_dnf.conf"
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.12/site-packages/dnf-4.20.0.dist-info moved to /usr/lib/python3.12/site-packages/dnf-4.21.0.dist-info

--===============1545324970372746148==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.20.0-4.21.0.patch"

RnJvbSAyYmE5MDYwMTYyNzg4YzRkZTIzNDQzMjFkY2E3MzU0MWUwNTU2ODRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAwNzoyMjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRu
ZjogdXBncmFkZSA0LjIwLjAgLT4gNC4yMS4wCgotLS0KIC4uLi8wMDAxLUNvcnJldGx5LWluc3Rh
bGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoICAgIHwgMiArLQogLi4uMS1Eby1ub3Qt
aGFyZGNvZGUtZXRjLWFuZC1zeXN0ZW1kLXVuaXQtZGlyZWN0b3JpZXMucGF0Y2ggfCAyICstCiAu
Li4vZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCAgICAg
ICB8IDIgKy0KIC4uLi9kbmYvZG5mLzAwMDEtbG9jay5weS1maXgtRXhjZXB0aW9uLWhhbmRsaW5n
LnBhdGNoICAgICAgIHwgNSArLS0tLQogLi4uL2RuZi8wMDAxLXNldC1weXRob24tcGF0aC1mb3It
Y29tcGxldGlvbl9oZWxwZXIucGF0Y2ggICAgfCAyICstCiAuLi4vZG5mL2RuZi8wMDA1LURvLW5v
dC1wcmVwZW5kLWluc3RhbGxyb290LXRvLWxvZ2Rpci5wYXRjaCB8IDYgKysrLS0tCiAuLi4yOS1E
by1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaCB8IDIg
Ky0KIC4uLi9kbmYvZG5mLzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5nLWVudi5wYXRjaCAg
ICAgICAgIHwgNiArKystLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYve2RuZl80LjIwLjAu
YmIgPT4gZG5mXzQuMjEuMC5iYn0gIHwgMiArLQogOSBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCAxNiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5m
L3tkbmZfNC4yMC4wLmJiID0+IGRuZl80LjIxLjAuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Db3JyZXRseS1pbnN0YWxsLXRtcGZpbGVz
LmQtY29uZmlndXJhdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAw
MDEtQ29ycmV0bHktaW5zdGFsbC10bXBmaWxlcy5kLWNvbmZpZ3VyYXRpb24ucGF0Y2gKaW5kZXgg
ZmQ5NDIyMjhiOS4uM2MxNzI1NjBmZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2RuZi9kbmYvMDAwMS1Db3JyZXRseS1pbnN0YWxsLXRtcGZpbGVzLmQtY29uZmlndXJhdGlvbi5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLUNvcnJldGx5LWlu
c3RhbGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBmNzBlYjMwOGM4MzdmMmM5NDRlMjNiYjY4MGE1MDFhNjA1MDA0ZDY1IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBhMmI0NjYwOGU3ZTZiM2M3MzhiZWM2ZmVmMDI3OTc0YzE4MmY1NGQ3
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDI2IEphbiAyMDE3IDE2OjM2OjIwICswMjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIENvcnJldGx5IGluc3RhbGwgdG1wZmlsZXMuZCBjb25maWd1cmF0
aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLURvLW5v
dC1oYXJkY29kZS1ldGMtYW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lz
dGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCmluZGV4IDM3MzU5YTU3NjUuLjdlM2RiNjFmMWQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhh
cmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lz
dGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzY2E2ZDE0
ZmJjNjQxOWZmNjIzOWI0YmExNmY3N2RhMjBmYjMxZDAzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA2MTAzZDk3ZTBiZTM5MTQ3MTcyZmUxYjE1MTYxNzBjOTkwYWQ5OTQ1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiBEYXRlOiBUaHUsIDI2IEphbiAyMDE3IDE2OjI1OjQ3ICswMjAwCiBTdWJqZWN0
OiBbUEFUQ0hdIERvIG5vdCBoYXJkY29kZSAvZXRjIGFuZCBzeXN0ZW1kIHVuaXQgZGlyZWN0b3Jp
ZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtZG5mLXdy
aXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ru
Zi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2gKaW5kZXggMThm
OWEzMDk0OS4uZmUxNTc1Njc5NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ru
Zi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRv
LXJvb3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA0OWUyODMyMjg0YWI4ODNlMTg1ZDkw
MjBjODgxNTE4YTY4ZTZjMzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE2NTIzYzY4
YjliNTkzNjc5ZmJjY2Q3MjI0MmFkZmM4YjJjYjc5OTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6
IFR1ZSwgMjggQXByIDIwMjAgMTU6NTU6MDAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gZG5mOiB3
cml0ZSB0aGUgbG9nIGxvY2sgdG8gcm9vdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2RuZi9kbmYvMDAwMS1sb2NrLnB5LWZpeC1FeGNlcHRpb24taGFuZGxpbmcucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWxvY2sucHktZml4LUV4Y2VwdGlvbi1o
YW5kbGluZy5wYXRjaAppbmRleCA2YmZmZTlhZjBhLi43MDNiMDZhZWFhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWxvY2sucHktZml4LUV4Y2VwdGlvbi1o
YW5kbGluZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWxv
Y2sucHktZml4LUV4Y2VwdGlvbi1oYW5kbGluZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
Mzg4MTc1N2VhYmZkZTJmZjU0NDAwYWIxMjdiMTA2YWIwODVkODNmMCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZTAyOWYzOTQ4ZWZlYzNkNjNlMjUxZWQyZGM1NmYxNTk3MGNkYWM1MyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxp
QHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDEzIE1hciAyMDI0IDExOjIyOjA1ICswODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIGxvY2sucHk6IGZpeCBFeGNlcHRpb24gaGFuZGxpbmcKQEAgLTU3LDYg
KzU3LDMgQEAgaW5kZXggNjgxN2FhYzkuLjU3MTgwNjJhIDEwMDY0NAogIAogICAgICBkZWYgX19l
eGl0X18oc2VsZiwgKmV4Y19hcmdzKToKICAgICAgICAgIGlmIHNlbGYuY291bnQgPT0gMToKLS0t
IAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAw
MDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9u
X2hlbHBlci5wYXRjaAppbmRleCBmY2Q5NzBhN2FlLi45OTIwNjcwZmJmIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLXNldC1weXRob24tcGF0aC1mb3ItY29t
cGxldGlvbl9oZWxwZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYv
MDAwMS1zZXQtcHl0aG9uLXBhdGgtZm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBmYTMyYzdkY2FiYWEzYzAwZDM2MjBhMzI2NmU0OTYyOTM2NWMwY2JlIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhZmEyOWIyNTJhYzc5YWI4OWU0Y2VkNjZlMjdh
NDA0OTY4Yjc0OWFiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmVyZW15IFB1aGxt
YW4gPGpwdWhsbWFuQG12aXN0YS5jb20+CiBEYXRlOiBXZWQsIDExIE1hciAyMDIwIDIyOjEwOjAy
ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNldCBweXRob24gcGF0aCBmb3IgY29tcGxldGlvbl9o
ZWxwZXIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDUtRG8t
bm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGlyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIu
cGF0Y2gKaW5kZXggY2ZiZGExMWY3Ny4uOTQ3OWRkOWY0OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1s
b2dkaXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1u
b3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGM2ZDAzYjUxZTIwOThmYzY4MWU2ODExNzkwYmQ1ZGM2NTk3MDkxZWIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDUzYWYzNzc5ZTJiY2U3NzFkZGI1ODMxNDgxYTdiNmI2YTc3MDYy
ZjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMTEgSmFuIDIwMTcgMTU6MTA6MTMgKzAy
MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHByZXBlbmQgaW5zdGFsbHJvb3QgdG8gbG9nZGly
LgpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZG5mL2NsaS9jbGkucHkgYi9kbmYvY2xpL2Ns
aS5weQotaW5kZXggMTgyNGJkMDAuLjRkY2IxYzFjIDEwMDY0NAoraW5kZXggYzE0ZjgzNjMuLmJm
YzA3YWI5IDEwMDY0NAogLS0tIGEvZG5mL2NsaS9jbGkucHkKICsrKyBiL2RuZi9jbGkvY2xpLnB5
Ci1AQCAtOTQ0LDcgKzk0NCw3IEBAIGNsYXNzIENsaShvYmplY3QpOgorQEAgLTk1Myw3ICs5NTMs
NyBAQCBjbGFzcyBDbGkob2JqZWN0KToKICAgICAgICAgICAgICBsb2dnZXIud2FybmluZyhfKCJV
bmFibGUgdG8gZGV0ZWN0IHJlbGVhc2UgdmVyc2lvbiAodXNlICctLXJlbGVhc2V2ZXInIHRvIHNw
ZWNpZnkgIgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInJlbGVhc2UgdmVyc2lvbiki
KSkKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMjktRG8t
bm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExf
RElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCmluZGV4IDY0ZWE3ODc0ZDMuLjFlMWMwOTExNTcg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMjktRG8tbm90LXNl
dC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAyOS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJ
Ui1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZDViMTU0ZWE2
OWFmZGNkODYyMjk5YTBiN2YyNTVmNmVjZTM2ODZjNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gMmUzNGI4ODEzYTc5OTMxZWEyNmQ5OTQ0NjMwZmQwYTMxZGQ0YjdlZiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogRGF0ZTogRnJpLCAzMCBEZWMgMjAxNiAxODoyOTowNyArMDIwMAogU3ViamVjdDog
W1BBVENIXSBEbyBub3Qgc2V0IFBZVEhPTl9JTlNUQUxMX0RJUiBieSBydW5uaW5nIHB5dGhvbgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAzMC1SdW4tcHl0aG9u
LXNjcmlwdHMtdXNpbmctZW52LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYv
MDAzMC1SdW4tcHl0aG9uLXNjcmlwdHMtdXNpbmctZW52LnBhdGNoCmluZGV4IGViNDYxMTNmM2Eu
LmQ3NjYyZWIwZGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAw
MzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5nLWVudi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZG5mL2RuZi8wMDMwLVJ1bi1weXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGQzNTU2NzY3Yjg0ZjM2ODc3NDNmZGFkMGE4OGFmMDczOWQ3
MzZlYTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDkzOGZjN2VmMGVhOGJjNTJiYjFk
ZjE0MTlhZDMwNjlmNTg5NzBkOGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVj
IDIwMTYgMTg6Mjk6MzcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gUnVuIHB5dGhvbiBzY3JpcHRz
IHVzaW5nIGVudgpAQCAtMTMsNyArMTMsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2Jpbi9kbmYtYXV0b21hdGlj
LmluIGIvYmluL2RuZi1hdXRvbWF0aWMuaW4KLWluZGV4IDE3ZTM1YTA1Li4yODgyN2UzOCAxMDA3
NTUKK2luZGV4IDFmYjcxMmIwLi5jZThkNGI4ZiAxMDA3NTUKIC0tLSBhL2Jpbi9kbmYtYXV0b21h
dGljLmluCiArKysgYi9iaW4vZG5mLWF1dG9tYXRpYy5pbgogQEAgLTEsNCArMSw0IEBACkBAIC0y
Myw3ICsyMyw3IEBAIGluZGV4IDE3ZTM1YTA1Li4yODgyN2UzOCAxMDA3NTUKICAjCiAgIyBDb3B5
cmlnaHQgKEMpIDIwMTQtMjAxNiBSZWQgSGF0LCBJbmMuCiBkaWZmIC0tZ2l0IGEvYmluL2RuZi5p
biBiL2Jpbi9kbmYuaW4KLWluZGV4IDU1Y2ViM2YyLi5lMzg5NzNjNyAxMDA3NTUKK2luZGV4IDEw
NzE2ZGVjLi44MTdkN2RhNSAxMDA3NTUKIC0tLSBhL2Jpbi9kbmYuaW4KICsrKyBiL2Jpbi9kbmYu
aW4KIEBAIC0xLDQgKzEsNCBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ru
Zi9kbmZfNC4yMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4yMS4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9k
bmYvZG5mXzQuMjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZf
NC4yMS4wLmJiCmluZGV4IDQ3NTczNDZjYmYuLjY2ZDE1YmNhNzcgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZG5mL2RuZl80LjIxLjAuYmIKQEAgLTIwLDcgKzIwLDcgQEAgU1JDX1VSSSA9ICJnaXQ6
Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2RuZi5naXQ7YnJhbmNoPW1hc3Rl
cjtwcm90b2MKIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gImZpbGU6Ly8wMDAxLWRu
Zi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCIKIAotU1JDUkVWID0gImUzY2I0Mzhj
MGZkMDhjNzk2NzZjMGYzMjc2YWE3ZDc1Y2Q4NTU3YzYiCitTUkNSRVYgPSAiZDI5ZGZhMDYzNDIz
NWQ3YWQ5NTdjNDc0NmE3NDllYjFlNGE4NWE4OCIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VY
ID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKLS0gCjIu
NDQuMAoK

--===============1545324970372746148==--

