Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCB3C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 01:36:16 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.1073.1677116173455294161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 17:36:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z/wOjrEA;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id bg11so9874577oib.5
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 17:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=swrcPZw3x5BX2GSBUEGUZq3WJ57bgtEOeFqzTXzW/dg=;
        b=Z/wOjrEA9XdAr99zyxoVzcdnMiVb8PlaFCFO8wQjgG97vMccqSyAvUS8b1rnk7f5Qy
         DygIrMJyc0gRphQQ6xnJSDkUnm1CkUKz91YZUVl5eKhtNgbYpZ/39tVvBIIIkETMy7/H
         lN9E6FuaV5enK6D39M7Ken+Ads3kNky01e4QXuxzCX/cg0JUL1GFZAk+UdTZlMONYO08
         Mx90x45ClRWP8TQHFrnHSRT0IOJMgIMnSPCAzve5CoFhQobwczMregCF8eOOaP+qHYSe
         1+J4RgcGL+2wyiZ9dEMNP3yRUg2YD2wHjAz2KG0m4YqIROi+TJr90L+IMPF9vdtJP2SO
         w4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swrcPZw3x5BX2GSBUEGUZq3WJ57bgtEOeFqzTXzW/dg=;
        b=ASoSyRNI8n0H+r/g0s1eJ1aBT2r1vrxnM1xBEZ0S5jm9iczArNptLbvVn0iG6Jknf5
         D6+JZQ61ISgGyGmC04ovGUfWtprUSuCAt9CCWIBlzjC0lsZkQXNM5lV26taHcDXwm/zQ
         2eKdBF3KutWNrTHLbfPugdS8S+a30yjqIBXq0KOWhj22UznZBSoPDhJpbahXfSlRMMXy
         CfZ5hfcX+UoYdkyd2IVeQOvXu2t7KSgrmrHUe0rsLNszS6M0/UGIqXMiIJGaaXI1rPDN
         kAW6iXQ9Q4obGSvi97tbG5vSR6ZNGkXoXseNUOvbfwNSGqi0G7otz4eJAgGS4fmN89Sz
         0+6w==
X-Gm-Message-State: AO0yUKW1k1nFcyxeBqlKIJdk/kakjHKbuuhOOx3y8ddKME9fldZeXJh5
	kpSGQ1mg8P44+wM0iGJyqr98YbFqGQaVZ//CA8edO/nauwU=
X-Google-Smtp-Source: AK7set+5uMiMqTKse6QLU2nBetANVL3lLyCkWEdnJQDR50jKpbDLDn9YhIyfXYXfZWkkXikKe2YHt5ARhiDl7e2zbrw=
X-Received: by 2002:a05:6808:331a:b0:37b:592b:ec39 with SMTP id
 ca26-20020a056808331a00b0037b592bec39mr1277894oib.262.1677116172080; Wed, 22
 Feb 2023 17:36:12 -0800 (PST)
MIME-Version: 1.0
References: <20230222165358.2186844-1-raj.khem@gmail.com> <Y/aosEttiq8sdxoA@mail.local>
In-Reply-To: <Y/aosEttiq8sdxoA@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Feb 2023 17:35:45 -0800
Message-ID: <CAMKF1sq9ZGnyQ4v=oLRmbPQBofQ+G3HYSU2nP3oA-feCk4v_EQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] gdb: Upgrade to 13.1
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 01:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177598

On Wed, Feb 22, 2023 at 3:43 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> This failed on musl:
>
> | checking minix/config.h usability... ../../gdb-13.1/gdbserver/linux-low.cc: In function 'int proc_xfer_memory(CORE_ADDR, unsigned char*, const gdb_byte*, int)':
> | ../../gdb-13.1/gdbserver/linux-low.cc:5393:45: error: expected ':' before ')' token
> |  5393 |                  ? write (fd, writebuf, len));
> |       |                                             ^
> |       |                                             :
> | ../../gdb-13.1/gdbserver/linux-low.cc:5393:45: error: expected primary-expression before ')' token
> | ../../gdb-13.1/gdbserver/linux-low.cc:5393:45: error: expected ':' before ')' token
> |  5393 |                  ? write (fd, writebuf, len));
> |       |                                             ^
> |       |                                             :
> | ../../gdb-13.1/gdbserver/linux-low.cc:5393:45: error: expected primary-expression before ')' token
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6703/steps/11/logs/stdio
>
> Note that reproducible still failed:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2438/steps/13/logs/stdio
>

I looked into the configure logs on builder as I was not able to
reproduce here locally. Here is what I see in gdb/config.log, I think
this node is using buildtools stuff and seems
its getting libpthread.so.0 from host which needs certain symbols from
libc which I guess are missing because its linking libc from
buildtools tarball as well.

configure:28568: checking for ELF support in BFD
configure:28588: ./libtool --quiet --mode=link gcc  -o conftest
-I../../gdb-13.1/gdb/../include -I../bfd -I../../gdb-13.1/gdb/../bfd
-isystem/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/work/x86_64-linux/gdb-cross-x86_64/13.1-r0/recipe-sysroot-native/usr/include
-O2 -pipe     -isystem/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/work/x86_64-linux/gdb-cross-x86_64/13.1-r0/recipe-sysroot-native/usr/include
-I/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/work/x86_64-linux/gdb-cross-x86_64/13.1-r0/recipe-sysroot-native/usr/include
-L../bfd -L../libiberty conftest.c -lbfd -liberty  -lncursesw -lm  >&5
/home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_64-pokysdk-linux/bin/ld:
/lib64/libpthread.so.0: undefined reference to
`__pause_nocancel@GLIBC_PRIVATE'
/home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_64-pokysdk-linux/bin/ld:
/lib64/libpthread.so.0: undefined reference to
`__libc_dlclose@GLIBC_PRIVATE'
/home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_64-pokysdk-linux/bin/ld:
/lib64/libpthread.so.0: undefined reference to
`__libc_allocate_rtsig_private@GLIBC_PRIVATE'
/home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_64-pokysdk-linux/bin/ld:
/lib64/libpthread.so.0: undefined reference to
`__nanosleep_nocancel@GLIBC_PRIVATE'
/home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_64-pokysdk-linux/bin/ld:
/lib64/libpthread.so.0: undefined reference to
`__libc_dlsym@GLIBC_PRIVATE'
/home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_64-pokysdk-linux/bin/ld:
/lib64/libpthread.so.0: undefined reference to
`__libc_siglongjmp@GLIBC_PRIVATE'
/home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_64-pokysdk-linux/bin/ld:
/lib64/libpthread.so.0: undefined reference to
`__libc_thread_freeres@GLIBC_PRIVATE'
/home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_64-pokysdk-linux/bin/ld:
/lib64/libpthread.so.0: undefined reference to
`__libc_current_sigrtmax_private@GLIBC_PRIVATE'
/home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_64-pokysdk-linux/bin/ld:
/lib64/libpthread.so.0: undefined reference to
`__libc_current_sigrtmin_private@GLIBC_PRIVATE'
/home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_64-pokysdk-linux/bin/ld:
/lib64/libpthread.so.0: undefined reference to
`_dl_make_stack_executable@GLIBC_PRIVATE'
/home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_64-pokysdk-linux/bin/ld:
/lib64/libpthread.so.0: undefined reference to
`__libc_longjmp@GLIBC_PRIVATE'
/home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_64-pokysdk-linux/bin/ld:
/lib64/libpthread.so.0: undefined reference to
`__libc_dlopen_mode@GLIBC_PRIVATE'
/home/pokybuild/yocto-worker/reproducible/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/12.2.0/../../../../x86_64-pokysdk-linux/bin/ld:
/lib64/libpthread.so.0: undefined reference to
`__libc_pthread_init@GLIBC_PRIVATE'
collect2: error: ld returned 1 exit status
configure:28588: $? = 1



>
> On 22/02/2023 08:53:58-0800, Khem Raj wrote:
> > Pass -Wno-enum-constexpr-conversion with clang
> >
> > GDB 13.1 includes the following changes and enhancements:
> >
> > * Support for the following new targets has been added in both
> >   GDB and GDBserver:
> >
> >   ** GNU/Linux/LoongArch (gdbserver) loongarch*-*-linux*
> >
> >   ** GNU/Linux/CSKY (gdbserver) csky*-*linux*
> >
> > * The Windows native target now supports target async.
> >
> > * FreeBSD:
> >
> >   ** Arm and AArch64: Support for Thread Local Storage (TLS) variables
> >
> >   ** Hardware watchpoint support on AArch64 FreeBSD
> >
> > * Floating-point support has now been added on LoongArch GNU/Linux.
> >
> > * New commands:
> >
> >  ** set print nibbles [on|off]
> >     show print nibbles
> >
> >     This controls whether the 'print/t' command will display binary values
> >     in groups of four bits, known as "nibbles".  The default is 'off'.
> >
> >  ** Various styling-related commands. See the gdb/NEWS file for more
> >     details (see link at the bottom).
> >
> >  ** Various maintenance commands.  These are normally aimed at GDB
> >     experts or developers. See the gdb/NEWS file for more details
> >     (see link at the bottom).
> >
> > * Python API improvements:
> >
> >  ** New Python API for instruction disassembly.
> >     The new attribute 'locations' of gdb.Breakpoint returns a list of
> >     gdb.BreakpointLocation objects specifying the locations where the
> >     breakpoint is inserted into the debuggee.
> >
> >  ** New Python type gdb.BreakpointLocation.
> >
> >  ** New function gdb.format_address(ADDRESS, PROGSPACE, ARCHITECTURE)
> >     that formats ADDRESS as 'address <symbol+offset>'
> >
> >  ** New function gdb.current_language that returns the name of the
> >     current language.  Unlike gdb.parameter('language'), this will
> >     never return 'auto'.
> >
> >  ** New function gdb.print_options that returns a dictionary of the
> >     prevailing print options, in the form accepted by gdb.Value.format_string.
> >
> >  ** New method gdb.Frame.language that returns the name of the
> >     frame's language.
> >
> >  ** gdb.Value.format_string now uses the format provided by 'print',
> >     if it is called during a 'print' or other similar operation.
> >
> >  ** gdb.Value.format_string now accepts the 'summary' keyword.  This
> >     can be used to request a shorter representation of a value, the
> >     way that 'set print frame-arguments scalars' does.
> >
> >  ** The gdb.register_window_type method now restricts the set of
> >     acceptable window names.  The first character of a window's name
> >     must start with a character in the set [a-zA-Z], every subsequent
> >     character of a window's name must be in the set [-_.a-zA-Z0-9].
> >
> > * GDB/MI changes:
> >
> >   ** MI version 1 is deprecated, and will be removed in GDB 14.
> >
> >   ** The async record stating the stopped reason 'breakpoint-hit' now
> >      contains an optional field locno.
> >
> > * Miscellaneous improvements:
> >
> >   ** gdb now supports zstd compressed debug sections (ELFCOMPRESS_ZSTD) for ELF.
> >
> >   ** New convenience variable $_inferior_thread_count contains the number
> >      of live threads in the current inferior.
> >
> >   ** New convenience variables $_hit_bpnum and $_hit_locno, set to
> >      the breakpoint number and the breakpoint location number of
> >      the breakpoint last hit.
> >
> >   ** The "info breakpoints" now displays enabled breakpoint locations
> >      of disabled breakpoints as in the "y-" state.
> >
> >   ** The format of 'disassemble /r' and 'record instruction-history /r'
> >      has changed to match the layout of GNU objdump when disassembling.
> >
> >      A new format "/b" has been introduce to provide the old behavior
> >      of "/r".
> >
> >   ** The TUI no longer styles the source and assembly code highlighted
> >      by the current position indicator by default. You can however
> >      re-enable styling using the new "set style tui-current-position"
> >      command.
> >
> >   ** It is now possible to use the "document" command to document
> >      user-defined commands.
> >
> >   ** Support for memory tag data for AArch64 MTE.
> >
> > * Support Removal notices:
> >
> >   ** DBX mode has been removed.
> >
> >   ** Support for building against Python version 2 has been removed.
> >      It is now only possible to build GDB against Python 3.
> >
> >   ** Support for the following commands has been removed:
> >
> >      set debug aix-solib on|off
> >      show debug aix-solib
> >      set debug solib-frv on|off
> >      show debug solib-frv
> >
> >      Use the "set/show debug solib" commands instead.
> >
> > For a complete list and more details on each item, please see the gdb/NEWS
> > file, available at [1]:
> >
> > [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-13.1-release
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Rebase on master
> > v3: Drop a clang-16 specific quirk, accidentally added
> >
> >  meta/conf/distro/include/tcmode-default.inc   |  2 +-
> >  ...ian_12.1.bb => gdb-cross-canadian_13.1.bb} |  0
> >  .../{gdb-cross_12.1.bb => gdb-cross_13.1.bb}  |  0
> >  meta/recipes-devtools/gdb/gdb.inc             | 19 ++++-----
> >  ...make-man-install-relative-to-DESTDIR.patch | 28 -------------
> >  ...x-nat-Define-_ABIO32-if-not-defined.patch} |  9 ++---
> >  ...-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} | 11 ++---
> >  ...eadline.a-when-using-disable-static.patch} | 13 +++---
> >  ...s.h.patch => 0004-use-asm-sgidefs.h.patch} |  9 ++---
> >  ...atch => 0005-Change-order-of-CFLAGS.patch} |  9 ++---
> >  ...6-resolve-restrict-keyword-conflict.patch} |  9 ++---
> >  ...> 0007-Fix-invalid-sigprocmask-call.patch} |  9 ++---
> >  ...sing-_Alignof-when-using-C11-or-newe.patch | 15 ++-----
> >  .../gdb/0009-gdbserver-ctrl-c-handling.patch  | 40 -------------------
> >  .../gdb/gdb/readline-8.2.patch                | 39 ------------------
> >  .../gdb/{gdb_12.1.bb => gdb_13.1.bb}          |  0
> >  16 files changed, 37 insertions(+), 175 deletions(-)
> >  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_12.1.bb => gdb-cross-canadian_13.1.bb} (100%)
> >  rename meta/recipes-devtools/gdb/{gdb-cross_12.1.bb => gdb-cross_13.1.bb} (100%)
> >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
> >  rename meta/recipes-devtools/gdb/gdb/{0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch => 0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch} (82%)
> >  rename meta/recipes-devtools/gdb/gdb/{0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch => 0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch} (82%)
> >  rename meta/recipes-devtools/gdb/gdb/{0004-Dont-disable-libreadline.a-when-using-disable-static.patch => 0003-Dont-disable-libreadline.a-when-using-disable-static.patch} (83%)
> >  rename meta/recipes-devtools/gdb/gdb/{0005-use-asm-sgidefs.h.patch => 0004-use-asm-sgidefs.h.patch} (84%)
> >  rename meta/recipes-devtools/gdb/gdb/{0006-Change-order-of-CFLAGS.patch => 0005-Change-order-of-CFLAGS.patch} (84%)
> >  rename meta/recipes-devtools/gdb/gdb/{0007-resolve-restrict-keyword-conflict.patch => 0006-resolve-restrict-keyword-conflict.patch} (91%)
> >  rename meta/recipes-devtools/gdb/gdb/{0008-Fix-invalid-sigprocmask-call.patch => 0007-Fix-invalid-sigprocmask-call.patch} (90%)
> >  delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
> >  delete mode 100644 meta/recipes-devtools/gdb/gdb/readline-8.2.patch
> >  rename meta/recipes-devtools/gdb/{gdb_12.1.bb => gdb_13.1.bb} (100%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> > index 76e30aa002..ef61377491 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
> >  GCCVERSION ?= "12.%"
> >  SDKGCCVERSION ?= "${GCCVERSION}"
> >  BINUVERSION ?= "2.40%"
> > -GDBVERSION ?= "12.%"
> > +GDBVERSION ?= "13.%"
> >  GLIBCVERSION ?= "2.37"
> >  LINUXLIBCVERSION ?= "6.1%"
> >  QEMUVERSION ?= "7.2%"
> > diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_12.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_13.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gdb/gdb-cross-canadian_12.1.bb
> > rename to meta/recipes-devtools/gdb/gdb-cross-canadian_13.1.bb
> > diff --git a/meta/recipes-devtools/gdb/gdb-cross_12.1.bb b/meta/recipes-devtools/gdb/gdb-cross_13.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gdb/gdb-cross_12.1.bb
> > rename to meta/recipes-devtools/gdb/gdb-cross_13.1.bb
> > diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
> > index a5dc554581..6f006db546 100644
> > --- a/meta/recipes-devtools/gdb/gdb.inc
> > +++ b/meta/recipes-devtools/gdb/gdb.inc
> > @@ -5,16 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
> >                   file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
> >
> >  SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
> > -           file://0001-make-man-install-relative-to-DESTDIR.patch \
> > -           file://0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
> > -           file://0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
> > -           file://0004-Dont-disable-libreadline.a-when-using-disable-static.patch \
> > -           file://0005-use-asm-sgidefs.h.patch \
> > -           file://0006-Change-order-of-CFLAGS.patch \
> > -           file://0007-resolve-restrict-keyword-conflict.patch \
> > -           file://0008-Fix-invalid-sigprocmask-call.patch \
> > -           file://0009-gdbserver-ctrl-c-handling.patch \
> > -           file://readline-8.2.patch \
> > +           file://0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
> > +           file://0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
> > +           file://0003-Dont-disable-libreadline.a-when-using-disable-static.patch \
> > +           file://0004-use-asm-sgidefs.h.patch \
> > +           file://0005-Change-order-of-CFLAGS.patch \
> > +           file://0006-resolve-restrict-keyword-conflict.patch \
> > +           file://0007-Fix-invalid-sigprocmask-call.patch \
> >             file://0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
> >             "
> > -SRC_URI[sha256sum] = "0e1793bf8f2b54d53f46dea84ccfd446f48f81b297b28c4f7fc017b818d69fed"
> > +SRC_URI[sha256sum] = "115ad5c18d69a6be2ab15882d365dda2a2211c14f480b3502c6eba576e2e95a0"
> > diff --git a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
> > deleted file mode 100644
> > index 16d6cf196f..0000000000
> > --- a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -From 8eca28eddcda4ce8a345ca031f43ff1ed6f37089 Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Mon, 2 Mar 2015 02:27:55 +0000
> > -Subject: [PATCH 1/9] make man install relative to DESTDIR
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - sim/common/Make-common.in | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/sim/common/Make-common.in b/sim/common/Make-common.in
> > -index 74e5dad3049..9e95c224ba4 100644
> > ---- a/sim/common/Make-common.in
> > -+++ b/sim/common/Make-common.in
> > -@@ -70,7 +70,7 @@ tooldir = $(libdir)/$(target_alias)
> > - datadir = @datadir@
> > - datarootdir = @datarootdir@
> > - mandir = @mandir@
> > --man1dir = $(mandir)/man1
> > -+man1dir = $(DESTDIR)$(mandir)/man1
> > - infodir = @infodir@
> > - includedir = @includedir@
> > -
> > ---
> > -2.36.1
> > -
> > diff --git a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
> > similarity index 82%
> > rename from meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
> > rename to meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
> > index 8d263de896..0794dc64f7 100644
> > --- a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
> > +++ b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
> > @@ -1,7 +1,7 @@
> > -From 37d3afd2eaa95c89ad7cb5d0079b017752e4d0ea Mon Sep 17 00:00:00 2001
> > +From 5cc95003bafd66576684b85ad57e74b6fc54754c Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Wed, 23 Mar 2016 06:30:09 +0000
> > -Subject: [PATCH 2/9] mips-linux-nat: Define _ABIO32 if not defined
> > +Subject: [PATCH] mips-linux-nat: Define _ABIO32 if not defined
> >
> >  This helps building gdb on mips64 on musl, since
> >  musl does not provide sgidefs.h this define is
> > @@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 4 insertions(+)
> >
> >  diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
> > -index 20e12b6889e..6adc61235aa 100644
> > +index 972b5db8e76..5e68538a3ba 100644
> >  --- a/gdb/mips-linux-nat.c
> >  +++ b/gdb/mips-linux-nat.c
> >  @@ -41,6 +41,10 @@
> > @@ -30,6 +30,3 @@ index 20e12b6889e..6adc61235aa 100644
> >
> >   class mips_linux_nat_target final : public linux_nat_trad_target
> >   {
> > ---
> > -2.36.1
> > -
> > diff --git a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> > similarity index 82%
> > rename from meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> > rename to meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> > index 7e09404bb0..2c7029ca7a 100644
> > --- a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> > +++ b/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
> > @@ -1,7 +1,7 @@
> > -From e689eec672ee8c53b3adb2ade2b5deb9b7cd99d4 Mon Sep 17 00:00:00 2001
> > +From 33779a5967f977c7ae27e88255a0695fd5ddadf7 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sat, 30 Apr 2016 18:32:14 -0700
> > -Subject: [PATCH 3/9] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
> > +Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
> >
> >  Upstream-Status: Pending
> >
> > @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   2 files changed, 12 insertions(+)
> >
> >  diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
> > -index 1094f6b0be3..d8588a646c2 100644
> > +index c84f9146bbd..8c8580c95e1 100644
> >  --- a/gdb/nat/ppc-linux.h
> >  +++ b/gdb/nat/ppc-linux.h
> >  @@ -18,7 +18,13 @@
> > @@ -30,7 +30,7 @@ index 1094f6b0be3..d8588a646c2 100644
> >
> >   /* This sometimes isn't defined.  */
> >  diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
> > -index 08824887003..69afbae5359 100644
> > +index fdf74727e39..f64afd09b7a 100644
> >  --- a/gdbserver/linux-ppc-low.cc
> >  +++ b/gdbserver/linux-ppc-low.cc
> >  @@ -23,7 +23,13 @@
> > @@ -47,6 +47,3 @@ index 08824887003..69afbae5359 100644
> >
> >   #include "arch/ppc-linux-common.h"
> >   #include "arch/ppc-linux-tdesc.h"
> > ---
> > -2.36.1
> > -
> > diff --git a/meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
> > similarity index 83%
> > rename from meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-when-using-disable-static.patch
> > rename to meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
> > index a1e85e91b3..051a933ff4 100644
> > --- a/meta/recipes-devtools/gdb/gdb/0004-Dont-disable-libreadline.a-when-using-disable-static.patch
> > +++ b/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
> > @@ -1,7 +1,7 @@
> > -From 15ee6a626242efb8f367be49c13e00d0b72317f0 Mon Sep 17 00:00:00 2001
> > +From db8169b46d64b6ee786fe2c60fa3d2cf16eb9568 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sat, 30 Apr 2016 15:25:03 -0700
> > -Subject: [PATCH 4/9] Dont disable libreadline.a when using --disable-static
> > +Subject: [PATCH] Dont disable libreadline.a when using --disable-static
> >
> >  If gdb is configured with --disable-static then this is dutifully passed to
> >  readline which then disables libreadline.a, which causes a problem when gdb
> > @@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   2 files changed, 3 insertions(+), 2 deletions(-)
> >
> >  diff --git a/Makefile.def b/Makefile.def
> > -index acdcd625ed6..78fc31e1199 100644
> > +index f974565d8ca..039b5a3c209 100644
> >  --- a/Makefile.def
> >  +++ b/Makefile.def
> >  @@ -120,7 +120,8 @@ host_modules= { module= libiconv;
> > @@ -33,10 +33,10 @@ index acdcd625ed6..78fc31e1199 100644
> >   host_modules= { module= sim; };
> >   host_modules= { module= texinfo; no_install= true; };
> >  diff --git a/Makefile.in b/Makefile.in
> > -index 3aacd2daac9..aa58adada4a 100644
> > +index a425b54e094..dfaf585a7c1 100644
> >  --- a/Makefile.in
> >  +++ b/Makefile.in
> > -@@ -32791,7 +32791,7 @@ configure-readline:
> > +@@ -32816,7 +32816,7 @@ configure-readline:
> >         $$s/$$module_srcdir/configure \
> >         --srcdir=$${topdir}/$$module_srcdir \
> >         $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
> > @@ -45,6 +45,3 @@ index 3aacd2daac9..aa58adada4a 100644
> >         || exit 1
> >   @endif readline
> >
> > ---
> > -2.36.1
> > -
> > diff --git a/meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
> > similarity index 84%
> > rename from meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
> > rename to meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
> > index 242099b9b1..a0f16a40b5 100644
> > --- a/meta/recipes-devtools/gdb/gdb/0005-use-asm-sgidefs.h.patch
> > +++ b/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
> > @@ -1,7 +1,7 @@
> > -From 25a75aaf29791f4302f0e4452f7ebaf735d4f083 Mon Sep 17 00:00:00 2001
> > +From 11f8574b00df6415b3c5842aef3b4dddae1c89e3 Mon Sep 17 00:00:00 2001
> >  From: Andre McCurdy <amccurdy@gmail.com>
> >  Date: Sat, 30 Apr 2016 15:29:06 -0700
> > -Subject: [PATCH 5/9] use <asm/sgidefs.h>
> > +Subject: [PATCH] use <asm/sgidefs.h>
> >
> >  Build fix for MIPS with musl libc
> >
> > @@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
> > -index 6adc61235aa..afb40066744 100644
> > +index 5e68538a3ba..5b1c209abd8 100644
> >  --- a/gdb/mips-linux-nat.c
> >  +++ b/gdb/mips-linux-nat.c
> >  @@ -31,7 +31,7 @@
> > @@ -31,6 +31,3 @@ index 6adc61235aa..afb40066744 100644
> >   #include "nat/gdb_ptrace.h"
> >   #include <asm/ptrace.h>
> >   #include "inf-ptrace.h"
> > ---
> > -2.36.1
> > -
> > diff --git a/meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
> > similarity index 84%
> > rename from meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
> > rename to meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
> > index 58c9b1d0a7..0e3d405068 100644
> > --- a/meta/recipes-devtools/gdb/gdb/0006-Change-order-of-CFLAGS.patch
> > +++ b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
> > @@ -1,7 +1,7 @@
> > -From c0e7c34134aa1f9644075c596a2338a50d3d923e Mon Sep 17 00:00:00 2001
> > +From 7e74eacbbf616c27cbb43eb85b881d79900626c7 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sat, 30 Apr 2016 15:35:39 -0700
> > -Subject: [PATCH 6/9] Change order of CFLAGS
> > +Subject: [PATCH] Change order of CFLAGS
> >
> >  Lets us override Werror if need be
> >
> > @@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
> > -index 47648b8d962..5599779de57 100644
> > +index 040f0b6faa0..256ce6a3f6a 100644
> >  --- a/gdbserver/Makefile.in
> >  +++ b/gdbserver/Makefile.in
> >  @@ -156,7 +156,7 @@ WIN32APILIBS = @WIN32APILIBS@
> > @@ -25,6 +25,3 @@ index 47648b8d962..5599779de57 100644
> >
> >   # LDFLAGS is specifically reserved for setting from the command line
> >   # when running make.
> > ---
> > -2.36.1
> > -
> > diff --git a/meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-conflict.patch b/meta/recipes-devtools/gdb/gdb/0006-resolve-restrict-keyword-conflict.patch
> > similarity index 91%
> > rename from meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-conflict.patch
> > rename to meta/recipes-devtools/gdb/gdb/0006-resolve-restrict-keyword-conflict.patch
> > index bbd1f0b27f..fd9bfc6835 100644
> > --- a/meta/recipes-devtools/gdb/gdb/0007-resolve-restrict-keyword-conflict.patch
> > +++ b/meta/recipes-devtools/gdb/gdb/0006-resolve-restrict-keyword-conflict.patch
> > @@ -1,7 +1,7 @@
> > -From 44fa1ecfbd8a5fe0cfea12a175fa041686842a0c Mon Sep 17 00:00:00 2001
> > +From 67f0b4bc9ad5111be38abf34c579fc4427b08b1f Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Tue, 10 May 2016 08:47:05 -0700
> > -Subject: [PATCH 7/9] resolve restrict keyword conflict
> > +Subject: [PATCH] resolve restrict keyword conflict
> >
> >  GCC detects that we call 'restrict' as param name in function
> >  signatures and complains since both params are called 'restrict'
> > @@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> >  diff --git a/gnulib/import/sys_time.in.h b/gnulib/import/sys_time.in.h
> > -index 90a67d18426..664641a1fe8 100644
> > +index 87db1a88745..e6b98c7e467 100644
> >  --- a/gnulib/import/sys_time.in.h
> >  +++ b/gnulib/import/sys_time.in.h
> >  @@ -93,20 +93,20 @@ struct timeval
> > @@ -43,6 +43,3 @@ index 90a67d18426..664641a1fe8 100644
> >   # endif
> >   _GL_CXXALIASWARN (gettimeofday);
> >   # if defined __cplusplus && defined GNULIB_NAMESPACE
> > ---
> > -2.36.1
> > -
> > diff --git a/meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.patch b/meta/recipes-devtools/gdb/gdb/0007-Fix-invalid-sigprocmask-call.patch
> > similarity index 90%
> > rename from meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.patch
> > rename to meta/recipes-devtools/gdb/gdb/0007-Fix-invalid-sigprocmask-call.patch
> > index ed1310ced2..2ac6b390bf 100644
> > --- a/meta/recipes-devtools/gdb/gdb/0008-Fix-invalid-sigprocmask-call.patch
> > +++ b/meta/recipes-devtools/gdb/gdb/0007-Fix-invalid-sigprocmask-call.patch
> > @@ -1,7 +1,7 @@
> > -From 5bdd15553daef7370ca3c1f12d8f14247fdd4907 Mon Sep 17 00:00:00 2001
> > +From d54e25d5919b98323415fffeccc4b8b2e297219a Mon Sep 17 00:00:00 2001
> >  From: Yousong Zhou <yszhou4tech@gmail.com>
> >  Date: Fri, 24 Mar 2017 10:36:03 +0800
> > -Subject: [PATCH 8/9] Fix invalid sigprocmask call
> > +Subject: [PATCH] Fix invalid sigprocmask call
> >  MIME-Version: 1.0
> >  Content-Type: text/plain; charset=UTF-8
> >  Content-Transfer-Encoding: 8bit
> > @@ -32,7 +32,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/gdbsupport/signals-state-save-restore.cc b/gdbsupport/signals-state-save-restore.cc
> > -index 92e799d3551..a4a0234272a 100644
> > +index 3ec7a259c9c..0702eca7725 100644
> >  --- a/gdbsupport/signals-state-save-restore.cc
> >  +++ b/gdbsupport/signals-state-save-restore.cc
> >  @@ -38,7 +38,7 @@ save_original_signals_state (bool quiet)
> > @@ -44,6 +44,3 @@ index 92e799d3551..a4a0234272a 100644
> >     if (res == -1)
> >       perror_with_name (("sigprocmask"));
> >
> > ---
> > -2.36.1
> > -
> > diff --git a/meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
> > index 3e29327613..59649c489c 100644
> > --- a/meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
> > +++ b/meta/recipes-devtools/gdb/gdb/0008-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
> > @@ -1,11 +1,11 @@
> > -From 48906e1038e469b429aa35d0f967730a929c3880 Mon Sep 17 00:00:00 2001
> > +From 48e5e823291a80b42a62181addc98ef8aa7b9354 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sun, 15 Jan 2023 00:16:25 -0800
> > -Subject: [PATCH 8/8] Define alignof using _Alignof when using C11 or newer
> > +Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
> >
> >  WG14 N2350 made very clear that it is an UB having type definitions
> >  within "offsetof" [1]. This patch enhances the implementation of macro
> > -alignof_slot to use builtin "_Alignof" to avoid undefined behavior on
> > +alignof to use builtin "_Alignof" to avoid undefined behavior on
> >  when using std=c11 or newer
> >
> >  clang 16+ has started to flag this [2]
> > @@ -15,14 +15,10 @@ Fixes build when using -std >= gnu11 and using clang16+
> >  Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though it
> >  may support C11, exclude those compilers too
> >
> > -gnulib needs this fix and then it will be applied to downstream packages
> > -like gdb [3]
> > -
> >  [1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
> >  [2] https://reviews.llvm.org/D133574
> > -[3] https://public-inbox.org/bug-gnulib/20230114232744.215167-1-raj.khem@gmail.com/T/#u
> >
> > -Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=2d404c7dd974cc65f894526f4a1b76bc1dcd8d82]
> > +Upstream-Status: Pending
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> >   libiberty/sha1.c | 10 ++++++++++
> > @@ -50,6 +46,3 @@ index 504f06d3b9b..790ada82443 100644
> >   # define UNALIGNED_P(p) (((size_t) p) % alignof (sha1_uint32) != 0)
> >         if (UNALIGNED_P (buffer))
> >       while (len > 64)
> > ---
> > -2.39.0
> > -
> > diff --git a/meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch b/meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
> > deleted file mode 100644
> > index f53d3bd1e5..0000000000
> > --- a/meta/recipes-devtools/gdb/gdb/0009-gdbserver-ctrl-c-handling.patch
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -From bc3b1f6aacf2d8fe66b022fbfcf28cd82c76e52f Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Thu, 29 Nov 2018 18:00:23 -0800
> > -Subject: [PATCH 9/9] gdbserver ctrl-c handling
> > -
> > -This problem was created by the upstream commit 78708b7c8c
> > -After applying the commit, it will send SIGINT to the process
> > -group(-signal_pid).
> > -But if we use gdbserver send SIGINT, and the attached process is not a
> > -process
> > -group leader, then the "kill (-signal_pid, SIGINT)" returns error and
> > -fails  to
> > -interrupt the attached process.
> > -
> > -Upstream-Status: Submitted
> > -[https://sourceware.org/bugzilla/show_bug.cgi?id=18945]
> > -
> > -Author: Josh Gao
> > -Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - gdbserver/linux-low.cc | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/gdbserver/linux-low.cc b/gdbserver/linux-low.cc
> > -index 7726a4a0c36..f750e074a03 100644
> > ---- a/gdbserver/linux-low.cc
> > -+++ b/gdbserver/linux-low.cc
> > -@@ -5496,7 +5496,7 @@ linux_process_target::request_interrupt ()
> > - {
> > -   /* Send a SIGINT to the process group.  This acts just like the user
> > -      typed a ^C on the controlling terminal.  */
> > --  ::kill (-signal_pid, SIGINT);
> > -+  ::kill (signal_pid, SIGINT);
> > - }
> > -
> > - bool
> > ---
> > -2.36.1
> > -
> > diff --git a/meta/recipes-devtools/gdb/gdb/readline-8.2.patch b/meta/recipes-devtools/gdb/gdb/readline-8.2.patch
> > deleted file mode 100644
> > index c2db4c0d79..0000000000
> > --- a/meta/recipes-devtools/gdb/gdb/readline-8.2.patch
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -From 1add37b567a7dee39d99f37b37802034c3fce9c4 Mon Sep 17 00:00:00 2001
> > -From: Andreas Schwab <schwab@linux-m68k.org>
> > -Date: Sun, 20 Mar 2022 14:01:54 +0100
> > -Subject: [PATCH] Add support for readline 8.2
> > -
> > -In readline 8.2 the type of rl_completer_word_break_characters changed to
> > -include const.
> > -
> > -Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=1add37b567a7dee39d99f37b37802034c3fce9c4]
> > -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ----
> > - gdb/completer.c | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/gdb/completer.c b/gdb/completer.c
> > -index d3900ae2014..a51c16ac7f8 100644
> > ---- a/gdb/completer.c
> > -+++ b/gdb/completer.c
> > -@@ -36,7 +36,7 @@
> > -    calling a hook instead so we eliminate the CLI dependency.  */
> > - #include "gdbcmd.h"
> > -
> > --/* Needed for rl_completer_word_break_characters() and for
> > -+/* Needed for rl_completer_word_break_characters and for
> > -    rl_filename_completion_function.  */
> > - #include "readline/readline.h"
> > -
> > -@@ -2011,7 +2011,7 @@ gdb_completion_word_break_characters_throw ()
> > -       rl_basic_quote_characters = NULL;
> > -     }
> > -
> > --  return rl_completer_word_break_characters;
> > -+  return (char *) rl_completer_word_break_characters;
> > - }
> > -
> > - char *
> > ---
> > -2.31.1
> > -
> > diff --git a/meta/recipes-devtools/gdb/gdb_12.1.bb b/meta/recipes-devtools/gdb/gdb_13.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/gdb/gdb_12.1.bb
> > rename to meta/recipes-devtools/gdb/gdb_13.1.bb
> > --
> > 2.39.2
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#177578): https://lists.openembedded.org/g/openembedded-core/message/177578
> > Mute This Topic: https://lists.openembedded.org/mt/97164047/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

