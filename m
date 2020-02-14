Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 40EC660C85
	for <openembedded-core@openembedded.org>;
	Fri, 14 Feb 2020 00:51:39 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v17so8785123ljg.4
	for <openembedded-core@openembedded.org>;
	Thu, 13 Feb 2020 16:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=v3OzOjGKDTWTZqTQhztEuTc8/l8mcqtrcErPDeAIThI=;
	b=ccZNJHnPMGzy1rHuAuboQWf1fMWL4LL/qDVC2BeLtHclmyXOwsPd01BRAc53Fp2lSj
	Rnp/FWaY/yjCleMfrZK6LKJ2TMApIbkIjbJS8IJQSDTiNpAWdI4T+hRMCzWdcev2f1gM
	UXr1/bUKko3ctfsyUANlpNogV9LD/rKOUKGFpnxJhbEystnXJLo0qoN61+8Ox/x/gCTo
	qYa8OfJvXbco348gPjeT6FP/G7hSycZlPrPJUG1Dc2N1umeOYIPREcmKWNkgNkMIqQlR
	nr5yth0WaezEfmcX6sMkzQJyJmHsOQib7A51gT1C5141owo4taqwGT8YvcSpIvPE2F9e
	2spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v3OzOjGKDTWTZqTQhztEuTc8/l8mcqtrcErPDeAIThI=;
	b=h8hbPstR1ErTRETgTFy5m8j4VL95pSjEU0Hf7tsn+UZm0VOAtlFyfUtXRGvRBeVfkq
	gx/6CrIpsuNOB0atIMwCXgSgMNfjZ9CmurxHj4rX3CpoZkOcA+TanmFW855PfhKbpXdF
	y8kCXuXzuXZli68acwyMLSxFa+uuztmxushU/4At40J6FYt1XOZGnzQ9s4LhfhOx6PwB
	5t5KNRTZ+3zLctoz3/M3ZA6Y7Hev9xTt75j1GSpVnFZgKoQBVm8F4QpchxZ8p7OvLdpo
	k4dnChsWm7bcvyBC1jSZrSP26ssrF9ZJuTC3VOTCIbP0/2npqkMIQSgXcKqePSZyoKLj
	Mb6w==
X-Gm-Message-State: APjAAAWnC7HoEI9IDvg7c+ocnOOT5eYMktgQQC3VY21/JZBio/40fpoO
	KHwvCjEEOXdseKrfoq2kd4sgOpPfIeZNa2JU4UU=
X-Google-Smtp-Source: APXvYqwo5RViNHFUkrv0LqSBXyMf/41w9JOukVLFvlqmXcvWzXG1MMom51Z5SQYzbO8W46n7zoFdz62m/jx4PaMvFR8=
X-Received: by 2002:a2e:8197:: with SMTP id e23mr278724ljg.250.1581641499653; 
	Thu, 13 Feb 2020 16:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20200213232528.30517-1-alistair.francis@wdc.com>
	<ff6f9d97-b904-f8f1-263c-73750f09fc0f@gmail.com>
In-Reply-To: <ff6f9d97-b904-f8f1-263c-73750f09fc0f@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 13 Feb 2020 16:44:22 -0800
Message-ID: <CAKmqyKO3EZBPdLrk3D=RerpLQJFUcJ4u+d-NcyC+7OR54Rru5w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] strace: Update to 5.5
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
X-List-Received-Date: Fri, 14 Feb 2020 00:51:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 13, 2020 at 4:24 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 2/13/20 3:25 PM, Alistair Francis wrote:
> > Update strace to 5.5. This includes a small change in the license file
> > to change the date to 2020.
>
> Have you run the ptests for this?

I haven't.

> Will this help help address this following open defect?
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13785

I'm not sure.

Alistair

>
> - armin
>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  ...0001-caps-abbrev.awk-fix-gawk-s-path.patch |  2 +-
> >  ...yscall_info-to-__ptrace_syscall_info.patch | 52 -------------------
> >  .../strace/strace/Makefile-ptest.patch        |  6 ++-
> >  .../strace/disable-git-version-gen.patch      |  4 +-
> >  .../strace/strace/mips-SIGEMT.patch           |  2 +-
> >  ...st-test-for-m32-mx32-compile-support.patch | 43 ---------------
> >  .../strace/strace/ptest-spacesave.patch       | 17 ++++--
> >  .../strace/strace/sys_headers.patch           | 25 ---------
> >  .../strace/strace/uintptr_t.patch             | 12 ++++-
> >  .../strace/strace/update-gawk-paths.patch     |  2 +-
> >  .../strace/{strace_5.4.bb => strace_5.5.bb}   |  9 ++--
> >  11 files changed, 36 insertions(+), 138 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/strace/strace/0001-define-ptrace_syscall_info-to-__ptrace_syscall_info.patch
> >  delete mode 100644 meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
> >  delete mode 100644 meta/recipes-devtools/strace/strace/sys_headers.patch
> >  rename meta/recipes-devtools/strace/{strace_5.4.bb => strace_5.5.bb} (80%)
> >
> > diff --git a/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch b/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
> > index 52d2cdcdc5..235e803641 100644
> > --- a/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
> > +++ b/meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
> > @@ -1,4 +1,4 @@
> > -From d225aaa8841f47ba8aa7b353b0ac3028d5913efe Mon Sep 17 00:00:00 2001
> > +From 597cc206d982e7237eb93fdc33e8c4bb6bb2d796 Mon Sep 17 00:00:00 2001
> >  From: Robert Yang <liezhi.yang@windriver.com>
> >  Date: Thu, 9 Feb 2017 01:27:49 -0800
> >  Subject: [PATCH] caps-abbrev.awk: fix gawk's path
> > diff --git a/meta/recipes-devtools/strace/strace/0001-define-ptrace_syscall_info-to-__ptrace_syscall_info.patch b/meta/recipes-devtools/strace/strace/0001-define-ptrace_syscall_info-to-__ptrace_syscall_info.patch
> > deleted file mode 100644
> > index dd0617a15f..0000000000
> > --- a/meta/recipes-devtools/strace/strace/0001-define-ptrace_syscall_info-to-__ptrace_syscall_info.patch
> > +++ /dev/null
> > @@ -1,52 +0,0 @@
> > -From 86bbe1135d5d13db1ced64141acfb513c03d2f30 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Sat, 21 Dec 2019 10:18:38 -0800
> > -Subject: [PATCH] define ptrace_syscall_info to __ptrace_syscall_info
> > -
> > -glibc 2.31+ has defined __ptrace_syscall_info [1]
> > -
> > -[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=d1e411e5c786ce3028d98b4e6fc02c2fcf66ae37;hp=2e4e75727eb05eef4c10470d865bd42962d5fae7
> > -
> > -Upstream-Status: Pending
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - get_personality.h | 2 ++
> > - ptrace.h          | 2 ++
> > - 2 files changed, 4 insertions(+)
> > -
> > ---- a/get_personality.h
> > -+++ b/get_personality.h
> > -@@ -10,7 +10,9 @@
> > -
> > - # include "ptrace.h"
> > -
> > -+# if HAVE_STRUCT___PTRACE_SYSCALL_INFO
> > - extern int
> > - get_personality_from_syscall_info(const struct ptrace_syscall_info *);
> > -+# endif
> > -
> > - #endif /* !STRACE_GET_PERSONALITY_H */
> > ---- a/ptrace.h
> > -+++ b/ptrace.h
> > -@@ -186,6 +186,9 @@ struct ptrace_syscall_info {
> > - };
> > - # endif
> > -
> > -+# if HAVE_STRUCT___PTRACE_SYSCALL_INFO
> > -+#  define ptrace_syscall_info __ptrace_syscall_info
> > -+# endif
> > - # if !HAVE_DECL_PTRACE_PEEKUSER
> > - #  define PTRACE_PEEKUSER PTRACE_PEEKUSR
> > - # endif
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -317,7 +317,8 @@ AC_CHECK_MEMBERS([struct stat.st_mtime_n
> > - AC_CHECK_TYPES(m4_normalize([
> > -     struct pt_all_user_regs,
> > -     struct ia64_fpreg,
> > --    struct ptrace_peeksiginfo_args
> > -+    struct ptrace_peeksiginfo_args,
> > -+    struct __ptrace_syscall_info
> > - ]),,, [#include <sys/ptrace.h>])
> > -
> > - # For kernels that do not have v3.10-rc1~201^2~11
> > diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> > index 1f01ef79f2..42c1893f39 100644
> > --- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> > +++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> > @@ -1,4 +1,4 @@
> > -From ef5040b4f15006a22ac63a3bacfceac36ffc2045 Mon Sep 17 00:00:00 2001
> > +From ee47e205255928679701a5b769bd7ae0f815119d Mon Sep 17 00:00:00 2001
> >  From: Gabriel Barbu <gabriel.barbu@enea.com>
> >  Date: Thu, 25 Jul 2013 15:28:33 +0200
> >  Subject: [PATCH] strace: Add ptest
> > @@ -13,6 +13,8 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> >   tests/Makefile.am | 19 +++++++++++++++++++
> >   1 file changed, 19 insertions(+)
> >
> > +diff --git a/tests/Makefile.am b/tests/Makefile.am
> > +index 8cf4c36..66162eb 100644
> >  --- a/tests/Makefile.am
> >  +++ b/tests/Makefile.am
> >  @@ -15,6 +15,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
> > @@ -23,7 +25,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> >   AM_CFLAGS = $(WARN_CFLAGS)
> >   AM_CPPFLAGS = $(ARCH_MFLAGS) \
> >             -I$(builddir) \
> > -@@ -531,3 +532,21 @@ BUILT_SOURCES = ksysent.h
> > +@@ -538,3 +539,21 @@ BUILT_SOURCES = ksysent.h
> >   CLEANFILES = ksysent.h
> >
> >   include ../scno.am
> > diff --git a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
> > index 5fefff33e9..e8dbd7f273 100644
> > --- a/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
> > +++ b/meta/recipes-devtools/strace/strace/disable-git-version-gen.patch
> > @@ -1,4 +1,4 @@
> > -From 3bc47502ab011ea8d7c9cd724b25174ecd9506bc Mon Sep 17 00:00:00 2001
> > +From d87a7feb5ea75da7061afdd473faba044ec8eb0f Mon Sep 17 00:00:00 2001
> >  From: Andre McCurdy <armccurdy@gmail.com>
> >  Date: Mon, 18 Jan 2016 13:33:50 -0800
> >  Subject: [PATCH] strace: remove need for scripts
> > @@ -16,7 +16,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> >  diff --git a/configure.ac b/configure.ac
> > -index 949b058..4ba989c 100644
> > +index dd4f13f..65f000b 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> >  @@ -12,12 +12,12 @@
> > diff --git a/meta/recipes-devtools/strace/strace/mips-SIGEMT.patch b/meta/recipes-devtools/strace/strace/mips-SIGEMT.patch
> > index 0d3192b345..e86da9707c 100644
> > --- a/meta/recipes-devtools/strace/strace/mips-SIGEMT.patch
> > +++ b/meta/recipes-devtools/strace/strace/mips-SIGEMT.patch
> > @@ -1,4 +1,4 @@
> > -From 20c184a7ab3fb7be67fb7626c411e756ea61d2f5 Mon Sep 17 00:00:00 2001
> > +From 794648d84672bbda30a920a05540b56cd155ed9d Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sun, 7 Aug 2016 23:47:57 -0700
> >  Subject: [PATCH] strace: Fix build with mips/mips64 on musl
> > diff --git a/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch b/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
> > deleted file mode 100644
> > index ae22105cbe..0000000000
> > --- a/meta/recipes-devtools/strace/strace/more-robust-test-for-m32-mx32-compile-support.patch
> > +++ /dev/null
> > @@ -1,43 +0,0 @@
> > -From cc97307e8e39a81999c6a365d057487a02e6128e Mon Sep 17 00:00:00 2001
> > -From: Andre McCurdy <armccurdy@gmail.com>
> > -Date: Mon, 18 Jan 2016 11:00:00 -0800
> > -Subject: [PATCH] mpers.m4: more robust test for -m32/-mx32 compile support
> > -
> > -When using the default OE toolchain for x86-64, the basic checks for
> > --m32 and -mx32 compile support in mpers.m4 pass but later attempts to
> > -actually use the toolchain with -m32 fail, e.g.
> > -
> > - | In file included from /home/andre/build/tmp/sysroots/qemux86-64/usr/include/sys/syscall.h:31:0,
> > - |                  from ../strace-4.11/defs.h:55,
> > - |                  from mpers-m32/kernel_dirent.c:32:
> > - | /home/andre/build/tmp/sysroots/qemux86-64/usr/include/bits/syscall.h:41:29: fatal error: bits/syscall-32.h: No such file or directory
> > -
> > -Make the mpers.m4 tests more robust so that configure correctly
> > -detects the limitations of the OE toolchain.
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> > -
> > ----
> > - m4/mpers.m4 | 2 ++
> > - 1 file changed, 2 insertions(+)
> > -
> > ---- a/m4/mpers.m4
> > -+++ b/m4/mpers.m4
> > -@@ -103,6 +103,7 @@ case "$arch" in
> > -     CFLAGS="$CFLAGS MPERS_CFLAGS${IFLAG:+ }$IFLAG"
> > -     AC_CACHE_CHECK([for mpers_name personality compile support (using $CC $CFLAGS)], [st_cv_cc],
> > -             [AC_COMPILE_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
> > -+                                                 #include <sys/syscall.h>
> > -                                                  int main(){return 0;}]])],
> > -                                [st_cv_cc=yes],
> > -                                [st_cv_cc=no])])
> > -@@ -110,6 +111,7 @@ case "$arch" in
> > -             AC_CACHE_CHECK([for mpers_name personality runtime support],
> > -                     [st_cv_runtime],
> > -                     [AC_RUN_IFELSE([AC_LANG_SOURCE([[#include <stdint.h>
> > -+                                                     #include <sys/syscall.h>
> > -                                                      int main(){return 0;}]])],
> > -                                    [st_cv_runtime=yes],
> > -                                    [st_cv_runtime=no],
> > diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> > index 3e32cc388c..c5d8ff9207 100644
> > --- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> > +++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
> > @@ -1,3 +1,8 @@
> > +From 3fad4821d90cd264d1b94253b9cf4fdf5d4034b8 Mon Sep 17 00:00:00 2001
> > +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > +Date: Wed, 29 May 2019 00:10:32 +0100
> > +Subject: [PATCH] strace: Tweak ptest disk space management
> > +
> >  If the test is successful, remove the log and exp files. This stops strace
> >  using around 600MB of disk space and running our ptest images out of space.
> >
> > @@ -5,10 +10,14 @@ RP 2019/5/29
> >
> >  Upstream-Status: Inappropriate [specific to OE image space issues]
> >
> > -Index: strace-4.26/tests/gen_tests.sh
> > -===================================================================
> > ---- strace-4.26.orig/tests/gen_tests.sh
> > -+++ strace-4.26/tests/gen_tests.sh
> > +---
> > + tests/gen_tests.sh | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
> > +index 3540204..5e1e7c9 100755
> > +--- a/tests/gen_tests.sh
> > ++++ b/tests/gen_tests.sh
> >  @@ -62,6 +62,7 @@ while read -r name arg0 args; do {
> >               $hdr
> >               . "\${srcdir=.}/init.sh"
> > diff --git a/meta/recipes-devtools/strace/strace/sys_headers.patch b/meta/recipes-devtools/strace/strace/sys_headers.patch
> > deleted file mode 100644
> > index d1b704e0d9..0000000000
> > --- a/meta/recipes-devtools/strace/strace/sys_headers.patch
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -Remove configure checks for few sys/ headers
> > -
> > -sys/ipc.h, sys/sem.h, sys/shm.h, and sys/msg.h are actually wrappers
> > -for kernel headers in libc if available, here strace is trying to match
> > -traced process's APIs to syscalls kernel structures
> > -
> > -Removing the checks makes it default to right kernel UAPI headers under linux/
> > -
> > -Upstream-Status: Submitted [https://lists.strace.io/pipermail/strace-devel/2019-November/009222.html]
> > -Suggested-by: Rich Felker <dalias@aerifal.cx>
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -441,11 +441,7 @@ AC_CHECK_HEADERS(m4_normalize([
> > -     sys/conf.h
> > -     sys/eventfd.h
> > -     sys/fanotify.h
> > --    sys/ipc.h
> > --    sys/msg.h
> > -     sys/quota.h
> > --    sys/sem.h
> > --    sys/shm.h
> > -     sys/signalfd.h
> > -     sys/xattr.h
> > -     ustat.h
> > diff --git a/meta/recipes-devtools/strace/strace/uintptr_t.patch b/meta/recipes-devtools/strace/strace/uintptr_t.patch
> > index 6d3dd6fb98..088d685af0 100644
> > --- a/meta/recipes-devtools/strace/strace/uintptr_t.patch
> > +++ b/meta/recipes-devtools/strace/strace/uintptr_t.patch
> > @@ -1,10 +1,20 @@
> > -include stdint.h for getting uintptr_t definition
> > +From a6c9366bfbcef6f3f4bb068b1f1a5623935b5013 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 5 Nov 2019 20:05:08 -0800
> > +Subject: [PATCH] include stdint.h for getting uintptr_t definition
> >
> >  fixes do_compile_ptest_base
> >  tests/fanotify_mark.c:191:23: error: 'uintptr_t' undeclared (first use in this function); did you mean 'intptr_t'?
> >
> >  Upstream-Status: Pending
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +
> > +---
> > + tests/fanotify_mark.c | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/tests/fanotify_mark.c b/tests/fanotify_mark.c
> > +index aade643..de579f3 100644
> >  --- a/tests/fanotify_mark.c
> >  +++ b/tests/fanotify_mark.c
> >  @@ -18,6 +18,7 @@
> > diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> > index 7077048c75..d46b147de5 100644
> > --- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> > +++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
> > @@ -1,4 +1,4 @@
> > -From f0d7ebf48441e0b090c3e6053b8c845d0a4a3b18 Mon Sep 17 00:00:00 2001
> > +From 12a726b280eca94883edcb4da1eaaf8e93d41739 Mon Sep 17 00:00:00 2001
> >  From: Andre McCurdy <armccurdy@gmail.com>
> >  Date: Mon, 18 Jan 2016 11:01:00 -0800
> >  Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
> > diff --git a/meta/recipes-devtools/strace/strace_5.4.bb b/meta/recipes-devtools/strace/strace_5.5.bb
> > similarity index 80%
> > rename from meta/recipes-devtools/strace/strace_5.4.bb
> > rename to meta/recipes-devtools/strace/strace_5.5.bb
> > index 1e428ccd64..6e7d63949d 100644
> > --- a/meta/recipes-devtools/strace/strace_5.4.bb
> > +++ b/meta/recipes-devtools/strace/strace_5.5.bb
> > @@ -2,11 +2,10 @@ SUMMARY = "System call tracing tool"
> >  HOMEPAGE = "http://strace.io"
> >  SECTION = "console/utils"
> >  LICENSE = "LGPL-2.1+ & GPL-2+"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=0169a04810830e94f4b1cfb823c9f592"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=c756d9d5dabc27663df64f0bf492166c"
> >
> >  SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> >             file://disable-git-version-gen.patch \
> > -           file://more-robust-test-for-m32-mx32-compile-support.patch \
> >             file://update-gawk-paths.patch \
> >             file://Makefile-ptest.patch \
> >             file://run-ptest \
> > @@ -14,11 +13,9 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> >             file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
> >             file://ptest-spacesave.patch \
> >             file://uintptr_t.patch \
> > -           file://sys_headers.patch \
> > -           file://0001-define-ptrace_syscall_info-to-__ptrace_syscall_info.patch \
> >             "
> > -SRC_URI[md5sum] = "b2b58f05eb3c5c0bf9d1e26003b4d698"
> > -SRC_URI[sha256sum] = "f7d00514d51290b6db78ad7a9de709baf93caa5981498924cbc9a744cfd2a741"
> > +SRC_URI[md5sum] = "dbce2e84632b39a4ed86b9fc60447af9"
> > +SRC_URI[sha256sum] = "9f58958c8e59ea62293d907d10572e352b582bd7948ed21aa28ebb47e5bf30ff"
> >
> >  inherit autotools ptest
> >
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

