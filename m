Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BE5C0218B
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:08 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.17794.1736936764051874500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hNiBaoGw;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=GpqNA/Ni;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010194697faf05-138f57d2-1dc9-4d62-aaee-6ea53105f3b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936763;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RG3bSL8gEGcE1lQh+OPts/V1k1PMPgOcpZKJQ8lQhiI=;
	b=hNiBaoGw4Kvap+Qv9J1ErXcre2FntfWLqDppKqAHhdKZt8iH4ub0a0p8hprrciNj
	OJbRR94M50Cx1zZpbKy1Lvs3Qjpxm674bPU/Tt+X1lc8lGmFXLJtrcC2amoqZ/flA1A
	Vq84M36JOUTd6CO/s/N7YuiFJEpdpcyQujwhXIRE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936763;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RG3bSL8gEGcE1lQh+OPts/V1k1PMPgOcpZKJQ8lQhiI=;
	b=GpqNA/Ni3DUBKms1kSbkOsAkft915F/ahNJlFfiun9FcoXS7zz5YBLndENEbNjC3
	aMbi4WCagUZ+eg/9MEK6LtTSdMD5fgmBNxkesTY+j4g2myn9H29ztXfN1QQ/EWKu/RC
	gbCuJ+IsZCrf2eaF3ELys83l+0O7vqOfU9BZiysw=
Content-Type: multipart/mixed; boundary="===============7525442229805277606=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust,libstd-rs,cargo,rust-llvm: upgrading to
 1.84.0,1.84.0,1.84.0,1.84.0 FAILED
Message-ID: <01010194697faf05-138f57d2-1dc9-4d62-aaee-6ea53105f3b8-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209829

--===============7525442229805277606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rust,libstd-rs,cargo,rust-llvm* to *1.84.0,1.84.0,1.84.0,1.84.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rust -V 1.84.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
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
workspace            = "tmp-auh-upgrades:cd6fce7abbc3711448028ea27c41c913391cff52"

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
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:cd6fce7abbc3711448028ea27c41c913391cff52"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-h96bhyo1: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-rzqibiw6/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-rzqibiw6/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                    | ETA:  0:22:20
Adding changed files:   0% |                                    | ETA:  0:17:07
Adding changed files:   0% |                                    | ETA:  0:15:41
Adding changed files:   0% |                                    | ETA:  0:14:42
Adding changed files:   0% |                                    | ETA:  0:14:05
Adding changed files:   0% |                                    | ETA:  0:13:56
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://static.rust-lang.org/dist/rustc-1.84.0-src.tar.xz;name=rust...
ERROR: Execution of 'git add -f -A "src/gcc/fixincludes/server.c" "src/gcc/fixincludes/server.h" "src/gcc/fixincludes/system.h" "src/gcc/fixincludes/tests/base/AvailabilityInternal.h" "src/gcc/fixincludes/tests/base/AvailabilityMacros.h" "src/gcc/fixincludes/tests/base/X11/ShellP.h" "src/gcc/fixincludes/tests/base/X11/Xmu.h" "src/gcc/fixincludes/tests/base/Xm/BaseClassI.h" "src/gcc/fixincludes/tests/base/Xm/Traversal.h" "src/gcc/fixincludes/tests/base/alloca.h" "src/gcc/fixincludes/tests/base/ansi/math.h" "src/gcc/fixincludes/tests/base/ansi/stdlib.h" "src/gcc/fixincludes/tests/base/arch/i960/archI960.h" "src/gcc/fixincludes/tests/base/architecture/ppc/math.h" "src/gcc/fixincludes/tests/base/assert.h" "src/gcc/fixincludes/tests/base/bits/fenv.h" "src/gcc/fixincludes/tests/base/bits/floatn.h" "src/gcc/fixincludes/tests/base/bits/huge_val.h" "src/gcc/fixincludes/tests/base/bits/string2.h" "src/gcc/fixincludes/tests/base/bsd/libc.h" "src/gcc/fixincludes/tests/base/c_asm.h" "src/gcc/fixi
 ncludes/tests/base/com_err.h" "src/gcc/fixincludes/tests/base/complex.h" "src/gcc/fixincludes/tests/base/ctrl-quotes-def-1.h" "src/gcc/fixincludes/tests/base/ctype.h" "src/gcc/fixincludes/tests/base/curses.h" "src/gcc/fixincludes/tests/base/dispatch/object.h" "src/gcc/fixincludes/tests/base/errno.h" "src/gcc/fixincludes/tests/base/fcntl.h" "src/gcc/fixincludes/tests/base/features.h" "src/gcc/fixincludes/tests/base/fixinc-test-limits.h" "src/gcc/fixincludes/tests/base/hsfs/hsfs_spec.h" "src/gcc/fixincludes/tests/base/i386/setjmp.h" "src/gcc/fixincludes/tests/base/ia64/sys/getppdp.h" "src/gcc/fixincludes/tests/base/inttypes.h" "src/gcc/fixincludes/tests/base/io-quotes-def-1.h" "src/gcc/fixincludes/tests/base/ioLib.h" "src/gcc/fixincludes/tests/base/iso/math_c99.h" "src/gcc/fixincludes/tests/base/iso/math_iso.h" "src/gcc/fixincludes/tests/base/iso/stdio_iso.h" "src/gcc/fixincludes/tests/base/iso/stdlib_c99.h" "src/gcc/fixincludes/tests/base/iso/stdlib_iso.h" "src/gcc/fixincludes/tests/
 base/linux/vt.h" "src/gcc/fixincludes/tests/base/locale.h" "src/gcc/fixincludes/tests/base/mach-o/dyld.h" "src/gcc/fixincludes/tests/base/mach-o/swap.h" "src/gcc/fixincludes/tests/base/malloc.h" "src/gcc/fixincludes/tests/base/math.h" "src/gcc/fixincludes/tests/base/net/if.h" "src/gcc/fixincludes/tests/base/net/if_arp.h" "src/gcc/fixincludes/tests/base/netdnet/dnetdb.h" "src/gcc/fixincludes/tests/base/netinet/in.h" "src/gcc/fixincludes/tests/base/netinet/ip.h" "src/gcc/fixincludes/tests/base/objc/runtime.h" "src/gcc/fixincludes/tests/base/obstack.h" "src/gcc/fixincludes/tests/base/os/availability.h" "src/gcc/fixincludes/tests/base/os/base.h" "src/gcc/fixincludes/tests/base/os/trace.h" "src/gcc/fixincludes/tests/base/pixrect/memvar.h" "src/gcc/fixincludes/tests/base/pthread.h" "src/gcc/fixincludes/tests/base/reg_types.h" "src/gcc/fixincludes/tests/base/regex.h" "src/gcc/fixincludes/tests/base/regexp.h" "src/gcc/fixincludes/tests/base/rpc/auth.h" "src/gcc/fixincludes/tests/base/rpc/rp
 c.h" "src/gcc/fixincludes/tests/base/rpc/xdr.h" "src/gcc/fixincludes/tests/base/rpcsvc/rstat.h" "src/gcc/fixincludes/tests/base/rpcsvc/rusers.h" "src/gcc/fixincludes/tests/base/rtldef/decc$types.h" "src/gcc/fixincludes/tests/base/rtldef/if.h" "src/gcc/fixincludes/tests/base/rtldef/resolv.h" "src/gcc/fixincludes/tests/base/rtldef/setjmp.h" "src/gcc/fixincludes/tests/base/rtldef/signal.h" "src/gcc/fixincludes/tests/base/rtldef/stdio.h" "src/gcc/fixincludes/tests/base/rtldef/string.h" "src/gcc/fixincludes/tests/base/rtldef/wait.h" "src/gcc/fixincludes/tests/base/setjmp.h" "src/gcc/fixincludes/tests/base/signal.h" "src/gcc/fixincludes/tests/base/sparc/asm_linkage.h" "src/gcc/fixincludes/tests/base/spawn.h" "src/gcc/fixincludes/tests/base/stdarg.h" "src/gcc/fixincludes/tests/base/stdint-aix.h" "src/gcc/fixincludes/tests/base/stdint-darwin.h" "src/gcc/fixincludes/tests/base/stdint-hpux11.h" "src/gcc/fixincludes/tests/base/stdint-newlib.h" "src/gcc/fixincludes/tests/base/stdint.h" "src/gcc
 /fixincludes/tests/base/stdio.h" "src/gcc/fixincludes/tests/base/stdio_tag.h" "src/gcc/fixincludes/tests/base/stdlib.h" "src/gcc/fixincludes/tests/base/string.h" "src/gcc/fixincludes/tests/base/strings.h" "src/gcc/fixincludes/tests/base/sundev/vuid_event.h" "src/gcc/fixincludes/tests/base/sunwindow/win_lock.h" "src/gcc/fixincludes/tests/base/sym.h" "src/gcc/fixincludes/tests/base/sys/_inttypes.h" "src/gcc/fixincludes/tests/base/sys/cdefs.h" "src/gcc/fixincludes/tests/base/sys/feature_tests.h" "src/gcc/fixincludes/tests/base/sys/file.h" "src/gcc/fixincludes/tests/base/sys/int_const.h" "src/gcc/fixincludes/tests/base/sys/int_limits.h"' failed with exit code 128:
fatal: pathspec 'src/gcc/fixincludes/tests/base/rtldef/decc.h' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7525442229805277606==--

