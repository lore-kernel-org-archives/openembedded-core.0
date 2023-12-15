Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73CCC4829F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 14:17:53 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.63606.1702649863298395552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 06:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RdUUpUJI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=kMiHUSQX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018c6dd7194c-9ae0fb40-1c34-448c-8a5e-84500a99507c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1702649862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cRIrPBxBYA29F8pnEJXSZSu5FHsl9Cl70wyxGQzd/Gk=;
	b=RdUUpUJIBw5ESwuOzuaEZun9SSXvlZGH9jhMI179EFupvu96vMx5rcFR3bUBOtCG
	dK0FY4F2Ex3vZcOcUPvFwzYLBphtUCLWoyniNq9nSpW5k1xMvliLpHnFljOlQu56mZY
	ECvdrEEpVOyxEYEjr4pP7YuxFThWTq/2/dRtSKHA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1702649862;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cRIrPBxBYA29F8pnEJXSZSu5FHsl9Cl70wyxGQzd/Gk=;
	b=kMiHUSQXhjasNTcaZDVGrutyNapilpXWPrhdvamxitKeohbyaIRYW7srqveaYhJ9
	A9/EKi4C2sZ245mm9aAxxCkyEtK9VqFDw+hH/CgdIYnM7yQYcoh34nQYdINRaMCWPGO
	QMexsWE6f31e0//aiIvPM5xdZqB7pCFURt/dXffQ=
Content-Type: multipart/mixed; boundary="===============5540567236581514002=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.18.2 SUCCEEDED
Message-ID: <0101018c6dd7194c-9ae0fb40-1c34-448c-8a5e-84500a99507c-000000@us-west-2.amazonses.com>
Date: Fri, 15 Dec 2023 14:17:42 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192452

--===============5540567236581514002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.18.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.18.1-4.18.2.patch
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
From 6dc7f708edb6163db4173d4c0609a984da17f477 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Dec 2023 06:35:23 +0000
Subject: [PATCH] dnf: upgrade 4.18.1 -> 4.18.2

---
 ...1-Corretly-install-tmpfiles.d-configuration.patch |  7 ++-----
 ...t-hardcode-etc-and-systemd-unit-directories.patch |  4 ++--
 .../dnf/0001-dnf-write-the-log-lock-to-root.patch    |  2 +-
 .../0001-set-python-path-for-completion_helper.patch |  8 +++-----
 .../0005-Do-not-prepend-installroot-to-logdir.patch  | 12 +++++-------
 ...ot-set-PYTHON_INSTALL_DIR-by-running-python.patch |  2 +-
 .../dnf/dnf/0030-Run-python-scripts-using-env.patch  | 11 ++++-------
 .../dnf/{dnf_4.18.1.bb => dnf_4.18.2.bb}             |  2 +-
 8 files changed, 19 insertions(+), 29 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.18.1.bb => dnf_4.18.2.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
index 6692b41a16..3890d5b2a0 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Corretly-install-tmpfiles.d-configuration.patch
@@ -1,7 +1,7 @@
-From 05e059cd4e9910c00b32d377f4f98e3c8dde6bc6 Mon Sep 17 00:00:00 2001
+From cf281a61daf214837e699284414a6d8003edbd18 Mon Sep 17 00:00:00 2001
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
index cb09f17a56..712b7940a2 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
@@ -1,4 +1,4 @@
-From ffb7942cc73c3d2c6aa7c689cdaf9bc0bcbc144b Mon Sep 17 00:00:00 2001
+From 5cbc1e74f96c31a2e228e79221fcdc0f9bbf34e3 Mon Sep 17 00:00:00 2001
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
index eb0309d81a..df08408be5 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-dnf-write-the-log-lock-to-root.patch
@@ -1,4 +1,4 @@
-From 3bd0faf58cc9ad531e6b63d5660c4b8316e8daed Mon Sep 17 00:00:00 2001
+From c15d64fb6f409aa1d68bc7d79a483ed6466ff5d5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 28 Apr 2020 15:55:00 +0200
 Subject: [PATCH] dnf: write the log lock to root
diff --git a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
index 448f6408bc..4ea1a6af33 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-set-python-path-for-completion_helper.patch
@@ -1,16 +1,17 @@
-From 7e79b3b67fd5cecd7380e7e365fd88eca63b5bfa Mon Sep 17 00:00:00 2001
+From 80528288f6e8c676e5e0f17d000d6ba0cc257a1b Mon Sep 17 00:00:00 2001
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
index aa20009cef..9470ea18a3 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -1,7 +1,7 @@
-From 6365389074a1b86962f3d8b22a2ead2202026a98 Mon Sep 17 00:00:00 2001
+From 1f558abc89a340b33ab8c770941991164ec7b33a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 11 Jan 2017 15:10:13 +0200
-Subject: [PATCH 5/5] Do not prepend installroot to logdir.
+Subject: [PATCH] Do not prepend installroot to logdir.
 
 This would otherwise write the logs into rootfs/var/log
 (whereas we want them in $T),
@@ -9,15 +9,16 @@ and will break installation of base-files rpm.
 
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
-@@ -920,7 +920,7 @@ class Cli(object):
+@@ -944,7 +944,7 @@ class Cli(object):
              logger.warning(_("Unable to detect release version (use '--releasever' to specify "
                               "release version)"))
  
@@ -26,6 +27,3 @@ index d2d9c082..82270ecf 100644
              conf.prepend_installroot(opt)
  
          self.base._logging._setup_from_dnf_conf(conf)
--- 
-2.14.2
-
diff --git a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index 5cffc9dce1..945f820201 100644
--- a/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/dnf/dnf/0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From ceb1043c4f3de095e36908232320b74a4128a94e Mon Sep 17 00:00:00 2001
+From 9aaf258fd07a78826706474753a9149ca4fa014b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:29:07 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
diff --git a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
index eedbb5723f..d6718e33fc 100644
--- a/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
+++ b/meta/recipes-devtools/dnf/dnf/0030-Run-python-scripts-using-env.patch
@@ -1,7 +1,7 @@
-From 8d97b72a1d77149e2f9048d1ca6cef66da1a8aa5 Mon Sep 17 00:00:00 2001
+From f0824af53fef2e276d0242837de297bb8108da0a Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/dnf/dnf_4.18.1.bb b/meta/recipes-devtools/dnf/dnf_4.18.2.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.18.1.bb
rename to meta/recipes-devtools/dnf/dnf_4.18.2.bb
index f60b4794a6..987ca42c98 100644
--- a/meta/recipes-devtools/dnf/dnf_4.18.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.18.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "41a287e2bd60b4d1100c329a274776ff32ba8740"
+SRCREV = "1c43d0999178d492381ad0b43917ffd9c74016f8"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.42.0


--===============5540567236581514002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (0 cached, 911 parsed). 1843 targets, 49 skipped, 0 masked, 0 errors.
Removing 90 recipes from the core2-64 sysroot...done.
Removing 102 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-df6c01738bd856d2ac34a6f2f648fdcc955d14cd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:df6c01738bd856d2ac34a6f2f648fdcc955d14cd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 653 Local 598 Mirrors 0 Missed 55 Current 239 (91% match, 93% complete)
Removing 7 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 254 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_create_spdx_setscene)
NOTE: Running setscene task 255 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 256 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 257 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 267 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 273 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 281 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 285 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 286 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 287 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 288 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_deb_setscene)
NOTE: recipe libcomps-0.1.20-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcomps-0.1.20-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libcomps-0.1.20-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libcomps-0.1.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcomps-0.1.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe librepo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libdnf-0.72.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 291 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcomps-0.1.20-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 292 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_ipk_setscene)
NOTE: recipe librepo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 295 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 296 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-iniparse-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcomps-0.1.20-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libdnf-0.72.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 304 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 306 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.38.0.bb:do_packagedata_setscene)
NOTE: recipe python3-iniparse-0.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 307 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_packagedata_setscene)
NOTE: recipe libcomps-0.1.20-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 311 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: recipe libcomps-0.1.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcomps-0.1.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 312 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 313 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: recipe python3-iniparse-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_create_spdx_setscene)
NOTE: recipe json-c-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe librepo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdnf-0.72.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 316 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_create_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcomps-0.1.20-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 323 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-5.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe librepo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 324 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdnf-0.72.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 325 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 326 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 328 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_create_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 329 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 332 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.17.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 333 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-iniparse-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 334 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iniparse_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 338 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe libsolv-0.7.27-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcomps-0.1.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe debugedit-5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk-doc-1.33.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 341 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-iniparse-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsolv-0.7.27-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 343 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libcomps/libcomps_0.1.20.bb:do_recipe_qa_setscene)
NOTE: recipe rpm-1_4.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 344 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: recipe lua-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 348 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 349 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-iniparse-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 350 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: recipe gtk-doc-1.33.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 351 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcomps-0.1.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 352 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_recipe_qa_setscene)
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 353 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 356 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcomps-0.1.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 357 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxml2/2.11.5/temp/log.do_packagedata_setscene.3584870
NOTE: recipe rpm-1_4.18.1-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 358 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsolv-0.7.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsolv-0.7.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 359 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_create_spdx_setscene)
NOTE: recipe lua-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 380 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 382 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 386 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 387 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 388 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_ipk_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 396 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 398 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 404 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 405 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 406 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.1.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 407 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.1.bb:do_package_write_deb_setscene)
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 412 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 413 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.1.bb:do_package_write_rpm_setscene)
NOTE: recipe gtk-doc-1.33.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 415 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 418 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_recipe_qa_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 422 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_package_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnupg-2.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gpgme-1.23.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gpgme-1.23.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gpgme-1.23.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gpgme-1.23.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk-doc-1.33.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 424 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe gnupg-2.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 428 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe gpgme-1.23.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 429 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 431 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_create_spdx_setscene)
NOTE: recipe gtk-doc-1.33.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 433 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 434 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gpgme-1.23.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 435 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.5.bb:do_create_spdx_setscene)
NOTE: recipe gnupg-2.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gpgme-1.23.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 436 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_package_setscene: Started
NOTE: recipe gpgme-1.23.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Started
NOTE: Running setscene task 437 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.1.bb:do_packagedata_setscene)
NOTE: recipe libassuan-2.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gpgme-1.23.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 439 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnupg-2.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libksba-1.6.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 440 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_create_spdx_setscene)
NOTE: recipe libksba-1.6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 447 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe gpgme-1.23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libassuan-2.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 449 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 450 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: recipe libksba-1.6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 451 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 452 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 458 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.5.bb:do_packagedata_setscene)
NOTE: recipe libksba-1.6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 462 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 465 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gpgme-1.23.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 466 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 467 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: recipe gpgme-1.23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gpgme/gpgme_1.23.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 475 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 478 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: recipe libksba-1.6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 481 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.6.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 484 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 485 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_recipe_qa_setscene)
NOTE: recipe gpgme-1.23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 489 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_packagedata_setscene)
NOTE: recipe npth-1.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 490 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: recipe libksba-1.6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libksba/libksba_1.6.5.bb:do_recipe_qa_setscene)
NOTE: recipe gpgme-1.23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 498 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 499 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 501 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/pinentry/pinentry_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 504 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: recipe npth-1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.6.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libksba-1.6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pinentry-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 507 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe npth-1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libksba-1.6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 508 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_create_spdx_setscene)
NOTE: recipe npth-1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 892 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 892 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pinentry-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe npth-1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 587 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 590 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/npth/npth_1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 591 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 597 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe libassuan-2.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libassuan-2.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe meson-native-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 602 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe npth-1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-native-1_2.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 607 of 892 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libassuan-2.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe npth-1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 609 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libassuan-2.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libassuan/libassuan_2.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe meson-native-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe meson-native-1.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 616 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 394 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_fetch)
NOTE: recipe libassuan-2.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 402 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_fetch)
NOTE: Running task 407 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_fetch)
NOTE: Running task 417 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_fetch)
NOTE: Running task 424 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_fetch)
NOTE: Running task 437 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_write_config)
NOTE: recipe meson-native-1.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libassuan-2.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 471 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_recipe_qa)
NOTE: recipe elfutils-0.189-r0: task do_package_setscene: Succeeded
NOTE: Running task 481 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_fetch)
NOTE: Running task 489 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.27-r0: task do_fetch: Started
NOTE: recipe librepo-1.16.0-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libmodulemd-2.15.0-r0: task do_fetch: Started
NOTE: recipe libdnf-0.72.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_write_config: Started
NOTE: Running setscene task 624 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_write_config: Succeeded
NOTE: recipe libsolv-0.7.27-r0: task do_fetch: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_fetch: Succeeded
NOTE: recipe dnf-4.18.2-r0: task do_recipe_qa: Started
NOTE: Running setscene task 625 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 627 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe gnupg-2.4.3-r0: task do_fetch: Started
NOTE: Running setscene task 629 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: recipe librepo-1.16.0-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 631 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libdnf-0.72.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 632 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnupg-2.4.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 638 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 641 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dnf-4.18.2-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 645 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 649 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 655 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 662 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 663 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 668 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_package_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 694 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 695 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 972 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_fetch)
NOTE: Running task 1045 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_unpack)
NOTE: Running task 1049 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_unpack)
NOTE: Running task 1065 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_unpack)
NOTE: Running task 1069 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_unpack)
NOTE: Running task 1083 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_unpack)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1102 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_fetch)
NOTE: Running task 1127 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_unpack)
NOTE: Running task 1149 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1176 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_fetch)
NOTE: Running task 1205 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.189-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librepo-1.16.0-r0: task do_unpack: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_unpack: Started
NOTE: recipe elfutils-0.189-r0: task do_fetch: Succeeded
NOTE: Running task 1237 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_unpack)
NOTE: recipe libdnf-0.72.0-r0: task do_unpack: Started
NOTE: recipe dnf-4.18.2-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe gnupg-2.4.3-r0: task do_unpack: Started
NOTE: recipe debugedit-5.0-r0: task do_fetch: Started
NOTE: recipe libsolv-0.7.27-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe debugedit-5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1260 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_unpack)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 699 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: recipe dnf-4.18.2-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_unpack: Started
NOTE: Running setscene task 702 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 703 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe debugedit-5.0-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 705 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe debugedit-5.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 706 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 712 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running task 1266 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_unpack)
NOTE: recipe curl-8.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1267 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libmodulemd-2.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1268 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_patch)
NOTE: recipe gnutls-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dnf-4.18.2-r0: task do_unpack: Started
NOTE: Running setscene task 716 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 719 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe librepo-1.16.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 720 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsolv-0.7.27-r0: task do_unpack: Succeeded
NOTE: Running setscene task 721 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.18.1-r0: task do_unpack: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_patch: Started
NOTE: Running setscene task 722 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_package_setscene)
NOTE: Running setscene task 723 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdnf-0.72.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 725 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 726 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1277 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_fetch)
NOTE: recipe gnutls-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1286 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_patch)
NOTE: Running task 1287 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_patch)
NOTE: recipe libgcrypt-1.10.3-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_fetch: Succeeded
NOTE: Running task 1288 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1289 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1290 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Started
NOTE: recipe librepo-1.16.0-r0: task do_patch: Started
NOTE: Running task 1293 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 731 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsolv-0.7.27-r0: task do_patch: Started
NOTE: Running setscene task 737 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdnf-0.72.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 739 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 740 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 742 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 743 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsolv-0.7.27-r0: task do_patch: Succeeded
NOTE: Running setscene task 744 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 746 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe librepo-1.16.0-r0: task do_patch: Succeeded
NOTE: recipe dnf-4.18.2-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1312 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_generate_toolchain_file)
NOTE: Running task 1313 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_generate_toolchain_file)
NOTE: Running task 1315 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_patch)
NOTE: Running task 1316 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnupg-2.4.3-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1317 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_patch)
NOTE: recipe libsolv-0.7.27-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 749 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe librepo-1.16.0-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1320 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_patch)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe dnf-4.18.2-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 751 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 755 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe libsolv-0.7.27-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe librepo-1.16.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 756 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: Running task 1331 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnupg-2.4.3-r0: task do_patch: Started
NOTE: recipe debugedit-5.0-r0: task do_patch: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libdnf-0.72.0-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1333 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_generate_toolchain_file)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1340 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe debugedit-5.0-r0: task do_patch: Succeeded
NOTE: recipe libdnf-0.72.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdnf-0.72.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1347 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_unpack)
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnupg-2.4.3-r0: task do_patch: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 768 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 771 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 773 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 775 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Started
NOTE: recipe dnf-4.18.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 777 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 779 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 782 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 789 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 796 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 800 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 802 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 804 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 805 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 810 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 812 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 814 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 816 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running task 1371 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_deploy_source_date_epoch)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 821 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1377 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_generate_toolchain_file)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1383 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1384 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_populate_lic)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 826 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 827 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 829 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe dnf-4.18.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 835 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dnf-4.18.2-r0: task do_generate_toolchain_file: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe dnf-4.18.2-r0: task do_populate_lic: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dnf-4.18.2-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 838 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dnf-4.18.2-r0: task do_populate_lic: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dnf-4.18.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_populate_lic unihash changed to 42c05d7d166954933e01b9eaae2519c0cdfab54e98cf4d4e8d364c1555d093b8
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 844 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 846 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 848 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 853 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 855 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 858 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 871 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1474 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 881 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 882 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 887 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1974 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2017 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2024 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata)
NOTE: Running task 2041 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2150 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2169 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe librepo-1.16.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Started
NOTE: Running task 2233 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmodulemd-2.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2243 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.10.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnupg-2.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2311 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_create_spdx)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2315 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_collect_spdx_deps)
NOTE: recipe gnupg-2.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2321 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_configure)
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx: Started
NOTE: recipe debugedit-5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2322 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_configure)
NOTE: recipe librepo-1.16.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnupg-2.4.3-r0: task do_configure: Started
NOTE: recipe librepo-1.16.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2323 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2324 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_configure)
NOTE: recipe debugedit-5.0-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2325 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_configure)
NOTE: recipe libmodulemd-2.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librepo-1.16.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librepo-1.16.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2326 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_collect_spdx_deps)
NOTE: Running task 2327 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_collect_spdx_deps)
NOTE: recipe librepo-1.16.0-r0: task do_configure: Succeeded
NOTE: Running task 2328 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnupg-2.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe librepo-1.16.0-r0: task do_compile: Started
NOTE: recipe gnupg-2.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2329 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_create_spdx: Succeeded
NOTE: Running task 2330 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.189-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2331 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx)
NOTE: recipe librepo-1.16.0-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_install)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Started
NOTE: recipe librepo-1.16.0-r0: task do_install: Started
NOTE: recipe librepo-1.16.0-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package)
NOTE: Running task 2334 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_populate_sysroot)
NOTE: recipe librepo-1.16.0-r0: task do_package: Started
NOTE: recipe librepo-1.16.0-r0: task do_populate_sysroot: Started
NOTE: recipe librepo-1.16.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmodulemd-2.15.0-r0: task do_configure: Succeeded
NOTE: Running task 2335 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_compile)
NOTE: recipe libmodulemd-2.15.0-r0: task do_compile: Started
NOTE: recipe librepo-1.16.0-r0: task do_package: Succeeded
NOTE: Running task 2336 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_packagedata)
NOTE: recipe librepo-1.16.0-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx: Succeeded
NOTE: Running task 2337 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe librepo-1.16.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_packagedata unihash changed to a33caa1daba5569eb5492a466facce645d74d4f5fc0e073ebf4f49bb2066cd31
NOTE: recipe debugedit-5.0-r0: task do_configure: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2338 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_create_spdx)
NOTE: Running task 2339 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_compile)
NOTE: Running task 2340 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package_write_ipk)
NOTE: Running task 2341 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package_write_deb)
NOTE: Running task 2342 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package_write_rpm)
NOTE: recipe librepo-1.16.0-r0: task do_create_spdx: Started
NOTE: recipe debugedit-5.0-r0: task do_compile: Started
NOTE: recipe librepo-1.16.0-r0: task do_package_write_ipk: Started
NOTE: recipe librepo-1.16.0-r0: task do_package_write_deb: Started
NOTE: recipe librepo-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe librepo-1.16.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librepo-1.16.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package_write_ipk unihash changed to 5318ce4f22460e287942dbe85016bb2d25b2367a55cf04df08e4ae2931919316
NOTE: recipe librepo-1.16.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package_write_deb unihash changed to 0324681b3013be11b5c7b572859a279b8741375357913812a350dc11a8f70cd6
NOTE: recipe librepo-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/librepo/librepo_1.16.0.bb:do_package_write_rpm unihash changed to 1a6bd9c887837ab00b35fb52f1dee285fa9c8983212d3450c12468b8e98893c7
NOTE: recipe debugedit-5.0-r0: task do_compile: Succeeded
NOTE: Running task 2343 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_install)
NOTE: recipe debugedit-5.0-r0: task do_install: Started
NOTE: recipe debugedit-5.0-r0: task do_install: Succeeded
NOTE: Running task 2344 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_package)
NOTE: recipe debugedit-5.0-r0: task do_package: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2345 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_install)
NOTE: recipe libmodulemd-2.15.0-r0: task do_install: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_install: Succeeded
NOTE: Running task 2346 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_populate_sysroot)
NOTE: Running task 2347 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_package)
NOTE: recipe libmodulemd-2.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_package: Started
NOTE: recipe debugedit-5.0-r0: task do_package: Succeeded
NOTE: Running task 2348 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_packagedata)
NOTE: recipe debugedit-5.0-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe debugedit-5.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/debugedit/debugedit_5.0.bb:do_packagedata unihash changed to 0f6f0e54f97f6574cdd981be4d71853a74d46ede8637b2291d487681c7e079f2
NOTE: Setscene tasks completed
NOTE: recipe libmodulemd-2.15.0-r0: task do_package: Succeeded
NOTE: Running task 2349 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata)
NOTE: recipe libmodulemd-2.15.0-r0: task do_packagedata: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_packagedata unihash changed to 85a32bcd5426a48a330207eecba9cff8ad96a5db2cedad6038cc44ef61e7d102
NOTE: Setscene tasks completed
NOTE: Running task 2350 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb:do_create_spdx)
NOTE: recipe libmodulemd-2.15.0-r0: task do_create_spdx: Started
NOTE: recipe gnupg-2.4.3-r0: task do_configure: Succeeded
NOTE: Running task 2351 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_compile)
NOTE: recipe gnupg-2.4.3-r0: task do_compile: Started
NOTE: recipe libmodulemd-2.15.0-r0: task do_create_spdx: Succeeded
NOTE: recipe rpm-1_4.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2352 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_compile)
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_compile: Succeeded
NOTE: Running task 2353 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_install)
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_populate_sysroot)
NOTE: Running task 2355 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package)
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2356 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsolv-0.7.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsolv-0.7.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2357 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_configure)
NOTE: recipe libsolv-0.7.27-r0: task do_configure: Started
NOTE: recipe libsolv-0.7.27-r0: task do_configure: Succeeded
NOTE: Running task 2358 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_compile)
NOTE: recipe libsolv-0.7.27-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_package: Succeeded
NOTE: Running task 2359 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_packagedata unihash changed to 60091d00050e0021df0a0769896846d047162d453da46d09c4ac855c33e3e99a
NOTE: Setscene tasks completed
NOTE: Running task 2360 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_create_spdx)
NOTE: Running task 2361 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package_write_ipk)
NOTE: Running task 2362 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package_write_deb)
NOTE: Running task 2363 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_package_write_ipk: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_package_write_deb: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2364 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_collect_spdx_deps)
NOTE: recipe libsolv-0.7.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsolv-0.7.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsolv-0.7.27-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2365 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_install)
NOTE: recipe libsolv-0.7.27-r0: task do_install: Started
NOTE: recipe libsolv-0.7.27-r0: task do_install: Succeeded
NOTE: Running task 2366 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_populate_sysroot)
NOTE: Running task 2367 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_package)
NOTE: recipe libsolv-0.7.27-r0: task do_populate_sysroot: Started
NOTE: recipe libsolv-0.7.27-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package_write_ipk unihash changed to eaaeea4f8f64d0b4c65974b743337358b38b99ed8bee79e64e8bd96a4d0955f9
NOTE: recipe libsolv-0.7.27-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2368 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libdnf-0.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package_write_rpm unihash changed to 56cde9055ac19f587a0505da64b0f58d4035982a13651c474c392a3442285de4
NOTE: recipe libdnf-0.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2369 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_configure)
NOTE: recipe libdnf-0.72.0-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.18.1.bb:do_package_write_deb unihash changed to db7b53e84109f9f6bd33e7ac7b256f4162d2da3c0ae218bcc432d762edc9fcd8
NOTE: recipe gnupg-2.4.3-r0: task do_compile: Succeeded
NOTE: Running task 2370 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_install)
NOTE: recipe gnupg-2.4.3-r0: task do_install: Started
NOTE: recipe libsolv-0.7.27-r0: task do_package: Succeeded
NOTE: recipe libdnf-0.72.0-r0: task do_configure: Succeeded
NOTE: Running task 2371 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_compile)
NOTE: Running task 2372 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_packagedata)
NOTE: recipe libdnf-0.72.0-r0: task do_compile: Started
NOTE: recipe libsolv-0.7.27-r0: task do_packagedata: Started
NOTE: recipe libsolv-0.7.27-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_packagedata unihash changed to c673e9f2ad45852cc18850a06bd2f289f06bb43b88c056381d7df12cc06cc818
NOTE: Setscene tasks completed
NOTE: Running task 2373 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libsolv/libsolv_0.7.27.bb:do_create_spdx)
NOTE: recipe libsolv-0.7.27-r0: task do_create_spdx: Started
NOTE: recipe gnupg-2.4.3-r0: task do_install: Succeeded
NOTE: Running task 2374 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_package)
NOTE: recipe gnupg-2.4.3-r0: task do_package: Started
NOTE: recipe libsolv-0.7.27-r0: task do_create_spdx: Succeeded
NOTE: Running task 2375 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_collect_spdx_deps)
NOTE: recipe libdnf-0.72.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdnf-0.72.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnupg-2.4.3-r0: task do_package: Succeeded
NOTE: Running task 2376 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_packagedata)
NOTE: recipe gnupg-2.4.3-r0: task do_packagedata: Started
NOTE: recipe gnupg-2.4.3-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_packagedata unihash changed to 44123f549e669829fc5e46bf4c7be6ce29a5893beab72f474e647eb6121ae824
NOTE: Setscene tasks completed
NOTE: Running task 2377 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_create_spdx)
NOTE: Running task 2378 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_package_write_ipk)
NOTE: Running task 2379 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_package_write_deb)
NOTE: Running task 2380 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_package_write_rpm)
NOTE: recipe gnupg-2.4.3-r0: task do_create_spdx: Started
NOTE: recipe gnupg-2.4.3-r0: task do_package_write_ipk: Started
NOTE: recipe gnupg-2.4.3-r0: task do_package_write_deb: Started
NOTE: recipe gnupg-2.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe gnupg-2.4.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gnupg-2.4.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_package_write_ipk unihash changed to e9c46c752960a36fc23c4ae6645923973ab823b3a87acbec47f35db73700ea3a
NOTE: recipe gnupg-2.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_package_write_rpm unihash changed to 5a68680edf7991dc27fa85d4af92dbf2c4a6671fca4daad1b4a67f7be04e83d5
NOTE: recipe gnupg-2.4.3-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnupg/gnupg_2.4.3.bb:do_package_write_deb unihash changed to 923247336430ae174be64d43a665967fc7fc17eaa8b1964f8b26d2a622629d00
NOTE: recipe libdnf-0.72.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2381 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_install)
NOTE: recipe libdnf-0.72.0-r0: task do_install: Started
NOTE: recipe libdnf-0.72.0-r0: task do_install: Succeeded
NOTE: Running task 2382 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package)
NOTE: Running task 2383 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_populate_sysroot)
NOTE: recipe libdnf-0.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdnf-0.72.0-r0: task do_package: Started
NOTE: recipe libdnf-0.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2384 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe dnf-4.18.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dnf-4.18.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2385 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_configure)
NOTE: recipe dnf-4.18.2-r0: task do_configure: Started
NOTE: recipe dnf-4.18.2-r0: task do_configure: Succeeded
NOTE: Running task 2386 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_compile)
NOTE: recipe dnf-4.18.2-r0: task do_compile: Started
NOTE: recipe dnf-4.18.2-r0: task do_compile: Succeeded
NOTE: Running task 2387 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_install)
NOTE: recipe dnf-4.18.2-r0: task do_install: Started
NOTE: recipe dnf-4.18.2-r0: task do_install: Succeeded
NOTE: Running task 2388 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_populate_sysroot)
NOTE: recipe dnf-4.18.2-r0: task do_populate_sysroot: Started
NOTE: recipe dnf-4.18.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdnf-0.72.0-r0: task do_package: Succeeded
NOTE: Running task 2389 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_packagedata)
NOTE: recipe libdnf-0.72.0-r0: task do_packagedata: Started
NOTE: recipe libdnf-0.72.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_packagedata unihash changed to 18352a64250822760ec289767b83a5adaa052a1246b3dcf408c8da033d9de5cd
NOTE: Setscene tasks completed
NOTE: Running task 2390 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_package)
NOTE: Running task 2391 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_create_spdx)
NOTE: Running task 2392 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package_write_ipk)
NOTE: Running task 2393 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package_write_deb)
NOTE: Running task 2394 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package_write_rpm)
NOTE: recipe dnf-4.18.2-r0: task do_package: Started
NOTE: recipe libdnf-0.72.0-r0: task do_create_spdx: Started
NOTE: recipe libdnf-0.72.0-r0: task do_package_write_ipk: Started
NOTE: recipe libdnf-0.72.0-r0: task do_package_write_deb: Started
NOTE: recipe libdnf-0.72.0-r0: task do_package_write_rpm: Started
NOTE: recipe libdnf-0.72.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2395 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_collect_spdx_deps)
NOTE: recipe dnf-4.18.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe dnf-4.18.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dnf-4.18.2-r0: task do_package: Succeeded
NOTE: Running task 2396 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_packagedata)
NOTE: recipe dnf-4.18.2-r0: task do_packagedata: Started
NOTE: recipe dnf-4.18.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2397 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_create_spdx)
NOTE: Running task 2398 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_package_write_ipk)
NOTE: Running task 2399 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_package_write_deb)
NOTE: Running task 2400 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_package_write_rpm)
NOTE: Running task 2401 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_package_qa)
NOTE: recipe dnf-4.18.2-r0: task do_create_spdx: Started
NOTE: recipe dnf-4.18.2-r0: task do_package_write_ipk: Started
NOTE: recipe dnf-4.18.2-r0: task do_package_write_deb: Started
NOTE: recipe dnf-4.18.2-r0: task do_package_write_rpm: Started
NOTE: recipe dnf-4.18.2-r0: task do_package_qa: Started
NOTE: recipe dnf-4.18.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2402 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_create_runtime_spdx)
NOTE: recipe dnf-4.18.2-r0: task do_package_qa: Succeeded
NOTE: recipe dnf-4.18.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe dnf-4.18.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe dnf-4.18.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe dnf-4.18.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe dnf-4.18.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libdnf-0.72.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package_write_ipk unihash changed to 8d61d322004ed0465ae60f3327f113b9b25b337caf5de65606543a090562d373
NOTE: recipe libdnf-0.72.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package_write_rpm unihash changed to 1fbbb58530f808027479ecfe87bc3aa2a6a2cebda7c0cce67f3dbf821a29ad14
NOTE: recipe libdnf-0.72.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb:do_package_write_deb unihash changed to 764224140be948f93ea02d8640cd44c46eee3c0da2823b34191bdba87af8b02a
NOTE: Running noexec task 2403 of 2403 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dnf/dnf_4.18.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2403 tasks of which 2263 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.12.3-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5540567236581514002==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.18.1-4.18.2.patch"

RnJvbSA2ZGM3ZjcwOGVkYjYxNjNkYjQxNzNkNGMwNjA5YTk4NGRhMTdmNDc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgRGVjIDIwMjMgMDY6MzU6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
bmY6IHVwZ3JhZGUgNC4xOC4xIC0+IDQuMTguMgoKLS0tCiAuLi4xLUNvcnJldGx5LWluc3RhbGwt
dG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoIHwgIDcgKystLS0tLQogLi4udC1oYXJkY29k
ZS1ldGMtYW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaCB8ICA0ICsrLS0KIC4uLi9k
bmYvMDAwMS1kbmYtd3JpdGUtdGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2ggICAgfCAgMiArLQog
Li4uLzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRjaCB8ICA4
ICsrKy0tLS0tCiAuLi4vMDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIu
cGF0Y2ggIHwgMTIgKysrKystLS0tLS0tCiAuLi5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5
LXJ1bm5pbmctcHl0aG9uLnBhdGNoIHwgIDIgKy0KIC4uLi9kbmYvZG5mLzAwMzAtUnVuLXB5dGhv
bi1zY3JpcHRzLXVzaW5nLWVudi5wYXRjaCAgfCAxMSArKysrLS0tLS0tLQogLi4uL2RuZi97ZG5m
XzQuMTguMS5iYiA9PiBkbmZfNC4xOC4yLmJifSAgICAgICAgICAgICB8ICAyICstCiA4IGZpbGVz
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYve2RuZl80LjE4LjEuYmIgPT4gZG5mXzQuMTguMi5iYn0gKDk4
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLUNvcnJl
dGx5LWluc3RhbGwtdG1wZmlsZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RuZi9kbmYvMDAwMS1Db3JyZXRseS1pbnN0YWxsLXRtcGZpbGVzLmQtY29uZmln
dXJhdGlvbi5wYXRjaAppbmRleCA2NjkyYjQxYTE2Li4zODkwZDViMmEwIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLUNvcnJldGx5LWluc3RhbGwtdG1wZmls
ZXMuZC1jb25maWd1cmF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYv
ZG5mLzAwMDEtQ29ycmV0bHktaW5zdGFsbC10bXBmaWxlcy5kLWNvbmZpZ3VyYXRpb24ucGF0Y2gK
QEAgLTEsNyArMSw3IEBACi1Gcm9tIDA1ZTA1OWNkNGU5OTEwYzAwYjMyZDM3N2Y0Zjk4ZTNjOGRk
ZTZiYzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNmMjgxYTYxZGFmMjE0ODM3ZTY5
OTI4NDQxNGE2ZDgwMDNlZGJkMTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjYgSmFu
IDIwMTcgMTY6MzY6MjAgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSCA0LzVdIENvcnJldGx5IGluc3Rh
bGwgdG1wZmlsZXMuZCBjb25maWd1cmF0aW9uCitTdWJqZWN0OiBbUEFUQ0hdIENvcnJldGx5IGlu
c3RhbGwgdG1wZmlsZXMuZCBjb25maWd1cmF0aW9uCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHBy
b3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5h
dmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgpAQCAtMTcsNiArMTcsMyBAQCBpbmRleCBmNjlj
NzczZS4uM2ViNmQwZTggMTAwNjQ0CiBAQCAtMSArMSBAQAogLUlOU1RBTEwgKEZJTEVTIGRuZi5j
b25mIERFU1RJTkFUSU9OIC91c3IvbGliL3RtcGZpbGVzLmQvKQogK0lOU1RBTEwgKEZJTEVTIGRu
Zi5jb25mIERFU1RJTkFUSU9OICR7U1lTQ09ORkRJUn0vdG1wZmlsZXMuZC8pCi0tLSAKLTIuMTQu
MgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLURvLW5v
dC1oYXJkY29kZS1ldGMtYW5kLXN5c3RlbWQtdW5pdC1kaXJlY3Rvcmllcy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lz
dGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCmluZGV4IGNiMDlmMTdhNTYuLjcxMmI3OTQwYTIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhh
cmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDEtRG8tbm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lz
dGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmZmI3OTQy
Y2M3M2MzZDJjNmFhN2M2ODljZGFmOWJjMGJjYmMxNDRiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA1Y2JjMWU3NGY5NmMzMWEyZTIyOGU3OTIyMWZjZGMwZjliYmYzNGUzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiBEYXRlOiBUaHUsIDI2IEphbiAyMDE3IDE2OjI1OjQ3ICswMjAwCiBTdWJqZWN0
OiBbUEFUQ0hdIERvIG5vdCBoYXJkY29kZSAvZXRjIGFuZCBzeXN0ZW1kIHVuaXQgZGlyZWN0b3Jp
ZXMKQEAgLTExLDcgKzExLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0
cy50eHQKLWluZGV4IDczNTUyOTY3Li4zOGNmNGZiZiAxMDA2NDQKK2luZGV4IDRhZWU5OWZiLi45
ZTJlOWU5ZSAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4
dAogQEAgLTMsOCArMyw4IEBAIENNQUtFX01JTklNVU1fUkVRVUlSRUQgKFZFUlNJT04gMi40KQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1kbmYtd3JpdGUt
dGhlLWxvZy1sb2NrLXRvLXJvb3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2Ru
Zi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaAppbmRleCBlYjAzMDlk
ODFhLi5kZjA4NDA4YmU1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2Ru
Zi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9v
dC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2JkMGZhZjU4Y2M5YWQ1MzFlNmI2M2Q1NjYw
YzRiODMxNmU4ZGFlZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzE1ZDY0ZmI2ZjQw
OWFhMWQ2OGJjN2Q3OWE0ODNlZDY0NjZmZjVkNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVl
LCAyOCBBcHIgMjAyMCAxNTo1NTowMCArMDIwMAogU3ViamVjdDogW1BBVENIXSBkbmY6IHdyaXRl
IHRoZSBsb2cgbG9jayB0byByb290CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL2RuZi8wMDAxLXNldC1weXRob24tcGF0aC1mb3ItY29tcGxldGlvbl9oZWxwZXIucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDAxLXNldC1weXRob24tcGF0aC1mb3It
Y29tcGxldGlvbl9oZWxwZXIucGF0Y2gKaW5kZXggNDQ4ZjY0MDhiYy4uNGVhMWE2YWYzMyAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwMS1zZXQtcHl0aG9uLXBh
dGgtZm9yLWNvbXBsZXRpb25faGVscGVyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kbmYvZG5mLzAwMDEtc2V0LXB5dGhvbi1wYXRoLWZvci1jb21wbGV0aW9uX2hlbHBlci5wYXRj
aApAQCAtMSwxNiArMSwxNyBAQAotRnJvbSA3ZTc5YjNiNjdmZDVjZWNkNzM4MGU3ZTM2NWZkODhl
Y2E2M2I1YmZhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MDUyODI4OGY2ZThjNjc2
ZTVlMGYxN2QwMDBkNmJhMGNjMjU3YTFiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
SmVyZW15IFB1aGxtYW4gPGpwdWhsbWFuQG12aXN0YS5jb20+CiBEYXRlOiBXZWQsIDExIE1hciAy
MDIwIDIyOjEwOjAyICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNldCBweXRob24gcGF0aCBmb3Ig
Y29tcGxldGlvbl9oZWxwZXIKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1j
b3JlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogSmVyZW15IFB1aGxtYW4gPGpwdWhsbWFuQG12
aXN0YS5jb20+CisKIC0tLQogIGRuZi9jbGkvY29tcGxldGlvbl9oZWxwZXIucHkuaW4gfCAyICst
CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYg
LS1naXQgYS9kbmYvY2xpL2NvbXBsZXRpb25faGVscGVyLnB5LmluIGIvZG5mL2NsaS9jb21wbGV0
aW9uX2hlbHBlci5weS5pbgotaW5kZXggMzUxMjI2NzU5Li4yODM1Y2QzYjYgMTAwNjQ0CitpbmRl
eCAwZGEwZjJhMi4uOTMzMGQxNWIgMTAwNjQ0CiAtLS0gYS9kbmYvY2xpL2NvbXBsZXRpb25faGVs
cGVyLnB5LmluCiArKysgYi9kbmYvY2xpL2NvbXBsZXRpb25faGVscGVyLnB5LmluCiBAQCAtMSw0
ICsxLDQgQEAKQEAgLTE5LDYgKzIwLDMgQEAgaW5kZXggMzUxMjI2NzU5Li4yODM1Y2QzYjYgMTAw
NjQ0CiAgIwogICMgVGhpcyBmaWxlIGlzIHBhcnQgb2YgZG5mLgogICMKLS0tIAotMi4yMy4wCi0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMDUtRG8tbm90LXBy
ZXBlbmQtaW5zdGFsbHJvb3QtdG8tbG9nZGlyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2RuZi9kbmYvMDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIucGF0Y2gK
aW5kZXggYWEyMDAwOWNlZi4uOTQ3MGVhMThhMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1ub3QtcHJlcGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmYvMDAwNS1Eby1ub3QtcHJl
cGVuZC1pbnN0YWxscm9vdC10by1sb2dkaXIucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDYz
NjUzODkwNzRhMWI4Njk2MmYzZDhiMjJhMmVhZDIyMDIwMjZhOTggTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDFmNTU4YWJjODlhMzQwYjMzYWI4Yzc3MDk0MTk5MTE2NGVjN2IzM2EgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMTEgSmFuIDIwMTcgMTU6MTA6MTMgKzAyMDAKLVN1
YmplY3Q6IFtQQVRDSCA1LzVdIERvIG5vdCBwcmVwZW5kIGluc3RhbGxyb290IHRvIGxvZ2Rpci4K
K1N1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHByZXBlbmQgaW5zdGFsbHJvb3QgdG8gbG9nZGlyLgog
CiBUaGlzIHdvdWxkIG90aGVyd2lzZSB3cml0ZSB0aGUgbG9ncyBpbnRvIHJvb3Rmcy92YXIvbG9n
CiAod2hlcmVhcyB3ZSB3YW50IHRoZW0gaW4gJFQpLApAQCAtOSwxNSArOSwxNiBAQCBhbmQgd2ls
bCBicmVhayBpbnN0YWxsYXRpb24gb2YgYmFzZS1maWxlcyBycG0uCiAKIFVwc3RyZWFtLVN0YXR1
czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgorCiAtLS0KICBkbmYvY2xpL2Ns
aS5weSB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIAogZGlmZiAtLWdpdCBhL2RuZi9jbGkvY2xpLnB5IGIvZG5mL2NsaS9jbGkucHkKLWluZGV4
IGQyZDljMDgyLi44MjI3MGVjZiAxMDA2NDQKK2luZGV4IDE4MjRiZDAwLi40ZGNiMWMxYyAxMDA2
NDQKIC0tLSBhL2RuZi9jbGkvY2xpLnB5CiArKysgYi9kbmYvY2xpL2NsaS5weQotQEAgLTkyMCw3
ICs5MjAsNyBAQCBjbGFzcyBDbGkob2JqZWN0KToKK0BAIC05NDQsNyArOTQ0LDcgQEAgY2xhc3Mg
Q2xpKG9iamVjdCk6CiAgICAgICAgICAgICAgbG9nZ2VyLndhcm5pbmcoXygiVW5hYmxlIHRvIGRl
dGVjdCByZWxlYXNlIHZlcnNpb24gKHVzZSAnLS1yZWxlYXNldmVyJyB0byBzcGVjaWZ5ICIKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyZWxlYXNlIHZlcnNpb24pIikpCiAgCkBAIC0y
Niw2ICsyNywzIEBAIGluZGV4IGQyZDljMDgyLi44MjI3MGVjZiAxMDA2NDQKICAgICAgICAgICAg
ICBjb25mLnByZXBlbmRfaW5zdGFsbHJvb3Qob3B0KQogIAogICAgICAgICAgc2VsZi5iYXNlLl9s
b2dnaW5nLl9zZXR1cF9mcm9tX2RuZl9jb25mKGNvbmYpCi0tLSAKLTIuMTQuMgotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5LURvLW5vdC1zZXQtUFlUSE9O
X0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2RuZi9kbmYvMDAyOS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5n
LXB5dGhvbi5wYXRjaAppbmRleCA1Y2ZmYzlkY2UxLi45NDVmODIwMjAxIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDI5LURvLW5vdC1zZXQtUFlUSE9OX0lOU1RB
TExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9kbmYvZG5mLzAwMjktRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1w
eXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGNlYjEwNDNjNGYzZGUwOTVlMzY5MDgy
MzIzMjBiNzRhNDEyOGE5NGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlhYWYyNThm
ZDA3YTc4ODI2NzA2NDc0NzUzYTkxNDljYTRmYTAxNGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6
IEZyaSwgMzAgRGVjIDIwMTYgMTg6Mjk6MDcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90
IHNldCBQWVRIT05fSU5TVEFMTF9ESVIgYnkgcnVubmluZyBweXRob24KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMzAtUnVuLXB5dGhvbi1zY3JpcHRzLXVzaW5n
LWVudi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mLzAwMzAtUnVuLXB5dGhv
bi1zY3JpcHRzLXVzaW5nLWVudi5wYXRjaAppbmRleCBlZWRiYjU3MjNmLi5kNjcxOGUzM2ZjIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZi8wMDMwLVJ1bi1weXRob24t
c2NyaXB0cy11c2luZy1lbnYucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9k
bmYvMDAzMC1SdW4tcHl0aG9uLXNjcmlwdHMtdXNpbmctZW52LnBhdGNoCkBAIC0xLDcgKzEsNyBA
QAotRnJvbSA4ZDk3YjcyYTFkNzcxNDllMmY5MDQ4ZDFjYTZjZWY2NmRhMWE4YWE1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmMDgyNGFmNTNmZWYyZTI3NmQwMjQyODM3ZGUyOTdiYjgx
MDhkYTBhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDMwIERlYyAyMDE2IDE4OjI5OjM3
ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0ggMi81XSBSdW4gcHl0aG9uIHNjcmlwdHMgdXNpbmcgZW52
CitTdWJqZWN0OiBbUEFUQ0hdIFJ1biBweXRob24gc2NyaXB0cyB1c2luZyBlbnYKIAogT3RoZXJ3
aXNlIHRoZSBidWlsZCB0b29scyBoYXJkY29kZSB0aGUgcHl0aG9uIHBhdGggaW50byB0aGVtLgog
CkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvYmluL2RuZi1hdXRvbWF0aWMuaW4gYi9iaW4v
ZG5mLWF1dG9tYXRpYy5pbgotaW5kZXggNWIwNmFhMjYuLjg5MWI0YzI0IDEwMDc1NQoraW5kZXgg
MTdlMzVhMDUuLjI4ODI3ZTM4IDEwMDc1NQogLS0tIGEvYmluL2RuZi1hdXRvbWF0aWMuaW4KICsr
KyBiL2Jpbi9kbmYtYXV0b21hdGljLmluCiBAQCAtMSw0ICsxLDQgQEAKQEAgLTI0LDcgKzI0LDcg
QEAgaW5kZXggNWIwNmFhMjYuLjg5MWI0YzI0IDEwMDc1NQogICMKICAjIENvcHlyaWdodCAoQykg
MjAxNC0yMDE2IFJlZCBIYXQsIEluYy4KIGRpZmYgLS1naXQgYS9iaW4vZG5mLmluIGIvYmluL2Ru
Zi5pbgotaW5kZXggNjQ1ZDBmMDYuLmJkZjdiM2M0IDEwMDc1NQoraW5kZXggNTVjZWIzZjIuLmUz
ODk3M2M3IDEwMDc1NQogLS0tIGEvYmluL2RuZi5pbgogKysrIGIvYmluL2RuZi5pbgogQEAgLTEs
NCArMSw0IEBACkBAIC0zMyw2ICszMywzIEBAIGluZGV4IDY0NWQwZjA2Li5iZGY3YjNjNCAxMDA3
NTUKICAjIFRoZSBkbmYgZXhlY3V0YWJsZSBzY3JpcHQuCiAgIwogICMgQ29weXJpZ2h0IChDKSAy
MDEyLTIwMTYgUmVkIEhhdCwgSW5jLgotLS0gCi0yLjE0LjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xOC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2RuZi9kbmZfNC4xOC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTguMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RuZi9kbmZfNC4xOC4yLmJiCmluZGV4IGY2MGI0Nzk0YTYuLjk4N2NhNDJjOTgg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTguMS5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjE4LjIuYmIKQEAgLTE5LDcgKzE5LDcg
QEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2Ru
Zi5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2MKIAogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZl
ID0gImZpbGU6Ly8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCIKIAot
U1JDUkVWID0gIjQxYTI4N2UyYmQ2MGI0ZDExMDBjMzI5YTI3NDc3NmZmMzJiYTg3NDAiCitTUkNS
RVYgPSAiMWM0M2QwOTk5MTc4ZDQ5MjM4MWFkMGI0MzkxN2ZmZDljNzQwMTZmOCIKIFVQU1RSRUFN
X0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAogUyA9ICIke1dP
UktESVJ9L2dpdCIKLS0gCjIuNDIuMAoK

--===============5540567236581514002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-bash-completion: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-dbg: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-dbg: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-dev: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-dev: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-doc: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-doc: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ar: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-be: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-be: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bg: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-bn: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ca: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-cs: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-da: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-de: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-el: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eo: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-es: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-eu: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fa: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fi: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fil: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fr: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-fur: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gd: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-gu: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-he: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hi: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hr: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-hu: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-id: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ie: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-it: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ja: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ka: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-kk: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ko: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-lt: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ml: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-mr: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ms: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nb: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-nl: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-om: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-om: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-or: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pa: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pl: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-pt: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ru: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-si: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sk: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sl: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sq: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sr: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-sv: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-th: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-tr: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-uk: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-ur: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-vi: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-src: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-src: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-staticdev: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-test-dep: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf-test-main: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf-test-main: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf/dnf: PV changed from "4.18.1" to "4.18.2"
packages/core2-64-poky-linux/dnf/dnf: PKGSIZE changed from 957361 to 958861 (+0%)
packages/core2-64-poky-linux/dnf: PKGV changed from 4.18.1 [default] to 4.18.2 [default]
packages/core2-64-poky-linux/dnf: PV changed from "4.18.1" to "4.18.2"
Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.11/site-packages/dnf-4.18.1.dist-info moved to /usr/lib/python3.11/site-packages/dnf-4.18.2.dist-info

--===============5540567236581514002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/dnf (sysroot):
  /usr/lib/python3.11/site-packages/dnf-4.18.1.dist-info moved to /usr/lib/python3.11/site-packages/dnf-4.18.2.dist-info

--===============5540567236581514002==--

