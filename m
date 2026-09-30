Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89412CA5FBB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 05:22:38 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6585.1790745757299907946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 22:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=njaFXse9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=b7aOJvnB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0f0c3c2cf-18d0a5d5-7e4b-417a-86df-605366e2ba96-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790745756;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=onn0tHMjJd23YAFKHf35ty/VGZqcIkivsMIIofD1Tsk=;
	b=njaFXse9FDHwQ/Qqvub+l7RoQ0Haa7rsw/hSJuV/wXeQiWtsw54Onh6dES9S1qEm
	4i09UnYq7yqN6tnB7kSM0tCaucbBKWvKreZHbJ7FHAOb+Afiyfbg+G71DgJ4FCjqIvt
	yurmeJHBqWvCUJHmSGPrqegtg89t7MBa9muU/qLo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790745756;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=onn0tHMjJd23YAFKHf35ty/VGZqcIkivsMIIofD1Tsk=;
	b=b7aOJvnB13XSkzRX2bLQcwKuSc7oo9wFmBbhxPBzI7gHYUP9essbfGUdiCpj+ICF
	HlaVPfWKaCuh/8w7HM3TzZx3vlmafLCtvrnbeBOkOFC2LrCevzxvA8NmRatpWzXDKeE
	WxhEQ7Rbn0TWMYdOO2g71DMyo2JTe7F61mPPglro=
Content-Type: multipart/mixed; boundary="===============1555259983474907911=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcl: upgrading to 9.1.0 FAILED
Message-ID: <010101a0f0c3c2cf-18d0a5d5-7e4b-417a-86df-605366e2ba96-000000@us-west-2.amazonses.com>
Date: Wed, 30 Sep 2026 05:22:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.30-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246911

--===============1555259983474907911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tcl* to *9.1.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade tcl -V 9.1.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1991 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-ddf052cf8d746a9b7709e5cfa7a7a7d29d537205"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ddf052cf8d746a9b7709e5cfa7a7a7d29d537205"
meta-yocto-bsp       
meta-poky            = "master:01f504740bcfa42ff53f4b3341a0dcee275fa6bd"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 960 .bb files complete (0 cached, 960 parsed). 1992 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-ddf052cf8d746a9b7709e5cfa7a7a7d29d537205"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:ddf052cf8d746a9b7709e5cfa7a7a7d29d537205"
meta-yocto-bsp       
meta-poky            = "master:01f504740bcfa42ff53f4b3341a0dcee275fa6bd"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  21% |#######                             | ETA:  0:00:00
Adding changed files:  43% |###############                     | ETA:  0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/tcl/tcl-core9.1.0-src.tar.gz...
ERROR: Execution of 'git add -f -A "macosx/tclMacOSXFCmd.c" "macosx/tclMacOSXNotify.c" "manifest.uuid" "tests-perf/chan.perf.tcl" "tests-perf/file.perf.tcl" "tests-perf/list.perf.tcl" "tests/aaa_exit.test" "tests/abstractlist.test" "tests/all.tcl" "tests/apply.test" "tests/assemble.test" "tests/binary.test" "tests/chan.test" "tests/chanio.test" "tests/clock.test" "tests/cmdInfo.test" "tests/coroutine.test" "tests/dict.test" "tests/encoding.test" "tests/error.test" "tests/event.test" "tests/exec.test" "tests/fCmd.test" "tests/fileName.test" "tests/fileSystem.test" "tests/http.test" "tests/httpProxy.test" "tests/httpcookie.test" "tests/icuUcmTests.tcl" "tests/info.test" "tests/init.test" "tests/internals.tcl" "tests/interp.test" "tests/io.test" "tests/ioCmd.test" "tests/iogt.test" "tests/listObj.test" "tests/listRep.test" "tests/load.test" "tests/lpop.test" "tests/lrange.test" "tests/lseq.test" "tests/main.test" "tests/mutex.test" "tests/nre.test" "tests/oo.test" "tests/ooProp.test" "t
 ests/ooUtil.test" "tests/package.test" "tests/reg.test" "tests/registry.test" "tests/safe.test" "tests/socket.test" "tests/split.test" "tests/string.test" "tests/stringObj.test" "tests/subst.test" "tests/switch.test" "tests/tailcall.test" "tests/tcltest.test" "tests/tcltests.tcl" "tests/timer.test" "tests/unixFCmd.test" "tests/unixInit.test" "tests/utf.test" "tests/utfext.test" "tests/winConsole.test" "tests/winDde.test" "tests/winFCmd.test" "tests/winPipe.test" "tests/zipfs.test" "tools/README" "tools/findBadExternals.tcl" "tools/mkVfs.tcl" "tools/tclsh.svg" "tools/tcltk-man2html.tcl" "tools/tsdPerf.c" "tools/uniClass.tcl" "tools/uniParse.tcl" "unix/Makefile.in" "unix/configure" "unix/configure.ac" "unix/dltest/Makefile.in" "unix/dltest/pkga.c" "unix/dltest/pkgb.c" "unix/dltest/pkgc.c" "unix/dltest/pkgd.c" "unix/dltest/pkge.c" "unix/dltest/pkgooa.c" "unix/dltest/pkgt.c" "unix/dltest/pkgua.c" ""unix/dltest/pkg\317\200.c"" "unix/tcl.m4" "unix/tcl.spec" "unix/tclAppInit.c" "unix/tclCo
 nfig.h.in" "unix/tclEpollNotfy.c" "unix/tclKqueueNotfy.c" "unix/tclLoadAix.c" "unix/tclLoadDyld.c"' failed with exit code 128:
fatal: pathspec 'unix/dltest/pkg317200.c' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1555259983474907911==--

