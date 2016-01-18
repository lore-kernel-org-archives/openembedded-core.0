Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB3B60616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 21:34:23 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id x140so13054511oif.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 13:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PlCmUGDik5Rotu6UxN+AdyOdy+bAHbtwFKmI5sDRido=;
	b=zWoZu62te0yCs7qrqq6x3O8KZzoA6cbvgQdg1KOyL23L4/3Kfb9bp1QTjczPK7o5rz
	W5IenKzHspkDqOwxKrmfWLLTRuonVVbUwuArUZZpxZPwyg32BHHKFm3nasMKXw5J/cS4
	FX9CFCsTpWsbD2moxXKPdw7r4pYuu/1Ko5EsCH3OMncXcMOGonkSvDWfDaLZAwla5LDQ
	P8c9OGoGaSdV8N0dH40Vw2ZPxK84ap4ET7CWUjRL+frlvU+rI0qBjHjSIvEyxCjOLXk5
	5Z7/iDLGrraVaA5+z0n8OAEsZJw7XBpHoISdW5OFyScqHdhqyZgwnGU9V9KplE4VHnVj
	2+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PlCmUGDik5Rotu6UxN+AdyOdy+bAHbtwFKmI5sDRido=;
	b=U9YfQ1Et6SZc/SKnQi2pbqQLhJdgJJSh9EhMG3NoXOBL5LaFHg5qLi1VO+WyZeTw1j
	1JTHLP5cYHtacZtM5CHLizFixV9yyxhh5FdlN8/QBOkjuZLFHUQyvj03nE+Q6nh//kp7
	mbt/aLM5OTv+XaIBuYApQ0gubFVDqgn09/93MAYyWygsuO/AS/fNkO5yiRYYnamC4DYc
	pWITZwgbRH9aBrNJ/SdctwT6r5TupbWhNWwcZMTU+b820DkDgDDYCn+j5Qhskxb72U0D
	pSnQmYc8a0eOEshkgZc3gHHvpeUb/a6H77en3Uw62geNH5mpxRYv0SIPYpIz+iDKRqqf
	RIcA==
X-Gm-Message-State: ALoCoQlIFjlHksQTLQ5gbQBuLvjexFT0NjZlPjop7g8LXNRpKfi+WkWz6/azwbbNR0Ine+wf0Td3wgmxJyudaQaxWIUFywdKvg==
X-Received: by 10.202.200.79 with SMTP id y76mr20026050oif.111.1453152864334; 
	Mon, 18 Jan 2016 13:34:24 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id v6sm5928816oer.10.2016.01.18.13.34.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jan 2016 13:34:23 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 13:33:52 -0800
Message-Id: <1453152832-12019-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453152832-12019-1-git-send-email-armccurdy@gmail.com>
References: <1453152832-12019-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 5/5] strace: update 4.10 -> 4.11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jan 2016 21:34:23 -0000

Noteworthy changes in release 4.11 (2015-12-21)
===============================================

* Changes in behavior
  * Some syscalls have different names depending on architecture and
    personality.  In these cases, syscall filtering and printing now
    consistently uses the names that match corresponding __NR_* kernel
    macros of the tracee's architecture and personality.
  * Added strace prefix to all diagnostic messages.

* Improvements
  * Enhanced and extended test suite.
  * Implemented reliable tracing of processes whose personality differs
    from the personality of strace, fixed decoding of 32-bit personality
    syscalls on 64-bit architectures.
  * When some data referenced by syscall arguments is irrelevant or cannot
    be read from tracee's memory, strace now prints its address consistently.
  * When a syscall is restarted using restart_syscall mechanism, strace now
    shows the syscall name on architectures that expose this information.
  * Print values returned by epoll_create1, eventfd, eventfd2, fanotify_init,
    inotify_init1, perf_event_open, pipe, pipe2, signalfd, signalfd4, socket,
    socketpair, timerfd, and timerfd_create syscalls, as well as F_DUPFD and
    F_DUPFD_CLOEXEC fcntl commands, as file descriptors.
  * Optimized decoding of indirect socket syscalls.
  * Implemented decoding of nanoseconds along with seconds in stat family
    syscalls (addresses Fedora bug #1251176).
  * Implemented decoding of struct statfs.f_flags in statfs syscall.
  * Implemented decoding of siginfo_t.si_syscall and siginfo_t.si_arch
    in SIGSYS signal.
  * Implemented decoding of indirect syscall on mips o32.
  * Implemented decoding of IPPROTO_IP control messages.
  * Implemented decoding of setsockopt syscall multicast arguments.
  * Enhanced decoding of struct sigevent.
  * Enhanced decoding of block, loop, mtd, ptp, rtc, SG_IO, socket, tty,
    and v4l2 ioctl syscall arguments.
  * Enhanced decoding of epoll_create, fcntl, fcntl64, futex, getdents,
    getdents64, getsockopt, io_*, mount, msgctl, prctl, quotactl, recvfrom,
    sendfile, setsockopt, and shmctl syscalls.
  * Implemented decoding of bpf, execveat, ioperm, iopl, kcmp, kexec_file_load,
    lookup_dcookie, membarrier, memfd_create, mlock2, name_to_handle_at,
    open_by_handle_at, sched_getattr, sched_setattr, and userfaultfd syscalls.
  * Updated lists of AF_*, EPOLL_*, FALLOC_FL_*, F_*, INPUT_PROP_*, IPPROTO_*,
    IPV6_*, IP_*, KEY_*, LOCK_*, MNT_*, MS_*, PACKET_*, PERF_FLAG_*, PF_*,
    PR_*, PTRACE_O_*, RENAME_*, SCTP_*, SECBIT_*, SO_*, TCP_*, and siginfo_t
    constants.
  * Added Nios II architecture support.
  * Added new syscall entries to match Linux 4.4.

* Bug fixes
  * Fixed potential short read of strings from tracee's memory.
  * Fixed -qq option in conjunction with -o option.
  * Fixed filtering of <unavailable> syscalls.
  * Fixed decoding of ioctl syscall command on aarch64 and 32-bit architectures
    with 64-bit aligned structures.
  * Fixed decoding of eventfd2, epoll_create1, signalfd4, and sync_file_range2
    syscall flags arguments.
  * Fixed decoding of 4th argument of clock_nanosleep syscall.
  * Fixed decoding of getpagesize syscall on m68k.
  * Fixed decoding of getrandom and seccomp syscalls on aarch64.
  * Fixed decoding of timezone argument of gettimeofday and settimeofday
  * syscalls.
  * Fixed decoding of offset argument of mmap2 syscall on arm, sparc,
    and sparc64.
  * Fixed decoding of pipe syscall on alpha and mips.
  * Fixed decoding of pipe2 syscall on ia64, sh, sparc, and sparc64.
  * Fixed decoding of signal mask argument of pselect6 syscall on x32.
  * Fixed decoding of signal mask of rt_sigreturn syscall on aarch64, m68k,
    and x32.
  * Fixed decoding of 4th argument of semctl indirect syscall.
  * Fixed decoding of sa_restorer and sa_mask of sigaction syscall on m68k.
  * Fixed decoding of statfs64 and fstatfs64 syscalls on arm eabi.
  * Fixed decoding of struct dirent on x32.
  * Fixed decoding of times syscall return value on mips n32 and x32.
  * Fixed decoding of path argument of umount2 syscall
    (addresses Debian bug #785050).
  * Worked around a kernel bug in tracing privileged executables.
  * Fixed various errors in mapping between syscall numbers and associated
    information like the number of syscall arguments, the name of syscall,
    and syscall decoder.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Add-linux-aarch64-arch_regs.h.patch       |  25 -----
 .../Include-linux-ioctl.h-for-_IOC_-macros.patch   |  69 ------------
 .../strace/Include-sys-stat.h-for-S_I-macros.patch |  52 ---------
 .../strace/strace/Makefile-ptest.patch             |  18 ++--
 .../define-OS-ARCH-in-tests-Makefile-am.patch      |  26 -----
 ...-robust-test-for-m32-mx32-compile-support.patch |  46 ++++++++
 .../strace/strace-add-configure-options.patch      |  49 ---------
 .../strace/strace/update-gawk-paths.patch          | 118 +++++++++++++++++++++
 .../strace/{strace_4.10.bb => strace_4.11.bb}      |  18 ++--
 9 files changed, 180 insertions(+), 241 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/define-OS-ARCH-in-tests-Makefile-am.patch
 create mode 100644 meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
 create mode 100644 meta/recipes-devtools/strace/strace/update-gawk-paths.patch
 rename meta/recipes-devtools/strace/{strace_4.10.bb => strace_4.11.bb} (60%)

diff --git a/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
deleted file mode 100644
index 0853959..0000000
--- a/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f85854131c8265f2eb59c714dcea5c4b3dc09bed Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen.kooi@linaro.org>
-Date: Wed, 15 Apr 2015 14:29:37 +0200
-Subject: [PATCH] Add linux/aarch64/arch_regs.h
-
-It is missing from the tarball, but it is present in git for v4.10
-
-Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-Upstream-Status: Pending
----
- linux/aarch64/arch_regs.h | 2 ++
- 1 file changed, 2 insertions(+)
- create mode 100644 linux/aarch64/arch_regs.h
-
-diff --git a/linux/aarch64/arch_regs.h b/linux/aarch64/arch_regs.h
-new file mode 100644
-index 0000000..9a5e33e
---- /dev/null
-+++ b/linux/aarch64/arch_regs.h
-@@ -0,0 +1,2 @@
-+extern uint64_t *const aarch64_sp_ptr;
-+extern uint32_t *const arm_sp_ptr;
--- 
-1.9.3
-
diff --git a/meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch b/meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch
deleted file mode 100644
index d9346a8..0000000
--- a/meta/recipes-devtools/strace/strace/Include-linux-ioctl.h-for-_IOC_-macros.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Backport
-
-  http://sourceforge.net/p/strace/code/ci/3460dc486d333231998de0f19918204aacee9ae3
-
-Expected to be released officially as part of strace 4.11
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-From 3460dc486d333231998de0f19918204aacee9ae3 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 28 Mar 2015 18:40:13 +0100
-Subject: [PATCH] Include <linux/ioctl.h> for _IOC_* macros
-
-Fix a compilation failure with musl libc.
-
-* evdev.c: Include <linux/ioctl.h>.
-* ioctl.c: Include <linux/ioctl.h> instead of <asm/ioctl.h>.
-* ioctlsort.c: Likewise.
-
-Reported-by: Dima Krasner <dima@dimakrasner.com>
-Acked-by: Mike Frysinger <vapier@gentoo.org>
----
- evdev.c     | 2 ++
- ioctl.c     | 2 +-
- ioctlsort.c | 2 +-
- 3 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/evdev.c b/evdev.c
-index 9a7430d..e06f9c1 100644
---- a/evdev.c
-+++ b/evdev.c
-@@ -28,6 +28,8 @@
- 
- #include "defs.h"
- 
-+#include <linux/ioctl.h>
-+
- #ifdef HAVE_LINUX_INPUT_H
- #include <linux/input.h>
- #include "xlat/evdev_abs.h"
-diff --git a/ioctl.c b/ioctl.c
-index 46f8334..c67d048 100644
---- a/ioctl.c
-+++ b/ioctl.c
-@@ -29,7 +29,7 @@
-  */
- 
- #include "defs.h"
--#include <asm/ioctl.h>
-+#include <linux/ioctl.h>
- #include "xlat/ioctl_dirs.h"
- 
- #ifdef HAVE_LINUX_INPUT_H
-diff --git a/ioctlsort.c b/ioctlsort.c
-index 333556c..9c31691 100644
---- a/ioctlsort.c
-+++ b/ioctlsort.c
-@@ -33,7 +33,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <asm/ioctl.h>
-+#include <linux/ioctl.h>
- 
- struct ioctlent {
- 	const char *info;
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch b/meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch
deleted file mode 100644
index 0b072fe..0000000
--- a/meta/recipes-devtools/strace/strace/Include-sys-stat.h-for-S_I-macros.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Upstream-Status: Backport
-
-  http://sourceforge.net/p/strace/code/ci/d34e00b293942b1012ddc49ed3ab379a32337611
-
-Expected to be released officially as part of strace 4.11
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-From d34e00b293942b1012ddc49ed3ab379a32337611 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 28 Mar 2015 18:21:09 +0100
-Subject: [PATCH] Include <sys/stat.h> for S_I* macros
-
-Fix a compilation failure with musl libc.
-
-* mknod.c: Include <sys/stat.h>.
-* printmode.c: Likewise.
-
-Reported-by: Dima Krasner <dima@dimakrasner.com>
-Acked-by: Mike Frysinger <vapier@gentoo.org>
----
- mknod.c     | 1 +
- printmode.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/mknod.c b/mknod.c
-index 07e9a45..1463232 100644
---- a/mknod.c
-+++ b/mknod.c
-@@ -1,6 +1,7 @@
- #include "defs.h"
- 
- #include <fcntl.h>
-+#include <sys/stat.h>
- 
- #ifdef MAJOR_IN_SYSMACROS
- # include <sys/sysmacros.h>
-diff --git a/printmode.c b/printmode.c
-index 4df1b9f..a721936 100644
---- a/printmode.c
-+++ b/printmode.c
-@@ -1,6 +1,7 @@
- #include "defs.h"
- 
- #include <fcntl.h>
-+#include <sys/stat.h>
- 
- #include "xlat/modetypes.h"
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index f360301..824031e 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -10,32 +10,32 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
  2 files changed, 19 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index e73958c..5f0dfee 100644
+index 0209bac..b969e25 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -6,7 +6,7 @@ AC_INIT([strace],
+@@ -36,7 +36,7 @@ AC_INIT([strace],
  AC_CONFIG_SRCDIR([strace.c])
  AC_CONFIG_AUX_DIR([.])
  AC_CONFIG_HEADERS([config.h])
--AM_INIT_AUTOMAKE([foreign dist-xz no-dist-gzip silent-rules parallel-tests])
-+AM_INIT_AUTOMAKE([foreign dist-xz no-dist-gzip silent-rules serial-tests])
+-AM_INIT_AUTOMAKE([foreign nostdinc dist-xz no-dist-gzip silent-rules parallel-tests])
++AM_INIT_AUTOMAKE([foreign nostdinc dist-xz no-dist-gzip silent-rules serial-tests])
  AM_MAINTAINER_MODE
  AC_CANONICAL_HOST
  
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index ff5e136..984bdb6 100644
+index 0f23b4b..429f7e9 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -101,3 +101,21 @@ EXTRA_DIST = init.sh run.sh \
- 	     $(TESTS)
+@@ -332,3 +332,21 @@ ksysent.h: $(srcdir)/ksysent.sed
  
- CLEANFILES = $(TESTS:=.tmp)
+ BUILT_SOURCES = ksysent.h
+ CLEANFILES = ksysent.h $(TESTS:=.tmp)
 +
 +buildtest-TESTS: $(check_PROGRAMS) $(TESTS)
 +
 +install-ptest:
 +	install $(BUILDDIR)/strace $(DESTDIR)
-+	install "$(srcdir)/.."/strace-log-merge $(DESTDIR)
++	install $(srcdir)/../strace-log-merge $(DESTDIR)
 +	install -d $(DESTDIR)/$(TESTDIR)
 +	cp $(BUILDDIR)/$(TESTDIR)/Makefile $(DESTDIR)/$(TESTDIR)
 +	sed -i -e 's/^Makefile:/_Makefile:/' $(DESTDIR)/$(TESTDIR)/Makefile
diff --git a/meta/recipes-devtools/strace/strace/define-OS-ARCH-in-tests-Makefile-am.patch b/meta/recipes-devtools/strace/strace/define-OS-ARCH-in-tests-Makefile-am.patch
deleted file mode 100644
index 4b1bb26..0000000
--- a/meta/recipes-devtools/strace/strace/define-OS-ARCH-in-tests-Makefile-am.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Ensure that OS and ARCH are defined in tests/Makefile.am
-
-For strace v4.10 this is a purely cosmetic fix, since the include
-paths derived from $(OS)/${ARCH) are never used. These variables are
-correctly defined by default in strace v4.11.
-
-Partial backport of upstream commit:
-
-  http://sourceforge.net/p/strace/code/ci/25c804ce42261b24b19d35c637bf2745c237ee07
-
-Upstream-Status: Backport
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
-Index: strace-4.10/tests/Makefile.am
-===================================================================
---- strace-4.10.orig/tests/Makefile.am
-+++ strace-4.10/tests/Makefile.am
-@@ -1,5 +1,7 @@
- # Automake input for strace tests.
- 
-+OS = linux
-+ARCH = @arch@
- AM_CFLAGS = $(WARN_CFLAGS)
- AM_CPPFLAGS = -I$(top_builddir)/$(OS)/$(ARCH) \
- 	      -I$(top_srcdir)/$(OS)/$(ARCH) \
diff --git a/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch b/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
new file mode 100644
index 0000000..756cd8b
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
@@ -0,0 +1,46 @@
+From 154af50ed7ed8b91838d713052ebf29b0b14f765 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Mon, 18 Jan 2016 11:00:00 -0800
+Subject: [PATCH] mpers.m4: more robust test for -m32/-mx32 compile support
+
+When using the default OE toolchain for x86-64, the basic checks for
+-m32 and -mx32 compile support in mpers.m4 pass but later attempts to
+actually use the toolchain with -m32 fail, e.g.
+
+ | In file included from /home/andre/build/tmp/sysroots/qemux86-64/usr/include/sys/syscall.h:31:0,
+ |                  from ../strace-4.11/defs.h:55,
+ |                  from mpers-m32/kernel_dirent.c:32:
+ | /home/andre/build/tmp/sysroots/qemux86-64/usr/include/bits/syscall.h:41:29: fatal error: bits/syscall-32.h: No such file or directory
+
+Make the mpers.m4 tests more robust so that configure correctly
+detects the limitations of the OE toolchain.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ m4/mpers.m4 | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/m4/mpers.m4 b/m4/mpers.m4
+index 1fe8a8e..d72c717 100644
+--- a/m4/mpers.m4
++++ b/m4/mpers.m4
+@@ -53,12 +53,14 @@ case "$arch" in
+ 	CFLAGS="$CFLAGS CFLAG $IFLAG"
+ 	AC_CACHE_CHECK([for CFLAG compile support], [st_cv_cc],
+ 		[AC_COMPILE_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
++						     #include <sys/syscall.h>
+ 						     int main(){return 0;}]])],
+ 				   [st_cv_cc=yes],
+ 				   [st_cv_cc=no])])
+ 	if test $st_cv_cc = yes; then
+ 		AC_CACHE_CHECK([for CFLAG runtime support], [st_cv_runtime],
+ 			[AC_RUN_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
++							 #include <sys/syscall.h>
+ 							 int main(){return 0;}]])],
+ 				       [st_cv_runtime=yes],
+ 				       [st_cv_runtime=no],
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch b/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
deleted file mode 100644
index 84b9f9c..0000000
--- a/meta/recipes-devtools/strace/strace/strace-add-configure-options.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Add option "aio" to enable/disable libaio support.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- configure.ac |   26 ++++++++++++++++++++++++++
- 1 file changed, 26 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index e73958c..9099370 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -303,11 +303,6 @@ AC_CHECK_MEMBERS([struct sysinfo.totalhi
- 
- AC_CHECK_TYPES([struct flock64],,, [#include <fcntl.h>])
- 
--AC_CHECK_HEADERS([libaio.h], [
--	AC_CHECK_MEMBERS([struct iocb.u.c.flags],,, [#include <libaio.h>])
--	AC_CHECK_DECLS([IO_CMD_PWRITE, IO_CMD_PWRITEV],,, [#include <libaio.h>])
--])
--
- AC_CHECK_HEADERS([linux/input.h], [
- 	AC_CHECK_MEMBERS([struct input_absinfo.resolution],,, [#include <linux/input.h>])
- ])
-@@ -745,6 +740,20 @@ if test "x$ac_cv_lib_dl_dladdr" = xyes;
- fi
- AC_SUBST(dl_LIBS)
- 
-+AC_ARG_ENABLE([aio],
-+	[AS_HELP_STRING([--enable-aio], [turn on libaio support])],
-+	[case $enableval in
-+	yes)
-+	AC_CHECK_HEADERS([libaio.h], [
-+		AC_CHECK_MEMBERS([struct iocb.u.c.flags],,, [#include <libaio.h>])
-+		AC_CHECK_DECLS([IO_CMD_PWRITE, IO_CMD_PWRITEV],,, [#include <libaio.h>])
-+	])
-+	;;
-+	no)  ;;
-+	*)   AC_MSG_ERROR([bad value $enableval for aio option]) ;;
-+	esac]
-+)
-+
- AC_PATH_PROG([PERL], [perl])
- 
- dnl stack trace with libunwind
---
-1.9.1
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
new file mode 100644
index 0000000..bfc7f34
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -0,0 +1,118 @@
+From 3836518c46bd5bb3e71371b1b18274bf2d487133 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Mon, 18 Jan 2016 11:01:00 -0800
+Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
+
+The default path to gawk is /usr/bin/gawk, so update test scripts etc
+from #!/bin/gawk to #!/usr/bin/gawk. Fixes missing RDPENDS QA tests:
+
+  WARNING: QA Issue: /usr/lib/strace/ptest/tests/unix-yy-accept.awk_strace-ptest contained in package strace-ptest requires /bin/gawk, but no providers found in its RDEPENDS [file-rdeps]
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ mpers.awk                 | 2 +-
+ tests/caps.awk            | 2 +-
+ tests/match.awk           | 2 +-
+ tests/net-yy-accept.awk   | 2 +-
+ tests/net-yy-connect.awk  | 2 +-
+ tests/sigaction.awk       | 2 +-
+ tests/uid.awk             | 2 +-
+ tests/unix-yy-accept.awk  | 2 +-
+ tests/unix-yy-connect.awk | 2 +-
+ 9 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/mpers.awk b/mpers.awk
+index 73bf0b0..50e6c16 100644
+--- a/mpers.awk
++++ b/mpers.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2015 Elvira Khabirova <lineprinter0@gmail.com>
+ # Copyright (c) 2015 Dmitry V. Levin <ldv@altlinux.org>
+diff --git a/tests/caps.awk b/tests/caps.awk
+index bad8b0f..845f37c 100644
+--- a/tests/caps.awk
++++ b/tests/caps.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+ # All rights reserved.
+diff --git a/tests/match.awk b/tests/match.awk
+index abfbae9..f2740bf 100644
+--- a/tests/match.awk
++++ b/tests/match.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+ # All rights reserved.
+diff --git a/tests/net-yy-accept.awk b/tests/net-yy-accept.awk
+index fed3e30..e916ab0 100644
+--- a/tests/net-yy-accept.awk
++++ b/tests/net-yy-accept.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014 Masatake YAMATO <yamato@redhat.com>
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+diff --git a/tests/net-yy-connect.awk b/tests/net-yy-connect.awk
+index f4dcf91..b3cec8c 100644
+--- a/tests/net-yy-connect.awk
++++ b/tests/net-yy-connect.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014 Masatake YAMATO <yamato@redhat.com>
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+diff --git a/tests/sigaction.awk b/tests/sigaction.awk
+index 5c6b6d0..3e14464 100644
+--- a/tests/sigaction.awk
++++ b/tests/sigaction.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+ # All rights reserved.
+diff --git a/tests/uid.awk b/tests/uid.awk
+index a56c5be..67b0749 100644
+--- a/tests/uid.awk
++++ b/tests/uid.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+ # All rights reserved.
+diff --git a/tests/unix-yy-accept.awk b/tests/unix-yy-accept.awk
+index 4ed60e4..2a9d9c0 100644
+--- a/tests/unix-yy-accept.awk
++++ b/tests/unix-yy-accept.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014 Masatake YAMATO <yamato@redhat.com>
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+diff --git a/tests/unix-yy-connect.awk b/tests/unix-yy-connect.awk
+index 262bf2e..c809dfa 100644
+--- a/tests/unix-yy-connect.awk
++++ b/tests/unix-yy-connect.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # Copyright (c) 2014 Masatake YAMATO <yamato@redhat.com>
+ # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.11.bb
similarity index 60%
rename from meta/recipes-devtools/strace/strace_4.10.bb
rename to meta/recipes-devtools/strace/strace_4.11.bb
index 1b64743..a72a1f9 100644
--- a/meta/recipes-devtools/strace/strace_4.10.bb
+++ b/meta/recipes-devtools/strace/strace_4.11.bb
@@ -5,30 +5,26 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=124500c21e856f0912df29295ba104c7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
-           file://0001-Add-linux-aarch64-arch_regs.h.patch \
            file://disable-git-version-gen.patch \
-           file://strace-add-configure-options.patch \
+           file://more-robust-test-for-m32-mx32-compile-support.patch \
+           file://update-gawk-paths.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
-           file://Include-sys-stat.h-for-S_I-macros.patch \
-           file://Include-linux-ioctl.h-for-_IOC_-macros.patch \
-           file://define-OS-ARCH-in-tests-Makefile-am.patch \
           "
 
-SRC_URI[md5sum] = "107a5be455493861189e9b57a3a51912"
-SRC_URI[sha256sum] = "e6180d866ef9e76586b96e2ece2bfeeb3aa23f5cc88153f76e9caedd65e40ee2"
+SRC_URI[md5sum] = "a15d2555a7febb56d00c6e1a51c655dc"
+SRC_URI[sha256sum] = "e86a5f6cd8f941f67f3e4b28f4e60f3d9185c951cf266404533210a2e5cd8152"
 
 inherit autotools ptest bluetooth
-RDEPENDS_${PN}-ptest += "make coreutils grep gawk"
+
+RDEPENDS_${PN}-ptest += "make coreutils grep gawk sed"
 
 PACKAGECONFIG_class-target ??= "\
-    libaio \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
 "
 
-PACKAGECONFIG[libaio] = "--enable-aio,--disable-aio,libaio"
-PACKAGECONFIG[libunwind] = "--with-libunwind, --without-libunwind, libunwind"
 PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,${BLUEZ}"
+PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
 
 TESTDIR = "tests"
 
-- 
1.9.1


