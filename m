Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073DCC54EEC
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:40 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.20158.1708018344559275301
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PH3VKr84;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=U1qEAAtw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018dadd39f68-f32b0b54-4bf9-4ea1-94ba-69e910491e93-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wMNBKVyLzOylcrNb+kxsYDHSoOtne7DQzUoLnGEakxM=;
	b=PH3VKr84LV1ALb6GSjwbSf64P1sX9tCK5Ax3h6okvqBHCbZOM0CZ080sfe/Yiqdb
	u/HRZ0RVCx1nK2yzvv0oZyoJLmdQwAOnAgg8iXSBZUKc2QqB17COUacwBHfThVOZ3DS
	Rbkaaa+PBa+IHLVvohSNbRcDkScZYovHMxKWTJ88=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wMNBKVyLzOylcrNb+kxsYDHSoOtne7DQzUoLnGEakxM=;
	b=U1qEAAtw04HK18Qe+faz7zM9GC3x/VjZkC5/+hFIFoZstNtNdvdrRRUdedKZf7Ug
	bVK+27hb/G2jkgA/54TSGz42/2yJEqDlNDeFduHePvuylBnb0BBd8tAcrzZCdb6w3h8
	wwGAdJh/MovPdhJVVPcOjx26h7NFbeF5WeWgKe6Q=
Content-Type: multipart/mixed; boundary="===============7616924847540055009=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.19.0 SUCCEEDED
Message-ID: <0101018dadd39f68-f32b0b54-4bf9-4ea1-94ba-69e910491e93-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195572

--===============7616924847540055009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.18.2-4.19.0.patch
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
From f5ebc905917919aec0560ef533e410eb5c5b528e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 06:58:37 +0000
Subject: [PATCH] dnf: upgrade 4.18.2 -> 4.19.0

---
 ...01-Corretly-install-tmpfiles.d-configuration.patch |  7 ++-----
 ...ot-hardcode-etc-and-systemd-unit-directories.patch |  4 ++--
 .../dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch |  2 +-
 .../0001-set-python-path-for-completion_helper.patch  |  8 +++-----
 .../0005-Do-not-prepend-installroot-to-logdir.patch   | 10 ++++------
 ...not-set-PYTHON_INSTALL_DIR-by-running-python.patch |  2 +-
 .../dnf/dnf/0030-Run-python-scripts-using-env.patch   | 11 ++++-------
 .../dnf/{dnf_4.18.2.bb => dnf_4.19.0.bb}              |  2 +-
 8 files changed, 18 insertions(+), 28 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.18.2.bb => dnf_4.19.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
index 6692b41a16..e2185fab4a 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,7 +1,7 @@
-From 05e059cd4e9910c00b32d377f4f98e3c8dde6bc6 Mon Sep 17 00:00:00 2001
+From 4aaddad69af40f46d99f643b8c31fe8c743553ed Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:36:20 +0200
-Subject: [PATCH 4/5] Corretly install tmpfiles.d configuration
+Subject: [PATCH] Corretly install tmpfiles.d configuration
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -17,6 +17,3 @@ index f69c773e..3eb6d0e8 100644
 @@ -1 +1 @@
 -INSTALL (FILES dnf.conf DESTINATION /usr/lib/tmpfiles.d/)
 +INSTALL (FILES dnf.conf DESTINATION ${SYSCONFDIR}/tmpfiles.d/)
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
index cb09f17a56..32fa62d4f7 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,4 +1,4 @@
-From ffb7942cc73c3d2c6aa7c689cdaf9bc0bcbc144b Mon Sep 17 00:00:00 2001
+From fb22fbbc78a61e23a9f248eeb4bc7eedbe492676 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 26 Jan 2017 16:25:47 +0200
 Subject: [PATCH] Do not hardcode /etc and systemd unit directories
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 73552967..38cf4fbf 100644
+index 4aee99fb..9e2e9e9e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -3,8 +3,8 @@ CMAKE_MINIMUM_REQUIRED (VERSION 2.4)
diff --git a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
index eb0309d81a..8539c185df 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 3bd0faf58cc9ad531e6b63d5660c4b8316e8daed Mon Sep 17 00:00:00 2001
+From 3a0901359983cf60f5e27b2d0b0989ad173e348b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
diff --git a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
index 448f6408bc..85c6d68af5 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -1,16 +1,17 @@
-From 7e79b3b67fd5cecd7380e7e365fd88eca63b5bfa Mon Sep 17 00:00:00 2001
+From 3eb36c1a59970b779d076b17aa72211dac1844da Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 22:10:02 +0000
 Subject: [PATCH] set python path for completion_helper
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+
 ---
  dnf/cli/completion_helper.py.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/completion_helper.py.in b/dnf/cli/completion_helper.py.in
-index 351226759..2835cd3b6 100644
+index 0da0f2a2..9330d15b 100644
 --- a/dnf/cli/completion_helper.py.in
 +++ b/dnf/cli/completion_helper.py.in
 @@ -1,4 +1,4 @@
@@ -19,6 +20,3 @@ index 351226759..2835cd3b6 100644
  #
  # This file is part of dnf.
  #
--- 
-2.23.0
-
diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index 0e11c2eac2..0884789982 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,7 +1,7 @@
-From 6365389074a1b86962f3d8b22a2ead2202026a98 Mon Sep 17 00:00:00 2001
+From ca4d813ffac70039cbea59290fab2f15176d85ca Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
-Subject: [PATCH 5/5] Do not prepend installroot to logdir.
+Subject: [PATCH] Do not prepend installroot to logdir.
 
 This would otherwise write the logs into rootfs/var/log
 (whereas we want them in $T),
@@ -9,12 +9,13 @@ and will break installation of base-files rpm.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  dnf/cli/cli.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
-index d2d9c082..82270ecf 100644
+index 1824bd00..4dcb1c1c 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
 @@ -944,7 +944,7 @@ class Cli(object):
@@ -26,6 +27,3 @@ index d2d9c082..82270ecf 100644
              conf.prepend_installroot(opt)
  
          self.base._logging._setup_from_dnf_conf(conf)
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 5cffc9dce1..dc7714d2a2 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From ceb1043c4f3de095e36908232320b74a4128a94e Mon Sep 17 00:00:00 2001
+From 54421f5a2ce3af8b6a1fc2f27cab2359273d9768 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index eedbb5723f..5b2ba7493a 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,7 +1,7 @@
-From 8d97b72a1d77149e2f9048d1ca6cef66da1a8aa5 Mon Sep 17 00:00:00 2001
+From e1698e0553364de95d7f838e61ff8715a0a8ad95 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:37 +0200
-Subject: [PATCH 2/5] Run python scripts using env
+Subject: [PATCH] Run python scripts using env
 
 Otherwise the build tools hardcode the python path into them.
 
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/bin/dnf-automatic.in b/bin/dnf-automatic.in
-index 5b06aa26..891b4c24 100755
+index 17e35a05..28827e38 100755
 --- a/bin/dnf-automatic.in
 +++ b/bin/dnf-automatic.in
 @@ -1,4 +1,4 @@
@@ -24,7 +24,7 @@ index 5b06aa26..891b4c24 100755
  #
  # Copyright (C) 2014-2016 Red Hat, Inc.
 diff --git a/bin/dnf.in b/bin/dnf.in
-index 645d0f06..bdf7b3c4 100755
+index 55ceb3f2..e38973c7 100755
 --- a/bin/dnf.in
 +++ b/bin/dnf.in
 @@ -1,4 +1,4 @@
@@ -33,6 +33,3 @@ index 645d0f06..bdf7b3c4 100755
  # The dnf executable script.
  #
  # Copyright (C) 2012-2016 Red Hat, Inc.
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/dnf/dnf_4.18.2.bb b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.18.2.bb
rename to meta/recipes-devtools/dnf/dnf_4.19.0.bb
index dc0c18be5e..784d7a94b3 100644
--- a/meta/recipes-devtools/dnf/dnf_4.18.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "1c43d0999178d492381ad0b43917ffd9c74016f8"
+SRCREV = "566a61f9d8a2830ac6dcc3a94c59224cef1c3d03"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.42.0


--===============7616924847540055009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-bash-completion: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-dbg: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dbg: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-dev: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-dev: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-doc: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-doc: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-be: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-be: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-da: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-de: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-el: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-es: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-he: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-id: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-it: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-om: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-om: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-or: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-si: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-th: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-src: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-src: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-staticdev: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-dep: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf-test-main: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf-test-main: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf/dnf: PV changed from "4.18.2" to "4.19.0"
packages/core2-64-poky-linux/dnf/dnf: PKGSIZE changed from 958861 to 960292 (+0%)
packages/core2-64-poky-linux/dnf: PKGV changed from 4.18.2 [default] to 4.19.0 [default]
packages/core2-64-poky-linux/dnf: PV changed from "4.18.2" to "4.19.0"
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.12/site-packages/dnf-4.18.2.dist-info moved to /usr/lib/python3.12/site-packages/dnf-4.19.0.dist-info

--===============7616924847540055009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.12/site-packages/dnf-4.18.2.dist-info moved to /usr/lib/python3.12/site-packages/dnf-4.19.0.dist-info

--===============7616924847540055009==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.18.2-4.19.0.patch"

RnJvbSBmNWViYzkwNTkxNzkxOWFlYzA1NjBlZjUzM2U0MTBlYjVjNWI1MjhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDY6NTg6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
bmY6IHVwZ3JhZGUgNC4xOC4yIC0+IDQuMTkuMAoKLS0tCiAuLi4wMS1Db3JyZXRseS1pbnN0YWxs
LXRtcGZpbGVzLmQtY29uZmlndXJhdGlvbi5wYXRjaCB8ICA3ICsrLS0tLS0KIC4uLm90LWhhcmRj
b2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoIHwgIDQgKystLQogLi4u
L2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2ggfCAgMiAr
LQogLi4uLzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRjaCAg
fCAgOCArKystLS0tLQogLi4uLzAwMDUtRG8tbm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9n
ZGlyLnBhdGNoICAgfCAxMCArKysrLS0tLS0tCiAuLi5ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJ
Ui1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaCB8ICAyICstCiAuLi4vZG5mL2RuZi8wMDMwLVJ1bi1w
eXRob24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2ggICB8IDExICsrKystLS0tLS0tCiAuLi4vZG5m
L3tkbmZfNC4xOC4yLmJiID0+IGRuZl80LjE5LjAuYmJ9ICAgICAgICAgICAgICB8ICAyICstCiA4
IGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYve2RuZl80LjE4LjIuYmIgPT4gZG5mXzQuMTkuMC5i
Yn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAx
LUNvcnJldGx5LWluc3RhbGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Db3JyZXRseS1pbnN0YWxsLXRtcGZpbGVzLmQt
Y29uZmlndXJhdGlvbi5wYXRjaAppbmRleCA2NjkyYjQxYTE2Li5lMjE4NWZhYjRhIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLUNvcnJldGx5LWluc3RhbGwt
dG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kbmYvZG5mLzAwMDEtQ29ycmV0bHktaW5zdGFsbC10bXBmaWxlcy5kLWNvbmZpZ3VyYXRpb24u
cGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDA1ZTA1OWNkNGU5OTEwYzAwYjMyZDM3N2Y0Zjk4
ZTNjOGRkZTZiYzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDRhYWRkYWQ2OWFmNDBm
NDZkOTlmNjQzYjhjMzFmZThjNzQzNTUzZWQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwg
MjYgSmFuIDIwMTcgMTY6MzY6MjAgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSCA0LzVdIENvcnJldGx5
IGluc3RhbGwgdG1wZmlsZXMuZCBjb25maWd1cmF0aW9uCitTdWJqZWN0OiBbUEFUQ0hdIENvcnJl
dGx5IGluc3RhbGwgdG1wZmlsZXMuZCBjb25maWd1cmF0aW9uCiAKIFVwc3RyZWFtLVN0YXR1czog
SW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgpAQCAtMTcsNiArMTcsMyBAQCBpbmRl
eCBmNjljNzczZS4uM2ViNmQwZTggMTAwNjQ0CiBAQCAtMSArMSBAQAogLUlOU1RBTEwgKEZJTEVT
IGRuZi5jb25mIERFU1RJTkFUSU9OIC91c3IvbGliL3RtcGZpbGVzLmQvKQogK0lOU1RBTEwgKEZJ
TEVTIGRuZi5jb25mIERFU1RJTkFUSU9OICR7U1lTQ09ORkRJUn0vdG1wZmlsZXMuZC8pCi0tLSAK
LTIuMTQuMgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAx
LURvLW5vdC1oYXJkY29kZS1ldGMtYW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1h
bmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCmluZGV4IGNiMDlmMTdhNTYuLjMyZmE2
MmQ0ZjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8t
bm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1h
bmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBm
ZmI3OTQyY2M3M2MzZDJjNmFhN2M2ODljZGFmOWJjMGJjYmMxNDRiIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBmYjIyZmJiYzc4YTYxZTIzYTlmMjQ4ZWViNGJjN2VlZGJlNDkyNjc2IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDI2IEphbiAyMDE3IDE2OjI1OjQ3ICswMjAwCiBT
dWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBoYXJkY29kZSAvZXRjIGFuZCBzeXN0ZW1kIHVuaXQgZGly
ZWN0b3JpZXMKQEAgLTExLDcgKzExLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01h
a2VMaXN0cy50eHQKLWluZGV4IDczNTUyOTY3Li4zOGNmNGZiZiAxMDA2NDQKK2luZGV4IDRhZWU5
OWZiLi45ZTJlOWU5ZSAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxp
c3RzLnR4dAogQEAgLTMsOCArMyw4IEBAIENNQUtFX01JTklNVU1fUkVRVUlSRUQgKFZFUlNJT04g
Mi40KQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1kbmYt
d3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaAppbmRleCBl
YjAzMDlkODFhLi44NTM5YzE4NWRmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2st
dG8tcm9vdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2JkMGZhZjU4Y2M5YWQ1MzFlNmI2
M2Q1NjYwYzRiODMxNmU4ZGFlZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gM2EwOTAx
MzU5OTgzY2Y2MGY1ZTI3YjJkMGIwOTg5YWQxNzNlMzQ4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0
ZTogVHVlLCAyOCBBcHIgMjAyMCAxNTo1NTowMCArMDIwMAogU3ViamVjdDogW1BBVENIXSBkbmY6
IHdyaXRlIHRoZSBsb2cgbG9jayB0byByb290CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZG5mL2RuZi8wMDAxLXNldC1weXRob24tcGF0aC1mb3ItY29tcGxldGlvbl9oZWxwZXIu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLXNldC1weXRob24tcGF0
aC1mb3ItY29tcGxldGlvbl9oZWxwZXIucGF0Y2gKaW5kZXggNDQ4ZjY0MDhiYy4uODVjNmQ2OGFm
NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1zZXQtcHl0
aG9uLXBhdGgtZm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kbmYvZG5mLzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9uX2hlbHBl
ci5wYXRjaApAQCAtMSwxNiArMSwxNyBAQAotRnJvbSA3ZTc5YjNiNjdmZDVjZWNkNzM4MGU3ZTM2
NWZkODhlY2E2M2I1YmZhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzZWIzNmMxYTU5
OTcwYjc3OWQwNzZiMTdhYTcyMjExZGFjMTg0NGRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogSmVyZW15IFB1aGxtYW4gPGpwdWhsbWFuQG12aXN0YS5jb20+CiBEYXRlOiBXZWQsIDEx
IE1hciAyMDIwIDIyOjEwOjAyICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNldCBweXRob24gcGF0
aCBmb3IgY29tcGxldGlvbl9oZWxwZXIKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRl
IFtvZS1jb3JlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogSmVyZW15IFB1aGxtYW4gPGpwdWhs
bWFuQG12aXN0YS5jb20+CisKIC0tLQogIGRuZi9jbGkvY29tcGxldGlvbl9oZWxwZXIucHkuaW4g
fCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9kbmYvY2xpL2NvbXBsZXRpb25faGVscGVyLnB5LmluIGIvZG5mL2NsaS9j
b21wbGV0aW9uX2hlbHBlci5weS5pbgotaW5kZXggMzUxMjI2NzU5Li4yODM1Y2QzYjYgMTAwNjQ0
CitpbmRleCAwZGEwZjJhMi4uOTMzMGQxNWIgMTAwNjQ0CiAtLS0gYS9kbmYvY2xpL2NvbXBsZXRp
b25faGVscGVyLnB5LmluCiArKysgYi9kbmYvY2xpL2NvbXBsZXRpb25faGVscGVyLnB5LmluCiBA
QCAtMSw0ICsxLDQgQEAKQEAgLTE5LDYgKzIwLDMgQEAgaW5kZXggMzUxMjI2NzU5Li4yODM1Y2Qz
YjYgMTAwNjQ0CiAgIwogICMgVGhpcyBmaWxlIGlzIHBhcnQgb2YgZG5mLgogICMKLS0tIAotMi4y
My4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDUtRG8t
bm90LXByZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGlyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIu
cGF0Y2gKaW5kZXggMGUxMWMyZWFjMi4uMDg4NDc4OTk4MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1s
b2dkaXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1u
b3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1G
cm9tIDYzNjUzODkwNzRhMWI4Njk2MmYzZDhiMjJhMmVhZDIyMDIwMjZhOTggTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGNhNGQ4MTNmZmFjNzAwMzljYmVhNTkyOTBmYWIyZjE1MTc2ZDg1
Y2EgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMTEgSmFuIDIwMTcgMTU6MTA6MTMgKzAy
MDAKLVN1YmplY3Q6IFtQQVRDSCA1LzVdIERvIG5vdCBwcmVwZW5kIGluc3RhbGxyb290IHRvIGxv
Z2Rpci4KK1N1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHByZXBlbmQgaW5zdGFsbHJvb3QgdG8gbG9n
ZGlyLgogCiBUaGlzIHdvdWxkIG90aGVyd2lzZSB3cml0ZSB0aGUgbG9ncyBpbnRvIHJvb3Rmcy92
YXIvbG9nCiAod2hlcmVhcyB3ZSB3YW50IHRoZW0gaW4gJFQpLApAQCAtOSwxMiArOSwxMyBAQCBh
bmQgd2lsbCBicmVhayBpbnN0YWxsYXRpb24gb2YgYmFzZS1maWxlcyBycG0uCiAKIFVwc3RyZWFt
LVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgorCiAtLS0KICBkbmYv
Y2xpL2NsaS5weSB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2RuZi9jbGkvY2xpLnB5IGIvZG5mL2NsaS9jbGkucHkK
LWluZGV4IGQyZDljMDgyLi44MjI3MGVjZiAxMDA2NDQKK2luZGV4IDE4MjRiZDAwLi40ZGNiMWMx
YyAxMDA2NDQKIC0tLSBhL2RuZi9jbGkvY2xpLnB5CiArKysgYi9kbmYvY2xpL2NsaS5weQogQEAg
LTk0NCw3ICs5NDQsNyBAQCBjbGFzcyBDbGkob2JqZWN0KToKQEAgLTI2LDYgKzI3LDMgQEAgaW5k
ZXggZDJkOWMwODIuLjgyMjcwZWNmIDEwMDY0NAogICAgICAgICAgICAgIGNvbmYucHJlcGVuZF9p
bnN0YWxscm9vdChvcHQpCiAgCiAgICAgICAgICBzZWxmLmJhc2UuX2xvZ2dpbmcuX3NldHVwX2Zy
b21fZG5mX2NvbmYoY29uZikKLS0tIAotMi4xNC4yCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9kbmYvZG5mLzAwMjktRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnkt
cnVubmluZy1weXRob24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5
LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCmlu
ZGV4IDVjZmZjOWRjZTEuLmRjNzcxNGQyYTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9kbmYvZG5mLzAwMjktRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmlu
Zy1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAyOS1E
by1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gY2ViMTA0M2M0ZjNkZTA5NWUzNjkwODIzMjMyMGI3NGE0MTI4YTk0
ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTQ0MjFmNWEyY2UzYWY4YjZhMWZjMmYy
N2NhYjIzNTkyNzNkOTc2OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAzMCBEZWMgMjAx
NiAxODoyOTowNyArMDIwMAogU3ViamVjdDogW1BBVENIXSBEbyBub3Qgc2V0IFBZVEhPTl9JTlNU
QUxMX0RJUiBieSBydW5uaW5nIHB5dGhvbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2RuZi9kbmYvMDAzMC1SdW4tcHl0aG9uLXNjcmlwdHMtdXNpbmctZW52LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAzMC1SdW4tcHl0aG9uLXNjcmlwdHMtdXNpbmct
ZW52LnBhdGNoCmluZGV4IGVlZGJiNTcyM2YuLjViMmJhNzQ5M2EgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5nLWVu
di5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDMwLVJ1bi1weXRo
b24tc2NyaXB0cy11c2luZy1lbnYucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDhkOTdiNzJh
MWQ3NzE0OWUyZjkwNDhkMWNhNmNlZjY2ZGExYThhYTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGUxNjk4ZTA1NTMzNjRkZTk1ZDdmODM4ZTYxZmY4NzE1YTBhOGFkOTUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6Mjk6MzcgKzAyMDAKLVN1YmplY3Q6
IFtQQVRDSCAyLzVdIFJ1biBweXRob24gc2NyaXB0cyB1c2luZyBlbnYKK1N1YmplY3Q6IFtQQVRD
SF0gUnVuIHB5dGhvbiBzY3JpcHRzIHVzaW5nIGVudgogCiBPdGhlcndpc2UgdGhlIGJ1aWxkIHRv
b2xzIGhhcmRjb2RlIHRoZSBweXRob24gcGF0aCBpbnRvIHRoZW0uCiAKQEAgLTE0LDcgKzE0LDcg
QEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAK
IGRpZmYgLS1naXQgYS9iaW4vZG5mLWF1dG9tYXRpYy5pbiBiL2Jpbi9kbmYtYXV0b21hdGljLmlu
Ci1pbmRleCA1YjA2YWEyNi4uODkxYjRjMjQgMTAwNzU1CitpbmRleCAxN2UzNWEwNS4uMjg4Mjdl
MzggMTAwNzU1CiAtLS0gYS9iaW4vZG5mLWF1dG9tYXRpYy5pbgogKysrIGIvYmluL2RuZi1hdXRv
bWF0aWMuaW4KIEBAIC0xLDQgKzEsNCBAQApAQCAtMjQsNyArMjQsNyBAQCBpbmRleCA1YjA2YWEy
Ni4uODkxYjRjMjQgMTAwNzU1CiAgIwogICMgQ29weXJpZ2h0IChDKSAyMDE0LTIwMTYgUmVkIEhh
dCwgSW5jLgogZGlmZiAtLWdpdCBhL2Jpbi9kbmYuaW4gYi9iaW4vZG5mLmluCi1pbmRleCA2NDVk
MGYwNi4uYmRmN2IzYzQgMTAwNzU1CitpbmRleCA1NWNlYjNmMi4uZTM4OTczYzcgMTAwNzU1CiAt
LS0gYS9iaW4vZG5mLmluCiArKysgYi9iaW4vZG5mLmluCiBAQCAtMSw0ICsxLDQgQEAKQEAgLTMz
LDYgKzMzLDMgQEAgaW5kZXggNjQ1ZDBmMDYuLmJkZjdiM2M0IDEwMDc1NQogICMgVGhlIGRuZiBl
eGVjdXRhYmxlIHNjcmlwdC4KICAjCiAgIyBDb3B5cmlnaHQgKEMpIDIwMTItMjAxNiBSZWQgSGF0
LCBJbmMuCi0tLSAKLTIuMTQuMgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL2RuZl80LjE4LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjE5LjAu
YmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2RuZi9kbmZfNC4xOC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2Ru
Zl80LjE5LjAuYmIKaW5kZXggZGMwYzE4YmU1ZS4uNzg0ZDdhOTRiMyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xOC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kbmYvZG5mXzQuMTkuMC5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNfVVJJID0gImdp
dDovL2dpdGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvZG5mLmdpdDticmFuY2g9bWFz
dGVyO3Byb3RvYwogCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiZmlsZTovLzAwMDEt
ZG5mLXdyaXRlLXRoZS1sb2ctbG9jay10by1yb290LnBhdGNoIgogCi1TUkNSRVYgPSAiMWM0M2Qw
OTk5MTc4ZDQ5MjM4MWFkMGI0MzkxN2ZmZDljNzQwMTZmOCIKK1NSQ1JFViA9ICI1NjZhNjFmOWQ4
YTI4MzBhYzZkY2MzYTk0YzU5MjI0Y2VmMWMzZDAzIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVH
RVggPSAiKD9QPHB2ZXI+XGQrKFwuXGQrKSspIgogCiBTID0gIiR7V09SS0RJUn0vZ2l0IgotLSAK
Mi40Mi4wCgo=

--===============7616924847540055009==--

