Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF04BCFD2F0
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.53254.1728588940620120914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=D5jpuapN;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=h9D+b9e+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019277ee1cb0-f24c5d1c-dd70-45bb-9e09-1f77b80cc1ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588946;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gtQt7mtq6JRxYQYBNSBitxfGVJv1VTXtO3VHXdEWi+8=;
	b=D5jpuapNZDvYPuFXKQMq9ESVYZExG0V8sg7YOmvTNeHE4Kv3f5km+Gn77W7CDCRz
	sc4rConITYSbnqVeAkl2iaLr65Q82qljZzmxSZkP5qi9uADtLHqg/M1FIWeFawHfyqk
	ktB2PVUOHLWyzSIlrF3OcoDBDyOb7jxCN1sOn/jE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588946;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gtQt7mtq6JRxYQYBNSBitxfGVJv1VTXtO3VHXdEWi+8=;
	b=h9D+b9e+5Eic5Nb4vVuC8sFPBebamnIZZ2lK5B6q2Fo+UKJzz9/v7Ub+B2zOkjfn
	AeRRU0cEjvrrMBoKnneN7q1xFI+4r5ij/SowVNPbOLoiw4eDaogOdFlRImnmGqv/o29
	WasFSyUoDKj/WNcQ5uEHRBbfD4YZEWKXKgUrjvjA=
Content-Type: multipart/mixed; boundary="===============0498365947285342420=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcl: upgrading to 9.0.0 FAILED
Message-ID: <0101019277ee1cb0-f24c5d1c-dd70-45bb-9e09-1f77b80cc1ff-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205450

--===============0498365947285342420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tcl* to *9.0.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade tcl -V 9.0.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cef41d51e85667699d7e369750352c58e91b04ed"

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
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1872 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cef41d51e85667699d7e369750352c58e91b04ed"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-st1lnxwp: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-r_3y6qxz/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-r_3y6qxz/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   9% |###                                 | ETA:  0:00:01
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/tcl/tcl-core9.0.0-src.tar.gz...
ERROR: Execution of 'git add -f -A "tests/zipfiles/test-password.zip" "tests/zipfiles/test-password2.zip" "tests/zipfiles/test-paths.zip" "tests/zipfiles/test-zip-in-zip.zip" "tests/zipfiles/test.zip" "tests/zipfiles/testbzip2.zip" "tests/zipfiles/testdeflated2.zip" "tests/zipfiles/testfile-UTF8.zip" "tests/zipfiles/testfile-cp437.zip" "tests/zipfiles/testfile-lzma.zip" "tests/zipfiles/testfile-nocompression.zip" "tests/zipfiles/testfile-xz.zip" "tests/zipfiles/testfile-zstd.zip" "tests/zipfiles/teststored.zip" "tests/zipfiles/zip64.zip" "tests/zipfs.test" "tools/addVerToFile.tcl" "tools/findDocWords.tcl" "tools/installVfs.tcl" "tools/makeHeader.tcl" "tools/mkVfs.tcl" "tools/tclOOScript.tcl" "tools/tclsh.svg" "tools/tsdPerf.c" "tools/ucm2tests.tcl" "tools/valgrind_check_success" "tools/valgrind_suppress" "unix/configure.ac" "unix/dltest/embtest.c" "unix/dltest/pkgt.c" ""unix/dltest/pkg\317\200.c"" "unix/tclEpollNotfy.c" "unix/tclKqueueNotfy.c" "unix/tclSelectNotfy.c" "win/configure.a
 c" "win/tclWinPanic.c" "win/vctool.bat" ".github/workflows/linux-build.yml" ".github/workflows/mac-build.yml" ".github/workflows/win-build.yml" "ChangeLog" "ChangeLog.1999" "ChangeLog.2000" "ChangeLog.2001" "ChangeLog.2002" "ChangeLog.2003" "ChangeLog.2004" "ChangeLog.2005" "ChangeLog.2007" "ChangeLog.2008" "README.md" "changes" "compat/dirent.h" "compat/dirent2.h" "compat/fake-rfc2553.c" "compat/float.h" "compat/memcmp.c" "compat/mkstemp.c" "compat/opendir.c" "compat/stdlib.h" "compat/string.h" "compat/strstr.c" "compat/strtol.c" "compat/strtoul.c" "compat/unistd.h" "compat/waitpid.c" "compat/zlib/win64/libz.dll.a" "compat/zlib/win64/zlib1.dll" "doc/Access.3" "doc/AddErrInfo.3" "doc/Alloc.3" "doc/AllowExc.3" "doc/AppInit.3" "doc/AssocData.3" "doc/Async.3" "doc/BackgdErr.3" "doc/Backslash.3" "doc/BoolObj.3" "doc/ByteArrObj.3" "doc/CallDel.3" "doc/Cancel.3" "doc/ChnlStack.3" "doc/Class.3" "doc/CmdCmplt.3" "doc/Concat.3" "doc/CrtAlias.3" "doc/CrtChannel.3" "doc/CrtChnlHdlr.3" "doc/Crt
 CloseHdlr.3" "doc/CrtCommand.3" "doc/CrtFileHdlr.3" "doc/CrtInterp.3" "doc/CrtMathFnc.3" "doc/CrtObjCmd.3" "doc/CrtTimerHdlr.3" "doc/CrtTrace.3" "doc/DString.3" "doc/DetachPids.3" "doc/DictObj.3" "doc/DoOneEvent.3"' failed with exit code 128:
fatal: pathspec 'unix/dltest/pkg317200.c' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0498365947285342420==--

