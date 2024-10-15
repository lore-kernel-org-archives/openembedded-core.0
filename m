Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF461D1F9B7
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:02 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11863.1728994550401994657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=gDHKln2K;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=2HkgFb5Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010192901b50db-dc91e3a1-80b3-4400-aedb-668587da5c03-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994562;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=spYAPkm03y/AMM0Rgf8UeVuKuLRPrYLEuuGxVx5FEp0=;
	b=gDHKln2KpgixeWV4pZfRSP8U1WZaS2WG3N3BhCSbFCFbnxx7+kia/P4sjvsq4G/0
	pXKYtyJCdVR6037Tm9uqUfpzbDocCex8Z4B92Myz5smCht76SFfcwCQ9q6Uda/3hDXh
	5kWAX/ixUiMzVLENJst7/SLOyZ5T2cYCu95QJvLk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994562;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=spYAPkm03y/AMM0Rgf8UeVuKuLRPrYLEuuGxVx5FEp0=;
	b=2HkgFb5ZEAFlej3mF/RekmxSCyKaZ2cdUHnHmDxGtfudVxggkhY070aVsKNc3uBU
	SQuugIGvZO9+pFxXQsjfn2UazU3MOO3dgNLZQzYveQW6gh/6wlItxI7OzaJXkG5KKDR
	jB2SuKgFzQnJY8exULICoFyxDjn7rjWyYqnP+sGA=
Content-Type: multipart/mixed; boundary="===============8585368420521712669=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcl: upgrading to 9.0.0 FAILED
Message-ID: <01010192901b50db-dc91e3a1-80b3-4400-aedb-668587da5c03-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205861

--===============8585368420521712669==
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
Loaded 1875 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:2346f018ba1c22b211bc70121b1dda3aeb7dd39a"

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
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:2346f018ba1c22b211bc70121b1dda3aeb7dd39a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-uc8yicul: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-i68wrcrm/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-i68wrcrm/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
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
--===============8585368420521712669==--

