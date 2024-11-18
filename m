Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03509D60041
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.4798.1731964613643664920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gIfbuEse;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=rIWvoq/W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101934122aff2-c71c592d-47b3-4161-b34d-067220e42175-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G/SMSiI3Wb3+JNI2UvcsDONCI+ff52+wwUe9W1b7JLs=;
	b=gIfbuEseRmi6QyPqTBAPKIIl4IKSeVw5M5Ab0TLceHht4/RJ6M67VEESej9EijY5
	fjKXclrO9FQeOUFu1S5ywzYEkT5OZYzrXqAhRaUuOb/93h24Jrf8JLOAC78ecV3TI2C
	gaNt1UBYCGWCR0xdgzhCZS6bkQNzDiq2Uz1zKajU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964612;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G/SMSiI3Wb3+JNI2UvcsDONCI+ff52+wwUe9W1b7JLs=;
	b=rIWvoq/WJpdi8bQIYDAlRXFN992eSyF/iTKezZNXyiKBZ1N+rKEwKbgb4O+3BvPg
	Q5CIt8RPbcml8kJnhIHXaCsgpi5f1OcyTW60HvmHXm95ndcn4nJRuBLda6b8mkiHmch
	eEmOT/G9Po3P/NhoCIjKjTvaBREdvQjcJipscfyM=
Content-Type: multipart/mixed; boundary="===============8637581827634697326=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 1.2.0 SUCCEEDED
Message-ID: <010101934122aff2-c71c592d-47b3-4161-b34d-067220e42175-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:16:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207258

--===============8637581827634697326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *createrepo-c* to *1.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-1.1.4-1.2.0.patch
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
From cb002d6ab9c68eb8ede2c5fce1b255fb250b7ae3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 08:13:50 +0000
Subject: [PATCH] createrepo-c: upgrade 1.1.4 -> 1.2.0

---
 ...001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 5 +----
 .../createrepo-c/0001-include-rpm-rpmstring.h.patch          | 5 ++---
 .../{createrepo-c_1.1.4.bb => createrepo-c_1.2.0.bb}         | 2 +-
 3 files changed, 4 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.1.4.bb => createrepo-c_1.2.0.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index b63fe53944..1d2e81f281 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 6f8f6d151b831b60f6e7892aa9294a6361353c72 Mon Sep 17 00:00:00 2001
+From 5d974eddfd59291fbbf9bf9b352431d8565011d2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -23,6 +23,3 @@ index a31b14d..01fd8ca 100644
  INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
  
  MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
index b7e5710b39..e7f3d32e08 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
@@ -1,4 +1,4 @@
-From eb66326c3fc6e942282d01ddd56659c78ed7400b Mon Sep 17 00:00:00 2001
+From d1a474e4002b978a54c918d46423c35bfbadad8b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 13 Jan 2023 13:21:51 -0800
 Subject: [PATCH] include rpm/rpmstring.h
@@ -11,13 +11,12 @@ on 'rasprintf'; ISO C99 and later do not support implicit function declarations
 
 Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/340]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/xml_file.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/xml_file.c b/src/xml_file.c
-index d2400b8..871109c 100644
+index 44b38f9..de5176b 100644
 --- a/src/xml_file.c
 +++ b/src/xml_file.c
 @@ -19,6 +19,7 @@
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.4.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.1.4.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb
index 0a37c76187..60523d5318 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.4.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "a5a8990ff84b7977218976ea14c703330fb52875"
+SRCREV = "7085e047dc9f58a1de6ee6f3faf733826e60b963"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============8637581827634697326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.1.4", added "/usr/lib/libcreaterepo_c.so.1.2.0"
Changes to packages/core2-64-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.1.4 to libcreaterepo_c.so.1.2.0
  /usr/lib/libcreaterepo_c.so.1.1.4 moved to /usr/lib/libcreaterepo_c.so.1.2.0

--===============8637581827634697326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "1.1.4" to "1.2.0"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 1.1.4 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.1.1.4", added "/usr/lib/.debug/libcreaterepo_c.so.1.2.0"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "1.1.4" to "1.2.0"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 1.1.4 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1570312 to 1570232 (-0%)
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "1.1.4" to "1.2.0"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 1.1.4 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "1.1.4" to "1.2.0"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 1.1.4 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "1.1.4" to "1.2.0"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 1.1.4 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PV changed from "1.1.4" to "1.2.0"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 1.1.4 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1287870 to 1287717 (-0%)
packages/core2-64-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "1.1.4" to "1.2.0"
packages/core2-64-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 1.1.4 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.1.1.4", added "/usr/lib/libcreaterepo_c.so.1.2.0"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: PV changed from "1.1.4" to "1.2.0"
packages/core2-64-poky-linux/createrepo-c/createrepo-c: PKGV changed from 1.1.4 [default] to 1.2.0 [default]
packages/core2-64-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 563305 to 563391 (+0%)
packages/core2-64-poky-linux/createrepo-c: PV changed from "1.1.4" to "1.2.0"
packages/core2-64-poky-linux/createrepo-c: PKGV changed from 1.1.4 [default] to 1.2.0 [default]
Changes to packages/core2-64-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.1.4 to libcreaterepo_c.so.1.2.0
  /usr/lib/libcreaterepo_c.so.1.1.4 moved to /usr/lib/libcreaterepo_c.so.1.2.0

--===============8637581827634697326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1881 targets, 52 skipped, 0 masked, 0 errors.
Removing 54 recipes from the core2-64 sysroot...done.
Removing 67 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d9e8f7ccbe00db61fed0143ca05a619f91532332"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 557 Local 539 Mirrors 0 Missed 18 Current 228 (96% match, 97% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 233 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 234 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 241 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 246 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 247 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 248 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 249 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 255 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 256 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: Running setscene task 257 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 261 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 262 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 264 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 265 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 266 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_deb_setscene)
NOTE: recipe createrepo-c-1.2.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.13.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe lua-5.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 268 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_ipk_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 269 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 271 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_create_spdx_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_package_qa_setscene: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 272 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 273 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 274 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.13.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 275 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 276 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lua-5.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 280 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_create_spdx_setscene)
NOTE: Running setscene task 282 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.7.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.7.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 283 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.13.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 284 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_create_spdx_setscene)
NOTE: recipe rpm-1_4.19.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 285 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 286 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_create_spdx_setscene)
NOTE: recipe file-5.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 293 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe lua-5.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 294 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.13.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 303 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.0-r0: task do_package_write_ipk_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxml2/2.13.4/temp/log.do_packagedata_setscene.3080026
NOTE: recipe rpm-1_4.19.1.1-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 380 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_package_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 381 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.13.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lua-5.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 382 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/lua/lua_5.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 390 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 397 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2024b-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 404 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lua-5.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 406 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 409 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 414 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe tzdata-2024b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 424 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_create_spdx_setscene)
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 433 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 434 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.6.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 435 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 439 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 440 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 441 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_packagedata_setscene)
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 461 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.13.4-r0: task do_package_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.82.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 487 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_package_setscene)
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 495 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 862 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_fetch)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 873 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_recipe_qa)
NOTE: recipe gobject-introspection-1.82.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.44.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe createrepo-c-1.2.0-r0: task do_recipe_qa: Started
NOTE: Running setscene task 510 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 512 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rpm-1_4.19.1.1-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1047 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 519 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe createrepo-c-1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1053 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_fetch)
NOTE: Running setscene task 522 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 523 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_unpack: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-setuptools-72.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.14.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe createrepo-c-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1112 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_unpack)
NOTE: Running setscene task 540 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.14.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe createrepo-c-1.2.0-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe rpm-1_4.19.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1123 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_patch)
NOTE: recipe rpm-1_4.19.1.1-r0: task do_patch: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1124 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_patch)
NOTE: recipe createrepo-c-1.2.0-r0: task do_patch: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1125 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1126 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_generate_toolchain_file)
NOTE: recipe createrepo-c-1.2.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe createrepo-c-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.19.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1129 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_generate_toolchain_file)
NOTE: recipe rpm-1_4.19.1.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 541 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 545 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 547 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 559 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_package_setscene)
NOTE: Running setscene task 562 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.191-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 565 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 567 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 569 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 572 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1185 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_fetch)
NOTE: recipe libarchive-3.7.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 577 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.191-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_fetch: Succeeded
NOTE: Running task 1201 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 579 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 587 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 590 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 594 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_package_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 595 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 598 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 601 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1213 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 608 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 610 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_package_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 612 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 613 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1229 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 625 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 634 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 637 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 642 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.13.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 646 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 649 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 651 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 656 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 660 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 665 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 668 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 669 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 671 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 679 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 680 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 682 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 686 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 690 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 693 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 696 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 697 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 702 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 705 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 707 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 708 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 710 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1305 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: Running setscene task 712 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.50-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 721 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 722 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1337 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 730 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 752 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 755 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 766 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 769 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 777 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 784 of 785 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1919 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1983 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.4.bb:do_packagedata)
NOTE: Running task 2050 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.19.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.13.4-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxml2-2.13.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2147 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2149 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_configure)
NOTE: recipe rpm-1_4.19.1.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2150 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2151 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2152 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.191-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.191-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2153 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_create_spdx)
NOTE: recipe elfutils-0.191-r0: task do_create_spdx: Started
NOTE: recipe elfutils-0.191-r0: task do_create_spdx: Succeeded
NOTE: Running task 2154 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_collect_spdx_deps)
NOTE: recipe rpm-1_4.19.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe rpm-1_4.19.1.1-r0: task do_configure: Succeeded
NOTE: Running task 2155 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_compile)
NOTE: recipe rpm-1_4.19.1.1-r0: task do_compile: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_compile: Succeeded
NOTE: Running task 2156 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_install)
NOTE: recipe rpm-1_4.19.1.1-r0: task do_install: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_install: Succeeded
NOTE: Running task 2157 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_package)
NOTE: Running task 2158 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.19.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_package: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2159 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe createrepo-c-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2160 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_configure)
NOTE: recipe createrepo-c-1.2.0-r0: task do_configure: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 2161 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_compile)
NOTE: recipe createrepo-c-1.2.0-r0: task do_compile: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 2162 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_install)
NOTE: recipe rpm-1_4.19.1.1-r0: task do_package: Succeeded
NOTE: Running task 2163 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_packagedata)
NOTE: recipe createrepo-c-1.2.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_packagedata unihash changed to 240bbc695cf7bd0214264f947c21148d81128267aef1613ae0bd112ef57ab37f
NOTE: Setscene tasks completed
NOTE: Running task 2164 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rpm/rpm_4.19.1.1.bb:do_create_spdx)
NOTE: recipe rpm-1_4.19.1.1-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2165 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_package)
NOTE: Running task 2166 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-1.2.0-r0: task do_package: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe rpm-1_4.19.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2167 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe createrepo-c-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe createrepo-c-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe createrepo-c-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 2168 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_packagedata)
NOTE: recipe createrepo-c-1.2.0-r0: task do_packagedata: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2169 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_create_spdx)
NOTE: Running task 2170 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_package_write_ipk)
NOTE: Running task 2171 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_package_write_deb)
NOTE: Running task 2172 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_package_write_rpm)
NOTE: Running task 2173 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_package_qa)
NOTE: recipe createrepo-c-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_package_write_ipk: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_package_write_deb: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_package_qa: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2174 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_create_package_spdx)
NOTE: recipe createrepo-c-1.2.0-r0: task do_create_package_spdx: Started
NOTE: recipe createrepo-c-1.2.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe createrepo-c-1.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe createrepo-c-1.2.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe createrepo-c-1.2.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe createrepo-c-1.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2175 of 2175 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2175 tasks of which 2128 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.13.5-r0 to 0:2.13.4-r0) [version-going-backwards]
ERROR: libxml2-2.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.13.5-r0 to 0:2.13.4-r0) [version-going-backwards]
ERROR: libxml2-2.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.13.5-r0 to 0:2.13.4-r0) [version-going-backwards]
ERROR: libxml2-2.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.13.5-r0 to 0:2.13.4-r0) [version-going-backwards]
ERROR: libxml2-2.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.13.5-r0 to 0:2.13.4-r0) [version-going-backwards]
ERROR: libxml2-2.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.13.5-r0 to 0:2.13.4-r0) [version-going-backwards]
ERROR: libxml2-2.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.13.5-r0 to 0:2.13.4-r0) [version-going-backwards]
ERROR: libxml2-2.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.13.5-r0 to 0:2.13.4-r0) [version-going-backwards]
ERROR: libxml2-2.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.13.5-r0 to 0:2.13.4-r0) [version-going-backwards]
ERROR: libxml2-2.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.13.5-r0 to 0:2.13.4-r0) [version-going-backwards]
ERROR: libxml2-2.13.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8637581827634697326==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-1.1.4-1.2.0.patch"

RnJvbSBjYjAwMmQ2YWI5YzY4ZWI4ZWRlMmM1ZmNlMWIyNTVmYjI1MGI3YWUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMDg6MTM6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cmVhdGVyZXBvLWM6IHVwZ3JhZGUgMS4xLjQgLT4gMS4yLjAKCi0tLQogLi4uMDAxLURvLW5vdC1z
ZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoIHwgNSArLS0tLQog
Li4uL2NyZWF0ZXJlcG8tYy8wMDAxLWluY2x1ZGUtcnBtLXJwbXN0cmluZy5oLnBhdGNoICAgICAg
ICAgIHwgNSArKy0tLQogLi4uL3tjcmVhdGVyZXBvLWNfMS4xLjQuYmIgPT4gY3JlYXRlcmVwby1j
XzEuMi4wLmJifSAgICAgICAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJl
cG8tYy97Y3JlYXRlcmVwby1jXzEuMS40LmJiID0+IGNyZWF0ZXJlcG8tY18xLjIuMC5iYn0gKDk2
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0
ZXJlcG8tYy8wMDAxLURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0
aG9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBv
LWMvMDAwMS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhvbi5w
YXRjaAppbmRleCBiNjNmZTUzOTQ0Li4xZDJlODFmMjgxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLURvLW5vdC1zZXQtUFlU
SE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtRG8tbm90LXNldC1QWVRI
T05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDZmOGY2ZDE1MWI4MzFiNjBmNmU3ODkyYWE5Mjk0YTYzNjEzNTNjNzIgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDVkOTc0ZWRkZmQ1OTI5MWZiYmY5YmY5YjM1MjQzMWQ4NTY1MDEx
ZDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6MzE6MDIgKzAy
MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHNldCBQWVRIT05fSU5TVEFMTF9ESVIgYnkgcnVu
bmluZyBweXRob24KQEAgLTIzLDYgKzIzLDMgQEAgaW5kZXggYTMxYjE0ZC4uMDFmZDhjYSAxMDA2
NDQKICBJTkNMVURFX0RJUkVDVE9SSUVTICgke1BZVEhPTl9JTkNMVURFX1BBVEh9KQogIAogIE1F
U1NBR0UoU1RBVFVTICJQeXRob24gaW5zdGFsbCBkaXIgaXMgJHtQWVRIT05fSU5TVEFMTF9ESVJ9
IikKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVh
dGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLWlu
Y2x1ZGUtcnBtLXJwbXN0cmluZy5oLnBhdGNoCmluZGV4IGI3ZTU3MTBiMzkuLmU3ZjNkMzJlMDgg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVw
by1jLzAwMDEtaW5jbHVkZS1ycG0tcnBtc3RyaW5nLmgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWMvMDAwMS1pbmNsdWRlLXJwbS1ycG1z
dHJpbmcuaC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZWI2NjMyNmMzZmM2ZTk0MjI4MmQw
MWRkZDU2NjU5Yzc4ZWQ3NDAwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDFhNDc0
ZTQwMDJiOTc4YTU0YzkxOGQ0NjQyM2MzNWJmYmFkYWQ4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEzIEph
biAyMDIzIDEzOjIxOjUxIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGluY2x1ZGUgcnBtL3JwbXN0
cmluZy5oCkBAIC0xMSwxMyArMTEsMTIgQEAgb24gJ3Jhc3ByaW50Zic7IElTTyBDOTkgYW5kIGxh
dGVyIGRvIG5vdCBzdXBwb3J0IGltcGxpY2l0IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucwogCiBVcHN0
cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1t
YW5hZ2VtZW50L2NyZWF0ZXJlcG9fYy9wdWxsLzM0MF0KIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+Ci0KIC0tLQogIHNyYy94bWxfZmlsZS5jIHwgMSArCiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9zcmMveG1sX2ZpbGUu
YyBiL3NyYy94bWxfZmlsZS5jCi1pbmRleCBkMjQwMGI4Li44NzExMDljIDEwMDY0NAoraW5kZXgg
NDRiMzhmOS4uZGU1MTc2YiAxMDA2NDQKIC0tLSBhL3NyYy94bWxfZmlsZS5jCiArKysgYi9zcmMv
eG1sX2ZpbGUuYwogQEAgLTE5LDYgKzE5LDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMS40LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVyZXBvLWNfMS4yLjAuYmIKc2ltaWxhcml0eSBp
bmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9j
cmVhdGVyZXBvLWNfMS4xLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVh
dGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMi4wLmJiCmluZGV4IDBhMzdjNzYxODcuLjYwNTIzZDUz
MTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRl
cmVwby1jXzEuMS40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMv
Y3JlYXRlcmVwby1jXzEuMi4wLmJiCkBAIC05LDcgKzksNyBAQCBTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vcnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvY3JlYXRlcmVwb19jO2JyYW5jaD1tYXN0
ZXI7cAogICAgICAgICAgICBmaWxlOi8vMDAwMS1pbmNsdWRlLXJwbS1ycG1zdHJpbmcuaC5wYXRj
aCBcCiAgICAgICAgICAgICIKIAotU1JDUkVWID0gImE1YTg5OTBmZjg0Yjc5NzcyMTg5NzZlYTE0
YzcwMzMzMGZiNTI4NzUiCitTUkNSRVYgPSAiNzA4NWUwNDdkYzlmNThhMWRlNmVlNmYzZmFmNzMz
ODI2ZTYwYjk2MyIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40NC4xCgo=

--===============8637581827634697326==--

