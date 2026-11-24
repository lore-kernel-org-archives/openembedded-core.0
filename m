Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12517.1795501913533022780
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 22:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FnXbhp5v;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=daVTP2GO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a20c40f22c-f828af29-f14b-4603-9425-d947eb13cb3e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795501912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rgNhfgid6+EFjfoQAJFok6wMoDlcU4BB7040EzUpM+c=;
	b=FnXbhp5vgdNj+01QSeSt6kwUkGmo/HOIB07H7UhtlsKxeYS1Z0KzTMSMiTwy1vp5
	2dS6lQYbcaRaU7VfmhKWA063Gjx+AxGqqZ00TQJDn2rZZ+7qzWCMm1U5hnYPQrC4SSH
	pcaSqC7OMKa/Sz6JwdkTDL4Gh8EUZrfFkU1L7jE4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795501912;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rgNhfgid6+EFjfoQAJFok6wMoDlcU4BB7040EzUpM+c=;
	b=daVTP2GOLudK7btZ82QMrW1pQU1Zx22LGA0XJRW4FgMiINTG/pdqERXEx8Xy6Vnw
	M2m3k1C0bHppkLTzorNZLc1YVIACCxNHvuGu5QWJMY0640t1xAm6znI+6cvE5YLsuJm
	KN+G0uerlDAurwU6QP9v83J6AUiKTYaRTfvwxKw0=
Content-Type: multipart/mixed; boundary="===============2829210677061851505=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 7.3 SUCCEEDED
Message-ID: <010101a20c40f22c-f828af29-f14b-4603-9425-d947eb13cb3e-000000@us-west-2.amazonses.com>
Date: Tue, 24 Nov 2026 06:31:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.24-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 06:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250953

--===============2829210677061851505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *btrfs-tools* to *7.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-7.1-7.3.patch
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
From 271b2a4eca60925265c767c091c62848baf7ee6b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 24 Nov 2026 05:25:50 +0000
Subject: [PATCH] btrfs-tools: upgrade 7.1 -> 7.3

btrfs-progs-7.3 (2026-10-23)
----------------------------

btrfs-progs-7.2 (skipped)
-------------------------
---
 ...d-a-possibility-to-specify-where-python-modules-ar.patch | 6 +++---
 .../btrfs-tools/{btrfs-tools_7.1.bb => btrfs-tools_7.3.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_7.1.bb => btrfs-tools_7.3.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 7272c27c6c..d0f6cc0d33 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 7edcee57078769b7752275e0e5f35aefbfefc9eb Mon Sep 17 00:00:00 2001
+From 1d3a33b2944293190c4fd5d69f5fa4ca6ecea15c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 96c11830..3f2585cb 100644
+index 78c23ad3..e912474a 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -997,7 +997,7 @@ endif
+@@ -994,7 +994,7 @@ endif
  ifeq ($(PYTHON_BINDINGS),1)
  install_python: libbtrfsutil_python
  	$(Q)cd libbtrfsutil/python; \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb
index 1bc75a7de7..647b1bfa1f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb
@@ -17,7 +17,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "4ab0e80be9e3bb1db2e6038e6d4316d35fb7ba8b"
+SRCREV = "afdc3a65e33f4d42f768ad50dca20c32e5ee1496"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.47.1


--===============2829210677061851505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="btrfs-tools-changelog.txt"

btrfs-progs-7.3 (2026-10-23)
----------------------------

btrfs-progs-7.2 (skipped)
-------------------------

--===============2829210677061851505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.15/site-packages/btrfsutil-7.1-py3.15.egg-info -> /usr/lib/python3.15/site-packages/btrfsutil-7.3-py3.15.egg-info
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.15/site-packages/btrfsutil-7.1-py3.15.egg-info moved to /usr/lib/python3.15/site-packages/btrfsutil-7.3-py3.15.egg-info

--===============2829210677061851505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 963 .bb files complete (0 cached, 963 parsed). 2014 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-b3e094a2e643524be87b386f4445676cc029de6b"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:b3e094a2e643524be87b386f4445676cc029de6b"
meta-yocto-bsp       
meta-poky            = "master:6ee74fbbe3a36dabb7f8f85ee10691eaf8aa3252"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 461 Local 269 Mirrors 0 Missed 192 Current 297 (58% match, 74% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 337 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 377 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 409 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 411 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 416 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 418 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 421 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 422 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 430 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 437 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 439 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 443 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 444 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe tzdata-2026f-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20260816-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-7.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe btrfs-tools-7.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe ca-certificates-20260816-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 447 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 448 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libffi-3.8.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 451 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 453 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 454 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 455 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 456 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe tzdata-2026f-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 462 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 464 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 467 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 472 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 478 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 480 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 500 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe elfutils-0.197-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 508 of 758 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 512 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 517 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 526 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 535 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 538 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 545 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 546 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 548 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 551 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 553 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 555 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 557 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 562 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.197-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 568 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmicrohttpd-1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 569 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-3.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 571 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 573 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 576 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 577 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 579 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 583 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 586 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 589 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 590 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 592 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 593 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 594 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 596 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 599 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 601 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 602 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libffi-3.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 606 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 607 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 609 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 610 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 611 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 612 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 615 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 617 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 618 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 619 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 620 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 621 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 625 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_recipe_qa_setscene)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 626 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_spdx_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 627 of 758 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 628 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 629 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 631 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 632 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 634 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-4.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 636 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 638 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 639 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 640 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 641 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 642 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-native-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.197-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 643 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 646 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 647 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 648 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 649 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.197-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 654 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 655 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 660 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 661 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 662 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 664 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 665 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 667 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 668 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 670 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_11.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 674 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 676 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 677 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 678 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 679 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 680 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 682 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-native-11.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 684 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 685 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 686 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 687 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 689 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_spdx_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-native-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 690 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 691 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 692 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 693 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 694 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 696 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 698 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 699 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 700 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 701 of 758 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk-doc/gtk-doc_1.37.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 702 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 703 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 705 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 706 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 709 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 710 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 713 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-11.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 758 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.90.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 715 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.37.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 660 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 717 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running task 714 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_fetch)
NOTE: recipe libunistring-1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 766 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_fetch)
NOTE: Running task 771 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_write_config)
NOTE: Running task 774 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: Running task 776 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 778 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 719 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 720 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running task 784 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_fetch)
NOTE: Running task 788 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 723 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-1.4-r0: task do_fetch: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 724 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe openssl-4.1.0-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Started
NOTE: recipe xz-5.8.4-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.3-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.3-r0: task do_write_config: Started
NOTE: Running setscene task 725 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 726 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 790 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: Running task 791 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 727 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_package_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_write_config: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe glib-2.0-native-1_2.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe zlib-1.4-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 728 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 729 of 758 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 797 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: Running task 798 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_patch)
NOTE: Running task 802 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_unpack)
NOTE: Running task 806 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 807 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_unpack)
NOTE: Running task 810 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: Running task 813 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: Running task 814 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: Running task 816 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_fetch)
NOTE: Running task 820 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_patch: Started
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.5-r0: task do_fetch: Started
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: recipe xz-5.8.4-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.3-r0: task do_unpack: Started
NOTE: recipe meson-native-1.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.10.0-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 731 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.10.0-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 823 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_unpack)
NOTE: Running task 824 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 826 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 828 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe libunistring-1.5-r0: task do_fetch: Succeeded
NOTE: Running task 832 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe zlib-1.4-r0: task do_patch: Succeeded
NOTE: Running task 836 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_fetch)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Started
NOTE: recipe xz-5.8.4-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: Running task 837 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_patch)
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.3-r0: task do_unpack: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 838 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: Running task 839 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_unpack)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 843 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_fetch)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_fetch: Succeeded
NOTE: Running task 844 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: recipe xz-5.8.4-r0: task do_patch: Started
NOTE: recipe meson-native-1.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.3-r0: task do_patch: Started
NOTE: Running task 920 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_patch)
NOTE: Running task 922 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: Running task 923 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_unpack)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 924 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_fetch: Succeeded
NOTE: Running task 926 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_unpack)
NOTE: recipe xz-5.8.4-r0: task do_patch: Succeeded
NOTE: Running task 928 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_fetch)
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Started
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: Running task 929 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: recipe expat-2.10.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.3-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: Running task 932 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_fetch)
NOTE: recipe libgcc-16.2.0-r0: task do_package_setscene: Started
NOTE: Running task 934 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: Running task 935 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_unpack: Started
NOTE: Running task 936 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 938 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Started
NOTE: recipe expat-2.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 939 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_patch)
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Succeeded
NOTE: Running task 940 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: Running task 941 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.4-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: Running task 942 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_unpack)
NOTE: Running task 943 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.4-r0: task do_fetch: Succeeded
NOTE: Running task 945 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: recipe expat-2.10.0-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 949 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_unpack)
NOTE: Running task 950 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_unpack: Started
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe libunistring-1.5-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_patch: Succeeded
NOTE: Running task 951 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_patch)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_unpack: Succeeded
NOTE: Running task 952 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: Running task 953 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_unpack: Started
NOTE: Running task 954 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: Running task 955 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_unpack)
NOTE: recipe libgcc-16.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 733 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.5-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe libgcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 734 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 735 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 736 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: Running task 956 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 978 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_fetch)
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 980 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_fetch)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_patch: Succeeded
NOTE: Running task 983 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_generate_toolchain_file)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: Running task 993 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: Running task 999 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Started
NOTE: recipe curl-8.23.0-r0: task do_fetch: Started
NOTE: recipe expat-2.10.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe json-c-0.19-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe curl-8.23.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 739 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.19-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running setscene task 740 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Succeeded
NOTE: Running task 1000 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 1001 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1003 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.14.bb:do_recipe_qa)
NOTE: Running task 1007 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1008 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.14-r0: task do_recipe_qa: Started
NOTE: recipe libarchive-3.8.11-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 743 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.11-r0: task do_fetch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 744 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1020 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: Running task 1021 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: Running setscene task 754 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.19-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.14-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1030 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_fetch)
NOTE: Running task 1031 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_fetch)
NOTE: Running task 1032 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.14.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.19-r0: task do_unpack: Succeeded
NOTE: Running task 1033 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_patch)
NOTE: Running task 1034 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1035 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Started
NOTE: recipe libffi-3.8.1-r0: task do_fetch: Started
NOTE: Running task 1037 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe openssl-4.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1038 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_patch)
NOTE: Running task 1039 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_patch)
NOTE: recipe gnutls-3.8.14-r0: task do_fetch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Started
NOTE: Running task 1040 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_write_config)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.14-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.19-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1051 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: Running task 1054 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.14.bb:do_unpack)
NOTE: Running task 1060 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_patch)
NOTE: Running task 1061 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_unpack)
NOTE: Running task 1063 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_fetch)
NOTE: recipe curl-8.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1064 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_patch)
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_patch: Started
NOTE: recipe util-linux-2.42.4-r0: task do_unpack: Succeeded
NOTE: Running task 1065 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_patch)
NOTE: recipe openssl-4.1.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1074 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_fetch)
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Started
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Started
NOTE: Running task 1078 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe gnutls-3.8.14-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.11-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_patch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.15.2-r0: task do_fetch: Started
NOTE: Running task 1079 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Succeeded
NOTE: Running task 1080 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_unpack)
NOTE: recipe json-c-0.19-r0: task do_patch: Succeeded
NOTE: recipe python3-3.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 1081 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_unpack)
NOTE: recipe util-linux-2.42.4-r0: task do_patch: Started
NOTE: Running task 1082 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Succeeded
NOTE: Running task 1133 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1134 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1135 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Started
NOTE: recipe libffi-3.8.1-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-8.23.0-r0: task do_patch: Succeeded
NOTE: Running task 1137 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.15.2-r0: task do_unpack: Started
NOTE: recipe zlib-1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1141 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.8.1-r0: task do_unpack: Succeeded
NOTE: Running task 1144 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.8.11-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1145 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-4.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1147 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-4.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1148 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1149 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1150 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_configure)
NOTE: recipe libunistring-1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zlib-1.4-r0: task do_configure: Started
NOTE: Running task 1151 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_configure)
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_patch: Succeeded
NOTE: Running task 1153 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1155 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1156 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1157 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1158 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.42.4-r0: task do_patch: Succeeded
NOTE: Running task 1168 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.11.bb:do_patch)
NOTE: recipe bash-completion-2.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1169 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: Running task 1170 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1171 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure)
NOTE: Running task 1172 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_compile)
NOTE: recipe libunistring-1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_configure: Started
NOTE: Running task 1173 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_configure)
NOTE: recipe libpam-1.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.8.11-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Started
NOTE: Running task 1174 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_configure)
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Started
NOTE: recipe gnutls-3.8.14-r0: task do_unpack: Succeeded
NOTE: Running task 1175 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.14.bb:do_patch)
NOTE: Running task 1176 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe libunistring-1.5-r0: task do_configure: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.14-r0: task do_patch: Started
NOTE: Running task 1177 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_configure)
NOTE: recipe opkg-utils-0.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1178 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_install)
NOTE: recipe gdbm-1.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1179 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure)
NOTE: recipe expat-2.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: Running task 1180 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_configure: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Started
NOTE: Running task 1182 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe libarchive-3.8.11-r0: task do_patch: Succeeded
NOTE: Running task 1183 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_configure: Started
NOTE: recipe expat-2.10.0-r0: task do_configure: Started
NOTE: recipe zlib-1.4-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: Running task 1184 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_configure_ptest_base)
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.14-r0: task do_patch: Succeeded
NOTE: Running task 1185 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_install: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: Running task 1186 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure_ptest_base)
NOTE: Running task 1188 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libffi-3.8.1-r0: task do_patch: Started
NOTE: recipe zlib-1.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1189 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_compile)
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_configure_ptest_base: Started
NOTE: Running task 1190 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1191 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe zlib-1.4-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.8.1-r0: task do_patch: Succeeded
NOTE: Running task 1192 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe xz-5.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe attr-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1193 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1194 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe attr-2.6.0-r0: task do_configure: Started
NOTE: recipe xz-5.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1195 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe xz-5.8.4-r0: task do_configure: Started
NOTE: recipe zlib-1.4-r0: task do_compile: Succeeded
NOTE: recipe python3-3.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 1196 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1197 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_compile_ptest_base)
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.4-r0: task do_compile_ptest_base: Started
NOTE: recipe zlib-1.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1198 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_install)
NOTE: recipe zlib-1.4-r0: task do_install: Started
NOTE: recipe ncurses-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1199 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_configure)
NOTE: recipe ncurses-6.6-r0: task do_configure: Started
NOTE: recipe zlib-1.4-r0: task do_install: Succeeded
NOTE: Running task 1200 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_install_ptest_base)
NOTE: recipe zlib-1.4-r0: task do_install_ptest_base: Started
NOTE: recipe zlib-1.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1202 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_patch)
NOTE: recipe expat-2.10.0-r0: task do_configure: Succeeded
NOTE: Running task 1203 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_configure_ptest_base)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_configure: Succeeded
NOTE: Running task 1204 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_compile)
NOTE: recipe python3-3.15.2-r0: task do_patch: Started
NOTE: recipe expat-2.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_compile: Started
NOTE: recipe expat-2.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1205 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_compile)
NOTE: recipe expat-2.10.0-r0: task do_compile: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_configure: Succeeded
NOTE: Running task 1206 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_compile)
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Started
NOTE: recipe python3-3.15.2-r0: task do_patch: Succeeded
NOTE: Running task 1207 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_unpack)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_unpack: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1208 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_patch)
NOTE: Running task 1209 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_configure_ptest_base)
NOTE: recipe e2fsprogs-1.47.4-r0: task do_patch: Started
NOTE: recipe libpam-1.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1210 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_compile)
NOTE: recipe libpam-1.7.3-r0: task do_compile: Started
NOTE: recipe e2fsprogs-1.47.4-r0: task do_patch: Succeeded
NOTE: Running task 1212 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_compile: Succeeded
NOTE: Running task 1213 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_install)
NOTE: recipe expat-2.10.0-r0: task do_compile: Succeeded
NOTE: Running task 1214 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_compile_ptest_base)
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Started
NOTE: recipe expat-2.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1215 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_install)
NOTE: recipe expat-2.10.0-r0: task do_install: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1216 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_configure)
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Started
NOTE: recipe expat-2.10.0-r0: task do_install: Succeeded
NOTE: Running task 1221 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.14.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.8.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.7.3-r0: task do_compile: Succeeded
NOTE: Running task 1222 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1227 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: recipe libpam-1.7.3-r0: task do_compile_ptest_base: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1228 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_install)
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: Running task 1229 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: recipe libpam-1.7.3-r0: task do_install: Started
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: Running task 1236 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_generate_toolchain_file)
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Started
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1238 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1239 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1240 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe json-c-0.19-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1242 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure)
NOTE: recipe json-c-0.19-r0: task do_configure: Started
NOTE: recipe libpam-1.7.3-r0: task do_install: Succeeded
NOTE: Running task 1243 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_install_ptest_base)
NOTE: recipe libpam-1.7.3-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.7.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1244 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_populate_sysroot)
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1245 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_configure_ptest_base)
NOTE: Running task 1246 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_populate_sysroot unihash changed to 7fa794f2a6b235d080d1a2751a1db9e7f7c73983c2dff9c3a67ead3bcd63bc65
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot became valid
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 740 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: Running task 1247 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile)
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1248 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: Setscene tasks completed
NOTE: Running task 1250 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_configure: Succeeded
NOTE: Running task 1251 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_configure_ptest_base)
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1252 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package)
NOTE: recipe attr-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1253 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Started
NOTE: recipe attr-2.6.0-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1254 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: Running task 1255 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_configure_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1256 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1260 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1261 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_compile_ptest_base)
NOTE: recipe gdbm-1.26-r0: task do_compile: Started
NOTE: recipe libffi-3.8.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1262 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_install)
NOTE: Running task 1263 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_configure_ptest_base)
NOTE: recipe libffi-3.8.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_configure_ptest_base: Started
NOTE: recipe attr-2.6.0-r0: task do_install: Started
NOTE: Running task 1264 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_configure)
NOTE: recipe openssl-4.1.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1265 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.1.0.bb:do_compile)
NOTE: recipe libffi-3.8.1-r0: task do_configure: Started
NOTE: recipe openssl-4.1.0-r0: task do_compile: Started
NOTE: recipe attr-2.6.0-r0: task do_install: Succeeded
NOTE: Running task 1266 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_install_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_package unihash changed to 79ac2f1d83f376e8d1d12193b7a4900182f3868b43301aa472c87638b92e5fb6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata became valid
NOTE: Running setscene task 757 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1268 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 758 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1269 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_configure)
NOTE: recipe acl-2.4.0-r0: task do_configure: Started
NOTE: recipe json-c-0.19-r0: task do_configure: Succeeded
NOTE: Running task 1270 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_install_ptest_base)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1272 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-3.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1273 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_populate_sysroot)
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe gdbm-1.26-r0: task do_compile: Succeeded
NOTE: Running task 1274 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_compile_ptest_base)
NOTE: recipe python3-3.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.15.2.bb:do_deploy_source_date_epoch unihash changed to 2b0f54036c5bcd59602d804141266f06e54a25a1030a167dd958e8f6277633b2
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Started
NOTE: Setscene tasks completed
NOTE: Running task 1276 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe expat-2.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1280 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1281 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe libcap-2.78-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1282 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_configure)
NOTE: Running task 1283 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install)
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1284 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1285 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_compile_ptest_base)
NOTE: recipe libcap-2.78-r0: task do_configure: Started
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Started
NOTE: recipe gdbm-1.26-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libcap-2.78-r0: task do_configure: Succeeded
NOTE: recipe json-c-0.19-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1290 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile)
NOTE: Running task 1291 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_compile: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: Running task 1293 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_fetch)
NOTE: recipe file-5.48-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_install: Succeeded
NOTE: Running task 1295 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1296 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_configure_ptest_base)
NOTE: recipe libcap-ng-0.9.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.8.4-r0: task do_configure_ptest_base: Started
NOTE: recipe xz-5.8.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1297 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_compile)
NOTE: recipe json-c-0.19-r0: task do_compile: Succeeded
NOTE: Running task 1303 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe xz-5.8.4-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1304 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_configure)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_configure: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1305 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install)
NOTE: recipe gdbm-1.26-r0: task do_install: Succeeded
NOTE: Running task 1306 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Started
NOTE: recipe file-5.48-r0: task do_fetch: Succeeded
NOTE: Running task 1307 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.11.bb:do_fetch)
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Started
NOTE: recipe libmicrohttpd-1.0.11-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 1308 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: Running task 1309 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: Running task 1310 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 1314 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_fetch)
NOTE: recipe libseccomp-2.6.1-r0: task do_install: Succeeded
NOTE: recipe elfutils-0.197-r0: task do_fetch: Started
NOTE: Running task 1315 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_install_ptest_base)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.197-r0: task do_fetch: Succeeded
NOTE: Running task 1317 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_unpack)
NOTE: Running task 1318 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_unpack)
NOTE: recipe lzlib-1.16-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Started
NOTE: recipe file-5.48-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_unpack: Succeeded
NOTE: Running task 1319 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_patch)
NOTE: recipe lzlib-1.16-r0: task do_patch: Started
NOTE: recipe lzlib-1.16-r0: task do_patch: Succeeded
NOTE: Running task 1322 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_configure_ptest_base)
NOTE: recipe libcap-2.78-r0: task do_configure_ptest_base: Started
NOTE: recipe libcap-2.78-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1323 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_compile)
NOTE: recipe libcap-2.78-r0: task do_compile: Started
NOTE: recipe file-5.48-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_patch)
NOTE: recipe file-5.48-r0: task do_patch: Started
NOTE: recipe file-5.48-r0: task do_patch: Succeeded
NOTE: Running task 1325 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_package)
NOTE: recipe zlib-1.4-r0: task do_package: Started
NOTE: recipe gdbm-1.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1327 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1328 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.11.bb:do_unpack)
NOTE: recipe xz-5.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1329 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_compile_ptest_base)
NOTE: recipe libmicrohttpd-1.0.11-r0: task do_unpack: Started
NOTE: recipe xz-5.8.4-r0: task do_compile_ptest_base: Started
NOTE: recipe libmicrohttpd-1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1330 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: recipe libcap-2.78-r0: task do_compile: Succeeded
NOTE: Running task 1331 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1332 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 1333 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe zlib-1.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_package unihash changed to 1ac47c787a2419714e2edd07a187c16b1b6d9334882171792c49625d52d3f210
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_packagedata became valid
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 758 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_packagedata_setscene)
NOTE: Running task 1334 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.11.bb:do_patch)
NOTE: Running task 1335 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe zlib-1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.11-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 1336 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: Running task 1337 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: recipe zlib-1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1338 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_compile_ptest_base)
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: recipe json-c-0.19-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1340 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_unpack)
NOTE: Running task 1341 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install)
NOTE: recipe libffi-3.8.1-r0: task do_configure: Succeeded
NOTE: Running task 1342 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1344 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package)
NOTE: recipe elfutils-0.197-r0: task do_unpack: Started
NOTE: recipe libffi-3.8.1-r0: task do_compile: Started
NOTE: recipe json-c-0.19-r0: task do_install: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: recipe json-c-0.19-r0: task do_install: Succeeded
NOTE: Running task 1345 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: Running task 1351 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1352 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_fetch)
NOTE: recipe xz-5.8.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1353 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_install)
NOTE: recipe acl-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1354 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_configure_ptest_base)
NOTE: recipe sed-4.10-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_fetch: Succeeded
NOTE: Running task 1355 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_fetch)
NOTE: recipe xz-5.8.4-r0: task do_install: Started
NOTE: recipe acl-2.4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.12-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_fetch: Succeeded
NOTE: Running task 1356 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_compile)
NOTE: Running task 1358 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzlib-1.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.4.0-r0: task do_compile: Started
NOTE: recipe lzlib-1.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1359 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_configure)
NOTE: recipe elfutils-0.197-r0: task do_unpack: Succeeded
NOTE: Running task 1360 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_patch)
NOTE: recipe lzlib-1.16-r0: task do_configure: Started
NOTE: recipe libffi-3.8.1-r0: task do_compile: Succeeded
NOTE: recipe elfutils-0.197-r0: task do_patch: Started
NOTE: Running task 1361 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_install)
NOTE: recipe lzlib-1.16-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1362 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_compile)
NOTE: Running task 1363 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot)
NOTE: recipe libffi-3.8.1-r0: task do_install: Started
NOTE: recipe lzlib-1.16-r0: task do_compile: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1365 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_compile_ptest_base)
NOTE: recipe libffi-3.8.1-r0: task do_install: Succeeded
NOTE: recipe elfutils-0.197-r0: task do_patch: Succeeded
NOTE: Running task 1367 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1368 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_populate_sysroot)
NOTE: recipe libcap-2.78-r0: task do_compile_ptest_base: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.8.1-r0: task do_populate_sysroot: Started
NOTE: recipe acl-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1369 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_compile_ptest_base)
NOTE: recipe acl-2.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1372 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.8.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1374 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1376 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1377 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe acl-2.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1378 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: recipe acl-2.4.0-r0: task do_install: Started
NOTE: recipe libcap-2.78-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1379 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1380 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe libcap-2.78-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe acl-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 1381 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_install_ptest_base)
NOTE: recipe libcap-ng-0.9.6-r0: task do_configure: Succeeded
NOTE: Running task 1382 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_compile)
NOTE: recipe acl-2.4.0-r0: task do_install_ptest_base: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_compile: Started
NOTE: recipe acl-2.4.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running noexec task 1384 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: Running task 1385 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: recipe lzlib-1.16-r0: task do_compile: Succeeded
NOTE: Running task 1386 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_install)
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe lzlib-1.16-r0: task do_install: Started
NOTE: recipe libcap-2.78-r0: task do_install: Succeeded
NOTE: Running noexec task 1387 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 1388 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_install_ptest_base)
NOTE: recipe lzlib-1.16-r0: task do_install: Succeeded
NOTE: Running task 1389 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot)
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Started
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.19-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1390 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_package: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1392 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_package unihash changed to 52fca16ce7470b6258a88cba3f0389320a78de38848815edbb50d60213d380fb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata became valid
NOTE: Running setscene task 758 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_configure: Succeeded
NOTE: Running task 1393 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_compile)
NOTE: recipe bash-completion-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1396 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_package)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_compile: Started
NOTE: recipe libpam-1.7.3-r0: task do_package: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1397 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_install)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_compile: Succeeded
NOTE: Running task 1398 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_install)
NOTE: recipe libcap-ng-0.9.6-r0: task do_install: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_install: Started
NOTE: recipe xz-5.8.4-r0: task do_install: Succeeded
NOTE: Running task 1399 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot)
NOTE: Running task 1400 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_install_ptest_base)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_install_ptest_base: Started
NOTE: Running task 1401 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot unihash changed to 6ccc9f2d2b591ced868977eea49adbc57287846c1be40350153e5deb34e8b0c5
NOTE: recipe libtasn1-4.21.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1402 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_compile)
NOTE: Running task 1403 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1404 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Started
NOTE: recipe coreutils-9.12-r0: task do_unpack: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_install: Succeeded
NOTE: Running task 1405 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: Running task 1407 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_patch)
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe sed-4.10-r0: task do_patch: Started
NOTE: recipe sed-4.10-r0: task do_patch: Succeeded
NOTE: Running task 1408 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_package)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_install: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_package: Started
NOTE: Running task 1410 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_package)
NOTE: recipe coreutils-9.12-r0: task do_unpack: Succeeded
NOTE: Running task 1411 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_patch)
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_package: Started
NOTE: Running task 1412 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb:do_recipe_qa)
NOTE: recipe coreutils-9.12-r0: task do_patch: Started
NOTE: recipe btrfs-tools-7.3-r0: task do_recipe_qa: Started
NOTE: recipe btrfs-tools-7.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1413 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb:do_fetch)
NOTE: recipe coreutils-9.12-r0: task do_patch: Succeeded
NOTE: Running task 1416 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: recipe btrfs-tools-7.3-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1419 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: Running task 1420 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe btrfs-tools-7.3-r0: task do_fetch: Succeeded
NOTE: Running task 1421 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_package)
NOTE: recipe attr-2.6.0-r0: task do_package: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: Running task 1422 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile_ptest_base)
NOTE: recipe zstd-1.5.7-r0: task do_compile_ptest_base: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1423 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_package)
NOTE: recipe xz-5.8.4-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1424 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1425 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1426 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_package unihash changed to de5bf13e90955c29b87a9aebd4818b5599a023d53c359e2fd3a3ab4dc316678c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata became valid
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running setscene task 758 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: Running task 1427 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_package: Succeeded
NOTE: Running task 1428 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_package unihash changed to 715d75f376e227c089006c13dbcb52b02455f4aaf475b7f552898e44208027b8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata became valid
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: Running setscene task 758 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1430 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1431 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-ng-0.9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 1435 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb:do_unpack)
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe btrfs-tools-7.3-r0: task do_unpack: Started
NOTE: Running task 1436 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1437 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1438 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure)
NOTE: Running task 1439 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1440 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe nettle-4.0-r0: task do_configure: Started
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1441 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot)
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1442 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_package)
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: recipe expat-2.10.0-r0: task do_package: Started
NOTE: Running task 1443 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package unihash changed to 46caffe3a4090cad2bf13b6d6bc90143630a49cd81c81f991499cf280f42540c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata became valid
NOTE: recipe btrfs-tools-7.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 758 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running task 1444 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package)
NOTE: Running task 1445 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_package: Started
NOTE: recipe libffi-3.8.1-r0: task do_package: Started
NOTE: recipe attr-2.6.0-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1448 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_package unihash changed to 570e48ac749475d9a66a313f520a525ff6f97a05bcf9a9c9c09d6a1330c0c873
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx became valid
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe btrfs-tools-7.3-r0: task do_patch: Started
NOTE: Running setscene task 749 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running task 1451 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_install_ptest_base)
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_install_ptest_base: Started
NOTE: recipe btrfs-tools-7.3-r0: task do_patch: Succeeded
NOTE: Running task 1452 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: recipe attr-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 758 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1456 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: Running task 1457 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe sed-4.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1460 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_configure)
NOTE: recipe sed-4.10-r0: task do_configure: Started
NOTE: recipe coreutils-9.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1462 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_configure)
NOTE: recipe coreutils-9.12-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: Running task 1466 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: recipe libtasn1-4.21.0-r0: task do_compile: Succeeded
NOTE: Running task 1467 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe ncurses-6.6-r0: task do_configure: Succeeded
NOTE: Running task 1468 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_compile)
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Started
NOTE: recipe ncurses-6.6-r0: task do_compile: Started
NOTE: recipe expat-2.10.0-r0: task do_package: Succeeded
NOTE: Running task 1469 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_packagedata)
NOTE: recipe expat-2.10.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.5-r0: task do_configure: Succeeded
NOTE: Running task 1470 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.5.bb:do_compile)
NOTE: recipe libunistring-1.5-r0: task do_compile: Started
NOTE: recipe libffi-3.8.1-r0: task do_package: Succeeded
NOTE: Running task 1471 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.1.bb:do_packagedata)
NOTE: recipe libffi-3.8.1-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_install: Succeeded
NOTE: recipe libffi-3.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1472 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot)
NOTE: Running task 1478 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_recipe_spdx)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.3-r0: task do_package: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_package unihash changed to d024fb4ee26744e4bfdee4fb1855e7708e7822727cebdb5a02cc2d33a71200ca
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata became valid
NOTE: recipe nettle-4.0-r0: task do_configure: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 758 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: Running task 1479 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_configure_ptest_base)
NOTE: Running task 1480 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata)
NOTE: Running task 1481 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_fetch)
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1482 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata: Started
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1483 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_fetch)
NOTE: recipe nettle-4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1484 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1490 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-4.20.3-r0: task do_fetch: Started
NOTE: recipe shadow-4.20.3-r0: task do_fetch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_compile: Started
NOTE: Running task 1491 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_recipe_spdx)
NOTE: recipe btrfs-tools-7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1495 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_unpack)
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1496 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe xz-5.8.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.3.bb:do_deploy_source_date_epoch unihash changed to eed9288bc73109608d59124970eeb25c9b9f0c6f55ff5385d687034848c05c9e
NOTE: Running task 1497 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_unpack)
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1499 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.26-r0: task do_package: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1500 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_package unihash changed to d853b064855d9fcc0e2ce6c4400bc3b7fd2b90bc78b6335d9d67d93c6aed1e92
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata became valid
NOTE: recipe base-passwd-3.6.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Started
NOTE: recipe shadow-4.20.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 758 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running task 1501 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1503 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Started
NOTE: Running task 1504 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1518 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_fetch)
NOTE: recipe base-passwd-3.6.8-r0: task do_configure: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1520 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe binutils-2.47-r0: task do_fetch: Succeeded
NOTE: Running task 1523 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_fetch)
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Started
NOTE: Running task 1524 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: Running task 1525 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_create_recipe_spdx)
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1526 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_package)
NOTE: recipe shadow-4.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 1527 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_patch)
NOTE: recipe util-linux-2.42.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1529 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_spdx)
NOTE: recipe shadow-4.20.3-r0: task do_patch: Started
NOTE: recipe acl-2.4.0-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to 3c96a5b8fce397b942ff884c285c588828f811fe8d54a79522c9b9d897626cd8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.20.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 758 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running task 1530 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.4.bb:do_create_spdx)
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 1531 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.4-r0: task do_create_spdx: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1545 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Succeeded
NOTE: Running task 1547 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1548 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_create_spdx)
NOTE: recipe shadow-4.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.4-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx: Started
NOTE: Running task 1549 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe bash-completion-2.18.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 1550 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe binutils-2.47-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1551 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe shadow-4.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1552 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1553 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_create_spdx: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_configure: Started
NOTE: Running task 1556 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1557 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1558 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_patch: Started
NOTE: Running task 1561 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_patch)
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1570 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_create_recipe_spdx)
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Started
NOTE: recipe gdbm-1.26-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1574 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_recipe_spdx)
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx: Started
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1585 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_spdx)
NOTE: recipe base-passwd-3.6.8-r0: task do_configure: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_create_spdx: Started
NOTE: Running task 1586 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_compile)
NOTE: recipe base-passwd-3.6.8-r0: task do_compile: Started
NOTE: recipe acl-2.4.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_package unihash changed to e865144cd5e73fc7cd52e879e780a214517717fbd42cad2854bdff60121dd2bf
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata became valid
NOTE: Running setscene task 758 of 758 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_compile: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_patch: Succeeded
NOTE: Running task 1588 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_create_spdx)
NOTE: recipe expat-2.10.0-r0: task do_packagedata: Failed
NOTE: Running task 1589 of 1914 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_install)
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_install: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_create_spdx: Succeeded
NOTE: recipe nettle-4.0-r0: task do_compile: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_compile: Succeeded
NOTE: recipe binutils-2.47-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_configure: Succeeded
NOTE: recipe openssl-4.1.0-r0: task do_compile: Succeeded
NOTE: recipe sed-4.10-r0: task do_configure: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_compile: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.5-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1589 tasks of which 1217 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261124052427.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261124052427.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/expat/2.10.0/temp/log.do_packagedata.3444991
Summary: There were 10 ERROR messages, returning a non-zero exit code.
ERROR: expat-2.10.0-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.11.0-r0 to 0:2.10.0-r0) [version-going-backwards]
ERROR: expat-2.10.0-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.11.0-r0 to 0:2.10.0-r0) [version-going-backwards]
ERROR: expat-2.10.0-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.11.0-r0 to 0:2.10.0-r0) [version-going-backwards]
ERROR: expat-2.10.0-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.11.0-r0 to 0:2.10.0-r0) [version-going-backwards]
ERROR: expat-2.10.0-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.11.0-r0 to 0:2.10.0-r0) [version-going-backwards]
ERROR: expat-2.10.0-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.11.0-r0 to 0:2.10.0-r0) [version-going-backwards]
ERROR: expat-2.10.0-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.11.0-r0 to 0:2.10.0-r0) [version-going-backwards]
ERROR: expat-2.10.0-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.11.0-r0 to 0:2.10.0-r0) [version-going-backwards]
ERROR: expat-2.10.0-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.11.0-r0 to 0:2.10.0-r0) [version-going-backwards]
ERROR: expat-2.10.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/expat/2.10.0/temp/log.do_packagedata.3444991
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.10.0.bb:do_packagedata) failed with exit code '1'

--===============2829210677061851505==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-7.1-7.3.patch"

RnJvbSAyNzFiMmE0ZWNhNjA5MjUyNjVjNzY3YzA5MWM2Mjg0OGJhZjdlZTZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjQgTm92IDIwMjYgMDU6MjU6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA3LjEgLT4gNy4zCgpidHJmcy1wcm9ncy03LjMgKDIwMjYtMTAt
MjMpCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCmJ0cmZzLXByb2dzLTcuMiAoc2tpcHBl
ZCkKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotLS0KIC4uLmQtYS1wb3NzaWJpbGl0eS10by1z
cGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIHwgNiArKystLS0KIC4uLi9idHJm
cy10b29scy97YnRyZnMtdG9vbHNfNy4xLmJiID0+IGJ0cmZzLXRvb2xzXzcuMy5iYn0gIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL3tidHJmcy10b29sc183LjEuYmIg
PT4gYnRyZnMtdG9vbHNfNy4zLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRv
LXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1z
cGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCmluZGV4IDcyNzJjMjdjNmMuLmQw
ZjZjYzBkMzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9i
dHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3NpYmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9u
LW1vZHVsZXMtYXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xz
L2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRo
b24tbW9kdWxlcy1hci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2VkY2VlNTcwNzg3Njli
Nzc1MjI3NWUwZTVmMzVhZWZiZmVmYzllYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MWQzYTMzYjI5NDQyOTMxOTBjNGZkNWQ2OWY1ZmE0Y2E2ZWNlYTE1YyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
PgogRGF0ZTogV2VkLCAyMyBNYXkgMjAxOCAyMToyMDozNSArMDMwMAogU3ViamVjdDogW1BBVENI
XSBBZGQgYSBwb3NzaWJpbGl0eSB0byBzcGVjaWZ5IHdoZXJlIHB5dGhvbiBtb2R1bGVzIGFyZQpA
QCAtMTEsMTAgKzExLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQotaW5kZXggOTZj
MTE4MzAuLjNmMjU4NWNiIDEwMDY0NAoraW5kZXggNzhjMjNhZDMuLmU5MTI0NzRhIDEwMDY0NAog
LS0tIGEvTWFrZWZpbGUKICsrKyBiL01ha2VmaWxlCi1AQCAtOTk3LDcgKzk5Nyw3IEBAIGVuZGlm
CitAQCAtOTk0LDcgKzk5NCw3IEBAIGVuZGlmCiAgaWZlcSAoJChQWVRIT05fQklORElOR1MpLDEp
CiAgaW5zdGFsbF9weXRob246IGxpYmJ0cmZzdXRpbF9weXRob24KICAJJChRKWNkIGxpYmJ0cmZz
dXRpbC9weXRob247IFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10
b29scy9idHJmcy10b29sc183LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9v
bHMvYnRyZnMtdG9vbHNfNy4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc183LjEuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc183LjMuYmIK
aW5kZXggMWJjNzVhN2RlNy4uNjQ3YjFiZmExZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzXzcuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNy4zLmJiCkBAIC0xNyw3ICsxNyw3IEBA
IERFUEVORFMgPSAidXRpbC1saW51eCB6bGliIgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L2tkYXZlL2J0cmZzLXByb2dzLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzO3RhZz12
JHtQVn0gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVj
aWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDUkVW
ID0gIjRhYjBlODBiZTllM2JiMWRiMmU2MDM4ZTZkNDMxNmQzNWZiN2JhOGIiCitTUkNSRVYgPSAi
YWZkYzNhNjVlMzNmNGQ0MmY3NjhhZDUwZGNhMjBjMzJlNWVlMTQ5NiIKIAogUEFDS0FHRUNPTkZJ
RyA/Pz0gIiBcCiAgICAgcHJvZ3JhbXMgXAotLSAKMi40Ny4xCgo=

--===============2829210677061851505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 27918848 to 28015408 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: FILELIST: directory renamed /usr/src/debug/btrfs-tools/7.1/tune -> /usr/src/debug/btrfs-tools/7.3/tune, directory renamed /usr/src/debug/btrfs-tools/7.1/kernel-shared/uapi -> /usr/src/debug/btrfs-tools/7.3/kernel-shared/uapi, directory renamed /usr/src/debug/btrfs-tools/7.1/convert -> /usr/src/debug/btrfs-tools/7.3/convert, directory renamed /usr/src/debug/btrfs-tools/7.1/mkfs -> /usr/src/debug/btrfs-tools/7.3/mkfs, directory renamed /usr/src/debug/btrfs-tools/7.1 -> /usr/src/debug/btrfs-tools/7.3, directory renamed /usr/src/debug/btrfs-tools/7.1/include -> /usr/src/debug/btrfs-tools/7.3/include, directory renamed /usr/src/debug/btrfs-tools/7.1/libbtrfsutil -> /usr/src/debug/btrfs-tools/7.3/libbtrfsutil, directory renamed /usr/src/debug/btrfs-tools/7.1/kernel-shared -> /usr/src/debug/btrfs-tools/7.3/kernel-shared, directory renamed /usr/src/debug/btrfs-tools/7.1/kernel-lib -> /usr/src/debug/btrfs-tools/7.3/kernel-lib, directo
 ry renamed /usr/src/debug/btrfs-tools/7.1/check -> /usr/src/debug/btrfs-tools/7.3/check, directory renamed /usr/src/debug/btrfs-tools/7.1/cmds -> /usr/src/debug/btrfs-tools/7.3/cmds, directory renamed /usr/src/debug/btrfs-tools/7.1/image -> /usr/src/debug/btrfs-tools/7.3/image, directory renamed /usr/src/debug/btrfs-tools/7.1/crypto -> /usr/src/debug/btrfs-tools/7.3/crypto, directory renamed /usr/src/debug/btrfs-tools/7.1/libbtrfs -> /usr/src/debug/btrfs-tools/7.3/libbtrfs, removed "/usr/src/debug/btrfs-tools/7.1/common/rbtree-utils.h /usr/src/debug/btrfs-tools/7.1/common/string-table.c /usr/src/debug/btrfs-tools/7.1/common/string-table.h /usr/src/debug/btrfs-tools/7.1/common/rbtree-utils.c /usr/src/debug/btrfs-tools/7.1/common/tree-search.h /usr/src/debug/btrfs-tools/7.1/common/filesystem-utils.h /usr/src/debug/btrfs-tools/7.1/common/clear-cache.h /usr/src/debug/btrfs-tools/7.1/common/send-utils.c /usr/src/debug/btrfs-tools/7.1/common/clear-cache.c /usr/src/debug/btrfs-tools/7.1/co
 mmon/filesystem-utils.c /usr/src/debug/btrfs-tools/7.1/common/send-utils.h /usr/src/debug/btrfs-tools/7.1/common/device-utils.c /usr/src/debug/btrfs-tools/7.1/common/device-scan.h /usr/src/debug/btrfs-tools/7.1/common/format-output.c /usr/src/debug/btrfs-tools/7.1/common/inject-error.c /usr/src/debug/btrfs-tools/7.1/common/help.c /usr/src/debug/btrfs-tools/7.1/common/cpu-utils.h /usr/src/debug/btrfs-tools/7.1/common/root-tree-utils.h /usr/src/debug/btrfs-tools/7.1/common/device-scan.c /usr/src/debug/btrfs-tools/7.1/common/device-utils.h /usr/src/debug/btrfs-tools/7.1/common/format-output.h /usr/src/debug/btrfs-tools/7.1/common/cpu-utils.c /usr/src/debug/btrfs-tools/7.1/common/help.h /usr/src/debug/btrfs-tools/7.1/common/root-tree-utils.c /usr/src/debug/btrfs-tools/7.1/common/open-utils.c /usr/src/debug/btrfs-tools/7.1/common/compat.c /usr/src/debug/btrfs-tools/7.1/common/array.c /usr/src/debug/btrfs-tools/7.1/common/open-utils.h /usr/src/debug/btrfs-tools/7.1/common/array.h /usr/src
 /debug/btrfs-tools/7.1/common/parse-utils.h /usr/src/debug/btrfs-tools/7.1/common/string-utils.c /usr/src/debug/btrfs-tools/7.1/common/sysfs-utils.c /usr/src/debug/btrfs-tools/7.1/common/extent-cache.c /usr/src/debug/btrfs-tools/7.1/common/parse-utils.c /usr/src/debug/btrfs-tools/7.1/common/string-utils.h /usr/src/debug/btrfs-tools/7.1/common/sort-utils.c /usr/src/debug/btrfs-tools/7.1/common/path-utils.h /usr/src/debug/btrfs-tools/7.1/common/task-utils.c /usr/src/debug/btrfs-tools/7.1/common/sort-utils.h /usr/src/debug/btrfs-tools/7.1/common/path-utils.c /usr/src/debug/btrfs-tools/7.1/common/task-utils.h /usr/src/debug/btrfs-tools/7.1/common/send-stream.c /usr/src/debug/btrfs-tools/7.1/common/send-stream.h /usr/src/debug/btrfs-tools/7.1/common/units.h /usr/src/debug/btrfs-tools/7.1/common/utils.c /usr/src/debug/btrfs-tools/7.1/common/extent-cache.h /usr/src/debug/btrfs-tools/7.1/common/messages.c /usr/src/debug/btrfs-tools/7.1/common/extent-tree-utils.c /usr/src/debug/btrfs-tools/7
 .1/common/fsfeatures.h /usr/src/debug/btrfs-tools/7.1/common/sysfs-utils.h /usr/src/debug/btrfs-tools/7.1/common/messages.h /usr/src/debug/btrfs-tools/7.1/common/utils.h /usr/src/debug/btrfs-tools/7.1/common/units.c /usr/src/debug/btrfs-tools/7.1/common/fsfeatures.c /usr/src/debug/btrfs-tools/7.1/common/extent-tree-utils.h", added "/usr/src/debug/btrfs-tools/7.3/common/rbtree-utils.h /usr/src/debug/btrfs-tools/7.3/common/string-table.c /usr/src/debug/btrfs-tools/7.3/common/string-table.h /usr/src/debug/btrfs-tools/7.3/common/rbtree-utils.c /usr/src/debug/btrfs-tools/7.3/common/tree-search.h /usr/src/debug/btrfs-tools/7.3/common/filesystem-utils.h /usr/src/debug/btrfs-tools/7.3/common/clear-cache.h /usr/src/debug/btrfs-tools/7.3/common/send-utils.c /usr/src/debug/btrfs-tools/7.3/common/clear-cache.c /usr/src/debug/btrfs-tools/7.3/common/filesystem-utils.c /usr/src/debug/btrfs-tools/7.3/common/send-utils.h /usr/src/debug/btrfs-tools/7.3/common/device-utils.c /usr/src/debug/btrfs-tools
 /7.3/common/device-scan.h /usr/src/debug/btrfs-tools/7.3/common/format-output.c /usr/src/debug/btrfs-tools/7.3/common/inject-error.c /usr/src/debug/btrfs-tools/7.3/common/help.c /usr/src/debug/btrfs-tools/7.3/common/cpu-utils.h /usr/src/debug/btrfs-tools/7.3/common/root-tree-utils.h /usr/src/debug/btrfs-tools/7.3/common/device-scan.c /usr/src/debug/btrfs-tools/7.3/common/device-utils.h /usr/src/debug/btrfs-tools/7.3/common/format-output.h /usr/src/debug/btrfs-tools/7.3/common/cpu-utils.c /usr/src/debug/btrfs-tools/7.3/common/help.h /usr/src/debug/btrfs-tools/7.3/common/root-tree-utils.c /usr/src/debug/btrfs-tools/7.3/common/open-utils.c /usr/src/debug/btrfs-tools/7.3/common/compat.c /usr/src/debug/btrfs-tools/7.3/common/array.c /usr/src/debug/btrfs-tools/7.3/common/open-utils.h /usr/src/debug/btrfs-tools/7.3/common/array.h /usr/src/debug/btrfs-tools/7.3/common/parse-utils.h /usr/src/debug/btrfs-tools/7.3/common/string-utils.c /usr/src/debug/btrfs-tools/7.3/common/sysfs-utils.c /usr/
 src/debug/btrfs-tools/7.3/common/extent-cache.c /usr/src/debug/btrfs-tools/7.3/common/parse-utils.c /usr/src/debug/btrfs-tools/7.3/common/string-utils.h /usr/src/debug/btrfs-tools/7.3/common/sort-utils.c /usr/src/debug/btrfs-tools/7.3/common/path-utils.h /usr/src/debug/btrfs-tools/7.3/common/task-utils.c /usr/src/debug/btrfs-tools/7.3/common/sort-utils.h /usr/src/debug/btrfs-tools/7.3/common/path-utils.c /usr/src/debug/btrfs-tools/7.3/common/task-utils.h /usr/src/debug/btrfs-tools/7.3/common/reproducible.h /usr/src/debug/btrfs-tools/7.3/common/send-stream.c /usr/src/debug/btrfs-tools/7.3/common/reproducible.c /usr/src/debug/btrfs-tools/7.3/common/send-stream.h /usr/src/debug/btrfs-tools/7.3/common/units.h /usr/src/debug/btrfs-tools/7.3/common/utils.c /usr/src/debug/btrfs-tools/7.3/common/extent-cache.h /usr/src/debug/btrfs-tools/7.3/common/messages.c /usr/src/debug/btrfs-tools/7.3/common/extent-tree-utils.c /usr/src/debug/btrfs-tools/7.3/common/fsfeatures.h /usr/src/debug/btrfs-tool
 s/7.3/common/sysfs-utils.h /usr/src/debug/btrfs-tools/7.3/common/messages.h /usr/src/debug/btrfs-tools/7.3/common/utils.h /usr/src/debug/btrfs-tools/7.3/common/units.c /usr/src/debug/btrfs-tools/7.3/common/fsfeatures.c /usr/src/debug/btrfs-tools/7.3/common/extent-tree-utils.h"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4345531 to 4363468 (+0%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: FILELIST: directory renamed /usr/lib/python3.15/site-packages/btrfsutil-7.1-py3.15.egg-info -> /usr/lib/python3.15/site-packages/btrfsutil-7.3-py3.15.egg-info
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 6111536 to 6148400 (+1%)
packages/x86-64-v3-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 7.1 [default] to 7.3 [default]
packages/x86-64-v3-poky-linux/btrfs-tools: SRC_URI changed from "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v7.1 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch" to "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v7.3 file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch"
packages/x86-64-v3-poky-linux/btrfs-tools: PV changed from "7.1" to "7.3"
packages/x86-64-v3-poky-linux/btrfs-tools: PKGV changed from 7.1 [default] to 7.3 [default]
Changes to packages/x86-64-v3-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.15/site-packages/btrfsutil-7.1-py3.15.egg-info moved to /usr/lib/python3.15/site-packages/btrfsutil-7.3-py3.15.egg-info

--===============2829210677061851505==--
