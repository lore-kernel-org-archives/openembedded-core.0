Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32EDC04A94
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 18:59:20 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.609.1690829957866399774
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 11:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lrb1lsyd;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6b9e478e122so4239664a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 11:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690829957; x=1691434757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1w6INFmuis1nKIQmVnkaolE64EHNq3RReB4paDm5xtI=;
        b=lrb1lsydJ0wpKRLfjU0XhH+ghx3pNKdcysslhp2PgFvCC1qdIUDfGMMqXGgg9usZK1
         uj7nLgsdIbhJIhOn4QkgimjCckgJtV81C4BGt6lGyx7LCF3J+8RgA585nlo9IBWWJdTT
         deuc6j1Bj1X95phdghhf+yab1IbTkS18lGeVHj87Lm0ULAVSdXko7TuzWUOK2OWyR5LO
         QJDsU+RTZQLbMAvciY1+Zr/a6mTDwOeE8W1/bcAoMdL29NY4+CmrCbEw2JEHszTyTmdS
         2f2pWd/A5v9eiC4eUH18ipDnGK1bENRa+BIaal/L3GrnzgrejGGN1C113HReG+Qg+JhV
         tuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690829957; x=1691434757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1w6INFmuis1nKIQmVnkaolE64EHNq3RReB4paDm5xtI=;
        b=IYq6qmt0m9ak2lPoxcaLuxAb78DoK8J22WUovVH4SwXbanecBeYiJOM7j1mJsmFhBT
         Kmhq8kHnU+TOMcGxwsk91SkO+B/+ZyeFpvCzKRiC336UyfDmz8oL40Rtaz5fn7BZjyGv
         6ZGLqLKHQlit3A3dT2eE3a9BDjOAH69YfqkYTuazC0fsbQWLEMXEcMICQN3rDGnsaaIi
         Ln9TUWtiyn3MLqEp5HZ0Tg9+uGFLsyaIhdSxiaatSyb3Oz3rBtErq06nbPQqTVKsVI20
         chvSxtXI6bWTbN9z2DEwT7FR1/YWRrrU0HyuNCO17ua/L8QkrgnsEbfmdPjPAWXr5Pn7
         riTg==
X-Gm-Message-State: ABy/qLYHsHUxyj3IG9xRN80pKWmnyya61SmSJhHHQHV1aMGM6z1j0Iii
	YWh/VBCJvTA6Lm5wox/Teo004jFayBQiquxXhqf100GkiBv4qw==
X-Google-Smtp-Source: APBJJlHpJTlOVv0gtjilj/Zbh1Wl2add2t8GCoAozfbUcmwpjoxjVYPLmA9V7hqhQImQUH23wkc8BOeNMf55Hwg9ry0=
X-Received: by 2002:a05:6871:5cf:b0:1be:e1d9:6f80 with SMTP id
 v15-20020a05687105cf00b001bee1d96f80mr4585825oan.27.1690829955902; Mon, 31
 Jul 2023 11:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230730175859.11238-1-raj.khem@gmail.com> <2023073116150292d2a8f3@mail.local>
In-Reply-To: <2023073116150292d2a8f3@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Jul 2023 11:58:49 -0700
Message-ID: <CAMKF1srNBh3hoEVeE7cz-yUFYqMuAh5WGhVxGmA+_dpgSxGSfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] binutils: Upgrade to 2.41 release
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 18:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185161

On Mon, Jul 31, 2023 at 9:15=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Khem,
>
> mingw is failing:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7578/st=
eps/16/logs/stdio
>

This is due to a patch I wanted to drop but I guess we still need it,
So I will reintroduce it
perhaps make is mingw specific this time.

> ffmpeg:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3283/s=
teps/12/logs/stdio
>

This seems to be new

| src/libavcodec/x86/mathops.h: Assembler messages:
| src/libavcodec/x86/mathops.h:125: Error: operand type mismatch for `shr'

I will look into it.

> genericx86, qemux86:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/7570/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6429/s=
teps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/7477/st=
eps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/6293/s=
teps/12/logs/stdio
>
> lib32:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/7570/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/7426/st=
eps/12/logs/stdio
>

all of 32bit x86 issues are due to LFS64 symbols being used with LFS
enabled by default
so it will be a single fix to check for LFS

> It also seems to break xen:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/2007/s=
teps/20/logs/stdio
>

| arch/arm/arm32/proc-v7.S: Assembler messages:
| arch/arm/arm32/proc-v7.S:32: Error: junk at end of line, first
unrecognized character is `#'
| arch/arm/arm32/proc-v7.S:41: Error: junk at end of line, first
unrecognized character is `#'
| arch/arm/arm32/proc-v7.S:50: Error: junk at end of line, first
unrecognized character is `#'
| make[4]: *** [Rules.mk:253: arch/arm/arm32/proc-v7.o] Error 1

Could be a race, need to reproduce

> On 30/07/2023 10:58:59-0700, Khem Raj wrote:
> > Detailed changes [1]
> >
> > [1] https://sourceware.org/pipermail/binutils/2023-July/128719.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Needed to drop a backport
> >
> >  meta/conf/distro/include/tcmode-default.inc   |    2 +-
> >  .../{binutils-2.40.inc =3D> binutils-2.41.inc}  |   14 +-
> >  ....40.bb =3D> binutils-cross-canadian_2.41.bb} |    0
> >  ...40.bb =3D> binutils-cross-testsuite_2.41.bb} |    0
> >  ...s-cross_2.40.bb =3D> binutils-cross_2.41.bb} |    0
> >  ...ssdk_2.40.bb =3D> binutils-crosssdk_2.41.bb} |    0
> >  ...emory-access-when-an-accessing-a-zer.patch |   43 -
> >  ...s-crosssdk-Generate-relocatable-SDKs.patch |    8 +-
> >  ...o-not-generate-linker-script-directo.patch |    2 +-
> >  ...dk-Search-for-alternative-ld.so.conf.patch |   14 +-
> >  ...004-Point-scripts-location-to-libdir.patch |    6 +-
> >  ...stro-compiler-point-to-the-wrong-ins.patch |    2 +-
> >  ...-system-directories-when-cross-linki.patch |   59 +-
> >  ...ect-assembling-for-ppc-wait-mnemonic.patch |    2 +-
> >  .../binutils/0008-Use-libtool-2.4.patch       | 4553 ++++++-----------
> >  ...h-in-libtool-when-sysroot-is-enabled.patch |    2 +-
> >  .../0010-sync-with-OE-libtool-changes.patch   |    2 +-
> >  ...or-clang-before-checking-gcc-version.patch |    2 +-
> >  ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |    6 +-
> >  ...sing-_Alignof-when-using-C11-or-newe.patch |    2 +-
> >  ...-pe-dll.o-entry-deom-targ_extra_ofil.patch |   32 -
> >  .../binutils/0016-CVE-2023-25586.patch        |   34 -
> >  .../binutils/binutils/fix-time64.patch        |   94 -
> >  .../{binutils_2.40.bb =3D> binutils_2.41.bb}    |    0
> >  24 files changed, 1740 insertions(+), 3139 deletions(-)
> >  rename meta/recipes-devtools/binutils/{binutils-2.40.inc =3D> binutils=
-2.41.inc} (78%)
> >  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.40.bb=
 =3D> binutils-cross-canadian_2.41.bb} (100%)
> >  rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.40.b=
b =3D> binutils-cross-testsuite_2.41.bb} (100%)
> >  rename meta/recipes-devtools/binutils/{binutils-cross_2.40.bb =3D> bin=
utils-cross_2.41.bb} (100%)
> >  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.40.bb =3D> =
binutils-crosssdk_2.41.bb} (100%)
> >  delete mode 100644 meta/recipes-devtools/binutils/binutils/0001-Fix-an=
-illegal-memory-access-when-an-accessing-a-zer.patch
> >  delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-Remove=
-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
> >  delete mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-20=
23-25586.patch
> >  delete mode 100644 meta/recipes-devtools/binutils/binutils/fix-time64.=
patch
> >  rename meta/recipes-devtools/binutils/{binutils_2.40.bb =3D> binutils_=
2.41.bb} (100%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/di=
stro/include/tcmode-default.inc
> > index 8c62a317a0d..660ca5f72d6 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
> >
> >  GCCVERSION ?=3D "13.%"
> >  SDKGCCVERSION ?=3D "${GCCVERSION}"
> > -BINUVERSION ?=3D "2.40%"
> > +BINUVERSION ?=3D "2.41%"
> >  GDBVERSION ?=3D "13.%"
> >  GLIBCVERSION ?=3D "2.38"
> >  LINUXLIBCVERSION ?=3D "6.4%"
> > diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/re=
cipes-devtools/binutils/binutils-2.41.inc
> > similarity index 78%
> > rename from meta/recipes-devtools/binutils/binutils-2.40.inc
> > rename to meta/recipes-devtools/binutils/binutils-2.41.inc
> > index dea68ee6fc2..fa056dd99e1 100644
> > --- a/meta/recipes-devtools/binutils/binutils-2.40.inc
> > +++ b/meta/recipes-devtools/binutils/binutils-2.41.inc
> > @@ -10,15 +10,15 @@ LIC_FILES_CHKSUM=3D"\
> >      file://bfd/COPYING;md5=3Dd32239bcb673463ab874e80d47fae504\
> >      "
> >
> > -# When upgrading to 2.41, please make sure there is no trailing .0, so
> > +# When upgrading to 2.42, please make sure there is no trailing .0, so
> >  # that upstream version check can work correctly.
> > -PV =3D "2.40"
> > -CVE_VERSION =3D "2.40"
> > -SRCBRANCH ?=3D "binutils-2_40-branch"
> > +PV =3D "2.41"
> > +CVE_VERSION =3D "2.41"
> > +SRCBRANCH ?=3D "binutils-2_41-branch"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d_?)*)"
> >
> > -SRCREV ?=3D "4671be001eb5a899ecac3e2686a92934000f8262"
> > +SRCREV ?=3D "7872e3bdb0de234ae4ace053cde0c915ff2332d4"
> >  BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branc=
h=3D${SRCBRANCH};protocol=3Dhttps"
> >  SRC_URI =3D "\
> >       ${BINUTILS_GIT_URI} \
> > @@ -32,9 +32,5 @@ SRC_URI =3D "\
> >       file://0011-Check-for-clang-before-checking-gcc-version.patch \
> >       file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.=
patch \
> >       file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.=
patch \
> > -     file://0015-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.=
patch \
> > -     file://0016-CVE-2023-25586.patch \
> > -     file://fix-time64.patch \
> > -     file://0001-Fix-an-illegal-memory-access-when-an-accessing-a-zer.=
patch \
> >  "
> >  S  =3D "${WORKDIR}/git"
> > diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.4=
0.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.41.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.40=
.bb
> > rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.41.b=
b
> > diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.=
40.bb b/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.41.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/binutils-cross-testsuite_2.4=
0.bb
> > rename to meta/recipes-devtools/binutils/binutils-cross-testsuite_2.41.=
bb
> > diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.40.bb b/me=
ta/recipes-devtools/binutils/binutils-cross_2.41.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/binutils-cross_2.40.bb
> > rename to meta/recipes-devtools/binutils/binutils-cross_2.41.bb
> > diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.40.bb b=
/meta/recipes-devtools/binutils/binutils-crosssdk_2.41.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.40.bb
> > rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.41.bb
> > diff --git a/meta/recipes-devtools/binutils/binutils/0001-Fix-an-illega=
l-memory-access-when-an-accessing-a-zer.patch b/meta/recipes-devtools/binut=
ils/binutils/0001-Fix-an-illegal-memory-access-when-an-accessing-a-zer.patc=
h
> > deleted file mode 100644
> > index 31157cacd2f..00000000000
> > --- a/meta/recipes-devtools/binutils/binutils/0001-Fix-an-illegal-memor=
y-access-when-an-accessing-a-zer.patch
> > +++ /dev/null
> > @@ -1,43 +0,0 @@
> > -From c22d38baefc5a7a1e1f5cdc9dbb556b1f0ec5c57 Mon Sep 17 00:00:00 2001
> > -From: Nick Clifton <nickc@redhat.com>
> > -Date: Thu, 30 Mar 2023 10:10:09 +0100
> > -Subject: [PATCH] Fix an illegal memory access when an accessing a
> > - zer0-lengthverdef table.
> > -
> > -  PR 30285
> > -  * elf.c (_bfd_elf_slurp_version_tables): Fail if no version definiti=
ons are allocated.
> > -
> > -CVE: CVE-2023-1972
> > -Upstream-Status: Backport
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ----
> > - bfd/ChangeLog | 6 ++++++
> > - bfd/elf.c     | 5 +++++
> > - 2 files changed, 11 insertions(+)
> > -
> > -diff --git a/bfd/elf.c b/bfd/elf.c
> > -index 027d0143735..185028cbd97 100644
> > ---- a/bfd/elf.c
> > -+++ b/bfd/elf.c
> > -@@ -9030,6 +9030,9 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool d=
efault_imported_symver)
> > -       bfd_set_error (bfd_error_file_too_big);
> > -       goto error_return_verdef;
> > -     }
> > -+
> > -+      if (amt =3D=3D 0)
> > -+    goto error_return_verdef;
> > -       elf_tdata (abfd)->verdef =3D (Elf_Internal_Verdef *) bfd_zalloc=
 (abfd, amt);
> > -       if (elf_tdata (abfd)->verdef =3D=3D NULL)
> > -     goto error_return_verdef;
> > -@@ -9133,6 +9136,8 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool d=
efault_imported_symver)
> > -       bfd_set_error (bfd_error_file_too_big);
> > -       goto error_return;
> > -     }
> > -+      if (amt =3D=3D 0)
> > -+    goto error_return;
> > -       elf_tdata (abfd)->verdef =3D (Elf_Internal_Verdef *) bfd_zalloc=
 (abfd, amt);
> > -       if (elf_tdata (abfd)->verdef =3D=3D NULL)
> > -     goto error_return;
> > ---
> > -2.34.1
> > -
> > diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-cros=
ssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binut=
ils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> > index ca249834ea6..48ecd6a4f01 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Ge=
nerate-relocatable-SDKs.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Ge=
nerate-relocatable-SDKs.patch
> > @@ -1,4 +1,4 @@
> > -From 4bdab425bdd7dc52c95bfd62e035c1b9abe9595e Mon Sep 17 00:00:00 2001
> > +From 1418ddb08714c987623b2ba876958d86761ebe5f Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 2 Mar 2015 01:58:54 +0000
> >  Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
> > @@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   3 files changed, 6 insertions(+), 3 deletions(-)
> >
> >  diff --git a/gold/layout.cc b/gold/layout.cc
> > -index 899d4af0707..7c31b1bef6e 100644
> > +index b94855f8662..51f2d74d79d 100644
> >  --- a/gold/layout.cc
> >  +++ b/gold/layout.cc
> > -@@ -5083,7 +5083,7 @@ Layout::create_interp(const Target* target)
> > +@@ -5102,7 +5102,7 @@ Layout::create_interp(const Target* target)
> >         gold_assert(interp !=3D NULL);
> >       }
> >
> > @@ -59,7 +59,7 @@ index 382bd07ffe2..9fbd0c4cb8a 100755
> >   DATA_ALIGNMENT=3D${DATA_ALIGNMENT_}
> >   RELOCATING=3D" "
> >  diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
> > -index 5d3b0d31b1b..2163909cd56 100644
> > +index 1e3c5aa8504..b8d1977b3f0 100644
> >  --- a/ld/scripttempl/elf.sc
> >  +++ b/ld/scripttempl/elf.sc
> >  @@ -148,8 +148,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
> > diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cros=
s-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binut=
ils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patc=
h
> > index 663dc4af7d6..7abdab1bf21 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-no=
t-generate-linker-script-directo.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-no=
t-generate-linker-script-directo.patch
> > @@ -1,4 +1,4 @@
> > -From c79005d4d9991593557766ad569f48c26482399f Mon Sep 17 00:00:00 2001
> > +From 665c3f4b9627a4a4d76d394fbd2008acfa6aa2a5 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 6 Mar 2017 23:37:05 -0800
> >  Subject: [PATCH] binutils-cross: Do not generate linker script directo=
ries
> > diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nati=
vesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binut=
ils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patc=
h
> > index f46116f1af6..5a283ff923d 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-S=
earch-for-alternative-ld.so.conf.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-S=
earch-for-alternative-ld.so.conf.patch
> > @@ -1,4 +1,4 @@
> > -From 70da8b91026c5381d430194910fc15e3b6c5ec7f Mon Sep 17 00:00:00 2001
> > +From ceaa508225c17893226734e6d0d8b63aaec2d670 Mon Sep 17 00:00:00 2001
> >  From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >  Date: Wed, 19 Feb 2020 09:51:16 -0800
> >  Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf=
 in SDK
> > @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   5 files changed, 7 insertions(+), 3 deletions(-)
> >
> >  diff --git a/ld/Makefile.am b/ld/Makefile.am
> > -index b3195b4be68..fc6460317a7 100644
> > +index c3adbb0ccad..ce0f7e7f85d 100644
> >  --- a/ld/Makefile.am
> >  +++ b/ld/Makefile.am
> >  @@ -42,7 +42,8 @@ ZLIBINC =3D @zlibinc@
> > @@ -43,7 +43,7 @@ index b3195b4be68..fc6460317a7 100644
> >   NO_WERROR =3D @NO_WERROR@
> >   AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS) $(ZSTD_C=
FLAGS)
> >  diff --git a/ld/Makefile.in b/ld/Makefile.in
> > -index fe422569228..4a4c851b44a 100644
> > +index d1a56026437..9d86aed12c6 100644
> >  --- a/ld/Makefile.in
> >  +++ b/ld/Makefile.in
> >  @@ -566,7 +566,8 @@ ZLIB =3D @zlibdir@ -lz
> > @@ -57,7 +57,7 @@ index fe422569228..4a4c851b44a 100644
> >   AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON_CFLAGS) $(ZSTD_C=
FLAGS)
> >
> >  diff --git a/ld/ldelf.c b/ld/ldelf.c
> > -index eff6693e052..95787012b89 100644
> > +index f9a6819366f..1519f8ac4e5 100644
> >  --- a/ld/ldelf.c
> >  +++ b/ld/ldelf.c
> >  @@ -936,7 +936,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_need=
ed_list *l, int force,
> > @@ -65,15 +65,15 @@ index eff6693e052..95787012b89 100644
> >         info.path =3D NULL;
> >         info.len =3D info.alloc =3D 0;
> >  -      tmppath =3D concat (ld_sysroot, prefix, "/etc/ld.so.conf",
> > -+      tmppath =3D concat (ld_sysconfdir, "/etc/ld.so.conf",
> > ++      tmppath =3D concat (ld_sysconfdir, "/ld.so.conf",
> >                       (const char *) NULL);
> >         if (!ldelf_parse_ld_so_conf (&info, tmppath))
> >       {
> >  diff --git a/ld/ldmain.c b/ld/ldmain.c
> > -index 9290a189b0d..ceaca2d85d0 100644
> > +index 06ac2c64fa8..5c38e8cd313 100644
> >  --- a/ld/ldmain.c
> >  +++ b/ld/ldmain.c
> > -@@ -70,6 +70,7 @@ char *program_name;
> > +@@ -69,6 +69,7 @@ char *program_name;
> >
> >   /* The prefix for system library directories.  */
> >   const char *ld_sysroot;
> > diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts=
-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Po=
int-scripts-location-to-libdir.patch
> > index e7d2593c493..11576eafdc3 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-locati=
on-to-libdir.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-locati=
on-to-libdir.patch
> > @@ -1,4 +1,4 @@
> > -From fa477bb947fa17543f4550bc0e7e715c8355649c Mon Sep 17 00:00:00 2001
> > +From fe1d4166caa5e566453f23c4263933dd704eebe4 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 2 Mar 2015 01:09:58 +0000
> >  Subject: [PATCH] Point scripts location to libdir
> > @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/ld/Makefile.am b/ld/Makefile.am
> > -index fc6460317a7..1b875904b8d 100644
> > +index ce0f7e7f85d..2e36ab4efc4 100644
> >  --- a/ld/Makefile.am
> >  +++ b/ld/Makefile.am
> >  @@ -51,7 +51,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSSON=
_CFLAGS) $(ZSTD_CFLAGS)
> > @@ -25,7 +25,7 @@ index fc6460317a7..1b875904b8d 100644
> >   EMUL =3D @EMUL@
> >   EMULATION_OFILES =3D @EMULATION_OFILES@
> >  diff --git a/ld/Makefile.in b/ld/Makefile.in
> > -index 4a4c851b44a..08dcd7b75fc 100644
> > +index 9d86aed12c6..c21c554e432 100644
> >  --- a/ld/Makefile.in
> >  +++ b/ld/Makefile.in
> >  @@ -574,7 +574,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CLFAGS) $(JANSS=
ON_CFLAGS) $(ZSTD_CFLAGS)
> > diff --git a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the=
-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binut=
ils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patc=
h
> > index 7242f487959..691a2fb7540 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro=
-compiler-point-to-the-wrong-ins.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro=
-compiler-point-to-the-wrong-ins.patch
> > @@ -1,4 +1,4 @@
> > -From 7912f5a918e612950feb04d845934f26160e85da Mon Sep 17 00:00:00 2001
> > +From 05b51e63f40ef59a7ef1e5278f915e8812aa5f43 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 2 Mar 2015 01:39:01 +0000
> >  Subject: [PATCH] don't let the distro compiler point to the wrong inst=
allation
> > diff --git a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses=
-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binut=
ils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patc=
h
> > index 87bbe9fb1b9..11b1ea2218e 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-sys=
tem-directories-when-cross-linki.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-sys=
tem-directories-when-cross-linki.patch
> > @@ -1,4 +1,4 @@
> > -From 725ca09ee1041f64589f26ba815ef11da687c608 Mon Sep 17 00:00:00 2001
> > +From b2cc54cfbb0938c2b63af58631043ce504e41131 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Fri, 15 Jan 2016 06:31:09 +0000
> >  Subject: [PATCH] warn for uses of system directories when cross linkin=
g
> > @@ -59,8 +59,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   ld/ldfile.c     | 17 +++++++++++++++++
> >   ld/ldlex.h      |  2 ++
> >   ld/ldmain.c     |  6 ++++--
> > - ld/lexsup.c     | 16 ++++++++++++++++
> > - 9 files changed, 88 insertions(+), 2 deletions(-)
> > + ld/lexsup.c     | 15 +++++++++++++++
> > + 9 files changed, 87 insertions(+), 2 deletions(-)
> >
> >  diff --git a/ld/config.in b/ld/config.in
> >  index ad0dc6a106c..d21edaddce7 100644
> > @@ -77,7 +77,7 @@ index ad0dc6a106c..d21edaddce7 100644
> >   #undef EXTRA_SHLIB_EXTENSION
> >
> >  diff --git a/ld/configure b/ld/configure
> > -index 995708089fd..6406a42c442 100755
> > +index 1503936432f..29896853a90 100755
> >  --- a/ld/configure
> >  +++ b/ld/configure
> >  @@ -839,6 +839,7 @@ with_lib_path
> > @@ -139,7 +139,7 @@ index 77edac3258c..a74dac63038 100644
> >   dnl "install_as_default" is set to false if gold is the default linke=
r.
> >   dnl "installed_linker" is the installed BFD linker name.
> >  diff --git a/ld/ld.h b/ld/ld.h
> > -index 05649ff61b8..1818c227473 100644
> > +index a0f8a15c7a9..e3db345f3a5 100644
> >  --- a/ld/ld.h
> >  +++ b/ld/ld.h
> >  @@ -163,6 +163,14 @@ typedef struct
> > @@ -158,10 +158,10 @@ index 05649ff61b8..1818c227473 100644
> >     enum endian_enum endian;
> >
> >  diff --git a/ld/ld.texi b/ld/ld.texi
> > -index db3a9f09b45..77037399cb9 100644
> > +index aa8b1aa86eb..9bc4bc28823 100644
> >  --- a/ld/ld.texi
> >  +++ b/ld/ld.texi
> > -@@ -2960,6 +2960,18 @@ creation of the metadata note, if one had been =
enabled by an earlier
> > +@@ -3059,6 +3059,18 @@ creation of the metadata note, if one had been =
enabled by an earlier
> >   occurrence of the --package-metdata option.
> >   If the linker has been built with libjansson, then the JSON string
> >   will be validated.
> > @@ -181,10 +181,10 @@ index db3a9f09b45..77037399cb9 100644
> >
> >   @c man end
> >  diff --git a/ld/ldfile.c b/ld/ldfile.c
> > -index b8fd4e5d8e0..1f1d8e23bc9 100644
> > +index df7c9cbd65e..0c965593225 100644
> >  --- a/ld/ldfile.c
> >  +++ b/ld/ldfile.c
> > -@@ -117,6 +117,23 @@ ldfile_add_library_path (const char *name, bool c=
mdline)
> > +@@ -327,6 +327,23 @@ ldfile_add_library_path (const char *name, bool c=
mdline)
> >       new_dirs->name =3D concat (ld_sysroot, name + strlen ("$SYSROOT")=
, (const char *) NULL);
> >     else
> >       new_dirs->name =3D xstrdup (name);
> > @@ -209,23 +209,23 @@ index b8fd4e5d8e0..1f1d8e23bc9 100644
> >
> >   /* Try to open a BFD for a lang_input_statement.  */
> >  diff --git a/ld/ldlex.h b/ld/ldlex.h
> > -index 0538f0a06a1..f94a71875d8 100644
> > +index 87cac02141d..d1a478fb827 100644
> >  --- a/ld/ldlex.h
> >  +++ b/ld/ldlex.h
> > -@@ -170,6 +170,8 @@ enum option_values
> > -   OPTION_NO_WARN_EXECSTACK,
> > -   OPTION_WARN_RWX_SEGMENTS,
> > -   OPTION_NO_WARN_RWX_SEGMENTS,
> > +@@ -147,6 +147,8 @@ enum option_values
> > +   OPTION_PLUGIN,
> > +   OPTION_PLUGIN_OPT,
> > + #endif /* BFD_SUPPORTS_PLUGINS */
> >  +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
> >  +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
> > - };
> > -
> > - /* The initial parser states.  */
> > +   OPTION_DEFAULT_SCRIPT,
> > +   OPTION_PRINT_OUTPUT_FORMAT,
> > +   OPTION_PRINT_SYSROOT,
> >  diff --git a/ld/ldmain.c b/ld/ldmain.c
> > -index ceaca2d85d0..62e7b4e5341 100644
> > +index 5c38e8cd313..04eed320aca 100644
> >  --- a/ld/ldmain.c
> >  +++ b/ld/ldmain.c
> > -@@ -322,6 +322,8 @@ main (int argc, char **argv)
> > +@@ -326,6 +326,8 @@ main (int argc, char **argv)
> >     command_line.warn_mismatch =3D true;
> >     command_line.warn_search_mismatch =3D true;
> >     command_line.check_section_addresses =3D -1;
> > @@ -234,7 +234,7 @@ index ceaca2d85d0..62e7b4e5341 100644
> >
> >     /* We initialize DEMANGLING based on the environment variable
> >        COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
> > -@@ -1454,7 +1456,7 @@ undefined_symbol (struct bfd_link_info *info,
> > +@@ -1458,7 +1460,7 @@ undefined_symbol (struct bfd_link_info *info,
> >         argv[1] =3D "undefined-symbol";
> >         argv[2] =3D (char *) name;
> >         argv[3] =3D NULL;
> > @@ -243,7 +243,7 @@ index ceaca2d85d0..62e7b4e5341 100644
> >         if (verbose)
> >       einfo (_("%P: About to run error handling script '%s' with argume=
nts: '%s' '%s'\n"),
> >              argv[0], argv[1], argv[2]);
> > -@@ -1475,7 +1477,7 @@ undefined_symbol (struct bfd_link_info *info,
> > +@@ -1479,7 +1481,7 @@ undefined_symbol (struct bfd_link_info *info,
> >        carry on to issue the normal error message.  */
> >       }
> >   #endif /* SUPPORT_ERROR_HANDLING_SCRIPT */
> > @@ -253,10 +253,10 @@ index ceaca2d85d0..62e7b4e5341 100644
> >       {
> >         if (error_count < MAX_ERRORS_IN_A_ROW)
> >  diff --git a/ld/lexsup.c b/ld/lexsup.c
> > -index a1c6140100d..d47ba4f977d 100644
> > +index fe8722313fe..1df7af3ccaa 100644
> >  --- a/ld/lexsup.c
> >  +++ b/ld/lexsup.c
> > -@@ -613,6 +613,14 @@ static const struct ld_option ld_options[] =3D
> > +@@ -629,6 +629,14 @@ static const struct ld_option ld_options[] =3D
> >                  "                                <method> is: share-un=
conflicted (default),\n"
> >                  "                                             share-du=
plicated"),
> >       TWO_DASHES },
> > @@ -271,18 +271,17 @@ index a1c6140100d..d47ba4f977d 100644
> >   };
> >
> >   #define OPTION_COUNT ARRAY_SIZE (ld_options)
> > -@@ -1737,6 +1745,14 @@ parse_args (unsigned argc, char **argv)
> > -       config.print_map_discarded =3D true;
> > -       break;
> > +@@ -1787,6 +1795,13 @@ parse_args (unsigned argc, char **argv)
> >
> > +     case OPTION_PRINT_MAP_LOCALS:
> > +       config.print_map_locals =3D true;
> > ++
> >  +    case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
> >  +      command_line.poison_system_directories =3D false;
> >  +      break;
> >  +
> >  +    case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
> >  +      command_line.error_poison_system_directories =3D true;
> > -+      break;
> > -+
> > -     case OPTION_DEPENDENCY_FILE:
> > -       config.dependency_file =3D optarg;
> >         break;
> > +
> > +     case OPTION_DEPENDENCY_FILE:
> > diff --git a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incor=
rect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutil=
s/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> > index fdd1f7756fb..fa8cdcf287f 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-as=
sembling-for-ppc-wait-mnemonic.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-as=
sembling-for-ppc-wait-mnemonic.patch
> > @@ -1,4 +1,4 @@
> > -From 4e9d4ace8a340399aeaa8332e2cfbfcc7d2d14d7 Mon Sep 17 00:00:00 2001
> > +From a00c8d672a050d2d70d7adbbce67d0576e699513 Mon Sep 17 00:00:00 2001
> >  From: Zhenhua Luo <zhenhua.luo@nxp.com>
> >  Date: Sat, 11 Jun 2016 22:08:29 -0500
> >  Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
> > diff --git a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2=
.4.patch b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.pat=
ch
> > index 0be871f5cf0..e9af44dfdec 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patc=
h
> > +++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patc=
h
> > @@ -1,4 +1,4 @@
> > -From a66b1806350a9bed7b188c7d115991f6cdee51a9 Mon Sep 17 00:00:00 2001
> > +From 3d058d30ab2eb1ee33468cb351164c98ce4fd545 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sun, 14 Feb 2016 17:04:07 +0000
> >  Subject: [PATCH] Use libtool 2.4
> > @@ -27,11 +27,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   gprofng/src/Makefile.in             |    2 +
> >   ld/Makefile.in                      |    3 +
> >   ld/configure                        | 1704 ++++++++++++----
> > - libbacktrace/Makefile.in            |    3 +
> > - libbacktrace/configure              | 1331 +++++++++---
> > + libbacktrace/Makefile.in            |  108 +-
> > + libbacktrace/aclocal.m4             |   73 +-
> > + libbacktrace/configure              | 1441 +++++++++----
> >   libctf/Makefile.in                  |    2 +
> >   libctf/configure                    | 1330 +++++++++---
> > - libsframe/Makefile.in               |  249 ++-
> > + libsframe/Makefile.in               |  344 ++--
> >   libsframe/aclocal.m4                |  220 +-
> >   libsframe/configure                 | 1553 ++++++++++----
> >   libtool.m4                          | 1093 ++++++----
> > @@ -41,17 +42,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   lt~obsolete.m4                      |    2 +-
> >   opcodes/Makefile.in                 |    3 +
> >   opcodes/configure                   | 1331 +++++++++---
> > - sim/Makefile.in                     |    3 +
> > - sim/configure                       | 1331 +++++++++---
> >   zlib/Makefile.in                    |    3 +
> >   zlib/configure                      | 1331 +++++++++---
> > - 36 files changed, 16896 insertions(+), 6289 deletions(-)
> > + 35 files changed, 16108 insertions(+), 6126 deletions(-)
> >
> >  diff --git a/bfd/Makefile.in b/bfd/Makefile.in
> > -index 80aed657643..106ec256a79 100644
> > +index 4edfedee924..ed7257f2e96 100644
> >  --- a/bfd/Makefile.in
> >  +++ b/bfd/Makefile.in
> > -@@ -347,6 +347,7 @@ DATADIRNAME =3D @DATADIRNAME@
> > +@@ -334,6 +334,7 @@ DATADIRNAME =3D @DATADIRNAME@
> >   DEBUGDIR =3D @DEBUGDIR@
> >   DEFS =3D @DEFS@
> >   DEPDIR =3D @DEPDIR@
> > @@ -59,7 +58,7 @@ index 80aed657643..106ec256a79 100644
> >   DSYMUTIL =3D @DSYMUTIL@
> >   DUMPBIN =3D @DUMPBIN@
> >   ECHO_C =3D @ECHO_C@
> > -@@ -381,6 +382,7 @@ LN_S =3D @LN_S@
> > +@@ -368,6 +369,7 @@ LN_S =3D @LN_S@
> >   LTLIBOBJS =3D @LTLIBOBJS@
> >   MAINT =3D @MAINT@
> >   MAKEINFO =3D @MAKEINFO@
> > @@ -67,7 +66,7 @@ index 80aed657643..106ec256a79 100644
> >   MKDIR_P =3D @MKDIR_P@
> >   MKINSTALLDIRS =3D @MKINSTALLDIRS@
> >   MSGFMT =3D @MSGFMT@
> > -@@ -427,6 +429,7 @@ abs_builddir =3D @abs_builddir@
> > +@@ -414,6 +416,7 @@ abs_builddir =3D @abs_builddir@
> >   abs_srcdir =3D @abs_srcdir@
> >   abs_top_builddir =3D @abs_top_builddir@
> >   abs_top_srcdir =3D @abs_top_srcdir@
> > @@ -76,7 +75,7 @@ index 80aed657643..106ec256a79 100644
> >   ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
> >   all_backends =3D @all_backends@
> >  diff --git a/bfd/configure b/bfd/configure
> > -index 60ea6becab2..84dcdf167ba 100755
> > +index abc24a93028..f4c8ea4e54b 100755
> >  --- a/bfd/configure
> >  +++ b/bfd/configure
> >  @@ -706,6 +706,9 @@ OTOOL
> > @@ -1400,7 +1399,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -13482,7 +14132,7 @@ SHARED_LDFLAGS=3D
> > +@@ -13707,7 +14357,7 @@ SHARED_LDFLAGS=3D
> >   if test "$enable_shared" =3D "yes"; then
> >     x=3D`sed -n -e 's/^[        ]*PICFLAG[      ]*=3D[    ]*//p' < ../l=
ibiberty/Makefile | sed -n '$p'`
> >     if test -n "$x"; then
> > @@ -1409,7 +1408,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >     fi
> >   fi
> >
> > -@@ -16129,13 +16779,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> > +@@ -16326,13 +16976,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -1430,7 +1429,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay=
_single_quote_subst"`'
> > -@@ -16150,14 +16807,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -16347,14 +17004,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_=
to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_globa=
l_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_c=
v_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quo=
te_subst"`'
> > @@ -1449,7 +1448,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -16190,12 +16850,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> > +@@ -16387,12 +17047,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_sin=
gle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_=
subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_=
quote_subst"`'
> > @@ -1463,7 +1462,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quot=
e_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | =
$SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > -@@ -16250,8 +16910,13 @@ reload_flag \
> > +@@ -16447,8 +17107,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -1477,7 +1476,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -16261,12 +16926,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -16458,12 +17123,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -1493,7 +1492,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -16282,7 +16949,6 @@ no_undefined_flag \
> > +@@ -16479,7 +17146,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -1501,7 +1500,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -16318,6 +16984,7 @@ module_cmds \
> > +@@ -16515,6 +17181,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -1509,7 +1508,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -17086,7 +17753,8 @@ $as_echo X"$file" |
> > +@@ -17283,7 +17950,8 @@ $as_echo X"$file" |
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 200=
5,
> > @@ -1519,7 +1518,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -17189,19 +17857,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -17386,19 +18054,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -1563,7 +1562,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -17231,6 +17922,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> > +@@ -17428,6 +18119,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefix=
 is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sym=
bol_to_c_name_address_lib_prefix
> >
> > @@ -1576,7 +1575,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -17240,6 +17937,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -17437,6 +18134,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -1586,7 +1585,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -17354,12 +18054,12 @@ with_gcc=3D$GCC
> > +@@ -17551,12 +18251,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -1602,7 +1601,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -17446,9 +18146,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -17643,9 +18343,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency libr=
aries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -1612,7 +1611,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -17464,6 +18161,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -17661,6 +18358,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with te=
mplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -1622,7 +1621,7 @@ index 60ea6becab2..84dcdf167ba 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -17496,210 +18196,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -17693,210 +18393,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash proble=
m
> >     # is reportedly fixed, but why not run on old versions too?
> > @@ -1997,10 +1996,10 @@ index 60ea6becab2..84dcdf167ba 100755
> >     chmod +x "$ofile"
> >
> >  diff --git a/bfd/configure.ac b/bfd/configure.ac
> > -index 015fd011893..58f73ec709c 100644
> > +index f044616f4d9..c2b2ab1ec68 100644
> >  --- a/bfd/configure.ac
> >  +++ b/bfd/configure.ac
> > -@@ -272,7 +272,7 @@ changequote(,)dnl
> > +@@ -274,7 +274,7 @@ changequote(,)dnl
> >     x=3D`sed -n -e 's/^[        ]*PICFLAG[      ]*=3D[    ]*//p' < ../l=
ibiberty/Makefile | sed -n '$p'`
> >   changequote([,])dnl
> >     if test -n "$x"; then
> > @@ -2010,7 +2009,7 @@ index 015fd011893..58f73ec709c 100644
> >   fi
> >
> >  diff --git a/binutils/Makefile.in b/binutils/Makefile.in
> > -index 27315addc0f..5ddd5a42a7d 100644
> > +index 2de46be1b30..70a04f1c538 100644
> >  --- a/binutils/Makefile.in
> >  +++ b/binutils/Makefile.in
> >  @@ -493,6 +493,7 @@ DEBUGINFOD_LIBS =3D @DEBUGINFOD_LIBS@
> > @@ -2038,7 +2037,7 @@ index 27315addc0f..5ddd5a42a7d 100644
> >   ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
> >   am__include =3D @am__include@
> >  diff --git a/binutils/configure b/binutils/configure
> > -index c7bd42049c3..06285371350 100755
> > +index 4cd196ab74b..dca6f77919d 100755
> >  --- a/binutils/configure
> >  +++ b/binutils/configure
> >  @@ -700,8 +700,11 @@ OTOOL
> > @@ -3361,7 +3360,7 @@ index c7bd42049c3..06285371350 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -15549,13 +16199,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> > +@@ -15555,13 +16205,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -3382,7 +3381,7 @@ index c7bd42049c3..06285371350 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay=
_single_quote_subst"`'
> > -@@ -15570,14 +16227,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -15576,14 +16233,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_=
to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_globa=
l_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_c=
v_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quo=
te_subst"`'
> > @@ -3401,7 +3400,7 @@ index c7bd42049c3..06285371350 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -15610,12 +16270,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> > +@@ -15616,12 +16276,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_sin=
gle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_=
subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_=
quote_subst"`'
> > @@ -3415,7 +3414,7 @@ index c7bd42049c3..06285371350 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quot=
e_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | =
$SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > -@@ -15670,8 +16330,13 @@ reload_flag \
> > +@@ -15676,8 +16336,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -3429,7 +3428,7 @@ index c7bd42049c3..06285371350 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -15681,12 +16346,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -15687,12 +16352,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -3445,7 +3444,7 @@ index c7bd42049c3..06285371350 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -15702,7 +16369,6 @@ no_undefined_flag \
> > +@@ -15708,7 +16375,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -3453,7 +3452,7 @@ index c7bd42049c3..06285371350 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -15738,6 +16404,7 @@ module_cmds \
> > +@@ -15744,6 +16410,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -3461,7 +3460,7 @@ index c7bd42049c3..06285371350 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -16503,7 +17170,8 @@ $as_echo X"$file" |
> > +@@ -16509,7 +17176,8 @@ $as_echo X"$file" |
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 200=
5,
> > @@ -3471,7 +3470,7 @@ index c7bd42049c3..06285371350 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -16606,19 +17274,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -16612,19 +17280,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -3515,7 +3514,7 @@ index c7bd42049c3..06285371350 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -16648,6 +17339,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> > +@@ -16654,6 +17345,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefix=
 is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sym=
bol_to_c_name_address_lib_prefix
> >
> > @@ -3528,7 +3527,7 @@ index c7bd42049c3..06285371350 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -16657,6 +17354,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -16663,6 +17360,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -3538,7 +3537,7 @@ index c7bd42049c3..06285371350 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -16771,12 +17471,12 @@ with_gcc=3D$GCC
> > +@@ -16777,12 +17477,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -3554,7 +3553,7 @@ index c7bd42049c3..06285371350 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -16863,9 +17563,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -16869,9 +17569,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency libr=
aries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -3564,7 +3563,7 @@ index c7bd42049c3..06285371350 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -16881,6 +17578,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -16887,6 +17584,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with te=
mplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -3574,7 +3573,7 @@ index c7bd42049c3..06285371350 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -16913,210 +17613,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -16919,210 +17619,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash proble=
m
> >     # is reportedly fixed, but why not run on old versions too?
> > @@ -3949,7 +3948,7 @@ index c7bd42049c3..06285371350 100755
> >     chmod +x "$ofile"
> >
> >  diff --git a/gas/Makefile.in b/gas/Makefile.in
> > -index 8319181b472..3425e414c1c 100644
> > +index 427f42dfa3a..ec6615d34e3 100644
> >  --- a/gas/Makefile.in
> >  +++ b/gas/Makefile.in
> >  @@ -377,6 +377,7 @@ CYGPATH_W =3D @CYGPATH_W@
> > @@ -3977,7 +3976,7 @@ index 8319181b472..3425e414c1c 100644
> >   ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
> >   am__include =3D @am__include@
> >  diff --git a/gas/configure b/gas/configure
> > -index 3c0c3e27d3b..11baafb9db6 100755
> > +index db1b80fc907..4bdd9705d8d 100755
> >  --- a/gas/configure
> >  +++ b/gas/configure
> >  @@ -686,8 +686,11 @@ OTOOL
> > @@ -5300,7 +5299,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -15133,13 +15783,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> > +@@ -15132,13 +15782,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -5321,7 +5320,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay=
_single_quote_subst"`'
> > -@@ -15154,14 +15811,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -15153,14 +15810,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_=
to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_globa=
l_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_c=
v_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quo=
te_subst"`'
> > @@ -5340,7 +5339,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -15194,12 +15854,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> > +@@ -15193,12 +15853,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_sin=
gle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_=
subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_=
quote_subst"`'
> > @@ -5354,7 +5353,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quot=
e_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | =
$SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > -@@ -15254,8 +15914,13 @@ reload_flag \
> > +@@ -15253,8 +15913,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -5368,7 +5367,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -15265,12 +15930,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -15264,12 +15929,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -5384,7 +5383,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -15286,7 +15953,6 @@ no_undefined_flag \
> > +@@ -15285,7 +15952,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -5392,7 +5391,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -15322,6 +15988,7 @@ module_cmds \
> > +@@ -15321,6 +15987,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -5400,7 +5399,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -16094,7 +16761,8 @@ $as_echo X"$file" |
> > +@@ -16093,7 +16760,8 @@ $as_echo X"$file" |
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 200=
5,
> > @@ -5410,7 +5409,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -16197,19 +16865,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -16196,19 +16864,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -5454,7 +5453,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -16239,6 +16930,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> > +@@ -16238,6 +16929,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefix=
 is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sym=
bol_to_c_name_address_lib_prefix
> >
> > @@ -5467,7 +5466,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -16248,6 +16945,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -16247,6 +16944,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -5477,7 +5476,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -16362,12 +17062,12 @@ with_gcc=3D$GCC
> > +@@ -16361,12 +17061,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -5493,7 +5492,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -16454,9 +17154,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -16453,9 +17153,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency libr=
aries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -5503,7 +5502,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -16472,6 +17169,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -16471,6 +17168,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with te=
mplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -5513,7 +5512,7 @@ index 3c0c3e27d3b..11baafb9db6 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -16504,210 +17204,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -16503,210 +17203,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash proble=
m
> >     # is reportedly fixed, but why not run on old versions too?
> > @@ -5916,7 +5915,7 @@ index c9914e46d7d..1857eb8b5a8 100644
> >   ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
> >   am__include =3D @am__include@
> >  diff --git a/gprof/configure b/gprof/configure
> > -index c5a081c88aa..a1b06379df4 100755
> > +index 98ba6d7f5b3..113505b963c 100755
> >  --- a/gprof/configure
> >  +++ b/gprof/configure
> >  @@ -663,8 +663,11 @@ OTOOL
> > @@ -7830,7 +7829,7 @@ index c5a081c88aa..a1b06379df4 100755
> >     chmod +x "$ofile"
> >
> >  diff --git a/gprofng/Makefile.in b/gprofng/Makefile.in
> > -index a2854950e34..4d307543d81 100644
> > +index 06b563cb8ef..b6ae509fd6c 100644
> >  --- a/gprofng/Makefile.in
> >  +++ b/gprofng/Makefile.in
> >  @@ -253,6 +253,7 @@ CXXFLAGS =3D @CXXFLAGS@
> > @@ -7850,10 +7849,10 @@ index a2854950e34..4d307543d81 100644
> >   NM =3D @NM@
> >   NMEDIT =3D @NMEDIT@
> >  diff --git a/gprofng/configure b/gprofng/configure
> > -index 3ad87139280..e4593cbb838 100755
> > +index 69eb806a17d..9e97e334544 100755
> >  --- a/gprofng/configure
> >  +++ b/gprofng/configure
> > -@@ -674,6 +674,8 @@ OTOOL
> > +@@ -672,6 +672,8 @@ OTOOL
> >   LIPO
> >   NMEDIT
> >   DSYMUTIL
> > @@ -7862,7 +7861,7 @@ index 3ad87139280..e4593cbb838 100755
> >   OBJDUMP
> >   LN_S
> >   NM
> > -@@ -804,6 +806,7 @@ enable_static
> > +@@ -802,6 +804,7 @@ enable_static
> >   with_pic
> >   enable_fast_install
> >   with_gnu_ld
> > @@ -7870,7 +7869,7 @@ index 3ad87139280..e4593cbb838 100755
> >   enable_libtool_lock
> >   enable_werror_always
> >   enable_gprofng_tools
> > -@@ -1467,6 +1470,8 @@ Optional Packages:
> > +@@ -1465,6 +1468,8 @@ Optional Packages:
> >     --with-pic              try to use only PIC/non-PIC objects [defaul=
t=3Duse
> >                             both]
> >     --with-gnu-ld           assume the C compiler uses GNU ld [default=
=3Dno]
> > @@ -7879,7 +7878,7 @@ index 3ad87139280..e4593cbb838 100755
> >     --with-jdk=3DPATH         specify prefix directory for installed JD=
K.
> >     --with-system-zlib      use installed libz
> >
> > -@@ -6158,8 +6163,8 @@ esac
> > +@@ -6156,8 +6161,8 @@ esac
> >
> >
> >
> > @@ -7890,7 +7889,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >
> >
> > -@@ -6199,7 +6204,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > +@@ -6197,7 +6202,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print string=
s" >&5
> >   $as_echo_n "checking how to print strings... " >&6; }
> >   # Test print first, because it will be a builtin if present.
> > @@ -7899,7 +7898,7 @@ index 3ad87139280..e4593cbb838 100755
> >      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> >     ECHO=3D'print -r --'
> >   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -@@ -6892,8 +6897,8 @@ $as_echo_n "checking whether the shell understan=
ds some XSI constructs... " >&6;
> > +@@ -6890,8 +6895,8 @@ $as_echo_n "checking whether the shell understan=
ds some XSI constructs... " >&6;
> >   # Try some XSI features
> >   xsi_shell=3Dno
> >   ( _lt_dummy=3D"a/b/c"
> > @@ -7910,7 +7909,7 @@ index 3ad87139280..e4593cbb838 100755
> >       && eval 'test $(( 1 + 1 )) -eq 2 \
> >       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> >     && xsi_shell=3Dyes
> > -@@ -6942,6 +6947,80 @@ esac
> > +@@ -6940,6 +6945,80 @@ esac
> >
> >
> >
> > @@ -7991,7 +7990,7 @@ index 3ad87139280..e4593cbb838 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to r=
eload object files" >&5
> >   $as_echo_n "checking for $LD option to reload object files... " >&6; =
}
> >   if ${lt_cv_ld_reload_flag+:} false; then :
> > -@@ -6958,6 +7037,11 @@ case $reload_flag in
> > +@@ -6956,6 +7035,11 @@ case $reload_flag in
> >   esac
> >   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> >   case $host_os in
> > @@ -8003,7 +8002,7 @@ index 3ad87139280..e4593cbb838 100755
> >     darwin*)
> >       if test "$GCC" =3D yes; then
> >         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$rel=
oad_objs'
> > -@@ -7126,7 +7210,8 @@ mingw* | pw32*)
> > +@@ -7124,7 +7208,8 @@ mingw* | pw32*)
> >       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86=
 DLL'
> >       lt_cv_file_magic_cmd=3D'func_win32_libid'
> >     else
> > @@ -8013,7 +8012,7 @@ index 3ad87139280..e4593cbb838 100755
> >       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> >     fi
> >     ;;
> > -@@ -7280,6 +7365,21 @@ esac
> > +@@ -7278,6 +7363,21 @@ esac
> >   fi
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check=
_method" >&5
> >   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> > @@ -8035,7 +8034,7 @@ index 3ad87139280..e4593cbb838 100755
> >   file_magic_cmd=3D$lt_cv_file_magic_cmd
> >   deplibs_check_method=3D$lt_cv_deplibs_check_method
> >   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> > -@@ -7295,6 +7395,157 @@ test -z "$deplibs_check_method" && deplibs_che=
ck_method=3Dunknown
> > +@@ -7293,6 +7393,157 @@ test -z "$deplibs_check_method" && deplibs_che=
ck_method=3Dunknown
> >
> >
> >
> > @@ -8193,7 +8192,7 @@ index 3ad87139280..e4593cbb838 100755
> >   plugin_option=3D
> >   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.=
dll"
> >   for plugin in $plugin_names; do
> > -@@ -7309,8 +7560,10 @@ for plugin in $plugin_names; do
> > +@@ -7307,8 +7558,10 @@ for plugin in $plugin_names; do
> >   done
> >
> >   if test -n "$ac_tool_prefix"; then
> > @@ -8206,7 +8205,7 @@ index 3ad87139280..e4593cbb838 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_AR+:} false; then :
> > -@@ -7326,7 +7579,7 @@ do
> > +@@ -7324,7 +7577,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -8215,7 +8214,7 @@ index 3ad87139280..e4593cbb838 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -7346,11 +7599,15 @@ $as_echo "no" >&6; }
> > +@@ -7344,11 +7597,15 @@ $as_echo "no" >&6; }
> >   fi
> >
> >
> > @@ -8234,7 +8233,7 @@ index 3ad87139280..e4593cbb838 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> > -@@ -7366,7 +7623,7 @@ do
> > +@@ -7364,7 +7621,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -8243,7 +8242,7 @@ index 3ad87139280..e4593cbb838 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -7385,6 +7642,10 @@ else
> > +@@ -7383,6 +7640,10 @@ else
> >   $as_echo "no" >&6; }
> >   fi
> >
> > @@ -8254,7 +8253,7 @@ index 3ad87139280..e4593cbb838 100755
> >     if test "x$ac_ct_AR" =3D x; then
> >       AR=3D"false"
> >     else
> > -@@ -7396,29 +7657,81 @@ ac_tool_warned=3Dyes ;;
> > +@@ -7394,29 +7655,81 @@ ac_tool_warned=3Dyes ;;
> >   esac
> >       AR=3D$ac_ct_AR
> >     fi
> > @@ -8351,7 +8350,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >
> >
> > -@@ -7765,8 +8078,8 @@ esac
> > +@@ -7763,8 +8076,8 @@ esac
> >   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern=
 int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> >
> >   # Transform an extracted symbol line into symbol name and symbol addr=
ess
> > @@ -8362,7 +8361,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >   # Handle CRLF in mingw tool chain
> >   opt_cr=3D
> > -@@ -7802,6 +8115,7 @@ for ac_symprfx in "" "_"; do
> > +@@ -7800,6 +8113,7 @@ for ac_symprfx in "" "_"; do
> >     else
> >       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[  ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> >     fi
> > @@ -8370,7 +8369,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >     # Check to see that the pipe works correctly.
> >     pipe_works=3Dno
> > -@@ -7843,6 +8157,18 @@ _LT_EOF
> > +@@ -7841,6 +8155,18 @@ _LT_EOF
> >         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> >       if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> >         cat <<_LT_EOF > conftest.$ac_ext
> > @@ -8389,7 +8388,7 @@ index 3ad87139280..e4593cbb838 100755
> >   #ifdef __cplusplus
> >   extern "C" {
> >   #endif
> > -@@ -7854,7 +8180,7 @@ _LT_EOF
> > +@@ -7852,7 +8178,7 @@ _LT_EOF
> >         cat <<_LT_EOF >> conftest.$ac_ext
> >
> >   /* The mapping between symbol names and symbols.  */
> > @@ -8398,7 +8397,7 @@ index 3ad87139280..e4593cbb838 100755
> >     const char *name;
> >     void       *address;
> >   }
> > -@@ -7880,8 +8206,8 @@ static const void *lt_preloaded_setup() {
> > +@@ -7878,8 +8204,8 @@ static const void *lt_preloaded_setup() {
> >   _LT_EOF
> >         # Now try linking the two files.
> >         mv conftest.$ac_objext conftstm.$ac_objext
> > @@ -8409,7 +8408,7 @@ index 3ad87139280..e4593cbb838 100755
> >         LIBS=3D"conftstm.$ac_objext"
> >         CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> >         if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> > -@@ -7891,8 +8217,8 @@ _LT_EOF
> > +@@ -7889,8 +8215,8 @@ _LT_EOF
> >     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> >           pipe_works=3Dyes
> >         fi
> > @@ -8420,7 +8419,7 @@ index 3ad87139280..e4593cbb838 100755
> >       else
> >         echo "cannot find nm_test_func in $nlist" >&5
> >       fi
> > -@@ -7929,6 +8255,13 @@ else
> > +@@ -7927,6 +8253,13 @@ else
> >   $as_echo "ok" >&6; }
> >   fi
> >
> > @@ -8434,7 +8433,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >
> >
> > -@@ -7948,6 +8281,48 @@ fi
> > +@@ -7946,6 +8279,48 @@ fi
> >
> >
> >
> > @@ -8483,7 +8482,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >
> >   # Check whether --enable-libtool-lock was given.
> > -@@ -8156,6 +8531,123 @@ esac
> > +@@ -8154,6 +8529,123 @@ esac
> >
> >   need_locks=3D"$enable_libtool_lock"
> >
> > @@ -8607,7 +8606,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >     case $host_os in
> >       rhapsody* | darwin*)
> > -@@ -8719,6 +9211,8 @@ _LT_EOF
> > +@@ -8717,6 +9209,8 @@ _LT_EOF
> >         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> >         echo "$AR cru libconftest.a conftest.o" >&5
> >         $AR cru libconftest.a conftest.o 2>&5
> > @@ -8616,7 +8615,7 @@ index 3ad87139280..e4593cbb838 100755
> >         cat > conftest.c << _LT_EOF
> >   int main() { return 0;}
> >   _LT_EOF
> > -@@ -8787,6 +9281,16 @@ done
> > +@@ -8785,6 +9279,16 @@ done
> >
> >
> >
> > @@ -8633,7 +8632,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >
> >   # Set options
> > -@@ -9272,8 +9776,6 @@ fi
> > +@@ -9270,8 +9774,6 @@ fi
> >   lt_prog_compiler_pic=3D
> >   lt_prog_compiler_static=3D
> >
> > @@ -8642,7 +8641,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >     if test "$GCC" =3D yes; then
> >       lt_prog_compiler_wl=3D'-Wl,'
> > -@@ -9439,6 +9941,12 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> > +@@ -9437,6 +9939,12 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> >       lt_prog_compiler_pic=3D'--shared'
> >       lt_prog_compiler_static=3D'--static'
> >       ;;
> > @@ -8655,7 +8654,7 @@ index 3ad87139280..e4593cbb838 100755
> >         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> >           # Portland Group compilers (*not* the Pentium gcc compiler,
> >       # which looks to be a dead project)
> > -@@ -9501,7 +10009,7 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> > +@@ -9499,7 +10007,7 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> >         lt_prog_compiler_pic=3D'-KPIC'
> >         lt_prog_compiler_static=3D'-Bstatic'
> >         case $cc_basename in
> > @@ -8664,7 +8663,7 @@ index 3ad87139280..e4593cbb838 100755
> >       lt_prog_compiler_wl=3D'-Qoption ld ';;
> >         *)
> >       lt_prog_compiler_wl=3D'-Wl,';;
> > -@@ -9558,13 +10066,17 @@ case $host_os in
> > +@@ -9556,13 +10064,17 @@ case $host_os in
> >       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> >       ;;
> >   esac
> > @@ -8688,7 +8687,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >   #
> >   # Check to make sure the PIC flag actually works.
> > -@@ -9625,6 +10137,11 @@ fi
> > +@@ -9623,6 +10135,11 @@ fi
> >
> >
> >
> > @@ -8700,7 +8699,7 @@ index 3ad87139280..e4593cbb838 100755
> >   #
> >   # Check to make sure the static flag actually works.
> >   #
> > -@@ -9975,7 +10492,8 @@ _LT_EOF
> > +@@ -9973,7 +10490,8 @@ _LT_EOF
> >         allow_undefined_flag=3Dunsupported
> >         always_export_symbols=3Dno
> >         enable_shared_with_static_runtimes=3Dyes
> > @@ -8710,7 +8709,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> >           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags=
 -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-imp=
lib -Xlinker $lib'
> > -@@ -10074,12 +10592,12 @@ _LT_EOF
> > +@@ -10072,12 +10590,12 @@ _LT_EOF
> >         whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
> >         hardcode_libdir_flag_spec=3D
> >         hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> > @@ -8725,7 +8724,7 @@ index 3ad87139280..e4593cbb838 100755
> >         fi
> >         ;;
> >       esac
> > -@@ -10093,8 +10611,8 @@ _LT_EOF
> > +@@ -10091,8 +10609,8 @@ _LT_EOF
> >       archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
> >       wlarc=3D
> >         else
> > @@ -8736,7 +8735,7 @@ index 3ad87139280..e4593cbb838 100755
> >         fi
> >         ;;
> >
> > -@@ -10112,8 +10630,8 @@ _LT_EOF
> > +@@ -10110,8 +10628,8 @@ _LT_EOF
> >
> >   _LT_EOF
> >         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /de=
v/null; then
> > @@ -8747,7 +8746,7 @@ index 3ad87139280..e4593cbb838 100755
> >         else
> >       ld_shlibs=3Dno
> >         fi
> > -@@ -10159,8 +10677,8 @@ _LT_EOF
> > +@@ -10157,8 +10675,8 @@ _LT_EOF
> >
> >       *)
> >         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> > @@ -8758,7 +8757,7 @@ index 3ad87139280..e4593cbb838 100755
> >         else
> >       ld_shlibs=3Dno
> >         fi
> > -@@ -10290,7 +10808,13 @@ _LT_EOF
> > +@@ -10288,7 +10806,13 @@ _LT_EOF
> >       allow_undefined_flag=3D'-berok'
> >           # Determine the default libpath from the value encoded in an
> >           # empty executable.
> > @@ -8773,7 +8772,7 @@ index 3ad87139280..e4593cbb838 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -10303,22 +10827,29 @@ main ()
> > +@@ -10301,22 +10825,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -8816,7 +8815,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_li=
bpath"
> >           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs=
 $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undef=
ined_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; el=
se :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> > -@@ -10330,7 +10861,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -10328,7 +10859,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >       else
> >        # Determine the default libpath from the value encoded in an
> >        # empty executable.
> > @@ -8831,7 +8830,7 @@ index 3ad87139280..e4593cbb838 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -10343,22 +10880,29 @@ main ()
> > +@@ -10341,22 +10878,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -8874,7 +8873,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >        hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
> >         # Warning - without using the other run time loading flags,
> > -@@ -10403,20 +10947,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -10401,20 +10945,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >         # Microsoft Visual C++.
> >         # hardcode_libdir_flag_spec is actually meaningless, as there i=
s
> >         # no search path for DLLs.
> > @@ -8952,7 +8951,7 @@ index 3ad87139280..e4593cbb838 100755
> >         ;;
> >
> >       darwin* | rhapsody*)
> > -@@ -10477,7 +11064,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -10475,7 +11062,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> >       freebsd* | dragonfly*)
> > @@ -8961,7 +8960,7 @@ index 3ad87139280..e4593cbb838 100755
> >         hardcode_libdir_flag_spec=3D'-R$libdir'
> >         hardcode_direct=3Dyes
> >         hardcode_shlibpath_var=3Dno
> > -@@ -10485,7 +11072,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -10483,7 +11070,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >       hpux9*)
> >         if test "$GCC" =3D yes; then
> > @@ -8970,7 +8969,7 @@ index 3ad87139280..e4593cbb838 100755
> >         else
> >       archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> >         fi
> > -@@ -10501,7 +11088,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -10499,7 +11086,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >       hpux10*)
> >         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> > @@ -8979,7 +8978,7 @@ index 3ad87139280..e4593cbb838 100755
> >         else
> >       archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
> >         fi
> > -@@ -10525,10 +11112,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -10523,10 +11110,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >         archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
> >         ;;
> >       ia64*)
> > @@ -8992,7 +8991,7 @@ index 3ad87139280..e4593cbb838 100755
> >         ;;
> >       esac
> >         else
> > -@@ -10607,23 +11194,36 @@ fi
> > +@@ -10605,23 +11192,36 @@ fi
> >
> >       irix5* | irix6* | nonstopux*)
> >         if test "$GCC" =3D yes; then
> > @@ -9037,7 +9036,7 @@ index 3ad87139280..e4593cbb838 100755
> >         else
> >       archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
> >       archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> > -@@ -10708,7 +11308,7 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -10706,7 +11306,7 @@ rm -f core conftest.err conftest.$ac_objext \
> >       osf4* | osf5*)  # as osf3* with the addition of -msym flag
> >         if test "$GCC" =3D yes; then
> >       allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> > @@ -9046,7 +9045,7 @@ index 3ad87139280..e4593cbb838 100755
> >       hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
> >         else
> >       allow_undefined_flag=3D' -expect_unresolved \*'
> > -@@ -10727,9 +11327,9 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -10725,9 +11325,9 @@ rm -f core conftest.err conftest.$ac_objext \
> >         no_undefined_flag=3D' -z defs'
> >         if test "$GCC" =3D yes; then
> >       wlarc=3D'${wl}'
> > @@ -9058,7 +9057,7 @@ index 3ad87139280..e4593cbb838 100755
> >         else
> >       case `$CC -V 2>&1` in
> >       *"Compilers 5.0"*)
> > -@@ -11305,8 +11905,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -11303,8 +11903,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> >     need_version=3Dno
> >     need_lib_prefix=3Dno
> >
> > @@ -9070,7 +9069,7 @@ index 3ad87139280..e4593cbb838 100755
> >       library_names_spec=3D'$libname.dll.a'
> >       # DLL is installed to $(libdir)/../bin by postinstall_cmds
> >       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -11339,13 +11940,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -11337,13 +11938,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> >         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``e=
cho ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> >         ;;
> >       esac
> > @@ -9143,16 +9142,16 @@ index 3ad87139280..e4593cbb838 100755
> >     # FIXME: first we should search . and the directory the executable =
is in
> >     shlibpath_var=3DPATH
> >     ;;
> > -@@ -12223,7 +12882,7 @@ else
> > +@@ -12221,7 +12880,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 12226 "configure"
> > +-#line 12224 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -12267,10 +12926,10 @@ else
> > +@@ -12265,10 +12924,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -9165,16 +9164,16 @@ index 3ad87139280..e4593cbb838 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -12329,7 +12988,7 @@ else
> > +@@ -12327,7 +12986,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 12332 "configure"
> > +-#line 12330 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -12373,10 +13032,10 @@ else
> > +@@ -12371,10 +13030,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -9187,7 +9186,7 @@ index 3ad87139280..e4593cbb838 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -12768,6 +13427,7 @@ $RM -r conftest*
> > +@@ -12766,6 +13425,7 @@ $RM -r conftest*
> >
> >     # Allow CC to be a program name with arguments.
> >     lt_save_CC=3D$CC
> > @@ -9195,7 +9194,7 @@ index 3ad87139280..e4593cbb838 100755
> >     lt_save_LD=3D$LD
> >     lt_save_GCC=3D$GCC
> >     GCC=3D$GXX
> > -@@ -12785,6 +13445,7 @@ $RM -r conftest*
> > +@@ -12783,6 +13443,7 @@ $RM -r conftest*
> >     fi
> >     test -z "${LDCXX+set}" || LD=3D$LDCXX
> >     CC=3D${CXX-"c++"}
> > @@ -9203,7 +9202,7 @@ index 3ad87139280..e4593cbb838 100755
> >     compiler=3D$CC
> >     compiler_CXX=3D$CC
> >     for cc_temp in $compiler""; do
> > -@@ -13067,7 +13728,13 @@ $as_echo_n "checking whether the $compiler li=
nker ($LD) supports shared librarie
> > +@@ -13065,7 +13726,13 @@ $as_echo_n "checking whether the $compiler li=
nker ($LD) supports shared librarie
> >             allow_undefined_flag_CXX=3D'-berok'
> >             # Determine the default libpath from the value encoded in a=
n empty
> >             # executable.
> > @@ -9218,7 +9217,7 @@ index 3ad87139280..e4593cbb838 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -13080,22 +13747,29 @@ main ()
> > +@@ -13078,22 +13745,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_cxx_try_link "$LINENO"; then :
> >
> > @@ -9261,7 +9260,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >             hardcode_libdir_flag_spec_CXX=3D'${wl}-blibpath:$libdir:'"$=
aix_libpath"
> >
> > -@@ -13108,7 +13782,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -13106,7 +13780,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >             else
> >           # Determine the default libpath from the value encoded in an
> >           # empty executable.
> > @@ -9276,7 +9275,7 @@ index 3ad87139280..e4593cbb838 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -13121,22 +13801,29 @@ main ()
> > +@@ -13119,22 +13799,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_cxx_try_link "$LINENO"; then :
> >
> > @@ -9319,7 +9318,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >           hardcode_libdir_flag_spec_CXX=3D'${wl}-blibpath:$libdir:'"$ai=
x_libpath"
> >           # Warning - without using the other run time loading flags,
> > -@@ -13179,29 +13866,75 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -13177,29 +13864,75 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >           ;;
> >
> >         cygwin* | mingw* | pw32* | cegcc*)
> > @@ -9418,7 +9417,7 @@ index 3ad87139280..e4593cbb838 100755
> >         darwin* | rhapsody*)
> >
> >
> > -@@ -13307,7 +14040,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -13305,7 +14038,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >               ;;
> >             *)
> >               if test "$GXX" =3D yes; then
> > @@ -9427,7 +9426,7 @@ index 3ad87139280..e4593cbb838 100755
> >               else
> >                 # FIXME: insert proper C++ library support
> >                 ld_shlibs_CXX=3Dno
> > -@@ -13378,10 +14111,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -13376,10 +14109,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >                   archive_cmds_CXX=3D'$CC -shared -nostdlib -fPIC ${wl}=
+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects =
$compiler_flags'
> >                   ;;
> >                 ia64*)
> > @@ -9440,7 +9439,7 @@ index 3ad87139280..e4593cbb838 100755
> >                   ;;
> >               esac
> >             fi
> > -@@ -13422,9 +14155,9 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -13420,9 +14153,9 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >             *)
> >           if test "$GXX" =3D yes; then
> >             if test "$with_gnu_ld" =3D no; then
> > @@ -9452,7 +9451,7 @@ index 3ad87139280..e4593cbb838 100755
> >             fi
> >           fi
> >           link_all_deplibs_CXX=3Dyes
> > -@@ -13494,20 +14227,20 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -13492,20 +14225,20 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >             prelink_cmds_CXX=3D'tpldir=3DTemplate.dir~
> >               rm -rf $tpldir~
> >               $CC --prelink_objects --instantiation_dir $tpldir $objs $=
libobjs $compile_deplibs~
> > @@ -9477,7 +9476,7 @@ index 3ad87139280..e4593cbb838 100755
> >             ;;
> >           *) # Version 6 and above use weak symbols
> >             archive_cmds_CXX=3D'$CC -shared $pic_flag $predep_objects $=
libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname=
 -o $lib'
> > -@@ -13702,7 +14435,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -13700,7 +14433,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >                 archive_cmds_CXX=3D'$CC -shared -nostdlib ${allow_undef=
ined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_fla=
gs ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-=
set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/s=
o_locations -o $lib'
> >                 ;;
> >               *)
> > @@ -9486,7 +9485,7 @@ index 3ad87139280..e4593cbb838 100755
> >                 ;;
> >             esac
> >
> > -@@ -13748,7 +14481,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -13746,7 +14479,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >         solaris*)
> >           case $cc_basename in
> > @@ -9495,7 +9494,7 @@ index 3ad87139280..e4593cbb838 100755
> >           # Sun C++ 4.2, 5.x and Centerline C++
> >               archive_cmds_need_lc_CXX=3Dyes
> >           no_undefined_flag_CXX=3D' -zdefs'
> > -@@ -13789,9 +14522,9 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -13787,9 +14520,9 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >           if test "$GXX" =3D yes && test "$with_gnu_ld" =3D no; then
> >             no_undefined_flag_CXX=3D' ${wl}-z ${wl}defs'
> >             if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> > @@ -9507,7 +9506,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >               # Commands to make compiler produce verbose output that l=
ists
> >               # what "hidden" libraries, object files and flags are use=
d when
> > -@@ -13926,6 +14659,13 @@ private:
> > +@@ -13924,6 +14657,13 @@ private:
> >   };
> >   _LT_EOF
> >
> > @@ -9521,7 +9520,7 @@ index 3ad87139280..e4593cbb838 100755
> >   if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\"";=
 } >&5
> >     (eval $ac_compile) 2>&5
> >     ac_status=3D$?
> > -@@ -13939,7 +14679,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LIN=
ENO}: \"$ac_compile\""; } >&5
> > +@@ -13937,7 +14677,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LIN=
ENO}: \"$ac_compile\""; } >&5
> >     pre_test_object_deps_done=3Dno
> >
> >     for p in `eval "$output_verbose_link_cmd"`; do
> > @@ -9530,7 +9529,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >       -L* | -R* | -l*)
> >          # Some compilers place space between "-{L,R}" and the path.
> > -@@ -13948,13 +14688,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$L=
INENO}: \"$ac_compile\""; } >&5
> > +@@ -13946,13 +14686,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$L=
INENO}: \"$ac_compile\""; } >&5
> >             test $p =3D "-R"; then
> >        prev=3D$p
> >        continue
> > @@ -9557,7 +9556,7 @@ index 3ad87139280..e4593cbb838 100755
> >          # Internal compiler library paths should come after those
> >          # provided the user.  The postdeps already come after the
> >          # user supplied libs so there is no need to process them.
> > -@@ -13974,8 +14723,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LI=
NENO}: \"$ac_compile\""; } >&5
> > +@@ -13972,8 +14721,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LI=
NENO}: \"$ac_compile\""; } >&5
> >          postdeps_CXX=3D"${postdeps_CXX} ${prev}${p}"
> >        fi
> >          fi
> > @@ -9568,7 +9567,7 @@ index 3ad87139280..e4593cbb838 100755
> >       *.$objext)
> >          # This assumes that the test object file only shows up
> >          # once in the compiler output.
> > -@@ -14011,6 +14762,7 @@ else
> > +@@ -14009,6 +14760,7 @@ else
> >   fi
> >
> >   $RM -f confest.$objext
> > @@ -9576,7 +9575,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >   # PORTME: override above test on systems where it is broken
> >   case $host_os in
> > -@@ -14046,7 +14798,7 @@ linux*)
> > +@@ -14044,7 +14796,7 @@ linux*)
> >
> >   solaris*)
> >     case $cc_basename in
> > @@ -9585,7 +9584,7 @@ index 3ad87139280..e4593cbb838 100755
> >       # The more standards-conforming stlport4 library is
> >       # incompatible with the Cstd library. Avoid specifying
> >       # it if it's in CXXFLAGS. Ignore libCrun as
> > -@@ -14111,8 +14863,6 @@ fi
> > +@@ -14109,8 +14861,6 @@ fi
> >   lt_prog_compiler_pic_CXX=3D
> >   lt_prog_compiler_static_CXX=3D
> >
> > @@ -9594,7 +9593,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >     # C++ specific cases for pic, static, wl, etc.
> >     if test "$GXX" =3D yes; then
> > -@@ -14217,6 +14967,11 @@ $as_echo_n "checking for $compiler option to =
produce PIC... " >&6; }
> > +@@ -14215,6 +14965,11 @@ $as_echo_n "checking for $compiler option to =
produce PIC... " >&6; }
> >         ;;
> >       esac
> >       ;;
> > @@ -9606,7 +9605,7 @@ index 3ad87139280..e4593cbb838 100755
> >         dgux*)
> >       case $cc_basename in
> >         ec++*)
> > -@@ -14369,7 +15124,7 @@ $as_echo_n "checking for $compiler option to p=
roduce PIC... " >&6; }
> > +@@ -14367,7 +15122,7 @@ $as_echo_n "checking for $compiler option to p=
roduce PIC... " >&6; }
> >       ;;
> >         solaris*)
> >       case $cc_basename in
> > @@ -9615,7 +9614,7 @@ index 3ad87139280..e4593cbb838 100755
> >           # Sun C++ 4.2, 5.x and Centerline C++
> >           lt_prog_compiler_pic_CXX=3D'-KPIC'
> >           lt_prog_compiler_static_CXX=3D'-Bstatic'
> > -@@ -14434,10 +15189,17 @@ case $host_os in
> > +@@ -14432,10 +15187,17 @@ case $host_os in
> >       lt_prog_compiler_pic_CXX=3D"$lt_prog_compiler_pic_CXX -DPIC"
> >       ;;
> >   esac
> > @@ -9636,7 +9635,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >   #
> >   # Check to make sure the PIC flag actually works.
> > -@@ -14495,6 +15257,8 @@ fi
> > +@@ -14493,6 +15255,8 @@ fi
> >
> >
> >
> > @@ -9645,7 +9644,7 @@ index 3ad87139280..e4593cbb838 100755
> >   #
> >   # Check to make sure the static flag actually works.
> >   #
> > -@@ -14672,6 +15436,7 @@ fi
> > +@@ -14670,6 +15434,7 @@ fi
> >   $as_echo_n "checking whether the $compiler linker ($LD) supports shar=
ed libraries... " >&6; }
> >
> >     export_symbols_cmds_CXX=3D'$NM $libobjs $convenience | $global_symb=
ol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> > @@ -9653,7 +9652,7 @@ index 3ad87139280..e4593cbb838 100755
> >     case $host_os in
> >     aix[4-9]*)
> >       # If we're using GNU nm, then we don't want the "-C" option.
> > -@@ -14686,15 +15451,20 @@ $as_echo_n "checking whether the $compiler l=
inker ($LD) supports shared librarie
> > +@@ -14684,15 +15449,20 @@ $as_echo_n "checking whether the $compiler l=
inker ($LD) supports shared librarie
> >       ;;
> >     pw32*)
> >       export_symbols_cmds_CXX=3D"$ltdll_cmds"
> > @@ -9679,7 +9678,7 @@ index 3ad87139280..e4593cbb838 100755
> >
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
> >   $as_echo "$ld_shlibs_CXX" >&6; }
> > -@@ -14957,8 +15727,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -14955,8 +15725,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> >     need_version=3Dno
> >     need_lib_prefix=3Dno
> >
> > @@ -9691,7 +9690,7 @@ index 3ad87139280..e4593cbb838 100755
> >       library_names_spec=3D'$libname.dll.a'
> >       # DLL is installed to $(libdir)/../bin by postinstall_cmds
> >       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -14990,13 +15761,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -14988,13 +15759,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> >         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``e=
cho ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> >         ;;
> >       esac
> > @@ -9764,7 +9763,7 @@ index 3ad87139280..e4593cbb838 100755
> >     # FIXME: first we should search . and the directory the executable =
is in
> >     shlibpath_var=3DPATH
> >     ;;
> > -@@ -15536,6 +16365,7 @@ fi
> > +@@ -15534,6 +16363,7 @@ fi
> >     fi # test -n "$compiler"
> >
> >     CC=3D$lt_save_CC
> > @@ -9772,7 +9771,7 @@ index 3ad87139280..e4593cbb838 100755
> >     LDCXX=3D$LD
> >     LD=3D$lt_save_LD
> >     GCC=3D$lt_save_GCC
> > -@@ -17751,13 +18581,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> > +@@ -17737,13 +18567,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -9793,7 +9792,7 @@ index 3ad87139280..e4593cbb838 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay=
_single_quote_subst"`'
> > -@@ -17772,14 +18609,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -17758,14 +18595,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_=
to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_globa=
l_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_c=
v_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quo=
te_subst"`'
> > @@ -9812,7 +9811,7 @@ index 3ad87139280..e4593cbb838 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -17812,12 +18652,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> > +@@ -17798,12 +18638,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_sin=
gle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_=
subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_=
quote_subst"`'
> > @@ -9826,7 +9825,7 @@ index 3ad87139280..e4593cbb838 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quot=
e_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | =
$SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > -@@ -17856,8 +18696,8 @@ old_archive_cmds_CXX=3D'`$ECHO "$old_archive_c=
mds_CXX" | $SED "$delay_single_quote
> > +@@ -17842,8 +18682,8 @@ old_archive_cmds_CXX=3D'`$ECHO "$old_archive_c=
mds_CXX" | $SED "$delay_single_quote
> >   compiler_CXX=3D'`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_su=
bst"`'
> >   GCC_CXX=3D'`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
> >   lt_prog_compiler_no_builtin_flag_CXX=3D'`$ECHO "$lt_prog_compiler_no_=
builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
> > @@ -9836,7 +9835,7 @@ index 3ad87139280..e4593cbb838 100755
> >   lt_prog_compiler_static_CXX=3D'`$ECHO "$lt_prog_compiler_static_CXX" =
| $SED "$delay_single_quote_subst"`'
> >   lt_cv_prog_compiler_c_o_CXX=3D'`$ECHO "$lt_cv_prog_compiler_c_o_CXX" =
| $SED "$delay_single_quote_subst"`'
> >   archive_cmds_need_lc_CXX=3D'`$ECHO "$archive_cmds_need_lc_CXX" | $SED=
 "$delay_single_quote_subst"`'
> > -@@ -17884,12 +18724,12 @@ hardcode_shlibpath_var_CXX=3D'`$ECHO "$hardc=
ode_shlibpath_var_CXX" | $SED "$delay_
> > +@@ -17870,12 +18710,12 @@ hardcode_shlibpath_var_CXX=3D'`$ECHO "$hardc=
ode_shlibpath_var_CXX" | $SED "$delay_
> >   hardcode_automatic_CXX=3D'`$ECHO "$hardcode_automatic_CXX" | $SED "$d=
elay_single_quote_subst"`'
> >   inherit_rpath_CXX=3D'`$ECHO "$inherit_rpath_CXX" | $SED "$delay_singl=
e_quote_subst"`'
> >   link_all_deplibs_CXX=3D'`$ECHO "$link_all_deplibs_CXX" | $SED "$delay=
_single_quote_subst"`'
> > @@ -9850,7 +9849,7 @@ index 3ad87139280..e4593cbb838 100755
> >   file_list_spec_CXX=3D'`$ECHO "$file_list_spec_CXX" | $SED "$delay_sin=
gle_quote_subst"`'
> >   hardcode_action_CXX=3D'`$ECHO "$hardcode_action_CXX" | $SED "$delay_s=
ingle_quote_subst"`'
> >   compiler_lib_search_dirs_CXX=3D'`$ECHO "$compiler_lib_search_dirs_CXX=
" | $SED "$delay_single_quote_subst"`'
> > -@@ -17927,8 +18767,13 @@ reload_flag \
> > +@@ -17913,8 +18753,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -9864,7 +9863,7 @@ index 3ad87139280..e4593cbb838 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -17938,12 +18783,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -17924,12 +18769,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -9880,7 +9879,7 @@ index 3ad87139280..e4593cbb838 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -17959,7 +18806,6 @@ no_undefined_flag \
> > +@@ -17945,7 +18792,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -9888,7 +9887,7 @@ index 3ad87139280..e4593cbb838 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -17981,8 +18827,8 @@ LD_CXX \
> > +@@ -17967,8 +18813,8 @@ LD_CXX \
> >   reload_flag_CXX \
> >   compiler_CXX \
> >   lt_prog_compiler_no_builtin_flag_CXX \
> > @@ -9898,7 +9897,7 @@ index 3ad87139280..e4593cbb838 100755
> >   lt_prog_compiler_static_CXX \
> >   lt_cv_prog_compiler_c_o_CXX \
> >   export_dynamic_flag_spec_CXX \
> > -@@ -17994,7 +18840,6 @@ no_undefined_flag_CXX \
> > +@@ -17980,7 +18826,6 @@ no_undefined_flag_CXX \
> >   hardcode_libdir_flag_spec_CXX \
> >   hardcode_libdir_flag_spec_ld_CXX \
> >   hardcode_libdir_separator_CXX \
> > @@ -9906,7 +9905,7 @@ index 3ad87139280..e4593cbb838 100755
> >   exclude_expsyms_CXX \
> >   include_expsyms_CXX \
> >   file_list_spec_CXX \
> > -@@ -18028,6 +18873,7 @@ module_cmds \
> > +@@ -18014,6 +18859,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -9914,7 +9913,7 @@ index 3ad87139280..e4593cbb838 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -18042,7 +18888,8 @@ archive_expsym_cmds_CXX \
> > +@@ -18028,7 +18874,8 @@ archive_expsym_cmds_CXX \
> >   module_cmds_CXX \
> >   module_expsym_cmds_CXX \
> >   export_symbols_cmds_CXX \
> > @@ -9924,7 +9923,7 @@ index 3ad87139280..e4593cbb838 100755
> >       case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
> >       *[\\\\\\\`\\"\\\$]*)
> >         eval "lt_\$var=3D\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED =
-e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$dela=
y_variable_subst\\"\\\`\\\\\\""
> > -@@ -18799,7 +19646,8 @@ $as_echo X"$file" |
> > +@@ -18785,7 +19632,8 @@ $as_echo X"$file" |
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 200=
5,
> > @@ -9934,7 +9933,7 @@ index 3ad87139280..e4593cbb838 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -18902,19 +19750,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -18888,19 +19736,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -9978,7 +9977,7 @@ index 3ad87139280..e4593cbb838 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -18944,6 +19815,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> > +@@ -18930,6 +19801,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefix=
 is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sym=
bol_to_c_name_address_lib_prefix
> >
> > @@ -9991,7 +9990,7 @@ index 3ad87139280..e4593cbb838 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -18953,6 +19830,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -18939,6 +19816,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -10001,7 +10000,7 @@ index 3ad87139280..e4593cbb838 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -19067,12 +19947,12 @@ with_gcc=3D$GCC
> > +@@ -19053,12 +19933,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -10017,7 +10016,7 @@ index 3ad87139280..e4593cbb838 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -19159,9 +20039,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -19145,9 +20025,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency libr=
aries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -10027,7 +10026,7 @@ index 3ad87139280..e4593cbb838 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -19177,6 +20054,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -19163,6 +20040,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with te=
mplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -10037,7 +10036,7 @@ index 3ad87139280..e4593cbb838 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -19223,210 +20103,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -19209,210 +20089,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash proble=
m
> >     # is reportedly fixed, but why not run on old versions too?
> > @@ -10411,7 +10410,7 @@ index 3ad87139280..e4593cbb838 100755
> >       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
> >     chmod +x "$ofile"
> >
> > -@@ -19454,12 +20293,12 @@ with_gcc=3D$GCC_CXX
> > +@@ -19440,12 +20279,12 @@ with_gcc=3D$GCC_CXX
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag_CXX
> >
> > @@ -10427,7 +10426,7 @@ index 3ad87139280..e4593cbb838 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static_CXX
> >
> > -@@ -19546,9 +20385,6 @@ inherit_rpath=3D$inherit_rpath_CXX
> > +@@ -19532,9 +20371,6 @@ inherit_rpath=3D$inherit_rpath_CXX
> >   # Whether libtool must link a program against all its dependency libr=
aries.
> >   link_all_deplibs=3D$link_all_deplibs_CXX
> >
> > @@ -10437,7 +10436,7 @@ index 3ad87139280..e4593cbb838 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols_CXX
> >
> > -@@ -19564,6 +20400,9 @@ include_expsyms=3D$lt_include_expsyms_CXX
> > +@@ -19550,6 +20386,9 @@ include_expsyms=3D$lt_include_expsyms_CXX
> >   # Commands necessary for linking programs (against libraries) with te=
mplates.
> >   prelink_cmds=3D$lt_prelink_cmds_CXX
> >
> > @@ -10448,10 +10447,10 @@ index 3ad87139280..e4593cbb838 100755
> >   file_list_spec=3D$lt_file_list_spec_CXX
> >
> >  diff --git a/gprofng/doc/Makefile.in b/gprofng/doc/Makefile.in
> > -index 3cd2068cbf6..c5d431236aa 100644
> > +index 78f8ae11fc7..48058763422 100644
> >  --- a/gprofng/doc/Makefile.in
> >  +++ b/gprofng/doc/Makefile.in
> > -@@ -240,6 +240,7 @@ CXXFLAGS =3D @CXXFLAGS@
> > +@@ -238,6 +238,7 @@ CXXFLAGS =3D @CXXFLAGS@
> >   CYGPATH_W =3D @CYGPATH_W@
> >   DEFS =3D @DEFS@
> >   DEPDIR =3D @DEPDIR@
> > @@ -10459,7 +10458,7 @@ index 3cd2068cbf6..c5d431236aa 100644
> >   DSYMUTIL =3D @DSYMUTIL@
> >   DUMPBIN =3D @DUMPBIN@
> >   ECHO_C =3D @ECHO_C@
> > -@@ -275,6 +276,7 @@ LN_S =3D @LN_S@
> > +@@ -273,6 +274,7 @@ LN_S =3D @LN_S@
> >   LTLIBOBJS =3D @LTLIBOBJS@
> >   MAINT =3D @MAINT@
> >   MAKEINFO =3D @MAKEINFO@
> > @@ -10468,10 +10467,10 @@ index 3cd2068cbf6..c5d431236aa 100644
> >   NM =3D @NM@
> >   NMEDIT =3D @NMEDIT@
> >  diff --git a/gprofng/gp-display-html/Makefile.in b/gprofng/gp-display-=
html/Makefile.in
> > -index 42886f7c645..b7e31ded46a 100644
> > +index 21cc1c6623b..e989804603e 100644
> >  --- a/gprofng/gp-display-html/Makefile.in
> >  +++ b/gprofng/gp-display-html/Makefile.in
> > -@@ -200,6 +200,7 @@ CXXFLAGS =3D @CXXFLAGS@
> > +@@ -197,6 +197,7 @@ CXXFLAGS =3D @CXXFLAGS@
> >   CYGPATH_W =3D @CYGPATH_W@
> >   DEFS =3D @DEFS@
> >   DEPDIR =3D @DEPDIR@
> > @@ -10479,7 +10478,7 @@ index 42886f7c645..b7e31ded46a 100644
> >   DSYMUTIL =3D @DSYMUTIL@
> >   DUMPBIN =3D @DUMPBIN@
> >   ECHO_C =3D @ECHO_C@
> > -@@ -235,6 +236,7 @@ LN_S =3D @LN_S@
> > +@@ -232,6 +233,7 @@ LN_S =3D @LN_S@
> >   LTLIBOBJS =3D @LTLIBOBJS@
> >   MAINT =3D @MAINT@
> >   MAKEINFO =3D @MAKEINFO@
> > @@ -10488,7 +10487,7 @@ index 42886f7c645..b7e31ded46a 100644
> >   NM =3D @NM@
> >   NMEDIT =3D @NMEDIT@
> >  diff --git a/gprofng/libcollector/Makefile.in b/gprofng/libcollector/M=
akefile.in
> > -index eef61ba85f7..0eb1521b704 100644
> > +index dc76a76bd67..763b08822f2 100644
> >  --- a/gprofng/libcollector/Makefile.in
> >  +++ b/gprofng/libcollector/Makefile.in
> >  @@ -316,6 +316,7 @@ CXXFLAGS =3D @CXXFLAGS@
> > @@ -10499,7 +10498,7 @@ index eef61ba85f7..0eb1521b704 100644
> >   DSYMUTIL =3D @DSYMUTIL@
> >   DUMPBIN =3D @DUMPBIN@
> >   ECHO_C =3D @ECHO_C@
> > -@@ -342,6 +343,7 @@ LN_S =3D @LN_S@
> > +@@ -341,6 +342,7 @@ LN_S =3D @LN_S@
> >   LTLIBOBJS =3D @LTLIBOBJS@
> >   MAINT =3D @MAINT@
> >   MAKEINFO =3D @MAKEINFO@
> > @@ -10508,10 +10507,10 @@ index eef61ba85f7..0eb1521b704 100644
> >   NM =3D @NM@
> >   NMEDIT =3D @NMEDIT@
> >  diff --git a/gprofng/libcollector/configure b/gprofng/libcollector/con=
figure
> > -index 079a0b71ec3..a28289cfe9d 100755
> > +index 865ddb3d91d..31533528ee2 100755
> >  --- a/gprofng/libcollector/configure
> >  +++ b/gprofng/libcollector/configure
> > -@@ -641,6 +641,8 @@ OTOOL
> > +@@ -640,6 +640,8 @@ OTOOL
> >   LIPO
> >   NMEDIT
> >   DSYMUTIL
> > @@ -10520,7 +10519,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   OBJDUMP
> >   LN_S
> >   NM
> > -@@ -770,6 +772,7 @@ enable_static
> > +@@ -769,6 +771,7 @@ enable_static
> >   with_pic
> >   enable_fast_install
> >   with_gnu_ld
> > @@ -10528,7 +10527,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   enable_libtool_lock
> >   '
> >         ac_precious_vars=3D'build_alias
> > -@@ -1425,6 +1428,8 @@ Optional Packages:
> > +@@ -1424,6 +1427,8 @@ Optional Packages:
> >     --with-pic              try to use only PIC/non-PIC objects [defaul=
t=3Duse
> >                             both]
> >     --with-gnu-ld           assume the C compiler uses GNU ld [default=
=3Dno]
> > @@ -10537,7 +10536,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >   Some influential environment variables:
> >     CC          C compiler command
> > -@@ -5969,8 +5974,8 @@ esac
> > +@@ -5968,8 +5973,8 @@ esac
> >
> >
> >
> > @@ -10548,7 +10547,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >
> >
> > -@@ -6010,7 +6015,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > +@@ -6009,7 +6014,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print string=
s" >&5
> >   $as_echo_n "checking how to print strings... " >&6; }
> >   # Test print first, because it will be a builtin if present.
> > @@ -10557,7 +10556,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> >     ECHO=3D'print -r --'
> >   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -@@ -6703,8 +6708,8 @@ $as_echo_n "checking whether the shell understan=
ds some XSI constructs... " >&6;
> > +@@ -6702,8 +6707,8 @@ $as_echo_n "checking whether the shell understan=
ds some XSI constructs... " >&6;
> >   # Try some XSI features
> >   xsi_shell=3Dno
> >   ( _lt_dummy=3D"a/b/c"
> > @@ -10568,7 +10567,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >       && eval 'test $(( 1 + 1 )) -eq 2 \
> >       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> >     && xsi_shell=3Dyes
> > -@@ -6753,6 +6758,80 @@ esac
> > +@@ -6752,6 +6757,80 @@ esac
> >
> >
> >
> > @@ -10649,7 +10648,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to r=
eload object files" >&5
> >   $as_echo_n "checking for $LD option to reload object files... " >&6; =
}
> >   if ${lt_cv_ld_reload_flag+:} false; then :
> > -@@ -6769,6 +6848,11 @@ case $reload_flag in
> > +@@ -6768,6 +6847,11 @@ case $reload_flag in
> >   esac
> >   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> >   case $host_os in
> > @@ -10661,7 +10660,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >     darwin*)
> >       if test "$GCC" =3D yes; then
> >         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$rel=
oad_objs'
> > -@@ -6937,7 +7021,8 @@ mingw* | pw32*)
> > +@@ -6936,7 +7020,8 @@ mingw* | pw32*)
> >       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86=
 DLL'
> >       lt_cv_file_magic_cmd=3D'func_win32_libid'
> >     else
> > @@ -10671,7 +10670,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> >     fi
> >     ;;
> > -@@ -7091,6 +7176,21 @@ esac
> > +@@ -7090,6 +7175,21 @@ esac
> >   fi
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check=
_method" >&5
> >   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> > @@ -10693,7 +10692,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   file_magic_cmd=3D$lt_cv_file_magic_cmd
> >   deplibs_check_method=3D$lt_cv_deplibs_check_method
> >   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> > -@@ -7106,6 +7206,157 @@ test -z "$deplibs_check_method" && deplibs_che=
ck_method=3Dunknown
> > +@@ -7105,6 +7205,157 @@ test -z "$deplibs_check_method" && deplibs_che=
ck_method=3Dunknown
> >
> >
> >
> > @@ -10851,7 +10850,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   plugin_option=3D
> >   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.=
dll"
> >   for plugin in $plugin_names; do
> > -@@ -7120,8 +7371,10 @@ for plugin in $plugin_names; do
> > +@@ -7119,8 +7370,10 @@ for plugin in $plugin_names; do
> >   done
> >
> >   if test -n "$ac_tool_prefix"; then
> > @@ -10864,7 +10863,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_AR+:} false; then :
> > -@@ -7137,7 +7390,7 @@ do
> > +@@ -7136,7 +7389,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -10873,7 +10872,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -7157,11 +7410,15 @@ $as_echo "no" >&6; }
> > +@@ -7156,11 +7409,15 @@ $as_echo "no" >&6; }
> >   fi
> >
> >
> > @@ -10892,7 +10891,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> > -@@ -7177,7 +7434,7 @@ do
> > +@@ -7176,7 +7433,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -10901,7 +10900,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -7196,6 +7453,10 @@ else
> > +@@ -7195,6 +7452,10 @@ else
> >   $as_echo "no" >&6; }
> >   fi
> >
> > @@ -10912,7 +10911,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >     if test "x$ac_ct_AR" =3D x; then
> >       AR=3D"false"
> >     else
> > -@@ -7207,29 +7468,81 @@ ac_tool_warned=3Dyes ;;
> > +@@ -7206,29 +7467,81 @@ ac_tool_warned=3Dyes ;;
> >   esac
> >       AR=3D$ac_ct_AR
> >     fi
> > @@ -11009,7 +11008,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >
> >
> > -@@ -7576,8 +7889,8 @@ esac
> > +@@ -7575,8 +7888,8 @@ esac
> >   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern=
 int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> >
> >   # Transform an extracted symbol line into symbol name and symbol addr=
ess
> > @@ -11020,7 +11019,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >   # Handle CRLF in mingw tool chain
> >   opt_cr=3D
> > -@@ -7613,6 +7926,7 @@ for ac_symprfx in "" "_"; do
> > +@@ -7612,6 +7925,7 @@ for ac_symprfx in "" "_"; do
> >     else
> >       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[  ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> >     fi
> > @@ -11028,7 +11027,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >     # Check to see that the pipe works correctly.
> >     pipe_works=3Dno
> > -@@ -7654,6 +7968,18 @@ _LT_EOF
> > +@@ -7653,6 +7967,18 @@ _LT_EOF
> >         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> >       if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> >         cat <<_LT_EOF > conftest.$ac_ext
> > @@ -11047,7 +11046,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   #ifdef __cplusplus
> >   extern "C" {
> >   #endif
> > -@@ -7665,7 +7991,7 @@ _LT_EOF
> > +@@ -7664,7 +7990,7 @@ _LT_EOF
> >         cat <<_LT_EOF >> conftest.$ac_ext
> >
> >   /* The mapping between symbol names and symbols.  */
> > @@ -11056,7 +11055,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >     const char *name;
> >     void       *address;
> >   }
> > -@@ -7691,8 +8017,8 @@ static const void *lt_preloaded_setup() {
> > +@@ -7690,8 +8016,8 @@ static const void *lt_preloaded_setup() {
> >   _LT_EOF
> >         # Now try linking the two files.
> >         mv conftest.$ac_objext conftstm.$ac_objext
> > @@ -11067,7 +11066,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         LIBS=3D"conftstm.$ac_objext"
> >         CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> >         if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> > -@@ -7702,8 +8028,8 @@ _LT_EOF
> > +@@ -7701,8 +8027,8 @@ _LT_EOF
> >     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> >           pipe_works=3Dyes
> >         fi
> > @@ -11078,7 +11077,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >       else
> >         echo "cannot find nm_test_func in $nlist" >&5
> >       fi
> > -@@ -7740,6 +8066,13 @@ else
> > +@@ -7739,6 +8065,13 @@ else
> >   $as_echo "ok" >&6; }
> >   fi
> >
> > @@ -11092,7 +11091,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >
> >
> > -@@ -7759,6 +8092,48 @@ fi
> > +@@ -7758,6 +8091,48 @@ fi
> >
> >
> >
> > @@ -11141,7 +11140,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >
> >   # Check whether --enable-libtool-lock was given.
> > -@@ -7967,6 +8342,123 @@ esac
> > +@@ -7966,6 +8341,123 @@ esac
> >
> >   need_locks=3D"$enable_libtool_lock"
> >
> > @@ -11265,7 +11264,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >     case $host_os in
> >       rhapsody* | darwin*)
> > -@@ -8530,6 +9022,8 @@ _LT_EOF
> > +@@ -8529,6 +9021,8 @@ _LT_EOF
> >         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> >         echo "$AR cru libconftest.a conftest.o" >&5
> >         $AR cru libconftest.a conftest.o 2>&5
> > @@ -11274,7 +11273,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         cat > conftest.c << _LT_EOF
> >   int main() { return 0;}
> >   _LT_EOF
> > -@@ -8598,6 +9092,16 @@ done
> > +@@ -8597,6 +9091,16 @@ done
> >
> >
> >
> > @@ -11291,7 +11290,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >
> >   # Set options
> > -@@ -9113,8 +9617,6 @@ fi
> > +@@ -9112,8 +9616,6 @@ fi
> >   lt_prog_compiler_pic=3D
> >   lt_prog_compiler_static=3D
> >
> > @@ -11300,7 +11299,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >     if test "$GCC" =3D yes; then
> >       lt_prog_compiler_wl=3D'-Wl,'
> > -@@ -9280,6 +9782,12 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> > +@@ -9279,6 +9781,12 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> >       lt_prog_compiler_pic=3D'--shared'
> >       lt_prog_compiler_static=3D'--static'
> >       ;;
> > @@ -11313,7 +11312,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> >           # Portland Group compilers (*not* the Pentium gcc compiler,
> >       # which looks to be a dead project)
> > -@@ -9342,7 +9850,7 @@ $as_echo_n "checking for $compiler option to pro=
duce PIC... " >&6; }
> > +@@ -9341,7 +9849,7 @@ $as_echo_n "checking for $compiler option to pro=
duce PIC... " >&6; }
> >         lt_prog_compiler_pic=3D'-KPIC'
> >         lt_prog_compiler_static=3D'-Bstatic'
> >         case $cc_basename in
> > @@ -11322,7 +11321,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >       lt_prog_compiler_wl=3D'-Qoption ld ';;
> >         *)
> >       lt_prog_compiler_wl=3D'-Wl,';;
> > -@@ -9399,13 +9907,17 @@ case $host_os in
> > +@@ -9398,13 +9906,17 @@ case $host_os in
> >       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> >       ;;
> >   esac
> > @@ -11346,7 +11345,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >   #
> >   # Check to make sure the PIC flag actually works.
> > -@@ -9466,6 +9978,11 @@ fi
> > +@@ -9465,6 +9977,11 @@ fi
> >
> >
> >
> > @@ -11358,7 +11357,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   #
> >   # Check to make sure the static flag actually works.
> >   #
> > -@@ -9816,7 +10333,8 @@ _LT_EOF
> > +@@ -9815,7 +10332,8 @@ _LT_EOF
> >         allow_undefined_flag=3Dunsupported
> >         always_export_symbols=3Dno
> >         enable_shared_with_static_runtimes=3Dyes
> > @@ -11368,7 +11367,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> >           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags=
 -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-imp=
lib -Xlinker $lib'
> > -@@ -9915,12 +10433,12 @@ _LT_EOF
> > +@@ -9914,12 +10432,12 @@ _LT_EOF
> >         whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
> >         hardcode_libdir_flag_spec=3D
> >         hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> > @@ -11383,7 +11382,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         fi
> >         ;;
> >       esac
> > -@@ -9934,8 +10452,8 @@ _LT_EOF
> > +@@ -9933,8 +10451,8 @@ _LT_EOF
> >       archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
> >       wlarc=3D
> >         else
> > @@ -11394,7 +11393,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         fi
> >         ;;
> >
> > -@@ -9953,8 +10471,8 @@ _LT_EOF
> > +@@ -9952,8 +10470,8 @@ _LT_EOF
> >
> >   _LT_EOF
> >         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /de=
v/null; then
> > @@ -11405,7 +11404,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         else
> >       ld_shlibs=3Dno
> >         fi
> > -@@ -10000,8 +10518,8 @@ _LT_EOF
> > +@@ -9999,8 +10517,8 @@ _LT_EOF
> >
> >       *)
> >         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> > @@ -11416,7 +11415,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         else
> >       ld_shlibs=3Dno
> >         fi
> > -@@ -10131,7 +10649,13 @@ _LT_EOF
> > +@@ -10130,7 +10648,13 @@ _LT_EOF
> >       allow_undefined_flag=3D'-berok'
> >           # Determine the default libpath from the value encoded in an
> >           # empty executable.
> > @@ -11431,7 +11430,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -10144,22 +10668,29 @@ main ()
> > +@@ -10143,22 +10667,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -11474,7 +11473,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_li=
bpath"
> >           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs=
 $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undef=
ined_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; el=
se :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> > -@@ -10171,7 +10702,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -10170,7 +10701,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >       else
> >        # Determine the default libpath from the value encoded in an
> >        # empty executable.
> > @@ -11489,7 +11488,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -10184,22 +10721,29 @@ main ()
> > +@@ -10183,22 +10720,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -11532,7 +11531,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >        hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
> >         # Warning - without using the other run time loading flags,
> > -@@ -10243,21 +10787,64 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -10242,21 +10786,64 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >         # When not using gcc, we currently assume that we are using
> >         # Microsoft Visual C++.
> >         # hardcode_libdir_flag_spec is actually meaningless, as there i=
s
> > @@ -11612,7 +11611,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         ;;
> >
> >       darwin* | rhapsody*)
> > -@@ -10318,7 +10905,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -10317,7 +10904,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> >       freebsd* | dragonfly*)
> > @@ -11621,7 +11620,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         hardcode_libdir_flag_spec=3D'-R$libdir'
> >         hardcode_direct=3Dyes
> >         hardcode_shlibpath_var=3Dno
> > -@@ -10326,7 +10913,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -10325,7 +10912,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >       hpux9*)
> >         if test "$GCC" =3D yes; then
> > @@ -11630,7 +11629,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         else
> >       archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> >         fi
> > -@@ -10342,7 +10929,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -10341,7 +10928,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >       hpux10*)
> >         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> > @@ -11639,7 +11638,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         else
> >       archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
> >         fi
> > -@@ -10366,10 +10953,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -10365,10 +10952,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >         archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
> >         ;;
> >       ia64*)
> > @@ -11652,7 +11651,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         ;;
> >       esac
> >         else
> > -@@ -10448,23 +11035,36 @@ fi
> > +@@ -10447,23 +11034,36 @@ fi
> >
> >       irix5* | irix6* | nonstopux*)
> >         if test "$GCC" =3D yes; then
> > @@ -11697,7 +11696,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         else
> >       archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
> >       archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> > -@@ -10549,7 +11149,7 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -10548,7 +11148,7 @@ rm -f core conftest.err conftest.$ac_objext \
> >       osf4* | osf5*)  # as osf3* with the addition of -msym flag
> >         if test "$GCC" =3D yes; then
> >       allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> > @@ -11706,7 +11705,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >       hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
> >         else
> >       allow_undefined_flag=3D' -expect_unresolved \*'
> > -@@ -10568,9 +11168,9 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -10567,9 +11167,9 @@ rm -f core conftest.err conftest.$ac_objext \
> >         no_undefined_flag=3D' -z defs'
> >         if test "$GCC" =3D yes; then
> >       wlarc=3D'${wl}'
> > @@ -11718,7 +11717,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         else
> >       case `$CC -V 2>&1` in
> >       *"Compilers 5.0"*)
> > -@@ -11146,8 +11746,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -11145,8 +11745,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> >     need_version=3Dno
> >     need_lib_prefix=3Dno
> >
> > @@ -11730,7 +11729,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >       library_names_spec=3D'$libname.dll.a'
> >       # DLL is installed to $(libdir)/../bin by postinstall_cmds
> >       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -11180,13 +11781,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -11179,13 +11780,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> >         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``e=
cho ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> >         ;;
> >       esac
> > @@ -11803,16 +11802,16 @@ index 079a0b71ec3..a28289cfe9d 100755
> >     # FIXME: first we should search . and the directory the executable =
is in
> >     shlibpath_var=3DPATH
> >     ;;
> > -@@ -12064,7 +12723,7 @@ else
> > +@@ -12063,7 +12722,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 12067 "configure"
> > +-#line 12066 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -12108,10 +12767,10 @@ else
> > +@@ -12107,10 +12766,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -11825,16 +11824,16 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -12170,7 +12829,7 @@ else
> > +@@ -12169,7 +12828,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 12173 "configure"
> > +-#line 12172 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -12214,10 +12873,10 @@ else
> > +@@ -12213,10 +12872,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -11847,7 +11846,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -12609,6 +13268,7 @@ $RM -r conftest*
> > +@@ -12608,6 +13267,7 @@ $RM -r conftest*
> >
> >     # Allow CC to be a program name with arguments.
> >     lt_save_CC=3D$CC
> > @@ -11855,7 +11854,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >     lt_save_LD=3D$LD
> >     lt_save_GCC=3D$GCC
> >     GCC=3D$GXX
> > -@@ -12626,6 +13286,7 @@ $RM -r conftest*
> > +@@ -12625,6 +13285,7 @@ $RM -r conftest*
> >     fi
> >     test -z "${LDCXX+set}" || LD=3D$LDCXX
> >     CC=3D${CXX-"c++"}
> > @@ -11863,7 +11862,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >     compiler=3D$CC
> >     compiler_CXX=3D$CC
> >     for cc_temp in $compiler""; do
> > -@@ -12908,7 +13569,13 @@ $as_echo_n "checking whether the $compiler li=
nker ($LD) supports shared librarie
> > +@@ -12907,7 +13568,13 @@ $as_echo_n "checking whether the $compiler li=
nker ($LD) supports shared librarie
> >             allow_undefined_flag_CXX=3D'-berok'
> >             # Determine the default libpath from the value encoded in a=
n empty
> >             # executable.
> > @@ -11878,7 +11877,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -12921,22 +13588,29 @@ main ()
> > +@@ -12920,22 +13587,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_cxx_try_link "$LINENO"; then :
> >
> > @@ -11921,7 +11920,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >             hardcode_libdir_flag_spec_CXX=3D'${wl}-blibpath:$libdir:'"$=
aix_libpath"
> >
> > -@@ -12949,7 +13623,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -12948,7 +13622,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >             else
> >           # Determine the default libpath from the value encoded in an
> >           # empty executable.
> > @@ -11936,7 +11935,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -12962,22 +13642,29 @@ main ()
> > +@@ -12961,22 +13641,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_cxx_try_link "$LINENO"; then :
> >
> > @@ -11979,7 +11978,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >           hardcode_libdir_flag_spec_CXX=3D'${wl}-blibpath:$libdir:'"$ai=
x_libpath"
> >           # Warning - without using the other run time loading flags,
> > -@@ -13020,29 +13707,75 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -13019,29 +13706,75 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >           ;;
> >
> >         cygwin* | mingw* | pw32* | cegcc*)
> > @@ -12078,7 +12077,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         darwin* | rhapsody*)
> >
> >
> > -@@ -13148,7 +13881,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -13147,7 +13880,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >               ;;
> >             *)
> >               if test "$GXX" =3D yes; then
> > @@ -12087,7 +12086,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >               else
> >                 # FIXME: insert proper C++ library support
> >                 ld_shlibs_CXX=3Dno
> > -@@ -13219,10 +13952,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -13218,10 +13951,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >                   archive_cmds_CXX=3D'$CC -shared -nostdlib -fPIC ${wl}=
+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects =
$compiler_flags'
> >                   ;;
> >                 ia64*)
> > @@ -12100,7 +12099,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >                   ;;
> >               esac
> >             fi
> > -@@ -13263,9 +13996,9 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -13262,9 +13995,9 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >             *)
> >           if test "$GXX" =3D yes; then
> >             if test "$with_gnu_ld" =3D no; then
> > @@ -12112,7 +12111,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >             fi
> >           fi
> >           link_all_deplibs_CXX=3Dyes
> > -@@ -13335,20 +14068,20 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -13334,20 +14067,20 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >             prelink_cmds_CXX=3D'tpldir=3DTemplate.dir~
> >               rm -rf $tpldir~
> >               $CC --prelink_objects --instantiation_dir $tpldir $objs $=
libobjs $compile_deplibs~
> > @@ -12137,7 +12136,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >             ;;
> >           *) # Version 6 and above use weak symbols
> >             archive_cmds_CXX=3D'$CC -shared $pic_flag $predep_objects $=
libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname=
 -o $lib'
> > -@@ -13543,7 +14276,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -13542,7 +14275,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >                 archive_cmds_CXX=3D'$CC -shared -nostdlib ${allow_undef=
ined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_fla=
gs ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-=
set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/s=
o_locations -o $lib'
> >                 ;;
> >               *)
> > @@ -12146,7 +12145,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >                 ;;
> >             esac
> >
> > -@@ -13589,7 +14322,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -13588,7 +14321,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >
> >         solaris*)
> >           case $cc_basename in
> > @@ -12155,7 +12154,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >           # Sun C++ 4.2, 5.x and Centerline C++
> >               archive_cmds_need_lc_CXX=3Dyes
> >           no_undefined_flag_CXX=3D' -zdefs'
> > -@@ -13630,9 +14363,9 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -13629,9 +14362,9 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >           if test "$GXX" =3D yes && test "$with_gnu_ld" =3D no; then
> >             no_undefined_flag_CXX=3D' ${wl}-z ${wl}defs'
> >             if $CC --version | $GREP -v '^2\.7' > /dev/null; then
> > @@ -12167,7 +12166,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >               # Commands to make compiler produce verbose output that l=
ists
> >               # what "hidden" libraries, object files and flags are use=
d when
> > -@@ -13767,6 +14500,13 @@ private:
> > +@@ -13766,6 +14499,13 @@ private:
> >   };
> >   _LT_EOF
> >
> > @@ -12181,7 +12180,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\"";=
 } >&5
> >     (eval $ac_compile) 2>&5
> >     ac_status=3D$?
> > -@@ -13780,7 +14520,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LIN=
ENO}: \"$ac_compile\""; } >&5
> > +@@ -13779,7 +14519,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LIN=
ENO}: \"$ac_compile\""; } >&5
> >     pre_test_object_deps_done=3Dno
> >
> >     for p in `eval "$output_verbose_link_cmd"`; do
> > @@ -12190,7 +12189,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >       -L* | -R* | -l*)
> >          # Some compilers place space between "-{L,R}" and the path.
> > -@@ -13789,13 +14529,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$L=
INENO}: \"$ac_compile\""; } >&5
> > +@@ -13788,13 +14528,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$L=
INENO}: \"$ac_compile\""; } >&5
> >             test $p =3D "-R"; then
> >        prev=3D$p
> >        continue
> > @@ -12217,7 +12216,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >          # Internal compiler library paths should come after those
> >          # provided the user.  The postdeps already come after the
> >          # user supplied libs so there is no need to process them.
> > -@@ -13815,8 +14564,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LI=
NENO}: \"$ac_compile\""; } >&5
> > +@@ -13814,8 +14563,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LI=
NENO}: \"$ac_compile\""; } >&5
> >          postdeps_CXX=3D"${postdeps_CXX} ${prev}${p}"
> >        fi
> >          fi
> > @@ -12228,7 +12227,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >       *.$objext)
> >          # This assumes that the test object file only shows up
> >          # once in the compiler output.
> > -@@ -13852,6 +14603,7 @@ else
> > +@@ -13851,6 +14602,7 @@ else
> >   fi
> >
> >   $RM -f confest.$objext
> > @@ -12236,7 +12235,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >   # PORTME: override above test on systems where it is broken
> >   case $host_os in
> > -@@ -13887,7 +14639,7 @@ linux*)
> > +@@ -13886,7 +14638,7 @@ linux*)
> >
> >   solaris*)
> >     case $cc_basename in
> > @@ -12245,7 +12244,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >       # The more standards-conforming stlport4 library is
> >       # incompatible with the Cstd library. Avoid specifying
> >       # it if it's in CXXFLAGS. Ignore libCrun as
> > -@@ -13952,8 +14704,6 @@ fi
> > +@@ -13951,8 +14703,6 @@ fi
> >   lt_prog_compiler_pic_CXX=3D
> >   lt_prog_compiler_static_CXX=3D
> >
> > @@ -12254,7 +12253,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >     # C++ specific cases for pic, static, wl, etc.
> >     if test "$GXX" =3D yes; then
> > -@@ -14058,6 +14808,11 @@ $as_echo_n "checking for $compiler option to =
produce PIC... " >&6; }
> > +@@ -14057,6 +14807,11 @@ $as_echo_n "checking for $compiler option to =
produce PIC... " >&6; }
> >         ;;
> >       esac
> >       ;;
> > @@ -12266,7 +12265,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >         dgux*)
> >       case $cc_basename in
> >         ec++*)
> > -@@ -14210,7 +14965,7 @@ $as_echo_n "checking for $compiler option to p=
roduce PIC... " >&6; }
> > +@@ -14209,7 +14964,7 @@ $as_echo_n "checking for $compiler option to p=
roduce PIC... " >&6; }
> >       ;;
> >         solaris*)
> >       case $cc_basename in
> > @@ -12275,7 +12274,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >           # Sun C++ 4.2, 5.x and Centerline C++
> >           lt_prog_compiler_pic_CXX=3D'-KPIC'
> >           lt_prog_compiler_static_CXX=3D'-Bstatic'
> > -@@ -14275,10 +15030,17 @@ case $host_os in
> > +@@ -14274,10 +15029,17 @@ case $host_os in
> >       lt_prog_compiler_pic_CXX=3D"$lt_prog_compiler_pic_CXX -DPIC"
> >       ;;
> >   esac
> > @@ -12296,7 +12295,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >   #
> >   # Check to make sure the PIC flag actually works.
> > -@@ -14336,6 +15098,8 @@ fi
> > +@@ -14335,6 +15097,8 @@ fi
> >
> >
> >
> > @@ -12305,7 +12304,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   #
> >   # Check to make sure the static flag actually works.
> >   #
> > -@@ -14513,6 +15277,7 @@ fi
> > +@@ -14512,6 +15276,7 @@ fi
> >   $as_echo_n "checking whether the $compiler linker ($LD) supports shar=
ed libraries... " >&6; }
> >
> >     export_symbols_cmds_CXX=3D'$NM $libobjs $convenience | $global_symb=
ol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
> > @@ -12313,7 +12312,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >     case $host_os in
> >     aix[4-9]*)
> >       # If we're using GNU nm, then we don't want the "-C" option.
> > -@@ -14527,15 +15292,20 @@ $as_echo_n "checking whether the $compiler l=
inker ($LD) supports shared librarie
> > +@@ -14526,15 +15291,20 @@ $as_echo_n "checking whether the $compiler l=
inker ($LD) supports shared librarie
> >       ;;
> >     pw32*)
> >       export_symbols_cmds_CXX=3D"$ltdll_cmds"
> > @@ -12339,7 +12338,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
> >   $as_echo "$ld_shlibs_CXX" >&6; }
> > -@@ -14798,8 +15568,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -14797,8 +15567,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> >     need_version=3Dno
> >     need_lib_prefix=3Dno
> >
> > @@ -12351,7 +12350,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >       library_names_spec=3D'$libname.dll.a'
> >       # DLL is installed to $(libdir)/../bin by postinstall_cmds
> >       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -14831,13 +15602,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -14830,13 +15601,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> >         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``e=
cho ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> >         ;;
> >       esac
> > @@ -12424,7 +12423,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >     # FIXME: first we should search . and the directory the executable =
is in
> >     shlibpath_var=3DPATH
> >     ;;
> > -@@ -15377,6 +16206,7 @@ fi
> > +@@ -15376,6 +16205,7 @@ fi
> >     fi # test -n "$compiler"
> >
> >     CC=3D$lt_save_CC
> > @@ -12432,7 +12431,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >     LDCXX=3D$LD
> >     LD=3D$lt_save_LD
> >     GCC=3D$lt_save_GCC
> > -@@ -16321,13 +17151,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> > +@@ -16303,13 +17133,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -12453,7 +12452,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay=
_single_quote_subst"`'
> > -@@ -16342,14 +17179,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -16324,14 +17161,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_=
to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_globa=
l_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_c=
v_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quo=
te_subst"`'
> > @@ -12472,7 +12471,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -16382,12 +17222,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> > +@@ -16364,12 +17204,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_sin=
gle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_=
subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_=
quote_subst"`'
> > @@ -12486,7 +12485,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quot=
e_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | =
$SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > -@@ -16426,8 +17266,8 @@ old_archive_cmds_CXX=3D'`$ECHO "$old_archive_c=
mds_CXX" | $SED "$delay_single_quote
> > +@@ -16408,8 +17248,8 @@ old_archive_cmds_CXX=3D'`$ECHO "$old_archive_c=
mds_CXX" | $SED "$delay_single_quote
> >   compiler_CXX=3D'`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_su=
bst"`'
> >   GCC_CXX=3D'`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
> >   lt_prog_compiler_no_builtin_flag_CXX=3D'`$ECHO "$lt_prog_compiler_no_=
builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
> > @@ -12496,7 +12495,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   lt_prog_compiler_static_CXX=3D'`$ECHO "$lt_prog_compiler_static_CXX" =
| $SED "$delay_single_quote_subst"`'
> >   lt_cv_prog_compiler_c_o_CXX=3D'`$ECHO "$lt_cv_prog_compiler_c_o_CXX" =
| $SED "$delay_single_quote_subst"`'
> >   archive_cmds_need_lc_CXX=3D'`$ECHO "$archive_cmds_need_lc_CXX" | $SED=
 "$delay_single_quote_subst"`'
> > -@@ -16454,12 +17294,12 @@ hardcode_shlibpath_var_CXX=3D'`$ECHO "$hardc=
ode_shlibpath_var_CXX" | $SED "$delay_
> > +@@ -16436,12 +17276,12 @@ hardcode_shlibpath_var_CXX=3D'`$ECHO "$hardc=
ode_shlibpath_var_CXX" | $SED "$delay_
> >   hardcode_automatic_CXX=3D'`$ECHO "$hardcode_automatic_CXX" | $SED "$d=
elay_single_quote_subst"`'
> >   inherit_rpath_CXX=3D'`$ECHO "$inherit_rpath_CXX" | $SED "$delay_singl=
e_quote_subst"`'
> >   link_all_deplibs_CXX=3D'`$ECHO "$link_all_deplibs_CXX" | $SED "$delay=
_single_quote_subst"`'
> > @@ -12510,7 +12509,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   file_list_spec_CXX=3D'`$ECHO "$file_list_spec_CXX" | $SED "$delay_sin=
gle_quote_subst"`'
> >   hardcode_action_CXX=3D'`$ECHO "$hardcode_action_CXX" | $SED "$delay_s=
ingle_quote_subst"`'
> >   compiler_lib_search_dirs_CXX=3D'`$ECHO "$compiler_lib_search_dirs_CXX=
" | $SED "$delay_single_quote_subst"`'
> > -@@ -16497,8 +17337,13 @@ reload_flag \
> > +@@ -16479,8 +17319,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -12524,7 +12523,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -16508,12 +17353,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -16490,12 +17335,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -12540,7 +12539,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -16529,7 +17376,6 @@ no_undefined_flag \
> > +@@ -16511,7 +17358,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -12548,7 +12547,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -16551,8 +17397,8 @@ LD_CXX \
> > +@@ -16533,8 +17379,8 @@ LD_CXX \
> >   reload_flag_CXX \
> >   compiler_CXX \
> >   lt_prog_compiler_no_builtin_flag_CXX \
> > @@ -12558,7 +12557,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   lt_prog_compiler_static_CXX \
> >   lt_cv_prog_compiler_c_o_CXX \
> >   export_dynamic_flag_spec_CXX \
> > -@@ -16564,7 +17410,6 @@ no_undefined_flag_CXX \
> > +@@ -16546,7 +17392,6 @@ no_undefined_flag_CXX \
> >   hardcode_libdir_flag_spec_CXX \
> >   hardcode_libdir_flag_spec_ld_CXX \
> >   hardcode_libdir_separator_CXX \
> > @@ -12566,7 +12565,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   exclude_expsyms_CXX \
> >   include_expsyms_CXX \
> >   file_list_spec_CXX \
> > -@@ -16598,6 +17443,7 @@ module_cmds \
> > +@@ -16580,6 +17425,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -12574,7 +12573,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -16612,7 +17458,8 @@ archive_expsym_cmds_CXX \
> > +@@ -16594,7 +17440,8 @@ archive_expsym_cmds_CXX \
> >   module_cmds_CXX \
> >   module_expsym_cmds_CXX \
> >   export_symbols_cmds_CXX \
> > @@ -12584,7 +12583,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >       case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
> >       *[\\\\\\\`\\"\\\$]*)
> >         eval "lt_\$var=3D\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED =
-e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$dela=
y_variable_subst\\"\\\`\\\\\\""
> > -@@ -17366,7 +18213,8 @@ $as_echo X"$file" |
> > +@@ -17348,7 +18195,8 @@ $as_echo X"$file" |
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 200=
5,
> > @@ -12594,7 +12593,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -17469,19 +18317,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -17451,19 +18299,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -12638,7 +12637,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -17511,6 +18382,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> > +@@ -17493,6 +18364,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefix=
 is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sym=
bol_to_c_name_address_lib_prefix
> >
> > @@ -12651,7 +12650,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -17520,6 +18397,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -17502,6 +18379,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -12661,7 +12660,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -17634,12 +18514,12 @@ with_gcc=3D$GCC
> > +@@ -17616,12 +18496,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -12677,7 +12676,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -17726,9 +18606,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -17708,9 +18588,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency libr=
aries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -12687,7 +12686,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -17744,6 +18621,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -17726,6 +18603,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with te=
mplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -12697,7 +12696,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -17790,210 +18670,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -17772,210 +18652,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash proble=
m
> >     # is reportedly fixed, but why not run on old versions too?
> > @@ -13071,7 +13070,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >       (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
> >     chmod +x "$ofile"
> >
> > -@@ -18021,12 +18860,12 @@ with_gcc=3D$GCC_CXX
> > +@@ -18003,12 +18842,12 @@ with_gcc=3D$GCC_CXX
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag_CXX
> >
> > @@ -13087,7 +13086,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static_CXX
> >
> > -@@ -18113,9 +18952,6 @@ inherit_rpath=3D$inherit_rpath_CXX
> > +@@ -18095,9 +18934,6 @@ inherit_rpath=3D$inherit_rpath_CXX
> >   # Whether libtool must link a program against all its dependency libr=
aries.
> >   link_all_deplibs=3D$link_all_deplibs_CXX
> >
> > @@ -13097,7 +13096,7 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols_CXX
> >
> > -@@ -18131,6 +18967,9 @@ include_expsyms=3D$lt_include_expsyms_CXX
> > +@@ -18113,6 +18949,9 @@ include_expsyms=3D$lt_include_expsyms_CXX
> >   # Commands necessary for linking programs (against libraries) with te=
mplates.
> >   prelink_cmds=3D$lt_prelink_cmds_CXX
> >
> > @@ -13108,10 +13107,10 @@ index 079a0b71ec3..a28289cfe9d 100755
> >   file_list_spec=3D$lt_file_list_spec_CXX
> >
> >  diff --git a/gprofng/src/Makefile.in b/gprofng/src/Makefile.in
> > -index 605fa4f6fd4..313c4ceb4ca 100644
> > +index b881268b0d9..cfc98458e79 100644
> >  --- a/gprofng/src/Makefile.in
> >  +++ b/gprofng/src/Makefile.in
> > -@@ -324,6 +324,7 @@ CXXFLAGS =3D @CXXFLAGS@
> > +@@ -321,6 +321,7 @@ CXXFLAGS =3D @CXXFLAGS@
> >   CYGPATH_W =3D @CYGPATH_W@
> >   DEFS =3D @DEFS@
> >   DEPDIR =3D @DEPDIR@
> > @@ -13119,7 +13118,7 @@ index 605fa4f6fd4..313c4ceb4ca 100644
> >   DSYMUTIL =3D @DSYMUTIL@
> >   DUMPBIN =3D @DUMPBIN@
> >   ECHO_C =3D @ECHO_C@
> > -@@ -359,6 +360,7 @@ LN_S =3D @LN_S@
> > +@@ -356,6 +357,7 @@ LN_S =3D @LN_S@
> >   LTLIBOBJS =3D @LTLIBOBJS@
> >   MAINT =3D @MAINT@
> >   MAKEINFO =3D @MAKEINFO@
> > @@ -13128,7 +13127,7 @@ index 605fa4f6fd4..313c4ceb4ca 100644
> >   NM =3D @NM@
> >   NMEDIT =3D @NMEDIT@
> >  diff --git a/ld/Makefile.in b/ld/Makefile.in
> > -index 08dcd7b75fc..17c58dd2fd0 100644
> > +index c21c554e432..729e1f47e85 100644
> >  --- a/ld/Makefile.in
> >  +++ b/ld/Makefile.in
> >  @@ -384,6 +384,7 @@ CYGPATH_W =3D @CYGPATH_W@
> > @@ -13156,7 +13155,7 @@ index 08dcd7b75fc..17c58dd2fd0 100644
> >   ac_ct_CXX =3D @ac_ct_CXX@
> >   ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
> >  diff --git a/ld/configure b/ld/configure
> > -index 6406a42c442..21ab5b06709 100755
> > +index 29896853a90..9e93585f94e 100755
> >  --- a/ld/configure
> >  +++ b/ld/configure
> >  @@ -700,8 +700,11 @@ OTOOL
> > @@ -15762,18 +15761,150 @@ index 6406a42c442..21ab5b06709 100755
> >   file_list_spec=3D$lt_file_list_spec_CXX
> >
> >  diff --git a/libbacktrace/Makefile.in b/libbacktrace/Makefile.in
> > -index 0a61880ba67..5889b0477cd 100644
> > +index 0a61880ba67..500756cd023 100644
> >  --- a/libbacktrace/Makefile.in
> >  +++ b/libbacktrace/Makefile.in
> > -@@ -827,6 +827,7 @@ CPP =3D @CPP@
> > +@@ -1,7 +1,7 @@
> > +-# Makefile.in generated by automake 1.15.1 from Makefile.am.
> > ++# Makefile.in generated by automake 1.16.5 from Makefile.am.
> > + # @configure_input@
> > +
> > +-# Copyright (C) 1994-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 1994-2021 Free Software Foundation, Inc.
> > +
> > + # This Makefile.in is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -189,6 +189,35 @@ CONFIG_HEADER =3D config.h
> > + CONFIG_CLEAN_FILES =3D backtrace-supported.h \
> > +     install-debuginfo-for-buildid.sh
> > + CONFIG_CLEAN_VPATH_FILES =3D
> > ++@NATIVE_TRUE@am__EXEEXT_1 =3D allocfail$(EXEEXT)
> > ++@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am__EXEEXT_2=
 =3D b2test$(EXEEXT)
> > ++@HAVE_DWZ_TRUE@@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TR=
UE@am__EXEEXT_3 =3D b3test$(EXEEXT)
> > ++@NATIVE_TRUE@am__EXEEXT_4 =3D test_elf_32$(EXEEXT) test_elf_64$(EXEEX=
T) \
> > ++@NATIVE_TRUE@       test_macho$(EXEEXT) test_xcoff_32$(EXEEXT) \
> > ++@NATIVE_TRUE@       test_xcoff_64$(EXEEXT) test_pecoff$(EXEEXT) \
> > ++@NATIVE_TRUE@       test_unknown$(EXEEXT) unittest$(EXEEXT) \
> > ++@NATIVE_TRUE@       unittest_alloc$(EXEEXT) btest$(EXEEXT)
> > ++@HAVE_ELF_TRUE@@NATIVE_TRUE@am__EXEEXT_5 =3D btest_lto$(EXEEXT)
> > ++@NATIVE_TRUE@am__EXEEXT_6 =3D btest_alloc$(EXEEXT) stest$(EXEEXT) \
> > ++@NATIVE_TRUE@       stest_alloc$(EXEEXT)
> > ++@HAVE_ELF_TRUE@@NATIVE_TRUE@am__EXEEXT_7 =3D ztest$(EXEEXT) \
> > ++@HAVE_ELF_TRUE@@NATIVE_TRUE@        ztest_alloc$(EXEEXT)
> > ++@NATIVE_TRUE@am__EXEEXT_8 =3D edtest$(EXEEXT) edtest_alloc$(EXEEXT)
> > ++@HAVE_PTHREAD_TRUE@@NATIVE_TRUE@am__EXEEXT_9 =3D ttest$(EXEEXT) \
> > ++@HAVE_PTHREAD_TRUE@@NATIVE_TRUE@    ttest_alloc$(EXEEXT)
> > ++@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@am__EXEEXT_10 =3D  \
> > ++@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@   ctestg$(EXEEXT) \
> > ++@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@   ctesta$(EXEEXT) \
> > ++@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@   ctestg_alloc$(EXEEXT) \
> > ++@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@   ctesta_alloc$(EXEEXT)
> > ++@HAVE_DWARF5_TRUE@@NATIVE_TRUE@am__EXEEXT_11 =3D dwarf5$(EXEEXT) \
> > ++@HAVE_DWARF5_TRUE@@NATIVE_TRUE@     dwarf5_alloc$(EXEEXT)
> > ++@NATIVE_TRUE@am__EXEEXT_12 =3D mtest$(EXEEXT)
> > ++@HAVE_ELF_TRUE@am__EXEEXT_13 =3D xztest$(EXEEXT) xztest_alloc$(EXEEXT=
)
> > ++am__EXEEXT_14 =3D $(am__EXEEXT_4) $(am__EXEEXT_5) $(am__EXEEXT_6) \
> > ++    $(am__EXEEXT_7) $(am__EXEEXT_8) $(am__EXEEXT_9) \
> > ++    $(am__EXEEXT_10) $(am__EXEEXT_11) $(am__EXEEXT_12) \
> > ++    $(am__EXEEXT_13)
> > + LTLIBRARIES =3D $(noinst_LTLIBRARIES)
> > + am__DEPENDENCIES_1 =3D
> > + am_libbacktrace_la_OBJECTS =3D atomic.lo dwarf.lo fileline.lo posix.l=
o \
> > +@@ -220,35 +249,6 @@ libbacktrace_instrumented_alloc_la_OBJECTS =3D  \
> > + libbacktrace_noformat_la_OBJECTS =3D  \
> > +     $(am_libbacktrace_noformat_la_OBJECTS)
> > + @NATIVE_TRUE@am_libbacktrace_noformat_la_rpath =3D
> > +-@NATIVE_TRUE@am__EXEEXT_1 =3D allocfail$(EXEEXT)
> > +-@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TRUE@am__EXEEXT_2=
 =3D b2test$(EXEEXT)
> > +-@HAVE_DWZ_TRUE@@HAVE_ELF_TRUE@@HAVE_OBJCOPY_DEBUGLINK_TRUE@@NATIVE_TR=
UE@am__EXEEXT_3 =3D b3test$(EXEEXT)
> > +-@NATIVE_TRUE@am__EXEEXT_4 =3D test_elf_32$(EXEEXT) test_elf_64$(EXEEX=
T) \
> > +-@NATIVE_TRUE@       test_macho$(EXEEXT) test_xcoff_32$(EXEEXT) \
> > +-@NATIVE_TRUE@       test_xcoff_64$(EXEEXT) test_pecoff$(EXEEXT) \
> > +-@NATIVE_TRUE@       test_unknown$(EXEEXT) unittest$(EXEEXT) \
> > +-@NATIVE_TRUE@       unittest_alloc$(EXEEXT) btest$(EXEEXT)
> > +-@HAVE_ELF_TRUE@@NATIVE_TRUE@am__EXEEXT_5 =3D btest_lto$(EXEEXT)
> > +-@NATIVE_TRUE@am__EXEEXT_6 =3D btest_alloc$(EXEEXT) stest$(EXEEXT) \
> > +-@NATIVE_TRUE@       stest_alloc$(EXEEXT)
> > +-@HAVE_ELF_TRUE@@NATIVE_TRUE@am__EXEEXT_7 =3D ztest$(EXEEXT) \
> > +-@HAVE_ELF_TRUE@@NATIVE_TRUE@        ztest_alloc$(EXEEXT)
> > +-@NATIVE_TRUE@am__EXEEXT_8 =3D edtest$(EXEEXT) edtest_alloc$(EXEEXT)
> > +-@HAVE_PTHREAD_TRUE@@NATIVE_TRUE@am__EXEEXT_9 =3D ttest$(EXEEXT) \
> > +-@HAVE_PTHREAD_TRUE@@NATIVE_TRUE@    ttest_alloc$(EXEEXT)
> > +-@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@am__EXEEXT_10 =3D  \
> > +-@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@   ctestg$(EXEEXT) \
> > +-@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@   ctesta$(EXEEXT) \
> > +-@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@   ctestg_alloc$(EXEEXT) \
> > +-@HAVE_COMPRESSED_DEBUG_TRUE@@NATIVE_TRUE@   ctesta_alloc$(EXEEXT)
> > +-@HAVE_DWARF5_TRUE@@NATIVE_TRUE@am__EXEEXT_11 =3D dwarf5$(EXEEXT) \
> > +-@HAVE_DWARF5_TRUE@@NATIVE_TRUE@     dwarf5_alloc$(EXEEXT)
> > +-@NATIVE_TRUE@am__EXEEXT_12 =3D mtest$(EXEEXT)
> > +-@HAVE_ELF_TRUE@am__EXEEXT_13 =3D xztest$(EXEEXT) xztest_alloc$(EXEEXT=
)
> > +-am__EXEEXT_14 =3D $(am__EXEEXT_4) $(am__EXEEXT_5) $(am__EXEEXT_6) \
> > +-    $(am__EXEEXT_7) $(am__EXEEXT_8) $(am__EXEEXT_9) \
> > +-    $(am__EXEEXT_10) $(am__EXEEXT_11) $(am__EXEEXT_12) \
> > +-    $(am__EXEEXT_13)
> > + @NATIVE_TRUE@am_allocfail_OBJECTS =3D allocfail-allocfail.$(OBJEXT) \
> > + @NATIVE_TRUE@       allocfail-testlib.$(OBJEXT)
> > + allocfail_OBJECTS =3D $(am_allocfail_OBJECTS)
> > +@@ -536,7 +536,7 @@ am__v_at_0 =3D @
> > + am__v_at_1 =3D
> > + DEFAULT_INCLUDES =3D -I.@am__isrc@
> > + depcomp =3D
> > +-am__depfiles_maybe =3D
> > ++am__maybe_remake_depfiles =3D
> > + COMPILE =3D $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLA=
GS) \
> > +     $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
> > + LTCOMPILE =3D $(LIBTOOL) $(AM_V_lt) --tag=3DCC $(AM_LIBTOOLFLAGS) \
> > +@@ -579,8 +579,8 @@ am__can_run_installinfo =3D \
> > +     n|no|NO) false;; \
> > +     *) (install-info --version) >/dev/null 2>&1;; \
> > +   esac
> > +-am__tagged_files =3D $(HEADERS) $(SOURCES) $(TAGS_FILES) \
> > +-    $(LISP)config.h.in
> > ++am__tagged_files =3D $(HEADERS) $(SOURCES) $(TAGS_FILES) $(LISP) \
> > ++    config.h.in
> > + # Read a list of newline-separated strings from the standard input,
> > + # and print each of them once, without duplicates.  Input order is
> > + # *not* preserved.
> > +@@ -597,9 +597,6 @@ am__define_uniq_tagged_files =3D \
> > +   unique=3D`for i in $$list; do \
> > +     if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
> > +   done | $(am__uniquify_input)`
> > +-ETAGS =3D etags
> > +-CTAGS =3D ctags
> > +-CSCOPE =3D cscope
> > + AM_RECURSIVE_TARGETS =3D cscope check recheck
> > + am__tty_colors_dummy =3D \
> > +   mgn=3D red=3D grn=3D lgn=3D blu=3D brg=3D std=3D; \
> > +@@ -783,6 +780,7 @@ am__set_TESTS_bases =3D \
> > +   bases=3D'$(TEST_LOGS)'; \
> > +   bases=3D`for i in $$bases; do echo $$i; done | sed 's/\.log$$//'`; =
\
> > +   bases=3D`echo $$bases`
> > ++AM_TESTSUITE_SUMMARY_HEADER =3D ' for $(PACKAGE_STRING)'
> > + RECHECK_LOGS =3D $(TEST_LOGS)
> > + TEST_SUITE_LOG =3D test-suite.log
> > + TEST_EXTENSIONS =3D @EXEEXT@ .test
> > +@@ -825,8 +823,11 @@ CLOCK_GETTIME_LINK =3D @CLOCK_GETTIME_LINK@
> > + COMM =3D @COMM@
> > + CPP =3D @CPP@
> >   CPPFLAGS =3D @CPPFLAGS@
> > ++CSCOPE =3D @CSCOPE@
> > ++CTAGS =3D @CTAGS@
> >   CYGPATH_W =3D @CYGPATH_W@
> >   DEFS =3D @DEFS@
> >  +DLLTOOL =3D @DLLTOOL@
> >   DSYMUTIL =3D @DSYMUTIL@
> >   DUMPBIN =3D @DUMPBIN@
> >   DWZ =3D @DWZ@
> > -@@ -854,6 +855,7 @@ LN_S =3D @LN_S@
> > +@@ -834,6 +835,7 @@ ECHO_C =3D @ECHO_C@
> > + ECHO_N =3D @ECHO_N@
> > + ECHO_T =3D @ECHO_T@
> > + EGREP =3D @EGREP@
> > ++ETAGS =3D @ETAGS@
> > + EXEEXT =3D @EXEEXT@
> > + EXTRA_FLAGS =3D @EXTRA_FLAGS@
> > + FGREP =3D @FGREP@
> > +@@ -854,6 +856,7 @@ LN_S =3D @LN_S@
> >   LTLIBOBJS =3D @LTLIBOBJS@
> >   MAINT =3D @MAINT@
> >   MAKEINFO =3D @MAKEINFO@
> > @@ -15781,7 +15912,7 @@ index 0a61880ba67..5889b0477cd 100644
> >   MKDIR_P =3D @MKDIR_P@
> >   NM =3D @NM@
> >   NMEDIT =3D @NMEDIT@
> > -@@ -886,6 +888,7 @@ abs_builddir =3D @abs_builddir@
> > +@@ -886,6 +889,7 @@ abs_builddir =3D @abs_builddir@
> >   abs_srcdir =3D @abs_srcdir@
> >   abs_top_builddir =3D @abs_top_builddir@
> >   abs_top_srcdir =3D @abs_top_srcdir@
> > @@ -15789,141 +15920,538 @@ index 0a61880ba67..5889b0477cd 100644
> >   ac_ct_CC =3D @ac_ct_CC@
> >   ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
> >   am__leading_dot =3D @am__leading_dot@
> > -diff --git a/libbacktrace/configure b/libbacktrace/configure
> > -index 406b67b8cbc..b648da40aab 100755
> > ---- a/libbacktrace/configure
> > -+++ b/libbacktrace/configure
> > -@@ -680,7 +680,10 @@ OTOOL
> > - LIPO
> > - NMEDIT
> > - DSYMUTIL
> > -+MANIFEST_TOOL
> > -+ac_ct_AR
> > - AR
> > -+DLLTOOL
> > - OBJDUMP
> > - LN_S
> > - NM
> > -@@ -798,6 +801,7 @@ enable_static
> > - with_pic
> > - enable_fast_install
> > - with_gnu_ld
> > -+with_libtool_sysroot
> > - enable_libtool_lock
> > - enable_largefile
> > - enable_cet
> > -@@ -1458,6 +1462,8 @@ Optional Packages:
> > -   --with-pic              try to use only PIC/non-PIC objects [defaul=
t=3Duse
> > -                           both]
> > -   --with-gnu-ld           assume the C compiler uses GNU ld [default=
=3Dno]
> > -+  --with-libtool-sysroot=3DDIR Search for dependent libraries within =
DIR
> > -+                        (or the compiler's sysroot if not specified).
> > -   --with-system-libunwind use installed libunwind
> > +@@ -1178,8 +1182,8 @@ Makefile: $(srcdir)/Makefile.in $(top_builddir)/=
config.status
> > +         echo ' $(SHELL) ./config.status'; \
> > +         $(SHELL) ./config.status;; \
> > +       *) \
> > +-        echo ' cd $(top_builddir) && $(SHELL) ./config.status $@ $(am=
__depfiles_maybe)'; \
> > +-        cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__depfi=
les_maybe);; \
> > ++        echo ' cd $(top_builddir) && $(SHELL) ./config.status $@ $(am=
__maybe_remake_depfiles)'; \
> > ++        cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__maybe=
_remake_depfiles);; \
> > +     esac;
> > + $(top_srcdir)/../multilib.am $(am__empty):
> >
> > - Some influential environment variables:
> > -@@ -5446,8 +5452,8 @@ esac
> > +@@ -1211,6 +1215,15 @@ backtrace-supported.h: $(top_builddir)/config.s=
tatus $(srcdir)/backtrace-support
> > + install-debuginfo-for-buildid.sh: $(top_builddir)/config.status $(src=
dir)/install-debuginfo-for-buildid.sh.in
> > +     cd $(top_builddir) && $(SHELL) ./config.status $@
> >
> > ++clean-checkPROGRAMS:
> > ++    @list=3D'$(check_PROGRAMS)'; test -n "$$list" || exit 0; \
> > ++    echo " rm -f" $$list; \
> > ++    rm -f $$list || exit $$?; \
> > ++    test -n "$(EXEEXT)" || exit 0; \
> > ++    list=3D`for p in $$list; do echo "$$p"; done | sed 's/$(EXEEXT)$$=
//'`; \
> > ++    echo " rm -f" $$list; \
> > ++    rm -f $$list
> > ++
> > + clean-checkLTLIBRARIES:
> > +     -test -z "$(check_LTLIBRARIES)" || rm -f $(check_LTLIBRARIES)
> > +     @list=3D'$(check_LTLIBRARIES)'; \
> > +@@ -1248,15 +1261,6 @@ libbacktrace_instrumented_alloc.la: $(libbacktr=
ace_instrumented_alloc_la_OBJECTS
> > + libbacktrace_noformat.la: $(libbacktrace_noformat_la_OBJECTS) $(libba=
cktrace_noformat_la_DEPENDENCIES) $(EXTRA_libbacktrace_noformat_la_DEPENDEN=
CIES)
> > +     $(AM_V_CCLD)$(LINK) $(am_libbacktrace_noformat_la_rpath) $(libbac=
ktrace_noformat_la_OBJECTS) $(libbacktrace_noformat_la_LIBADD) $(LIBS)
> >
> > +-clean-checkPROGRAMS:
> > +-    @list=3D'$(check_PROGRAMS)'; test -n "$$list" || exit 0; \
> > +-    echo " rm -f" $$list; \
> > +-    rm -f $$list || exit $$?; \
> > +-    test -n "$(EXEEXT)" || exit 0; \
> > +-    list=3D`for p in $$list; do echo "$$p"; done | sed 's/$(EXEEXT)$$=
//'`; \
> > +-    echo " rm -f" $$list; \
> > +-    rm -f $$list
> > +-
> > + allocfail$(EXEEXT): $(allocfail_OBJECTS) $(allocfail_DEPENDENCIES) $(=
EXTRA_allocfail_DEPENDENCIES)
> > +     @rm -f allocfail$(EXEEXT)
> > +     $(AM_V_CCLD)$(allocfail_LINK) $(allocfail_OBJECTS) $(allocfail_LD=
ADD) $(LIBS)
> > +@@ -1959,7 +1963,7 @@ $(TEST_SUITE_LOG): $(TEST_LOGS)
> > +       test x"$$VERBOSE" =3D x || cat $(TEST_SUITE_LOG);              =
 \
> > +     fi;                                                             \
> > +     echo "$${col}$$br$${std}";                                      \
> > +-    echo "$${col}Testsuite summary for $(PACKAGE_STRING)$${std}";   \
> > ++    echo "$${col}Testsuite summary"$(AM_TESTSUITE_SUMMARY_HEADER)"$${=
std}"; \
> > +     echo "$${col}$$br$${std}";                                      \
> > +     create_testsuite_report --maybe-color;                          \
> > +     echo "$$col$$br$$std";                                          \
> > +@@ -1972,7 +1976,7 @@ $(TEST_SUITE_LOG): $(TEST_LOGS)
> > +     fi;                                                             \
> > +     $$success || exit 1
> > +
> > +-check-TESTS:
> > ++check-TESTS: $(check_PROGRAMS) $(check_LTLIBRARIES) $(check_DATA)
> > +     @list=3D'$(RECHECK_LOGS)';           test -z "$$list" || rm -f $$=
list
> > +     @list=3D'$(RECHECK_LOGS:.log=3D.trs)'; test -z "$$list" || rm -f =
$$list
> > +     @test -z "$(TEST_SUITE_LOG)" || rm -f $(TEST_SUITE_LOG)
> > +@@ -1982,7 +1986,7 @@ check-TESTS:
> > +     log_list=3D`echo $$log_list`; trs_list=3D`echo $$trs_list`; \
> > +     $(MAKE) $(AM_MAKEFLAGS) $(TEST_SUITE_LOG) TEST_LOGS=3D"$$log_list=
"; \
> > +     exit $$?;
> > +-recheck: all $(check_LTLIBRARIES) $(check_PROGRAMS) $(check_DATA)
> > ++recheck: all $(check_PROGRAMS) $(check_LTLIBRARIES) $(check_DATA)
> > +     @test -z "$(TEST_SUITE_LOG)" || rm -f $(TEST_SUITE_LOG)
> > +     @set +e; $(am__set_TESTS_bases); \
> > +     bases=3D`for i in $$bases; do echo $$i; done \
> > +@@ -2260,7 +2264,7 @@ xztest_alloc.log: xztest_alloc$(EXEEXT)
> > + @am__EXEEXT_TRUE@   $(am__common_driver_flags) $(AM_TEST_LOG_DRIVER_F=
LAGS) $(TEST_LOG_DRIVER_FLAGS) -- $(TEST_LOG_COMPILE) \
> > + @am__EXEEXT_TRUE@   "$$tst" $(AM_TESTS_FD_REDIRECT)
> > + check-am: all-am
> > +-    $(MAKE) $(AM_MAKEFLAGS) $(check_LTLIBRARIES) $(check_PROGRAMS) \
> > ++    $(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS) $(check_LTLIBRARIES) \
> > +       $(check_DATA)
> > +     $(MAKE) $(AM_MAKEFLAGS) check-TESTS
> > + check: check-am
> > +diff --git a/libbacktrace/aclocal.m4 b/libbacktrace/aclocal.m4
> > +index 528e6173930..d88a5ec84f2 100644
> > +--- a/libbacktrace/aclocal.m4
> > ++++ b/libbacktrace/aclocal.m4
> > +@@ -1,6 +1,6 @@
> > +-# generated automatically by aclocal 1.15.1 -*- Autoconf -*-
> > ++# generated automatically by aclocal 1.16.5 -*- Autoconf -*-
> >
> > --macro_version=3D'2.2.7a'
> > --macro_revision=3D'1.3134'
> > -+macro_version=3D'2.4'
> > -+macro_revision=3D'1.3293'
> > +-# Copyright (C) 1996-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 1996-2021 Free Software Foundation, Inc.
> >
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -20,7 +20,7 @@ You have another version of autoconf.  It may work, =
but is not guaranteed to.
> > + If you have problems, you may need to regenerate the build system ent=
irely.
> > + To do so, use the procedure documented by the package, typically 'aut=
oreconf'.])])
> >
> > +-# Copyright (C) 2002-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 2002-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -32,10 +32,10 @@ To do so, use the procedure documented by the pack=
age, typically 'autoreconf'.])
> > + # generated from the m4 files accompanying Automake X.Y.
> > + # (This private macro should not be called outside this file.)
> > + AC_DEFUN([AM_AUTOMAKE_VERSION],
> > +-[am__api_version=3D'1.15'
> > ++[am__api_version=3D'1.16'
> > + dnl Some users find AM_AUTOMAKE_VERSION and mistake it for a way to
> > + dnl require some minimum version.  Point them to the right macro.
> > +-m4_if([$1], [1.15.1], [],
> > ++m4_if([$1], [1.16.5], [],
> > +       [AC_FATAL([Do not call $0, use AM_INIT_AUTOMAKE([$1]).])])dnl
> > + ])
> >
> > -@@ -5487,7 +5493,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > - { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print string=
s" >&5
> > - $as_echo_n "checking how to print strings... " >&6; }
> > - # Test print first, because it will be a builtin if present.
> > --if test "X`print -r -- -n 2>/dev/null`" =3D X-n && \
> > -+if test "X`( print -r -- -n ) 2>/dev/null`" =3D X-n && \
> > -    test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -   ECHO=3D'print -r --'
> > - elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -@@ -6180,8 +6186,8 @@ $as_echo_n "checking whether the shell understan=
ds some XSI constructs... " >&6;
> > - # Try some XSI features
> > - xsi_shell=3Dno
> > - ( _lt_dummy=3D"a/b/c"
> > --  test "${_lt_dummy##*/},${_lt_dummy%/*},"${_lt_dummy%"$_lt_dummy"}, =
\
> > --      =3D c,a/b,, \
> > -+  test "${_lt_dummy##*/},${_lt_dummy%/*},${_lt_dummy#??}"${_lt_dummy%=
"$_lt_dummy"}, \
> > -+      =3D c,a/b,b/c, \
> > -     && eval 'test $(( 1 + 1 )) -eq 2 \
> > -     && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> > -   && xsi_shell=3Dyes
> > -@@ -6230,6 +6236,80 @@ esac
> > +@@ -51,14 +51,14 @@ m4_define([_AM_AUTOCONF_VERSION], [])
> > + # Call AM_AUTOMAKE_VERSION and AM_AUTOMAKE_VERSION so they can be tra=
ced.
> > + # This function is AC_REQUIREd by AM_INIT_AUTOMAKE.
> > + AC_DEFUN([AM_SET_CURRENT_AUTOMAKE_VERSION],
> > +-[AM_AUTOMAKE_VERSION([1.15.1])dnl
> > ++[AM_AUTOMAKE_VERSION([1.16.5])dnl
> > + m4_ifndef([AC_AUTOCONF_VERSION],
> > +   [m4_copy([m4_PACKAGE_VERSION], [AC_AUTOCONF_VERSION])])dnl
> > + _AM_AUTOCONF_VERSION(m4_defn([AC_AUTOCONF_VERSION]))])
> >
> > + # AM_AUX_DIR_EXPAND                                         -*- Autoc=
onf -*-
> >
> > +-# Copyright (C) 2001-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 2001-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -110,7 +110,7 @@ am_aux_dir=3D`cd "$ac_aux_dir" && pwd`
> >
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $bui=
ld file names to $host format" >&5
> > -+$as_echo_n "checking how to convert $build file names to $host format=
... " >&6; }
> > -+if ${lt_cv_to_host_file_cmd+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  case $host in
> > -+  *-*-mingw* )
> > -+    case $build in
> > -+      *-*-mingw* ) # actually msys
> > -+        lt_cv_to_host_file_cmd=3Dfunc_convert_file_msys_to_w32
> > -+        ;;
> > -+      *-*-cygwin* )
> > -+        lt_cv_to_host_file_cmd=3Dfunc_convert_file_cygwin_to_w32
> > -+        ;;
> > -+      * ) # otherwise, assume *nix
> > -+        lt_cv_to_host_file_cmd=3Dfunc_convert_file_nix_to_w32
> > -+        ;;
> > -+    esac
> > -+    ;;
> > -+  *-*-cygwin* )
> > -+    case $build in
> > -+      *-*-mingw* ) # actually msys
> > -+        lt_cv_to_host_file_cmd=3Dfunc_convert_file_msys_to_cygwin
> > -+        ;;
> > -+      *-*-cygwin* )
> > -+        lt_cv_to_host_file_cmd=3Dfunc_convert_file_noop
> > -+        ;;
> > -+      * ) # otherwise, assume *nix
> > -+        lt_cv_to_host_file_cmd=3Dfunc_convert_file_nix_to_cygwin
> > -+        ;;
> > -+    esac
> > -+    ;;
> > -+  * ) # unhandled hosts (and "normal" native builds)
> > -+    lt_cv_to_host_file_cmd=3Dfunc_convert_file_noop
> > -+    ;;
> > -+esac
> > -+
> > + # AM_CONDITIONAL                                            -*- Autoc=
onf -*-
> > +
> > +-# Copyright (C) 1997-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 1997-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -143,7 +143,7 @@ fi])])
> > +
> > + # Do all the work for Automake.                             -*- Autoc=
onf -*-
> > +
> > +-# Copyright (C) 1996-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 1996-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -171,6 +171,10 @@ m4_defn([AC_PROG_CC])
> > + # release and drop the old call support.
> > + AC_DEFUN([AM_INIT_AUTOMAKE],
> > + [AC_PREREQ([2.65])dnl
> > ++m4_ifdef([_$0_ALREADY_INIT],
> > ++  [m4_fatal([$0 expanded multiple times
> > ++]m4_defn([_$0_ALREADY_INIT]))],
> > ++  [m4_define([_$0_ALREADY_INIT], m4_expansion_stack)])dnl
> > + dnl Autoconf wants to disallow AM_ names.  We explicitly allow
> > + dnl the ones we care about.
> > + m4_pattern_allow([^AM_[A-Z]+FLAGS$])dnl
> > +@@ -207,7 +211,7 @@ m4_ifval([$3], [_AM_SET_OPTION([no-define])])dnl
> > + [_AM_SET_OPTIONS([$1])dnl
> > + dnl Diagnose old-style AC_INIT with new-style AM_AUTOMAKE_INIT.
> > + m4_if(
> > +-  m4_ifdef([AC_PACKAGE_NAME], [ok]):m4_ifdef([AC_PACKAGE_VERSION], [o=
k]),
> > ++  m4_ifset([AC_PACKAGE_NAME], [ok]):m4_ifset([AC_PACKAGE_VERSION], [o=
k]),
> > +   [ok:ok],,
> > +   [m4_fatal([AC_INIT should be called with package and version argume=
nts])])dnl
> > +  AC_SUBST([PACKAGE], ['AC_PACKAGE_TARNAME'])dnl
> > +@@ -230,8 +234,8 @@ AC_REQUIRE([AM_PROG_INSTALL_STRIP])dnl
> > + AC_REQUIRE([AC_PROG_MKDIR_P])dnl
> > + # For better backward compatibility.  To be removed once Automake 1.9=
.x
> > + # dies out for good.  For more background, see:
> > +-# <http://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
> > +-# <http://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
> > ++# <https://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
> > ++# <https://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
> > + AC_SUBST([mkdir_p], ['$(MKDIR_P)'])
> > + # We need awk for the "check" target (and possibly the TAP driver).  =
The
> > + # system "awk" is bad on some platforms.
> > +@@ -259,6 +263,20 @@ AC_PROVIDE_IFELSE([AC_PROG_OBJCXX],
> > +               [m4_define([AC_PROG_OBJCXX],
> > +                          m4_defn([AC_PROG_OBJCXX])[_AM_DEPENDENCIES([=
OBJCXX])])])dnl
> > + ])
> > ++# Variables for tags utilities; see am/tags.am
> > ++if test -z "$CTAGS"; then
> > ++  CTAGS=3Dctags
> >  +fi
> > ++AC_SUBST([CTAGS])
> > ++if test -z "$ETAGS"; then
> > ++  ETAGS=3Detags
> > ++fi
> > ++AC_SUBST([ETAGS])
> > ++if test -z "$CSCOPE"; then
> > ++  CSCOPE=3Dcscope
> > ++fi
> > ++AC_SUBST([CSCOPE])
> >  +
> > -+to_host_file_cmd=3D$lt_cv_to_host_file_cmd
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_host_file_=
cmd" >&5
> > -+$as_echo "$lt_cv_to_host_file_cmd" >&6; }
> > -+
> > -+
> > + AC_REQUIRE([AM_SILENT_RULES])dnl
> > + dnl The testsuite driver may need to know about EXEEXT, so add the
> > + dnl 'am__EXEEXT' conditional if _AM_COMPILER_EXEEXT was seen.  This
> > +@@ -298,7 +316,7 @@ END
> > + Aborting the configuration process, to ensure you take notice of the =
issue.
> > +
> > + You can download and install GNU coreutils to get an 'rm' implementat=
ion
> > +-that behaves properly: <http://www.gnu.org/software/coreutils/>.
> > ++that behaves properly: <https://www.gnu.org/software/coreutils/>.
> > +
> > + If you want to complete the configuration process using your problema=
tic
> > + 'rm' anyway, export the environment variable ACCEPT_INFERIOR_RM_PROGR=
AM
> > +@@ -340,7 +358,7 @@ for _am_header in $config_headers :; do
> > + done
> > + echo "timestamp for $_am_arg" >`AS_DIRNAME(["$_am_arg"])`/stamp-h[]$_=
am_stamp_count])
> > +
> > +-# Copyright (C) 2001-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 2001-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -364,7 +382,7 @@ AC_SUBST([install_sh])])
> > + # Add --enable-maintainer-mode option to configure.         -*- Autoc=
onf -*-
> > + # From Jim Meyering
> > +
> > +-# Copyright (C) 1996-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 1996-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -399,7 +417,7 @@ AC_MSG_CHECKING([whether to enable maintainer-spec=
ific portions of Makefiles])
> > +
> > + # Fake the existence of programs that GNU maintainers use.  -*- Autoc=
onf -*-
> > +
> > +-# Copyright (C) 1997-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 1997-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -420,12 +438,7 @@ AC_DEFUN([AM_MISSING_HAS_RUN],
> > + [AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
> > + AC_REQUIRE_AUX_FILE([missing])dnl
> > + if test x"${MISSING+set}" !=3D xset; then
> > +-  case $am_aux_dir in
> > +-  *\ * | *\ *)
> > +-    MISSING=3D"\${SHELL} \"$am_aux_dir/missing\"" ;;
> > +-  *)
> > +-    MISSING=3D"\${SHELL} $am_aux_dir/missing" ;;
> > +-  esac
> > ++  MISSING=3D"\${SHELL} '$am_aux_dir/missing'"
> > + fi
> > + # Use eval to expand $SHELL
> > + if eval "$MISSING --is-lightweight"; then
> > +@@ -438,7 +451,7 @@ fi
> > +
> > + # Helper functions for option handling.                     -*- Autoc=
onf -*-
> > +
> > +-# Copyright (C) 2001-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 2001-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -467,7 +480,7 @@ AC_DEFUN([_AM_SET_OPTIONS],
> > + AC_DEFUN([_AM_IF_OPTION],
> > + [m4_ifset(_AM_MANGLE_OPTION([$1]), [$2], [$3])])
> > +
> > +-# Copyright (C) 1999-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 1999-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -514,7 +527,7 @@ AC_LANG_POP([C])])
> > + # For backward compatibility.
> > + AC_DEFUN_ONCE([AM_PROG_CC_C_O], [AC_REQUIRE([AC_PROG_CC])])
> > +
> > +-# Copyright (C) 2001-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 2001-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -533,7 +546,7 @@ AC_DEFUN([AM_RUN_LOG],
> > +
> > + # Check to make sure that the build environment is sane.    -*- Autoc=
onf -*-
> > +
> > +-# Copyright (C) 1996-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 1996-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -614,7 +627,7 @@ AC_CONFIG_COMMANDS_PRE(
> > + rm -f conftest.file
> > + ])
> > +
> > +-# Copyright (C) 2009-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 2009-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -674,7 +687,7 @@ AC_SUBST([AM_BACKSLASH])dnl
> > + _AM_SUBST_NOTMAKE([AM_BACKSLASH])dnl
> > + ])
> > +
> > +-# Copyright (C) 2001-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 2001-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -702,7 +715,7 @@ fi
> > + INSTALL_STRIP_PROGRAM=3D"\$(install_sh) -c -s"
> > + AC_SUBST([INSTALL_STRIP_PROGRAM])])
> > +
> > +-# Copyright (C) 2006-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 2006-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +@@ -721,7 +734,7 @@ AC_DEFUN([AM_SUBST_NOTMAKE], [_AM_SUBST_NOTMAKE($@=
)])
> > +
> > + # Check how to create a tarball.                            -*- Autoc=
onf -*-
> > +
> > +-# Copyright (C) 2004-2017 Free Software Foundation, Inc.
> > ++# Copyright (C) 2004-2021 Free Software Foundation, Inc.
> > + #
> > + # This file is free software; the Free Software Foundation
> > + # gives unlimited permission to copy and/or distribute it,
> > +diff --git a/libbacktrace/configure b/libbacktrace/configure
> > +index 406b67b8cbc..51f0a264cb7 100755
> > +--- a/libbacktrace/configure
> > ++++ b/libbacktrace/configure
> > +@@ -680,7 +680,10 @@ OTOOL
> > + LIPO
> > + NMEDIT
> > + DSYMUTIL
> > ++MANIFEST_TOOL
> > ++ac_ct_AR
> > + AR
> > ++DLLTOOL
> > + OBJDUMP
> > + LN_S
> > + NM
> > +@@ -701,6 +704,9 @@ AM_BACKSLASH
> > + AM_DEFAULT_VERBOSITY
> > + AM_DEFAULT_V
> > + AM_V
> > ++CSCOPE
> > ++ETAGS
> > ++CTAGS
> > + am__untar
> > + am__tar
> > + AMTAR
> > +@@ -798,6 +804,7 @@ enable_static
> > + with_pic
> > + enable_fast_install
> > + with_gnu_ld
> > ++with_libtool_sysroot
> > + enable_libtool_lock
> > + enable_largefile
> > + enable_cet
> > +@@ -1458,6 +1465,8 @@ Optional Packages:
> > +   --with-pic              try to use only PIC/non-PIC objects [defaul=
t=3Duse
> > +                           both]
> > +   --with-gnu-ld           assume the C compiler uses GNU ld [default=
=3Dno]
> > ++  --with-libtool-sysroot=3DDIR Search for dependent libraries within =
DIR
> > ++                        (or the compiler's sysroot if not specified).
> > +   --with-system-libunwind use installed libunwind
> > +
> > + Some influential environment variables:
> > +@@ -4047,7 +4056,7 @@ libtool_VERSION=3D1:0:0
> > + # -Wall: Issue all automake warnings.
> > + # -Wno-portability: Don't warn about constructs supported by GNU make=
.
> > + #    (because GCC requires GNU make anyhow).
> > +-am__api_version=3D'1.15'
> > ++am__api_version=3D'1.16'
> > +
> > + # Find a good install program.  We prefer a C program (faster),
> > + # so one script is as good as another.  But avoid the broken or
> > +@@ -4220,12 +4229,7 @@ ac_script=3D's/[\\$]/&&/g;s/;s,x,x,$//'
> > + program_transform_name=3D`$as_echo "$program_transform_name" | sed "$=
ac_script"`
> > +
> > + if test x"${MISSING+set}" !=3D xset; then
> > +-  case $am_aux_dir in
> > +-  *\ * | *\ *)
> > +-    MISSING=3D"\${SHELL} \"$am_aux_dir/missing\"" ;;
> > +-  *)
> > +-    MISSING=3D"\${SHELL} $am_aux_dir/missing" ;;
> > +-  esac
> > ++  MISSING=3D"\${SHELL} '$am_aux_dir/missing'"
> > + fi
> > + # Use eval to expand $SHELL
> > + if eval "$MISSING --is-lightweight"; then
> > +@@ -4551,8 +4555,8 @@ MAKEINFO=3D${MAKEINFO-"${am_missing_run}makeinfo=
"}
> > +
> > + # For better backward compatibility.  To be removed once Automake 1.9=
.x
> > + # dies out for good.  For more background, see:
> > +-# <http://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
> > +-# <http://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
> > ++# <https://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
> > ++# <https://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
> > + mkdir_p=3D'$(MKDIR_P)'
> > +
> > + # We need awk for the "check" target (and possibly the TAP driver).  =
The
> > +@@ -4571,6 +4575,20 @@ am__tar=3D'$${TAR-tar} chof - "$$tardir"' am__u=
ntar=3D'$${TAR-tar} xf -'
> > +
> > +
> > +
> > ++# Variables for tags utilities; see am/tags.am
> > ++if test -z "$CTAGS"; then
> > ++  CTAGS=3Dctags
> > ++fi
> >  +
> > ++if test -z "$ETAGS"; then
> > ++  ETAGS=3Detags
> > ++fi
> >  +
> > ++if test -z "$CSCOPE"; then
> > ++  CSCOPE=3Dcscope
> > ++fi
> >  +
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $bui=
ld file names to toolchain format" >&5
> > -+$as_echo_n "checking how to convert $build file names to toolchain fo=
rmat... " >&6; }
> > -+if ${lt_cv_to_tool_file_cmd+:} false; then :
> > ++
> > +
> > + # POSIX will say in a future version that running "rm -f" with no arg=
ument
> > + # is OK; and we want to be able to make that assumption in our Makefi=
le
> > +@@ -4603,7 +4621,7 @@ END
> > + Aborting the configuration process, to ensure you take notice of the =
issue.
> > +
> > + You can download and install GNU coreutils to get an 'rm' implementat=
ion
> > +-that behaves properly: <http://www.gnu.org/software/coreutils/>.
> > ++that behaves properly: <https://www.gnu.org/software/coreutils/>.
> > +
> > + If you want to complete the configuration process using your problema=
tic
> > + 'rm' anyway, export the environment variable ACCEPT_INFERIOR_RM_PROGR=
AM
> > +@@ -5446,8 +5464,8 @@ esac
> > +
> > +
> > +
> > +-macro_version=3D'2.2.7a'
> > +-macro_revision=3D'1.3134'
> > ++macro_version=3D'2.4'
> > ++macro_revision=3D'1.3293'
> > +
> > +
> > +
> > +@@ -5487,7 +5505,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > + { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print string=
s" >&5
> > + $as_echo_n "checking how to print strings... " >&6; }
> > + # Test print first, because it will be a builtin if present.
> > +-if test "X`print -r -- -n 2>/dev/null`" =3D X-n && \
> > ++if test "X`( print -r -- -n ) 2>/dev/null`" =3D X-n && \
> > +    test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > +   ECHO=3D'print -r --'
> > + elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > +@@ -6180,8 +6198,8 @@ $as_echo_n "checking whether the shell understan=
ds some XSI constructs... " >&6;
> > + # Try some XSI features
> > + xsi_shell=3Dno
> > + ( _lt_dummy=3D"a/b/c"
> > +-  test "${_lt_dummy##*/},${_lt_dummy%/*},"${_lt_dummy%"$_lt_dummy"}, =
\
> > +-      =3D c,a/b,, \
> > ++  test "${_lt_dummy##*/},${_lt_dummy%/*},${_lt_dummy#??}"${_lt_dummy%=
"$_lt_dummy"}, \
> > ++      =3D c,a/b,b/c, \
> > +     && eval 'test $(( 1 + 1 )) -eq 2 \
> > +     && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> > +   && xsi_shell=3Dyes
> > +@@ -6230,6 +6248,80 @@ esac
> > +
> > +
> > +
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $bui=
ld file names to $host format" >&5
> > ++$as_echo_n "checking how to convert $build file names to $host format=
... " >&6; }
> > ++if ${lt_cv_to_host_file_cmd+:} false; then :
> >  +  $as_echo_n "(cached) " >&6
> >  +else
> > -+  #assume ordinary cross tools, or native build.
> > -+lt_cv_to_tool_file_cmd=3Dfunc_convert_file_noop
> > -+case $host in
> > ++  case $host in
> >  +  *-*-mingw* )
> >  +    case $build in
> >  +      *-*-mingw* ) # actually msys
> > -+        lt_cv_to_tool_file_cmd=3Dfunc_convert_file_msys_to_w32
> > ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_msys_to_w32
> > ++        ;;
> > ++      *-*-cygwin* )
> > ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_cygwin_to_w32
> > ++        ;;
> > ++      * ) # otherwise, assume *nix
> > ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_nix_to_w32
> >  +        ;;
> >  +    esac
> >  +    ;;
> > -+esac
> > -+
> > -+fi
> > -+
> > -+to_tool_file_cmd=3D$lt_cv_to_tool_file_cmd
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_tool_file_=
cmd" >&5
> > ++  *-*-cygwin* )
> > ++    case $build in
> > ++      *-*-mingw* ) # actually msys
> > ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_msys_to_cygwin
> > ++        ;;
> > ++      *-*-cygwin* )
> > ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_noop
> > ++        ;;
> > ++      * ) # otherwise, assume *nix
> > ++        lt_cv_to_host_file_cmd=3Dfunc_convert_file_nix_to_cygwin
> > ++        ;;
> > ++    esac
> > ++    ;;
> > ++  * ) # unhandled hosts (and "normal" native builds)
> > ++    lt_cv_to_host_file_cmd=3Dfunc_convert_file_noop
> > ++    ;;
> > ++esac
> > ++
> > ++fi
> > ++
> > ++to_host_file_cmd=3D$lt_cv_to_host_file_cmd
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_host_file_=
cmd" >&5
> > ++$as_echo "$lt_cv_to_host_file_cmd" >&6; }
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $bui=
ld file names to toolchain format" >&5
> > ++$as_echo_n "checking how to convert $build file names to toolchain fo=
rmat... " >&6; }
> > ++if ${lt_cv_to_tool_file_cmd+:} false; then :
> > ++  $as_echo_n "(cached) " >&6
> > ++else
> > ++  #assume ordinary cross tools, or native build.
> > ++lt_cv_to_tool_file_cmd=3Dfunc_convert_file_noop
> > ++case $host in
> > ++  *-*-mingw* )
> > ++    case $build in
> > ++      *-*-mingw* ) # actually msys
> > ++        lt_cv_to_tool_file_cmd=3Dfunc_convert_file_msys_to_w32
> > ++        ;;
> > ++    esac
> > ++    ;;
> > ++esac
> > ++
> > ++fi
> > ++
> > ++to_tool_file_cmd=3D$lt_cv_to_tool_file_cmd
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_tool_file_=
cmd" >&5
> >  +$as_echo "$lt_cv_to_tool_file_cmd" >&6; }
> >  +
> >  +
> > @@ -15933,7 +16461,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to r=
eload object files" >&5
> >   $as_echo_n "checking for $LD option to reload object files... " >&6; =
}
> >   if ${lt_cv_ld_reload_flag+:} false; then :
> > -@@ -6246,6 +6326,11 @@ case $reload_flag in
> > +@@ -6246,6 +6338,11 @@ case $reload_flag in
> >   esac
> >   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> >   case $host_os in
> > @@ -15945,7 +16473,7 @@ index 406b67b8cbc..b648da40aab 100755
> >     darwin*)
> >       if test "$GCC" =3D yes; then
> >         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$rel=
oad_objs'
> > -@@ -6414,7 +6499,8 @@ mingw* | pw32*)
> > +@@ -6414,7 +6511,8 @@ mingw* | pw32*)
> >       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86=
 DLL'
> >       lt_cv_file_magic_cmd=3D'func_win32_libid'
> >     else
> > @@ -15955,7 +16483,7 @@ index 406b67b8cbc..b648da40aab 100755
> >       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> >     fi
> >     ;;
> > -@@ -6568,6 +6654,21 @@ esac
> > +@@ -6568,6 +6666,21 @@ esac
> >   fi
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check=
_method" >&5
> >   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> > @@ -15977,7 +16505,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   file_magic_cmd=3D$lt_cv_file_magic_cmd
> >   deplibs_check_method=3D$lt_cv_deplibs_check_method
> >   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> > -@@ -6583,6 +6684,157 @@ test -z "$deplibs_check_method" && deplibs_che=
ck_method=3Dunknown
> > +@@ -6583,6 +6696,157 @@ test -z "$deplibs_check_method" && deplibs_che=
ck_method=3Dunknown
> >
> >
> >
> > @@ -16135,7 +16663,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   plugin_option=3D
> >   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.=
dll"
> >   for plugin in $plugin_names; do
> > -@@ -6597,8 +6849,10 @@ for plugin in $plugin_names; do
> > +@@ -6597,8 +6861,10 @@ for plugin in $plugin_names; do
> >   done
> >
> >   if test -n "$ac_tool_prefix"; then
> > @@ -16148,7 +16676,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_AR+:} false; then :
> > -@@ -6614,7 +6868,7 @@ do
> > +@@ -6614,7 +6880,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -16157,7 +16685,7 @@ index 406b67b8cbc..b648da40aab 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -6634,11 +6888,15 @@ $as_echo "no" >&6; }
> > +@@ -6634,11 +6900,15 @@ $as_echo "no" >&6; }
> >   fi
> >
> >
> > @@ -16176,7 +16704,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> > -@@ -6654,7 +6912,7 @@ do
> > +@@ -6654,7 +6924,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -16185,7 +16713,7 @@ index 406b67b8cbc..b648da40aab 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -6673,6 +6931,10 @@ else
> > +@@ -6673,6 +6943,10 @@ else
> >   $as_echo "no" >&6; }
> >   fi
> >
> > @@ -16196,7 +16724,7 @@ index 406b67b8cbc..b648da40aab 100755
> >     if test "x$ac_ct_AR" =3D x; then
> >       AR=3D"false"
> >     else
> > -@@ -6684,25 +6946,19 @@ ac_tool_warned=3Dyes ;;
> > +@@ -6684,31 +6958,83 @@ ac_tool_warned=3Dyes ;;
> >   esac
> >       AR=3D$ac_ct_AR
> >     fi
> > @@ -16228,10 +16756,14 @@ index 406b67b8cbc..b648da40aab 100755
> >  +  rm -f conftest.*
> >  +: ${AR=3Dar}
> >  +: ${AR_FLAGS=3Dcru}
> > ++
> > ++
> > ++
> > ++
> > ++
> >
> >
> >
> > -@@ -6714,6 +6970,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> >
> >
> >
> > @@ -16288,15 +16820,10 @@ index 406b67b8cbc..b648da40aab 100755
> >  +fi
> >  +
> >  +
> > -+
> > -+
> > -+
> > -+
> > -+
> > - if test -n "$ac_tool_prefix"; then
> > -   # Extract the first word of "${ac_tool_prefix}strip", so it can be =
a program name with args.
> > - set dummy ${ac_tool_prefix}strip; ac_word=3D$2
> > -@@ -7053,8 +7367,8 @@ esac
> > +
> > +
> > +
> > +@@ -7053,8 +7379,8 @@ esac
> >   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern=
 int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> >
> >   # Transform an extracted symbol line into symbol name and symbol addr=
ess
> > @@ -16307,7 +16834,7 @@ index 406b67b8cbc..b648da40aab 100755
> >
> >   # Handle CRLF in mingw tool chain
> >   opt_cr=3D
> > -@@ -7090,6 +7404,7 @@ for ac_symprfx in "" "_"; do
> > +@@ -7090,6 +7416,7 @@ for ac_symprfx in "" "_"; do
> >     else
> >       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[  ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> >     fi
> > @@ -16315,7 +16842,7 @@ index 406b67b8cbc..b648da40aab 100755
> >
> >     # Check to see that the pipe works correctly.
> >     pipe_works=3Dno
> > -@@ -7131,6 +7446,18 @@ _LT_EOF
> > +@@ -7131,6 +7458,18 @@ _LT_EOF
> >         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> >       if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> >         cat <<_LT_EOF > conftest.$ac_ext
> > @@ -16334,7 +16861,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   #ifdef __cplusplus
> >   extern "C" {
> >   #endif
> > -@@ -7142,7 +7469,7 @@ _LT_EOF
> > +@@ -7142,7 +7481,7 @@ _LT_EOF
> >         cat <<_LT_EOF >> conftest.$ac_ext
> >
> >   /* The mapping between symbol names and symbols.  */
> > @@ -16343,7 +16870,7 @@ index 406b67b8cbc..b648da40aab 100755
> >     const char *name;
> >     void       *address;
> >   }
> > -@@ -7168,8 +7495,8 @@ static const void *lt_preloaded_setup() {
> > +@@ -7168,8 +7507,8 @@ static const void *lt_preloaded_setup() {
> >   _LT_EOF
> >         # Now try linking the two files.
> >         mv conftest.$ac_objext conftstm.$ac_objext
> > @@ -16354,7 +16881,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         LIBS=3D"conftstm.$ac_objext"
> >         CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> >         if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> > -@@ -7179,8 +7506,8 @@ _LT_EOF
> > +@@ -7179,8 +7518,8 @@ _LT_EOF
> >     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> >           pipe_works=3Dyes
> >         fi
> > @@ -16365,7 +16892,7 @@ index 406b67b8cbc..b648da40aab 100755
> >       else
> >         echo "cannot find nm_test_func in $nlist" >&5
> >       fi
> > -@@ -7217,6 +7544,18 @@ else
> > +@@ -7217,6 +7556,18 @@ else
> >   $as_echo "ok" >&6; }
> >   fi
> >
> > @@ -16384,7 +16911,7 @@ index 406b67b8cbc..b648da40aab 100755
> >
> >
> >
> > -@@ -7233,6 +7572,43 @@ fi
> > +@@ -7233,6 +7584,43 @@ fi
> >
> >
> >
> > @@ -16428,10 +16955,56 @@ index 406b67b8cbc..b648da40aab 100755
> >
> >
> >
> > -@@ -7444,6 +7820,123 @@ esac
> > -
> > - need_locks=3D"$enable_libtool_lock"
> > -
> > +@@ -7399,50 +7787,167 @@ _ACEOF
> > + if ac_fn_c_try_link "$LINENO"; then :
> > +   lt_cv_cc_needs_belf=3Dyes
> > + else
> > +-  lt_cv_cc_needs_belf=3Dno
> > ++  lt_cv_cc_needs_belf=3Dno
> > ++fi
> > ++rm -f core conftest.err conftest.$ac_objext \
> > ++    conftest$ac_exeext conftest.$ac_ext
> > ++     ac_ext=3Dc
> > ++ac_cpp=3D'$CPP $CPPFLAGS'
> > ++ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
> > ++ac_link=3D'$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conft=
est.$ac_ext $LIBS >&5'
> > ++ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
> > ++
> > ++fi
> > ++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_cc_needs_belf=
" >&5
> > ++$as_echo "$lt_cv_cc_needs_belf" >&6; }
> > ++  if test x"$lt_cv_cc_needs_belf" !=3D x"yes"; then
> > ++    # this is probably gcc 2.8.0, egcs 1.0 or newer; no need for -bel=
f
> > ++    CFLAGS=3D"$SAVE_CFLAGS"
> > ++  fi
> > ++  ;;
> > ++sparc*-*solaris*)
> > ++  # Find out which ABI we are using.
> > ++  echo 'int i;' > conftest.$ac_ext
> > ++  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\"=
"; } >&5
> > ++  (eval $ac_compile) 2>&5
> > ++  ac_status=3D$?
> > ++  $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> > ++  test $ac_status =3D 0; }; then
> > ++    case `/usr/bin/file conftest.o` in
> > ++    *64-bit*)
> > ++      case $lt_cv_prog_gnu_ld in
> > ++      yes*) LD=3D"${LD-ld} -m elf64_sparc" ;;
> > ++      *)
> > ++    if ${LD-ld} -64 -r -o conftest2.o conftest.o >/dev/null 2>&1; the=
n
> > ++      LD=3D"${LD-ld} -64"
> > ++    fi
> > ++    ;;
> > ++      esac
> > ++      ;;
> > ++    esac
> > ++  fi
> > ++  rm -rf conftest*
> > ++  ;;
> > ++esac
> > ++
> > ++need_locks=3D"$enable_libtool_lock"
> > ++
> >  +if test -n "$ac_tool_prefix"; then
> >  +  # Extract the first word of "${ac_tool_prefix}mt", so it can be a p=
rogram name with args.
> >  +set dummy ${ac_tool_prefix}mt; ac_word=3D$2
> > @@ -16507,8 +17080,21 @@ index 406b67b8cbc..b648da40aab 100755
> >  +else
> >  +  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> >  +$as_echo "no" >&6; }
> > -+fi
> > -+
> > + fi
> > +-rm -f core conftest.err conftest.$ac_objext \
> > +-    conftest$ac_exeext conftest.$ac_ext
> > +-     ac_ext=3Dc
> > +-ac_cpp=3D'$CPP $CPPFLAGS'
> > +-ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
> > +-ac_link=3D'$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conft=
est.$ac_ext $LIBS >&5'
> > +-ac_compiler_gnu=3D$ac_cv_c_compiler_gnu
> > +
> > +-fi
> > +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_cc_needs_belf=
" >&5
> > +-$as_echo "$lt_cv_cc_needs_belf" >&6; }
> > +-  if test x"$lt_cv_cc_needs_belf" !=3D x"yes"; then
> > +-    # this is probably gcc 2.8.0, egcs 1.0 or newer; no need for -bel=
f
> > +-    CFLAGS=3D"$SAVE_CFLAGS"
> >  +  if test "x$ac_ct_MANIFEST_TOOL" =3D x; then
> >  +    MANIFEST_TOOL=3D":"
> >  +  else
> > @@ -16519,7 +17105,28 @@ index 406b67b8cbc..b648da40aab 100755
> >  +ac_tool_warned=3Dyes ;;
> >  +esac
> >  +    MANIFEST_TOOL=3D$ac_ct_MANIFEST_TOOL
> > -+  fi
> > +   fi
> > +-  ;;
> > +-sparc*-*solaris*)
> > +-  # Find out which ABI we are using.
> > +-  echo 'int i;' > conftest.$ac_ext
> > +-  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\"=
"; } >&5
> > +-  (eval $ac_compile) 2>&5
> > +-  ac_status=3D$?
> > +-  $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> > +-  test $ac_status =3D 0; }; then
> > +-    case `/usr/bin/file conftest.o` in
> > +-    *64-bit*)
> > +-      case $lt_cv_prog_gnu_ld in
> > +-      yes*) LD=3D"${LD-ld} -m elf64_sparc" ;;
> > +-      *)
> > +-    if ${LD-ld} -64 -r -o conftest2.o conftest.o >/dev/null 2>&1; the=
n
> > +-      LD=3D"${LD-ld} -64"
> > +-    fi
> > +-    ;;
> > +-      esac
> > +-      ;;
> > +-    esac
> >  +else
> >  +  MANIFEST_TOOL=3D"$ac_cv_prog_MANIFEST_TOOL"
> >  +fi
> > @@ -16536,7 +17143,10 @@ index 406b67b8cbc..b648da40aab 100755
> >  +  cat conftest.err >&5
> >  +  if $GREP 'Manifest Tool' conftest.out > /dev/null; then
> >  +    lt_cv_path_mainfest_tool=3Dyes
> > -+  fi
> > +   fi
> > +-  rm -rf conftest*
> > +-  ;;
> > +-esac
> >  +  rm -f conftest*
> >  +fi
> >  +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_mainfest=
_tool" >&5
> > @@ -16547,12 +17157,12 @@ index 406b67b8cbc..b648da40aab 100755
> >  +
> >  +
> >  +
> > -+
> > -+
> > +
> > +-need_locks=3D"$enable_libtool_lock"
> > +
> >
> >     case $host_os in
> > -     rhapsody* | darwin*)
> > -@@ -8007,6 +8500,8 @@ _LT_EOF
> > +@@ -8007,6 +8512,8 @@ _LT_EOF
> >         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> >         echo "$AR cru libconftest.a conftest.o" >&5
> >         $AR cru libconftest.a conftest.o 2>&5
> > @@ -16561,7 +17171,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         cat > conftest.c << _LT_EOF
> >   int main() { return 0;}
> >   _LT_EOF
> > -@@ -8589,8 +9084,6 @@ fi
> > +@@ -8589,8 +9096,6 @@ fi
> >   lt_prog_compiler_pic=3D
> >   lt_prog_compiler_static=3D
> >
> > @@ -16570,7 +17180,7 @@ index 406b67b8cbc..b648da40aab 100755
> >
> >     if test "$GCC" =3D yes; then
> >       lt_prog_compiler_wl=3D'-Wl,'
> > -@@ -8756,6 +9249,12 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> > +@@ -8756,6 +9261,12 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> >       lt_prog_compiler_pic=3D'--shared'
> >       lt_prog_compiler_static=3D'--static'
> >       ;;
> > @@ -16583,7 +17193,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> >           # Portland Group compilers (*not* the Pentium gcc compiler,
> >       # which looks to be a dead project)
> > -@@ -8818,7 +9317,7 @@ $as_echo_n "checking for $compiler option to pro=
duce PIC... " >&6; }
> > +@@ -8818,7 +9329,7 @@ $as_echo_n "checking for $compiler option to pro=
duce PIC... " >&6; }
> >         lt_prog_compiler_pic=3D'-KPIC'
> >         lt_prog_compiler_static=3D'-Bstatic'
> >         case $cc_basename in
> > @@ -16592,7 +17202,7 @@ index 406b67b8cbc..b648da40aab 100755
> >       lt_prog_compiler_wl=3D'-Qoption ld ';;
> >         *)
> >       lt_prog_compiler_wl=3D'-Wl,';;
> > -@@ -8875,13 +9374,17 @@ case $host_os in
> > +@@ -8875,13 +9386,17 @@ case $host_os in
> >       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> >       ;;
> >   esac
> > @@ -16616,7 +17226,7 @@ index 406b67b8cbc..b648da40aab 100755
> >
> >   #
> >   # Check to make sure the PIC flag actually works.
> > -@@ -8942,6 +9445,11 @@ fi
> > +@@ -8942,6 +9457,11 @@ fi
> >
> >
> >
> > @@ -16628,7 +17238,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   #
> >   # Check to make sure the static flag actually works.
> >   #
> > -@@ -9292,7 +9800,8 @@ _LT_EOF
> > +@@ -9292,7 +9812,8 @@ _LT_EOF
> >         allow_undefined_flag=3Dunsupported
> >         always_export_symbols=3Dno
> >         enable_shared_with_static_runtimes=3Dyes
> > @@ -16638,7 +17248,7 @@ index 406b67b8cbc..b648da40aab 100755
> >
> >         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> >           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags=
 -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-imp=
lib -Xlinker $lib'
> > -@@ -9391,12 +9900,12 @@ _LT_EOF
> > +@@ -9391,12 +9912,12 @@ _LT_EOF
> >         whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
> >         hardcode_libdir_flag_spec=3D
> >         hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> > @@ -16653,7 +17263,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         fi
> >         ;;
> >       esac
> > -@@ -9410,8 +9919,8 @@ _LT_EOF
> > +@@ -9410,8 +9931,8 @@ _LT_EOF
> >       archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
> >       wlarc=3D
> >         else
> > @@ -16664,7 +17274,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         fi
> >         ;;
> >
> > -@@ -9429,8 +9938,8 @@ _LT_EOF
> > +@@ -9429,8 +9950,8 @@ _LT_EOF
> >
> >   _LT_EOF
> >         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /de=
v/null; then
> > @@ -16675,7 +17285,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         else
> >       ld_shlibs=3Dno
> >         fi
> > -@@ -9476,8 +9985,8 @@ _LT_EOF
> > +@@ -9476,8 +9997,8 @@ _LT_EOF
> >
> >       *)
> >         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> > @@ -16686,7 +17296,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         else
> >       ld_shlibs=3Dno
> >         fi
> > -@@ -9607,7 +10116,13 @@ _LT_EOF
> > +@@ -9607,7 +10128,13 @@ _LT_EOF
> >       allow_undefined_flag=3D'-berok'
> >           # Determine the default libpath from the value encoded in an
> >           # empty executable.
> > @@ -16701,7 +17311,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -9620,22 +10135,29 @@ main ()
> > +@@ -9620,22 +10147,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -16744,7 +17354,7 @@ index 406b67b8cbc..b648da40aab 100755
> >
> >           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_li=
bpath"
> >           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs=
 $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undef=
ined_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; el=
se :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> > -@@ -9647,7 +10169,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -9647,7 +10181,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >       else
> >        # Determine the default libpath from the value encoded in an
> >        # empty executable.
> > @@ -16759,7 +17369,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -9660,22 +10188,29 @@ main ()
> > +@@ -9660,22 +10200,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -16802,7 +17412,7 @@ index 406b67b8cbc..b648da40aab 100755
> >
> >        hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
> >         # Warning - without using the other run time loading flags,
> > -@@ -9720,20 +10255,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9720,20 +10267,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >         # Microsoft Visual C++.
> >         # hardcode_libdir_flag_spec is actually meaningless, as there i=
s
> >         # no search path for DLLs.
> > @@ -16880,7 +17490,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         ;;
> >
> >       darwin* | rhapsody*)
> > -@@ -9794,7 +10372,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> > +@@ -9794,7 +10384,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> >
> >       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> >       freebsd* | dragonfly*)
> > @@ -16889,7 +17499,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         hardcode_libdir_flag_spec=3D'-R$libdir'
> >         hardcode_direct=3Dyes
> >         hardcode_shlibpath_var=3Dno
> > -@@ -9802,7 +10380,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> > +@@ -9802,7 +10392,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> >
> >       hpux9*)
> >         if test "$GCC" =3D yes; then
> > @@ -16898,7 +17508,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         else
> >       archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> >         fi
> > -@@ -9818,7 +10396,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> > +@@ -9818,7 +10408,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> >
> >       hpux10*)
> >         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> > @@ -16907,7 +17517,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         else
> >       archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
> >         fi
> > -@@ -9842,10 +10420,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9842,10 +10432,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >         archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
> >         ;;
> >       ia64*)
> > @@ -16920,7 +17530,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         ;;
> >       esac
> >         else
> > -@@ -9924,23 +10502,36 @@ fi
> > +@@ -9924,23 +10514,36 @@ fi
> >
> >       irix5* | irix6* | nonstopux*)
> >         if test "$GCC" =3D yes; then
> > @@ -16965,7 +17575,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         else
> >       archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
> >       archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> > -@@ -10025,7 +10616,7 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -10025,7 +10628,7 @@ rm -f core conftest.err conftest.$ac_objext \
> >       osf4* | osf5*)  # as osf3* with the addition of -msym flag
> >         if test "$GCC" =3D yes; then
> >       allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> > @@ -16974,7 +17584,7 @@ index 406b67b8cbc..b648da40aab 100755
> >       hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
> >         else
> >       allow_undefined_flag=3D' -expect_unresolved \*'
> > -@@ -10044,9 +10635,9 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -10044,9 +10647,9 @@ rm -f core conftest.err conftest.$ac_objext \
> >         no_undefined_flag=3D' -z defs'
> >         if test "$GCC" =3D yes; then
> >       wlarc=3D'${wl}'
> > @@ -16986,7 +17596,7 @@ index 406b67b8cbc..b648da40aab 100755
> >         else
> >       case `$CC -V 2>&1` in
> >       *"Compilers 5.0"*)
> > -@@ -10622,8 +11213,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10622,8 +11225,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> >     need_version=3Dno
> >     need_lib_prefix=3Dno
> >
> > @@ -16998,7 +17608,7 @@ index 406b67b8cbc..b648da40aab 100755
> >       library_names_spec=3D'$libname.dll.a'
> >       # DLL is installed to $(libdir)/../bin by postinstall_cmds
> >       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -10656,13 +11248,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10656,13 +11260,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> >         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``e=
cho ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> >         ;;
> >       esac
> > @@ -17071,7 +17681,7 @@ index 406b67b8cbc..b648da40aab 100755
> >     # FIXME: first we should search . and the directory the executable =
is in
> >     shlibpath_var=3DPATH
> >     ;;
> > -@@ -11540,7 +12190,7 @@ else
> > +@@ -11540,7 +12202,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > @@ -17080,7 +17690,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -11584,10 +12234,10 @@ else
> > +@@ -11584,10 +12246,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -17093,7 +17703,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -11646,7 +12296,7 @@ else
> > +@@ -11646,7 +12308,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > @@ -17102,7 +17712,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -11690,10 +12340,10 @@ else
> > +@@ -11690,10 +12352,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -17115,7 +17725,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -14979,13 +15629,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> > +@@ -14979,13 +15641,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -17136,7 +17746,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay=
_single_quote_subst"`'
> > -@@ -15000,14 +15657,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -15000,14 +15669,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_=
to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_globa=
l_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_c=
v_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quo=
te_subst"`'
> > @@ -17155,7 +17765,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -15040,12 +15700,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> > +@@ -15040,12 +15712,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_sin=
gle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_=
subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_=
quote_subst"`'
> > @@ -17169,7 +17779,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quot=
e_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | =
$SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > -@@ -15100,8 +15760,13 @@ reload_flag \
> > +@@ -15100,8 +15772,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -17183,7 +17793,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -15111,12 +15776,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -15111,12 +15788,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -17199,7 +17809,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -15132,7 +15799,6 @@ no_undefined_flag \
> > +@@ -15132,7 +15811,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -17207,7 +17817,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -15168,6 +15834,7 @@ module_cmds \
> > +@@ -15168,6 +15846,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -17215,7 +17825,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -15866,7 +16533,8 @@ esac ;;
> > +@@ -15866,7 +16545,8 @@ esac ;;
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 200=
5,
> > @@ -17225,7 +17835,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -15969,19 +16637,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -15969,19 +16649,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -17269,7 +17879,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -16011,6 +16702,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> > +@@ -16011,6 +16714,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefix=
 is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sym=
bol_to_c_name_address_lib_prefix
> >
> > @@ -17282,7 +17892,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -16020,6 +16717,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -16020,6 +16729,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -17292,7 +17902,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -16134,12 +16834,12 @@ with_gcc=3D$GCC
> > +@@ -16134,12 +16846,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -17308,7 +17918,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -16226,9 +16926,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -16226,9 +16938,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency libr=
aries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -17318,7 +17928,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -16244,6 +16941,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -16244,6 +16953,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with te=
mplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -17328,7 +17938,7 @@ index 406b67b8cbc..b648da40aab 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -16276,210 +16976,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -16276,210 +16988,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash proble=
m
> >     # is reportedly fixed, but why not run on old versions too?
> > @@ -17703,10 +18313,10 @@ index 406b67b8cbc..b648da40aab 100755
> >     chmod +x "$ofile"
> >
> >  diff --git a/libctf/Makefile.in b/libctf/Makefile.in
> > -index f2b852e3fae..63e3b2e05ea 100644
> > +index 3d2696bcc47..3bad01c3c9b 100644
> >  --- a/libctf/Makefile.in
> >  +++ b/libctf/Makefile.in
> > -@@ -393,6 +393,7 @@ CYGPATH_W =3D @CYGPATH_W@
> > +@@ -392,6 +392,7 @@ CYGPATH_W =3D @CYGPATH_W@
> >   DATADIRNAME =3D @DATADIRNAME@
> >   DEFS =3D @DEFS@
> >   DEPDIR =3D @DEPDIR@
> > @@ -17723,10 +18333,10 @@ index f2b852e3fae..63e3b2e05ea 100644
> >   NM =3D @NM@
> >   NMEDIT =3D @NMEDIT@
> >  diff --git a/libctf/configure b/libctf/configure
> > -index b347b292195..d6d6e341887 100755
> > +index a0e40f49a80..42bc002c2b9 100755
> >  --- a/libctf/configure
> >  +++ b/libctf/configure
> > -@@ -669,6 +669,8 @@ OTOOL
> > +@@ -668,6 +668,8 @@ OTOOL
> >   LIPO
> >   NMEDIT
> >   DSYMUTIL
> > @@ -17735,7 +18345,7 @@ index b347b292195..d6d6e341887 100755
> >   OBJDUMP
> >   LN_S
> >   NM
> > -@@ -800,6 +802,7 @@ enable_static
> > +@@ -799,6 +801,7 @@ enable_static
> >   with_pic
> >   enable_fast_install
> >   with_gnu_ld
> > @@ -17743,7 +18353,7 @@ index b347b292195..d6d6e341887 100755
> >   enable_libtool_lock
> >   enable_largefile
> >   enable_werror_always
> > -@@ -1463,6 +1466,8 @@ Optional Packages:
> > +@@ -1462,6 +1465,8 @@ Optional Packages:
> >     --with-pic              try to use only PIC/non-PIC objects [defaul=
t=3Duse
> >                             both]
> >     --with-gnu-ld           assume the C compiler uses GNU ld [default=
=3Dno]
> > @@ -17752,7 +18362,7 @@ index b347b292195..d6d6e341887 100755
> >     --with-system-zlib      use installed libz
> >
> >   Some influential environment variables:
> > -@@ -5568,8 +5573,8 @@ esac
> > +@@ -5567,8 +5572,8 @@ esac
> >
> >
> >
> > @@ -17763,7 +18373,7 @@ index b347b292195..d6d6e341887 100755
> >
> >
> >
> > -@@ -5609,7 +5614,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > +@@ -5608,7 +5613,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print string=
s" >&5
> >   $as_echo_n "checking how to print strings... " >&6; }
> >   # Test print first, because it will be a builtin if present.
> > @@ -17772,7 +18382,7 @@ index b347b292195..d6d6e341887 100755
> >      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> >     ECHO=3D'print -r --'
> >   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -@@ -6302,8 +6307,8 @@ $as_echo_n "checking whether the shell understan=
ds some XSI constructs... " >&6;
> > +@@ -6301,8 +6306,8 @@ $as_echo_n "checking whether the shell understan=
ds some XSI constructs... " >&6;
> >   # Try some XSI features
> >   xsi_shell=3Dno
> >   ( _lt_dummy=3D"a/b/c"
> > @@ -17783,7 +18393,7 @@ index b347b292195..d6d6e341887 100755
> >       && eval 'test $(( 1 + 1 )) -eq 2 \
> >       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> >     && xsi_shell=3Dyes
> > -@@ -6352,6 +6357,80 @@ esac
> > +@@ -6351,6 +6356,80 @@ esac
> >
> >
> >
> > @@ -17864,7 +18474,7 @@ index b347b292195..d6d6e341887 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to r=
eload object files" >&5
> >   $as_echo_n "checking for $LD option to reload object files... " >&6; =
}
> >   if ${lt_cv_ld_reload_flag+:} false; then :
> > -@@ -6368,6 +6447,11 @@ case $reload_flag in
> > +@@ -6367,6 +6446,11 @@ case $reload_flag in
> >   esac
> >   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> >   case $host_os in
> > @@ -17876,7 +18486,7 @@ index b347b292195..d6d6e341887 100755
> >     darwin*)
> >       if test "$GCC" =3D yes; then
> >         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$rel=
oad_objs'
> > -@@ -6536,7 +6620,8 @@ mingw* | pw32*)
> > +@@ -6535,7 +6619,8 @@ mingw* | pw32*)
> >       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86=
 DLL'
> >       lt_cv_file_magic_cmd=3D'func_win32_libid'
> >     else
> > @@ -17886,7 +18496,7 @@ index b347b292195..d6d6e341887 100755
> >       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> >     fi
> >     ;;
> > -@@ -6690,6 +6775,21 @@ esac
> > +@@ -6689,6 +6774,21 @@ esac
> >   fi
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check=
_method" >&5
> >   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> > @@ -17908,7 +18518,7 @@ index b347b292195..d6d6e341887 100755
> >   file_magic_cmd=3D$lt_cv_file_magic_cmd
> >   deplibs_check_method=3D$lt_cv_deplibs_check_method
> >   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> > -@@ -6705,6 +6805,157 @@ test -z "$deplibs_check_method" && deplibs_che=
ck_method=3Dunknown
> > +@@ -6704,6 +6804,157 @@ test -z "$deplibs_check_method" && deplibs_che=
ck_method=3Dunknown
> >
> >
> >
> > @@ -18066,7 +18676,7 @@ index b347b292195..d6d6e341887 100755
> >   plugin_option=3D
> >   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.=
dll"
> >   for plugin in $plugin_names; do
> > -@@ -6719,8 +6970,10 @@ for plugin in $plugin_names; do
> > +@@ -6718,8 +6969,10 @@ for plugin in $plugin_names; do
> >   done
> >
> >   if test -n "$ac_tool_prefix"; then
> > @@ -18079,7 +18689,7 @@ index b347b292195..d6d6e341887 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_AR+:} false; then :
> > -@@ -6736,7 +6989,7 @@ do
> > +@@ -6735,7 +6988,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -18088,7 +18698,7 @@ index b347b292195..d6d6e341887 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -6756,11 +7009,15 @@ $as_echo "no" >&6; }
> > +@@ -6755,11 +7008,15 @@ $as_echo "no" >&6; }
> >   fi
> >
> >
> > @@ -18107,7 +18717,7 @@ index b347b292195..d6d6e341887 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> > -@@ -6776,7 +7033,7 @@ do
> > +@@ -6775,7 +7032,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -18116,7 +18726,7 @@ index b347b292195..d6d6e341887 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -6795,6 +7052,10 @@ else
> > +@@ -6794,6 +7051,10 @@ else
> >   $as_echo "no" >&6; }
> >   fi
> >
> > @@ -18127,7 +18737,7 @@ index b347b292195..d6d6e341887 100755
> >     if test "x$ac_ct_AR" =3D x; then
> >       AR=3D"false"
> >     else
> > -@@ -6806,25 +7067,19 @@ ac_tool_warned=3Dyes ;;
> > +@@ -6805,25 +7066,19 @@ ac_tool_warned=3Dyes ;;
> >   esac
> >       AR=3D$ac_ct_AR
> >     fi
> > @@ -18162,7 +18772,7 @@ index b347b292195..d6d6e341887 100755
> >
> >
> >
> > -@@ -6836,6 +7091,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> > +@@ -6835,6 +7090,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> >
> >
> >
> > @@ -18227,7 +18837,7 @@ index b347b292195..d6d6e341887 100755
> >   if test -n "$ac_tool_prefix"; then
> >     # Extract the first word of "${ac_tool_prefix}strip", so it can be =
a program name with args.
> >   set dummy ${ac_tool_prefix}strip; ac_word=3D$2
> > -@@ -7175,8 +7488,8 @@ esac
> > +@@ -7174,8 +7487,8 @@ esac
> >   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern=
 int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> >
> >   # Transform an extracted symbol line into symbol name and symbol addr=
ess
> > @@ -18238,7 +18848,7 @@ index b347b292195..d6d6e341887 100755
> >
> >   # Handle CRLF in mingw tool chain
> >   opt_cr=3D
> > -@@ -7212,6 +7525,7 @@ for ac_symprfx in "" "_"; do
> > +@@ -7211,6 +7524,7 @@ for ac_symprfx in "" "_"; do
> >     else
> >       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[  ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> >     fi
> > @@ -18246,7 +18856,7 @@ index b347b292195..d6d6e341887 100755
> >
> >     # Check to see that the pipe works correctly.
> >     pipe_works=3Dno
> > -@@ -7253,6 +7567,18 @@ _LT_EOF
> > +@@ -7252,6 +7566,18 @@ _LT_EOF
> >         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> >       if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> >         cat <<_LT_EOF > conftest.$ac_ext
> > @@ -18265,7 +18875,7 @@ index b347b292195..d6d6e341887 100755
> >   #ifdef __cplusplus
> >   extern "C" {
> >   #endif
> > -@@ -7264,7 +7590,7 @@ _LT_EOF
> > +@@ -7263,7 +7589,7 @@ _LT_EOF
> >         cat <<_LT_EOF >> conftest.$ac_ext
> >
> >   /* The mapping between symbol names and symbols.  */
> > @@ -18274,7 +18884,7 @@ index b347b292195..d6d6e341887 100755
> >     const char *name;
> >     void       *address;
> >   }
> > -@@ -7290,8 +7616,8 @@ static const void *lt_preloaded_setup() {
> > +@@ -7289,8 +7615,8 @@ static const void *lt_preloaded_setup() {
> >   _LT_EOF
> >         # Now try linking the two files.
> >         mv conftest.$ac_objext conftstm.$ac_objext
> > @@ -18285,7 +18895,7 @@ index b347b292195..d6d6e341887 100755
> >         LIBS=3D"conftstm.$ac_objext"
> >         CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> >         if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> > -@@ -7301,8 +7627,8 @@ _LT_EOF
> > +@@ -7300,8 +7626,8 @@ _LT_EOF
> >     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> >           pipe_works=3Dyes
> >         fi
> > @@ -18296,7 +18906,7 @@ index b347b292195..d6d6e341887 100755
> >       else
> >         echo "cannot find nm_test_func in $nlist" >&5
> >       fi
> > -@@ -7339,6 +7665,17 @@ else
> > +@@ -7338,6 +7664,17 @@ else
> >   $as_echo "ok" >&6; }
> >   fi
> >
> > @@ -18314,7 +18924,7 @@ index b347b292195..d6d6e341887 100755
> >
> >
> >
> > -@@ -7355,6 +7692,44 @@ fi
> > +@@ -7354,6 +7691,44 @@ fi
> >
> >
> >
> > @@ -18359,7 +18969,7 @@ index b347b292195..d6d6e341887 100755
> >
> >
> >
> > -@@ -7566,6 +7941,123 @@ esac
> > +@@ -7565,6 +7940,123 @@ esac
> >
> >   need_locks=3D"$enable_libtool_lock"
> >
> > @@ -18483,7 +19093,7 @@ index b347b292195..d6d6e341887 100755
> >
> >     case $host_os in
> >       rhapsody* | darwin*)
> > -@@ -8129,6 +8621,8 @@ _LT_EOF
> > +@@ -8128,6 +8620,8 @@ _LT_EOF
> >         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> >         echo "$AR cru libconftest.a conftest.o" >&5
> >         $AR cru libconftest.a conftest.o 2>&5
> > @@ -18492,7 +19102,7 @@ index b347b292195..d6d6e341887 100755
> >         cat > conftest.c << _LT_EOF
> >   int main() { return 0;}
> >   _LT_EOF
> > -@@ -8681,8 +9175,6 @@ fi
> > +@@ -8680,8 +9174,6 @@ fi
> >   lt_prog_compiler_pic=3D
> >   lt_prog_compiler_static=3D
> >
> > @@ -18501,7 +19111,7 @@ index b347b292195..d6d6e341887 100755
> >
> >     if test "$GCC" =3D yes; then
> >       lt_prog_compiler_wl=3D'-Wl,'
> > -@@ -8848,6 +9340,12 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> > +@@ -8847,6 +9339,12 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> >       lt_prog_compiler_pic=3D'--shared'
> >       lt_prog_compiler_static=3D'--static'
> >       ;;
> > @@ -18514,7 +19124,7 @@ index b347b292195..d6d6e341887 100755
> >         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> >           # Portland Group compilers (*not* the Pentium gcc compiler,
> >       # which looks to be a dead project)
> > -@@ -8910,7 +9408,7 @@ $as_echo_n "checking for $compiler option to pro=
duce PIC... " >&6; }
> > +@@ -8909,7 +9407,7 @@ $as_echo_n "checking for $compiler option to pro=
duce PIC... " >&6; }
> >         lt_prog_compiler_pic=3D'-KPIC'
> >         lt_prog_compiler_static=3D'-Bstatic'
> >         case $cc_basename in
> > @@ -18523,7 +19133,7 @@ index b347b292195..d6d6e341887 100755
> >       lt_prog_compiler_wl=3D'-Qoption ld ';;
> >         *)
> >       lt_prog_compiler_wl=3D'-Wl,';;
> > -@@ -8967,13 +9465,17 @@ case $host_os in
> > +@@ -8966,13 +9464,17 @@ case $host_os in
> >       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> >       ;;
> >   esac
> > @@ -18547,7 +19157,7 @@ index b347b292195..d6d6e341887 100755
> >
> >   #
> >   # Check to make sure the PIC flag actually works.
> > -@@ -9034,6 +9536,11 @@ fi
> > +@@ -9033,6 +9535,11 @@ fi
> >
> >
> >
> > @@ -18559,7 +19169,7 @@ index b347b292195..d6d6e341887 100755
> >   #
> >   # Check to make sure the static flag actually works.
> >   #
> > -@@ -9384,7 +9891,8 @@ _LT_EOF
> > +@@ -9383,7 +9890,8 @@ _LT_EOF
> >         allow_undefined_flag=3Dunsupported
> >         always_export_symbols=3Dno
> >         enable_shared_with_static_runtimes=3Dyes
> > @@ -18569,7 +19179,7 @@ index b347b292195..d6d6e341887 100755
> >
> >         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> >           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags=
 -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-imp=
lib -Xlinker $lib'
> > -@@ -9483,12 +9991,12 @@ _LT_EOF
> > +@@ -9482,12 +9990,12 @@ _LT_EOF
> >         whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
> >         hardcode_libdir_flag_spec=3D
> >         hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> > @@ -18584,7 +19194,7 @@ index b347b292195..d6d6e341887 100755
> >         fi
> >         ;;
> >       esac
> > -@@ -9502,8 +10010,8 @@ _LT_EOF
> > +@@ -9501,8 +10009,8 @@ _LT_EOF
> >       archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
> >       wlarc=3D
> >         else
> > @@ -18595,7 +19205,7 @@ index b347b292195..d6d6e341887 100755
> >         fi
> >         ;;
> >
> > -@@ -9521,8 +10029,8 @@ _LT_EOF
> > +@@ -9520,8 +10028,8 @@ _LT_EOF
> >
> >   _LT_EOF
> >         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /de=
v/null; then
> > @@ -18606,7 +19216,7 @@ index b347b292195..d6d6e341887 100755
> >         else
> >       ld_shlibs=3Dno
> >         fi
> > -@@ -9568,8 +10076,8 @@ _LT_EOF
> > +@@ -9567,8 +10075,8 @@ _LT_EOF
> >
> >       *)
> >         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> > @@ -18617,7 +19227,7 @@ index b347b292195..d6d6e341887 100755
> >         else
> >       ld_shlibs=3Dno
> >         fi
> > -@@ -9699,7 +10207,13 @@ _LT_EOF
> > +@@ -9698,7 +10206,13 @@ _LT_EOF
> >       allow_undefined_flag=3D'-berok'
> >           # Determine the default libpath from the value encoded in an
> >           # empty executable.
> > @@ -18632,7 +19242,7 @@ index b347b292195..d6d6e341887 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -9712,22 +10226,29 @@ main ()
> > +@@ -9711,22 +10225,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -18675,7 +19285,7 @@ index b347b292195..d6d6e341887 100755
> >
> >           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_li=
bpath"
> >           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs=
 $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undef=
ined_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; el=
se :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> > -@@ -9739,7 +10260,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -9738,7 +10259,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >       else
> >        # Determine the default libpath from the value encoded in an
> >        # empty executable.
> > @@ -18690,7 +19300,7 @@ index b347b292195..d6d6e341887 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -9752,22 +10279,29 @@ main ()
> > +@@ -9751,22 +10278,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -18733,7 +19343,7 @@ index b347b292195..d6d6e341887 100755
> >
> >        hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
> >         # Warning - without using the other run time loading flags,
> > -@@ -9812,20 +10346,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9811,20 +10345,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >         # Microsoft Visual C++.
> >         # hardcode_libdir_flag_spec is actually meaningless, as there i=
s
> >         # no search path for DLLs.
> > @@ -18811,7 +19421,7 @@ index b347b292195..d6d6e341887 100755
> >         ;;
> >
> >       darwin* | rhapsody*)
> > -@@ -9886,7 +10463,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> > +@@ -9885,7 +10462,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> >
> >       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> >       freebsd* | dragonfly*)
> > @@ -18820,7 +19430,7 @@ index b347b292195..d6d6e341887 100755
> >         hardcode_libdir_flag_spec=3D'-R$libdir'
> >         hardcode_direct=3Dyes
> >         hardcode_shlibpath_var=3Dno
> > -@@ -9894,7 +10471,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> > +@@ -9893,7 +10470,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> >
> >       hpux9*)
> >         if test "$GCC" =3D yes; then
> > @@ -18829,7 +19439,7 @@ index b347b292195..d6d6e341887 100755
> >         else
> >       archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> >         fi
> > -@@ -9910,7 +10487,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> > +@@ -9909,7 +10486,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> >
> >       hpux10*)
> >         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> > @@ -18838,7 +19448,7 @@ index b347b292195..d6d6e341887 100755
> >         else
> >       archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
> >         fi
> > -@@ -9934,10 +10511,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9933,10 +10510,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >         archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
> >         ;;
> >       ia64*)
> > @@ -18851,7 +19461,7 @@ index b347b292195..d6d6e341887 100755
> >         ;;
> >       esac
> >         else
> > -@@ -10016,23 +10593,36 @@ fi
> > +@@ -10015,23 +10592,36 @@ fi
> >
> >       irix5* | irix6* | nonstopux*)
> >         if test "$GCC" =3D yes; then
> > @@ -18896,7 +19506,7 @@ index b347b292195..d6d6e341887 100755
> >         else
> >       archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
> >       archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> > -@@ -10117,7 +10707,7 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -10116,7 +10706,7 @@ rm -f core conftest.err conftest.$ac_objext \
> >       osf4* | osf5*)  # as osf3* with the addition of -msym flag
> >         if test "$GCC" =3D yes; then
> >       allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> > @@ -18905,7 +19515,7 @@ index b347b292195..d6d6e341887 100755
> >       hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
> >         else
> >       allow_undefined_flag=3D' -expect_unresolved \*'
> > -@@ -10136,9 +10726,9 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -10135,9 +10725,9 @@ rm -f core conftest.err conftest.$ac_objext \
> >         no_undefined_flag=3D' -z defs'
> >         if test "$GCC" =3D yes; then
> >       wlarc=3D'${wl}'
> > @@ -18917,7 +19527,7 @@ index b347b292195..d6d6e341887 100755
> >         else
> >       case `$CC -V 2>&1` in
> >       *"Compilers 5.0"*)
> > -@@ -10714,8 +11304,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10713,8 +11303,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> >     need_version=3Dno
> >     need_lib_prefix=3Dno
> >
> > @@ -18929,7 +19539,7 @@ index b347b292195..d6d6e341887 100755
> >       library_names_spec=3D'$libname.dll.a'
> >       # DLL is installed to $(libdir)/../bin by postinstall_cmds
> >       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -10748,13 +11339,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10747,13 +11338,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> >         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``e=
cho ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> >         ;;
> >       esac
> > @@ -19002,16 +19612,16 @@ index b347b292195..d6d6e341887 100755
> >     # FIXME: first we should search . and the directory the executable =
is in
> >     shlibpath_var=3DPATH
> >     ;;
> > -@@ -11632,7 +12281,7 @@ else
> > +@@ -11631,7 +12280,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 11635 "configure"
> > +-#line 11634 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -11676,10 +12325,10 @@ else
> > +@@ -11675,10 +12324,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -19024,16 +19634,16 @@ index b347b292195..d6d6e341887 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -11738,7 +12387,7 @@ else
> > +@@ -11737,7 +12386,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 11741 "configure"
> > +-#line 11740 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -11782,10 +12431,10 @@ else
> > +@@ -11781,10 +12430,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -19046,7 +19656,7 @@ index b347b292195..d6d6e341887 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -15832,13 +16481,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> > +@@ -15825,13 +16474,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -19067,7 +19677,7 @@ index b347b292195..d6d6e341887 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay=
_single_quote_subst"`'
> > -@@ -15853,14 +16509,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -15846,14 +16502,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_=
to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_globa=
l_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_c=
v_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quo=
te_subst"`'
> > @@ -19086,7 +19696,7 @@ index b347b292195..d6d6e341887 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -15893,12 +16552,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> > +@@ -15886,12 +16545,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_sin=
gle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_=
subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_=
quote_subst"`'
> > @@ -19100,7 +19710,7 @@ index b347b292195..d6d6e341887 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quot=
e_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | =
$SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > -@@ -15953,8 +16612,13 @@ reload_flag \
> > +@@ -15946,8 +16605,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -19114,7 +19724,7 @@ index b347b292195..d6d6e341887 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -15964,12 +16628,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -15957,12 +16621,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -19130,7 +19740,7 @@ index b347b292195..d6d6e341887 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -15985,7 +16651,6 @@ no_undefined_flag \
> > +@@ -15978,7 +16644,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -19138,7 +19748,7 @@ index b347b292195..d6d6e341887 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -16021,6 +16686,7 @@ module_cmds \
> > +@@ -16014,6 +16679,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -19146,7 +19756,7 @@ index b347b292195..d6d6e341887 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -16778,7 +17444,8 @@ $as_echo X"$file" |
> > +@@ -16771,7 +17437,8 @@ $as_echo X"$file" |
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 200=
5,
> > @@ -19156,7 +19766,7 @@ index b347b292195..d6d6e341887 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -16881,19 +17548,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -16874,19 +17541,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -19200,7 +19810,7 @@ index b347b292195..d6d6e341887 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -16923,6 +17613,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> > +@@ -16916,6 +17606,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefix=
 is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sym=
bol_to_c_name_address_lib_prefix
> >
> > @@ -19213,7 +19823,7 @@ index b347b292195..d6d6e341887 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -16932,6 +17628,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -16925,6 +17621,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -19223,7 +19833,7 @@ index b347b292195..d6d6e341887 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -17046,12 +17745,12 @@ with_gcc=3D$GCC
> > +@@ -17039,12 +17738,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -19239,7 +19849,7 @@ index b347b292195..d6d6e341887 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -17138,9 +17837,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -17131,9 +17830,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency libr=
aries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -19249,7 +19859,7 @@ index b347b292195..d6d6e341887 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -17156,6 +17852,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -17149,6 +17845,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with te=
mplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -19259,7 +19869,7 @@ index b347b292195..d6d6e341887 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -17188,210 +17887,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -17181,210 +17880,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash proble=
m
> >     # is reportedly fixed, but why not run on old versions too?
> > @@ -19634,7 +20244,7 @@ index b347b292195..d6d6e341887 100755
> >     chmod +x "$ofile"
> >
> >  diff --git a/libsframe/Makefile.in b/libsframe/Makefile.in
> > -index 107b82ccfdc..4a4459bf5eb 100644
> > +index 08c780caa4a..7ea9c94c2af 100644
> >  --- a/libsframe/Makefile.in
> >  +++ b/libsframe/Makefile.in
> >  @@ -1,7 +1,7 @@
> > @@ -19647,25 +20257,31 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >
> >   # This Makefile.in is free software; the Free Software Foundation
> >   # gives unlimited permission to copy and/or distribute it,
> > -@@ -139,6 +139,10 @@ mkinstalldirs =3D $(SHELL) $(top_srcdir)/../mkins=
talldirs
> > +@@ -142,6 +142,13 @@ mkinstalldirs =3D $(SHELL) $(top_srcdir)/../mkins=
talldirs
> >   CONFIG_HEADER =3D config.h
> >   CONFIG_CLEAN_FILES =3D
> >   CONFIG_CLEAN_VPATH_FILES =3D
> >  +@HAVE_COMPAT_DEJAGNU_TRUE@am__EXEEXT_1 =3D testsuite/libsframe.decode=
/be-flipping$(EXEEXT) \
> >  +@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.decode/frecnt-1$(EXEE=
XT) \
> >  +@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.decode/frecnt-2$(EXEE=
XT) \
> > -+@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.encode/encode-1$(EXEE=
XT)
> > ++@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.encode/encode-1$(EXEE=
XT) \
> > ++@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.find/findfre-1$(EXEEX=
T) \
> > ++@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.find/findfunc-1$(EXEE=
XT) \
> > ++@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.find/plt-findfre-1$(E=
XEEXT)
> >   am__vpath_adj_setup =3D srcdirstrip=3D`echo "$(srcdir)" | sed 's|.|.|=
g'`;
> >   am__vpath_adj =3D case $$p in \
> >       $(srcdir)/*) f=3D`echo "$$p" | sed "s|^$$srcdirstrip/||"`;; \
> > -@@ -179,27 +183,27 @@ am__v_lt_0 =3D --silent
> > - am__v_lt_1 =3D
> > +@@ -185,45 +192,44 @@ libsframe_la_LINK =3D $(LIBTOOL) $(AM_V_lt) --ta=
g=3DCC $(AM_LIBTOOLFLAGS) \
> > +     $(libsframe_la_LDFLAGS) $(LDFLAGS) -o $@
> >   @INSTALL_LIBBFD_FALSE@am_libsframe_la_rpath =3D
> >   @INSTALL_LIBBFD_TRUE@am_libsframe_la_rpath =3D -rpath $(libdir)
> >  -@HAVE_COMPAT_DEJAGNU_TRUE@am__EXEEXT_1 =3D testsuite/libsframe.decode=
/be-flipping$(EXEEXT) \
> >  -@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.decode/frecnt-1$(EXEE=
XT) \
> >  -@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.decode/frecnt-2$(EXEE=
XT) \
> > --@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.encode/encode-1$(EXEE=
XT)
> > +-@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.encode/encode-1$(EXEE=
XT) \
> > +-@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.find/findfre-1$(EXEEX=
T) \
> > +-@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.find/findfunc-1$(EXEE=
XT) \
> > +-@HAVE_COMPAT_DEJAGNU_TRUE@  testsuite/libsframe.find/plt-findfre-1$(E=
XEEXT)
> >   am__dirstamp =3D $(am__leading_dot)dirstamp
> >  -am_testsuite_libsframe_decode_be_flipping_OBJECTS =3D testsuite/libsf=
rame.decode/testsuite_libsframe_decode_be_flipping-be-flipping.$(OBJEXT)
> >  +am_testsuite_libsframe_decode_be_flipping_OBJECTS =3D  \
> > @@ -19694,7 +20310,27 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >   testsuite_libsframe_encode_encode_1_OBJECTS =3D  \
> >       $(am_testsuite_libsframe_encode_encode_1_OBJECTS)
> >   testsuite_libsframe_encode_encode_1_DEPENDENCIES =3D  \
> > -@@ -218,7 +222,14 @@ am__v_at_0 =3D @
> > +     ${top_builddir}/libsframe.la
> > +-am_testsuite_libsframe_find_findfre_1_OBJECTS =3D testsuite/libsframe=
.find/testsuite_libsframe_find_findfre_1-findfre-1.$(OBJEXT)
> > ++am_testsuite_libsframe_find_findfre_1_OBJECTS =3D  \
> > ++    testsuite/libsframe.find/findfre_1-findfre-1.$(OBJEXT)
> > + testsuite_libsframe_find_findfre_1_OBJECTS =3D  \
> > +     $(am_testsuite_libsframe_find_findfre_1_OBJECTS)
> > + testsuite_libsframe_find_findfre_1_DEPENDENCIES =3D  \
> > +     ${top_builddir}/libsframe.la
> > +-am_testsuite_libsframe_find_findfunc_1_OBJECTS =3D testsuite/libsfram=
e.find/testsuite_libsframe_find_findfunc_1-findfunc-1.$(OBJEXT)
> > ++am_testsuite_libsframe_find_findfunc_1_OBJECTS =3D  \
> > ++    testsuite/libsframe.find/findfunc_1-findfunc-1.$(OBJEXT)
> > + testsuite_libsframe_find_findfunc_1_OBJECTS =3D  \
> > +     $(am_testsuite_libsframe_find_findfunc_1_OBJECTS)
> > + testsuite_libsframe_find_findfunc_1_DEPENDENCIES =3D  \
> > +     ${top_builddir}/libsframe.la
> > +-am_testsuite_libsframe_find_plt_findfre_1_OBJECTS =3D testsuite/libsf=
rame.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.$(OBJEXT)
> > ++am_testsuite_libsframe_find_plt_findfre_1_OBJECTS =3D testsuite/libsf=
rame.find/plt_findfre_1-plt-findfre-1.$(OBJEXT)
> > + testsuite_libsframe_find_plt_findfre_1_OBJECTS =3D  \
> > +     $(am_testsuite_libsframe_find_plt_findfre_1_OBJECTS)
> > + testsuite_libsframe_find_plt_findfre_1_DEPENDENCIES =3D  \
> > +@@ -242,7 +248,17 @@ am__v_at_0 =3D @
> >   am__v_at_1 =3D
> >   DEFAULT_INCLUDES =3D -I.@am__isrc@
> >   depcomp =3D $(SHELL) $(top_srcdir)/../depcomp
> > @@ -19706,11 +20342,14 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >  +    testsuite/libsframe.decode/$(DEPDIR)/be_flipping-be-flipping.Po \
> >  +    testsuite/libsframe.decode/$(DEPDIR)/frecnt_1-frecnt-1.Po \
> >  +    testsuite/libsframe.decode/$(DEPDIR)/frecnt_2-frecnt-2.Po \
> > -+    testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Po
> > ++    testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Po \
> > ++    testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Po \
> > ++    testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.Po \
> > ++    testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-findfre-1.Po
> >   am__mv =3D mv -f
> >   COMPILE =3D $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLA=
GS) \
> >       $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
> > -@@ -295,8 +306,8 @@ am__can_run_installinfo =3D \
> > +@@ -325,8 +341,8 @@ am__can_run_installinfo =3D \
> >     esac
> >   am__include_HEADERS_DIST =3D $(INCDIR)/sframe.h $(INCDIR)/sframe-api.=
h
> >   HEADERS =3D $(include_HEADERS)
> > @@ -19721,7 +20360,7 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >   # Read a list of newline-separated strings from the standard input,
> >   # and print each of them once, without duplicates.  Input order is
> >   # *not* preserved.
> > -@@ -313,9 +324,6 @@ am__define_uniq_tagged_files =3D \
> > +@@ -343,9 +359,6 @@ am__define_uniq_tagged_files =3D \
> >     unique=3D`for i in $$list; do \
> >       if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
> >     done | $(am__uniquify_input)`
> > @@ -19731,7 +20370,7 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >   AM_RECURSIVE_TARGETS =3D cscope
> >   DEJATOOL =3D $(PACKAGE)
> >   RUNTESTDEFAULTFLAGS =3D --tool $$tool --srcdir $$srcdir
> > -@@ -341,6 +349,8 @@ am__post_remove_distdir =3D $(am__remove_distdir)
> > +@@ -372,6 +385,8 @@ am__post_remove_distdir =3D $(am__remove_distdir)
> >   DIST_ARCHIVES =3D $(distdir).tar.gz
> >   GZIP_ENV =3D --best
> >   DIST_TARGETS =3D dist-gzip
> > @@ -19740,7 +20379,7 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >   distuninstallcheck_listfiles =3D find . -type f -print
> >   am__distuninstallcheck_listfiles =3D $(distuninstallcheck_listfiles) =
\
> >     | sed 's|^\./|$(prefix)/|' | grep -v '$(infodir)/dir$$'
> > -@@ -359,15 +369,19 @@ CFLAGS =3D @CFLAGS@
> > +@@ -390,15 +405,19 @@ CFLAGS =3D @CFLAGS@
> >   COMPAT_DEJAGNU =3D @COMPAT_DEJAGNU@
> >   CPP =3D @CPP@
> >   CPPFLAGS =3D @CPPFLAGS@
> > @@ -19760,7 +20399,7 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >   EXEEXT =3D @EXEEXT@
> >   FGREP =3D @FGREP@
> >   GREP =3D @GREP@
> > -@@ -386,6 +400,7 @@ LN_S =3D @LN_S@
> > +@@ -417,6 +436,7 @@ LN_S =3D @LN_S@
> >   LTLIBOBJS =3D @LTLIBOBJS@
> >   MAINT =3D @MAINT@
> >   MAKEINFO =3D @MAKEINFO@
> > @@ -19768,7 +20407,7 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >   MKDIR_P =3D @MKDIR_P@
> >   NM =3D @NM@
> >   NMEDIT =3D @NMEDIT@
> > -@@ -541,8 +556,8 @@ Makefile: $(srcdir)/Makefile.in $(top_builddir)/co=
nfig.status
> > +@@ -589,8 +609,8 @@ Makefile: $(srcdir)/Makefile.in $(top_builddir)/co=
nfig.status
> >           echo ' $(SHELL) ./config.status'; \
> >           $(SHELL) ./config.status;; \
> >         *) \
> > @@ -19777,9 +20416,9 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >  +        echo ' cd $(top_builddir) && $(SHELL) ./config.status $@ $(am=
__maybe_remake_depfiles)'; \
> >  +        cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__maybe=
_remake_depfiles);; \
> >       esac;
> > - $(srcdir)/doc/local.mk $(srcdir)/testsuite/local.mk $(srcdir)/testsui=
te/libsframe.decode/local.mk $(srcdir)/testsuite/libsframe.encode/local.mk =
$(am__empty):
> > + $(srcdir)/doc/local.mk $(srcdir)/testsuite/local.mk $(srcdir)/testsui=
te/libsframe.decode/local.mk $(srcdir)/testsuite/libsframe.encode/local.mk =
$(srcdir)/testsuite/libsframe.find/local.mk $(am__empty):
> >
> > -@@ -570,6 +585,15 @@ $(srcdir)/config.h.in: @MAINTAINER_MODE_TRUE@ $(a=
m__configure_deps)
> > +@@ -618,6 +638,15 @@ $(srcdir)/config.h.in: @MAINTAINER_MODE_TRUE@ $(a=
m__configure_deps)
> >   distclean-hdr:
> >       -rm -f config.h stamp-h1
> >
> > @@ -19795,10 +20434,10 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >   install-libLTLIBRARIES: $(lib_LTLIBRARIES)
> >       @$(NORMAL_INSTALL)
> >       @list=3D'$(lib_LTLIBRARIES)'; test -n "$(libdir)" || list=3D; \
> > -@@ -618,36 +642,27 @@ clean-noinstLTLIBRARIES:
> > +@@ -666,36 +695,27 @@ clean-noinstLTLIBRARIES:
> >
> >   libsframe.la: $(libsframe_la_OBJECTS) $(libsframe_la_DEPENDENCIES) $(=
EXTRA_libsframe_la_DEPENDENCIES)
> > -     $(AM_V_CCLD)$(LINK) $(am_libsframe_la_rpath) $(libsframe_la_OBJEC=
TS) $(libsframe_la_LIBADD) $(LIBS)
> > +     $(AM_V_CCLD)$(libsframe_la_LINK) $(am_libsframe_la_rpath) $(libsf=
rame_la_OBJECTS) $(libsframe_la_LIBADD) $(LIBS)
> >  -
> >  -clean-checkPROGRAMS:
> >  -    @list=3D'$(check_PROGRAMS)'; test -n "$$list" || exit 0; \
> > @@ -19835,7 +20474,7 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >       testsuite/libsframe.decode/$(am__dirstamp) \
> >       testsuite/libsframe.decode/$(DEPDIR)/$(am__dirstamp)
> >
> > -@@ -660,7 +675,7 @@ testsuite/libsframe.encode/$(am__dirstamp):
> > +@@ -708,7 +728,7 @@ testsuite/libsframe.encode/$(am__dirstamp):
> >   testsuite/libsframe.encode/$(DEPDIR)/$(am__dirstamp):
> >       @$(MKDIR_P) testsuite/libsframe.encode/$(DEPDIR)
> >       @: > testsuite/libsframe.encode/$(DEPDIR)/$(am__dirstamp)
> > @@ -19844,7 +20483,32 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >       testsuite/libsframe.encode/$(am__dirstamp) \
> >       testsuite/libsframe.encode/$(DEPDIR)/$(am__dirstamp)
> >
> > -@@ -676,13 +691,19 @@ mostlyclean-compile:
> > +@@ -721,21 +741,21 @@ testsuite/libsframe.find/$(am__dirstamp):
> > + testsuite/libsframe.find/$(DEPDIR)/$(am__dirstamp):
> > +     @$(MKDIR_P) testsuite/libsframe.find/$(DEPDIR)
> > +     @: > testsuite/libsframe.find/$(DEPDIR)/$(am__dirstamp)
> > +-testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1=
.$(OBJEXT):  \
> > ++testsuite/libsframe.find/findfre_1-findfre-1.$(OBJEXT):  \
> > +     testsuite/libsframe.find/$(am__dirstamp) \
> > +     testsuite/libsframe.find/$(DEPDIR)/$(am__dirstamp)
> > +
> > + testsuite/libsframe.find/findfre-1$(EXEEXT): $(testsuite_libsframe_fi=
nd_findfre_1_OBJECTS) $(testsuite_libsframe_find_findfre_1_DEPENDENCIES) $(=
EXTRA_testsuite_libsframe_find_findfre_1_DEPENDENCIES) testsuite/libsframe.=
find/$(am__dirstamp)
> > +     @rm -f testsuite/libsframe.find/findfre-1$(EXEEXT)
> > +     $(AM_V_CCLD)$(LINK) $(testsuite_libsframe_find_findfre_1_OBJECTS)=
 $(testsuite_libsframe_find_findfre_1_LDADD) $(LIBS)
> > +-testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc=
-1.$(OBJEXT):  \
> > ++testsuite/libsframe.find/findfunc_1-findfunc-1.$(OBJEXT):  \
> > +     testsuite/libsframe.find/$(am__dirstamp) \
> > +     testsuite/libsframe.find/$(DEPDIR)/$(am__dirstamp)
> > +
> > + testsuite/libsframe.find/findfunc-1$(EXEEXT): $(testsuite_libsframe_f=
ind_findfunc_1_OBJECTS) $(testsuite_libsframe_find_findfunc_1_DEPENDENCIES)=
 $(EXTRA_testsuite_libsframe_find_findfunc_1_DEPENDENCIES) testsuite/libsfr=
ame.find/$(am__dirstamp)
> > +     @rm -f testsuite/libsframe.find/findfunc-1$(EXEEXT)
> > +     $(AM_V_CCLD)$(LINK) $(testsuite_libsframe_find_findfunc_1_OBJECTS=
) $(testsuite_libsframe_find_findfunc_1_LDADD) $(LIBS)
> > +-testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-f=
indfre-1.$(OBJEXT):  \
> > ++testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.$(OBJEXT):  \
> > +     testsuite/libsframe.find/$(am__dirstamp) \
> > +     testsuite/libsframe.find/$(DEPDIR)/$(am__dirstamp)
> > +
> > +@@ -752,16 +772,22 @@ mostlyclean-compile:
> >   distclean-compile:
> >       -rm -f *.tab.c
> >
> > @@ -19855,6 +20519,9 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >  -@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.decode/$(DEP=
DIR)/testsuite_libsframe_decode_frecnt_1-frecnt-1.Po@am__quote@
> >  -@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.decode/$(DEP=
DIR)/testsuite_libsframe_decode_frecnt_2-frecnt-2.Po@am__quote@
> >  -@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.encode/$(DEP=
DIR)/testsuite_libsframe_encode_encode_1-encode-1.Po@am__quote@
> > +-@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.find/$(DEPDI=
R)/testsuite_libsframe_find_findfre_1-findfre-1.Po@am__quote@
> > +-@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.find/$(DEPDI=
R)/testsuite_libsframe_find_findfunc_1-findfunc-1.Po@am__quote@
> > +-@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.find/$(DEPDI=
R)/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.Po@am__quote@
> >  +@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libsframe_la-sframe-=
dump.Plo@am__quote@ # am--include-marker
> >  +@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libsframe_la-sframe-=
error.Plo@am__quote@ # am--include-marker
> >  +@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libsframe_la-sframe.=
Plo@am__quote@ # am--include-marker
> > @@ -19862,6 +20529,9 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >  +@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.decode/$(DEP=
DIR)/frecnt_1-frecnt-1.Po@am__quote@ # am--include-marker
> >  +@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.decode/$(DEP=
DIR)/frecnt_2-frecnt-2.Po@am__quote@ # am--include-marker
> >  +@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.encode/$(DEP=
DIR)/encode_1-encode-1.Po@am__quote@ # am--include-marker
> > ++@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.find/$(DEPDI=
R)/findfre_1-findfre-1.Po@am__quote@ # am--include-marker
> > ++@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.find/$(DEPDI=
R)/findfunc_1-findfunc-1.Po@am__quote@ # am--include-marker
> > ++@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.find/$(DEPDI=
R)/plt_findfre_1-plt-findfre-1.Po@am__quote@ # am--include-marker
> >  +
> >  +$(am__depfiles_remade):
> >  +    @$(MKDIR_P) $(@D)
> > @@ -19871,7 +20541,7 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >
> >   .c.o:
> >   @am__fastdepCC_TRUE@        $(AM_V_CC)depbase=3D`echo $@ | sed 's|[^/=
]*$$|$(DEPDIR)/&|;s|\.o$$||'`;\
> > -@@ -729,61 +750,61 @@ libsframe_la-sframe-error.lo: sframe-error.c
> > +@@ -808,103 +834,103 @@ libsframe_la-sframe-error.lo: sframe-error.c
> >   @AMDEP_TRUE@@am__fastdepCC_FALSE@   DEPDIR=3D$(DEPDIR) $(CCDEPMODE) $=
(depcomp) @AMDEPBACKSLASH@
> >   @am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(LIBTOOL) $(AM_V_lt=
) --tag=3DCC $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) --mode=3Dcompile $(CC) $(DE=
FS) $(DEFAULT_INCLUDES) $(INCLUDES) $(libsframe_la_CPPFLAGS) $(CPPFLAGS) $(=
AM_CFLAGS) $(CFLAGS) -c -o libsframe_la-sframe-error.lo `test -f 'sframe-er=
ror.c' || echo '$(srcdir)/'`sframe-error.c
> >
> > @@ -19971,9 +20641,81 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >  -@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_encode_encode_1_CPPFLAGS) $=
(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.encode/testsuit=
e_libsframe_encode_encode_1-encode-1.obj `if test -f 'testsuite/libsframe.e=
ncode/encode-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.encode/encode-1.c=
'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.encode/encode-1.c'; fi`
> >  +@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_encode_encode_1_CPPFLAGS) $=
(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.encode/encode_1=
-encode-1.obj `if test -f 'testsuite/libsframe.encode/encode-1.c'; then $(C=
YGPATH_W) 'testsuite/libsframe.encode/encode-1.c'; else $(CYGPATH_W) '$(src=
dir)/testsuite/libsframe.encode/encode-1.c'; fi`
> >
> > +-testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1=
.o: testsuite/libsframe.find/findfre-1.c
> > +-@am__fastdepCC_TRUE@        $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDE=
S) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(CPPFLAGS) $=
(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/testsuite_libsframe_find=
_findfre_1-findfre-1.o -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/tests=
uite_libsframe_find_findfre_1-findfre-1.Tpo -c -o testsuite/libsframe.find/=
testsuite_libsframe_find_findfre_1-findfre-1.o `test -f 'testsuite/libsfram=
e.find/findfre-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/findfre-1=
.c
> > +-@am__fastdepCC_TRUE@        $(AM_V_at)$(am__mv) testsuite/libsframe.f=
ind/$(DEPDIR)/testsuite_libsframe_find_findfre_1-findfre-1.Tpo testsuite/li=
bsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfre_1-findfre-1.Po
> > +-@AMDEP_TRUE@@am__fastdepCC_FALSE@   $(AM_V_CC)source=3D'testsuite/lib=
sframe.find/findfre-1.c' object=3D'testsuite/libsframe.find/testsuite_libsf=
rame_find_findfre_1-findfre-1.o' libtool=3Dno @AMDEPBACKSLASH@
> > ++testsuite/libsframe.find/findfre_1-findfre-1.o: testsuite/libsframe.f=
ind/findfre-1.c
> > ++@am__fastdepCC_TRUE@        $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDE=
S) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(CPPFLAGS) $=
(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/findfre_1-findfre-1.o -M=
D -MP -MF testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Tpo -c -o =
testsuite/libsframe.find/findfre_1-findfre-1.o `test -f 'testsuite/libsfram=
e.find/findfre-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/findfre-1=
.c
> > ++@am__fastdepCC_TRUE@        $(AM_V_at)$(am__mv) testsuite/libsframe.f=
ind/$(DEPDIR)/findfre_1-findfre-1.Tpo testsuite/libsframe.find/$(DEPDIR)/fi=
ndfre_1-findfre-1.Po
> > ++@AMDEP_TRUE@@am__fastdepCC_FALSE@   $(AM_V_CC)source=3D'testsuite/lib=
sframe.find/findfre-1.c' object=3D'testsuite/libsframe.find/findfre_1-findf=
re-1.o' libtool=3Dno @AMDEPBACKSLASH@
> > + @AMDEP_TRUE@@am__fastdepCC_FALSE@   DEPDIR=3D$(DEPDIR) $(CCDEPMODE) $=
(depcomp) @AMDEPBACKSLASH@
> > +-@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(=
CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/testsuite_l=
ibsframe_find_findfre_1-findfre-1.o `test -f 'testsuite/libsframe.find/find=
fre-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/findfre-1.c
> > ++@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(=
CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/findfre_1-f=
indfre-1.o `test -f 'testsuite/libsframe.find/findfre-1.c' || echo '$(srcdi=
r)/'`testsuite/libsframe.find/findfre-1.c
> > +
> > +-testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1=
.obj: testsuite/libsframe.find/findfre-1.c
> > +-@am__fastdepCC_TRUE@        $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDE=
S) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(CPPFLAGS) $=
(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/testsuite_libsframe_find=
_findfre_1-findfre-1.obj -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/tes=
tsuite_libsframe_find_findfre_1-findfre-1.Tpo -c -o testsuite/libsframe.fin=
d/testsuite_libsframe_find_findfre_1-findfre-1.obj `if test -f 'testsuite/l=
ibsframe.find/findfre-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/fin=
dfre-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/findfre-1.=
c'; fi`
> > +-@am__fastdepCC_TRUE@        $(AM_V_at)$(am__mv) testsuite/libsframe.f=
ind/$(DEPDIR)/testsuite_libsframe_find_findfre_1-findfre-1.Tpo testsuite/li=
bsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfre_1-findfre-1.Po
> > +-@AMDEP_TRUE@@am__fastdepCC_FALSE@   $(AM_V_CC)source=3D'testsuite/lib=
sframe.find/findfre-1.c' object=3D'testsuite/libsframe.find/testsuite_libsf=
rame_find_findfre_1-findfre-1.obj' libtool=3Dno @AMDEPBACKSLASH@
> > ++testsuite/libsframe.find/findfre_1-findfre-1.obj: testsuite/libsframe=
.find/findfre-1.c
> > ++@am__fastdepCC_TRUE@        $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDE=
S) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(CPPFLAGS) $=
(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/findfre_1-findfre-1.obj =
-MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Tpo -c -=
o testsuite/libsframe.find/findfre_1-findfre-1.obj `if test -f 'testsuite/l=
ibsframe.find/findfre-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/fin=
dfre-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/findfre-1.=
c'; fi`
> > ++@am__fastdepCC_TRUE@        $(AM_V_at)$(am__mv) testsuite/libsframe.f=
ind/$(DEPDIR)/findfre_1-findfre-1.Tpo testsuite/libsframe.find/$(DEPDIR)/fi=
ndfre_1-findfre-1.Po
> > ++@AMDEP_TRUE@@am__fastdepCC_FALSE@   $(AM_V_CC)source=3D'testsuite/lib=
sframe.find/findfre-1.c' object=3D'testsuite/libsframe.find/findfre_1-findf=
re-1.obj' libtool=3Dno @AMDEPBACKSLASH@
> > + @AMDEP_TRUE@@am__fastdepCC_FALSE@   DEPDIR=3D$(DEPDIR) $(CCDEPMODE) $=
(depcomp) @AMDEPBACKSLASH@
> > +-@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(=
CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/testsuite_l=
ibsframe_find_findfre_1-findfre-1.obj `if test -f 'testsuite/libsframe.find=
/findfre-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/findfre-1.c'; el=
se $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/findfre-1.c'; fi`
> > ++@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(=
CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/findfre_1-f=
indfre-1.obj `if test -f 'testsuite/libsframe.find/findfre-1.c'; then $(CYG=
PATH_W) 'testsuite/libsframe.find/findfre-1.c'; else $(CYGPATH_W) '$(srcdir=
)/testsuite/libsframe.find/findfre-1.c'; fi`
> > +
> > +-testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc=
-1.o: testsuite/libsframe.find/findfunc-1.c
> > +-@am__fastdepCC_TRUE@        $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDE=
S) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $(CPPFLAGS) =
$(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/testsuite_libsframe_fin=
d_findfunc_1-findfunc-1.o -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/te=
stsuite_libsframe_find_findfunc_1-findfunc-1.Tpo -c -o testsuite/libsframe.=
find/testsuite_libsframe_find_findfunc_1-findfunc-1.o `test -f 'testsuite/l=
ibsframe.find/findfunc-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/f=
indfunc-1.c
> > +-@am__fastdepCC_TRUE@        $(AM_V_at)$(am__mv) testsuite/libsframe.f=
ind/$(DEPDIR)/testsuite_libsframe_find_findfunc_1-findfunc-1.Tpo testsuite/=
libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfunc_1-findfunc-1.Po
> > +-@AMDEP_TRUE@@am__fastdepCC_FALSE@   $(AM_V_CC)source=3D'testsuite/lib=
sframe.find/findfunc-1.c' object=3D'testsuite/libsframe.find/testsuite_libs=
frame_find_findfunc_1-findfunc-1.o' libtool=3Dno @AMDEPBACKSLASH@
> > ++testsuite/libsframe.find/findfunc_1-findfunc-1.o: testsuite/libsframe=
.find/findfunc-1.c
> > ++@am__fastdepCC_TRUE@        $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDE=
S) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $(CPPFLAGS) =
$(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/findfunc_1-findfunc-1.o=
 -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.Tpo -=
c -o testsuite/libsframe.find/findfunc_1-findfunc-1.o `test -f 'testsuite/l=
ibsframe.find/findfunc-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/f=
indfunc-1.c
> > ++@am__fastdepCC_TRUE@        $(AM_V_at)$(am__mv) testsuite/libsframe.f=
ind/$(DEPDIR)/findfunc_1-findfunc-1.Tpo testsuite/libsframe.find/$(DEPDIR)/=
findfunc_1-findfunc-1.Po
> > ++@AMDEP_TRUE@@am__fastdepCC_FALSE@   $(AM_V_CC)source=3D'testsuite/lib=
sframe.find/findfunc-1.c' object=3D'testsuite/libsframe.find/findfunc_1-fin=
dfunc-1.o' libtool=3Dno @AMDEPBACKSLASH@
> > + @AMDEP_TRUE@@am__fastdepCC_FALSE@   DEPDIR=3D$(DEPDIR) $(CCDEPMODE) $=
(depcomp) @AMDEPBACKSLASH@
> > +-@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $=
(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/testsuite_=
libsframe_find_findfunc_1-findfunc-1.o `test -f 'testsuite/libsframe.find/f=
indfunc-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/findfunc-1.c
> > ++@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $=
(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/findfunc_1=
-findfunc-1.o `test -f 'testsuite/libsframe.find/findfunc-1.c' || echo '$(s=
rcdir)/'`testsuite/libsframe.find/findfunc-1.c
> > +
> > +-testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc=
-1.obj: testsuite/libsframe.find/findfunc-1.c
> > +-@am__fastdepCC_TRUE@        $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDE=
S) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $(CPPFLAGS) =
$(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/testsuite_libsframe_fin=
d_findfunc_1-findfunc-1.obj -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/=
testsuite_libsframe_find_findfunc_1-findfunc-1.Tpo -c -o testsuite/libsfram=
e.find/testsuite_libsframe_find_findfunc_1-findfunc-1.obj `if test -f 'test=
suite/libsframe.find/findfunc-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.=
find/findfunc-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/f=
indfunc-1.c'; fi`
> > +-@am__fastdepCC_TRUE@        $(AM_V_at)$(am__mv) testsuite/libsframe.f=
ind/$(DEPDIR)/testsuite_libsframe_find_findfunc_1-findfunc-1.Tpo testsuite/=
libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfunc_1-findfunc-1.Po
> > +-@AMDEP_TRUE@@am__fastdepCC_FALSE@   $(AM_V_CC)source=3D'testsuite/lib=
sframe.find/findfunc-1.c' object=3D'testsuite/libsframe.find/testsuite_libs=
frame_find_findfunc_1-findfunc-1.obj' libtool=3Dno @AMDEPBACKSLASH@
> > ++testsuite/libsframe.find/findfunc_1-findfunc-1.obj: testsuite/libsfra=
me.find/findfunc-1.c
> > ++@am__fastdepCC_TRUE@        $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDE=
S) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $(CPPFLAGS) =
$(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/findfunc_1-findfunc-1.o=
bj -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.Tpo=
 -c -o testsuite/libsframe.find/findfunc_1-findfunc-1.obj `if test -f 'test=
suite/libsframe.find/findfunc-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.=
find/findfunc-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/f=
indfunc-1.c'; fi`
> > ++@am__fastdepCC_TRUE@        $(AM_V_at)$(am__mv) testsuite/libsframe.f=
ind/$(DEPDIR)/findfunc_1-findfunc-1.Tpo testsuite/libsframe.find/$(DEPDIR)/=
findfunc_1-findfunc-1.Po
> > ++@AMDEP_TRUE@@am__fastdepCC_FALSE@   $(AM_V_CC)source=3D'testsuite/lib=
sframe.find/findfunc-1.c' object=3D'testsuite/libsframe.find/findfunc_1-fin=
dfunc-1.obj' libtool=3Dno @AMDEPBACKSLASH@
> > + @AMDEP_TRUE@@am__fastdepCC_FALSE@   DEPDIR=3D$(DEPDIR) $(CCDEPMODE) $=
(depcomp) @AMDEPBACKSLASH@
> > +-@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $=
(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/testsuite_=
libsframe_find_findfunc_1-findfunc-1.obj `if test -f 'testsuite/libsframe.f=
ind/findfunc-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/findfunc-1.c=
'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/findfunc-1.c'; fi`
> > ++@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $=
(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/findfunc_1=
-findfunc-1.obj `if test -f 'testsuite/libsframe.find/findfunc-1.c'; then $=
(CYGPATH_W) 'testsuite/libsframe.find/findfunc-1.c'; else $(CYGPATH_W) '$(s=
rcdir)/testsuite/libsframe.find/findfunc-1.c'; fi`
> > +
> > +-testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-f=
indfre-1.o: testsuite/libsframe.find/plt-findfre-1.c
> > +-@am__fastdepCC_TRUE@        $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDE=
S) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS) $(CPPFLAG=
S) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/testsuite_libsframe_=
find_plt_findfre_1-plt-findfre-1.o -MD -MP -MF testsuite/libsframe.find/$(D=
EPDIR)/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.Tpo -c -o tests=
uite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.o =
`test -f 'testsuite/libsframe.find/plt-findfre-1.c' || echo '$(srcdir)/'`te=
stsuite/libsframe.find/plt-findfre-1.c
> > +-@am__fastdepCC_TRUE@        $(AM_V_at)$(am__mv) testsuite/libsframe.f=
ind/$(DEPDIR)/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.Tpo test=
suite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_plt_findfre_1-plt-f=
indfre-1.Po
> > +-@AMDEP_TRUE@@am__fastdepCC_FALSE@   $(AM_V_CC)source=3D'testsuite/lib=
sframe.find/plt-findfre-1.c' object=3D'testsuite/libsframe.find/testsuite_l=
ibsframe_find_plt_findfre_1-plt-findfre-1.o' libtool=3Dno @AMDEPBACKSLASH@
> > ++testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.o: testsuite/lib=
sframe.find/plt-findfre-1.c
> > ++@am__fastdepCC_TRUE@        $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDE=
S) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS) $(CPPFLAG=
S) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/plt_findfre_1-plt-fi=
ndfre-1.o -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-=
findfre-1.Tpo -c -o testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.o =
`test -f 'testsuite/libsframe.find/plt-findfre-1.c' || echo '$(srcdir)/'`te=
stsuite/libsframe.find/plt-findfre-1.c
> > ++@am__fastdepCC_TRUE@        $(AM_V_at)$(am__mv) testsuite/libsframe.f=
ind/$(DEPDIR)/plt_findfre_1-plt-findfre-1.Tpo testsuite/libsframe.find/$(DE=
PDIR)/plt_findfre_1-plt-findfre-1.Po
> > ++@AMDEP_TRUE@@am__fastdepCC_FALSE@   $(AM_V_CC)source=3D'testsuite/lib=
sframe.find/plt-findfre-1.c' object=3D'testsuite/libsframe.find/plt_findfre=
_1-plt-findfre-1.o' libtool=3Dno @AMDEPBACKSLASH@
> > + @AMDEP_TRUE@@am__fastdepCC_FALSE@   DEPDIR=3D$(DEPDIR) $(CCDEPMODE) $=
(depcomp) @AMDEPBACKSLASH@
> > +-@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS=
) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/testsui=
te_libsframe_find_plt_findfre_1-plt-findfre-1.o `test -f 'testsuite/libsfra=
me.find/plt-findfre-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/plt-=
findfre-1.c
> > ++@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS=
) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/plt_fin=
dfre_1-plt-findfre-1.o `test -f 'testsuite/libsframe.find/plt-findfre-1.c' =
|| echo '$(srcdir)/'`testsuite/libsframe.find/plt-findfre-1.c
> > +
> > +-testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-f=
indfre-1.obj: testsuite/libsframe.find/plt-findfre-1.c
> > +-@am__fastdepCC_TRUE@        $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDE=
S) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS) $(CPPFLAG=
S) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/testsuite_libsframe_=
find_plt_findfre_1-plt-findfre-1.obj -MD -MP -MF testsuite/libsframe.find/$=
(DEPDIR)/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.Tpo -c -o tes=
tsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.=
obj `if test -f 'testsuite/libsframe.find/plt-findfre-1.c'; then $(CYGPATH_=
W) 'testsuite/libsframe.find/plt-findfre-1.c'; else $(CYGPATH_W) '$(srcdir)=
/testsuite/libsframe.find/plt-findfre-1.c'; fi`
> > +-@am__fastdepCC_TRUE@        $(AM_V_at)$(am__mv) testsuite/libsframe.f=
ind/$(DEPDIR)/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.Tpo test=
suite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_plt_findfre_1-plt-f=
indfre-1.Po
> > +-@AMDEP_TRUE@@am__fastdepCC_FALSE@   $(AM_V_CC)source=3D'testsuite/lib=
sframe.find/plt-findfre-1.c' object=3D'testsuite/libsframe.find/testsuite_l=
ibsframe_find_plt_findfre_1-plt-findfre-1.obj' libtool=3Dno @AMDEPBACKSLASH=
@
> > ++testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.obj: testsuite/l=
ibsframe.find/plt-findfre-1.c
> > ++@am__fastdepCC_TRUE@        $(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDE=
S) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS) $(CPPFLAG=
S) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/plt_findfre_1-plt-fi=
ndfre-1.obj -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-pl=
t-findfre-1.Tpo -c -o testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.=
obj `if test -f 'testsuite/libsframe.find/plt-findfre-1.c'; then $(CYGPATH_=
W) 'testsuite/libsframe.find/plt-findfre-1.c'; else $(CYGPATH_W) '$(srcdir)=
/testsuite/libsframe.find/plt-findfre-1.c'; fi`
> > ++@am__fastdepCC_TRUE@        $(AM_V_at)$(am__mv) testsuite/libsframe.f=
ind/$(DEPDIR)/plt_findfre_1-plt-findfre-1.Tpo testsuite/libsframe.find/$(DE=
PDIR)/plt_findfre_1-plt-findfre-1.Po
> > ++@AMDEP_TRUE@@am__fastdepCC_FALSE@   $(AM_V_CC)source=3D'testsuite/lib=
sframe.find/plt-findfre-1.c' object=3D'testsuite/libsframe.find/plt_findfre=
_1-plt-findfre-1.obj' libtool=3Dno @AMDEPBACKSLASH@
> > + @AMDEP_TRUE@@am__fastdepCC_FALSE@   DEPDIR=3D$(DEPDIR) $(CCDEPMODE) $=
(depcomp) @AMDEPBACKSLASH@
> > +-@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS=
) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/testsui=
te_libsframe_find_plt_findfre_1-plt-findfre-1.obj `if test -f 'testsuite/li=
bsframe.find/plt-findfre-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/=
plt-findfre-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/plt=
-findfre-1.c'; fi`
> > ++@am__fastdepCC_FALSE@       $(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFA=
ULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS=
) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/plt_fin=
dfre_1-plt-findfre-1.obj `if test -f 'testsuite/libsframe.find/plt-findfre-=
1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/plt-findfre-1.c'; else $(=
CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/plt-findfre-1.c'; fi`
> > +
> >   mostlyclean-libtool:
> >       -rm -f *.lo
> > -@@ -1020,7 +1041,7 @@ site.exp: Makefile $(EXTRA_DEJAGNU_SITE_CONFIG)
> > +@@ -1142,7 +1168,7 @@ site.exp: Makefile $(EXTRA_DEJAGNU_SITE_CONFIG)
> >       @echo '# Do not edit here.  If you wish to override these values'=
 >>site.tmp
> >       @echo '# edit the last section' >>site.tmp
> >       @echo 'set srcdir "$(srcdir)"' >>site.tmp
> > @@ -19982,7 +20724,7 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >       @echo 'set build_alias "$(build_alias)"' >>site.tmp
> >       @echo 'set build_triplet $(build_triplet)' >>site.tmp
> >       @echo 'set host_alias "$(host_alias)"' >>site.tmp
> > -@@ -1044,8 +1065,10 @@ distclean-DEJAGNU:
> > +@@ -1166,8 +1192,10 @@ distclean-DEJAGNU:
> >       -l=3D'$(DEJATOOL)'; for tool in $$l; do \
> >         rm -f $$tool.sum $$tool.log; \
> >       done
> > @@ -19994,7 +20736,7 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >       $(am__remove_distdir)
> >       test -d "$(distdir)" || mkdir "$(distdir)"
> >       @srcdirstrip=3D`echo "$(srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; =
\
> > -@@ -1103,6 +1126,10 @@ dist-xz: distdir
> > +@@ -1225,6 +1253,10 @@ dist-xz: distdir
> >       tardir=3D$(distdir) && $(am__tar) | XZ_OPT=3D$${XZ_OPT--e} xz -c =
>$(distdir).tar.xz
> >       $(am__post_remove_distdir)
> >
> > @@ -20005,7 +20747,7 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >   dist-tarZ: distdir
> >       @echo WARNING: "Support for distribution archives compressed with=
" \
> >                      "legacy program 'compress' is deprecated." >&2
> > -@@ -1145,6 +1172,8 @@ distcheck: dist
> > +@@ -1267,6 +1299,8 @@ distcheck: dist
> >         eval GZIP=3D gzip $(GZIP_ENV) -dc $(distdir).shar.gz | unshar ;=
;\
> >       *.zip*) \
> >         unzip $(distdir).zip ;;\
> > @@ -20014,7 +20756,7 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >       esac
> >       chmod -R a-w $(distdir)
> >       chmod u+w $(distdir)
> > -@@ -1160,7 +1189,7 @@ distcheck: dist
> > +@@ -1282,7 +1316,7 @@ distcheck: dist
> >           $(DISTCHECK_CONFIGURE_FLAGS) \
> >           --srcdir=3D../.. --prefix=3D"$$dc_install_base" \
> >         && $(MAKE) $(AM_MAKEFLAGS) \
> > @@ -20023,7 +20765,7 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >         && $(MAKE) $(AM_MAKEFLAGS) check \
> >         && $(MAKE) $(AM_MAKEFLAGS) install \
> >         && $(MAKE) $(AM_MAKEFLAGS) installcheck \
> > -@@ -1216,6 +1245,8 @@ check-am: all-am
> > +@@ -1338,6 +1372,8 @@ check-am: all-am
> >       $(MAKE) $(AM_MAKEFLAGS) check-DEJAGNU
> >   check: check-am
> >   all-am: Makefile $(INFO_DEPS) $(LTLIBRARIES) $(HEADERS) config.h
> > @@ -20032,11 +20774,11 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >   installdirs:
> >       for dir in "$(DESTDIR)$(libdir)" "$(DESTDIR)$(infodir)" "$(DESTDI=
R)$(includedir)"; do \
> >         test -z "$$dir" || $(MKDIR_P) "$$dir"; \
> > -@@ -1266,7 +1297,13 @@ clean-am: clean-aminfo clean-checkPROGRAMS clea=
n-generic \
> > +@@ -1390,7 +1426,16 @@ clean-am: clean-aminfo clean-checkPROGRAMS clea=
n-generic \
> >
> >   distclean: distclean-am
> >       -rm -f $(am__CONFIG_DISTCLEAN_FILES)
> > --    -rm -rf ./$(DEPDIR) testsuite/libsframe.decode/$(DEPDIR) testsuit=
e/libsframe.encode/$(DEPDIR)
> > +-    -rm -rf ./$(DEPDIR) testsuite/libsframe.decode/$(DEPDIR) testsuit=
e/libsframe.encode/$(DEPDIR) testsuite/libsframe.find/$(DEPDIR)
> >  +            -rm -f ./$(DEPDIR)/libsframe_la-sframe-dump.Plo
> >  +    -rm -f ./$(DEPDIR)/libsframe_la-sframe-error.Plo
> >  +    -rm -f ./$(DEPDIR)/libsframe_la-sframe.Plo
> > @@ -20044,14 +20786,17 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >  +    -rm -f testsuite/libsframe.decode/$(DEPDIR)/frecnt_1-frecnt-1.Po
> >  +    -rm -f testsuite/libsframe.decode/$(DEPDIR)/frecnt_2-frecnt-2.Po
> >  +    -rm -f testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Po
> > ++    -rm -f testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Po
> > ++    -rm -f testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.P=
o
> > ++    -rm -f testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-findf=
re-1.Po
> >       -rm -f Makefile
> >   distclean-am: clean-am distclean-DEJAGNU distclean-compile \
> >       distclean-generic distclean-hdr distclean-libtool \
> > -@@ -1406,7 +1443,13 @@ installcheck-am:
> > +@@ -1530,7 +1575,16 @@ installcheck-am:
> >   maintainer-clean: maintainer-clean-am
> >       -rm -f $(am__CONFIG_DISTCLEAN_FILES)
> >       -rm -rf $(top_srcdir)/autom4te.cache
> > --    -rm -rf ./$(DEPDIR) testsuite/libsframe.decode/$(DEPDIR) testsuit=
e/libsframe.encode/$(DEPDIR)
> > +-    -rm -rf ./$(DEPDIR) testsuite/libsframe.decode/$(DEPDIR) testsuit=
e/libsframe.encode/$(DEPDIR) testsuite/libsframe.find/$(DEPDIR)
> >  +            -rm -f ./$(DEPDIR)/libsframe_la-sframe-dump.Plo
> >  +    -rm -f ./$(DEPDIR)/libsframe_la-sframe-error.Plo
> >  +    -rm -f ./$(DEPDIR)/libsframe_la-sframe.Plo
> > @@ -20059,10 +20804,13 @@ index 107b82ccfdc..4a4459bf5eb 100644
> >  +    -rm -f testsuite/libsframe.decode/$(DEPDIR)/frecnt_1-frecnt-1.Po
> >  +    -rm -f testsuite/libsframe.decode/$(DEPDIR)/frecnt_2-frecnt-2.Po
> >  +    -rm -f testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Po
> > ++    -rm -f testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Po
> > ++    -rm -f testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.P=
o
> > ++    -rm -f testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-findf=
re-1.Po
> >       -rm -f Makefile
> >   maintainer-clean-am: distclean-am maintainer-clean-aminfo \
> >       maintainer-clean-generic
> > -@@ -1430,28 +1473,28 @@ uninstall-am: uninstall-dvi-am uninstall-html-=
am \
> > +@@ -1554,28 +1608,28 @@ uninstall-am: uninstall-dvi-am uninstall-html-=
am \
> >
> >   .MAKE: all check-am install-am install-strip
> >
> > @@ -20561,10 +21309,10 @@ index b0cdd6b184d..c83d4f62ece 100644
> >   # This file is free software; the Free Software Foundation
> >   # gives unlimited permission to copy and/or distribute it,
> >  diff --git a/libsframe/configure b/libsframe/configure
> > -index 7bbed5d8ccf..795e7802110 100755
> > +index f7ad9c5e29a..78e875956ae 100755
> >  --- a/libsframe/configure
> >  +++ b/libsframe/configure
> > -@@ -654,6 +654,8 @@ OTOOL
> > +@@ -658,6 +658,8 @@ OTOOL
> >   LIPO
> >   NMEDIT
> >   DSYMUTIL
> > @@ -20573,7 +21321,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   OBJDUMP
> >   LN_S
> >   NM
> > -@@ -678,6 +680,9 @@ AM_BACKSLASH
> > +@@ -682,6 +684,9 @@ AM_BACKSLASH
> >   AM_DEFAULT_VERBOSITY
> >   AM_DEFAULT_V
> >   AM_V
> > @@ -20583,7 +21331,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   am__fastdepCC_FALSE
> >   am__fastdepCC_TRUE
> >   CCDEPMODE
> > -@@ -685,7 +690,6 @@ am__nodep
> > +@@ -689,7 +694,6 @@ am__nodep
> >   AMDEPBACKSLASH
> >   AMDEP_FALSE
> >   AMDEP_TRUE
> > @@ -20591,7 +21339,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   am__include
> >   DEPDIR
> >   am__untar
> > -@@ -758,7 +762,8 @@ PACKAGE_VERSION
> > +@@ -762,7 +766,8 @@ PACKAGE_VERSION
> >   PACKAGE_TARNAME
> >   PACKAGE_NAME
> >   PATH_SEPARATOR
> > @@ -20601,7 +21349,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   ac_subst_files=3D''
> >   ac_user_opts=3D'
> >   enable_option_checking
> > -@@ -769,6 +774,7 @@ enable_static
> > +@@ -773,6 +778,7 @@ enable_static
> >   with_pic
> >   enable_fast_install
> >   with_gnu_ld
> > @@ -20609,7 +21357,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   enable_libtool_lock
> >   enable_largefile
> >   enable_maintainer_mode
> > -@@ -1424,6 +1430,8 @@ Optional Packages:
> > +@@ -1428,6 +1434,8 @@ Optional Packages:
> >     --with-pic              try to use only PIC/non-PIC objects [defaul=
t=3Duse
> >                             both]
> >     --with-gnu-ld           assume the C compiler uses GNU ld [default=
=3Dno]
> > @@ -20618,7 +21366,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >   Some influential environment variables:
> >     CC          C compiler command
> > -@@ -3606,7 +3614,7 @@ $as_echo "$ac_cv_safe_to_define___extensions__" =
>&6; }
> > +@@ -3610,7 +3618,7 @@ $as_echo "$ac_cv_safe_to_define___extensions__" =
>&6; }
> >     $as_echo "#define _TANDEM_SOURCE 1" >>confdefs.h
> >
> >
> > @@ -20627,7 +21375,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >   # Find a good install program.  We prefer a C program (faster),
> >   # so one script is as good as another.  But avoid the broken or
> > -@@ -3779,12 +3787,7 @@ ac_script=3D's/[\\$]/&&/g;s/;s,x,x,$//'
> > +@@ -3783,12 +3791,7 @@ ac_script=3D's/[\\$]/&&/g;s/;s,x,x,$//'
> >   program_transform_name=3D`$as_echo "$program_transform_name" | sed "$=
ac_script"`
> >
> >   if test x"${MISSING+set}" !=3D xset; then
> > @@ -20641,7 +21389,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   fi
> >   # Use eval to expand $SHELL
> >   if eval "$MISSING --is-lightweight"; then
> > -@@ -4032,45 +4035,45 @@ DEPDIR=3D"${am__leading_dot}deps"
> > +@@ -4036,45 +4039,45 @@ DEPDIR=3D"${am__leading_dot}deps"
> >
> >   ac_config_commands=3D"$ac_config_commands depfiles"
> >
> > @@ -20720,7 +21468,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >   # Check whether --enable-dependency-tracking was given.
> >   if test "${enable_dependency_tracking+set}" =3D set; then :
> > -@@ -4182,8 +4185,8 @@ MAKEINFO=3D${MAKEINFO-"${am_missing_run}makeinfo=
"}
> > +@@ -4186,8 +4189,8 @@ MAKEINFO=3D${MAKEINFO-"${am_missing_run}makeinfo=
"}
> >
> >   # For better backward compatibility.  To be removed once Automake 1.9=
.x
> >   # dies out for good.  For more background, see:
> > @@ -20731,7 +21479,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   mkdir_p=3D'$(MKDIR_P)'
> >
> >   # We need awk for the "check" target (and possibly the TAP driver).  =
The
> > -@@ -4330,6 +4333,20 @@ else
> > +@@ -4334,6 +4337,20 @@ else
> >   fi
> >
> >
> > @@ -20752,7 +21500,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >   # POSIX will say in a future version that running "rm -f" with no arg=
ument
> >   # is OK; and we want to be able to make that assumption in our Makefi=
le
> > -@@ -4362,7 +4379,7 @@ END
> > +@@ -4366,7 +4383,7 @@ END
> >   Aborting the configuration process, to ensure you take notice of the =
issue.
> >
> >   You can download and install GNU coreutils to get an 'rm' implementat=
ion
> > @@ -20761,7 +21509,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >   If you want to complete the configuration process using your problema=
tic
> >   'rm' anyway, export the environment variable ACCEPT_INFERIOR_RM_PROGR=
AM
> > -@@ -5308,8 +5325,8 @@ esac
> > +@@ -5351,8 +5368,8 @@ esac
> >
> >
> >
> > @@ -20772,7 +21520,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >
> >
> > -@@ -5420,7 +5437,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > +@@ -5463,7 +5480,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print string=
s" >&5
> >   $as_echo_n "checking how to print strings... " >&6; }
> >   # Test print first, because it will be a builtin if present.
> > @@ -20781,7 +21529,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> >     ECHO=3D'print -r --'
> >   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -@@ -6113,8 +6130,8 @@ $as_echo_n "checking whether the shell understan=
ds some XSI constructs... " >&6;
> > +@@ -6156,8 +6173,8 @@ $as_echo_n "checking whether the shell understan=
ds some XSI constructs... " >&6;
> >   # Try some XSI features
> >   xsi_shell=3Dno
> >   ( _lt_dummy=3D"a/b/c"
> > @@ -20792,7 +21540,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >       && eval 'test $(( 1 + 1 )) -eq 2 \
> >       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> >     && xsi_shell=3Dyes
> > -@@ -6163,6 +6180,80 @@ esac
> > +@@ -6206,6 +6223,80 @@ esac
> >
> >
> >
> > @@ -20873,7 +21621,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to r=
eload object files" >&5
> >   $as_echo_n "checking for $LD option to reload object files... " >&6; =
}
> >   if ${lt_cv_ld_reload_flag+:} false; then :
> > -@@ -6179,6 +6270,11 @@ case $reload_flag in
> > +@@ -6222,6 +6313,11 @@ case $reload_flag in
> >   esac
> >   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> >   case $host_os in
> > @@ -20885,7 +21633,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >     darwin*)
> >       if test "$GCC" =3D yes; then
> >         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$rel=
oad_objs'
> > -@@ -6347,7 +6443,8 @@ mingw* | pw32*)
> > +@@ -6390,7 +6486,8 @@ mingw* | pw32*)
> >       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86=
 DLL'
> >       lt_cv_file_magic_cmd=3D'func_win32_libid'
> >     else
> > @@ -20895,7 +21643,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> >     fi
> >     ;;
> > -@@ -6501,6 +6598,21 @@ esac
> > +@@ -6544,6 +6641,21 @@ esac
> >   fi
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check=
_method" >&5
> >   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> > @@ -20917,7 +21665,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   file_magic_cmd=3D$lt_cv_file_magic_cmd
> >   deplibs_check_method=3D$lt_cv_deplibs_check_method
> >   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> > -@@ -6516,6 +6628,157 @@ test -z "$deplibs_check_method" && deplibs_che=
ck_method=3Dunknown
> > +@@ -6559,6 +6671,157 @@ test -z "$deplibs_check_method" && deplibs_che=
ck_method=3Dunknown
> >
> >
> >
> > @@ -21075,7 +21823,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   plugin_option=3D
> >   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.=
dll"
> >   for plugin in $plugin_names; do
> > -@@ -6530,8 +6793,10 @@ for plugin in $plugin_names; do
> > +@@ -6573,8 +6836,10 @@ for plugin in $plugin_names; do
> >   done
> >
> >   if test -n "$ac_tool_prefix"; then
> > @@ -21088,7 +21836,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_AR+:} false; then :
> > -@@ -6547,7 +6812,7 @@ do
> > +@@ -6590,7 +6855,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -21097,7 +21845,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -6567,11 +6832,15 @@ $as_echo "no" >&6; }
> > +@@ -6610,11 +6875,15 @@ $as_echo "no" >&6; }
> >   fi
> >
> >
> > @@ -21116,7 +21864,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> > -@@ -6587,7 +6856,7 @@ do
> > +@@ -6630,7 +6899,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -21125,7 +21873,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -6606,6 +6875,10 @@ else
> > +@@ -6649,6 +6918,10 @@ else
> >   $as_echo "no" >&6; }
> >   fi
> >
> > @@ -21136,7 +21884,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >     if test "x$ac_ct_AR" =3D x; then
> >       AR=3D"false"
> >     else
> > -@@ -6617,29 +6890,81 @@ ac_tool_warned=3Dyes ;;
> > +@@ -6660,29 +6933,81 @@ ac_tool_warned=3Dyes ;;
> >   esac
> >       AR=3D$ac_ct_AR
> >     fi
> > @@ -21233,7 +21981,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >
> >
> > -@@ -6986,8 +7311,8 @@ esac
> > +@@ -7029,8 +7354,8 @@ esac
> >   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern=
 int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> >
> >   # Transform an extracted symbol line into symbol name and symbol addr=
ess
> > @@ -21244,7 +21992,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >   # Handle CRLF in mingw tool chain
> >   opt_cr=3D
> > -@@ -7023,6 +7348,7 @@ for ac_symprfx in "" "_"; do
> > +@@ -7066,6 +7391,7 @@ for ac_symprfx in "" "_"; do
> >     else
> >       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[  ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> >     fi
> > @@ -21252,7 +22000,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >     # Check to see that the pipe works correctly.
> >     pipe_works=3Dno
> > -@@ -7064,6 +7390,18 @@ _LT_EOF
> > +@@ -7107,6 +7433,18 @@ _LT_EOF
> >         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> >       if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> >         cat <<_LT_EOF > conftest.$ac_ext
> > @@ -21271,7 +22019,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   #ifdef __cplusplus
> >   extern "C" {
> >   #endif
> > -@@ -7075,7 +7413,7 @@ _LT_EOF
> > +@@ -7118,7 +7456,7 @@ _LT_EOF
> >         cat <<_LT_EOF >> conftest.$ac_ext
> >
> >   /* The mapping between symbol names and symbols.  */
> > @@ -21280,7 +22028,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >     const char *name;
> >     void       *address;
> >   }
> > -@@ -7101,8 +7439,8 @@ static const void *lt_preloaded_setup() {
> > +@@ -7144,8 +7482,8 @@ static const void *lt_preloaded_setup() {
> >   _LT_EOF
> >         # Now try linking the two files.
> >         mv conftest.$ac_objext conftstm.$ac_objext
> > @@ -21291,7 +22039,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         LIBS=3D"conftstm.$ac_objext"
> >         CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> >         if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> > -@@ -7112,8 +7450,8 @@ _LT_EOF
> > +@@ -7155,8 +7493,8 @@ _LT_EOF
> >     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> >           pipe_works=3Dyes
> >         fi
> > @@ -21302,7 +22050,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >       else
> >         echo "cannot find nm_test_func in $nlist" >&5
> >       fi
> > -@@ -7150,6 +7488,16 @@ else
> > +@@ -7193,6 +7531,16 @@ else
> >   $as_echo "ok" >&6; }
> >   fi
> >
> > @@ -21319,7 +22067,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >
> >
> > -@@ -7166,6 +7514,45 @@ fi
> > +@@ -7209,6 +7557,45 @@ fi
> >
> >
> >
> > @@ -21365,7 +22113,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >
> >
> > -@@ -7371,11 +7758,128 @@ sparc*-*solaris*)
> > +@@ -7414,11 +7801,128 @@ sparc*-*solaris*)
> >         ;;
> >       esac
> >     fi
> > @@ -21497,7 +22245,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >
> >     case $host_os in
> > -@@ -7940,6 +8444,8 @@ _LT_EOF
> > +@@ -7983,6 +8487,8 @@ _LT_EOF
> >         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> >         echo "$AR cru libconftest.a conftest.o" >&5
> >         $AR cru libconftest.a conftest.o 2>&5
> > @@ -21506,7 +22254,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         cat > conftest.c << _LT_EOF
> >   int main() { return 0;}
> >   _LT_EOF
> > -@@ -8492,8 +8998,6 @@ fi
> > +@@ -8535,8 +9041,6 @@ fi
> >   lt_prog_compiler_pic=3D
> >   lt_prog_compiler_static=3D
> >
> > @@ -21515,7 +22263,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >     if test "$GCC" =3D yes; then
> >       lt_prog_compiler_wl=3D'-Wl,'
> > -@@ -8659,6 +9163,12 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> > +@@ -8702,6 +9206,12 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> >       lt_prog_compiler_pic=3D'--shared'
> >       lt_prog_compiler_static=3D'--static'
> >       ;;
> > @@ -21528,7 +22276,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> >           # Portland Group compilers (*not* the Pentium gcc compiler,
> >       # which looks to be a dead project)
> > -@@ -8721,7 +9231,7 @@ $as_echo_n "checking for $compiler option to pro=
duce PIC... " >&6; }
> > +@@ -8764,7 +9274,7 @@ $as_echo_n "checking for $compiler option to pro=
duce PIC... " >&6; }
> >         lt_prog_compiler_pic=3D'-KPIC'
> >         lt_prog_compiler_static=3D'-Bstatic'
> >         case $cc_basename in
> > @@ -21537,7 +22285,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >       lt_prog_compiler_wl=3D'-Qoption ld ';;
> >         *)
> >       lt_prog_compiler_wl=3D'-Wl,';;
> > -@@ -8778,13 +9288,17 @@ case $host_os in
> > +@@ -8821,13 +9331,17 @@ case $host_os in
> >       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> >       ;;
> >   esac
> > @@ -21561,7 +22309,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >   #
> >   # Check to make sure the PIC flag actually works.
> > -@@ -8845,6 +9359,11 @@ fi
> > +@@ -8888,6 +9402,11 @@ fi
> >
> >
> >
> > @@ -21573,7 +22321,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   #
> >   # Check to make sure the static flag actually works.
> >   #
> > -@@ -9195,7 +9714,8 @@ _LT_EOF
> > +@@ -9238,7 +9757,8 @@ _LT_EOF
> >         allow_undefined_flag=3Dunsupported
> >         always_export_symbols=3Dno
> >         enable_shared_with_static_runtimes=3Dyes
> > @@ -21583,7 +22331,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> >           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags=
 -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-imp=
lib -Xlinker $lib'
> > -@@ -9294,12 +9814,12 @@ _LT_EOF
> > +@@ -9337,12 +9857,12 @@ _LT_EOF
> >         whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
> >         hardcode_libdir_flag_spec=3D
> >         hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> > @@ -21598,7 +22346,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         fi
> >         ;;
> >       esac
> > -@@ -9313,8 +9833,8 @@ _LT_EOF
> > +@@ -9356,8 +9876,8 @@ _LT_EOF
> >       archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
> >       wlarc=3D
> >         else
> > @@ -21609,7 +22357,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         fi
> >         ;;
> >
> > -@@ -9332,8 +9852,8 @@ _LT_EOF
> > +@@ -9375,8 +9895,8 @@ _LT_EOF
> >
> >   _LT_EOF
> >         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /de=
v/null; then
> > @@ -21620,7 +22368,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         else
> >       ld_shlibs=3Dno
> >         fi
> > -@@ -9379,8 +9899,8 @@ _LT_EOF
> > +@@ -9422,8 +9942,8 @@ _LT_EOF
> >
> >       *)
> >         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> > @@ -21631,7 +22379,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         else
> >       ld_shlibs=3Dno
> >         fi
> > -@@ -9510,7 +10030,13 @@ _LT_EOF
> > +@@ -9553,7 +10073,13 @@ _LT_EOF
> >       allow_undefined_flag=3D'-berok'
> >           # Determine the default libpath from the value encoded in an
> >           # empty executable.
> > @@ -21646,7 +22394,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -9523,22 +10049,29 @@ main ()
> > +@@ -9566,22 +10092,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -21689,7 +22437,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_li=
bpath"
> >           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs=
 $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undef=
ined_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; el=
se :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> > -@@ -9550,7 +10083,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -9593,7 +10126,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >       else
> >        # Determine the default libpath from the value encoded in an
> >        # empty executable.
> > @@ -21704,7 +22452,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -9563,22 +10102,29 @@ main ()
> > +@@ -9606,22 +10145,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -21747,7 +22495,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >        hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
> >         # Warning - without using the other run time loading flags,
> > -@@ -9623,20 +10169,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9666,20 +10212,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >         # Microsoft Visual C++.
> >         # hardcode_libdir_flag_spec is actually meaningless, as there i=
s
> >         # no search path for DLLs.
> > @@ -21825,7 +22573,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         ;;
> >
> >       darwin* | rhapsody*)
> > -@@ -9697,7 +10286,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> > +@@ -9740,7 +10329,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> >
> >       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> >       freebsd* | dragonfly*)
> > @@ -21834,7 +22582,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         hardcode_libdir_flag_spec=3D'-R$libdir'
> >         hardcode_direct=3Dyes
> >         hardcode_shlibpath_var=3Dno
> > -@@ -9705,7 +10294,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> > +@@ -9748,7 +10337,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> >
> >       hpux9*)
> >         if test "$GCC" =3D yes; then
> > @@ -21843,7 +22591,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         else
> >       archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> >         fi
> > -@@ -9721,7 +10310,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> > +@@ -9764,7 +10353,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> >
> >       hpux10*)
> >         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> > @@ -21852,7 +22600,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         else
> >       archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
> >         fi
> > -@@ -9745,10 +10334,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9788,10 +10377,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> >         archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
> >         ;;
> >       ia64*)
> > @@ -21865,7 +22613,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         ;;
> >       esac
> >         else
> > -@@ -9827,23 +10416,36 @@ fi
> > +@@ -9870,23 +10459,36 @@ fi
> >
> >       irix5* | irix6* | nonstopux*)
> >         if test "$GCC" =3D yes; then
> > @@ -21910,7 +22658,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         else
> >       archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
> >       archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> > -@@ -9928,7 +10530,7 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -9971,7 +10573,7 @@ rm -f core conftest.err conftest.$ac_objext \
> >       osf4* | osf5*)  # as osf3* with the addition of -msym flag
> >         if test "$GCC" =3D yes; then
> >       allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> > @@ -21919,7 +22667,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >       hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
> >         else
> >       allow_undefined_flag=3D' -expect_unresolved \*'
> > -@@ -9947,9 +10549,9 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -9990,9 +10592,9 @@ rm -f core conftest.err conftest.$ac_objext \
> >         no_undefined_flag=3D' -z defs'
> >         if test "$GCC" =3D yes; then
> >       wlarc=3D'${wl}'
> > @@ -21931,7 +22679,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >         else
> >       case `$CC -V 2>&1` in
> >       *"Compilers 5.0"*)
> > -@@ -10525,8 +11127,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10568,8 +11170,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> >     need_version=3Dno
> >     need_lib_prefix=3Dno
> >
> > @@ -21943,7 +22691,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >       library_names_spec=3D'$libname.dll.a'
> >       # DLL is installed to $(libdir)/../bin by postinstall_cmds
> >       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -10559,13 +11162,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10602,13 +11205,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> >         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``e=
cho ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> >         ;;
> >       esac
> > @@ -22016,16 +22764,16 @@ index 7bbed5d8ccf..795e7802110 100755
> >     # FIXME: first we should search . and the directory the executable =
is in
> >     shlibpath_var=3DPATH
> >     ;;
> > -@@ -11443,7 +12104,7 @@ else
> > +@@ -11486,7 +12147,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 11446 "configure"
> > +-#line 11489 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -11487,10 +12148,10 @@ else
> > +@@ -11530,10 +12191,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -22038,16 +22786,16 @@ index 7bbed5d8ccf..795e7802110 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -11549,7 +12210,7 @@ else
> > +@@ -11592,7 +12253,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 11552 "configure"
> > +-#line 11595 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -11593,10 +12254,10 @@ else
> > +@@ -11636,10 +12297,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -22060,7 +22808,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -13361,7 +14022,7 @@ cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=
=3D1
> > +@@ -13459,7 +14120,7 @@ cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=
=3D1
> >   #
> >   # INIT-COMMANDS
> >   #
> > @@ -22069,7 +22817,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >
> >
> >   # The HP-UX ksh and POSIX shell print the target directory to stdout
> > -@@ -13399,13 +14060,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> > +@@ -13497,13 +14158,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -22090,7 +22838,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay=
_single_quote_subst"`'
> > -@@ -13420,14 +14088,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -13518,14 +14186,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_=
to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_globa=
l_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_c=
v_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quo=
te_subst"`'
> > @@ -22109,7 +22857,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -13460,12 +14131,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> > +@@ -13558,12 +14229,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_sin=
gle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_=
subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_=
quote_subst"`'
> > @@ -22123,7 +22871,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quot=
e_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | =
$SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > -@@ -13520,8 +14191,13 @@ reload_flag \
> > +@@ -13618,8 +14289,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -22137,7 +22885,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -13531,12 +14207,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -13629,12 +14305,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -22153,7 +22901,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -13552,7 +14230,6 @@ no_undefined_flag \
> > +@@ -13650,7 +14328,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -22161,7 +22909,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -13588,6 +14265,7 @@ module_cmds \
> > +@@ -13686,6 +14363,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -22169,7 +22917,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -14234,29 +14912,35 @@ $as_echo "$as_me: executing $ac_file command=
s" >&6;}
> > +@@ -14332,29 +15010,35 @@ $as_echo "$as_me: executing $ac_file command=
s" >&6;}
> >     # Older Autoconf quotes --file arguments for eval, but not when fil=
es
> >     # are listed without --file.  Let's play safe and only enable the e=
val
> >     # if we detect the quoting.
> > @@ -22224,7 +22972,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >       sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
> >           s//\1/
> >           q
> > -@@ -14274,53 +14958,50 @@ $as_echo X"$mf" |
> > +@@ -14372,53 +15056,50 @@ $as_echo X"$mf" |
> >           q
> >         }
> >         s/.*/./; q'`
> > @@ -22311,7 +23059,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   }
> >    ;;
> >       "libtool":C)
> > -@@ -14344,7 +15025,8 @@ $as_echo X"$file" |
> > +@@ -14442,7 +15123,8 @@ $as_echo X"$file" |
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 200=
5,
> > @@ -22321,7 +23069,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -14447,19 +15129,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -14545,19 +15227,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -22365,7 +23113,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -14489,6 +15194,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> > +@@ -14587,6 +15292,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefix=
 is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sym=
bol_to_c_name_address_lib_prefix
> >
> > @@ -22378,7 +23126,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -14498,6 +15209,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -14596,6 +15307,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -22388,7 +23136,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -14612,12 +15326,12 @@ with_gcc=3D$GCC
> > +@@ -14710,12 +15424,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -22404,7 +23152,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -14704,9 +15418,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -14802,9 +15516,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency libr=
aries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -22414,7 +23162,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -14722,6 +15433,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -14820,6 +15531,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with te=
mplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -22424,7 +23172,7 @@ index 7bbed5d8ccf..795e7802110 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -14754,210 +15468,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -14852,210 +15566,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash proble=
m
> >     # is reportedly fixed, but why not run on old versions too?
> > @@ -29746,2098 +30494,158 @@ index 9503ec85d70..70e856e0659 100644
> >  +        func_append rmfiles " $dir/$pic_object"
> >         fi
> >
> > -       # Add non-PIC object to the list of files to remove.
> > -       if test -n "$non_pic_object" &&
> > -          test "$non_pic_object" !=3D none; then
> > --        rmfiles=3D"$rmfiles $dir/$non_pic_object"
> > -+        func_append rmfiles " $dir/$non_pic_object"
> > -       fi
> > -     fi
> > -     ;;
> > -
> > -       *)
> > --    if test "$mode" =3D clean ; then
> > -+    if test "$opt_mode" =3D clean ; then
> > -       noexename=3D$name
> > -       case $file in
> > -       *.exe)
> > -@@ -8547,7 +9559,7 @@ func_mode_uninstall ()
> > -         noexename=3D$func_stripname_result
> > -         # $file with .exe has already been added to rmfiles,
> > -         # add $file without .exe
> > --        rmfiles=3D"$rmfiles $file"
> > -+        func_append rmfiles " $file"
> > -         ;;
> > -       esac
> > -       # Do a test to see if this is a libtool program.
> > -@@ -8556,7 +9568,7 @@ func_mode_uninstall ()
> > -           func_ltwrapper_scriptname "$file"
> > -           relink_command=3D
> > -           func_source $func_ltwrapper_scriptname_result
> > --          rmfiles=3D"$rmfiles $func_ltwrapper_scriptname_result"
> > -+          func_append rmfiles " $func_ltwrapper_scriptname_result"
> > -         else
> > -           relink_command=3D
> > -           func_source $dir/$noexename
> > -@@ -8564,12 +9576,12 @@ func_mode_uninstall ()
> > -
> > -         # note $name still contains .exe if it was in $file originall=
y
> > -         # as does the version of $file that was added into $rmfiles
> > --        rmfiles=3D"$rmfiles $objdir/$name $objdir/${name}S.${objext}"
> > -+        func_append rmfiles " $odir/$name $odir/${name}S.${objext}"
> > -         if test "$fast_install" =3D yes && test -n "$relink_command";=
 then
> > --          rmfiles=3D"$rmfiles $objdir/lt-$name"
> > -+          func_append rmfiles " $odir/lt-$name"
> > -         fi
> > -         if test "X$noexename" !=3D "X$name" ; then
> > --          rmfiles=3D"$rmfiles $objdir/lt-${noexename}.c"
> > -+          func_append rmfiles " $odir/lt-${noexename}.c"
> > -         fi
> > -       fi
> > -     fi
> > -@@ -8577,7 +9589,6 @@ func_mode_uninstall ()
> > -       esac
> > -       func_show_eval "$RM $rmfiles" 'exit_status=3D1'
> > -     done
> > --    objdir=3D"$origobjdir"
> > -
> > -     # Try to remove the ${objdir}s in the directories where we delete=
d files
> > -     for dir in $rmdirs; do
> > -@@ -8589,16 +9600,16 @@ func_mode_uninstall ()
> > -     exit $exit_status
> > - }
> > -
> > --{ test "$mode" =3D uninstall || test "$mode" =3D clean; } &&
> > -+{ test "$opt_mode" =3D uninstall || test "$opt_mode" =3D clean; } &&
> > -     func_mode_uninstall ${1+"$@"}
> > -
> > --test -z "$mode" && {
> > -+test -z "$opt_mode" && {
> > -   help=3D"$generic_help"
> > -   func_fatal_help "you must specify a MODE"
> > - }
> > -
> > - test -z "$exec_cmd" && \
> > --  func_fatal_help "invalid operation mode \`$mode'"
> > -+  func_fatal_help "invalid operation mode \`$opt_mode'"
> > -
> > - if test -n "$exec_cmd"; then
> > -   eval exec "$exec_cmd"
> > -diff --git a/ltoptions.m4 b/ltoptions.m4
> > -index 5ef12ced2a8..17cfd51c0b3 100644
> > ---- a/ltoptions.m4
> > -+++ b/ltoptions.m4
> > -@@ -8,7 +8,7 @@
> > - # unlimited permission to copy and/or distribute it, with or without
> > - # modifications, as long as this notice is preserved.
> > -
> > --# serial 6 ltoptions.m4
> > -+# serial 7 ltoptions.m4
> > -
> > - # This is to help aclocal find these macros, as it can't see m4_defin=
e.
> > - AC_DEFUN([LTOPTIONS_VERSION], [m4_if([1])])
> > -diff --git a/ltversion.m4 b/ltversion.m4
> > -index bf87f77132d..9c7b5d41185 100644
> > ---- a/ltversion.m4
> > -+++ b/ltversion.m4
> > -@@ -7,17 +7,17 @@
> > - # unlimited permission to copy and/or distribute it, with or without
> > - # modifications, as long as this notice is preserved.
> > -
> > --# Generated from ltversion.in.
> > -+# @configure_input@
> > -
> > --# serial 3134 ltversion.m4
> > -+# serial 3293 ltversion.m4
> > - # This file is part of GNU Libtool
> > -
> > --m4_define([LT_PACKAGE_VERSION], [2.2.7a])
> > --m4_define([LT_PACKAGE_REVISION], [1.3134])
> > -+m4_define([LT_PACKAGE_VERSION], [2.4])
> > -+m4_define([LT_PACKAGE_REVISION], [1.3293])
> > -
> > - AC_DEFUN([LTVERSION_VERSION],
> > --[macro_version=3D'2.2.7a'
> > --macro_revision=3D'1.3134'
> > -+[macro_version=3D'2.4'
> > -+macro_revision=3D'1.3293'
> > - _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
> > - _LT_DECL(, macro_revision, 0)
> > - ])
> > -diff --git a/lt~obsolete.m4 b/lt~obsolete.m4
> > -index bf92b5e0790..c573da90c5c 100644
> > ---- a/lt~obsolete.m4
> > -+++ b/lt~obsolete.m4
> > -@@ -7,7 +7,7 @@
> > - # unlimited permission to copy and/or distribute it, with or without
> > - # modifications, as long as this notice is preserved.
> > -
> > --# serial 4 lt~obsolete.m4
> > -+# serial 5 lt~obsolete.m4
> > -
> > - # These exist entirely to fool aclocal when bootstrapping libtool.
> > - #
> > -diff --git a/opcodes/Makefile.in b/opcodes/Makefile.in
> > -index c1eca5a42ed..7cab295b26d 100644
> > ---- a/opcodes/Makefile.in
> > -+++ b/opcodes/Makefile.in
> > -@@ -292,6 +292,7 @@ CYGPATH_W =3D @CYGPATH_W@
> > - DATADIRNAME =3D @DATADIRNAME@
> > - DEFS =3D @DEFS@
> > - DEPDIR =3D @DEPDIR@
> > -+DLLTOOL =3D @DLLTOOL@
> > - DSYMUTIL =3D @DSYMUTIL@
> > - DUMPBIN =3D @DUMPBIN@
> > - ECHO_C =3D @ECHO_C@
> > -@@ -325,6 +326,7 @@ LN_S =3D @LN_S@
> > - LTLIBOBJS =3D @LTLIBOBJS@
> > - MAINT =3D @MAINT@
> > - MAKEINFO =3D @MAKEINFO@
> > -+MANIFEST_TOOL =3D @MANIFEST_TOOL@
> > - MKDIR_P =3D @MKDIR_P@
> > - MKINSTALLDIRS =3D @MKINSTALLDIRS@
> > - MSGFMT =3D @MSGFMT@
> > -@@ -363,6 +365,7 @@ abs_builddir =3D @abs_builddir@
> > - abs_srcdir =3D @abs_srcdir@
> > - abs_top_builddir =3D @abs_top_builddir@
> > - abs_top_srcdir =3D @abs_top_srcdir@
> > -+ac_ct_AR =3D @ac_ct_AR@
> > - ac_ct_CC =3D @ac_ct_CC@
> > - ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
> > - am__include =3D @am__include@
> > -diff --git a/opcodes/configure b/opcodes/configure
> > -index d2364991ee8..f9a46eec7a3 100755
> > ---- a/opcodes/configure
> > -+++ b/opcodes/configure
> > -@@ -682,6 +682,9 @@ OTOOL
> > - LIPO
> > - NMEDIT
> > - DSYMUTIL
> > -+MANIFEST_TOOL
> > -+ac_ct_AR
> > -+DLLTOOL
> > - OBJDUMP
> > - LN_S
> > - NM
> > -@@ -800,6 +803,7 @@ enable_static
> > - with_pic
> > - enable_fast_install
> > - with_gnu_ld
> > -+with_libtool_sysroot
> > - enable_libtool_lock
> > - enable_checking
> > - enable_targets
> > -@@ -1468,6 +1472,8 @@ Optional Packages:
> > -   --with-pic              try to use only PIC/non-PIC objects [defaul=
t=3Duse
> > -                           both]
> > -   --with-gnu-ld           assume the C compiler uses GNU ld [default=
=3Dno]
> > -+  --with-libtool-sysroot=3DDIR Search for dependent libraries within =
DIR
> > -+                        (or the compiler's sysroot if not specified).
> > -
> > - Some influential environment variables:
> > -   CC          C compiler command
> > -@@ -4977,8 +4983,8 @@ esac
> > -
> > -
> > -
> > --macro_version=3D'2.2.7a'
> > --macro_revision=3D'1.3134'
> > -+macro_version=3D'2.4'
> > -+macro_revision=3D'1.3293'
> > -
> > -
> > -
> > -@@ -5018,7 +5024,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > - { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print string=
s" >&5
> > - $as_echo_n "checking how to print strings... " >&6; }
> > - # Test print first, because it will be a builtin if present.
> > --if test "X`print -r -- -n 2>/dev/null`" =3D X-n && \
> > -+if test "X`( print -r -- -n ) 2>/dev/null`" =3D X-n && \
> > -    test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -   ECHO=3D'print -r --'
> > - elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -@@ -5711,8 +5717,8 @@ $as_echo_n "checking whether the shell understan=
ds some XSI constructs... " >&6;
> > - # Try some XSI features
> > - xsi_shell=3Dno
> > - ( _lt_dummy=3D"a/b/c"
> > --  test "${_lt_dummy##*/},${_lt_dummy%/*},"${_lt_dummy%"$_lt_dummy"}, =
\
> > --      =3D c,a/b,, \
> > -+  test "${_lt_dummy##*/},${_lt_dummy%/*},${_lt_dummy#??}"${_lt_dummy%=
"$_lt_dummy"}, \
> > -+      =3D c,a/b,b/c, \
> > -     && eval 'test $(( 1 + 1 )) -eq 2 \
> > -     && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> > -   && xsi_shell=3Dyes
> > -@@ -5761,6 +5767,80 @@ esac
> > -
> > -
> > -
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $bui=
ld file names to $host format" >&5
> > -+$as_echo_n "checking how to convert $build file names to $host format=
... " >&6; }
> > -+if ${lt_cv_to_host_file_cmd+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  case $host in
> > -+  *-*-mingw* )
> > -+    case $build in
> > -+      *-*-mingw* ) # actually msys
> > -+        lt_cv_to_host_file_cmd=3Dfunc_convert_file_msys_to_w32
> > -+        ;;
> > -+      *-*-cygwin* )
> > -+        lt_cv_to_host_file_cmd=3Dfunc_convert_file_cygwin_to_w32
> > -+        ;;
> > -+      * ) # otherwise, assume *nix
> > -+        lt_cv_to_host_file_cmd=3Dfunc_convert_file_nix_to_w32
> > -+        ;;
> > -+    esac
> > -+    ;;
> > -+  *-*-cygwin* )
> > -+    case $build in
> > -+      *-*-mingw* ) # actually msys
> > -+        lt_cv_to_host_file_cmd=3Dfunc_convert_file_msys_to_cygwin
> > -+        ;;
> > -+      *-*-cygwin* )
> > -+        lt_cv_to_host_file_cmd=3Dfunc_convert_file_noop
> > -+        ;;
> > -+      * ) # otherwise, assume *nix
> > -+        lt_cv_to_host_file_cmd=3Dfunc_convert_file_nix_to_cygwin
> > -+        ;;
> > -+    esac
> > -+    ;;
> > -+  * ) # unhandled hosts (and "normal" native builds)
> > -+    lt_cv_to_host_file_cmd=3Dfunc_convert_file_noop
> > -+    ;;
> > -+esac
> > -+
> > -+fi
> > -+
> > -+to_host_file_cmd=3D$lt_cv_to_host_file_cmd
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_host_file_=
cmd" >&5
> > -+$as_echo "$lt_cv_to_host_file_cmd" >&6; }
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to convert $bui=
ld file names to toolchain format" >&5
> > -+$as_echo_n "checking how to convert $build file names to toolchain fo=
rmat... " >&6; }
> > -+if ${lt_cv_to_tool_file_cmd+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  #assume ordinary cross tools, or native build.
> > -+lt_cv_to_tool_file_cmd=3Dfunc_convert_file_noop
> > -+case $host in
> > -+  *-*-mingw* )
> > -+    case $build in
> > -+      *-*-mingw* ) # actually msys
> > -+        lt_cv_to_tool_file_cmd=3Dfunc_convert_file_msys_to_w32
> > -+        ;;
> > -+    esac
> > -+    ;;
> > -+esac
> > -+
> > -+fi
> > -+
> > -+to_tool_file_cmd=3D$lt_cv_to_tool_file_cmd
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_to_tool_file_=
cmd" >&5
> > -+$as_echo "$lt_cv_to_tool_file_cmd" >&6; }
> > -+
> > -+
> > -+
> > -+
> > -+
> > - { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to r=
eload object files" >&5
> > - $as_echo_n "checking for $LD option to reload object files... " >&6; =
}
> > - if ${lt_cv_ld_reload_flag+:} false; then :
> > -@@ -5777,6 +5857,11 @@ case $reload_flag in
> > - esac
> > - reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> > - case $host_os in
> > -+  cygwin* | mingw* | pw32* | cegcc*)
> > -+    if test "$GCC" !=3D yes; then
> > -+      reload_cmds=3Dfalse
> > -+    fi
> > -+    ;;
> > -   darwin*)
> > -     if test "$GCC" =3D yes; then
> > -       reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$rel=
oad_objs'
> > -@@ -5945,7 +6030,8 @@ mingw* | pw32*)
> > -     lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86=
 DLL'
> > -     lt_cv_file_magic_cmd=3D'func_win32_libid'
> > -   else
> > --    lt_cv_deplibs_check_method=3D'file_magic file format pei*-i386(.*=
architecture: i386)?'
> > -+    # Keep this pattern in sync with the one in func_win32_libid.
> > -+    lt_cv_deplibs_check_method=3D'file_magic file format (pei*-i386(.=
*architecture: i386)?|pe-arm-wince|pe-x86-64)'
> > -     lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> > -   fi
> > -   ;;
> > -@@ -6099,6 +6185,21 @@ esac
> > - fi
> > - { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check=
_method" >&5
> > - $as_echo "$lt_cv_deplibs_check_method" >&6; }
> > -+
> > -+file_magic_glob=3D
> > -+want_nocaseglob=3Dno
> > -+if test "$build" =3D "$host"; then
> > -+  case $host_os in
> > -+  mingw* | pw32*)
> > -+    if ( shopt | grep nocaseglob ) >/dev/null 2>&1; then
> > -+      want_nocaseglob=3Dyes
> > -+    else
> > -+      file_magic_glob=3D`echo aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsSt=
TuUvVwWxXyYzZ | $SED -e "s/\(..\)/s\/[\1]\/[\1]\/g;/g"`
> > -+    fi
> > -+    ;;
> > -+  esac
> > -+fi
> > -+
> > - file_magic_cmd=3D$lt_cv_file_magic_cmd
> > - deplibs_check_method=3D$lt_cv_deplibs_check_method
> > - test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> > -@@ -6114,6 +6215,157 @@ test -z "$deplibs_check_method" && deplibs_che=
ck_method=3Dunknown
> > -
> > -
> > -
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+if test -n "$ac_tool_prefix"; then
> > -+  # Extract the first word of "${ac_tool_prefix}dlltool", so it can b=
e a program name with args.
> > -+set dummy ${ac_tool_prefix}dlltool; ac_word=3D$2
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> > -+$as_echo_n "checking for $ac_word... " >&6; }
> > -+if ${ac_cv_prog_DLLTOOL+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  if test -n "$DLLTOOL"; then
> > -+  ac_cv_prog_DLLTOOL=3D"$DLLTOOL" # Let the user override the test.
> > -+else
> > -+as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> > -+for as_dir in $PATH
> > -+do
> > -+  IFS=3D$as_save_IFS
> > -+  test -z "$as_dir" && as_dir=3D.
> > -+    for ac_exec_ext in '' $ac_executable_extensions; do
> > -+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > -+    ac_cv_prog_DLLTOOL=3D"${ac_tool_prefix}dlltool"
> > -+    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> > -+    break 2
> > -+  fi
> > -+done
> > -+  done
> > -+IFS=3D$as_save_IFS
> > -+
> > -+fi
> > -+fi
> > -+DLLTOOL=3D$ac_cv_prog_DLLTOOL
> > -+if test -n "$DLLTOOL"; then
> > -+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $DLLTOOL" >&5
> > -+$as_echo "$DLLTOOL" >&6; }
> > -+else
> > -+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> > -+$as_echo "no" >&6; }
> > -+fi
> > -+
> > -+
> > -+fi
> > -+if test -z "$ac_cv_prog_DLLTOOL"; then
> > -+  ac_ct_DLLTOOL=3D$DLLTOOL
> > -+  # Extract the first word of "dlltool", so it can be a program name =
with args.
> > -+set dummy dlltool; ac_word=3D$2
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> > -+$as_echo_n "checking for $ac_word... " >&6; }
> > -+if ${ac_cv_prog_ac_ct_DLLTOOL+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  if test -n "$ac_ct_DLLTOOL"; then
> > -+  ac_cv_prog_ac_ct_DLLTOOL=3D"$ac_ct_DLLTOOL" # Let the user override=
 the test.
> > -+else
> > -+as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> > -+for as_dir in $PATH
> > -+do
> > -+  IFS=3D$as_save_IFS
> > -+  test -z "$as_dir" && as_dir=3D.
> > -+    for ac_exec_ext in '' $ac_executable_extensions; do
> > -+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > -+    ac_cv_prog_ac_ct_DLLTOOL=3D"dlltool"
> > -+    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> > -+    break 2
> > -+  fi
> > -+done
> > -+  done
> > -+IFS=3D$as_save_IFS
> > -+
> > -+fi
> > -+fi
> > -+ac_ct_DLLTOOL=3D$ac_cv_prog_ac_ct_DLLTOOL
> > -+if test -n "$ac_ct_DLLTOOL"; then
> > -+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_DLLTOOL" >&=
5
> > -+$as_echo "$ac_ct_DLLTOOL" >&6; }
> > -+else
> > -+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> > -+$as_echo "no" >&6; }
> > -+fi
> > -+
> > -+  if test "x$ac_ct_DLLTOOL" =3D x; then
> > -+    DLLTOOL=3D"false"
> > -+  else
> > -+    case $cross_compiling:$ac_tool_warned in
> > -+yes:)
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools n=
ot prefixed with host triplet" >&5
> > -+$as_echo "$as_me: WARNING: using cross tools not prefixed with host t=
riplet" >&2;}
> > -+ac_tool_warned=3Dyes ;;
> > -+esac
> > -+    DLLTOOL=3D$ac_ct_DLLTOOL
> > -+  fi
> > -+else
> > -+  DLLTOOL=3D"$ac_cv_prog_DLLTOOL"
> > -+fi
> > -+
> > -+test -z "$DLLTOOL" && DLLTOOL=3Ddlltool
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking how to associate ru=
ntime and link libraries" >&5
> > -+$as_echo_n "checking how to associate runtime and link libraries... "=
 >&6; }
> > -+if ${lt_cv_sharedlib_from_linklib_cmd+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  lt_cv_sharedlib_from_linklib_cmd=3D'unknown'
> > -+
> > -+case $host_os in
> > -+cygwin* | mingw* | pw32* | cegcc*)
> > -+  # two different shell functions defined in ltmain.sh
> > -+  # decide which to use based on capabilities of $DLLTOOL
> > -+  case `$DLLTOOL --help 2>&1` in
> > -+  *--identify-strict*)
> > -+    lt_cv_sharedlib_from_linklib_cmd=3Dfunc_cygming_dll_for_implib
> > -+    ;;
> > -+  *)
> > -+    lt_cv_sharedlib_from_linklib_cmd=3Dfunc_cygming_dll_for_implib_fa=
llback
> > -+    ;;
> > -+  esac
> > -+  ;;
> > -+*)
> > -+  # fallback: assume linklib IS sharedlib
> > -+  lt_cv_sharedlib_from_linklib_cmd=3D"$ECHO"
> > -+  ;;
> > -+esac
> > -+
> > -+fi
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_sharedlib_fro=
m_linklib_cmd" >&5
> > -+$as_echo "$lt_cv_sharedlib_from_linklib_cmd" >&6; }
> > -+sharedlib_from_linklib_cmd=3D$lt_cv_sharedlib_from_linklib_cmd
> > -+test -z "$sharedlib_from_linklib_cmd" && sharedlib_from_linklib_cmd=
=3D$ECHO
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > - plugin_option=3D
> > - plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.=
dll"
> > - for plugin in $plugin_names; do
> > -@@ -6128,8 +6380,10 @@ for plugin in $plugin_names; do
> > - done
> > -
> > - if test -n "$ac_tool_prefix"; then
> > --  # Extract the first word of "${ac_tool_prefix}ar", so it can be a p=
rogram name with args.
> > --set dummy ${ac_tool_prefix}ar; ac_word=3D$2
> > -+  for ac_prog in ar
> > -+  do
> > -+    # Extract the first word of "$ac_tool_prefix$ac_prog", so it can =
be a program name with args.
> > -+set dummy $ac_tool_prefix$ac_prog; ac_word=3D$2
> > - { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> > - $as_echo_n "checking for $ac_word... " >&6; }
> > - if ${ac_cv_prog_AR+:} false; then :
> > -@@ -6145,7 +6399,7 @@ do
> > -   test -z "$as_dir" && as_dir=3D.
> > -     for ac_exec_ext in '' $ac_executable_extensions; do
> > -   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > --    ac_cv_prog_AR=3D"${ac_tool_prefix}ar"
> > -+    ac_cv_prog_AR=3D"$ac_tool_prefix$ac_prog"
> > -     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> > -     break 2
> > -   fi
> > -@@ -6165,11 +6419,15 @@ $as_echo "no" >&6; }
> > - fi
> > -
> > -
> > -+    test -n "$AR" && break
> > -+  done
> > - fi
> > --if test -z "$ac_cv_prog_AR"; then
> > -+if test -z "$AR"; then
> > -   ac_ct_AR=3D$AR
> > --  # Extract the first word of "ar", so it can be a program name with =
args.
> > --set dummy ar; ac_word=3D$2
> > -+  for ac_prog in ar
> > -+do
> > -+  # Extract the first word of "$ac_prog", so it can be a program name=
 with args.
> > -+set dummy $ac_prog; ac_word=3D$2
> > - { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> > - $as_echo_n "checking for $ac_word... " >&6; }
> > - if ${ac_cv_prog_ac_ct_AR+:} false; then :
> > -@@ -6185,7 +6443,7 @@ do
> > -   test -z "$as_dir" && as_dir=3D.
> > -     for ac_exec_ext in '' $ac_executable_extensions; do
> > -   if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > --    ac_cv_prog_ac_ct_AR=3D"ar"
> > -+    ac_cv_prog_ac_ct_AR=3D"$ac_prog"
> > -     $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> > -     break 2
> > -   fi
> > -@@ -6204,6 +6462,10 @@ else
> > - $as_echo "no" >&6; }
> > - fi
> > -
> > -+
> > -+  test -n "$ac_ct_AR" && break
> > -+done
> > -+
> > -   if test "x$ac_ct_AR" =3D x; then
> > -     AR=3D"false"
> > -   else
> > -@@ -6215,25 +6477,20 @@ ac_tool_warned=3Dyes ;;
> > - esac
> > -     AR=3D$ac_ct_AR
> > -   fi
> > --else
> > --  AR=3D"$ac_cv_prog_AR"
> > - fi
> > -
> > --test -z "$AR" && AR=3Dar
> > --if test -n "$plugin_option"; then
> > --  if $AR --help 2>&1 | grep -q "\--plugin"; then
> > --    touch conftest.c
> > --    $AR $plugin_option rc conftest.a conftest.c
> > --    if test "$?" !=3D 0; then
> > --      { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Failed: $AR $=
plugin_option rc" >&5
> > -+  touch conftest.c
> > -+  $AR $plugin_option rc conftest.a conftest.c
> > -+  if test "$?" !=3D 0; then
> > -+    { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Failed: $AR $pl=
ugin_option rc" >&5
> > - $as_echo "$as_me: WARNING: Failed: $AR $plugin_option rc" >&2;}
> > --    else
> > --      AR=3D"$AR $plugin_option"
> > --    fi
> > --    rm -f conftest.*
> > -+  else
> > -+    AR=3D"$AR $plugin_option"
> > -   fi
> > --fi
> > --test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> > -+  rm -f conftest.*
> > -+: ${AR=3Dar}
> > -+: ${AR_FLAGS=3Dcru}
> > -+
> > -
> > -
> > -
> > -@@ -6244,6 +6501,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> > -
> > -
> > -
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE =
support" >&5
> > -+$as_echo_n "checking for archiver @FILE support... " >&6; }
> > -+if ${lt_cv_ar_at_file+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  lt_cv_ar_at_file=3Dno
> > -+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> > -+/* end confdefs.h.  */
> > -+
> > -+int
> > -+main ()
> > -+{
> > -+
> > -+  ;
> > -+  return 0;
> > -+}
> > -+_ACEOF
> > -+if ac_fn_c_try_compile "$LINENO"; then :
> > -+  echo conftest.$ac_objext > conftest.lst
> > -+      lt_ar_try=3D'$AR $AR_FLAGS libconftest.a @conftest.lst >&5'
> > -+      { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\"=
"; } >&5
> > -+  (eval $lt_ar_try) 2>&5
> > -+  ac_status=3D$?
> > -+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> > -+  test $ac_status =3D 0; }
> > -+      if test "$ac_status" -eq 0; then
> > -+    # Ensure the archiver fails upon bogus file names.
> > -+    rm -f conftest.$ac_objext libconftest.a
> > -+    { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$lt_ar_try\"";=
 } >&5
> > -+  (eval $lt_ar_try) 2>&5
> > -+  ac_status=3D$?
> > -+  $as_echo "$as_me:${as_lineno-$LINENO}: \$? =3D $ac_status" >&5
> > -+  test $ac_status =3D 0; }
> > -+    if test "$ac_status" -ne 0; then
> > -+          lt_cv_ar_at_file=3D@
> > -+        fi
> > -+      fi
> > -+      rm -f conftest.* libconftest.a
> > -+
> > -+fi
> > -+rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> > -+
> > -+fi
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >=
&5
> > -+$as_echo "$lt_cv_ar_at_file" >&6; }
> > -+
> > -+if test "x$lt_cv_ar_at_file" =3D xno; then
> > -+  archiver_list_spec=3D
> > -+else
> > -+  archiver_list_spec=3D$lt_cv_ar_at_file
> > -+fi
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -
> > - if test -n "$ac_tool_prefix"; then
> > -   # Extract the first word of "${ac_tool_prefix}strip", so it can be =
a program name with args.
> > -@@ -6584,8 +6898,8 @@ esac
> > - lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern=
 int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> > -
> > - # Transform an extracted symbol line into symbol name and symbol addr=
ess
> > --lt_cv_sys_global_symbol_to_c_name_address=3D"sed -n -e 's/^: \([^ ]*\=
) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$/  =
{\"\2\", (void *) \&\2},/p'"
> > --lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D"sed -n -e 's/=
^: \([^ ]*\) $/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \(=
lib[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]=
*\)$/  {\"lib\2\", (void *) \&\2},/p'"
> > -+lt_cv_sys_global_symbol_to_c_name_address=3D"sed -n -e 's/^: \([^ ]*\=
)[ ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\) \([^ ]*\)$=
/  {\"\2\", (void *) \&\2},/p'"
> > -+lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D"sed -n -e 's/=
^: \([^ ]*\)[ ]*$/  {\\\"\1\\\", (void *) 0},/p' -e 's/^$symcode* \([^ ]*\)=
 \(lib[^ ]*\)$/  {\"\2\", (void *) \&\2},/p' -e 's/^$symcode* \([^ ]*\) \([=
^ ]*\)$/  {\"lib\2\", (void *) \&\2},/p'"
> > -
> > - # Handle CRLF in mingw tool chain
> > - opt_cr=3D
> > -@@ -6621,6 +6935,7 @@ for ac_symprfx in "" "_"; do
> > -   else
> > -     lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[  ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> > -   fi
> > -+  lt_cv_sys_global_symbol_pipe=3D"$lt_cv_sys_global_symbol_pipe | sed=
 '/ __gnu_lto/d'"
> > -
> > -   # Check to see that the pipe works correctly.
> > -   pipe_works=3Dno
> > -@@ -6662,6 +6977,18 @@ _LT_EOF
> > -       if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> > -     if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> > -       cat <<_LT_EOF > conftest.$ac_ext
> > -+/* Keep this code in sync between libtool.m4, ltmain, lt_system.h, an=
d tests.  */
> > -+#if defined(_WIN32) || defined(__CYGWIN__) || defined(_WIN32_WCE)
> > -+/* DATA imports from DLLs on WIN32 con't be const, because runtime
> > -+   relocations are performed -- see ld's documentation on pseudo-relo=
cs.  */
> > -+# define LT_DLSYM_CONST
> > -+#elif defined(__osf__)
> > -+/* This system does not cope well with relocations in const data.  */
> > -+# define LT_DLSYM_CONST
> > -+#else
> > -+# define LT_DLSYM_CONST const
> > -+#endif
> > -+
> > - #ifdef __cplusplus
> > - extern "C" {
> > - #endif
> > -@@ -6673,7 +7000,7 @@ _LT_EOF
> > -       cat <<_LT_EOF >> conftest.$ac_ext
> > -
> > - /* The mapping between symbol names and symbols.  */
> > --const struct {
> > -+LT_DLSYM_CONST struct {
> > -   const char *name;
> > -   void       *address;
> > - }
> > -@@ -6699,8 +7026,8 @@ static const void *lt_preloaded_setup() {
> > - _LT_EOF
> > -       # Now try linking the two files.
> > -       mv conftest.$ac_objext conftstm.$ac_objext
> > --      lt_save_LIBS=3D"$LIBS"
> > --      lt_save_CFLAGS=3D"$CFLAGS"
> > -+      lt_globsym_save_LIBS=3D$LIBS
> > -+      lt_globsym_save_CFLAGS=3D$CFLAGS
> > -       LIBS=3D"conftstm.$ac_objext"
> > -       CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> > -       if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> > -@@ -6710,8 +7037,8 @@ _LT_EOF
> > -   test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> > -         pipe_works=3Dyes
> > -       fi
> > --      LIBS=3D"$lt_save_LIBS"
> > --      CFLAGS=3D"$lt_save_CFLAGS"
> > -+      LIBS=3D$lt_globsym_save_LIBS
> > -+      CFLAGS=3D$lt_globsym_save_CFLAGS
> > -     else
> > -       echo "cannot find nm_test_func in $nlist" >&5
> > -     fi
> > -@@ -6748,6 +7075,14 @@ else
> > - $as_echo "ok" >&6; }
> > - fi
> > -
> > -+# Response file support.
> > -+if test "$lt_cv_nm_interface" =3D "MS dumpbin"; then
> > -+  nm_file_list_spec=3D'@'
> > -+elif $NM --help 2>/dev/null | grep '[@]FILE' >/dev/null; then
> > -+  nm_file_list_spec=3D'@'
> > -+fi
> > -+
> > -+
> > -
> > -
> > -
> > -@@ -6766,6 +7101,47 @@ fi
> > -
> > -
> > -
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> > -+$as_echo_n "checking for sysroot... " >&6; }
> > -+
> > -+# Check whether --with-libtool-sysroot was given.
> > -+if test "${with_libtool_sysroot+set}" =3D set; then :
> > -+  withval=3D$with_libtool_sysroot;
> > -+else
> > -+  with_libtool_sysroot=3Dno
> > -+fi
> > -+
> > -+
> > -+lt_sysroot=3D
> > -+case ${with_libtool_sysroot} in #(
> > -+ yes)
> > -+   if test "$GCC" =3D yes; then
> > -+     lt_sysroot=3D`$CC --print-sysroot 2>/dev/null`
> > -+   fi
> > -+   ;; #(
> > -+ /*)
> > -+   lt_sysroot=3D`echo "$with_libtool_sysroot" | sed -e "$sed_quote_su=
bst"`
> > -+   ;; #(
> > -+ no|'')
> > -+   ;; #(
> > -+ *)
> > -+   { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${with_libtool_sy=
sroot}" >&5
> > -+$as_echo "${with_libtool_sysroot}" >&6; }
> > -+   as_fn_error $? "The sysroot must be an absolute path." "$LINENO" 5
> > -+   ;;
> > -+esac
> > -+
> > -+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" =
>&5
> > -+$as_echo "${lt_sysroot:-no}" >&6; }
> > -+
> > -+
> > -
> > -
> > -
> > -@@ -6975,6 +7351,123 @@ esac
> > -
> > - need_locks=3D"$enable_libtool_lock"
> > -
> > -+if test -n "$ac_tool_prefix"; then
> > -+  # Extract the first word of "${ac_tool_prefix}mt", so it can be a p=
rogram name with args.
> > -+set dummy ${ac_tool_prefix}mt; ac_word=3D$2
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> > -+$as_echo_n "checking for $ac_word... " >&6; }
> > -+if ${ac_cv_prog_MANIFEST_TOOL+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  if test -n "$MANIFEST_TOOL"; then
> > -+  ac_cv_prog_MANIFEST_TOOL=3D"$MANIFEST_TOOL" # Let the user override=
 the test.
> > -+else
> > -+as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> > -+for as_dir in $PATH
> > -+do
> > -+  IFS=3D$as_save_IFS
> > -+  test -z "$as_dir" && as_dir=3D.
> > -+    for ac_exec_ext in '' $ac_executable_extensions; do
> > -+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > -+    ac_cv_prog_MANIFEST_TOOL=3D"${ac_tool_prefix}mt"
> > -+    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> > -+    break 2
> > -+  fi
> > -+done
> > -+  done
> > -+IFS=3D$as_save_IFS
> > -+
> > -+fi
> > -+fi
> > -+MANIFEST_TOOL=3D$ac_cv_prog_MANIFEST_TOOL
> > -+if test -n "$MANIFEST_TOOL"; then
> > -+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $MANIFEST_TOOL" >&=
5
> > -+$as_echo "$MANIFEST_TOOL" >&6; }
> > -+else
> > -+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> > -+$as_echo "no" >&6; }
> > -+fi
> > -+
> > -+
> > -+fi
> > -+if test -z "$ac_cv_prog_MANIFEST_TOOL"; then
> > -+  ac_ct_MANIFEST_TOOL=3D$MANIFEST_TOOL
> > -+  # Extract the first word of "mt", so it can be a program name with =
args.
> > -+set dummy mt; ac_word=3D$2
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> > -+$as_echo_n "checking for $ac_word... " >&6; }
> > -+if ${ac_cv_prog_ac_ct_MANIFEST_TOOL+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  if test -n "$ac_ct_MANIFEST_TOOL"; then
> > -+  ac_cv_prog_ac_ct_MANIFEST_TOOL=3D"$ac_ct_MANIFEST_TOOL" # Let the u=
ser override the test.
> > -+else
> > -+as_save_IFS=3D$IFS; IFS=3D$PATH_SEPARATOR
> > -+for as_dir in $PATH
> > -+do
> > -+  IFS=3D$as_save_IFS
> > -+  test -z "$as_dir" && as_dir=3D.
> > -+    for ac_exec_ext in '' $ac_executable_extensions; do
> > -+  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > -+    ac_cv_prog_ac_ct_MANIFEST_TOOL=3D"mt"
> > -+    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> > -+    break 2
> > -+  fi
> > -+done
> > -+  done
> > -+IFS=3D$as_save_IFS
> > -+
> > -+fi
> > -+fi
> > -+ac_ct_MANIFEST_TOOL=3D$ac_cv_prog_ac_ct_MANIFEST_TOOL
> > -+if test -n "$ac_ct_MANIFEST_TOOL"; then
> > -+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_ct_MANIFEST_TO=
OL" >&5
> > -+$as_echo "$ac_ct_MANIFEST_TOOL" >&6; }
> > -+else
> > -+  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
> > -+$as_echo "no" >&6; }
> > -+fi
> > -+
> > -+  if test "x$ac_ct_MANIFEST_TOOL" =3D x; then
> > -+    MANIFEST_TOOL=3D":"
> > -+  else
> > -+    case $cross_compiling:$ac_tool_warned in
> > -+yes:)
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools n=
ot prefixed with host triplet" >&5
> > -+$as_echo "$as_me: WARNING: using cross tools not prefixed with host t=
riplet" >&2;}
> > -+ac_tool_warned=3Dyes ;;
> > -+esac
> > -+    MANIFEST_TOOL=3D$ac_ct_MANIFEST_TOOL
> > -+  fi
> > -+else
> > -+  MANIFEST_TOOL=3D"$ac_cv_prog_MANIFEST_TOOL"
> > -+fi
> > -+
> > -+test -z "$MANIFEST_TOOL" && MANIFEST_TOOL=3Dmt
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking if $MANIFEST_TOOL i=
s a manifest tool" >&5
> > -+$as_echo_n "checking if $MANIFEST_TOOL is a manifest tool... " >&6; }
> > -+if ${lt_cv_path_mainfest_tool+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  lt_cv_path_mainfest_tool=3Dno
> > -+  echo "$as_me:$LINENO: $MANIFEST_TOOL '-?'" >&5
> > -+  $MANIFEST_TOOL '-?' 2>conftest.err > conftest.out
> > -+  cat conftest.err >&5
> > -+  if $GREP 'Manifest Tool' conftest.out > /dev/null; then
> > -+    lt_cv_path_mainfest_tool=3Dyes
> > -+  fi
> > -+  rm -f conftest*
> > -+fi
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_path_mainfest=
_tool" >&5
> > -+$as_echo "$lt_cv_path_mainfest_tool" >&6; }
> > -+if test "x$lt_cv_path_mainfest_tool" !=3D xyes; then
> > -+  MANIFEST_TOOL=3D:
> > -+fi
> > -+
> > -+
> > -+
> > -+
> > -+
> > -
> > -   case $host_os in
> > -     rhapsody* | darwin*)
> > -@@ -7538,6 +8031,8 @@ _LT_EOF
> > -       $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> > -       echo "$AR cru libconftest.a conftest.o" >&5
> > -       $AR cru libconftest.a conftest.o 2>&5
> > -+      echo "$RANLIB libconftest.a" >&5
> > -+      $RANLIB libconftest.a 2>&5
> > -       cat > conftest.c << _LT_EOF
> > - int main() { return 0;}
> > - _LT_EOF
> > -@@ -8090,8 +8585,6 @@ fi
> > - lt_prog_compiler_pic=3D
> > - lt_prog_compiler_static=3D
> > -
> > --{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler optio=
n to produce PIC" >&5
> > --$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> > -
> > -   if test "$GCC" =3D yes; then
> > -     lt_prog_compiler_wl=3D'-Wl,'
> > -@@ -8257,6 +8750,12 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> > -     lt_prog_compiler_pic=3D'--shared'
> > -     lt_prog_compiler_static=3D'--static'
> > -     ;;
> > -+      nagfor*)
> > -+    # NAG Fortran compiler
> > -+    lt_prog_compiler_wl=3D'-Wl,-Wl,,'
> > -+    lt_prog_compiler_pic=3D'-PIC'
> > -+    lt_prog_compiler_static=3D'-Bstatic'
> > -+    ;;
> > -       pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> > -         # Portland Group compilers (*not* the Pentium gcc compiler,
> > -     # which looks to be a dead project)
> > -@@ -8319,7 +8818,7 @@ $as_echo_n "checking for $compiler option to pro=
duce PIC... " >&6; }
> > -       lt_prog_compiler_pic=3D'-KPIC'
> > -       lt_prog_compiler_static=3D'-Bstatic'
> > -       case $cc_basename in
> > --      f77* | f90* | f95*)
> > -+      f77* | f90* | f95* | sunf77* | sunf90* | sunf95*)
> > -     lt_prog_compiler_wl=3D'-Qoption ld ';;
> > -       *)
> > -     lt_prog_compiler_wl=3D'-Wl,';;
> > -@@ -8376,13 +8875,17 @@ case $host_os in
> > -     lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> > -     ;;
> > - esac
> > --{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_prog_compiler_pi=
c" >&5
> > --$as_echo "$lt_prog_compiler_pic" >&6; }
> > --
> > --
> > --
> > --
> > -
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $compiler optio=
n to produce PIC" >&5
> > -+$as_echo_n "checking for $compiler option to produce PIC... " >&6; }
> > -+if ${lt_cv_prog_compiler_pic+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  lt_cv_prog_compiler_pic=3D$lt_prog_compiler_pic
> > -+fi
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_prog_compiler=
_pic" >&5
> > -+$as_echo "$lt_cv_prog_compiler_pic" >&6; }
> > -+lt_prog_compiler_pic=3D$lt_cv_prog_compiler_pic
> > -
> > - #
> > - # Check to make sure the PIC flag actually works.
> > -@@ -8443,6 +8946,11 @@ fi
> > -
> > -
> > -
> > -+
> > -+
> > -+
> > -+
> > -+
> > - #
> > - # Check to make sure the static flag actually works.
> > - #
> > -@@ -8793,7 +9301,8 @@ _LT_EOF
> > -       allow_undefined_flag=3Dunsupported
> > -       always_export_symbols=3Dno
> > -       enable_shared_with_static_runtimes=3Dyes
> > --      export_symbols_cmds=3D'$NM $libobjs $convenience | $global_symb=
ol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/'\'' | $SED -e=
 '\''/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
> > -+      export_symbols_cmds=3D'$NM $libobjs $convenience | $global_symb=
ol_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1 DATA/;s/^.*[ ]__nm_=
_\([^ ]*\)[ ][^ ]*/\1 DATA/;/^I[ ]/d;/^[AITW][ ]/s/.* //'\'' | sort | uniq =
> $export_symbols'
> > -+      exclude_expsyms=3D'[_]+GLOBAL_OFFSET_TABLE_|[_]+GLOBAL__[FID]_.=
*|[_]+head_[A-Za-z0-9_]+_dll|[A-Za-z0-9_]+_dll_iname'
> > -
> > -       if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> > -         archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags=
 -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-imp=
lib -Xlinker $lib'
> > -@@ -8892,12 +9401,12 @@ _LT_EOF
> > -       whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
> > -       hardcode_libdir_flag_spec=3D
> > -       hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> > --      archive_cmds=3D'$LD -shared $libobjs $deplibs $compiler_flags -=
soname $soname -o $lib'
> > -+      archive_cmds=3D'$LD -shared $libobjs $deplibs $linker_flags -so=
name $soname -o $lib'
> > -       if test "x$supports_anon_versioning" =3D xyes; then
> > -         archive_expsym_cmds=3D'echo "{ global:" > $output_objdir/$lib=
name.ver~
> > -           cat $export_symbols | sed -e "s/\(.*\)/\1;/" >> $output_obj=
dir/$libname.ver~
> > -           echo "local: *; };" >> $output_objdir/$libname.ver~
> > --          $LD -shared $libobjs $deplibs $compiler_flags -soname $sona=
me -version-script $output_objdir/$libname.ver -o $lib'
> > -+          $LD -shared $libobjs $deplibs $linker_flags -soname $soname=
 -version-script $output_objdir/$libname.ver -o $lib'
> > -       fi
> > -       ;;
> > -     esac
> > -@@ -8911,8 +9420,8 @@ _LT_EOF
> > -     archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
> > -     wlarc=3D
> > -       else
> > --    archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags ${w=
l}-soname $wl$soname -o $lib'
> > --    archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o=
 $lib'
> > -+    archive_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $compiler=
_flags ${wl}-soname $wl$soname -o $lib'
> > -+    archive_expsym_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $c=
ompiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_=
symbols -o $lib'
> > -       fi
> > -       ;;
> > -
> > -@@ -8930,8 +9439,8 @@ _LT_EOF
> > -
> > - _LT_EOF
> > -       elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /de=
v/null; then
> > --    archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags ${w=
l}-soname $wl$soname -o $lib'
> > --    archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o=
 $lib'
> > -+    archive_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $compiler=
_flags ${wl}-soname $wl$soname -o $lib'
> > -+    archive_expsym_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $c=
ompiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_=
symbols -o $lib'
> > -       else
> > -     ld_shlibs=3Dno
> > -       fi
> > -@@ -8977,8 +9486,8 @@ _LT_EOF
> > -
> > -     *)
> > -       if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> > --    archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags ${w=
l}-soname $wl$soname -o $lib'
> > --    archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o=
 $lib'
> > -+    archive_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $compiler=
_flags ${wl}-soname $wl$soname -o $lib'
> > -+    archive_expsym_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $c=
ompiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_=
symbols -o $lib'
> > -       else
> > -     ld_shlibs=3Dno
> > -       fi
> > -@@ -9108,7 +9617,13 @@ _LT_EOF
> > -     allow_undefined_flag=3D'-berok'
> > -         # Determine the default libpath from the value encoded in an
> > -         # empty executable.
> > --        cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> > -+        if test "${lt_cv_aix_libpath+set}" =3D set; then
> > -+  aix_libpath=3D$lt_cv_aix_libpath
> > -+else
> > -+  if ${lt_cv_aix_libpath_+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> > - /* end confdefs.h.  */
> > -
> > - int
> > -@@ -9121,22 +9636,29 @@ main ()
> > - _ACEOF
> > - if ac_fn_c_try_link "$LINENO"; then :
> > -
> > --lt_aix_libpath_sed=3D'
> > --    /Import File Strings/,/^$/ {
> > --    /^0/ {
> > --        s/^0  *\(.*\)$/\1/
> > --        p
> > --    }
> > --    }'
> > --aix_libpath=3D`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$=
lt_aix_libpath_sed"`
> > --# Check for a 64-bit object if we didn't find anything.
> > --if test -z "$aix_libpath"; then
> > --  aix_libpath=3D`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n =
-e "$lt_aix_libpath_sed"`
> > --fi
> > -+  lt_aix_libpath_sed=3D'
> > -+      /Import File Strings/,/^$/ {
> > -+      /^0/ {
> > -+          s/^0  *\([^ ]*\) *$/\1/
> > -+          p
> > -+      }
> > -+      }'
> > -+  lt_cv_aix_libpath_=3D`dump -H conftest$ac_exeext 2>/dev/null | $SED=
 -n -e "$lt_aix_libpath_sed"`
> > -+  # Check for a 64-bit object if we didn't find anything.
> > -+  if test -z "$lt_cv_aix_libpath_"; then
> > -+    lt_cv_aix_libpath_=3D`dump -HX64 conftest$ac_exeext 2>/dev/null |=
 $SED -n -e "$lt_aix_libpath_sed"`
> > -+  fi
> > - fi
> > - rm -f core conftest.err conftest.$ac_objext \
> > -     conftest$ac_exeext conftest.$ac_ext
> > --if test -z "$aix_libpath"; then aix_libpath=3D"/usr/lib:/lib"; fi
> > -+  if test -z "$lt_cv_aix_libpath_"; then
> > -+    lt_cv_aix_libpath_=3D"/usr/lib:/lib"
> > -+  fi
> > -+
> > -+fi
> > -+
> > -+  aix_libpath=3D$lt_cv_aix_libpath_
> > -+fi
> > -
> > -         hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_li=
bpath"
> > -         archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs=
 $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undef=
ined_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; el=
se :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> > -@@ -9148,7 +9670,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> > -     else
> > -      # Determine the default libpath from the value encoded in an
> > -      # empty executable.
> > --     cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> > -+     if test "${lt_cv_aix_libpath+set}" =3D set; then
> > -+  aix_libpath=3D$lt_cv_aix_libpath
> > -+else
> > -+  if ${lt_cv_aix_libpath_+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> > - /* end confdefs.h.  */
> > -
> > - int
> > -@@ -9161,22 +9689,29 @@ main ()
> > - _ACEOF
> > - if ac_fn_c_try_link "$LINENO"; then :
> > -
> > --lt_aix_libpath_sed=3D'
> > --    /Import File Strings/,/^$/ {
> > --    /^0/ {
> > --        s/^0  *\(.*\)$/\1/
> > --        p
> > --    }
> > --    }'
> > --aix_libpath=3D`dump -H conftest$ac_exeext 2>/dev/null | $SED -n -e "$=
lt_aix_libpath_sed"`
> > --# Check for a 64-bit object if we didn't find anything.
> > --if test -z "$aix_libpath"; then
> > --  aix_libpath=3D`dump -HX64 conftest$ac_exeext 2>/dev/null | $SED -n =
-e "$lt_aix_libpath_sed"`
> > --fi
> > -+  lt_aix_libpath_sed=3D'
> > -+      /Import File Strings/,/^$/ {
> > -+      /^0/ {
> > -+          s/^0  *\([^ ]*\) *$/\1/
> > -+          p
> > -+      }
> > -+      }'
> > -+  lt_cv_aix_libpath_=3D`dump -H conftest$ac_exeext 2>/dev/null | $SED=
 -n -e "$lt_aix_libpath_sed"`
> > -+  # Check for a 64-bit object if we didn't find anything.
> > -+  if test -z "$lt_cv_aix_libpath_"; then
> > -+    lt_cv_aix_libpath_=3D`dump -HX64 conftest$ac_exeext 2>/dev/null |=
 $SED -n -e "$lt_aix_libpath_sed"`
> > -+  fi
> > - fi
> > - rm -f core conftest.err conftest.$ac_objext \
> > -     conftest$ac_exeext conftest.$ac_ext
> > --if test -z "$aix_libpath"; then aix_libpath=3D"/usr/lib:/lib"; fi
> > -+  if test -z "$lt_cv_aix_libpath_"; then
> > -+    lt_cv_aix_libpath_=3D"/usr/lib:/lib"
> > -+  fi
> > -+
> > -+fi
> > -+
> > -+  aix_libpath=3D$lt_cv_aix_libpath_
> > -+fi
> > -
> > -      hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
> > -       # Warning - without using the other run time loading flags,
> > -@@ -9221,20 +9756,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > -       # Microsoft Visual C++.
> > -       # hardcode_libdir_flag_spec is actually meaningless, as there i=
s
> > -       # no search path for DLLs.
> > --      hardcode_libdir_flag_spec=3D' '
> > --      allow_undefined_flag=3Dunsupported
> > --      # Tell ltmain to make .lib files, not .a files.
> > --      libext=3Dlib
> > --      # Tell ltmain to make .dll files, not .so files.
> > --      shrext_cmds=3D".dll"
> > --      # FIXME: Setting linknames here is a bad hack.
> > --      archive_cmds=3D'$CC -o $lib $libobjs $compiler_flags `func_echo=
_all "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames=3D'
> > --      # The linker will automatically build a .lib file if we build a=
 DLL.
> > --      old_archive_from_new_cmds=3D'true'
> > --      # FIXME: Should let the user specify the lib program.
> > --      old_archive_cmds=3D'lib -OUT:$oldlib$oldobjs$old_deplibs'
> > --      fix_srcfile_path=3D'`cygpath -w "$srcfile"`'
> > --      enable_shared_with_static_runtimes=3Dyes
> > -+      case $cc_basename in
> > -+      cl*)
> > -+    # Native MSVC
> > -+    hardcode_libdir_flag_spec=3D' '
> > -+    allow_undefined_flag=3Dunsupported
> > -+    always_export_symbols=3Dyes
> > -+    file_list_spec=3D'@'
> > -+    # Tell ltmain to make .lib files, not .a files.
> > -+    libext=3Dlib
> > -+    # Tell ltmain to make .dll files, not .so files.
> > -+    shrext_cmds=3D".dll"
> > -+    # FIXME: Setting linknames here is a bad hack.
> > -+    archive_cmds=3D'$CC -o $output_objdir/$soname $libobjs $compiler_=
flags $deplibs -Wl,-dll~linknames=3D'
> > -+    archive_expsym_cmds=3D'if test "x`$SED 1q $export_symbols`" =3D x=
EXPORTS; then
> > -+        sed -n -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' -=
e '1\\\!p' < $export_symbols > $output_objdir/$soname.exp;
> > -+      else
> > -+        sed -e 's/\\\\\\\(.*\\\\\\\)/-link\\\ -EXPORT:\\\\\\\1/' < $e=
xport_symbols > $output_objdir/$soname.exp;
> > -+      fi~
> > -+      $CC -o $tool_output_objdir$soname $libobjs $compiler_flags $dep=
libs "@$tool_output_objdir$soname.exp" -Wl,-DLL,-IMPLIB:"$tool_output_objdi=
r$libname.dll.lib"~
> > -+      linknames=3D'
> > -+    # The linker will not automatically build a static lib if we buil=
d a DLL.
> > -+    # _LT_TAGVAR(old_archive_from_new_cmds, )=3D'true'
> > -+    enable_shared_with_static_runtimes=3Dyes
> > -+    export_symbols_cmds=3D'$NM $libobjs $convenience | $global_symbol=
_pipe | $SED -e '\''/^[BCDGRS][ ]/s/.*[ ]\([^ ]*\)/\1,DATA/'\'' | $SED -e '=
\''/^[AITW][ ]/s/.*[ ]//'\'' | sort | uniq > $export_symbols'
> > -+    # Don't use ranlib
> > -+    old_postinstall_cmds=3D'chmod 644 $oldlib'
> > -+    postlink_cmds=3D'lt_outputfile=3D"@OUTPUT@"~
> > -+      lt_tool_outputfile=3D"@TOOL_OUTPUT@"~
> > -+      case $lt_outputfile in
> > -+        *.exe|*.EXE) ;;
> > -+        *)
> > -+          lt_outputfile=3D"$lt_outputfile.exe"
> > -+          lt_tool_outputfile=3D"$lt_tool_outputfile.exe"
> > -+          ;;
> > -+      esac~
> > -+      if test "$MANIFEST_TOOL" !=3D ":" && test -f "$lt_outputfile.ma=
nifest"; then
> > -+        $MANIFEST_TOOL -manifest "$lt_tool_outputfile.manifest" -outp=
utresource:"$lt_tool_outputfile" || exit 1;
> > -+        $RM "$lt_outputfile.manifest";
> > -+      fi'
> > -+    ;;
> > -+      *)
> > -+    # Assume MSVC wrapper
> > -+    hardcode_libdir_flag_spec=3D' '
> > -+    allow_undefined_flag=3Dunsupported
> > -+    # Tell ltmain to make .lib files, not .a files.
> > -+    libext=3Dlib
> > -+    # Tell ltmain to make .dll files, not .so files.
> > -+    shrext_cmds=3D".dll"
> > -+    # FIXME: Setting linknames here is a bad hack.
> > -+    archive_cmds=3D'$CC -o $lib $libobjs $compiler_flags `func_echo_a=
ll "$deplibs" | $SED '\''s/ -lc$//'\''` -link -dll~linknames=3D'
> > -+    # The linker will automatically build a .lib file if we build a D=
LL.
> > -+    old_archive_from_new_cmds=3D'true'
> > -+    # FIXME: Should let the user specify the lib program.
> > -+    old_archive_cmds=3D'lib -OUT:$oldlib$oldobjs$old_deplibs'
> > -+    enable_shared_with_static_runtimes=3Dyes
> > -+    ;;
> > -+      esac
> > -       ;;
> > -
> > -     darwin* | rhapsody*)
> > -@@ -9295,7 +9873,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> > -
> > -     # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> > -     freebsd* | dragonfly*)
> > --      archive_cmds=3D'$CC -shared -o $lib $libobjs $deplibs $compiler=
_flags'
> > -+      archive_cmds=3D'$CC -shared $pic_flag -o $lib $libobjs $deplibs=
 $compiler_flags'
> > -       hardcode_libdir_flag_spec=3D'-R$libdir'
> > -       hardcode_direct=3Dyes
> > -       hardcode_shlibpath_var=3Dno
> > -@@ -9303,7 +9881,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> > -
> > -     hpux9*)
> > -       if test "$GCC" =3D yes; then
> > --    archive_cmds=3D'$RM $output_objdir/$soname~$CC -shared -fPIC ${wl=
}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $compi=
ler_flags~test $output_objdir/$soname =3D $lib || mv $output_objdir/$soname=
 $lib'
> > -+    archive_cmds=3D'$RM $output_objdir/$soname~$CC -shared $pic_flag =
${wl}+b ${wl}$install_libdir -o $output_objdir/$soname $libobjs $deplibs $c=
ompiler_flags~test $output_objdir/$soname =3D $lib || mv $output_objdir/$so=
name $lib'
> > -       else
> > -     archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> > -       fi
> > -@@ -9319,7 +9897,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> > -
> > -     hpux10*)
> > -       if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> > --    archive_cmds=3D'$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b ${=
wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> > -+    archive_cmds=3D'$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl}+=
b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> > -       else
> > -     archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
> > -       fi
> > -@@ -9343,10 +9921,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > -       archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
> > -       ;;
> > -     ia64*)
> > --      archive_cmds=3D'$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+no=
defaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> > -+      archive_cmds=3D'$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl=
}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> > -       ;;
> > -     *)
> > --      archive_cmds=3D'$CC -shared -fPIC ${wl}+h ${wl}$soname ${wl}+b =
${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> > -+      archive_cmds=3D'$CC -shared $pic_flag ${wl}+h ${wl}$soname ${wl=
}+b ${wl}$install_libdir -o $lib $libobjs $deplibs $compiler_flags'
> > -       ;;
> > -     esac
> > -       else
> > -@@ -9425,23 +10003,36 @@ fi
> > -
> > -     irix5* | irix6* | nonstopux*)
> > -       if test "$GCC" =3D yes; then
> > --    archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags ${w=
l}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_ve=
rsion ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_loca=
tions -o $lib'
> > -+    archive_cmds=3D'$CC -shared $pic_flag $libobjs $deplibs $compiler=
_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${=
wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdi=
r}/so_locations -o $lib'
> > -     # Try to use the -exported_symbol ld option, if it does not
> > -     # work, assume that -exports_file does not work either and
> > -     # implicitly export all symbols.
> > --        save_LDFLAGS=3D"$LDFLAGS"
> > --        LDFLAGS=3D"$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${=
wl}-update_registry ${wl}/dev/null"
> > --        cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> > -+    # This should be the same for all languages, so no per-tag cache =
variable.
> > -+    { $as_echo "$as_me:${as_lineno-$LINENO}: checking whether the $ho=
st_os linker accepts -exported_symbol" >&5
> > -+$as_echo_n "checking whether the $host_os linker accepts -exported_sy=
mbol... " >&6; }
> > -+if ${lt_cv_irix_exported_symbol+:} false; then :
> > -+  $as_echo_n "(cached) " >&6
> > -+else
> > -+  save_LDFLAGS=3D"$LDFLAGS"
> > -+       LDFLAGS=3D"$LDFLAGS -shared ${wl}-exported_symbol ${wl}foo ${w=
l}-update_registry ${wl}/dev/null"
> > -+       cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> > - /* end confdefs.h.  */
> > --int foo(void) {}
> > -+int foo (void) { return 0; }
> > - _ACEOF
> > - if ac_fn_c_try_link "$LINENO"; then :
> > --  archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flag=
s ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-s=
et_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so=
_locations ${wl}-exports_file ${wl}$export_symbols -o $lib'
> > --
> > -+  lt_cv_irix_exported_symbol=3Dyes
> > -+else
> > -+  lt_cv_irix_exported_symbol=3Dno
> > - fi
> > - rm -f core conftest.err conftest.$ac_objext \
> > -     conftest$ac_exeext conftest.$ac_ext
> > --        LDFLAGS=3D"$save_LDFLAGS"
> > -+           LDFLAGS=3D"$save_LDFLAGS"
> > -+fi
> > -+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_irix_exported=
_symbol" >&5
> > -+$as_echo "$lt_cv_irix_exported_symbol" >&6; }
> > -+    if test "$lt_cv_irix_exported_symbol" =3D yes; then
> > -+          archive_expsym_cmds=3D'$CC -shared $pic_flag $libobjs $depl=
ibs $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func=
_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}$=
{output_objdir}/so_locations ${wl}-exports_file ${wl}$export_symbols -o $li=
b'
> > -+    fi
> > -       else
> > -     archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
> > -     archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> > -@@ -9526,7 +10117,7 @@ rm -f core conftest.err conftest.$ac_objext \
> > -     osf4* | osf5*)  # as osf3* with the addition of -msym flag
> > -       if test "$GCC" =3D yes; then
> > -     allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> > --    archive_cmds=3D'$CC -shared${allow_undefined_flag} $libobjs $depl=
ibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n "$verstri=
ng" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_regi=
stry ${wl}${output_objdir}/so_locations -o $lib'
> > -+    archive_cmds=3D'$CC -shared${allow_undefined_flag} $pic_flag $lib=
objs $deplibs $compiler_flags ${wl}-msym ${wl}-soname ${wl}$soname `test -n=
 "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-u=
pdate_registry ${wl}${output_objdir}/so_locations -o $lib'
> > -     hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
> > -       else
> > -     allow_undefined_flag=3D' -expect_unresolved \*'
> > -@@ -9545,9 +10136,9 @@ rm -f core conftest.err conftest.$ac_objext \
> > -       no_undefined_flag=3D' -z defs'
> > -       if test "$GCC" =3D yes; then
> > -     wlarc=3D'${wl}'
> > --    archive_cmds=3D'$CC -shared ${wl}-z ${wl}text ${wl}-h ${wl}$sonam=
e -o $lib $libobjs $deplibs $compiler_flags'
> > -+    archive_cmds=3D'$CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-h $=
{wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
> > -     archive_expsym_cmds=3D'echo "{ global:" > $lib.exp~cat $export_sy=
mbols | $SED -e "s/\(.*\)/\1;/" >> $lib.exp~echo "local: *; };" >> $lib.exp=
~
> > --      $CC -shared ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp ${wl}-h ${w=
l}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
> > -+      $CC -shared $pic_flag ${wl}-z ${wl}text ${wl}-M ${wl}$lib.exp $=
{wl}-h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags~$RM $lib.exp'
> > -       else
> > -     case `$CC -V 2>&1` in
> > -     *"Compilers 5.0"*)
> > -@@ -10123,8 +10714,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > -   need_version=3Dno
> > -   need_lib_prefix=3Dno
> > -
> > --  case $GCC,$host_os in
> > --  yes,cygwin* | yes,mingw* | yes,pw32* | yes,cegcc*)
> > -+  case $GCC,$cc_basename in
> > -+  yes,*)
> > -+    # gcc
> > -     library_names_spec=3D'$libname.dll.a'
> > -     # DLL is installed to $(libdir)/../bin by postinstall_cmds
> > -     postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -10157,13 +10749,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > -       library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``e=
cho ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> > -       ;;
> > -     esac
> > -+    dynamic_linker=3D'Win32 ld.exe'
> > -+    ;;
> > -+
> > -+  *,cl*)
> > -+    # Native MSVC
> > -+    libname_spec=3D'$name'
> > -+    soname_spec=3D'${libname}`echo ${release} | $SED -e 's/[.]/-/g'`$=
{versuffix}${shared_ext}'
> > -+    library_names_spec=3D'${libname}.dll.lib'
> > -+
> > -+    case $build_os in
> > -+    mingw*)
> > -+      sys_lib_search_path_spec=3D
> > -+      lt_save_ifs=3D$IFS
> > -+      IFS=3D';'
> > -+      for lt_path in $LIB
> > -+      do
> > -+        IFS=3D$lt_save_ifs
> > -+        # Let DOS variable expansion print the short 8.3 style file n=
ame.
> > -+        lt_path=3D`cd "$lt_path" 2>/dev/null && cmd //C "for %i in ("=
.") do @echo %~si"`
> > -+        sys_lib_search_path_spec=3D"$sys_lib_search_path_spec $lt_pat=
h"
> > -+      done
> > -+      IFS=3D$lt_save_ifs
> > -+      # Convert to MSYS style.
> > -+      sys_lib_search_path_spec=3D`$ECHO "$sys_lib_search_path_spec" |=
 sed -e 's|\\\\|/|g' -e 's| \\([a-zA-Z]\\):| /\\1|g' -e 's|^ ||'`
> > -+      ;;
> > -+    cygwin*)
> > -+      # Convert to unix form, then to dos form, then back to unix for=
m
> > -+      # but this time dos style (no spaces!) so that the unix form lo=
oks
> > -+      # like /cygdrive/c/PROGRA~1:/cygdr...
> > -+      sys_lib_search_path_spec=3D`cygpath --path --unix "$LIB"`
> > -+      sys_lib_search_path_spec=3D`cygpath --path --dos "$sys_lib_sear=
ch_path_spec" 2>/dev/null`
> > -+      sys_lib_search_path_spec=3D`cygpath --path --unix "$sys_lib_sea=
rch_path_spec" | $SED -e "s/$PATH_SEPARATOR/ /g"`
> > -+      ;;
> > -+    *)
> > -+      sys_lib_search_path_spec=3D"$LIB"
> > -+      if $ECHO "$sys_lib_search_path_spec" | $GREP ';[c-zC-Z]:/' >/de=
v/null; then
> > -+        # It is most probably a Windows format PATH.
> > -+        sys_lib_search_path_spec=3D`$ECHO "$sys_lib_search_path_spec"=
 | $SED -e 's/;/ /g'`
> > -+      else
> > -+        sys_lib_search_path_spec=3D`$ECHO "$sys_lib_search_path_spec"=
 | $SED -e "s/$PATH_SEPARATOR/ /g"`
> > -+      fi
> > -+      # FIXME: find the short name or the path components, as spaces =
are
> > -+      # common. (e.g. "Program Files" -> "PROGRA~1")
> > -+      ;;
> > -+    esac
> > -+
> > -+    # DLL is installed to $(libdir)/../bin by postinstall_cmds
> > -+    postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -+      dlpath=3D`$SHELL 2>&1 -c '\''. $dir/'\''\${base_file}'\''i; ech=
o \$dlname'\''`~
> > -+      dldir=3D$destdir/`dirname \$dlpath`~
> > -+      test -d \$dldir || mkdir -p \$dldir~
> > -+      $install_prog $dir/$dlname \$dldir/$dlname'
> > -+    postuninstall_cmds=3D'dldll=3D`$SHELL 2>&1 -c '\''. $file; echo \=
$dlname'\''`~
> > -+      dlpath=3D$dir/\$dldll~
> > -+       $RM \$dlpath'
> > -+    shlibpath_overrides_runpath=3Dyes
> > -+    dynamic_linker=3D'Win32 link.exe'
> > -     ;;
> > -
> > -   *)
> > -+    # Assume MSVC wrapper
> > -     library_names_spec=3D'${libname}`echo ${release} | $SED -e 's/[.]=
/-/g'`${versuffix}${shared_ext} $libname.lib'
> > -+    dynamic_linker=3D'Win32 ld.exe'
> > -     ;;
> > -   esac
> > --  dynamic_linker=3D'Win32 ld.exe'
> > -   # FIXME: first we should search . and the directory the executable =
is in
> > -   shlibpath_var=3DPATH
> > -   ;;
> > -@@ -11041,7 +11691,7 @@ else
> > -   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> > -   lt_status=3D$lt_dlunknown
> > -   cat > conftest.$ac_ext <<_LT_EOF
> > --#line 11044 "configure"
> > -+#line $LINENO "configure"
> > - #include "confdefs.h"
> > -
> > - #if HAVE_DLFCN_H
> > -@@ -11085,10 +11735,10 @@ else
> > - /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> > -    correspondingly for the symbols needed.  */
> > - #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > --void fnord () __attribute__((visibility("default")));
> > -+int fnord () __attribute__((visibility("default")));
> > - #endif
> > -
> > --void fnord () { int i=3D42; }
> > -+int fnord () { return 42; }
> > - int main ()
> > - {
> > -   void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -11147,7 +11797,7 @@ else
> > -   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> > -   lt_status=3D$lt_dlunknown
> > -   cat > conftest.$ac_ext <<_LT_EOF
> > --#line 11150 "configure"
> > -+#line $LINENO "configure"
> > - #include "confdefs.h"
> > -
> > - #if HAVE_DLFCN_H
> > -@@ -11191,10 +11841,10 @@ else
> > - /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> > -    correspondingly for the symbols needed.  */
> > - #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > --void fnord () __attribute__((visibility("default")));
> > -+int fnord () __attribute__((visibility("default")));
> > - #endif
> > -
> > --void fnord () { int i=3D42; }
> > -+int fnord () { return 42; }
> > - int main ()
> > - {
> > -   void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -13414,13 +14064,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> > - lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> > - lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> > - lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > -+lt_cv_to_host_file_cmd=3D'`$ECHO "$lt_cv_to_host_file_cmd" | $SED "$d=
elay_single_quote_subst"`'
> > -+lt_cv_to_tool_file_cmd=3D'`$ECHO "$lt_cv_to_tool_file_cmd" | $SED "$d=
elay_single_quote_subst"`'
> > - reload_flag=3D'`$ECHO "$reload_flag" | $SED "$delay_single_quote_subs=
t"`'
> > - reload_cmds=3D'`$ECHO "$reload_cmds" | $SED "$delay_single_quote_subs=
t"`'
> > - OBJDUMP=3D'`$ECHO "$OBJDUMP" | $SED "$delay_single_quote_subst"`'
> > - deplibs_check_method=3D'`$ECHO "$deplibs_check_method" | $SED "$delay=
_single_quote_subst"`'
> > - file_magic_cmd=3D'`$ECHO "$file_magic_cmd" | $SED "$delay_single_quot=
e_subst"`'
> > -+file_magic_glob=3D'`$ECHO "$file_magic_glob" | $SED "$delay_single_qu=
ote_subst"`'
> > -+want_nocaseglob=3D'`$ECHO "$want_nocaseglob" | $SED "$delay_single_qu=
ote_subst"`'
> > -+DLLTOOL=3D'`$ECHO "$DLLTOOL" | $SED "$delay_single_quote_subst"`'
> > -+sharedlib_from_linklib_cmd=3D'`$ECHO "$sharedlib_from_linklib_cmd" | =
$SED "$delay_single_quote_subst"`'
> > - AR=3D'`$ECHO "$AR" | $SED "$delay_single_quote_subst"`'
> > - AR_FLAGS=3D'`$ECHO "$AR_FLAGS" | $SED "$delay_single_quote_subst"`'
> > -+archiver_list_spec=3D'`$ECHO "$archiver_list_spec" | $SED "$delay_sin=
gle_quote_subst"`'
> > - STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> > - RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> > - old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay=
_single_quote_subst"`'
> > -@@ -13435,14 +14092,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> > - lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_=
to_cdecl" | $SED "$delay_single_quote_subst"`'
> > - lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_globa=
l_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> > - lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_c=
v_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quo=
te_subst"`'
> > -+nm_file_list_spec=3D'`$ECHO "$nm_file_list_spec" | $SED "$delay_singl=
e_quote_subst"`'
> > -+lt_sysroot=3D'`$ECHO "$lt_sysroot" | $SED "$delay_single_quote_subst"=
`'
> > - objdir=3D'`$ECHO "$objdir" | $SED "$delay_single_quote_subst"`'
> > - MAGIC_CMD=3D'`$ECHO "$MAGIC_CMD" | $SED "$delay_single_quote_subst"`'
> > - lt_prog_compiler_no_builtin_flag=3D'`$ECHO "$lt_prog_compiler_no_buil=
tin_flag" | $SED "$delay_single_quote_subst"`'
> > --lt_prog_compiler_wl=3D'`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_s=
ingle_quote_subst"`'
> > - lt_prog_compiler_pic=3D'`$ECHO "$lt_prog_compiler_pic" | $SED "$delay=
_single_quote_subst"`'
> > -+lt_prog_compiler_wl=3D'`$ECHO "$lt_prog_compiler_wl" | $SED "$delay_s=
ingle_quote_subst"`'
> > - lt_prog_compiler_static=3D'`$ECHO "$lt_prog_compiler_static" | $SED "=
$delay_single_quote_subst"`'
> > - lt_cv_prog_compiler_c_o=3D'`$ECHO "$lt_cv_prog_compiler_c_o" | $SED "=
$delay_single_quote_subst"`'
> > - need_locks=3D'`$ECHO "$need_locks" | $SED "$delay_single_quote_subst"=
`'
> > -+MANIFEST_TOOL=3D'`$ECHO "$MANIFEST_TOOL" | $SED "$delay_single_quote_=
subst"`'
> > - DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> > - NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> > - LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -13475,12 +14135,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> > - hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_sin=
gle_quote_subst"`'
> > - inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_=
subst"`'
> > - link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_=
quote_subst"`'
> > --fix_srcfile_path=3D'`$ECHO "$fix_srcfile_path" | $SED "$delay_single_=
quote_subst"`'
> > - always_export_symbols=3D'`$ECHO "$always_export_symbols" | $SED "$del=
ay_single_quote_subst"`'
> > - export_symbols_cmds=3D'`$ECHO "$export_symbols_cmds" | $SED "$delay_s=
ingle_quote_subst"`'
> > - exclude_expsyms=3D'`$ECHO "$exclude_expsyms" | $SED "$delay_single_qu=
ote_subst"`'
> > - include_expsyms=3D'`$ECHO "$include_expsyms" | $SED "$delay_single_qu=
ote_subst"`'
> > - prelink_cmds=3D'`$ECHO "$prelink_cmds" | $SED "$delay_single_quote_su=
bst"`'
> > -+postlink_cmds=3D'`$ECHO "$postlink_cmds" | $SED "$delay_single_quote_=
subst"`'
> > - file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quot=
e_subst"`'
> > - variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | =
$SED "$delay_single_quote_subst"`'
> > - need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > -@@ -13535,8 +14195,13 @@ reload_flag \
> > - OBJDUMP \
> > - deplibs_check_method \
> > - file_magic_cmd \
> > -+file_magic_glob \
> > -+want_nocaseglob \
> > -+DLLTOOL \
> > -+sharedlib_from_linklib_cmd \
> > - AR \
> > - AR_FLAGS \
> > -+archiver_list_spec \
> > - STRIP \
> > - RANLIB \
> > - CC \
> > -@@ -13546,12 +14211,14 @@ lt_cv_sys_global_symbol_pipe \
> > - lt_cv_sys_global_symbol_to_cdecl \
> > - lt_cv_sys_global_symbol_to_c_name_address \
> > - lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > -+nm_file_list_spec \
> > - lt_prog_compiler_no_builtin_flag \
> > --lt_prog_compiler_wl \
> > - lt_prog_compiler_pic \
> > -+lt_prog_compiler_wl \
> > - lt_prog_compiler_static \
> > - lt_cv_prog_compiler_c_o \
> > - need_locks \
> > -+MANIFEST_TOOL \
> > - DSYMUTIL \
> > - NMEDIT \
> > - LIPO \
> > -@@ -13567,7 +14234,6 @@ no_undefined_flag \
> > - hardcode_libdir_flag_spec \
> > - hardcode_libdir_flag_spec_ld \
> > - hardcode_libdir_separator \
> > --fix_srcfile_path \
> > - exclude_expsyms \
> > - include_expsyms \
> > - file_list_spec \
> > -@@ -13603,6 +14269,7 @@ module_cmds \
> > - module_expsym_cmds \
> > - export_symbols_cmds \
> > - prelink_cmds \
> > -+postlink_cmds \
> > - postinstall_cmds \
> > - postuninstall_cmds \
> > - finish_cmds \
> > -@@ -14368,7 +15035,8 @@ $as_echo X"$file" |
> > - # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> > - #
> > - #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 200=
5,
> > --#                 2006, 2007, 2008, 2009 Free Software Foundation, In=
c.
> > -+#                 2006, 2007, 2008, 2009, 2010 Free Software Foundati=
on,
> > -+#                 Inc.
> > - #   Written by Gordon Matzigkeit, 1996
> > - #
> > - #   This file is part of GNU Libtool.
> > -@@ -14471,19 +15139,42 @@ SP2NL=3D$lt_lt_SP2NL
> > - # turn newlines into spaces.
> > - NL2SP=3D$lt_lt_NL2SP
> > -
> > -+# convert \$build file names to \$host format.
> > -+to_host_file_cmd=3D$lt_cv_to_host_file_cmd
> > -+
> > -+# convert \$build files to toolchain format.
> > -+to_tool_file_cmd=3D$lt_cv_to_tool_file_cmd
> > -+
> > - # An object symbol dumper.
> > - OBJDUMP=3D$lt_OBJDUMP
> > -
> > - # Method to check whether dependent libraries are shared objects.
> > - deplibs_check_method=3D$lt_deplibs_check_method
> > -
> > --# Command to use when deplibs_check_method =3D=3D "file_magic".
> > -+# Command to use when deplibs_check_method =3D "file_magic".
> > - file_magic_cmd=3D$lt_file_magic_cmd
> > -
> > -+# How to find potential files when deplibs_check_method =3D "file_mag=
ic".
> > -+file_magic_glob=3D$lt_file_magic_glob
> > -+
> > -+# Find potential files using nocaseglob when deplibs_check_method =3D=
 "file_magic".
> > -+want_nocaseglob=3D$lt_want_nocaseglob
> > -+
> > -+# DLL creation program.
> > -+DLLTOOL=3D$lt_DLLTOOL
> > -+
> > -+# Command to associate shared and link libraries.
> > -+sharedlib_from_linklib_cmd=3D$lt_sharedlib_from_linklib_cmd
> > -+
> > - # The archiver.
> > - AR=3D$lt_AR
> > -+
> > -+# Flags to create an archive.
> > - AR_FLAGS=3D$lt_AR_FLAGS
> > -
> > -+# How to feed a file listing to the archiver.
> > -+archiver_list_spec=3D$lt_archiver_list_spec
> > -+
> > - # A symbol stripping program.
> > - STRIP=3D$lt_STRIP
> > -
> > -@@ -14513,6 +15204,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> > - # Transform the output of nm in a C name address pair when lib prefix=
 is needed.
> > - global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sym=
bol_to_c_name_address_lib_prefix
> > -
> > -+# Specify filename containing input files for \$NM.
> > -+nm_file_list_spec=3D$lt_nm_file_list_spec
> > -+
> > -+# The root where to search for dependent libraries,and in which our l=
ibraries should be installed.
> > -+lt_sysroot=3D$lt_sysroot
> > -+
> > - # The name of the directory that contains temporary libtool files.
> > - objdir=3D$objdir
> > -
> > -@@ -14522,6 +15219,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > - # Must we lock files when doing compilation?
> > - need_locks=3D$lt_need_locks
> > -
> > -+# Manifest tool.
> > -+MANIFEST_TOOL=3D$lt_MANIFEST_TOOL
> > -+
> > - # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> > - DSYMUTIL=3D$lt_DSYMUTIL
> > -
> > -@@ -14636,12 +15336,12 @@ with_gcc=3D$GCC
> > - # Compiler flag to turn off builtin functions.
> > - no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> > -
> > --# How to pass a linker flag through the compiler.
> > --wl=3D$lt_lt_prog_compiler_wl
> > --
> > - # Additional compiler flags for building library objects.
> > - pic_flag=3D$lt_lt_prog_compiler_pic
> > -
> > -+# How to pass a linker flag through the compiler.
> > -+wl=3D$lt_lt_prog_compiler_wl
> > -+
> > - # Compiler flag to prevent dynamic linking.
> > - link_static_flag=3D$lt_lt_prog_compiler_static
> > -
> > -@@ -14728,9 +15428,6 @@ inherit_rpath=3D$inherit_rpath
> > - # Whether libtool must link a program against all its dependency libr=
aries.
> > - link_all_deplibs=3D$link_all_deplibs
> > -
> > --# Fix the shell variable \$srcfile for the compiler.
> > --fix_srcfile_path=3D$lt_fix_srcfile_path
> > --
> > - # Set to "yes" if exported symbols are required.
> > - always_export_symbols=3D$always_export_symbols
> > -
> > -@@ -14746,6 +15443,9 @@ include_expsyms=3D$lt_include_expsyms
> > - # Commands necessary for linking programs (against libraries) with te=
mplates.
> > - prelink_cmds=3D$lt_prelink_cmds
> > -
> > -+# Commands necessary for finishing linking programs.
> > -+postlink_cmds=3D$lt_postlink_cmds
> > -+
> > - # Specify filename containing input files.
> > - file_list_spec=3D$lt_file_list_spec
> > -
> > -@@ -14778,210 +15478,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > -   # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> > -   # text mode, it properly converts lines to CR/LF.  This bash proble=
m
> > -   # is reportedly fixed, but why not run on old versions too?
> > --  sed '/^# Generated shell functions inserted here/q' "$ltmain" >> "$=
cfgfile" \
> > --    || (rm -f "$cfgfile"; exit 1)
> > --
> > --  case $xsi_shell in
> > --  yes)
> > --    cat << \_LT_EOF >> "$cfgfile"
> > --
> > --# func_dirname file append nondir_replacement
> > --# Compute the dirname of FILE.  If nonempty, add APPEND to the result=
,
> > --# otherwise set result to NONDIR_REPLACEMENT.
> > --func_dirname ()
> > --{
> > --  case ${1} in
> > --    */*) func_dirname_result=3D"${1%/*}${2}" ;;
> > --    *  ) func_dirname_result=3D"${3}" ;;
> > --  esac
> > --}
> > --
> > --# func_basename file
> > --func_basename ()
> > --{
> > --  func_basename_result=3D"${1##*/}"
> > --}
> > --
> > --# func_dirname_and_basename file append nondir_replacement
> > --# perform func_basename and func_dirname in a single function
> > --# call:
> > --#   dirname:  Compute the dirname of FILE.  If nonempty,
> > --#             add APPEND to the result, otherwise set result
> > --#             to NONDIR_REPLACEMENT.
> > --#             value returned in "$func_dirname_result"
> > --#   basename: Compute filename of FILE.
> > --#             value retuned in "$func_basename_result"
> > --# Implementation must be kept synchronized with func_dirname
> > --# and func_basename. For efficiency, we do not delegate to
> > --# those functions but instead duplicate the functionality here.
> > --func_dirname_and_basename ()
> > --{
> > --  case ${1} in
> > --    */*) func_dirname_result=3D"${1%/*}${2}" ;;
> > --    *  ) func_dirname_result=3D"${3}" ;;
> > --  esac
> > --  func_basename_result=3D"${1##*/}"
> > --}
> > --
> > --# func_stripname prefix suffix name
> > --# strip PREFIX and SUFFIX off of NAME.
> > --# PREFIX and SUFFIX must not contain globbing or regex special
> > --# characters, hashes, percent signs, but SUFFIX may contain a leading
> > --# dot (in which case that matches only a dot).
> > --func_stripname ()
> > --{
> > --  # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are
> > --  # positional parameters, so assign one to ordinary parameter first.
> > --  func_stripname_result=3D${3}
> > --  func_stripname_result=3D${func_stripname_result#"${1}"}
> > --  func_stripname_result=3D${func_stripname_result%"${2}"}
> > --}
> > --
> > --# func_opt_split
> > --func_opt_split ()
> > --{
> > --  func_opt_split_opt=3D${1%%=3D*}
> > --  func_opt_split_arg=3D${1#*=3D}
> > --}
> > --
> > --# func_lo2o object
> > --func_lo2o ()
> > --{
> > --  case ${1} in
> > --    *.lo) func_lo2o_result=3D${1%.lo}.${objext} ;;
> > --    *)    func_lo2o_result=3D${1} ;;
> > --  esac
> > --}
> > --
> > --# func_xform libobj-or-source
> > --func_xform ()
> > --{
> > --  func_xform_result=3D${1%.*}.lo
> > --}
> > --
> > --# func_arith arithmetic-term...
> > --func_arith ()
> > --{
> > --  func_arith_result=3D$(( $* ))
> > --}
> > --
> > --# func_len string
> > --# STRING may not start with a hyphen.
> > --func_len ()
> > --{
> > --  func_len_result=3D${#1}
> > --}
> > --
> > --_LT_EOF
> > --    ;;
> > --  *) # Bourne compatible functions.
> > --    cat << \_LT_EOF >> "$cfgfile"
> > --
> > --# func_dirname file append nondir_replacement
> > --# Compute the dirname of FILE.  If nonempty, add APPEND to the result=
,
> > --# otherwise set result to NONDIR_REPLACEMENT.
> > --func_dirname ()
> > --{
> > --  # Extract subdirectory from the argument.
> > --  func_dirname_result=3D`$ECHO "${1}" | $SED "$dirname"`
> > --  if test "X$func_dirname_result" =3D "X${1}"; then
> > --    func_dirname_result=3D"${3}"
> > --  else
> > --    func_dirname_result=3D"$func_dirname_result${2}"
> > --  fi
> > --}
> > --
> > --# func_basename file
> > --func_basename ()
> > --{
> > --  func_basename_result=3D`$ECHO "${1}" | $SED "$basename"`
> > --}
> > --
> > --
> > --# func_stripname prefix suffix name
> > --# strip PREFIX and SUFFIX off of NAME.
> > --# PREFIX and SUFFIX must not contain globbing or regex special
> > --# characters, hashes, percent signs, but SUFFIX may contain a leading
> > --# dot (in which case that matches only a dot).
> > --# func_strip_suffix prefix name
> > --func_stripname ()
> > --{
> > --  case ${2} in
> > --    .*) func_stripname_result=3D`$ECHO "${3}" | $SED "s%^${1}%%; s%\\=
\\${2}\$%%"`;;
> > --    *)  func_stripname_result=3D`$ECHO "${3}" | $SED "s%^${1}%%; s%${=
2}\$%%"`;;
> > --  esac
> > --}
> > --
> > --# sed scripts:
> > --my_sed_long_opt=3D'1s/^\(-[^=3D]*\)=3D.*/\1/;q'
> > --my_sed_long_arg=3D'1s/^-[^=3D]*=3D//'
> > --
> > --# func_opt_split
> > --func_opt_split ()
> > --{
> > --  func_opt_split_opt=3D`$ECHO "${1}" | $SED "$my_sed_long_opt"`
> > --  func_opt_split_arg=3D`$ECHO "${1}" | $SED "$my_sed_long_arg"`
> > --}
> > --
> > --# func_lo2o object
> > --func_lo2o ()
> > --{
> > --  func_lo2o_result=3D`$ECHO "${1}" | $SED "$lo2o"`
> > --}
> > --
> > --# func_xform libobj-or-source
> > --func_xform ()
> > --{
> > --  func_xform_result=3D`$ECHO "${1}" | $SED 's/\.[^.]*$/.lo/'`
> > --}
> > --
> > --# func_arith arithmetic-term...
> > --func_arith ()
> > --{
> > --  func_arith_result=3D`expr "$@"`
> > --}
> > --
> > --# func_len string
> > --# STRING may not start with a hyphen.
> > --func_len ()
> > --{
> > --  func_len_result=3D`expr "$1" : ".*" 2>/dev/null || echo $max_cmd_le=
n`
> > --}
> > --
> > --_LT_EOF
> > --esac
> > --
> > --case $lt_shell_append in
> > --  yes)
> > --    cat << \_LT_EOF >> "$cfgfile"
> > --
> > --# func_append var value
> > --# Append VALUE to the end of shell variable VAR.
> > --func_append ()
> > --{
> > --  eval "$1+=3D\$2"
> > --}
> > --_LT_EOF
> > --    ;;
> > --  *)
> > --    cat << \_LT_EOF >> "$cfgfile"
> > --
> > --# func_append var value
> > --# Append VALUE to the end of shell variable VAR.
> > --func_append ()
> > --{
> > --  eval "$1=3D\$$1\$2"
> > --}
> > --
> > --_LT_EOF
> > --    ;;
> > --  esac
> > --
> > --
> > --  sed -n '/^# Generated shell functions inserted here/,$p' "$ltmain" =
>> "$cfgfile" \
> > --    || (rm -f "$cfgfile"; exit 1)
> > --
> > --  mv -f "$cfgfile" "$ofile" ||
> > -+  sed '$q' "$ltmain" >> "$cfgfile" \
> > -+     || (rm -f "$cfgfile"; exit 1)
> > -+
> > -+  if test x"$xsi_shell" =3D xyes; then
> > -+  sed -e '/^func_dirname ()$/,/^} # func_dirname /c\
> > -+func_dirname ()\
> > -+{\
> > -+\    case ${1} in\
> > -+\      */*) func_dirname_result=3D"${1%/*}${2}" ;;\
> > -+\      *  ) func_dirname_result=3D"${3}" ;;\
> > -+\    esac\
> > -+} # Extended-shell func_dirname implementation' "$cfgfile" > $cfgfile=
.tmp \
> > -+  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> > -+test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+
> > -+
> > -+  sed -e '/^func_basename ()$/,/^} # func_basename /c\
> > -+func_basename ()\
> > -+{\
> > -+\    func_basename_result=3D"${1##*/}"\
> > -+} # Extended-shell func_basename implementation' "$cfgfile" > $cfgfil=
e.tmp \
> > -+  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> > -+test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+
> > -+
> > -+  sed -e '/^func_dirname_and_basename ()$/,/^} # func_dirname_and_bas=
ename /c\
> > -+func_dirname_and_basename ()\
> > -+{\
> > -+\    case ${1} in\
> > -+\      */*) func_dirname_result=3D"${1%/*}${2}" ;;\
> > -+\      *  ) func_dirname_result=3D"${3}" ;;\
> > -+\    esac\
> > -+\    func_basename_result=3D"${1##*/}"\
> > -+} # Extended-shell func_dirname_and_basename implementation' "$cfgfil=
e" > $cfgfile.tmp \
> > -+  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> > -+test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+
> > -+
> > -+  sed -e '/^func_stripname ()$/,/^} # func_stripname /c\
> > -+func_stripname ()\
> > -+{\
> > -+\    # pdksh 5.2.14 does not do ${X%$Y} correctly if both X and Y are=
\
> > -+\    # positional parameters, so assign one to ordinary parameter fir=
st.\
> > -+\    func_stripname_result=3D${3}\
> > -+\    func_stripname_result=3D${func_stripname_result#"${1}"}\
> > -+\    func_stripname_result=3D${func_stripname_result%"${2}"}\
> > -+} # Extended-shell func_stripname implementation' "$cfgfile" > $cfgfi=
le.tmp \
> > -+  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> > -+test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+
> > -+
> > -+  sed -e '/^func_split_long_opt ()$/,/^} # func_split_long_opt /c\
> > -+func_split_long_opt ()\
> > -+{\
> > -+\    func_split_long_opt_name=3D${1%%=3D*}\
> > -+\    func_split_long_opt_arg=3D${1#*=3D}\
> > -+} # Extended-shell func_split_long_opt implementation' "$cfgfile" > $=
cfgfile.tmp \
> > -+  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> > -+test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+
> > -+
> > -+  sed -e '/^func_split_short_opt ()$/,/^} # func_split_short_opt /c\
> > -+func_split_short_opt ()\
> > -+{\
> > -+\    func_split_short_opt_arg=3D${1#??}\
> > -+\    func_split_short_opt_name=3D${1%"$func_split_short_opt_arg"}\
> > -+} # Extended-shell func_split_short_opt implementation' "$cfgfile" > =
$cfgfile.tmp \
> > -+  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> > -+test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+
> > -+
> > -+  sed -e '/^func_lo2o ()$/,/^} # func_lo2o /c\
> > -+func_lo2o ()\
> > -+{\
> > -+\    case ${1} in\
> > -+\      *.lo) func_lo2o_result=3D${1%.lo}.${objext} ;;\
> > -+\      *)    func_lo2o_result=3D${1} ;;\
> > -+\    esac\
> > -+} # Extended-shell func_lo2o implementation' "$cfgfile" > $cfgfile.tm=
p \
> > -+  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> > -+test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+
> > -+
> > -+  sed -e '/^func_xform ()$/,/^} # func_xform /c\
> > -+func_xform ()\
> > -+{\
> > -+    func_xform_result=3D${1%.*}.lo\
> > -+} # Extended-shell func_xform implementation' "$cfgfile" > $cfgfile.t=
mp \
> > -+  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> > -+test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+
> > -+
> > -+  sed -e '/^func_arith ()$/,/^} # func_arith /c\
> > -+func_arith ()\
> > -+{\
> > -+    func_arith_result=3D$(( $* ))\
> > -+} # Extended-shell func_arith implementation' "$cfgfile" > $cfgfile.t=
mp \
> > -+  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> > -+test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+
> > -+
> > -+  sed -e '/^func_len ()$/,/^} # func_len /c\
> > -+func_len ()\
> > -+{\
> > -+    func_len_result=3D${#1}\
> > -+} # Extended-shell func_len implementation' "$cfgfile" > $cfgfile.tmp=
 \
> > -+  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> > -+test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+
> > -+fi
> > -+
> > -+if test x"$lt_shell_append" =3D xyes; then
> > -+  sed -e '/^func_append ()$/,/^} # func_append /c\
> > -+func_append ()\
> > -+{\
> > -+    eval "${1}+=3D\\${2}"\
> > -+} # Extended-shell func_append implementation' "$cfgfile" > $cfgfile.=
tmp \
> > -+  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> > -+test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+
> > -+
> > -+  sed -e '/^func_append_quoted ()$/,/^} # func_append_quoted /c\
> > -+func_append_quoted ()\
> > -+{\
> > -+\    func_quote_for_eval "${2}"\
> > -+\    eval "${1}+=3D\\\\ \\$func_quote_for_eval_result"\
> > -+} # Extended-shell func_append_quoted implementation' "$cfgfile" > $c=
fgfile.tmp \
> > -+  && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+    || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "$c=
fgfile.tmp")
> > -+test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+
> > -+
> > -+  # Save a `func_append' function call where possible by direct use o=
f '+=3D'
> > -+  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1+=3D"%g' $cfgfile > $=
cfgfile.tmp \
> > -+    && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "=
$cfgfile.tmp")
> > -+  test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+else
> > -+  # Save a `func_append' function call even when '+=3D' is not availa=
ble
> > -+  sed -e 's%func_append \([a-zA-Z_]\{1,\}\) "%\1=3D"$\1%g' $cfgfile >=
 $cfgfile.tmp \
> > -+    && mv -f "$cfgfile.tmp" "$cfgfile" \
> > -+      || (rm -f "$cfgfile" && cp "$cfgfile.tmp" "$cfgfile" && rm -f "=
$cfgfile.tmp")
> > -+  test 0 -eq $? || _lt_function_replace_fail=3D:
> > -+fi
> > -+
> > -+if test x"$_lt_function_replace_fail" =3D x":"; then
> > -+  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: Unable to substit=
ute extended shell functions in $ofile" >&5
> > -+$as_echo "$as_me: WARNING: Unable to substitute extended shell functi=
ons in $ofile" >&2;}
> > -+fi
> > -+
> > -+
> > -+   mv -f "$cfgfile" "$ofile" ||
> > -     (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
> > -   chmod +x "$ofile"
> > -
> > -diff --git a/sim/Makefile.in b/sim/Makefile.in
> > -index 65085cada9c..c216f21920f 100644
> > ---- a/sim/Makefile.in
> > -+++ b/sim/Makefile.in
> > -@@ -1029,6 +1029,7 @@ CYGPATH_W =3D @CYGPATH_W@
> > - C_DIALECT =3D @C_DIALECT@
> > +       # Add non-PIC object to the list of files to remove.
> > +       if test -n "$non_pic_object" &&
> > +          test "$non_pic_object" !=3D none; then
> > +-        rmfiles=3D"$rmfiles $dir/$non_pic_object"
> > ++        func_append rmfiles " $dir/$non_pic_object"
> > +       fi
> > +     fi
> > +     ;;
> > +
> > +       *)
> > +-    if test "$mode" =3D clean ; then
> > ++    if test "$opt_mode" =3D clean ; then
> > +       noexename=3D$name
> > +       case $file in
> > +       *.exe)
> > +@@ -8547,7 +9559,7 @@ func_mode_uninstall ()
> > +         noexename=3D$func_stripname_result
> > +         # $file with .exe has already been added to rmfiles,
> > +         # add $file without .exe
> > +-        rmfiles=3D"$rmfiles $file"
> > ++        func_append rmfiles " $file"
> > +         ;;
> > +       esac
> > +       # Do a test to see if this is a libtool program.
> > +@@ -8556,7 +9568,7 @@ func_mode_uninstall ()
> > +           func_ltwrapper_scriptname "$file"
> > +           relink_command=3D
> > +           func_source $func_ltwrapper_scriptname_result
> > +-          rmfiles=3D"$rmfiles $func_ltwrapper_scriptname_result"
> > ++          func_append rmfiles " $func_ltwrapper_scriptname_result"
> > +         else
> > +           relink_command=3D
> > +           func_source $dir/$noexename
> > +@@ -8564,12 +9576,12 @@ func_mode_uninstall ()
> > +
> > +         # note $name still contains .exe if it was in $file originall=
y
> > +         # as does the version of $file that was added into $rmfiles
> > +-        rmfiles=3D"$rmfiles $objdir/$name $objdir/${name}S.${objext}"
> > ++        func_append rmfiles " $odir/$name $odir/${name}S.${objext}"
> > +         if test "$fast_install" =3D yes && test -n "$relink_command";=
 then
> > +-          rmfiles=3D"$rmfiles $objdir/lt-$name"
> > ++          func_append rmfiles " $odir/lt-$name"
> > +         fi
> > +         if test "X$noexename" !=3D "X$name" ; then
> > +-          rmfiles=3D"$rmfiles $objdir/lt-${noexename}.c"
> > ++          func_append rmfiles " $odir/lt-${noexename}.c"
> > +         fi
> > +       fi
> > +     fi
> > +@@ -8577,7 +9589,6 @@ func_mode_uninstall ()
> > +       esac
> > +       func_show_eval "$RM $rmfiles" 'exit_status=3D1'
> > +     done
> > +-    objdir=3D"$origobjdir"
> > +
> > +     # Try to remove the ${objdir}s in the directories where we delete=
d files
> > +     for dir in $rmdirs; do
> > +@@ -8589,16 +9600,16 @@ func_mode_uninstall ()
> > +     exit $exit_status
> > + }
> > +
> > +-{ test "$mode" =3D uninstall || test "$mode" =3D clean; } &&
> > ++{ test "$opt_mode" =3D uninstall || test "$opt_mode" =3D clean; } &&
> > +     func_mode_uninstall ${1+"$@"}
> > +
> > +-test -z "$mode" && {
> > ++test -z "$opt_mode" && {
> > +   help=3D"$generic_help"
> > +   func_fatal_help "you must specify a MODE"
> > + }
> > +
> > + test -z "$exec_cmd" && \
> > +-  func_fatal_help "invalid operation mode \`$mode'"
> > ++  func_fatal_help "invalid operation mode \`$opt_mode'"
> > +
> > + if test -n "$exec_cmd"; then
> > +   eval exec "$exec_cmd"
> > +diff --git a/ltoptions.m4 b/ltoptions.m4
> > +index 5ef12ced2a8..17cfd51c0b3 100644
> > +--- a/ltoptions.m4
> > ++++ b/ltoptions.m4
> > +@@ -8,7 +8,7 @@
> > + # unlimited permission to copy and/or distribute it, with or without
> > + # modifications, as long as this notice is preserved.
> > +
> > +-# serial 6 ltoptions.m4
> > ++# serial 7 ltoptions.m4
> > +
> > + # This is to help aclocal find these macros, as it can't see m4_defin=
e.
> > + AC_DEFUN([LTOPTIONS_VERSION], [m4_if([1])])
> > +diff --git a/ltversion.m4 b/ltversion.m4
> > +index bf87f77132d..9c7b5d41185 100644
> > +--- a/ltversion.m4
> > ++++ b/ltversion.m4
> > +@@ -7,17 +7,17 @@
> > + # unlimited permission to copy and/or distribute it, with or without
> > + # modifications, as long as this notice is preserved.
> > +
> > +-# Generated from ltversion.in.
> > ++# @configure_input@
> > +
> > +-# serial 3134 ltversion.m4
> > ++# serial 3293 ltversion.m4
> > + # This file is part of GNU Libtool
> > +
> > +-m4_define([LT_PACKAGE_VERSION], [2.2.7a])
> > +-m4_define([LT_PACKAGE_REVISION], [1.3134])
> > ++m4_define([LT_PACKAGE_VERSION], [2.4])
> > ++m4_define([LT_PACKAGE_REVISION], [1.3293])
> > +
> > + AC_DEFUN([LTVERSION_VERSION],
> > +-[macro_version=3D'2.2.7a'
> > +-macro_revision=3D'1.3134'
> > ++[macro_version=3D'2.4'
> > ++macro_revision=3D'1.3293'
> > + _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
> > + _LT_DECL(, macro_revision, 0)
> > + ])
> > +diff --git a/lt~obsolete.m4 b/lt~obsolete.m4
> > +index bf92b5e0790..c573da90c5c 100644
> > +--- a/lt~obsolete.m4
> > ++++ b/lt~obsolete.m4
> > +@@ -7,7 +7,7 @@
> > + # unlimited permission to copy and/or distribute it, with or without
> > + # modifications, as long as this notice is preserved.
> > +
> > +-# serial 4 lt~obsolete.m4
> > ++# serial 5 lt~obsolete.m4
> > +
> > + # These exist entirely to fool aclocal when bootstrapping libtool.
> > + #
> > +diff --git a/opcodes/Makefile.in b/opcodes/Makefile.in
> > +index 2db307e8d7c..aa6e3e1b429 100644
> > +--- a/opcodes/Makefile.in
> > ++++ b/opcodes/Makefile.in
> > +@@ -292,6 +292,7 @@ CYGPATH_W =3D @CYGPATH_W@
> > + DATADIRNAME =3D @DATADIRNAME@
> >   DEFS =3D @DEFS@
> >   DEPDIR =3D @DEPDIR@
> >  +DLLTOOL =3D @DLLTOOL@
> >   DSYMUTIL =3D @DSYMUTIL@
> > - DTC =3D @DTC@
> >   DUMPBIN =3D @DUMPBIN@
> > -@@ -1089,6 +1090,7 @@ LN_S =3D @LN_S@
> > + ECHO_C =3D @ECHO_C@
> > +@@ -325,6 +326,7 @@ LN_S =3D @LN_S@
> >   LTLIBOBJS =3D @LTLIBOBJS@
> >   MAINT =3D @MAINT@
> >   MAKEINFO =3D @MAKEINFO@
> >  +MANIFEST_TOOL =3D @MANIFEST_TOOL@
> >   MKDIR_P =3D @MKDIR_P@
> > - NM =3D @NM@
> > - NMEDIT =3D @NMEDIT@
> > -@@ -1150,6 +1152,7 @@ abs_builddir =3D @abs_builddir@
> > + MKINSTALLDIRS =3D @MKINSTALLDIRS@
> > + MSGFMT =3D @MSGFMT@
> > +@@ -363,6 +365,7 @@ abs_builddir =3D @abs_builddir@
> >   abs_srcdir =3D @abs_srcdir@
> >   abs_top_builddir =3D @abs_top_builddir@
> >   abs_top_srcdir =3D @abs_top_srcdir@
> > @@ -31845,31 +30653,29 @@ index 65085cada9c..c216f21920f 100644
> >   ac_ct_CC =3D @ac_ct_CC@
> >   ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
> >   am__include =3D @am__include@
> > -diff --git a/sim/configure b/sim/configure
> > -index c31ff71c805..1936741abe2 100755
> > ---- a/sim/configure
> > -+++ b/sim/configure
> > -@@ -887,8 +887,11 @@ OTOOL
> > +diff --git a/opcodes/configure b/opcodes/configure
> > +index fc4109a1a47..6c42352868c 100755
> > +--- a/opcodes/configure
> > ++++ b/opcodes/configure
> > +@@ -682,6 +682,9 @@ OTOOL
> >   LIPO
> >   NMEDIT
> >   DSYMUTIL
> >  +MANIFEST_TOOL
> > - AWK
> > - STRIP
> >  +ac_ct_AR
> >  +DLLTOOL
> >   OBJDUMP
> >   LN_S
> >   NM
> > -@@ -991,6 +994,7 @@ enable_static
> > +@@ -800,6 +803,7 @@ enable_static
> >   with_pic
> >   enable_fast_install
> >   with_gnu_ld
> >  +with_libtool_sysroot
> >   enable_libtool_lock
> > - enable_maintainer_mode
> > - enable_dependency_tracking
> > -@@ -1809,6 +1813,8 @@ Optional Packages:
> > + enable_checking
> > + enable_targets
> > +@@ -1468,6 +1472,8 @@ Optional Packages:
> >     --with-pic              try to use only PIC/non-PIC objects [defaul=
t=3Duse
> >                             both]
> >     --with-gnu-ld           assume the C compiler uses GNU ld [default=
=3Dno]
> > @@ -31878,7 +30684,7 @@ index c31ff71c805..1936741abe2 100755
> >
> >   Some influential environment variables:
> >     CC          C compiler command
> > -@@ -5642,8 +5648,8 @@ esac
> > +@@ -4977,8 +4983,8 @@ esac
> >
> >
> >
> > @@ -31889,7 +30695,7 @@ index c31ff71c805..1936741abe2 100755
> >
> >
> >
> > -@@ -5683,7 +5689,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > +@@ -5018,7 +5024,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print string=
s" >&5
> >   $as_echo_n "checking how to print strings... " >&6; }
> >   # Test print first, because it will be a builtin if present.
> > @@ -31898,7 +30704,7 @@ index c31ff71c805..1936741abe2 100755
> >      test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> >     ECHO=3D'print -r --'
> >   elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -@@ -6376,8 +6382,8 @@ $as_echo_n "checking whether the shell understan=
ds some XSI constructs... " >&6;
> > +@@ -5711,8 +5717,8 @@ $as_echo_n "checking whether the shell understan=
ds some XSI constructs... " >&6;
> >   # Try some XSI features
> >   xsi_shell=3Dno
> >   ( _lt_dummy=3D"a/b/c"
> > @@ -31909,7 +30715,7 @@ index c31ff71c805..1936741abe2 100755
> >       && eval 'test $(( 1 + 1 )) -eq 2 \
> >       && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> >     && xsi_shell=3Dyes
> > -@@ -6426,6 +6432,80 @@ esac
> > +@@ -5761,6 +5767,80 @@ esac
> >
> >
> >
> > @@ -31990,7 +30796,7 @@ index c31ff71c805..1936741abe2 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to r=
eload object files" >&5
> >   $as_echo_n "checking for $LD option to reload object files... " >&6; =
}
> >   if ${lt_cv_ld_reload_flag+:} false; then :
> > -@@ -6442,6 +6522,11 @@ case $reload_flag in
> > +@@ -5777,6 +5857,11 @@ case $reload_flag in
> >   esac
> >   reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> >   case $host_os in
> > @@ -32002,7 +30808,7 @@ index c31ff71c805..1936741abe2 100755
> >     darwin*)
> >       if test "$GCC" =3D yes; then
> >         reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$rel=
oad_objs'
> > -@@ -6610,7 +6695,8 @@ mingw* | pw32*)
> > +@@ -5945,7 +6030,8 @@ mingw* | pw32*)
> >       lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x86=
 DLL'
> >       lt_cv_file_magic_cmd=3D'func_win32_libid'
> >     else
> > @@ -32012,7 +30818,7 @@ index c31ff71c805..1936741abe2 100755
> >       lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> >     fi
> >     ;;
> > -@@ -6764,6 +6850,21 @@ esac
> > +@@ -6099,6 +6185,21 @@ esac
> >   fi
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check=
_method" >&5
> >   $as_echo "$lt_cv_deplibs_check_method" >&6; }
> > @@ -32034,7 +30840,7 @@ index c31ff71c805..1936741abe2 100755
> >   file_magic_cmd=3D$lt_cv_file_magic_cmd
> >   deplibs_check_method=3D$lt_cv_deplibs_check_method
> >   test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> > -@@ -6779,6 +6880,157 @@ test -z "$deplibs_check_method" && deplibs_che=
ck_method=3Dunknown
> > +@@ -6114,6 +6215,157 @@ test -z "$deplibs_check_method" && deplibs_che=
ck_method=3Dunknown
> >
> >
> >
> > @@ -32192,7 +30998,7 @@ index c31ff71c805..1936741abe2 100755
> >   plugin_option=3D
> >   plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.=
dll"
> >   for plugin in $plugin_names; do
> > -@@ -6793,8 +7045,10 @@ for plugin in $plugin_names; do
> > +@@ -6128,8 +6380,10 @@ for plugin in $plugin_names; do
> >   done
> >
> >   if test -n "$ac_tool_prefix"; then
> > @@ -32205,7 +31011,7 @@ index c31ff71c805..1936741abe2 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_AR+:} false; then :
> > -@@ -6810,7 +7064,7 @@ do
> > +@@ -6145,7 +6399,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -32214,7 +31020,7 @@ index c31ff71c805..1936741abe2 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -6830,11 +7084,15 @@ $as_echo "no" >&6; }
> > +@@ -6165,11 +6419,15 @@ $as_echo "no" >&6; }
> >   fi
> >
> >
> > @@ -32233,7 +31039,7 @@ index c31ff71c805..1936741abe2 100755
> >   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >   $as_echo_n "checking for $ac_word... " >&6; }
> >   if ${ac_cv_prog_ac_ct_AR+:} false; then :
> > -@@ -6850,7 +7108,7 @@ do
> > +@@ -6185,7 +6443,7 @@ do
> >     test -z "$as_dir" && as_dir=3D.
> >       for ac_exec_ext in '' $ac_executable_extensions; do
> >     if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -32242,7 +31048,7 @@ index c31ff71c805..1936741abe2 100755
> >       $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_=
exec_ext" >&5
> >       break 2
> >     fi
> > -@@ -6869,6 +7127,10 @@ else
> > +@@ -6204,6 +6462,10 @@ else
> >   $as_echo "no" >&6; }
> >   fi
> >
> > @@ -32253,7 +31059,7 @@ index c31ff71c805..1936741abe2 100755
> >     if test "x$ac_ct_AR" =3D x; then
> >       AR=3D"false"
> >     else
> > -@@ -6880,29 +7142,81 @@ ac_tool_warned=3Dyes ;;
> > +@@ -6215,25 +6477,20 @@ ac_tool_warned=3Dyes ;;
> >   esac
> >       AR=3D$ac_ct_AR
> >     fi
> > @@ -32286,16 +31092,13 @@ index c31ff71c805..1936741abe2 100755
> >  +: ${AR=3Dar}
> >  +: ${AR_FLAGS=3Dcru}
> >  +
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > -+
> > +
> > +
> > +
> > +@@ -6244,6 +6501,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> > +
> > +
> > +
> >  +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE =
support" >&5
> >  +$as_echo_n "checking for archiver @FILE support... " >&6; }
> >  +if ${lt_cv_ar_at_file+:} false; then :
> > @@ -32308,7 +31111,7 @@ index c31ff71c805..1936741abe2 100755
> >  +int
> >  +main ()
> >  +{
> > -
> > ++
> >  +  ;
> >  +  return 0;
> >  +}
> > @@ -32334,23 +31137,29 @@ index c31ff71c805..1936741abe2 100755
> >  +        fi
> >  +      fi
> >  +      rm -f conftest.* libconftest.a
> > -
> > ++
> >  +fi
> >  +rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> > -
> > ++
> >  +fi
> >  +{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_ar_at_file" >=
&5
> >  +$as_echo "$lt_cv_ar_at_file" >&6; }
> > -
> > ++
> >  +if test "x$lt_cv_ar_at_file" =3D xno; then
> >  +  archiver_list_spec=3D
> >  +else
> >  +  archiver_list_spec=3D$lt_cv_ar_at_file
> >  +fi
> > ++
> > ++
> > ++
> > ++
> > ++
> > ++
> >
> > -
> > -
> > -@@ -7291,8 +7605,8 @@ esac
> > + if test -n "$ac_tool_prefix"; then
> > +   # Extract the first word of "${ac_tool_prefix}strip", so it can be =
a program name with args.
> > +@@ -6584,8 +6898,8 @@ esac
> >   lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/extern=
 int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> >
> >   # Transform an extracted symbol line into symbol name and symbol addr=
ess
> > @@ -32361,7 +31170,7 @@ index c31ff71c805..1936741abe2 100755
> >
> >   # Handle CRLF in mingw tool chain
> >   opt_cr=3D
> > -@@ -7328,6 +7642,7 @@ for ac_symprfx in "" "_"; do
> > +@@ -6621,6 +6935,7 @@ for ac_symprfx in "" "_"; do
> >     else
> >       lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[  ]\($symcode$sy=
mcode*\)[         ][      ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> >     fi
> > @@ -32369,7 +31178,7 @@ index c31ff71c805..1936741abe2 100755
> >
> >     # Check to see that the pipe works correctly.
> >     pipe_works=3Dno
> > -@@ -7369,6 +7684,18 @@ _LT_EOF
> > +@@ -6662,6 +6977,18 @@ _LT_EOF
> >         if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> >       if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> >         cat <<_LT_EOF > conftest.$ac_ext
> > @@ -32388,7 +31197,7 @@ index c31ff71c805..1936741abe2 100755
> >   #ifdef __cplusplus
> >   extern "C" {
> >   #endif
> > -@@ -7380,7 +7707,7 @@ _LT_EOF
> > +@@ -6673,7 +7000,7 @@ _LT_EOF
> >         cat <<_LT_EOF >> conftest.$ac_ext
> >
> >   /* The mapping between symbol names and symbols.  */
> > @@ -32397,7 +31206,7 @@ index c31ff71c805..1936741abe2 100755
> >     const char *name;
> >     void       *address;
> >   }
> > -@@ -7406,8 +7733,8 @@ static const void *lt_preloaded_setup() {
> > +@@ -6699,8 +7026,8 @@ static const void *lt_preloaded_setup() {
> >   _LT_EOF
> >         # Now try linking the two files.
> >         mv conftest.$ac_objext conftstm.$ac_objext
> > @@ -32408,7 +31217,7 @@ index c31ff71c805..1936741abe2 100755
> >         LIBS=3D"conftstm.$ac_objext"
> >         CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> >         if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\=
""; } >&5
> > -@@ -7417,8 +7744,8 @@ _LT_EOF
> > +@@ -6710,8 +7037,8 @@ _LT_EOF
> >     test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> >           pipe_works=3Dyes
> >         fi
> > @@ -32419,7 +31228,7 @@ index c31ff71c805..1936741abe2 100755
> >       else
> >         echo "cannot find nm_test_func in $nlist" >&5
> >       fi
> > -@@ -7455,6 +7782,14 @@ else
> > +@@ -6748,6 +7075,14 @@ else
> >   $as_echo "ok" >&6; }
> >   fi
> >
> > @@ -32434,7 +31243,7 @@ index c31ff71c805..1936741abe2 100755
> >
> >
> >
> > -@@ -7473,6 +7808,47 @@ fi
> > +@@ -6766,6 +7101,47 @@ fi
> >
> >
> >
> > @@ -32482,7 +31291,7 @@ index c31ff71c805..1936741abe2 100755
> >
> >
> >
> > -@@ -7682,6 +8058,123 @@ esac
> > +@@ -6975,6 +7351,123 @@ esac
> >
> >   need_locks=3D"$enable_libtool_lock"
> >
> > @@ -32606,7 +31415,7 @@ index c31ff71c805..1936741abe2 100755
> >
> >     case $host_os in
> >       rhapsody* | darwin*)
> > -@@ -8245,6 +8738,8 @@ _LT_EOF
> > +@@ -7538,6 +8031,8 @@ _LT_EOF
> >         $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> >         echo "$AR cru libconftest.a conftest.o" >&5
> >         $AR cru libconftest.a conftest.o 2>&5
> > @@ -32615,7 +31424,7 @@ index c31ff71c805..1936741abe2 100755
> >         cat > conftest.c << _LT_EOF
> >   int main() { return 0;}
> >   _LT_EOF
> > -@@ -9499,8 +9994,6 @@ fi
> > +@@ -8090,8 +8585,6 @@ fi
> >   lt_prog_compiler_pic=3D
> >   lt_prog_compiler_static=3D
> >
> > @@ -32624,7 +31433,7 @@ index c31ff71c805..1936741abe2 100755
> >
> >     if test "$GCC" =3D yes; then
> >       lt_prog_compiler_wl=3D'-Wl,'
> > -@@ -9666,6 +10159,12 @@ $as_echo_n "checking for $compiler option to p=
roduce PIC... " >&6; }
> > +@@ -8257,6 +8750,12 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> >       lt_prog_compiler_pic=3D'--shared'
> >       lt_prog_compiler_static=3D'--static'
> >       ;;
> > @@ -32637,7 +31446,7 @@ index c31ff71c805..1936741abe2 100755
> >         pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> >           # Portland Group compilers (*not* the Pentium gcc compiler,
> >       # which looks to be a dead project)
> > -@@ -9728,7 +10227,7 @@ $as_echo_n "checking for $compiler option to pr=
oduce PIC... " >&6; }
> > +@@ -8319,7 +8818,7 @@ $as_echo_n "checking for $compiler option to pro=
duce PIC... " >&6; }
> >         lt_prog_compiler_pic=3D'-KPIC'
> >         lt_prog_compiler_static=3D'-Bstatic'
> >         case $cc_basename in
> > @@ -32646,7 +31455,7 @@ index c31ff71c805..1936741abe2 100755
> >       lt_prog_compiler_wl=3D'-Qoption ld ';;
> >         *)
> >       lt_prog_compiler_wl=3D'-Wl,';;
> > -@@ -9785,13 +10284,17 @@ case $host_os in
> > +@@ -8376,13 +8875,17 @@ case $host_os in
> >       lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> >       ;;
> >   esac
> > @@ -32670,7 +31479,7 @@ index c31ff71c805..1936741abe2 100755
> >
> >   #
> >   # Check to make sure the PIC flag actually works.
> > -@@ -9852,6 +10355,11 @@ fi
> > +@@ -8443,6 +8946,11 @@ fi
> >
> >
> >
> > @@ -32682,7 +31491,7 @@ index c31ff71c805..1936741abe2 100755
> >   #
> >   # Check to make sure the static flag actually works.
> >   #
> > -@@ -10202,7 +10710,8 @@ _LT_EOF
> > +@@ -8793,7 +9301,8 @@ _LT_EOF
> >         allow_undefined_flag=3Dunsupported
> >         always_export_symbols=3Dno
> >         enable_shared_with_static_runtimes=3Dyes
> > @@ -32692,7 +31501,7 @@ index c31ff71c805..1936741abe2 100755
> >
> >         if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> >           archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags=
 -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-imp=
lib -Xlinker $lib'
> > -@@ -10301,12 +10810,12 @@ _LT_EOF
> > +@@ -8892,12 +9401,12 @@ _LT_EOF
> >         whole_archive_flag_spec=3D'--whole-archive$convenience --no-who=
le-archive'
> >         hardcode_libdir_flag_spec=3D
> >         hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> > @@ -32707,7 +31516,7 @@ index c31ff71c805..1936741abe2 100755
> >         fi
> >         ;;
> >       esac
> > -@@ -10320,8 +10829,8 @@ _LT_EOF
> > +@@ -8911,8 +9420,8 @@ _LT_EOF
> >       archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o $lib'
> >       wlarc=3D
> >         else
> > @@ -32718,7 +31527,7 @@ index c31ff71c805..1936741abe2 100755
> >         fi
> >         ;;
> >
> > -@@ -10339,8 +10848,8 @@ _LT_EOF
> > +@@ -8930,8 +9439,8 @@ _LT_EOF
> >
> >   _LT_EOF
> >         elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /de=
v/null; then
> > @@ -32729,7 +31538,7 @@ index c31ff71c805..1936741abe2 100755
> >         else
> >       ld_shlibs=3Dno
> >         fi
> > -@@ -10386,8 +10895,8 @@ _LT_EOF
> > +@@ -8977,8 +9486,8 @@ _LT_EOF
> >
> >       *)
> >         if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/=
null; then
> > @@ -32740,7 +31549,7 @@ index c31ff71c805..1936741abe2 100755
> >         else
> >       ld_shlibs=3Dno
> >         fi
> > -@@ -10517,7 +11026,13 @@ _LT_EOF
> > +@@ -9108,7 +9617,13 @@ _LT_EOF
> >       allow_undefined_flag=3D'-berok'
> >           # Determine the default libpath from the value encoded in an
> >           # empty executable.
> > @@ -32755,7 +31564,7 @@ index c31ff71c805..1936741abe2 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -10530,22 +11045,29 @@ main ()
> > +@@ -9121,22 +9636,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -32798,7 +31607,7 @@ index c31ff71c805..1936741abe2 100755
> >
> >           hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_li=
bpath"
> >           archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobjs=
 $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undef=
ined_flag}" !=3D "x"; then func_echo_all "${wl}${allow_undefined_flag}"; el=
se :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> > -@@ -10557,7 +11079,13 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9148,7 +9670,13 @@ if test -z "$aix_libpath"; then aix_libpath=3D"=
/usr/lib:/lib"; fi
> >       else
> >        # Determine the default libpath from the value encoded in an
> >        # empty executable.
> > @@ -32813,7 +31622,7 @@ index c31ff71c805..1936741abe2 100755
> >   /* end confdefs.h.  */
> >
> >   int
> > -@@ -10570,22 +11098,29 @@ main ()
> > +@@ -9161,22 +9689,29 @@ main ()
> >   _ACEOF
> >   if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -32856,7 +31665,7 @@ index c31ff71c805..1936741abe2 100755
> >
> >        hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
> >         # Warning - without using the other run time loading flags,
> > -@@ -10630,20 +11165,63 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9221,20 +9756,63 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >         # Microsoft Visual C++.
> >         # hardcode_libdir_flag_spec is actually meaningless, as there i=
s
> >         # no search path for DLLs.
> > @@ -32934,7 +31743,7 @@ index c31ff71c805..1936741abe2 100755
> >         ;;
> >
> >       darwin* | rhapsody*)
> > -@@ -10704,7 +11282,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -9295,7 +9873,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> >
> >       # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> >       freebsd* | dragonfly*)
> > @@ -32943,7 +31752,7 @@ index c31ff71c805..1936741abe2 100755
> >         hardcode_libdir_flag_spec=3D'-R$libdir'
> >         hardcode_direct=3Dyes
> >         hardcode_shlibpath_var=3Dno
> > -@@ -10712,7 +11290,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -9303,7 +9881,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> >
> >       hpux9*)
> >         if test "$GCC" =3D yes; then
> > @@ -32952,7 +31761,7 @@ index c31ff71c805..1936741abe2 100755
> >         else
> >       archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_=
objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> >         fi
> > -@@ -10728,7 +11306,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> > +@@ -9319,7 +9897,7 @@ if test -z "$aix_libpath"; then aix_libpath=3D"/=
usr/lib:/lib"; fi
> >
> >       hpux10*)
> >         if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> > @@ -32961,7 +31770,7 @@ index c31ff71c805..1936741abe2 100755
> >         else
> >       archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib $lib=
objs $deplibs $linker_flags'
> >         fi
> > -@@ -10752,10 +11330,10 @@ if test -z "$aix_libpath"; then aix_libpath=
=3D"/usr/lib:/lib"; fi
> > +@@ -9343,10 +9921,10 @@ if test -z "$aix_libpath"; then aix_libpath=3D=
"/usr/lib:/lib"; fi
> >         archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname -o $lib $libob=
js $deplibs $compiler_flags'
> >         ;;
> >       ia64*)
> > @@ -32974,7 +31783,7 @@ index c31ff71c805..1936741abe2 100755
> >         ;;
> >       esac
> >         else
> > -@@ -10834,23 +11412,36 @@ fi
> > +@@ -9425,23 +10003,36 @@ fi
> >
> >       irix5* | irix6* | nonstopux*)
> >         if test "$GCC" =3D yes; then
> > @@ -33019,7 +31828,7 @@ index c31ff71c805..1936741abe2 100755
> >         else
> >       archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags -so=
name $soname `test -n "$verstring" && func_echo_all "-set_version $verstrin=
g"` -update_registry ${output_objdir}/so_locations -o $lib'
> >       archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $v=
erstring"` -update_registry ${output_objdir}/so_locations -exports_file $ex=
port_symbols -o $lib'
> > -@@ -10935,7 +11526,7 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -9526,7 +10117,7 @@ rm -f core conftest.err conftest.$ac_objext \
> >       osf4* | osf5*)  # as osf3* with the addition of -msym flag
> >         if test "$GCC" =3D yes; then
> >       allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> > @@ -33028,7 +31837,7 @@ index c31ff71c805..1936741abe2 100755
> >       hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
> >         else
> >       allow_undefined_flag=3D' -expect_unresolved \*'
> > -@@ -10954,9 +11545,9 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -9545,9 +10136,9 @@ rm -f core conftest.err conftest.$ac_objext \
> >         no_undefined_flag=3D' -z defs'
> >         if test "$GCC" =3D yes; then
> >       wlarc=3D'${wl}'
> > @@ -33040,7 +31849,7 @@ index c31ff71c805..1936741abe2 100755
> >         else
> >       case `$CC -V 2>&1` in
> >       *"Compilers 5.0"*)
> > -@@ -11532,8 +12123,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10123,8 +10714,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> >     need_version=3Dno
> >     need_lib_prefix=3Dno
> >
> > @@ -33052,7 +31861,7 @@ index c31ff71c805..1936741abe2 100755
> >       library_names_spec=3D'$libname.dll.a'
> >       # DLL is installed to $(libdir)/../bin by postinstall_cmds
> >       postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -11566,13 +12158,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10157,13 +10749,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> >         library_names_spec=3D'`echo ${libname} | sed -e 's/^lib/pw/'``e=
cho ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
> >         ;;
> >       esac
> > @@ -33125,16 +31934,16 @@ index c31ff71c805..1936741abe2 100755
> >     # FIXME: first we should search . and the directory the executable =
is in
> >     shlibpath_var=3DPATH
> >     ;;
> > -@@ -12450,7 +13100,7 @@ else
> > +@@ -11041,7 +11691,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 12453 "configure"
> > +-#line 11044 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -12494,10 +13144,10 @@ else
> > +@@ -11085,10 +11735,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -33147,16 +31956,16 @@ index c31ff71c805..1936741abe2 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -12556,7 +13206,7 @@ else
> > +@@ -11147,7 +11797,7 @@ else
> >     lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >     lt_status=3D$lt_dlunknown
> >     cat > conftest.$ac_ext <<_LT_EOF
> > --#line 12559 "configure"
> > +-#line 11150 "configure"
> >  +#line $LINENO "configure"
> >   #include "confdefs.h"
> >
> >   #if HAVE_DLFCN_H
> > -@@ -12600,10 +13250,10 @@ else
> > +@@ -11191,10 +11841,10 @@ else
> >   /* When -fvisbility=3Dhidden is used, assume the code has been annota=
ted
> >      correspondingly for the symbols needed.  */
> >   #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3)) || (__GNUC__ > 3))
> > @@ -33169,7 +31978,7 @@ index c31ff71c805..1936741abe2 100755
> >   int main ()
> >   {
> >     void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -17596,13 +18246,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> > +@@ -13414,13 +14064,20 @@ exeext=3D'`$ECHO "$exeext" | $SED "$delay_si=
ngle_quote_subst"`'
> >   lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >   lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >   lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -33190,7 +31999,7 @@ index c31ff71c805..1936741abe2 100755
> >   STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >   RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >   old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED "$delay=
_single_quote_subst"`'
> > -@@ -17617,14 +18274,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -13435,14 +14092,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO "$lt_=
cv_sys_global_symbol_pipe" | $SED "$de
> >   lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO "$lt_cv_sys_global_symbol_=
to_cdecl" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO "$lt_cv_sys_globa=
l_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO "$lt_c=
v_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quo=
te_subst"`'
> > @@ -33209,7 +32018,7 @@ index c31ff71c805..1936741abe2 100755
> >   DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >   NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >   LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -17657,12 +18317,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> > +@@ -13475,12 +14135,12 @@ hardcode_shlibpath_var=3D'`$ECHO "$hardcode_=
shlibpath_var" | $SED "$delay_single_q
> >   hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED "$delay_sin=
gle_quote_subst"`'
> >   inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_=
subst"`'
> >   link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED "$delay_single_=
quote_subst"`'
> > @@ -33223,7 +32032,7 @@ index c31ff71c805..1936741abe2 100755
> >   file_list_spec=3D'`$ECHO "$file_list_spec" | $SED "$delay_single_quot=
e_subst"`'
> >   variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" | =
$SED "$delay_single_quote_subst"`'
> >   need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED "$delay_single_qu=
ote_subst"`'
> > -@@ -17717,8 +18377,13 @@ reload_flag \
> > +@@ -13535,8 +14195,13 @@ reload_flag \
> >   OBJDUMP \
> >   deplibs_check_method \
> >   file_magic_cmd \
> > @@ -33237,7 +32046,7 @@ index c31ff71c805..1936741abe2 100755
> >   STRIP \
> >   RANLIB \
> >   CC \
> > -@@ -17728,12 +18393,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -13546,12 +14211,14 @@ lt_cv_sys_global_symbol_pipe \
> >   lt_cv_sys_global_symbol_to_cdecl \
> >   lt_cv_sys_global_symbol_to_c_name_address \
> >   lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -33253,7 +32062,7 @@ index c31ff71c805..1936741abe2 100755
> >   DSYMUTIL \
> >   NMEDIT \
> >   LIPO \
> > -@@ -17749,7 +18416,6 @@ no_undefined_flag \
> > +@@ -13567,7 +14234,6 @@ no_undefined_flag \
> >   hardcode_libdir_flag_spec \
> >   hardcode_libdir_flag_spec_ld \
> >   hardcode_libdir_separator \
> > @@ -33261,7 +32070,7 @@ index c31ff71c805..1936741abe2 100755
> >   exclude_expsyms \
> >   include_expsyms \
> >   file_list_spec \
> > -@@ -17785,6 +18451,7 @@ module_cmds \
> > +@@ -13603,6 +14269,7 @@ module_cmds \
> >   module_expsym_cmds \
> >   export_symbols_cmds \
> >   prelink_cmds \
> > @@ -33269,7 +32078,7 @@ index c31ff71c805..1936741abe2 100755
> >   postinstall_cmds \
> >   postuninstall_cmds \
> >   finish_cmds \
> > -@@ -18610,7 +19277,8 @@ $as_echo "$as_me: executing $ac_file commands"=
 >&6;}
> > +@@ -14368,7 +15035,8 @@ $as_echo X"$file" |
> >   # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >   #
> >   #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 200=
5,
> > @@ -33279,7 +32088,7 @@ index c31ff71c805..1936741abe2 100755
> >   #   Written by Gordon Matzigkeit, 1996
> >   #
> >   #   This file is part of GNU Libtool.
> > -@@ -18713,19 +19381,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -14471,19 +15139,42 @@ SP2NL=3D$lt_lt_SP2NL
> >   # turn newlines into spaces.
> >   NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -33323,7 +32132,7 @@ index c31ff71c805..1936741abe2 100755
> >   # A symbol stripping program.
> >   STRIP=3D$lt_STRIP
> >
> > -@@ -18755,6 +19446,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> > +@@ -14513,6 +15204,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_s=
ys_global_symbol_to_c_name_address
> >   # Transform the output of nm in a C name address pair when lib prefix=
 is needed.
> >   global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_sym=
bol_to_c_name_address_lib_prefix
> >
> > @@ -33336,7 +32145,7 @@ index c31ff71c805..1936741abe2 100755
> >   # The name of the directory that contains temporary libtool files.
> >   objdir=3D$objdir
> >
> > -@@ -18764,6 +19461,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -14522,6 +15219,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >   # Must we lock files when doing compilation?
> >   need_locks=3D$lt_need_locks
> >
> > @@ -33346,7 +32155,7 @@ index c31ff71c805..1936741abe2 100755
> >   # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >   DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -18878,12 +19578,12 @@ with_gcc=3D$GCC
> > +@@ -14636,12 +15336,12 @@ with_gcc=3D$GCC
> >   # Compiler flag to turn off builtin functions.
> >   no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -33362,7 +32171,7 @@ index c31ff71c805..1936741abe2 100755
> >   # Compiler flag to prevent dynamic linking.
> >   link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -18970,9 +19670,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -14728,9 +15428,6 @@ inherit_rpath=3D$inherit_rpath
> >   # Whether libtool must link a program against all its dependency libr=
aries.
> >   link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -33372,7 +32181,7 @@ index c31ff71c805..1936741abe2 100755
> >   # Set to "yes" if exported symbols are required.
> >   always_export_symbols=3D$always_export_symbols
> >
> > -@@ -18988,6 +19685,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -14746,6 +15443,9 @@ include_expsyms=3D$lt_include_expsyms
> >   # Commands necessary for linking programs (against libraries) with te=
mplates.
> >   prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -33382,7 +32191,7 @@ index c31ff71c805..1936741abe2 100755
> >   # Specify filename containing input files.
> >   file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -19020,210 +19720,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -14778,210 +15478,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >     # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >     # text mode, it properly converts lines to CR/LF.  This bash proble=
m
> >     # is reportedly fixed, but why not run on old versions too?
> > diff --git a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-=
libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binu=
tils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> > index afd694db4d4..b736436b06f 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool=
-when-sysroot-is-enabled.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool=
-when-sysroot-is-enabled.patch
> > @@ -1,4 +1,4 @@
> > -From ff2754e302d06df51f8dd8ef877afb65eb30fcab Mon Sep 17 00:00:00 2001
> > +From 2f40ff7170c83757bae4aebee8daa8982d028d96 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 2 Mar 2015 01:42:38 +0000
> >  Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
> > diff --git a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-=
libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0010-sync-w=
ith-OE-libtool-changes.patch
> > index cc0fb551b23..f60848bf041 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool=
-changes.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool=
-changes.patch
> > @@ -1,4 +1,4 @@
> > -From 039b4afd7d3b5a599aebee97410809276a622ccd Mon Sep 17 00:00:00 2001
> > +From d71151fe69c43c0e87b5608f36b2779189b9646c Mon Sep 17 00:00:00 2001
> >  From: Ross Burton <ross.burton@intel.com>
> >  Date: Mon, 6 Mar 2017 23:33:27 -0800
> >  Subject: [PATCH] sync with OE libtool changes
> > diff --git a/meta/recipes-devtools/binutils/binutils/0011-Check-for-cla=
ng-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binut=
ils/0011-Check-for-clang-before-checking-gcc-version.patch
> > index b921dd12183..3a34ef6d7de 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-befo=
re-checking-gcc-version.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-befo=
re-checking-gcc-version.patch
> > @@ -1,4 +1,4 @@
> > -From 4eb24605fb2012c0f02883d1f560d5d852c0705e Mon Sep 17 00:00:00 2001
> > +From 6058ad8a1b6a0cf18c5d72fa74b5caa35730a93b Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Wed, 15 Apr 2020 14:17:20 -0700
> >  Subject: [PATCH] Check for clang before checking gcc version
> > diff --git a/meta/recipes-devtools/binutils/binutils/0012-Only-generate=
-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binut=
ils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patc=
h
> > index f69071ae96d..9fcd5a12b16 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPA=
TH-entry-if-LD_RUN_PATH-is-not-e.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPA=
TH-entry-if-LD_RUN_PATH-is-not-e.patch
> > @@ -1,4 +1,4 @@
> > -From 9613e47bfdea18d2764eec130676e3e0b40c676f Mon Sep 17 00:00:00 2001
> > +From d8723423330af35beecf6f81f8a26a448047f821 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Thu, 10 Mar 2022 21:21:33 -0800
> >  Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not em=
pty
> > @@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 5 insertions(+)
> >
> >  diff --git a/ld/ldelf.c b/ld/ldelf.c
> > -index 95787012b89..bc29909386f 100644
> > +index 1519f8ac4e5..2a7c76dc29c 100644
> >  --- a/ld/ldelf.c
> >  +++ b/ld/ldelf.c
> >  @@ -1127,6 +1127,9 @@ ldelf_handle_dt_needed (struct elf_link_hash_tab=
le *htab,
> > @@ -27,7 +27,7 @@ index 95787012b89..bc29909386f 100644
> >                 if (path
> >                     && ldelf_search_needed (path, &n, force,
> >                                             is_linux, elfsize))
> > -@@ -1801,6 +1804,8 @@ ldelf_before_allocation (char *audit, char *depa=
udit,
> > +@@ -1802,6 +1805,8 @@ ldelf_before_allocation (char *audit, char *depa=
udit,
> >     rpath =3D command_line.rpath;
> >     if (rpath =3D=3D NULL)
> >       rpath =3D (const char *) getenv ("LD_RUN_PATH");
> > diff --git a/meta/recipes-devtools/binutils/binutils/0013-Define-aligno=
f-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/binut=
ils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patc=
h
> > index 9cdc7e219d1..69628065d51 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using=
-_Alignof-when-using-C11-or-newe.patch
> > +++ b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using=
-_Alignof-when-using-C11-or-newe.patch
> > @@ -1,4 +1,4 @@
> > -From 8af01d85c4e5a5558d770291b7df86acfd59827c Mon Sep 17 00:00:00 2001
> > +From 1542eb8d11e1c7f2ed6096014bedb98963ab7af0 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sun, 15 Jan 2023 00:16:25 -0800
> >  Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
> > diff --git a/meta/recipes-devtools/binutils/binutils/0015-Remove-duplic=
ate-pe-dll.o-entry-deom-targ_extra_ofil.patch b/meta/recipes-devtools/binut=
ils/binutils/0015-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patc=
h
> > deleted file mode 100644
> > index f57f65ce725..00000000000
> > --- a/meta/recipes-devtools/binutils/binutils/0015-Remove-duplicate-pe-=
dll.o-entry-deom-targ_extra_ofil.patch
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -From 9599d7d48913fca4c2bf0d0012f9655353ca6f6c Mon Sep 17 00:00:00 2001
> > -From: Khem Raj <raj.khem@gmail.com>
> > -Date: Wed, 18 Jan 2023 19:35:07 -0800
> > -Subject: [PATCH] Remove duplicate pe-dll.o entry deom targ_extra_ofile=
s
> > -
> > -Commit c60b3806799abf1d7f6cf5108a1b0e733a950b13 added support for
> > -aarch64-pe which introduced wrapper over pep-dll.c for x86_64 as well =
as
> > -aarch64, on x86_64 it was added but the old object pe-dll.o needs to b=
e
> > -removed too, otherwise build fails with duplicate symbols from pe-dll.=
o
> > -and pep-dll-x86_64.o
> > -
> > -Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/=
2023-January/125739.html]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > -Cc: Jedidiah Thompson <wej22007@outlook.com>
> > -Cc: Zac Walker <zac.walker@linaro.org>
> > ----
> > - ld/configure.tgt | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/ld/configure.tgt b/ld/configure.tgt
> > -index de04a44b812..f80c84ab13c 100644
> > ---- a/ld/configure.tgt
> > -+++ b/ld/configure.tgt
> > -@@ -1056,7 +1056,7 @@ x86_64-*-cygwin)       targ_emul=3Di386pep ;
> > -                     ;;
> > - x86_64-*-mingw*)    targ_emul=3Di386pep ;
> > -                     targ_extra_emuls=3Di386pe
> > --                    targ_extra_ofiles=3D"deffilep.o pdb.o pep-dll.o p=
e-dll.o"
> > -+                    targ_extra_ofiles=3D"deffilep.o pdb.o pe-dll.o"
> > -                     ;;
> > - x86_64-*-gnu*)              targ_emul=3Delf_x86_64
> > -                     targ_extra_emuls=3D"elf32_x86_64 elf_iamcu elf_i3=
86"
> > diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-2558=
6.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25586.patch
> > deleted file mode 100644
> > index 43e36caf3f9..00000000000
> > --- a/meta/recipes-devtools/binutils/binutils/0016-CVE-2023-25586.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -From 5830876a0cca17bef3b2d54908928e72cca53502 Mon Sep 17 00:00:00 2001
> > -From: Alan Modra <amodra@gmail.com>
> > -Date: Tue, 6 Dec 2022 08:37:52 +1030
> > -Subject: [PATCH] PR29855, ch_type in bfd_init_section_decompress_statu=
s can be
> > - uninitialized
> > -
> > -     PR 29855
> > -     * compress.c (bfd_init_section_decompress_status): Set ch_type
> > -     to zero for zlib-gnu case.
> > -
> > -Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Db=
inutils-gdb.git;h=3D5830876a0cca17bef3b2d54908928e72cca53502]
> > -
> > -CVE: CVE-2023-25586
> > -
> > -Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> > ----
> > - bfd/compress.c | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/bfd/compress.c b/bfd/compress.c
> > -index 3d8c1d769f1..6b083468ca8 100644
> > ---- a/bfd/compress.c
> > -+++ b/bfd/compress.c
> > -@@ -1012,7 +1012,7 @@ bfd_init_section_decompress_status (bfd *abfd, s=
ec_ptr sec)
> > -       return false;
> > -     }
> > -       uncompressed_size =3D bfd_getb64 (header + 4);
> > --      ch_type =3D ch_none;
> > -+      ch_type =3D 0;
> > -     }
> > -   else if (!bfd_check_compression_header (abfd, header, sec,
> > -                                       &ch_type,
> > ---
> > -2.31.1
> > diff --git a/meta/recipes-devtools/binutils/binutils/fix-time64.patch b=
/meta/recipes-devtools/binutils/binutils/fix-time64.patch
> > deleted file mode 100644
> > index 0bfc977fd4e..00000000000
> > --- a/meta/recipes-devtools/binutils/binutils/fix-time64.patch
> > +++ /dev/null
> > @@ -1,94 +0,0 @@
> > -From f6f19a39ecfe962cb8a05522c27f513308687a74 Mon Sep 17 00:00:00 2001
> > -From: Vladimir Mezentsev <vladimir.mezentsev@oracle.com>
> > -Date: Thu, 16 Feb 2023 19:00:47 -0800
> > -Subject: [PATCH] gprofng: PR30036 Build failure on aarch64 w/ glibc: s=
ymbol
> > - `pwrite64' is already defined
> > -
> > -gprofng/ChangeLog
> > -2023-02-16  Vladimir Mezentsev  <vladimir.mezentsev@oracle.com>
> > -
> > -     PR gprofng/30036
> > -     * libcollector/iotrace.c: Define creat64 and pwrite64 only when
> > -     __USE_LARGEFILE64 and __USE_FILE_OFFSET64 are not defined.
> > -     * libcollector/mmaptrace.c: Likewise for mmap64.
> > -
> > -Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gd=
b.git;a=3Dcommitdiff;h=3Df6f19a39ecfe962cb8a05522c27f513308687a74]
> > -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ----
> > - gprofng/libcollector/iotrace.c   | 15 ++++++++-------
> > - gprofng/libcollector/mmaptrace.c |  2 +-
> > - 2 files changed, 9 insertions(+), 8 deletions(-)
> > -
> > -diff --git a/gprofng/libcollector/iotrace.c b/gprofng/libcollector/iot=
race.c
> > -index af90cc31f1a..d8439b02b3a 100644
> > ---- a/gprofng/libcollector/iotrace.c
> > -+++ b/gprofng/libcollector/iotrace.c
> > -@@ -1441,7 +1441,7 @@ creat (const char *path, mode_t mode)
> > - }
> > -
> > - /*------------------------------------------------------------- creat=
64 */
> > --#if WSIZE(32)
> > -+#if WSIZE(32) && !defined(__USE_LARGEFILE64)
> > - int
> > - creat64 (const char *path, mode_t mode)
> > - {
> > -@@ -2476,7 +2476,7 @@ __collector_pwrite_2_1 (int fildes, const void *=
buf, size_t nbyte, off_t offset)
> > -   return ret;
> > - }
> > -
> > --#else
> > -+#endif
> > - ssize_t
> > - pwrite (int fildes, const void *buf, size_t nbyte, off_t offset)
> > - {
> > -@@ -2497,11 +2497,10 @@ pwrite (int fildes, const void *buf, size_t nb=
yte, off_t offset)
> > -   POP_REENTRANCE (guard);
> > -   return ret;
> > - }
> > --#endif
> > -
> > - /*------------------------------------------------------------- pwrit=
e64 */
> > --#if WSIZE(32)
> > --#if !defined(__MUSL_LIBC) && ARCH(Intel)
> > -+#if WSIZE(32) && ARCH(Intel)
> > -+#if !defined(__MUSL_LIBC)
> > - // map interposed symbol versions
> > -
> > - SYMVER_ATTRIBUTE (__collector_pwrite64_2_2, pwrite64@GLIBC_2.2)
> > -@@ -2547,8 +2546,9 @@ __collector_pwrite64_2_1 (int fildes, const void=
 *buf, size_t nbyte, off64_t off
> > -   POP_REENTRANCE (guard);
> > -   return ret;
> > - }
> > -+#endif
> > -
> > --#else
> > -+#if !defined(__USE_FILE_OFFSET64)
> > - ssize_t
> > - pwrite64 (int fildes, const void *buf, size_t nbyte, off64_t offset)
> > - {
> > -@@ -2570,7 +2570,8 @@ pwrite64 (int fildes, const void *buf, size_t nb=
yte, off64_t offset)
> > -   return ret;
> > - }
> > - #endif
> > --#endif /* SIZE(32) */
> > -+
> > -+#endif /* SIZE(32)  && ARCH(Intel) */
> > -
> > - /*------------------------------------------------------------- fgets=
 */
> > - char*
> > -diff --git a/gprofng/libcollector/mmaptrace.c b/gprofng/libcollector/m=
maptrace.c
> > -index 61613c21560..221b4e2d176 100644
> > ---- a/gprofng/libcollector/mmaptrace.c
> > -+++ b/gprofng/libcollector/mmaptrace.c
> > -@@ -1494,7 +1494,7 @@ mmap (void *start, size_t length, int prot, int =
flags, int fd, off_t offset)
> > - }
> > -
> > - /*------------------------------------------------------------- mmap6=
4 */
> > --#if WSIZE(32)       /* mmap64 only defined for non-64-bit */
> > -+#if WSIZE(32) && !defined(__USE_FILE_OFFSET64)
> > -
> > - void *
> > - mmap64 (void *start, size_t length, int prot, int flags, int fd, off6=
4_t offset)
> > ---
> > -2.31.1
> > -
> > diff --git a/meta/recipes-devtools/binutils/binutils_2.40.bb b/meta/rec=
ipes-devtools/binutils/binutils_2.41.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/binutils_2.40.bb
> > rename to meta/recipes-devtools/binutils/binutils_2.41.bb
> > --
> > 2.41.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185077): https://lists.openembedded.org/g/openembed=
ded-core/message/185077
> > Mute This Topic: https://lists.openembedded.org/mt/100447567/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

