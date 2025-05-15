Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1B8C54ED1
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.11023.1747312302710782673
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=T5Erwzrt;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CuJJQkYd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010196d3ee0afe-731c4eb9-c222-4e22-9317-3cc2fa9000f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312315;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ATLr5etQSRzq1QISPBY4DtBFqs//eC+xLmF7MX5Vv5E=;
	b=T5ErwzrtJzJkN+Pf9DBpdOmUi2M7kD3o8UjXqFj89dqGEcscWNf/J/fKoT8V1gju
	374MiC44wmw6KpN7Y17N+3rdA2ZwxEVREVbzgCSKNLI7uq6fOc8kD8RwwoVD/OxZ6i7
	PBSKmWZvWW+qWeYsDvofbZk9j9X0zUIqjvBUYKtA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312315;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ATLr5etQSRzq1QISPBY4DtBFqs//eC+xLmF7MX5Vv5E=;
	b=CuJJQkYdaKKEUknFShyqa5GKbOS8vrM9IBUiTetpnX61j/PQvb2pXl7ws9OE+BE3
	i0ziIoxoJPe37Ovi5ngQrwU/fLdBcjyZutYBekL9chFnTq+K8hSQGw00HzrLYB0Rucg
	JAB9nhAAOuei8jzM8IIZlinlUVAICOZLErvt/4G8=
Content-Type: multipart/mixed; boundary="===============4656734012190686811=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools: upgrading to 80.7.1 FAILED
Message-ID: <01010196d3ee0afe-731c4eb9-c222-4e22-9317-3cc2fa9000f9-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216614

--===============4656734012190686811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools* to *80.7.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-upgrade-78.1.0-80.7.1.patch
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
From e46d7894f77508bf8518628cc2818cf322e540ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 08:14:21 +0000
Subject: [PATCH] python3-setuptools: upgrade 78.1.0 -> 80.7.1

---
 ...tutils-sysconfig.py-make-it-possible-to-substite.patch | 8 ++++----
 ...-conditionally-do-not-fetch-code-by-easy_install.patch | 2 +-
 ...-setuptools_78.1.0.bb => python3-setuptools_80.7.1.bb} | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_78.1.0.bb => python3-setuptools_80.7.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 8ccffeef1d..be83443cec 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From c3d2c40e10f24724ab2e3d5f236823f3076c7aec Mon Sep 17 00:00:00 2001
+From e8e343b03a8e539c8d3727176a980280483e8893 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -20,7 +20,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/setuptools/_distutils/sysconfig.py b/setuptools/_distutils/sysconfig.py
-index e5facae..0932f6f 100644
+index 7ddc869..01a06af 100644
 --- a/setuptools/_distutils/sysconfig.py
 +++ b/setuptools/_distutils/sysconfig.py
 @@ -134,6 +134,8 @@ def get_python_inc(plat_specific: bool = False, prefix: str | None = None) -> st
@@ -32,7 +32,7 @@ index e5facae..0932f6f 100644
      resolved_prefix = prefix if prefix is not None else default_prefix
      # MinGW imitates posix like layout, but os.name != posix
      os_name = "posix" if is_mingw() else os.name
-@@ -256,7 +258,13 @@ def get_python_lib(
+@@ -246,7 +248,13 @@ def get_python_lib(
  
      early_prefix = prefix
  
@@ -47,7 +47,7 @@ index e5facae..0932f6f 100644
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
          else:
-@@ -271,7 +279,7 @@ def get_python_lib(
+@@ -261,7 +269,7 @@ def get_python_lib(
              # Pure Python
              libdir = "lib"
          implementation = 'pypy' if IS_PYPY else 'python'
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 785a2192c3..4f1da93b6d 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 92363514224b0aeba065f83b868a15a2a03601ab Mon Sep 17 00:00:00 2001
+From 570d455b3ca0442f0d20f68a0e8ee80a711c542a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_78.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_80.7.1.bb
index 7455ec41af..aa1f335073 100644
--- a/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "18fd474d4a82a5f83dac888df697af65afa82dec7323d09c3e37d1f14288da54"
+SRC_URI[sha256sum] = "f6ffc5f0142b1bd8d0ca94ee91b30c0ca862ffd50826da1ea85258a06fd94552"
 
 DEPENDS += "python3"
 
-- 
2.47.1


--===============4656734012190686811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1918 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:94c3615118ae61c370e8153fcad7ecbf884a73b8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 391 Local 191 Mirrors 0 Missed 200 Current 267 (48% match, 69% complete)
Removing 9 stale sstate objects for arch x86_64...done.
Removing 23 stale sstate objects for arch core2-64...done.
Removing 52 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 377 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 385 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 390 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 391 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 397 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 399 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc-locale_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 406 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 407 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 408 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 415 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 418 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 424 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 433 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 446 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 450 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 454 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glibc-locale-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 455 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 456 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 459 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.192-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 466 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 469 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 471 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 472 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 476 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 477 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 482 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 483 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 484 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 486 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 487 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 489 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 491 of 658 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 496 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 498 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.44-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 500 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 501 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 506 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 508 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 512 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 513 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 515 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 520 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 521 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 526 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 527 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 529 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 530 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 540 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 549 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 550 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 555 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 559 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 561 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 567 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 568 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 570 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 572 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 575 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 576 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 577 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 579 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 583 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 584 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 585 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 587 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 588 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 589 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 591 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 592 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 594 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 598 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 601 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 603 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 605 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 608 of 658 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 611 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 613 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 615 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 616 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 617 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 620 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 622 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 623 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 625 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 626 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 635 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 637 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 640 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 647 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 650 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxcrypt-4.4.38-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 653 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 510 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_recipe_qa)
NOTE: Running task 548 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: Running task 608 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running noexec task 616 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_fetch)
NOTE: Running noexec task 624 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_fetch)
NOTE: Running task 626 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: recipe python3-setuptools-native-80.7.1-r0: task do_recipe_qa: Started
NOTE: Running task 642 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: Running task 706 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 715 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: Running task 740 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-80.7.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 753 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 755 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 758 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: Running task 759 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_fetch)
NOTE: recipe python3-setuptools-native-80.7.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-80.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 761 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: Running task 762 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.5.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-native-80.7.1-r0: task do_unpack: Started
NOTE: Running task 817 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_configure)
NOTE: Running task 822 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_unpack)
NOTE: Running task 823 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_unpack)
NOTE: Running task 825 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_fetch)
NOTE: recipe python3-setuptools-native-80.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-native-80.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 888 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_fetch)
NOTE: Running task 889 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_patch)
NOTE: Running task 891 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Started
NOTE: Running task 899 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_fetch)
NOTE: recipe attr-2.5.2-r0: task do_fetch: Started
NOTE: Running task 903 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: Running task 904 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_fetch)
NOTE: recipe openssl-3.5.0-r0: task do_unpack: Started
NOTE: Running task 905 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_fetch)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 906 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Started
NOTE: Running task 907 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-native-80.7.1-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Started
NOTE: recipe nettle-3.10.1-r0: task do_fetch: Started
NOTE: Running task 908 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe libgpg-error-1.55-r0: task do_fetch: Started
NOTE: Running task 910 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe nettle-3.10.1-r0: task do_fetch: Succeeded
NOTE: Running task 911 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.55-r0: task do_fetch: Succeeded
NOTE: Running task 913 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_fetch)
NOTE: recipe zlib-1.3.1-r0: task do_patch: Started
NOTE: Running task 915 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_fetch)
NOTE: Running task 916 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 917 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_fetch: Succeeded
NOTE: Running task 918 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe xz-5.8.1-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-native-80.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_compile: Started
NOTE: recipe expat-2.7.1-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 925 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_unpack)
NOTE: Running task 927 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_fetch)
NOTE: Running task 928 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_unpack)
NOTE: Running task 933 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: recipe attr-2.5.2-r0: task do_patch: Started
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 935 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: Running task 937 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_fetch: Started
NOTE: recipe expat-2.7.1-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 939 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Started
NOTE: Running task 940 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe gdbm-1.24-r0: task do_fetch: Succeeded
NOTE: Running task 943 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_fetch)
NOTE: recipe nettle-3.10.1-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.55-r0: task do_unpack: Started
NOTE: recipe attr-2.5.2-r0: task do_patch: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_unpack: Started
NOTE: Running task 946 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_fetch: Started
NOTE: recipe expat-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 947 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_patch)
NOTE: recipe libunistring-1.3-r0: task do_fetch: Succeeded
NOTE: Running task 951 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: recipe nettle-3.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 952 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_unpack: Started
NOTE: recipe xz-5.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 953 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_patch)
NOTE: recipe expat-2.7.1-r0: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: Running task 954 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_patch)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_unpack: Succeeded
NOTE: Running task 966 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_patch)
NOTE: Running task 967 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_write_config)
NOTE: recipe libgpg-error-1.55-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_patch: Started
NOTE: Running task 968 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_patch)
NOTE: recipe xz-5.8.1-r0: task do_patch: Started
NOTE: recipe expat-2.7.1-r0: task do_patch: Succeeded
NOTE: Running task 969 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 970 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_unpack: Succeeded
NOTE: Running task 971 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb:do_patch)
NOTE: recipe gdbm-1.24-r0: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Started
NOTE: recipe libgpg-error-1.55-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_unpack: Started
NOTE: recipe xz-5.8.1-r0: task do_patch: Succeeded
NOTE: Running task 972 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: Running task 976 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe libpam-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: Running task 978 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Started
NOTE: recipe libpam-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 981 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_generate_toolchain_file)
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe gdbm-1.24-r0: task do_patch: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_fetch: Started
NOTE: Running task 988 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe libxcrypt-4.4.38-r0: task do_patch: Succeeded
NOTE: Running task 991 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_fetch)
NOTE: recipe curl-8.12.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 993 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_fetch)
NOTE: recipe nettle-3.10.1-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 995 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_unpack)
NOTE: Running task 996 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libgpg-error-1.55-r0: task do_patch: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: Running task 999 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_fetch)
NOTE: Running task 1004 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_fetch)
NOTE: Running task 1006 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_fetch)
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe libunistring-1.3-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Started
NOTE: Running task 1007 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_patch)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 1008 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1011 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_fetch)
NOTE: Running task 1012 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe curl-8.12.1-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_compile: Succeeded
NOTE: recipe libcap-2.75-r0: task do_fetch: Started
NOTE: recipe json-c-0.18-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.75-r0: task do_fetch: Succeeded
NOTE: Running task 1013 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_install)
NOTE: recipe json-c-0.18-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_patch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Succeeded
NOTE: Running task 1018 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_unpack)
NOTE: Running task 1019 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: Running task 1020 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.0-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_fetch: Started
NOTE: Running task 1021 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_patch)
NOTE: recipe libgcrypt-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.9-r0: task do_fetch: Succeeded
NOTE: Running task 1023 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_fetch)
NOTE: Running task 1024 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Started
NOTE: Running task 1034 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.18-r0: task do_unpack: Started
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1041 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_fetch)
NOTE: Running task 1042 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_fetch)
NOTE: Running task 1044 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_fetch)
NOTE: Running task 1046 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_fetch)
NOTE: recipe openssl-3.5.0-r0: task do_patch: Started
NOTE: recipe json-c-0.18-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Started
NOTE: Running task 1047 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.75-r0: task do_unpack: Started
NOTE: Running task 1048 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_patch)
NOTE: Running task 1049 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_unpack)
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.8-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_fetch: Succeeded
NOTE: Running task 1050 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_fetch: Succeeded
NOTE: Running task 1051 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_unpack)
NOTE: Running task 1052 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_unpack)
NOTE: Running task 1054 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_fetch)
NOTE: recipe json-c-0.18-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.75-r0: task do_unpack: Succeeded
NOTE: recipe curl-8.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 1055 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_patch)
NOTE: Running task 1056 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_patch)
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.9-r0: task do_unpack: Started
NOTE: recipe json-c-0.18-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1059 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_patch)
NOTE: Running task 1062 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_unpack)
NOTE: recipe python3-3.13.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.75-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1063 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_unpack)
NOTE: recipe curl-8.12.1-r0: task do_patch: Started
NOTE: recipe libcap-2.75-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 1064 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_unpack)
NOTE: Running task 1065 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_unpack)
NOTE: recipe openssl-3.5.0-r0: task do_patch: Succeeded
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_install: Succeeded
NOTE: Running task 1067 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_unpack)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_patch: Started
NOTE: Running task 1068 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 1073 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_generate_toolchain_file)
NOTE: recipe curl-8.12.1-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_unpack: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Started
NOTE: Running task 1077 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_unpack: Succeeded
NOTE: Running task 1079 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_collect_spdx_deps)
NOTE: recipe libedit-20250104-3.1-r1: task do_unpack: Succeeded
NOTE: Running task 1080 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_patch)
NOTE: Running task 1081 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_patch)
NOTE: recipe libffi-3.4.8-r0: task do_unpack: Succeeded
NOTE: Running task 1082 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe json-c-0.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-3.13.2-r0: task do_unpack: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1091 of 1878 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_collect_spdx_deps)
NOTE: recipe json-c-0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Started
NOTE: Running task 1096 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_fetch)
NOTE: recipe python3-setuptools-native-80.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: Running task 1097 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: recipe libffi-3.4.8-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-80.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_fetch: Started
NOTE: Running task 1099 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_fetch)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_patch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: Running task 1103 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_fetch)
NOTE: Running task 1104 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_fetch)
NOTE: Running task 1105 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: recipe python3-jinja2-native-3.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Running task 1106 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: Running task 1108 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_fetch)
NOTE: recipe libedit-20250104-3.1-r1: task do_patch: Succeeded
NOTE: Running task 1110 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_unpack)
NOTE: recipe file-5.46-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.8-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.9-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1112 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_patch)
NOTE: Running task 1113 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_fetch: Succeeded
NOTE: Running task 1115 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_unpack)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: Running task 1116 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_unpack)
NOTE: recipe elfutils-0.192-r0: task do_fetch: Started
NOTE: recipe lzlib-1.15-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1119 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_patch)
NOTE: recipe lzlib-1.15-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_fetch: Succeeded
NOTE: Running task 1120 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running task 1121 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 656 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.9-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.9-r0: task do_unpack: Started
NOTE: recipe file-5.46-r0: task do_fetch: Succeeded
NOTE: Running task 1132 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_patch)
NOTE: Running task 1133 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_unpack)
NOTE: Running task 1134 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_fetch)
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Started
NOTE: recipe lzlib-1.15-r0: task do_patch: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1135 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_patch)
NOTE: recipe file-5.46-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Started
NOTE: recipe coreutils-9.6-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_patch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_patch: Succeeded
NOTE: Running task 1137 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe coreutils-9.6-r0: task do_fetch: Succeeded
NOTE: Running task 1138 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_fetch)
NOTE: Running task 1140 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.9-r0: task do_unpack: Succeeded
NOTE: Running task 1141 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_patch)
NOTE: recipe gnutls-3.8.9-r0: task do_patch: Succeeded
NOTE: Running task 1144 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe bash-5.2.37-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1146 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 1147 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_recipe_qa)
NOTE: Running task 1150 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_fetch)
NOTE: recipe bash-5.2.37-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_patch: Started
NOTE: Running task 1151 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_unpack)
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1152 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1153 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: Setscene tasks completed
NOTE: recipe python3-setuptools-80.7.1-r0: task do_recipe_qa: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe libarchive-3.7.9-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1186 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_unpack)
NOTE: Running task 1190 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_fetch)
NOTE: Running task 1192 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: Running task 1207 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_fetch: Succeeded
NOTE: Running task 1220 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_fetch)
NOTE: Running task 1221 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_unpack)
NOTE: Running task 1223 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe file-5.46-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_patch: Succeeded
NOTE: Running task 1224 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: Running task 1225 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_patch)
NOTE: recipe python3-setuptools-80.7.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1227 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_fetch)
NOTE: Running task 1228 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_fetch)
NOTE: Running task 1229 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_unpack: Succeeded
NOTE: recipe file-5.46-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: Running task 1230 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_patch)
NOTE: recipe coreutils-9.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-80.7.1-r0: task do_fetch: Started
NOTE: recipe binutils-2.44-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: Running task 1231 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_patch)
NOTE: recipe python3-setuptools-80.7.1-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_unpack: Succeeded
NOTE: Running task 1232 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_unpack)
NOTE: recipe binutils-2.44-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1233 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_patch)
NOTE: Running task 1234 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_patch)
NOTE: Running task 1241 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Started
NOTE: Running task 1253 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1283 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_unpack)
NOTE: recipe coreutils-9.6-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-80.7.1-r0: task do_unpack: Started
NOTE: Running noexec task 1301 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_patch: Started
NOTE: Running task 1318 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe binutils-2.44-r0: task do_unpack: Started
NOTE: recipe python3-3.13.2-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Started
NOTE: recipe file-5.46-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-80.7.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: Running task 1328 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_patch)
NOTE: recipe python3-setuptools-80.7.1-r0: task do_patch: Started
NOTE: recipe elfutils-0.192-r0: task do_unpack: Succeeded
NOTE: Running task 1329 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_patch: Started
NOTE: recipe coreutils-9.6-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-80.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1333 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1334 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_populate_lic)
NOTE: recipe base-passwd-3.6.7-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-80.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-80.7.1-r0: task do_populate_lic: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1336 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_patch)
NOTE: recipe bash-5.2.37-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-80.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_unpack: Succeeded
NOTE: Running task 1339 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_patch)
NOTE: recipe shadow-4.17.3-r0: task do_patch: Started
NOTE: recipe elfutils-0.192-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.17.3-r0: task do_patch: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.44-r0: task do_unpack: Succeeded
NOTE: Running task 1343 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_patch)
NOTE: recipe binutils-2.44-r0: task do_patch: Started
NOTE: recipe python3-setuptools-native-80.7.1-r0: task do_patch: Failed
NOTE: recipe binutils-2.44-r0: task do_patch: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-80.7.1-r0: task do_populate_lic: Failed
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: Tasks Summary: Attempted 1343 tasks of which 1174 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515081121.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515081121.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-native/80.7.1/temp/log.do_patch.506544
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_populate_lic
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools/80.7.1/temp/log.do_populate_lic.514768
Summary: There were 3 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-native-80.7.1-r0 do_patch: Applying patch '0001-conditionally-do-not-fetch-code-by-easy_install.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-native/80.7.1/setuptools-80.7.1'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-native/80.7.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-conditionally-do-not-fetch-code-by-easy_install.patch
patching file setuptools/command/easy_install.py
Hunk #1 FAILED at 672.
1 out of 1 hunk FAILED -- rejects in file setuptools/command/easy_install.py
Patch 0001-conditionally-do-not-fetch-code-by-easy_install.patch does not apply (enforce with -f)

stderr: ')
ERROR: python3-setuptools-80.7.1-r0 do_populate_lic: QA Issue: python3-setuptools: The LIC_FILES_CHKSUM does not match for file://LICENSE;md5=141643e11c48898150daa83802dbc65f
python3-setuptools: The new md5 checksum is 1aeae65f25a15b1e46d4381f2f094e0a
python3-setuptools: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
MIT License

Copyright (c) 2025 <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
USE OR OTHER DEALINGS IN THE SOFTWARE.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
python3-setuptools: Check if the license information has changed in /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools/80.7.1/setuptools-80.7.1/LICENSE to verify that the LICENSE value "MIT" remains valid [license-checksum]
ERROR: python3-setuptools-80.7.1-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-native/80.7.1/temp/log.do_patch.506544
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-setuptools/80.7.1/temp/log.do_populate_lic.514768
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.7.1.bb:do_populate_lic) failed with exit code '1'

--===============4656734012190686811==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-upgrade-78.1.0-80.7.1.patch"

RnJvbSBlNDZkNzg5NGY3NzUwOGJmODUxODYyOGNjMjgxOGNmMzIyZTU0MGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDg6MTQ6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHM6IHVwZ3JhZGUgNzguMS4wIC0+IDgwLjcuMQoKLS0tCiAuLi50dXRp
bHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2ggfCA4ICsr
KystLS0tCiAuLi4tY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3Rh
bGwucGF0Y2ggfCAyICstCiAuLi4tc2V0dXB0b29sc183OC4xLjAuYmIgPT4gcHl0aG9uMy1zZXR1
cHRvb2xzXzgwLjcuMS5iYn0gfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tw
eXRob24zLXNldHVwdG9vbHNfNzguMS4wLmJiID0+IHB5dGhvbjMtc2V0dXB0b29sc184MC43LjEu
YmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3Np
YmxlLXRvLXN1YnN0aXRlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLXNldHVwdG9vbHMvMDAwMS1fZGlzdHV0aWxzLXN5c2NvbmZpZy5weS1tYWtlLWl0LXBvc3Np
YmxlLXRvLXN1YnN0aXRlLnBhdGNoCmluZGV4IDhjY2ZmZWVmMWQuLmJlODM0NDNjZWMgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAw
MDEtX2Rpc3R1dGlscy1zeXNjb25maWcucHktbWFrZS1pdC1wb3NzaWJsZS10by1zdWJzdGl0ZS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29s
cy8wMDAxLV9kaXN0dXRpbHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3Rp
dGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGMzZDJjNDBlMTBmMjQ3MjRhYjJlM2Q1ZjIz
NjgyM2YzMDc2YzdhZWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU4ZTM0M2IwM2E4
ZTUzOWM4ZDM3MjcxNzZhOTgwMjgwNDgzZTg4OTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogV2VkLCAx
MSBNYXkgMjAyMiAyMTo0MToxNCArMDIwMAogU3ViamVjdDogW1BBVENIXSBfZGlzdHV0aWxzL3N5
c2NvbmZpZy5weTogbWFrZSBpdCBwb3NzaWJsZSB0byBzdWJzdGl0ZSB0aGUKQEAgLTIwLDcgKzIw
LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5k
ZT4KICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAog
ZGlmZiAtLWdpdCBhL3NldHVwdG9vbHMvX2Rpc3R1dGlscy9zeXNjb25maWcucHkgYi9zZXR1cHRv
b2xzL19kaXN0dXRpbHMvc3lzY29uZmlnLnB5Ci1pbmRleCBlNWZhY2FlLi4wOTMyZjZmIDEwMDY0
NAoraW5kZXggN2RkYzg2OS4uMDFhMDZhZiAxMDA2NDQKIC0tLSBhL3NldHVwdG9vbHMvX2Rpc3R1
dGlscy9zeXNjb25maWcucHkKICsrKyBiL3NldHVwdG9vbHMvX2Rpc3R1dGlscy9zeXNjb25maWcu
cHkKIEBAIC0xMzQsNiArMTM0LDggQEAgZGVmIGdldF9weXRob25faW5jKHBsYXRfc3BlY2lmaWM6
IGJvb2wgPSBGYWxzZSwgcHJlZml4OiBzdHIgfCBOb25lID0gTm9uZSkgLT4gc3QKQEAgLTMyLDcg
KzMyLDcgQEAgaW5kZXggZTVmYWNhZS4uMDkzMmY2ZiAxMDA2NDQKICAgICAgcmVzb2x2ZWRfcHJl
Zml4ID0gcHJlZml4IGlmIHByZWZpeCBpcyBub3QgTm9uZSBlbHNlIGRlZmF1bHRfcHJlZml4CiAg
ICAgICMgTWluR1cgaW1pdGF0ZXMgcG9zaXggbGlrZSBsYXlvdXQsIGJ1dCBvcy5uYW1lICE9IHBv
c2l4CiAgICAgIG9zX25hbWUgPSAicG9zaXgiIGlmIGlzX21pbmd3KCkgZWxzZSBvcy5uYW1lCi1A
QCAtMjU2LDcgKzI1OCwxMyBAQCBkZWYgZ2V0X3B5dGhvbl9saWIoCitAQCAtMjQ2LDcgKzI0OCwx
MyBAQCBkZWYgZ2V0X3B5dGhvbl9saWIoCiAgCiAgICAgIGVhcmx5X3ByZWZpeCA9IHByZWZpeAog
IApAQCAtNDcsNyArNDcsNyBAQCBpbmRleCBlNWZhY2FlLi4wOTMyZjZmIDEwMDY0NAogICAgICAg
ICAgaWYgc3RhbmRhcmRfbGliOgogICAgICAgICAgICAgIHByZWZpeCA9IHBsYXRfc3BlY2lmaWMg
YW5kIEJBU0VfRVhFQ19QUkVGSVggb3IgQkFTRV9QUkVGSVgKICAgICAgICAgIGVsc2U6Ci1AQCAt
MjcxLDcgKzI3OSw3IEBAIGRlZiBnZXRfcHl0aG9uX2xpYigKK0BAIC0yNjEsNyArMjY5LDcgQEAg
ZGVmIGdldF9weXRob25fbGliKAogICAgICAgICAgICAgICMgUHVyZSBQeXRob24KICAgICAgICAg
ICAgICBsaWJkaXIgPSAibGliIgogICAgICAgICAgaW1wbGVtZW50YXRpb24gPSAncHlweScgaWYg
SVNfUFlQWSBlbHNlICdweXRob24nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNo
LWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXNldHVwdG9vbHMvMDAwMS1jb25kaXRpb25hbGx5LWRvLW5vdC1mZXRjaC1jb2Rl
LWJ5LWVhc3lfaW5zdGFsbC5wYXRjaAppbmRleCA3ODVhMjE5MmMzLi40ZjFkYTkzYjZkIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29scy8w
MDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNvZGUtYnktZWFzeV9pbnN0YWxsLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLzAw
MDEtY29uZGl0aW9uYWxseS1kby1ub3QtZmV0Y2gtY29kZS1ieS1lYXN5X2luc3RhbGwucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDkyMzYzNTE0MjI0YjBhZWJhMDY1ZjgzYjg2OGExNWEyYTAz
NjAxYWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU3MGQ0NTViM2NhMDQ0MmYwZDIw
ZjY4YTBlOGVlODBhNzExYzU0MmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25n
eHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE3IEp1bCAyMDE4
IDEwOjEzOjM4ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmRpdGlvbmFsbHkgZG8gbm90IGZl
dGNoIGNvZGUgYnkgZWFzeV9pbnN0YWxsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc183OC4xLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0b29sc184MC43LjEuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNl
dHVwdG9vbHNfNzguMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtc2V0dXB0b29sc184MC43LjEuYmIKaW5kZXggNzQ1NWVjNDFhZi4uYWExZjMzNTA3
MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVw
dG9vbHNfNzguMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1zZXR1cHRvb2xzXzgwLjcuMS5iYgpAQCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJOmFwcGVuZDpj
bGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly8wMDAxLWNvbmRpdGlvbmFsbHktZG8tbm90LWZldGNoLWNv
ZGUtYnktZQogU1JDX1VSSSArPSAiIFwKICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLV9kaXN0dXRp
bHMtc3lzY29uZmlnLnB5LW1ha2UtaXQtcG9zc2libGUtdG8tc3Vic3RpdGUucGF0Y2giCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICIxOGZkNDc0ZDRhODJhNWY4M2RhYzg4OGRmNjk3YWY2NWFmYTgy
ZGVjNzMyM2QwOWMzZTM3ZDFmMTQyODhkYTU0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY2ZmZj
NWYwMTQyYjFiZDhkMGNhOTRlZTkxYjMwYzBjYTg2MmZmZDUwODI2ZGExZWE4NTI1OGEwNmZkOTQ1
NTIiCiAKIERFUEVORFMgKz0gInB5dGhvbjMiCiAKLS0gCjIuNDcuMQoK

--===============4656734012190686811==--

