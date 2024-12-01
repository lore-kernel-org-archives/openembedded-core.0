Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE03D10DA3
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:05:58 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.149798.1733047553199512490
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:05:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=S8XwtgcF;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=sREVL+OL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019381af0853-c807946c-9441-4335-a4fe-0d1a4e94bf5a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c8GxlZwOfwwOubHFaDPnRykAmtswaq9B6Z9WGXG0X5c=;
	b=S8XwtgcFnBJqZDn09T3eQ7tetD0CLuZ8o+R677WXGL1xy27BNclDHyG0s5nltIDq
	Kd275OkRNHcMMkIPmtHSuBZYSq4Bu3qUlG6DAPNxBby5+LifMtCM7bPRjJUl88UPDc9
	+XfceED7EHSJGO9qb6kFKi/q6rIozNc8TIUyNisE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c8GxlZwOfwwOubHFaDPnRykAmtswaq9B6Z9WGXG0X5c=;
	b=sREVL+OLiadr/pig10kF+P2K4VFWJBgpyd8JR8g7Og/L97ePbDBJDWcYmKOz9s4D
	8C19g0ynFctztmfW9IzjpxSli1H9Pl2julOespjxwhP5pEyaGg9t2EyI1QOSJNvkdT6
	CfN+EwQ5oLzoMQqUtq30LlR8B7Yth99iK1GPzkzA=
Content-Type: multipart/mixed; boundary="===============8220189954850305350=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust-llvm,libstd-rs,cargo,rust: upgrading to
 1.83.0,1.83.0,1.83.0,1.83.0 FAILED
Message-ID: <0101019381af0853-c807946c-9441-4335-a4fe-0d1a4e94bf5a-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:05:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208056

--===============8220189954850305350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rust-llvm,libstd-rs,cargo,rust* to *1.83.0,1.83.0,1.83.0,1.83.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rust-llvm -V 1.83.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:09e69f87658789ba3a13148f3e22db22f56e864b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1878 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:09e69f87658789ba3a13148f3e22db22f56e864b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-648wbw0e: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-amvuheie/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-amvuheie/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:22:07
Adding changed files:   0% |                                    | ETA:  0:16:52
Adding changed files:   0% |                                    | ETA:  0:15:26
Adding changed files:   0% |                                    | ETA:  0:14:27
Adding changed files:   0% |                                    | ETA:  0:13:56
Adding changed files:   0% |                                    | ETA:  0:13:38
Adding changed files:   0% |                                    | ETA:  0:13:26
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.83.0-src.tar.xz;name=rust...
ERROR: Execution of 'git add -f -A "src/gcc/fixincludes/tests/base/objc/runtime.h" "src/gcc/fixincludes/tests/base/obstack.h" "src/gcc/fixincludes/tests/base/os/availability.h" "src/gcc/fixincludes/tests/base/os/base.h" "src/gcc/fixincludes/tests/base/os/trace.h" "src/gcc/fixincludes/tests/base/pixrect/memvar.h" "src/gcc/fixincludes/tests/base/pthread.h" "src/gcc/fixincludes/tests/base/reg_types.h" "src/gcc/fixincludes/tests/base/regex.h" "src/gcc/fixincludes/tests/base/regexp.h" "src/gcc/fixincludes/tests/base/rpc/auth.h" "src/gcc/fixincludes/tests/base/rpc/rpc.h" "src/gcc/fixincludes/tests/base/rpc/xdr.h" "src/gcc/fixincludes/tests/base/rpcsvc/rstat.h" "src/gcc/fixincludes/tests/base/rpcsvc/rusers.h" "src/gcc/fixincludes/tests/base/rtldef/decc$types.h" "src/gcc/fixincludes/tests/base/rtldef/if.h" "src/gcc/fixincludes/tests/base/rtldef/resolv.h" "src/gcc/fixincludes/tests/base/rtldef/setjmp.h" "src/gcc/fixincludes/tests/base/rtldef/signal.h" "src/gcc/fixincludes/tests/base/rtldef/st
 dio.h" "src/gcc/fixincludes/tests/base/rtldef/string.h" "src/gcc/fixincludes/tests/base/rtldef/wait.h" "src/gcc/fixincludes/tests/base/setjmp.h" "src/gcc/fixincludes/tests/base/signal.h" "src/gcc/fixincludes/tests/base/sparc/asm_linkage.h" "src/gcc/fixincludes/tests/base/spawn.h" "src/gcc/fixincludes/tests/base/stdarg.h" "src/gcc/fixincludes/tests/base/stdint-aix.h" "src/gcc/fixincludes/tests/base/stdint-darwin.h" "src/gcc/fixincludes/tests/base/stdint-hpux11.h" "src/gcc/fixincludes/tests/base/stdint-newlib.h" "src/gcc/fixincludes/tests/base/stdint.h" "src/gcc/fixincludes/tests/base/stdio.h" "src/gcc/fixincludes/tests/base/stdio_tag.h" "src/gcc/fixincludes/tests/base/stdlib.h" "src/gcc/fixincludes/tests/base/string.h" "src/gcc/fixincludes/tests/base/strings.h" "src/gcc/fixincludes/tests/base/sundev/vuid_event.h" "src/gcc/fixincludes/tests/base/sunwindow/win_lock.h" "src/gcc/fixincludes/tests/base/sym.h" "src/gcc/fixincludes/tests/base/sys/_inttypes.h" "src/gcc/fixincludes/tests/base
 /sys/cdefs.h" "src/gcc/fixincludes/tests/base/sys/feature_tests.h" "src/gcc/fixincludes/tests/base/sys/file.h" "src/gcc/fixincludes/tests/base/sys/int_const.h" "src/gcc/fixincludes/tests/base/sys/int_limits.h" "src/gcc/fixincludes/tests/base/sys/inttypes.h" "src/gcc/fixincludes/tests/base/sys/machine.h" "src/gcc/fixincludes/tests/base/sys/mman.h" "src/gcc/fixincludes/tests/base/sys/pthread.h" "src/gcc/fixincludes/tests/base/sys/signal.h" "src/gcc/fixincludes/tests/base/sys/socket.h" "src/gcc/fixincludes/tests/base/sys/spinlock.h" "src/gcc/fixincludes/tests/base/sys/stat.h" "src/gcc/fixincludes/tests/base/sys/sysmacros.h" "src/gcc/fixincludes/tests/base/sys/time.h" "src/gcc/fixincludes/tests/base/sys/types.h" "src/gcc/fixincludes/tests/base/sys/ucontext.h" "src/gcc/fixincludes/tests/base/sys/wait.h" "src/gcc/fixincludes/tests/base/testing.h" "src/gcc/fixincludes/tests/base/tgmath.h" "src/gcc/fixincludes/tests/base/time.h" "src/gcc/fixincludes/tests/base/tinfo.h" "src/gcc/fixincludes/
 tests/base/types/vxTypesBase.h" "src/gcc/fixincludes/tests/base/unistd.h" "src/gcc/fixincludes/tests/base/yvals.h" "src/gcc/gcc/ABOUT-GCC-NLS" "src/gcc/gcc/BASE-VER" "src/gcc/gcc/COPYING" "src/gcc/gcc/COPYING.LIB" "src/gcc/gcc/COPYING3" "src/gcc/gcc/COPYING3.LIB" "src/gcc/gcc/ChangeLog" "src/gcc/gcc/ChangeLog-1997" "src/gcc/gcc/ChangeLog-1998" "src/gcc/gcc/ChangeLog-1999" "src/gcc/gcc/ChangeLog-2000" "src/gcc/gcc/ChangeLog-2001" "src/gcc/gcc/ChangeLog-2002" "src/gcc/gcc/ChangeLog-2003" "src/gcc/gcc/ChangeLog-2004" "src/gcc/gcc/ChangeLog-2005" "src/gcc/gcc/ChangeLog-2006" "src/gcc/gcc/ChangeLog-2007" "src/gcc/gcc/ChangeLog-2008" "src/gcc/gcc/ChangeLog-2009" "src/gcc/gcc/ChangeLog-2010" "src/gcc/gcc/ChangeLog-2011" "src/gcc/gcc/ChangeLog-2012" "src/gcc/gcc/ChangeLog-2013" "src/gcc/gcc/ChangeLog-2014" "src/gcc/gcc/ChangeLog-2015" "src/gcc/gcc/ChangeLog-2016" "src/gcc/gcc/ChangeLog-2017" "src/gcc/gcc/ChangeLog-2018" "src/gcc/gcc/ChangeLog-2019" "src/gcc/gcc/ChangeLog-2020" "src/gcc/gcc/
 ChangeLog-2021" "src/gcc/gcc/ChangeLog-2022"' failed with exit code 128:
fatal: pathspec 'src/gcc/fixincludes/tests/base/rtldef/decc.h' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8220189954850305350==--

