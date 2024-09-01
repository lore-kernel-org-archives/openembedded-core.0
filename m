Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED47CA101E
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 06:40:57 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.11407.1725172853090346564
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Aug 2024 23:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ecSARbYg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0i+uwWXk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191ac50a686-b7999c87-04e4-475a-8763-8a9066955db4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Of4XhrXSDG2Ahb1NogqIgP6+OI72EVwTyXBvTWHywoI=;
	b=ecSARbYgWFxaaYgCHcqToMZer4RUs0dr6EjfC8oJZjgVXtR3tCPwb8194k4IVaOQ
	NtbPmOPVqpqbGQ9UqtqXRCtPLGxmEMq20n3arwKjInoCErnsQiVfRziwrc/H+E0T6HO
	Avlb2bMEy0kwlrSwSNYWK/gaISmFoI9/WKrX/if4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1725172852;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Of4XhrXSDG2Ahb1NogqIgP6+OI72EVwTyXBvTWHywoI=;
	b=0i+uwWXkj/sfbZvNja2GeYv27jy63E29effDrRQxhePVjBWlVJPPPEi8Gxx/cm3B
	lXqGHUTY7g5zp64AtSzkI8tbcvaJA6MD+zzyZcgBrpIqM9zFt9SFLhQYDjRi5/YlO7K
	ZeYIGjhHCNPHq+sv6IqVsNkwveXzzLfVsM29w8/k=
Content-Type: multipart/mixed; boundary="===============8045032723642242089=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtool-native,libtool,nativesdk-libtool,libtool-cross:
 upgrading to 2.5.2,2.5.2,2.5.2,2.5.2 FAILED
Message-ID: <01010191ac50a686-b7999c87-04e4-475a-8763-8a9066955db4-000000@us-west-2.amazonses.com>
Date: Sun, 1 Sep 2024 06:40:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 06:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203982

--===============8045032723642242089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtool-native,libtool,nativesdk-libtool,libtool-cross* to *2.5.2,2.5.2,2.5.2,2.5.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libtool -V 2.5.2
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
Parsing recipes...WARNING: /home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libtool-native/libtool-native_2.5.2.bb: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: externalsrc.bbclass [native-last]
done.
Parsing of 917 .bb files complete (916 cached, 1 parsed). 1868 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.

Summary: There was 1 WARNING message.
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: externalsrc.bbclass [native-last]
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ae0abf6bc5a042b7a57fd7144e3af09a957ed950"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ae0abf6bc5a042b7a57fd7144e3af09a957ed950"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 14 Local 9 Mirrors 0 Missed 5 Current 16 (64% match, 83% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: externalsrc.bbclass [native-last]
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: externalsrc.bbclass [native-last]
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: externalsrc.bbclass [native-last]
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: externalsrc.bbclass [native-last]
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: externalsrc.bbclass [native-last]
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: externalsrc.bbclass [native-last]
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: externalsrc.bbclass [native-last]
NOTE: libtool-native: compiling from external source tree /home/pokybuild/yocto-worker/auh/build/build/workspace/sources/libtool-native
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: externalsrc.bbclass [native-last]
WARNING: QA Issue: libtool-native: native/nativesdk class is not inherited last, this can result in unexpected behaviour. Classes inherited after native/nativesdk: externalsrc.bbclass [native-last]
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/workspace/recipes/libtool-native/libtool-native_2.5.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72e.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libtool-native', 'gettext-minimal-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'autoconf-native', 'automake-native', 'gnu-config-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.17
| Features: subsecond-mtime
| 
| Copyright (C) 2024 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later
|   <https://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
| 
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1
| NOTE: Executing ACLOCAL="aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/attr-native/2.5.2/recipe-sysroot-native/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --exclude=autopoint -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/attr-native/2.5.2/attr-2.5.2/m4/
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: running: aclocal --system-acdir=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/attr-native/2.5.2/recipe-sysroot-native/usr/share/aclocal/ -I /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/attr-native/2.5.2/attr-2.5.2/m4/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: running: libtoolize --copy --force
| libtoolize:   error: $pkgauxdir is not a directory: '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/libtool-native/2.5.2/recipe-sysroot-native/usr/share/libtool/build-aux'
| autoreconf: error: libtoolize failed with exit status: 1
| ERROR: autoreconf execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/attr-native/2.5.2/temp/run.do_configure.2542179:285 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/attr-native/2.5.2/temp/run.do_configure.2542179, line 285
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/attr-native/2.5.2/temp/run.do_configure.2542179, line 248
| 	#3: autotools_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/attr-native/2.5.2/temp/run.do_configure.2542179, line 227
| 	#4: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/attr-native/2.5.2/temp/run.do_configure.2542179, line 151
| 	#5: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/attr-native/2.5.2/temp/run.do_configure.2542179, line 289
NOTE: Tasks Summary: Attempted 93 tasks of which 74 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901054801.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240901054801.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: autoreconf execution failed.
ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/attr-native/2.5.2/temp/run.do_configure.2542179' failed with exit code 1
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/attr-native/2.5.2/temp/log.do_configure.2542179
ERROR: Extracting source for libtool failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8045032723642242089==--

