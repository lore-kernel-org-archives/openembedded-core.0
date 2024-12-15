Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13256E77184
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:29:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.33378.1734254979133655858
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KJJEWE54;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lhPU72S2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010193c9a6e581-678a02d3-f664-4f2c-9acd-e1093b0a3219-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IKKAi8m++WgUF5tRJ5+M3NmGi3a5Kdcai1BoAnW+WBQ=;
	b=KJJEWE54Kxa/wnrDbWEK7n8LDo5yQH5vQr5i+1xHnSpKscp2JbVer5laU2ltZJSJ
	DcUYHN0h7AGXWm1r3kusFx3VP3lvrqFn73I054selEvF0QXsvy+/4lAyrxpSWa1qgcH
	S0sdsVZsMRlXBPc+0hcb1dDVhfFapMjCo6rnxelc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254978;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IKKAi8m++WgUF5tRJ5+M3NmGi3a5Kdcai1BoAnW+WBQ=;
	b=lhPU72S2rL0UWeqm6Z/hSeWDiU7jPGsEahB/W1hLAklM7G8DaEV+DuD0tUwA9JYo
	Pz00i+1q5MBz2uTq4POst0qBf6rIRJDwO7euiKcRqvmOjhI/0SMv0lyXToA+epznKEh
	7NwpL8gTcmvltQ5tqj5pevSsNesWgWx9zkpoCZ+A=
Content-Type: multipart/mixed; boundary="===============7459874828559372996=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust,libstd-rs,rust-llvm,cargo: upgrading to
 1.83.0,1.83.0,1.83.0,1.83.0 FAILED
Message-ID: <01010193c9a6e581-678a02d3-f664-4f2c-9acd-e1093b0a3219-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208706

--===============7459874828559372996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rust,libstd-rs,rust-llvm,cargo* to *1.83.0,1.83.0,1.83.0,1.83.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rust -V 1.83.0
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
workspace            = "tmp-auh-upgrades:d30ae1aa9d7831e0f29b51290e9114f3f6e8af19"

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
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1876 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:d30ae1aa9d7831e0f29b51290e9114f3f6e8af19"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-k31hfdd4: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-i19gnpla/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-i19gnpla/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:22:07
Adding changed files:   0% |                                    | ETA:  0:16:47
Adding changed files:   0% |                                    | ETA:  0:15:24
Adding changed files:   0% |                                    | ETA:  0:14:25
Adding changed files:   0% |                                    | ETA:  0:13:56
Adding changed files:   0% |                                    | ETA:  0:13:37
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
--===============7459874828559372996==--

