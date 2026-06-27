Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0A7C43327
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 06:08:04 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50705.1782540476394016804
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 23:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JsMgPyTj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KiJkMWff;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f07b11cc5-c5c08554-0e00-483e-a0ef-3f255b9055ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782540475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mwN1IPzv0RtWvBas9L2589LUTW164Rviv2d9w7WvRt8=;
	b=JsMgPyTjZShmIWgBw7zq83YgkbNrw9rjmW2JNo5GItJLQf5Y9zlS0cZprriGMcL2
	K7lV0P5n3v1ZmxsD/fp5sCOBRhPKGxhrv0d9LTyOlyzQsZ9v+Hcrj25hiZeemT4ESxE
	U3lJt0DqgjNxppleFz6uH0evWFi9gdlyye5S6BTs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782540475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mwN1IPzv0RtWvBas9L2589LUTW164Rviv2d9w7WvRt8=;
	b=KiJkMWffxlif3uOlO7VpAXs6oRlpfysU85YCZF1GrWd+OiaopcSY7s+wtYY1kSA1
	9yKgFQkSGIa8U+pEUWF/iy4VzmHuhViVb/iTcXb9yRliyHm48rPwHkWo4I+s7Vokxvw
	7aA1n8w6ghk7uFFEngJTAcDCXiP2iygOSiuBs5X0=
Content-Type: multipart/mixed; boundary="===============9084057134395760167=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcl: upgrading to 9.0.4 FAILED
Message-ID: <0101019f07b11cc5-c5c08554-0e00-483e-a0ef-3f255b9055ef-000000@us-west-2.amazonses.com>
Date: Sat, 27 Jun 2026 06:07:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.27-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 06:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239677

--===============9084057134395760167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tcl* to *9.0.4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade tcl -V 9.0.4
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1978 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-3c6022885bf1757f2f6b44ecdb90cf3cd5da2b88"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:3c6022885bf1757f2f6b44ecdb90cf3cd5da2b88"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 952 .bb files complete (0 cached, 952 parsed). 1979 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-3c6022885bf1757f2f6b44ecdb90cf3cd5da2b88"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:3c6022885bf1757f2f6b44ecdb90cf3cd5da2b88"
meta-yocto-bsp       
meta-poky            = "master:366fa2f21bfb0d9c4de492e0204a0dd38ce241ab"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  20% |#######                             | ETA:  0:00:00
Adding changed files:  41% |###############                     | ETA:  0:00:00
Adding changed files:  62% |######################              | ETA:  0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/tcl/tcl-core9.0.4-src.tar.gz...
ERROR: Execution of 'git add -f -A "tests-perf/chan.perf.tcl" "tests-perf/file.perf.tcl" "tests-perf/list.perf.tcl" "tests-perf/listPerf.tcl" "tests-perf/timer-event.perf.tcl" "tests/basic.test" "tests/binary.test" "tests/brodnik.test" "tests/clock-ivm.test" "tests/clock.test" "tests/encoding.test" "tests/encodingVectors.tcl" "tests/env.test" "tests/exec.test" "tests/fCmd.test" "tests/fileName.test" "tests/fileSystem.test" "tests/httpTest.tcl" "tests/httpTestScript.tcl" "tests/icuUcmTests.tcl" "tests/interp.test" "tests/lseq.test" "tests/mutex.test" "tests/namespace.test" "tests/package.test" "tests/registry.test" "tests/safe-stock.test" "tests/safe-zipfs.test" "tests/safe.test" "tests/tcltests.tcl" "tests/utf.test" "tests/utfext.test" "tests/var.test" "tests/winConsole.test" "tests/winFCmd.test" "tests/zlib.test" "tools/checkLibraryDoc.tcl" "tools/findBadExternals.tcl" "tools/index.tcl" "tools/loadICU.tcl" "tools/mkdepend.tcl" "tools/tclZIC.tcl" "tools/tcltk-man2html.tcl" "unix/Make
 file.in" "unix/configure" "unix/configure.ac" "unix/dltest/pkga.c" "unix/dltest/pkgb.c" "unix/dltest/pkgc.c" "unix/dltest/pkgd.c" "unix/dltest/pkge.c" "unix/dltest/pkgt.c" "unix/dltest/pkgua.c" ""unix/dltest/pkg\317\200.c"" "unix/tcl.m4" "unix/tcl.spec" "unix/tclEpollNotfy.c" "unix/tclKqueueNotfy.c" "unix/tclSelectNotfy.c" "unix/tclUnixChan.c" "unix/tclUnixFile.c" "unix/tclUnixPort.h" "unix/tclUnixThrd.c" "win/Makefile.in" "win/configure" "win/configure.ac" "win/makefile.vc" "win/nmakehlp.c" "win/rules.vc" "win/tcl.m4" "win/tcl.rc" "win/tclAppInit.c" "win/tclWin32Dll.c" "win/tclWinDde.c" "win/tclWinFCmd.c" "win/tclWinFile.c" "win/tclWinThrd.c" "win/tcltest.rc" "win/vctool.bat"' failed with exit code 128:
fatal: pathspec 'unix/dltest/pkg317200.c' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9084057134395760167==--

