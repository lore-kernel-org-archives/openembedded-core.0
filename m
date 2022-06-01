Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6206CCA488
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.617.1654100324054689606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Z0qmq/Nx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010181200fea60-60503929-07a0-4b8c-acc7-8571a0e8669a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iXtO2s+t/Wm0RhxMjwqnEPOOtHYrziIlD9cXjp4ElSY=;
	b=Z0qmq/Nxk7vGCsVZOMqC027bjOrvYBNB6Wv5bubx8FjyRNXpD6Ci5QsYSPXdveCs
	HqxQOBZASiwXWggfTt8UItx14K0xJq+oPzyCeHQCUlB6x0AhRk1h7Ik4wSWXHV2UjYz
	klfHzkraLyznVOVGps8m5OmwPRP3hVrAInMJ6AF4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iXtO2s+t/Wm0RhxMjwqnEPOOtHYrziIlD9cXjp4ElSY=;
	b=I+v67OEJEM15GP4SERGThn9EdE4C4KU9IJaF9lQ7qvLNABw4bsb7tOAX+jpGoWgz
	NbThRDW2Pvx5Q86gV/u8DBAdoNJLdI3xT14vegf6ZFNAs9xFNdb/TU1YSeFvz8xwUqB
	af3ZHMNfvgpLFnMXBAMsnChZ2BeUNdZra4HAbI2c=
Content-Type: multipart/mixed; boundary="===============0152804750101020146=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] perl: upgrading to 5.36.0 FAILED
Message-ID: 
 <01010181200fea60-60503929-07a0-4b8c-acc7-8571a0e8669a-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:43 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166409

--===============0152804750101020146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *perl* to *5.36.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-perl-upgrade-5.34.1-5.36.0.patch
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
--===============0152804750101020146==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-perl-upgrade-5.34.1-5.36.0.patch"

From 7b63600632a58649686496f59d1d4eb790258a39 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 07:54:17 +0000
Subject: [PATCH] perl: upgrade 5.34.1 -> 5.36.0

---
 .../perl/files/encodefix.patch                | 20 -------------------
 .../perl/files/perl-configpm-switch.patch     |  2 +-
 meta/recipes-devtools/perl/perl-ptest.inc     | 12 ++++++++++-
 .../perl/{perl_5.34.1.bb => perl_5.36.0.bb}   |  2 +-
 4 files changed, 13 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/encodefix.patch
 rename meta/recipes-devtools/perl/{perl_5.34.1.bb => perl_5.36.0.bb} (99%)

diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
deleted file mode 100644
index 396ed0d53e..0000000000
--- a/meta/recipes-devtools/perl/files/encodefix.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-The code is encoding host compiler parameters into target builds. Avoid
-this for our target builds (patch is target specific, not native)
-
-Upstream-Status: Inappropriate [Cross compile hack]
-RP 2020/2/18
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: perl-5.30.1/cpan/Encode/bin/enc2xs
-===================================================================
---- perl-5.30.1.orig/cpan/Encode/bin/enc2xs
-+++ perl-5.30.1/cpan/Encode/bin/enc2xs
-@@ -195,7 +195,7 @@ sub compiler_info {
-     # above becomes false.
-     my $sized  = $declaration && !($compat && !$pedantic);
- 
--    return ($cpp, $static, $sized);
-+    return (0, 1, 1);
- }
- 
- 
diff --git a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
index 15189a0c04..181ff7a66d 100644
--- a/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/files/perl-configpm-switch.patch
@@ -1,4 +1,4 @@
-From 1f7cc5db2ca549c37c6a7923368e1a0104f31b99 Mon Sep 17 00:00:00 2001
+From b93b221746f1901216511aef042dd2fa4943b5f2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 27 May 2007 21:04:11 +0000
 Subject: [PATCH] perl: 5.8.7 -> 5.8.8 (from OE)
diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 54c7807571..7c982bffab 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -1,6 +1,16 @@
 inherit ptest
 
-SRC_URI += "file://run-ptest \
+SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
+           file://perl-rdepends.txt \
+           file://0001-Somehow-this-module-breaks-through-the-perl-wrapper-.patch \
+           file://errno_ver.diff \
+           file://native-perlinc.patch \
+           file://perl-dynloader.patch \
+           file://0002-Constant-Fix-up-shebang.patch \
+           file://determinism.patch \
+           file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
+           file://run-ptest \
+           file://perl-configpm-switch.patch \
            "
 
 DEBUG_PREFIX_MAP_REGEX = "${@'\\|'.join(d.getVar('DEBUG_PREFIX_MAP').split())}"
diff --git a/meta/recipes-devtools/perl/perl_5.34.1.bb b/meta/recipes-devtools/perl/perl_5.36.0.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.34.1.bb
rename to meta/recipes-devtools/perl/perl_5.36.0.bb
index 0e9d0c032e..7de1d87d1f 100644
--- a/meta/recipes-devtools/perl/perl_5.34.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "357951a491b0ba1ce3611263922feec78ccd581dddc24a446b033e25acf242a1"
+SRC_URI[perl.sha256sum] = "e26085af8ac396f62add8a533c3a0ea8c8497d836f0689347ac5abd7b7a4e00a"
 
 S = "${WORKDIR}/perl-${PV}"
 
-- 
2.31.1


--===============0152804750101020146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb: Unable to get checksum for perl SRC_URI entry encodefix.patch: file could not be found
done.
Parsing of 883 .bb files complete (882 cached, 1 parsed). 1642 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-693b7126fbef93868d315ed8a4aaa4f4f192378e"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:693b7126fbef93868d315ed8a4aaa4f4f192378e"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 76 Local 22 Mirrors 0 Missed 54 Current 129 (28% match, 73% complete)
Removing 5 stale sstate objects for arch core2-32...done.
Removing 16 stale sstate objects for arch qemux86...done.
Removing 10 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 139 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 142 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 147 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 150 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 156 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 157 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 162 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 171 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 172 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 177 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 182 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.35.bb:do_stash_locale_setscene)
NOTE: Running setscene task 183 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 186 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 187 of 205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 268 of 813 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_fetch)
NOTE: Running noexec task 305 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_fetch)
NOTE: recipe zlib-1.2.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 417 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_fetch)
NOTE: recipe glibc-locale-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 521 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_fetch)
NOTE: Running task 522 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_fetch)
NOTE: Running task 523 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_fetch)
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 537 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_fetch)
NOTE: recipe glibc-2.35-r0: task do_stash_locale_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-locale-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 539 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.28.bb:do_fetch)
NOTE: Running task 540 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_fetch)
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 541 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_fetch)
NOTE: recipe gdbm-1.23-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 542 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_fetch)
NOTE: recipe gawk-5.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_fetch: Started
NOTE: Running task 543 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_fetch)
NOTE: Running task 544 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.1.bb:do_fetch)
NOTE: recipe perl-native-5.36.0-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-12.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_fetch: Started
NOTE: Running task 545 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_fetch)
NOTE: recipe zlib-1.2.12-r0: task do_fetch: Started
NOTE: recipe psmisc-23.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_fetch: Started
NOTE: recipe perl-native-5.36.0-r0: task do_fetch: Succeeded
NOTE: Running task 547 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-12.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 549 of 813 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: Running task 550 of 813 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_unpack)
WARNING: perl-5.36.0-r0 do_fetch: Failed to fetch URL file://encodefix.patch, attempting MIRRORS if available
NOTE: Running task 551 of 813 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.36.0-r0: task do_fetch: Failed
NOTE: recipe zlib-1.2.12-r0: task do_fetch: Succeeded
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Started
NOTE: recipe make-4.3-r0: task do_fetch: Started
NOTE: recipe readline-8.1.2-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Started
NOTE: recipe readline-8.1.2-r0: task do_fetch: Succeeded
NOTE: recipe make-4.3-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_fetch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_fetch: Started
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Started
NOTE: recipe libxcrypt-4.4.28-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.1.1-r0: task do_fetch: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.35-r0: task do_stash_locale_setscene: Succeeded
NOTE: recipe perl-native-5.36.0-r0: task do_unpack: Started
NOTE: recipe perl-native-5.36.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.8-r0: task do_fetch: Succeeded
NOTE: recipe perl-native-5.36.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_fetch: Succeeded
NOTE: recipe perl-native-5.36.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 551 tasks of which 533 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_fetch
Summary: There were 3 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: perl-5.36.0-r0 do_fetch: Fetcher failure: Unable to find file file://encodefix.patch anywhere. The paths that were searched were:
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl-5.36.0/poky
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl/poky
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/files/poky
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl-5.36.0/qemux86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl/qemux86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/files/qemux86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl-5.36.0/qemuall
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl/qemuall
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/files/qemuall
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl-5.36.0/x86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl/x86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/files/x86
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl-5.36.0/i686
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl/i686
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/files/i686
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl-5.36.0/
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl/
    /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/files/
    /home/pokybuild/yocto-worker/auh/build/build/build/downloads
ERROR: perl-5.36.0-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'file://encodefix.patch')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/perl/5.36.0-r0/temp/log.do_fetch.1327876
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_fetch) failed with exit code '1'

--===============0152804750101020146==--

