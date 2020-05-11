Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web12.13467.1589208418687328765
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 07:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EC42LF42;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id f3so9932936ioj.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 07:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C7FIprjSpcs3soun844IP9GhUVuJ7QQ0BHxviolWnt4=;
        b=EC42LF42cqGZRX3fJuTWrKY45k8KDFZhuweJuTNJUSSa/7/UgSvrueuySqAnfmyMXe
         h6SK67kl2xwNp72CnDouhFh1nQXyItKnEPBcHH/ROATEF06jafMHoddRZvtOjQqyl7tv
         fUIECRsu8PQbleIq2lefFiQWpY1+r7zcgiihrJEH9VqdZvlFjyvM4OOnDxc+xkTLTxlS
         EpYJtk0VZOzrAgeozcYNl/aBsgf56kZn/DAZhusV5iGzhMXqIo920D8UnZzRJYUjYSm+
         YjI4XfAkWaW2zEeI5rO+TiMNzbTNbg2IeuEtCU9j7of7zB3nne482hbgv0FT/NV3U1vx
         wKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C7FIprjSpcs3soun844IP9GhUVuJ7QQ0BHxviolWnt4=;
        b=LyFGLfySF9ZRTIUzsIwAHj85JLJZWmlOHAKnuvpdUxtE7f+SieFba9jl6WPGFRQr7C
         jUYaeUguI6wb6cF1Y2NUcJXJ8SJPF0LzqHtFqLMv3ue/Cso9rvyjbdHei7f14SoyPgGm
         Gp5whQXL0wCIvfcpkMqXG+NiWRUOOZ8xOKVPqstlmsORrHUAhu0YKq5PjAgu/LpsBfpP
         X7UgVjNxTSgsY+rQYI+K8nLXOTj92Wwn57Pl+i2xJE12No7RUsya8Bp2hJd4QA272tHu
         jayfcf3hdQUEc4TFc6fE1Yl2KSq5Ge1SWgBrmklVA3gtYHRWHSkMk80SFMJl5rBhU9Y+
         OSOA==
X-Gm-Message-State: AGi0PuaPHL1OxJOUNMYffy/xpm+2dO2jyQIoRBs/Rw9OLXCDWr3WGh+o
	dyKlh6pURDLoF4IWpbQ3nz33VtvaBxy4fw7LFAs=
X-Google-Smtp-Source: APiQypJFQgCLAuIsUZ/YOQD2NinzlEVR6gHpJ85C0+oSUVkmOvfANrExXqXmcB23oHTvxil/biLlHAP56XRVez1abTA=
X-Received: by 2002:a6b:b486:: with SMTP id d128mr13811581iof.79.1589208417928;
 Mon, 11 May 2020 07:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200510195050.3470835-1-raj.khem@gmail.com> <5703cd73-8de1-68ed-a165-164f3a7fc734@gmail.com>
In-Reply-To: <5703cd73-8de1-68ed-a165-164f3a7fc734@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 11 May 2020 07:46:31 -0700
Message-ID: <CAMKF1sod4rbKYKhwCnqgPub4ZdgvxAc=RFtBhqp9h2FuiTDeFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2 1/2] gcc10: Update to GCC 10.1 Release
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 10, 2020 at 11:14 PM Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
> On 5/10/20 9:50 PM, Khem Raj wrote:
> > * Package new gomp header acc_prof.h
> > * Package lto-dump which is a new tool in gcc10
> > * All Changes are here [1]
> > * Porting apps to gcc 10 help is here [2]
> >
> > [1] https://gcc.gnu.org/gcc-10/changes.html
> > [2] https://gcc.gnu.org/gcc-10/porting_to.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Correct SRC_URI checksums
> >
> >   meta/conf/distro/include/maintainers.inc      |   2 +-
> >   meta/conf/distro/include/tcmode-default.inc   |   2 +-
> >   .../gcc/{gcc-9.3.inc => gcc-10.1.inc}         |  51 ++++----
> >   ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  15 +--
> >   .../0002-gcc-poison-system-directories.patch  |  47 ++++----
> >   ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  11 +-
> >   .../0004-64-bit-multilib-hack.patch           |  15 +--
> >   .../0005-optional-libstdc.patch               |  29 ++---
> >   .../0006-COLLECT_GCC_OPTIONS.patch            |  11 +-
> >   ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  20 ++--
> >   .../0008-fortran-cross-compile-hack.patch     |  15 +--
> >   .../0009-cpp-honor-sysroot.patch              |  13 +-
> >   .../0010-MIPS64-Default-to-N64-ABI.patch      |  11 +-
> >   ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  33 +++---
> >   ...gcc-Fix-argument-list-too-long-error.patch |  11 +-
> >   .../0013-Disable-sdt.patch                    |  23 ++--
> >   .../{gcc-9.3 => gcc-10.1}/0014-libtool.patch  |   9 +-
> >   ...s-fix-v4bx-to-linker-to-support-EABI.patch |  11 +-
> >   ...-config-files-from-B-instead-of-usin.patch |  25 ++--
> >   ...ir-from-.la-which-usually-points-to-.patch |  11 +-
> >   .../0018-export-CPP.patch                     |   9 +-
> >   ...e-target-gcc-headers-can-be-included.patch |  13 +-
> >   ...-directory-during-relink-if-inst_pr.patch} |  11 +-
> >   ...R-replacement-instead-of-hardcoding.patch} |   9 +-
> >   ...2-aarch64-Add-support-for-musl-ldso.patch} |   9 +-
> >   ...fix-libcc1-s-install-path-and-rpath.patch} |   9 +-
> >   ...e-sysroot-support-for-nativesdk-gcc.patch} | 112 +++++++++---------
> >   ...root-gcc-version-specific-dirs-with.patch} |  13 +-
> >   ...us-_FOR_BUILD-and-related-variables.patch} |  27 ++---
> >   ...27-nios2-Define-MUSL_DYNAMIC_LINKER.patch} |   9 +-
> >   ...-to-link-commandline-for-musl-targe.patch} |  15 +--
> >   ...sing-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} |   9 +-
> >   .../0030-sync-gcc-stddef.h-with-musl.patch}   |   9 +-
> >   ...fault-in-precompiled-header-generat.patch} |  11 +-
> >   .../0032-Fix-for-testsuite-failure.patch}     |   9 +-
> >   ...e-introduce-spe-commandline-options.patch} |  11 +-
> >   ...s-for-__cpu_indicator_init-instead-.patch} |  29 ++---
> >   ...-Do-not-use-__LINE__-for-maintainin.patch} |  55 ++++-----
> >   ...ild-with-disable-dependency-tracking.patch |  54 ---------
> >   .../gcc/gcc-9.3/0030-ldbl128-config.patch     |  79 ------------
> >   ...heck-zero-value-in-simple_object_elf.patch |  48 --------
> >   ...ands-Don-t-match-user-defined-regs-o.patch | 100 ----------------
> >   ...dian_9.3.bb => gcc-cross-canadian_10.1.bb} |   0
> >   .../{gcc-cross_9.3.bb => gcc-cross_10.1.bb}   |   0
> >   ...c-crosssdk_9.3.bb => gcc-crosssdk_10.1.bb} |   0
> >   meta/recipes-devtools/gcc/gcc-runtime.inc     |   1 +
> >   ...gcc-runtime_9.3.bb => gcc-runtime_10.1.bb} |   0
> >   ...nitizers_9.3.bb => gcc-sanitizers_10.1.bb} |   0
> >   .../{gcc-source_9.3.bb => gcc-source_10.1.bb} |   0
> >   meta/recipes-devtools/gcc/gcc-target.inc      |   1 +
> >   .../gcc/{gcc_9.3.bb => gcc_10.1.bb}           |   0
> >   ...-initial_9.3.bb => libgcc-initial_10.1.bb} |   0
> >   .../gcc/{libgcc_9.3.bb => libgcc_10.1.bb}     |   0
> >   ...libgfortran_9.3.bb => libgfortran_10.1.bb} |   0
> >   meta/recipes-support/icu/icu/filter.json      |   6 +
> >   55 files changed, 322 insertions(+), 701 deletions(-)
>
> The changes in icu/ seem unrelated to the gcc update ?

its unrelated to gcc update, Thanks for pointing out.
