Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61291CD13D5
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:33 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.44641.1711994601439091017
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A/4croKe;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=niVku8Pg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018e9ad47d1e-98a2ec2b-997c-4c77-aa8c-333b9f337680-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7YkB12BLe8TklXO2sIlsMhnPVwO4IxjXpOkyzE7Me+w=;
	b=A/4croKeWQInJwPlKna7CPRRzxtK22BjwbLvF5u0cusfZx7H61mviLOvaW6sD8+u
	JeZOKy8SYezgOC8onYRdGUHzSvOmaTqS29hXx0CEzPiHQl8lJM9mK1D9KoaqJ1eaaQC
	b13ZWkMMOL6Rg9l6fgdOllIutQnSMqrwpWZHOP9o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994600;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7YkB12BLe8TklXO2sIlsMhnPVwO4IxjXpOkyzE7Me+w=;
	b=niVku8PgqNidBLCrYRZp74o2CfmdqU/gYMFs04USNx38xCy9mKhDqXiZVEjWP5v5
	ioyTaHmZGemGBoDKn+oTGc/iF6o+EwFGeFIDedNzzMsYnhLFet1J4QZEMU29fbuaS5U
	HWm2+KeiKM3MkLeoxR7suL/n9FXiyYrVeVC1b9AM=
Content-Type: multipart/mixed; boundary="===============9220029247083150770=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.19.2 SUCCEEDED
Message-ID: <0101018e9ad47d1e-98a2ec2b-997c-4c77-aa8c-333b9f337680-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:20 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197708

--===============9220029247083150770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.19.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.19.0-4.19.2.patch
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
From ef44988a291e32b561cd168d2229c5e8fe837b8d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 07:00:12 +0000
Subject: [PATCH] dnf: upgrade 4.19.0 -> 4.19.2

---
 .../dnf/0001-Corretly-install-tmpfiles.d-configuration.patch | 2 +-
 ...01-Do-not-hardcode-etc-and-systemd-unit-directories.patch | 2 +-
 .../dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch        | 2 +-
 .../dnf/dnf/0001-lock.py-fix-Exception-handling.patch        | 5 +----
 .../dnf/dnf/0001-set-python-path-for-completion_helper.patch | 2 +-
 .../dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch  | 2 +-
 ...029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 2 +-
 .../dnf/dnf/0030-Run-python-scripts-using-env.patch          | 2 +-
 meta/recipes-devtools/dnf/{dnf_4.19.0.bb => dnf_4.19.2.bb}   | 2 +-
 9 files changed, 9 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.19.0.bb => dnf_4.19.2.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
index fd942228b9..8ec3629257 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,4 +1,4 @@
-From f70eb308c837f2c944e23bb680a501a605004d65 Mon Sep 17 00:00:00 2001
+From 9c09e372662f97b2166273cd4dd8a27190d68268 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:36:20 +0200
 Subject: [PATCH] Corretly install tmpfiles.d configuration
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index 37359a5765..db05b6f7b9 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,4 +1,4 @@
-From 3ca6d14fbc6419ff6239b4ba16f77da20fb31d03 Mon Sep 17 00:00:00 2001
+From 17762b57b94e405125784dd93c08a74d6a628d5a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
 Subject: [PATCH] Do not hardcode /etc and systemd unit directories
diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index 18f9a30949..c4b20a849d 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 049e2832284ab883e185d9020c881518a68e6c38 Mon Sep 17 00:00:00 2001
+From 98b9588f9811bfaa227d362a1ba534ae0906a189 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
diff --git a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
index 6bffe9af0a..0dc600af0a 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
@@ -1,4 +1,4 @@
-From 3881757eabfde2ff54400ab127b106ab085d83f0 Mon Sep 17 00:00:00 2001
+From 58705c5c41ea4d91771eb0b653a53b86b8ec92c0 Mon Sep 17 00:00:00 2001
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
index fcd970a7ae..81c9d89809 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -1,4 +1,4 @@
-From fa32c7dcabaa3c00d3620a3266e49629365c0cbe Mon Sep 17 00:00:00 2001
+From 38c8df0d0fb13207d215d0273187b57635bf80ff Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 22:10:02 +0000
 Subject: [PATCH] set python path for completion_helper
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index cfbda11f77..9aaed3e41e 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,4 +1,4 @@
-From c6d03b51e2098fc681e6811790bd5dc6597091eb Mon Sep 17 00:00:00 2001
+From 096550399649a0fe0f65b922fa602fbf32a98b2e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
 Subject: [PATCH] Do not prepend installroot to logdir.
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 64ea7874d3..d46bf81891 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From d5b154ea69afdcd862299a0b7f255f6ece3686c6 Mon Sep 17 00:00:00 2001
+From aed5392a91b82652927e4da1d9dd6e670c6d4d97 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index eb46113f3a..009d65f39b 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,4 +1,4 @@
-From d3556767b84f3687743fdad0a88af0739d736ea9 Mon Sep 17 00:00:00 2001
+From 2af81eee8379666a0044761408d395415cd5b5aa Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:37 +0200
 Subject: [PATCH] Run python scripts using env
diff --git a/meta/recipes-devtools/dnf/dnf_4.19.0.bb b/meta/recipes-devtools/dnf/dnf_4.19.2.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.19.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.19.2.bb
index 184dbea963..cc91dbe400 100644
--- a/meta/recipes-devtools/dnf/dnf_4.19.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.19.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "566a61f9d8a2830ac6dcc3a94c59224cef1c3d03"
+SRCREV = "9b2b2e8ddab99caba4bc8059cab4263163172e81"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.42.0


--===============9220029247083150770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/dnf/dnf-bash-completion: FILELIST: removed "/usr/share/bash-completion/completions/dnf", added "/usr/share/bash-completion/completions/dnf-3"
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.12/site-packages/dnf-4.19.0.dist-info moved to /usr/lib/python3.12/site-packages/dnf-4.19.2.dist-info

--===============9220029247083150770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dnf/dnf-bash-completion: PKGSIZE changed from 11226 to 11376 (+1%)
packages/core2-64-poky-linux/dnf/dnf-bash-completion: FILELIST: removed "/usr/share/bash-completion/completions/dnf", added "/usr/share/bash-completion/completions/dnf-3"
packages/core2-64-poky-linux/dnf/dnf-bash-completion: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-dbg: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-dbg: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-dev: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-dev: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-doc: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-doc: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-be: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-be: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-da: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-de: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-el: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-es: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-he: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-id: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-it: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-om: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-om: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-or: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-si: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-th: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-src: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-src: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-staticdev: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-test-dep: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf-test-main: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf-test-main: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf/dnf: PKGSIZE changed from 960498 to 960925 (+0%)
packages/core2-64-poky-linux/dnf/dnf: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf/dnf: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/dnf: PV changed from "4.19.0" to "4.19.2"
packages/core2-64-poky-linux/dnf: PKGV changed from 4.19.0 [default] to 4.19.2 [default]
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.12/site-packages/dnf-4.19.0.dist-info moved to /usr/lib/python3.12/site-packages/dnf-4.19.2.dist-info

--===============9220029247083150770==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.19.0-4.19.2.patch"

RnJvbSBlZjQ0OTg4YTI5MWUzMmI1NjFjZDE2OGQyMjI5YzVlOGZlODM3YjhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwNzowMDoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRu
ZjogdXBncmFkZSA0LjE5LjAgLT4gNC4xOS4yCgotLS0KIC4uLi9kbmYvMDAwMS1Db3JyZXRseS1p
bnN0YWxsLXRtcGZpbGVzLmQtY29uZmlndXJhdGlvbi5wYXRjaCB8IDIgKy0KIC4uLjAxLURvLW5v
dC1oYXJkY29kZS1ldGMtYW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaCB8IDIgKy0K
IC4uLi9kbmYvZG5mLzAwMDEtZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoICAg
ICAgICB8IDIgKy0KIC4uLi9kbmYvZG5mLzAwMDEtbG9jay5weS1maXgtRXhjZXB0aW9uLWhhbmRs
aW5nLnBhdGNoICAgICAgICB8IDUgKy0tLS0KIC4uLi9kbmYvZG5mLzAwMDEtc2V0LXB5dGhvbi1w
YXRoLWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRjaCB8IDIgKy0KIC4uLi9kbmYvZG5mLzAwMDUt
RG8tbm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGlyLnBhdGNoICB8IDIgKy0KIC4uLjAy
OS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaCB8
IDIgKy0KIC4uLi9kbmYvZG5mLzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5nLWVudi5wYXRj
aCAgICAgICAgICB8IDIgKy0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYve2RuZl80LjE5LjAu
YmIgPT4gZG5mXzQuMTkuMi5iYn0gICB8IDIgKy0KIDkgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRp
b25zKCspLCAxMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5m
L3tkbmZfNC4xOS4wLmJiID0+IGRuZl80LjE5LjIuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Db3JyZXRseS1pbnN0YWxsLXRtcGZpbGVz
LmQtY29uZmlndXJhdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAw
MDEtQ29ycmV0bHktaW5zdGFsbC10bXBmaWxlcy5kLWNvbmZpZ3VyYXRpb24ucGF0Y2gKaW5kZXgg
ZmQ5NDIyMjhiOS4uOGVjMzYyOTI1NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2RuZi9kbmYvMDAwMS1Db3JyZXRseS1pbnN0YWxsLXRtcGZpbGVzLmQtY29uZmlndXJhdGlvbi5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLUNvcnJldGx5LWlu
c3RhbGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBmNzBlYjMwOGM4MzdmMmM5NDRlMjNiYjY4MGE1MDFhNjA1MDA0ZDY1IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA5YzA5ZTM3MjY2MmY5N2IyMTY2MjczY2Q0ZGQ4YTI3MTkwZDY4MjY4
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgu
a2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDI2IEphbiAyMDE3IDE2OjM2OjIwICswMjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIENvcnJldGx5IGluc3RhbGwgdG1wZmlsZXMuZCBjb25maWd1cmF0
aW9uCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLURvLW5v
dC1oYXJkY29kZS1ldGMtYW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lz
dGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCmluZGV4IDM3MzU5YTU3NjUuLmRiMDViNmY3Yjkg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhh
cmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lz
dGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzY2E2ZDE0
ZmJjNjQxOWZmNjIzOWI0YmExNmY3N2RhMjBmYjMxZDAzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAxNzc2MmI1N2I5NGU0MDUxMjU3ODRkZDkzYzA4YTc0ZDZhNjI4ZDVhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiBEYXRlOiBUaHUsIDI2IEphbiAyMDE3IDE2OjI1OjQ3ICswMjAwCiBTdWJqZWN0
OiBbUEFUQ0hdIERvIG5vdCBoYXJkY29kZSAvZXRjIGFuZCBzeXN0ZW1kIHVuaXQgZGlyZWN0b3Jp
ZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtZG5mLXdy
aXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ru
Zi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2gKaW5kZXggMThm
OWEzMDk0OS4uYzRiMjBhODQ5ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Ru
Zi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRv
LXJvb3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA0OWUyODMyMjg0YWI4ODNlMTg1ZDkw
MjBjODgxNTE4YTY4ZTZjMzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDk4Yjk1ODhm
OTgxMWJmYWEyMjdkMzYyYTFiYTUzNGFlMDkwNmExODkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6
IFR1ZSwgMjggQXByIDIwMjAgMTU6NTU6MDAgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gZG5mOiB3
cml0ZSB0aGUgbG9nIGxvY2sgdG8gcm9vdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2RuZi9kbmYvMDAwMS1sb2NrLnB5LWZpeC1FeGNlcHRpb24taGFuZGxpbmcucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWxvY2sucHktZml4LUV4Y2VwdGlvbi1o
YW5kbGluZy5wYXRjaAppbmRleCA2YmZmZTlhZjBhLi4wZGM2MDBhZjBhIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWxvY2sucHktZml4LUV4Y2VwdGlvbi1o
YW5kbGluZy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWxv
Y2sucHktZml4LUV4Y2VwdGlvbi1oYW5kbGluZy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
Mzg4MTc1N2VhYmZkZTJmZjU0NDAwYWIxMjdiMTA2YWIwODVkODNmMCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gNTg3MDVjNWM0MWVhNGQ5MTc3MWViMGI2NTNhNTNiODZiOGVjOTJjMCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoYW5ncWluZyBMaSA8Y2hhbmdxaW5nLmxp
QHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDEzIE1hciAyMDI0IDExOjIyOjA1ICswODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIGxvY2sucHk6IGZpeCBFeGNlcHRpb24gaGFuZGxpbmcKQEAgLTU3LDYg
KzU3LDMgQEAgaW5kZXggNjgxN2FhYzkuLjU3MTgwNjJhIDEwMDY0NAogIAogICAgICBkZWYgX19l
eGl0X18oc2VsZiwgKmV4Y19hcmdzKToKICAgICAgICAgIGlmIHNlbGYuY291bnQgPT0gMToKLS0t
IAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAw
MDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9u
X2hlbHBlci5wYXRjaAppbmRleCBmY2Q5NzBhN2FlLi44MWM5ZDg5ODA5IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLXNldC1weXRob24tcGF0aC1mb3ItY29t
cGxldGlvbl9oZWxwZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYv
MDAwMS1zZXQtcHl0aG9uLXBhdGgtZm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBmYTMyYzdkY2FiYWEzYzAwZDM2MjBhMzI2NmU0OTYyOTM2NWMwY2JlIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzOGM4ZGYwZDBmYjEzMjA3ZDIxNWQwMjczMTg3
YjU3NjM1YmY4MGZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmVyZW15IFB1aGxt
YW4gPGpwdWhsbWFuQG12aXN0YS5jb20+CiBEYXRlOiBXZWQsIDExIE1hciAyMDIwIDIyOjEwOjAy
ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNldCBweXRob24gcGF0aCBmb3IgY29tcGxldGlvbl9o
ZWxwZXIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDUtRG8t
bm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGlyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIu
cGF0Y2gKaW5kZXggY2ZiZGExMWY3Ny4uOWFhZWQzZTQxZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1s
b2dkaXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1u
b3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGM2ZDAzYjUxZTIwOThmYzY4MWU2ODExNzkwYmQ1ZGM2NTk3MDkxZWIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDA5NjU1MDM5OTY0OWEwZmUwZjY1YjkyMmZhNjAyZmJmMzJhOThi
MmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMTEgSmFuIDIwMTcgMTU6MTA6MTMgKzAy
MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHByZXBlbmQgaW5zdGFsbHJvb3QgdG8gbG9nZGly
LgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAyOS1Eby1ub3Qt
c2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMjktRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVIt
YnktcnVubmluZy1weXRob24ucGF0Y2gKaW5kZXggNjRlYTc4NzRkMy4uZDQ2YmY4MTg5MSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAyOS1Eby1ub3Qtc2V0LVBZ
VEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5
LXJ1bm5pbmctcHl0aG9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkNWIxNTRlYTY5YWZk
Y2Q4NjIyOTlhMGI3ZjI1NWY2ZWNlMzY4NmM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBhZWQ1MzkyYTkxYjgyNjUyOTI3ZTRkYTFkOWRkNmU2NzBjNmQ0ZDk3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBGcmksIDMwIERlYyAyMDE2IDE4OjI5OjA3ICswMjAwCiBTdWJqZWN0OiBbUEFU
Q0hdIERvIG5vdCBzZXQgUFlUSE9OX0lOU1RBTExfRElSIGJ5IHJ1bm5pbmcgcHl0aG9uCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDMwLVJ1bi1weXRob24tc2Ny
aXB0cy11c2luZy1lbnYucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDMw
LVJ1bi1weXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2gKaW5kZXggZWI0NjExM2YzYS4uMDA5
ZDY1ZjM5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAzMC1S
dW4tcHl0aG9uLXNjcmlwdHMtdXNpbmctZW52LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9kbmYvZG5mLzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5nLWVudi5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gZDM1NTY3NjdiODRmMzY4Nzc0M2ZkYWQwYTg4YWYwNzM5ZDczNmVh
OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmFmODFlZWU4Mzc5NjY2YTAwNDQ3NjE0
MDhkMzk1NDE1Y2Q1YjVhYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAzMCBEZWMgMjAx
NiAxODoyOTozNyArMDIwMAogU3ViamVjdDogW1BBVENIXSBSdW4gcHl0aG9uIHNjcmlwdHMgdXNp
bmcgZW52CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjE5LjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjE5LjIuYmIKc2ltaWxhcml0eSBp
bmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xOS4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjE5LjIuYmIKaW5k
ZXggMTg0ZGJlYTk2My4uY2M5MWRiZTQwMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2RuZi9kbmZfNC4xOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5m
XzQuMTkuMi5iYgpAQCAtMjAsNyArMjAsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
cnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvZG5mLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvYwogCiBT
UkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiZmlsZTovLzAwMDEtZG5mLXdyaXRlLXRoZS1s
b2ctbG9jay10by1yb290LnBhdGNoIgogCi1TUkNSRVYgPSAiNTY2YTYxZjlkOGEyODMwYWM2ZGNj
M2E5NGM1OTIyNGNlZjFjM2QwMyIKK1NSQ1JFViA9ICI5YjJiMmU4ZGRhYjk5Y2FiYTRiYzgwNTlj
YWI0MjYzMTYzMTcyZTgxIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiKD9QPHB2ZXI+
XGQrKFwuXGQrKSspIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAKMi40Mi4wCgo=

--===============9220029247083150770==--

