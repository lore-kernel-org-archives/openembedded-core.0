Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3A8C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 03:05:30 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.99480.1723259127857308954
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 20:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iatUedrk;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3db35ec5688so1624415b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 20:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723259127; x=1723863927; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QPnTWiFjDbBUVtXuGp6RrWb+oWPNsO7YhqiMftaD2fM=;
        b=iatUedrkc93vUzFJxa/D6r9IFyTWf9p4fYlGXSVxQrQXpv1GfrWhCdFWbvTAdjYoh2
         8Fb3JCRsMJlRPx3EDAAMYWrYC8cX7SqBT/Q3Z7lHaAD4xXqTh35OabCtqzRZBguuZHu1
         F0RQpyI4rTclS5UwwNcPGrrqFd+8q1oXwdL0TFe6Bhp0SOEozeey+uaDZeNCIqkOYze0
         rfcEyvQnKp1JxqdbKtqV0DlHhAk2fuoRumlwBcH77u2DTY+a7d5GPhw9ful944xmbNKv
         NJP8NYpSsPO57xdzpEhu1mbr2hSmXYii/R27M1jKaHJdehBR8v56vlNxwICbqXRZxpFq
         PXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723259127; x=1723863927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPnTWiFjDbBUVtXuGp6RrWb+oWPNsO7YhqiMftaD2fM=;
        b=IhsK/n1+FjamFcJCFlAlkAstkc4tKXAILtnYXjGmAAkr/fUBrfxI1zri+1J5IzqrZr
         psnRPtgqIDsnyCcSfmVw/j5TbVN1tc/Ya44OeyoZkbzhO9WeSMM4kryzHDl+MsBOhqpZ
         j3aFwUyMpHn/8h96K2pB/w9qPkj+A/tl9kzEHTnYtf2BwBaiXLKvHr1yt+xywxSVNEQc
         tRd3sujIBJvFNn3OwFT81xyYXQ2qnS35DQIztkxkQ0GeenHGijlSyMEpPWx139AJ6T19
         syOt9z4vx4pezkQtcrvmKGxdfRMQcFRiIA6CyocuTTP79ujgfUZGgX4fAH+GSgLAwVaX
         KTDw==
X-Gm-Message-State: AOJu0YxYoRqqN7v02PblZrhHK5WjjGDDnd2+fn8lU/y2qNZJjhLcyJVx
	LYLyspSdWB+5RmM/2Yojq5u9233v063WDujjYYVm8OHUBPK8WMssF4wogACbw9O5neN0pNoD/kM
	ljUbvsg8du0RuugBsjM4GFX6FzlR4404B
X-Google-Smtp-Source: AGHT+IE2XDjy3D8DOn7ouShkf72VQkrSomF/pUvitFsMX1+0RsdtiU0c4Goox1aDLIV2DlAJmfCyN6hNzJtSWrmPStI=
X-Received: by 2002:a05:6808:150c:b0:3d9:3b17:f752 with SMTP id
 5614622812f47-3dc416a74cbmr4240830b6e.26.1723259126523; Fri, 09 Aug 2024
 20:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240805044317.4104470-1-raj.khem@gmail.com> <ffcd0df5-663c-41a7-a23c-c2c083aa0974@gmail.com>
In-Reply-To: <ffcd0df5-663c-41a7-a23c-c2c083aa0974@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Aug 2024 20:05:14 -0700
Message-ID: <CAMKF1srqQNJH+BjNncMZ1m3N95TRninH=bU-6e=pPWSDD4V=2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.43 release
To: ypa.takayasu.ito@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000017b02f061f4b8865"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Aug 2024 03:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203180

--00000000000017b02f061f4b8865
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right your are !! I think it was a pasting error

On Fri, Aug 9, 2024 at 7:50=E2=80=AFPM Takayasu Ito via lists.openembedded.=
org
<ypa.takayasu.ito=3Dgmail.com@lists.openembedded.org> wrote:

> Hi Kem,
>
>  > [1] https://sourceware.org/pipermail/binutils/2024-January/132213.html
>
> The above changelog is for 2.42.
> The one for 2.43 is as follows.
> https://sourceware.org/pipermail/binutils/2024-August/136151.html
>
>
> On 2024/08/05 13:43, Khem Raj via lists.openembedded.org wrote:
> > Detailed changelog [1]
> >
> > [1] https://sourceware.org/pipermail/binutils/2024-January/132213.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >   meta/conf/distro/include/tcmode-default.inc   |    2 +-
> >   .../{binutils-2.42.inc =3D> binutils-2.43.inc}  |    9 +-
> >   ....42.bb =3D> binutils-cross-canadian_2.43.bb} |    0
> >   ...s-cross_2.42.bb =3D> binutils-cross_2.43.bb} |    0
> >   ...ssdk_2.42.bb =3D> binutils-crosssdk_2.43.bb} |    0
> >   ...ite_2.42.bb =3D> binutils-testsuite_2.43.bb} |    0
> >   ...s-crosssdk-Generate-relocatable-SDKs.patch |   12 +-
> >   ...o-not-generate-linker-script-directo.patch |    6 +-
> >   ...dk-Search-for-alternative-ld.so.conf.patch |   10 +-
> >   ...004-Point-scripts-location-to-libdir.patch |    6 +-
> >   ...stro-compiler-point-to-the-wrong-ins.patch |    4 +-
> >   ...-system-directories-when-cross-linki.patch |   57 +-
> >   ...ect-assembling-for-ppc-wait-mnemonic.patch |    2 +-
> >   .../binutils/0008-Use-libtool-2.4.patch       | 1774 +++++++++-------=
-
> >   ...h-in-libtool-when-sysroot-is-enabled.patch |    2 +-
> >   .../0010-sync-with-OE-libtool-changes.patch   |    2 +-
> >   ...or-clang-before-checking-gcc-version.patch |    8 +-
> >   ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |    4 +-
> >   ...sing-_Alignof-when-using-C11-or-newe.patch |    2 +-
> >   ...-pe-dll.o-entry-deom-targ_extra_ofil.patch |    2 +-
> >   ...rofng-change-use-of-bignum-to-bigint.patch |   17 -
> >   .../{binutils_2.42.bb =3D> binutils_2.43.bb}    |    0
> >   22 files changed, 961 insertions(+), 958 deletions(-)
> >   rename meta/recipes-devtools/binutils/{binutils-2.42.inc =3D>
> binutils-2.43.inc} (90%)
> >   rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.42.b=
b
> =3D> binutils-cross-canadian_2.43.bb} (100%)
> >   rename meta/recipes-devtools/binutils/{binutils-cross_2.42.bb =3D>
> binutils-cross_2.43.bb} (100%)
> >   rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.42.bb =3D>
> binutils-crosssdk_2.43.bb} (100%)
> >   rename meta/recipes-devtools/binutils/{binutils-testsuite_2.42.bb =3D=
>
> binutils-testsuite_2.43.bb} (100%)
> >   delete mode 100644
> meta/recipes-devtools/binutils/binutils/0015-gprofng-change-use-of-bignum=
-to-bigint.patch
> >   rename meta/recipes-devtools/binutils/{binutils_2.42.bb =3D>
> binutils_2.43.bb} (100%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> > index c6bc80c5421..a286d25a53a 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
> >
> >   GCCVERSION ?=3D "14.%"
> >   SDKGCCVERSION ?=3D "${GCCVERSION}"
> > -BINUVERSION ?=3D "2.42%"
> > +BINUVERSION ?=3D "2.43%"
> >   GDBVERSION ?=3D "15.%"
> >   GLIBCVERSION ?=3D "2.40%"
> >   LINUXLIBCVERSION ?=3D "6.10%"
> > diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc
> b/meta/recipes-devtools/binutils/binutils-2.43.inc
> > similarity index 90%
> > rename from meta/recipes-devtools/binutils/binutils-2.42.inc
> > rename to meta/recipes-devtools/binutils/binutils-2.43.inc
> > index bcc333506fe..c1689a82dc2 100644
> > --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> > +++ b/meta/recipes-devtools/binutils/binutils-2.43.inc
> > @@ -12,15 +12,15 @@ LIC_FILES_CHKSUM=3D"\
> >
> >   # When upgrading to 2.42, please make sure there is no trailing .0, s=
o
> >   # that upstream version check can work correctly.
> > -PV =3D "2.42"
> > -CVE_VERSION =3D "2.42"
> > -SRCBRANCH ?=3D "binutils-2_42-branch"
> > +PV =3D "2.43"
> > +CVE_VERSION =3D "2.43"
> > +SRCBRANCH ?=3D "binutils-2_43-branch"
> >
> >   UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d_?)*)"
> >
> >   CVE_STATUS[CVE-2023-25584] =3D "cpe-incorrect: Applies only for versi=
on
> 2.40 and earlier"
> >
> > -SRCREV ?=3D "e343b51459ca120ead1d1a0eda14dd7bd8849f4f"
> > +SRCREV ?=3D "2fbb863136724cfef2fc2f4c2b7f51be36f132c7"
> >   BINUTILS_GIT_URI ?=3D "git://
> sourceware.org/git/binutils-gdb.git;branch=3D${SRCBRANCH};protocol=3Dhttp=
s
> <http://sourceware.org/git/binutils-gdb.git;branch=3D$%7BSRCBRANCH%7D;pro=
tocol=3Dhttps>
> "
> >   SRC_URI =3D "\
> >        ${BINUTILS_GIT_URI} \
> > @@ -35,6 +35,5 @@ SRC_URI =3D "\
> >
> file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
> >
> file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
> >
> file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
> > -     file://0015-gprofng-change-use-of-bignum-to-bigint.patch \
> >   "
> >   S  =3D "${WORKDIR}/git"
> > diff --git a/meta/recipes-devtools/binutils/
> binutils-cross-canadian_2.42.bb b/meta/recipes-devtools/binutils/
> binutils-cross-canadian_2.43.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/
> binutils-cross-canadian_2.42.bb
> > rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.43.b=
b
> > diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.42.bb
> b/meta/recipes-devtools/binutils/binutils-cross_2.43.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/binutils-cross_2.42.bb
> > rename to meta/recipes-devtools/binutils/binutils-cross_2.43.bb
> > diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.42.bb
> b/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.42.bb
> > rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.43.bb
> > diff --git a/meta/recipes-devtools/binutils/binutils-testsuite_2.42.bb
> b/meta/recipes-devtools/binutils/binutils-testsuite_2.43.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/binutils/binutils-testsuite_2.42.bb
> > rename to meta/recipes-devtools/binutils/binutils-testsuite_2.43.bb
> > diff --git
> a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate=
-relocatable-SDKs.patch
> b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate=
-relocatable-SDKs.patch
> > index 4ef11c56e7c..3dd559e3961 100644
> > ---
> a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate=
-relocatable-SDKs.patch
> > +++
> b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate=
-relocatable-SDKs.patch
> > @@ -1,4 +1,4 @@
> > -From 089ee95b342e79af09258b45c888a13b35fadf26 Mon Sep 17 00:00:00 2001
> > +From 56d41f0cc6a806d2e8d7dcbfb4cca4cd37fba835 Mon Sep 17 00:00:00 2001
> >   From: Khem Raj <raj.khem@gmail.com>
> >   Date: Mon, 2 Mar 2015 01:58:54 +0000
> >   Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
> > @@ -34,10 +34,10 @@ index b43ae841a6c..6101a95195b 100644
> >      Output_section_data* odata =3D new Output_data_const(interp, len, =
1);
> >
> >   diff --git a/ld/genscripts.sh b/ld/genscripts.sh
> > -index d6ceb3fe4f5..365c0e778cc 100755
> > +index a726b158161..5d2eb737efc 100755
> >   --- a/ld/genscripts.sh
> >   +++ b/ld/genscripts.sh
> > -@@ -298,6 +298,7 @@
> DATA_ALIGNMENT_u=3D"${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
> > +@@ -315,6 +315,7 @@
> DATA_ALIGNMENT_u=3D"${DATA_ALIGNMENT_u-${DATA_ALIGNMENT_r}}"
> >    LD_FLAG=3Dr
> >    DATA_ALIGNMENT=3D${DATA_ALIGNMENT_r}
> >    DEFAULT_DATA_ALIGNMENT=3D"ALIGN(${SEGMENT_SIZE})"
> > @@ -45,7 +45,7 @@ index d6ceb3fe4f5..365c0e778cc 100755
> >    ( echo "/* Script for -r */"
> >      source_sh ${CUSTOMIZER_SCRIPT}
> >      source_sh ${srcdir}/scripttempl/${SCRIPT_NAME}.sc
> > -@@ -306,10 +307,12 @@ DEFAULT_DATA_ALIGNMENT=3D"ALIGN(${SEGMENT_SIZE})=
"
> > +@@ -323,10 +324,12 @@ DEFAULT_DATA_ALIGNMENT=3D"ALIGN(${SEGMENT_SIZE})=
"
> >    LD_FLAG=3Du
> >    DATA_ALIGNMENT=3D${DATA_ALIGNMENT_u}
> >    CONSTRUCTING=3D" "
> > @@ -59,10 +59,10 @@ index d6ceb3fe4f5..365c0e778cc 100755
> >    DATA_ALIGNMENT=3D${DATA_ALIGNMENT_}
> >    RELOCATING=3D" "
> >   diff --git a/ld/scripttempl/elf.sc b/ld/scripttempl/elf.sc
> > -index fae7c2ad71c..7fe37eb1874 100644
> > +index 54716110b61..da17fe5cbce 100644
> >   --- a/ld/scripttempl/elf.sc
> >   +++ b/ld/scripttempl/elf.sc
> > -@@ -150,8 +150,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
> > +@@ -152,8 +152,8 @@ if test -z "$DATA_SEGMENT_ALIGN"; then
> >        DATA_SEGMENT_RELRO_END=3D". =3D DATA_SEGMENT_RELRO_END
> (${SEPARATE_GOTPLT-0}, .);"
> >      fi
> >    fi
> > diff --git
> a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-gene=
rate-linker-script-directo.patch
> b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-gene=
rate-linker-script-directo.patch
> > index 1652473bcb2..3ad1da38e6b 100644
> > ---
> a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-gene=
rate-linker-script-directo.patch
> > +++
> b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-gene=
rate-linker-script-directo.patch
> > @@ -1,4 +1,4 @@
> > -From 6fae7afeb713a60755e17443964e46190bb97ede Mon Sep 17 00:00:00 2001
> > +From 4f2a54c468c448efdd44813273893ec9c541deaf Mon Sep 17 00:00:00 2001
> >   From: Khem Raj <raj.khem@gmail.com>
> >   Date: Mon, 6 Mar 2017 23:37:05 -0800
> >   Subject: [PATCH] binutils-cross: Do not generate linker script
> directories
> > @@ -22,10 +22,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    1 file changed, 25 deletions(-)
> >
> >   diff --git a/ld/genscripts.sh b/ld/genscripts.sh
> > -index 365c0e778cc..b0893fda3c5 100755
> > +index 5d2eb737efc..ad225b0071d 100755
> >   --- a/ld/genscripts.sh
> >   +++ b/ld/genscripts.sh
> > -@@ -229,31 +229,6 @@ append_to_lib_path()
> > +@@ -244,31 +244,6 @@ append_to_lib_path()
> >      fi
> >    }
> >
> > diff --git
> a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-=
for-alternative-ld.so.conf.patch
> b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-=
for-alternative-ld.so.conf.patch
> > index f45690ed68d..ec8e40c132e 100644
> > ---
> a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-=
for-alternative-ld.so.conf.patch
> > +++
> b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-=
for-alternative-ld.so.conf.patch
> > @@ -1,4 +1,4 @@
> > -From 1fe9aa3f25e09281cb018b29081db4cc44bdc01f Mon Sep 17 00:00:00 2001
> > +From bbb86582536ba9e4ab0fb4656d4697542172ab78 Mon Sep 17 00:00:00 2001
> >   From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >   Date: Wed, 19 Feb 2020 09:51:16 -0800
> >   Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.con=
f
> in SDK
> > @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    5 files changed, 7 insertions(+), 3 deletions(-)
> >
> >   diff --git a/ld/Makefile.am b/ld/Makefile.am
> > -index f9ee05b1400..07801c2c3ac 100644
> > +index 6a9833e5775..b2776d2a1f3 100644
> >   --- a/ld/Makefile.am
> >   +++ b/ld/Makefile.am
> >   @@ -42,7 +42,8 @@ ZLIBINC =3D @zlibinc@
> > @@ -43,7 +43,7 @@ index f9ee05b1400..07801c2c3ac 100644
> >    NO_WERROR =3D @NO_WERROR@
> >    AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS)
> $(ZSTD_CFLAGS)
> >   diff --git a/ld/Makefile.in b/ld/Makefile.in
> > -index abb0565718f..6329a12a0d6 100644
> > +index 8639e782cdf..19c19088724 100644
> >   --- a/ld/Makefile.in
> >   +++ b/ld/Makefile.in
> >   @@ -576,7 +576,8 @@ ZLIB =3D @zlibdir@ -lz
> > @@ -57,7 +57,7 @@ index abb0565718f..6329a12a0d6 100644
> >    AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS)
> $(ZSTD_CFLAGS)
> >
> >   diff --git a/ld/ldelf.c b/ld/ldelf.c
> > -index 2852851dcd5..187b359af86 100644
> > +index 09691609fc0..e49c0217ae2 100644
> >   --- a/ld/ldelf.c
> >   +++ b/ld/ldelf.c
> >   @@ -939,7 +939,7 @@ ldelf_check_ld_so_conf (const struct
> bfd_link_needed_list *l, int force,
> > @@ -70,7 +70,7 @@ index 2852851dcd5..187b359af86 100644
> >          if (!ldelf_parse_ld_so_conf (&info, tmppath))
> >       {
> >   diff --git a/ld/ldmain.c b/ld/ldmain.c
> > -index e90c2021b33..01b306e58a1 100644
> > +index 037099b9d37..2f500d73c58 100644
> >   --- a/ld/ldmain.c
> >   +++ b/ld/ldmain.c
> >   @@ -69,6 +69,7 @@ char *program_name;
> > diff --git
> a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-=
libdir.patch
> b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-=
libdir.patch
> > index ab12c145ea9..572c2e840ba 100644
> > ---
> a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-=
libdir.patch
> > +++
> b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-=
libdir.patch
> > @@ -1,4 +1,4 @@
> > -From 780109902b00652dfdc080607c614f210e96ae9b Mon Sep 17 00:00:00 2001
> > +From aa371816a7ad55af4b29ffc32b213a812f4c6216 Mon Sep 17 00:00:00 2001
> >   From: Khem Raj <raj.khem@gmail.com>
> >   Date: Mon, 2 Mar 2015 01:09:58 +0000
> >   Subject: [PATCH] Point scripts location to libdir
> > @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    2 files changed, 2 insertions(+), 2 deletions(-)
> >
> >   diff --git a/ld/Makefile.am b/ld/Makefile.am
> > -index 07801c2c3ac..a2bcffecf73 100644
> > +index b2776d2a1f3..76ebecb5685 100644
> >   --- a/ld/Makefile.am
> >   +++ b/ld/Makefile.am
> >   @@ -51,7 +51,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CFLAGS)
> $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
> > @@ -25,7 +25,7 @@ index 07801c2c3ac..a2bcffecf73 100644
> >    EMUL =3D @EMUL@
> >    EMULATION_OFILES =3D @EMULATION_OFILES@
> >   diff --git a/ld/Makefile.in b/ld/Makefile.in
> > -index 6329a12a0d6..15311048855 100644
> > +index 19c19088724..4be38a75feb 100644
> >   --- a/ld/Makefile.in
> >   +++ b/ld/Makefile.in
> >   @@ -584,7 +584,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CFLAGS)
> $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
> > diff --git
> a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compi=
ler-point-to-the-wrong-ins.patch
> b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compi=
ler-point-to-the-wrong-ins.patch
> > index f7c3987542f..2b1d57a05ed 100644
> > ---
> a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compi=
ler-point-to-the-wrong-ins.patch
> > +++
> b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compi=
ler-point-to-the-wrong-ins.patch
> > @@ -1,4 +1,4 @@
> > -From c8cca8d2364c9f233d6e771136a4d4ff7f405c21 Mon Sep 17 00:00:00 2001
> > +From cf20233a1d53effa223a8b72ae9c0652a472a87a Mon Sep 17 00:00:00 2001
> >   From: Khem Raj <raj.khem@gmail.com>
> >   Date: Mon, 2 Mar 2015 01:39:01 +0000
> >   Subject: [PATCH] don't let the distro compiler point to the wrong
> installation
> > @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >   diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
> > -index 85c4b6b6ef8..cb6e91c8f9b 100644
> > +index b77a41c781c..9fb4d6f09c9 100644
> >   --- a/libiberty/Makefile.in
> >   +++ b/libiberty/Makefile.in
> >   @@ -385,7 +385,8 @@ install-strip: install
> > diff --git
> a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-di=
rectories-when-cross-linki.patch
> b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-di=
rectories-when-cross-linki.patch
> > index bf6a1a39611..b267e516b37 100644
> > ---
> a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-di=
rectories-when-cross-linki.patch
> > +++
> b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-di=
rectories-when-cross-linki.patch
> > @@ -1,4 +1,4 @@
> > -From a92c46e3703d038d7d810bdc91e8540ad9d9150a Mon Sep 17 00:00:00 2001
> > +From 26f6a7a397e62b5e974cf88f6d4d8ba9a3d51e3c Mon Sep 17 00:00:00 2001
> >   From: Khem Raj <raj.khem@gmail.com>
> >   Date: Fri, 15 Jan 2016 06:31:09 +0000
> >   Subject: [PATCH] warn for uses of system directories when cross linki=
ng
> > @@ -56,17 +56,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    ld/configure.ac | 10 ++++++++++
> >    ld/ld.h         |  8 ++++++++
> >    ld/ld.texi      | 12 ++++++++++++
> > - ld/ldfile.c     | 17 +++++++++++++++++
> > + ld/ldfile.c     | 16 ++++++++++++++++
> >    ld/ldlex.h      |  2 ++
> >    ld/ldmain.c     |  6 ++++--
> >    ld/lexsup.c     | 15 +++++++++++++++
> > - 9 files changed, 87 insertions(+), 2 deletions(-)
> > + 9 files changed, 86 insertions(+), 2 deletions(-)
> >
> >   diff --git a/ld/config.in b/ld/config.in
> > -index 52d62f06ff0..b5944e7ba55 100644
> > +index f7c9da3d02a..e4fdbf6db5b 100644
> >   --- a/ld/config.in
> >   +++ b/ld/config.in
> > -@@ -70,6 +70,9 @@
> > +@@ -74,6 +74,9 @@
> >       language is requested. */
> >    #undef ENABLE_NLS
> >
> > @@ -77,7 +77,7 @@ index 52d62f06ff0..b5944e7ba55 100644
> >    #undef EXTRA_SHLIB_EXTENSION
> >
> >   diff --git a/ld/configure b/ld/configure
> > -index 6f8a05c3b6c..98a76d6da7f 100755
> > +index 1d89e3b0677..dd770216b61 100755
> >   --- a/ld/configure
> >   +++ b/ld/configure
> >   @@ -844,6 +844,7 @@ with_lib_path
> > @@ -88,7 +88,7 @@ index 6f8a05c3b6c..98a76d6da7f 100755
> >    enable_gold
> >    enable_got
> >    enable_compressed_debug_sections
> > -@@ -1534,6 +1535,8 @@ Optional Features:
> > +@@ -1535,6 +1536,8 @@ Optional Features:
> >      --enable-checking       enable run-time checks
> >      --enable-targets        alternative target configurations
> >      --enable-64-bit-bfd     64-bit support (on hosts with narrower wor=
d
> sizes)
> > @@ -118,10 +118,10 @@ index 6f8a05c3b6c..98a76d6da7f 100755
> >    if test "${enable_gold+set}" =3D set; then :
> >      enableval=3D$enable_gold; case "${enableval}" in
> >   diff --git a/ld/configure.ac b/ld/configure.ac
> > -index 4a11787ae71..104a531fb0f 100644
> > +index bdf51a062fa..3d370ff92ce 100644
> >   --- a/ld/configure.ac
> >   +++ b/ld/configure.ac
> > -@@ -103,6 +103,16 @@ AC_SUBST(use_sysroot)
> > +@@ -102,6 +102,16 @@ AC_SUBST(use_sysroot)
> >    AC_SUBST(TARGET_SYSTEM_ROOT)
> >    AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
> >
> > @@ -139,7 +139,7 @@ index 4a11787ae71..104a531fb0f 100644
> >    dnl "install_as_default" is set to false if gold is the default
> linker.
> >    dnl "installed_linker" is the installed BFD linker name.
> >   diff --git a/ld/ld.h b/ld/ld.h
> > -index 54d9079678c..9f0163b2911 100644
> > +index 0dee944cf2a..83bd82d2a2e 100644
> >   --- a/ld/ld.h
> >   +++ b/ld/ld.h
> >   @@ -166,6 +166,14 @@ typedef struct
> > @@ -158,10 +158,10 @@ index 54d9079678c..9f0163b2911 100644
> >      enum endian_enum endian;
> >
> >   diff --git a/ld/ld.texi b/ld/ld.texi
> > -index 4fda259a552..22685f5f1dd 100644
> > +index 89e3913317a..178908edf32 100644
> >   --- a/ld/ld.texi
> >   +++ b/ld/ld.texi
> > -@@ -3119,6 +3119,18 @@ creation of the metadata note, if one had been
> enabled by an earlier
> > +@@ -3245,6 +3245,18 @@ creation of the metadata note, if one had been
> enabled by an earlier
> >    occurrence of the --package-metadata option.
> >    If the linker has been built with libjansson, then the JSON string
> >    will be validated.
> > @@ -181,14 +181,13 @@ index 4fda259a552..22685f5f1dd 100644
> >
> >    @c man end
> >   diff --git a/ld/ldfile.c b/ld/ldfile.c
> > -index dc9875d8813..49d899ee49d 100644
> > +index 87be885d31a..86c8a5b267d 100644
> >   --- a/ld/ldfile.c
> >   +++ b/ld/ldfile.c
> > -@@ -327,6 +327,23 @@ ldfile_add_library_path (const char *name, bool
> cmdline)
> > -     new_dirs->name =3D concat (ld_sysroot, name + strlen ("$SYSROOT")=
,
> (const char *) NULL);
> > -   else
> > -     new_dirs->name =3D xstrdup (name);
> > -+
> > +@@ -344,6 +344,22 @@ ldfile_add_library_path (const char *name, enum
> search_dir_source source)
> > +       search_tail_ptr =3D &new_dirs->next;
> > +     }
> > +
> >   +#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
> >   +  if (command_line.poison_system_directories
> >   +  && ((!strncmp (name, "/lib", 4))
> > @@ -205,16 +204,16 @@ index dc9875d8813..49d899ee49d 100644
> >   +   }
> >   +#endif
> >   +
> > +   return new_dirs;
> >    }
> >
> > - /* Try to open a BFD for a lang_input_statement.  */
> >   diff --git a/ld/ldlex.h b/ld/ldlex.h
> > -index 161a9d4d8dc..757fe2f7650 100644
> > +index defe3fcbbb9..aea75a25dc8 100644
> >   --- a/ld/ldlex.h
> >   +++ b/ld/ldlex.h
> > -@@ -147,6 +147,8 @@ enum option_values
> > -   OPTION_PLUGIN,
> > +@@ -149,6 +149,8 @@ enum option_values
> >      OPTION_PLUGIN_OPT,
> > +   OPTION_PLUGIN_SAVE_TEMPS,
> >    #endif /* BFD_SUPPORTS_PLUGINS */
> >   +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
> >   +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,
> > @@ -222,10 +221,10 @@ index 161a9d4d8dc..757fe2f7650 100644
> >      OPTION_PRINT_OUTPUT_FORMAT,
> >      OPTION_PRINT_SYSROOT,
> >   diff --git a/ld/ldmain.c b/ld/ldmain.c
> > -index 01b306e58a1..eddefc24332 100644
> > +index 2f500d73c58..8b1bf7ad6aa 100644
> >   --- a/ld/ldmain.c
> >   +++ b/ld/ldmain.c
> > -@@ -326,6 +326,8 @@ main (int argc, char **argv)
> > +@@ -348,6 +348,8 @@ main (int argc, char **argv)
> >      command_line.warn_mismatch =3D true;
> >      command_line.warn_search_mismatch =3D true;
> >      command_line.check_section_addresses =3D -1;
> > @@ -234,7 +233,7 @@ index 01b306e58a1..eddefc24332 100644
> >
> >      /* We initialize DEMANGLING based on the environment variable
> >         COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle th=
e
> > -@@ -1458,7 +1460,7 @@ undefined_symbol (struct bfd_link_info *info,
> > +@@ -1489,7 +1491,7 @@ undefined_symbol (struct bfd_link_info *info,
> >          argv[1] =3D "undefined-symbol";
> >          argv[2] =3D (char *) name;
> >          argv[3] =3D NULL;
> > @@ -243,7 +242,7 @@ index 01b306e58a1..eddefc24332 100644
> >          if (verbose)
> >       einfo (_("%P: About to run error handling script '%s' with
> arguments: '%s' '%s'\n"),
> >              argv[0], argv[1], argv[2]);
> > -@@ -1479,7 +1481,7 @@ undefined_symbol (struct bfd_link_info *info,
> > +@@ -1510,7 +1512,7 @@ undefined_symbol (struct bfd_link_info *info,
> >        carry on to issue the normal error message.  */
> >        }
> >    #endif /* SUPPORT_ERROR_HANDLING_SCRIPT */
> > @@ -253,10 +252,10 @@ index 01b306e58a1..eddefc24332 100644
> >        {
> >          if (error_count < MAX_ERRORS_IN_A_ROW)
> >   diff --git a/ld/lexsup.c b/ld/lexsup.c
> > -index 099dff8ecde..e9939000b2e 100644
> > +index 4aa0124ce2f..65c90d48332 100644
> >   --- a/ld/lexsup.c
> >   +++ b/ld/lexsup.c
> > -@@ -642,6 +642,14 @@ static const struct ld_option ld_options[] =3D
> > +@@ -648,6 +648,14 @@ static const struct ld_option ld_options[] =3D
> >                  "                                <method> is:
> share-unconflicted (default),\n"
> >                  "
>  share-duplicated"),
> >        TWO_DASHES },
> > @@ -271,7 +270,7 @@ index 099dff8ecde..e9939000b2e 100644
> >    };
> >
> >    #define OPTION_COUNT ARRAY_SIZE (ld_options)
> > -@@ -1818,6 +1826,13 @@ parse_args (unsigned argc, char **argv)
> > +@@ -1834,6 +1842,13 @@ parse_args (unsigned argc, char **argv)
> >
> >       case OPTION_PRINT_MAP_LOCALS:
> >         config.print_map_locals =3D true;
> > diff --git
> a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembli=
ng-for-ppc-wait-mnemonic.patch
> b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembli=
ng-for-ppc-wait-mnemonic.patch
> > index f9fa0d4f78d..7144b7d18de 100644
> > ---
> a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembli=
ng-for-ppc-wait-mnemonic.patch
> > +++
> b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembli=
ng-for-ppc-wait-mnemonic.patch
> > @@ -1,4 +1,4 @@
> > -From d35fd95eee9930ab41d9ad637eacb35aa9fe6f44 Mon Sep 17 00:00:00 2001
> > +From bfc643d4044dccc917549f2db439cff165512b02 Mon Sep 17 00:00:00 2001
> >   From: Zhenhua Luo <zhenhua.luo@nxp.com>
> >   Date: Sat, 11 Jun 2016 22:08:29 -0500
> >   Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
> > diff --git
> a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
> b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
> > index 05f1ed0dc55..19dc7ab7bda 100644
> > --- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patc=
h
> > +++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patc=
h
> > @@ -1,4 +1,4 @@
> > -From da089ddacb6506f406acd8939389183a4356ebf0 Mon Sep 17 00:00:00 2001
> > +From a5272ced746039b50606ebeb311c38adad49a817 Mon Sep 17 00:00:00 2001
> >   From: Khem Raj <raj.khem@gmail.com>
> >   Date: Sun, 14 Feb 2016 17:04:07 +0000
> >   Subject: [PATCH] Use libtool 2.4
> > @@ -27,11 +27,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    gprofng/src/Makefile.in             |    2 +
> >    ld/Makefile.in                      |    3 +
> >    ld/configure                        | 1694 ++++++++++++----
> > - libbacktrace/Makefile.in            |  108 +-
> > + libbacktrace/Makefile.in            |  112 +-
> >    libbacktrace/aclocal.m4             |   73 +-
> >    libbacktrace/configure              | 1441 +++++++++----
> >    libctf/Makefile.in                  |    2 +
> > - libctf/configure                    | 1334 +++++++++---
> > + libctf/configure                    | 1330 +++++++++---
> >    libsframe/Makefile.in               |  344 ++--
> >    libsframe/aclocal.m4                |  220 +-
> >    libsframe/configure                 | 1553 ++++++++++----
> > @@ -44,10 +44,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    opcodes/configure                   | 1331 +++++++++---
> >    zlib/Makefile.in                    |    3 +
> >    zlib/configure                      | 1331 +++++++++---
> > - 35 files changed, 16094 insertions(+), 6104 deletions(-)
> > + 35 files changed, 16090 insertions(+), 6108 deletions(-)
> >
> >   diff --git a/bfd/Makefile.in b/bfd/Makefile.in
> > -index faaa0c424b8..5371e093163 100644
> > +index b3d97d478ea..8c19e1766fa 100644
> >   --- a/bfd/Makefile.in
> >   +++ b/bfd/Makefile.in
> >   @@ -340,6 +340,7 @@ DATADIRNAME =3D @DATADIRNAME@
> > @@ -75,7 +75,7 @@ index faaa0c424b8..5371e093163 100644
> >    ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
> >    all_backends =3D @all_backends@
> >   diff --git a/bfd/configure b/bfd/configure
> > -index acbac2f364a..a53a9d52719 100755
> > +index 9fe9cf6919f..37b2e6c3393 100755
> >   --- a/bfd/configure
> >   +++ b/bfd/configure
> >   @@ -712,6 +712,9 @@ OTOOL
> > @@ -105,7 +105,7 @@ index acbac2f364a..a53a9d52719 100755
> >      --with-mmap             try using mmap for BFD input files if
> available
> >      --with-separate-debug-dir=3DDIR
> >                              Look for global separate debug info in DIR
> > -@@ -5063,8 +5069,8 @@ esac
> > +@@ -5061,8 +5067,8 @@ esac
> >
> >
> >
> > @@ -116,7 +116,7 @@ index acbac2f364a..a53a9d52719 100755
> >
> >
> >
> > -@@ -5104,7 +5110,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > +@@ -5102,7 +5108,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> >    { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print
> strings" >&5
> >    $as_echo_n "checking how to print strings... " >&6; }
> >    # Test print first, because it will be a builtin if present.
> > @@ -125,7 +125,7 @@ index acbac2f364a..a53a9d52719 100755
> >       test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> >      ECHO=3D'print -r --'
> >    elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -@@ -5797,8 +5803,8 @@ $as_echo_n "checking whether the shell
> understands some XSI constructs... " >&6;
> > +@@ -5795,8 +5801,8 @@ $as_echo_n "checking whether the shell
> understands some XSI constructs... " >&6;
> >    # Try some XSI features
> >    xsi_shell=3Dno
> >    ( _lt_dummy=3D"a/b/c"
> > @@ -136,7 +136,7 @@ index acbac2f364a..a53a9d52719 100755
> >        && eval 'test $(( 1 + 1 )) -eq 2 \
> >        && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> >      && xsi_shell=3Dyes
> > -@@ -5847,6 +5853,80 @@ esac
> > +@@ -5845,6 +5851,80 @@ esac
> >
> >
> >
> > @@ -217,7 +217,7 @@ index acbac2f364a..a53a9d52719 100755
> >    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to
> reload object files" >&5
> >    $as_echo_n "checking for $LD option to reload object files... " >&6;=
 }
> >    if ${lt_cv_ld_reload_flag+:} false; then :
> > -@@ -5863,6 +5943,11 @@ case $reload_flag in
> > +@@ -5861,6 +5941,11 @@ case $reload_flag in
> >    esac
> >    reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> >    case $host_os in
> > @@ -229,7 +229,7 @@ index acbac2f364a..a53a9d52719 100755
> >      darwin*)
> >        if test "$GCC" =3D yes; then
> >          reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o
> $output$reload_objs'
> > -@@ -6031,7 +6116,8 @@ mingw* | pw32*)
> > +@@ -6029,7 +6114,8 @@ mingw* | pw32*)
> >        lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x8=
6
> DLL'
> >        lt_cv_file_magic_cmd=3D'func_win32_libid'
> >      else
> > @@ -239,7 +239,7 @@ index acbac2f364a..a53a9d52719 100755
> >        lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> >      fi
> >      ;;
> > -@@ -6190,6 +6276,21 @@ esac
> > +@@ -6188,6 +6274,21 @@ esac
> >    fi
> >    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> $lt_cv_deplibs_check_method" >&5
> >    $as_echo "$lt_cv_deplibs_check_method" >&6; }
> > @@ -261,7 +261,7 @@ index acbac2f364a..a53a9d52719 100755
> >    file_magic_cmd=3D$lt_cv_file_magic_cmd
> >    deplibs_check_method=3D$lt_cv_deplibs_check_method
> >    test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> > -@@ -6205,6 +6306,157 @@ test -z "$deplibs_check_method" &&
> deplibs_check_method=3Dunknown
> > +@@ -6203,6 +6304,157 @@ test -z "$deplibs_check_method" &&
> deplibs_check_method=3Dunknown
> >
> >
> >
> > @@ -419,7 +419,7 @@ index acbac2f364a..a53a9d52719 100755
> >    plugin_option=3D
> >    plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll
> cyglto_plugin-0.dll"
> >    for plugin in $plugin_names; do
> > -@@ -6219,8 +6471,10 @@ for plugin in $plugin_names; do
> > +@@ -6217,8 +6469,10 @@ for plugin in $plugin_names; do
> >    done
> >
> >    if test -n "$ac_tool_prefix"; then
> > @@ -432,7 +432,7 @@ index acbac2f364a..a53a9d52719 100755
> >    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >    $as_echo_n "checking for $ac_word... " >&6; }
> >    if ${ac_cv_prog_AR+:} false; then :
> > -@@ -6236,7 +6490,7 @@ do
> > +@@ -6234,7 +6488,7 @@ do
> >      test -z "$as_dir" && as_dir=3D.
> >        for ac_exec_ext in '' $ac_executable_extensions; do
> >      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -441,7 +441,7 @@ index acbac2f364a..a53a9d52719 100755
> >        $as_echo "$as_me:${as_lineno-$LINENO}: found
> $as_dir/$ac_word$ac_exec_ext" >&5
> >        break 2
> >      fi
> > -@@ -6256,11 +6510,15 @@ $as_echo "no" >&6; }
> > +@@ -6254,11 +6508,15 @@ $as_echo "no" >&6; }
> >    fi
> >
> >
> > @@ -460,7 +460,7 @@ index acbac2f364a..a53a9d52719 100755
> >    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >    $as_echo_n "checking for $ac_word... " >&6; }
> >    if ${ac_cv_prog_ac_ct_AR+:} false; then :
> > -@@ -6276,7 +6534,7 @@ do
> > +@@ -6274,7 +6532,7 @@ do
> >      test -z "$as_dir" && as_dir=3D.
> >        for ac_exec_ext in '' $ac_executable_extensions; do
> >      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -469,7 +469,7 @@ index acbac2f364a..a53a9d52719 100755
> >        $as_echo "$as_me:${as_lineno-$LINENO}: found
> $as_dir/$ac_word$ac_exec_ext" >&5
> >        break 2
> >      fi
> > -@@ -6295,6 +6553,10 @@ else
> > +@@ -6293,6 +6551,10 @@ else
> >    $as_echo "no" >&6; }
> >    fi
> >
> > @@ -480,7 +480,7 @@ index acbac2f364a..a53a9d52719 100755
> >      if test "x$ac_ct_AR" =3D x; then
> >        AR=3D"false"
> >      else
> > -@@ -6306,25 +6568,20 @@ ac_tool_warned=3Dyes ;;
> > +@@ -6304,25 +6566,20 @@ ac_tool_warned=3Dyes ;;
> >    esac
> >        AR=3D$ac_ct_AR
> >      fi
> > @@ -516,7 +516,7 @@ index acbac2f364a..a53a9d52719 100755
> >
> >
> >
> > -@@ -6335,6 +6592,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> > +@@ -6333,6 +6590,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> >
> >
> >
> > @@ -580,7 +580,7 @@ index acbac2f364a..a53a9d52719 100755
> >
> >    if test -n "$ac_tool_prefix"; then
> >      # Extract the first word of "${ac_tool_prefix}strip", so it can be
> a program name with args.
> > -@@ -6675,8 +6989,8 @@ esac
> > +@@ -6673,8 +6987,8 @@ esac
> >    lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/exter=
n
> int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> >
> >    # Transform an extracted symbol line into symbol name and symbol
> address
> > @@ -591,7 +591,7 @@ index acbac2f364a..a53a9d52719 100755
> >
> >    # Handle CRLF in mingw tool chain
> >    opt_cr=3D
> > -@@ -6712,6 +7026,7 @@ for ac_symprfx in "" "_"; do
> > +@@ -6710,6 +7024,7 @@ for ac_symprfx in "" "_"; do
> >      else
> >        lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[
>  ]\($symcode$symcode*\)[         ][
> ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> >      fi
> > @@ -599,7 +599,7 @@ index acbac2f364a..a53a9d52719 100755
> >
> >      # Check to see that the pipe works correctly.
> >      pipe_works=3Dno
> > -@@ -6753,6 +7068,18 @@ _LT_EOF
> > +@@ -6751,6 +7066,18 @@ _LT_EOF
> >          if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> >       if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> >         cat <<_LT_EOF > conftest.$ac_ext
> > @@ -618,7 +618,7 @@ index acbac2f364a..a53a9d52719 100755
> >    #ifdef __cplusplus
> >    extern "C" {
> >    #endif
> > -@@ -6764,7 +7091,7 @@ _LT_EOF
> > +@@ -6762,7 +7089,7 @@ _LT_EOF
> >         cat <<_LT_EOF >> conftest.$ac_ext
> >
> >    /* The mapping between symbol names and symbols.  */
> > @@ -627,7 +627,7 @@ index acbac2f364a..a53a9d52719 100755
> >      const char *name;
> >      void       *address;
> >    }
> > -@@ -6790,8 +7117,8 @@ static const void *lt_preloaded_setup() {
> > +@@ -6788,8 +7115,8 @@ static const void *lt_preloaded_setup() {
> >    _LT_EOF
> >         # Now try linking the two files.
> >         mv conftest.$ac_objext conftstm.$ac_objext
> > @@ -638,7 +638,7 @@ index acbac2f364a..a53a9d52719 100755
> >         LIBS=3D"conftstm.$ac_objext"
> >         CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> >         if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}:
> \"$ac_link\""; } >&5
> > -@@ -6801,8 +7128,8 @@ _LT_EOF
> > +@@ -6799,8 +7126,8 @@ _LT_EOF
> >      test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> >           pipe_works=3Dyes
> >         fi
> > @@ -649,7 +649,7 @@ index acbac2f364a..a53a9d52719 100755
> >       else
> >         echo "cannot find nm_test_func in $nlist" >&5
> >       fi
> > -@@ -6839,6 +7166,14 @@ else
> > +@@ -6837,6 +7164,14 @@ else
> >    $as_echo "ok" >&6; }
> >    fi
> >
> > @@ -664,7 +664,7 @@ index acbac2f364a..a53a9d52719 100755
> >
> >
> >
> > -@@ -6857,6 +7192,47 @@ fi
> > +@@ -6855,6 +7190,47 @@ fi
> >
> >
> >
> > @@ -712,7 +712,7 @@ index acbac2f364a..a53a9d52719 100755
> >
> >
> >
> > -@@ -7066,6 +7442,123 @@ esac
> > +@@ -7064,6 +7440,123 @@ esac
> >
> >    need_locks=3D"$enable_libtool_lock"
> >
> > @@ -836,7 +836,7 @@ index acbac2f364a..a53a9d52719 100755
> >
> >      case $host_os in
> >        rhapsody* | darwin*)
> > -@@ -7629,6 +8122,8 @@ _LT_EOF
> > +@@ -7627,6 +8120,8 @@ _LT_EOF
> >          $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> >          echo "$AR cru libconftest.a conftest.o" >&5
> >          $AR cru libconftest.a conftest.o 2>&5
> > @@ -845,7 +845,7 @@ index acbac2f364a..a53a9d52719 100755
> >          cat > conftest.c << _LT_EOF
> >    int main() { return 0;}
> >    _LT_EOF
> > -@@ -8182,8 +8677,6 @@ fi
> > +@@ -8180,8 +8675,6 @@ fi
> >    lt_prog_compiler_pic=3D
> >    lt_prog_compiler_static=3D
> >
> > @@ -854,7 +854,7 @@ index acbac2f364a..a53a9d52719 100755
> >
> >      if test "$GCC" =3D yes; then
> >        lt_prog_compiler_wl=3D'-Wl,'
> > -@@ -8349,6 +8842,12 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
> > +@@ -8347,6 +8840,12 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
> >       lt_prog_compiler_pic=3D'--shared'
> >       lt_prog_compiler_static=3D'--static'
> >       ;;
> > @@ -867,7 +867,7 @@ index acbac2f364a..a53a9d52719 100755
> >          pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> >            # Portland Group compilers (*not* the Pentium gcc compiler,
> >       # which looks to be a dead project)
> > -@@ -8411,7 +8910,7 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
> > +@@ -8409,7 +8908,7 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
> >          lt_prog_compiler_pic=3D'-KPIC'
> >          lt_prog_compiler_static=3D'-Bstatic'
> >          case $cc_basename in
> > @@ -876,7 +876,7 @@ index acbac2f364a..a53a9d52719 100755
> >       lt_prog_compiler_wl=3D'-Qoption ld ';;
> >          *)
> >       lt_prog_compiler_wl=3D'-Wl,';;
> > -@@ -8468,13 +8967,17 @@ case $host_os in
> > +@@ -8466,13 +8965,17 @@ case $host_os in
> >        lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> >        ;;
> >    esac
> > @@ -900,7 +900,7 @@ index acbac2f364a..a53a9d52719 100755
> >
> >    #
> >    # Check to make sure the PIC flag actually works.
> > -@@ -8535,6 +9038,11 @@ fi
> > +@@ -8533,6 +9036,11 @@ fi
> >
> >
> >
> > @@ -912,7 +912,7 @@ index acbac2f364a..a53a9d52719 100755
> >    #
> >    # Check to make sure the static flag actually works.
> >    #
> > -@@ -8885,7 +9393,8 @@ _LT_EOF
> > +@@ -8883,7 +9391,8 @@ _LT_EOF
> >          allow_undefined_flag=3Dunsupported
> >          always_export_symbols=3Dno
> >          enable_shared_with_static_runtimes=3Dyes
> > @@ -922,7 +922,7 @@ index acbac2f364a..a53a9d52719 100755
> >
> >          if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> >            archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flag=
s
> -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker
> --out-implib -Xlinker $lib'
> > -@@ -8984,12 +9493,12 @@ _LT_EOF
> > +@@ -8982,12 +9491,12 @@ _LT_EOF
> >         whole_archive_flag_spec=3D'--whole-archive$convenience
> --no-whole-archive'
> >         hardcode_libdir_flag_spec=3D
> >         hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> > @@ -937,7 +937,7 @@ index acbac2f364a..a53a9d52719 100755
> >         fi
> >         ;;
> >       esac
> > -@@ -9003,8 +9512,8 @@ _LT_EOF
> > +@@ -9001,8 +9510,8 @@ _LT_EOF
> >       archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o
> $lib'
> >       wlarc=3D
> >          else
> > @@ -948,7 +948,7 @@ index acbac2f364a..a53a9d52719 100755
> >          fi
> >          ;;
> >
> > -@@ -9022,8 +9531,8 @@ _LT_EOF
> > +@@ -9020,8 +9529,8 @@ _LT_EOF
> >
> >    _LT_EOF
> >          elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' >
> /dev/null; then
> > @@ -959,7 +959,7 @@ index acbac2f364a..a53a9d52719 100755
> >          else
> >       ld_shlibs=3Dno
> >          fi
> > -@@ -9069,8 +9578,8 @@ _LT_EOF
> > +@@ -9067,8 +9576,8 @@ _LT_EOF
> >
> >        *)
> >          if $LD --help 2>&1 | $GREP ': supported targets:.* elf' >
> /dev/null; then
> > @@ -970,7 +970,7 @@ index acbac2f364a..a53a9d52719 100755
> >          else
> >       ld_shlibs=3Dno
> >          fi
> > -@@ -9200,7 +9709,13 @@ _LT_EOF
> > +@@ -9198,7 +9707,13 @@ _LT_EOF
> >       allow_undefined_flag=3D'-berok'
> >            # Determine the default libpath from the value encoded in an
> >            # empty executable.
> > @@ -985,7 +985,7 @@ index acbac2f364a..a53a9d52719 100755
> >    /* end confdefs.h.  */
> >
> >    int
> > -@@ -9213,22 +9728,29 @@ main ()
> > +@@ -9211,22 +9726,29 @@ main ()
> >    _ACEOF
> >    if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -1028,7 +1028,7 @@ index acbac2f364a..a53a9d52719 100755
> >
> >
> hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpath"
> >            archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobj=
s
> $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test
> "x${allow_undefined_flag}" !=3D "x"; then func_echo_all
> "${wl}${allow_undefined_flag}"; else :; fi`
> '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> > -@@ -9240,7 +9762,13 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> > +@@ -9238,7 +9760,13 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> >       else
> >        # Determine the default libpath from the value encoded in an
> >        # empty executable.
> > @@ -1043,7 +1043,7 @@ index acbac2f364a..a53a9d52719 100755
> >    /* end confdefs.h.  */
> >
> >    int
> > -@@ -9253,22 +9781,29 @@ main ()
> > +@@ -9251,22 +9779,29 @@ main ()
> >    _ACEOF
> >    if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -1086,7 +1086,7 @@ index acbac2f364a..a53a9d52719 100755
> >
> >        hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
> >         # Warning - without using the other run time loading flags,
> > -@@ -9313,20 +9848,63 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> > +@@ -9311,20 +9846,63 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> >          # Microsoft Visual C++.
> >          # hardcode_libdir_flag_spec is actually meaningless, as there =
is
> >          # no search path for DLLs.
> > @@ -1164,7 +1164,7 @@ index acbac2f364a..a53a9d52719 100755
> >          ;;
> >
> >        darwin* | rhapsody*)
> > -@@ -9387,7 +9965,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> > +@@ -9385,7 +9963,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> >
> >        # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> >        freebsd* | dragonfly*)
> > @@ -1173,7 +1173,7 @@ index acbac2f364a..a53a9d52719 100755
> >          hardcode_libdir_flag_spec=3D'-R$libdir'
> >          hardcode_direct=3Dyes
> >          hardcode_shlibpath_var=3Dno
> > -@@ -9395,7 +9973,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> > +@@ -9393,7 +9971,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> >
> >        hpux9*)
> >          if test "$GCC" =3D yes; then
> > @@ -1182,7 +1182,7 @@ index acbac2f364a..a53a9d52719 100755
> >          else
> >       archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir
> -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test
> $output_objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> >          fi
> > -@@ -9411,7 +9989,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> > +@@ -9409,7 +9987,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> >
> >        hpux10*)
> >          if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> > @@ -1191,7 +1191,7 @@ index acbac2f364a..a53a9d52719 100755
> >          else
> >       archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib
> $libobjs $deplibs $linker_flags'
> >          fi
> > -@@ -9435,10 +10013,10 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> > +@@ -9433,10 +10011,10 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> >         archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname
> ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> >         ;;
> >       ia64*)
> > @@ -1204,7 +1204,7 @@ index acbac2f364a..a53a9d52719 100755
> >         ;;
> >       esac
> >          else
> > -@@ -9517,23 +10095,36 @@ fi
> > +@@ -9515,23 +10093,36 @@ fi
> >
> >        irix5* | irix6* | nonstopux*)
> >          if test "$GCC" =3D yes; then
> > @@ -1249,7 +1249,7 @@ index acbac2f364a..a53a9d52719 100755
> >          else
> >       archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flags
> -soname $soname `test -n "$verstring" && func_echo_all "-set_version
> $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
> >       archive_expsym_cmds=3D'$CC -shared $libobjs $deplibs $compiler_fl=
ags
> -soname $soname `test -n "$verstring" && func_echo_all "-set_version
> $verstring"` -update_registry ${output_objdir}/so_locations -exports_file
> $export_symbols -o $lib'
> > -@@ -9618,7 +10209,7 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -9616,7 +10207,7 @@ rm -f core conftest.err conftest.$ac_objext \
> >        osf4* | osf5*) # as osf3* with the addition of -msym flag
> >          if test "$GCC" =3D yes; then
> >       allow_undefined_flag=3D' ${wl}-expect_unresolved ${wl}\*'
> > @@ -1258,7 +1258,7 @@ index acbac2f364a..a53a9d52719 100755
> >       hardcode_libdir_flag_spec=3D'${wl}-rpath ${wl}$libdir'
> >          else
> >       allow_undefined_flag=3D' -expect_unresolved \*'
> > -@@ -9637,9 +10228,9 @@ rm -f core conftest.err conftest.$ac_objext \
> > +@@ -9635,9 +10226,9 @@ rm -f core conftest.err conftest.$ac_objext \
> >          no_undefined_flag=3D' -z defs'
> >          if test "$GCC" =3D yes; then
> >       wlarc=3D'${wl}'
> > @@ -1270,7 +1270,7 @@ index acbac2f364a..a53a9d52719 100755
> >          else
> >       case `$CC -V 2>&1` in
> >       *"Compilers 5.0"*)
> > -@@ -10215,8 +10806,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10213,8 +10804,9 @@ cygwin* | mingw* | pw32* | cegcc*)
> >      need_version=3Dno
> >      need_lib_prefix=3Dno
> >
> > @@ -1282,7 +1282,7 @@ index acbac2f364a..a53a9d52719 100755
> >        library_names_spec=3D'$libname.dll.a'
> >        # DLL is installed to $(libdir)/../bin by postinstall_cmds
> >        postinstall_cmds=3D'base_file=3D`basename \${file}`~
> > -@@ -10249,13 +10841,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> > +@@ -10247,13 +10839,71 @@ cygwin* | mingw* | pw32* | cegcc*)
> >          library_names_spec=3D'`echo ${libname} | sed -e
> 's/^lib/pw/'``echo ${release} | $SED -e
> 's/[.]/-/g'`${versuffix}${shared_ext}'
> >          ;;
> >        esac
> > @@ -1355,16 +1355,16 @@ index acbac2f364a..a53a9d52719 100755
> >      # FIXME: first we should search . and the directory the executable
> is in
> >      shlibpath_var=3DPATH
> >      ;;
> > -@@ -11157,7 +11807,7 @@ else
> > +@@ -11155,7 +11805,7 @@ else
> >      lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >      lt_status=3D$lt_dlunknown
> >      cat > conftest.$ac_ext <<_LT_EOF
> > --#line 11160 "configure"
> > +-#line 11158 "configure"
> >   +#line $LINENO "configure"
> >    #include "confdefs.h"
> >
> >    #if HAVE_DLFCN_H
> > -@@ -11201,10 +11851,10 @@ else
> > +@@ -11199,10 +11849,10 @@ else
> >    /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated
> >       correspondingly for the symbols needed.  */
> >    #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3))
> || (__GNUC__ > 3))
> > @@ -1377,16 +1377,16 @@ index acbac2f364a..a53a9d52719 100755
> >    int main ()
> >    {
> >      void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -11263,7 +11913,7 @@ else
> > +@@ -11261,7 +11911,7 @@ else
> >      lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
> >      lt_status=3D$lt_dlunknown
> >      cat > conftest.$ac_ext <<_LT_EOF
> > --#line 11266 "configure"
> > +-#line 11264 "configure"
> >   +#line $LINENO "configure"
> >    #include "confdefs.h"
> >
> >    #if HAVE_DLFCN_H
> > -@@ -11307,10 +11957,10 @@ else
> > +@@ -11305,10 +11955,10 @@ else
> >    /* When -fvisbility=3Dhidden is used, assume the code has been annot=
ated
> >       correspondingly for the symbols needed.  */
> >    #if defined(__GNUC__) && (((__GNUC__ =3D=3D 3) && (__GNUC_MINOR__ >=
=3D 3))
> || (__GNUC__ > 3))
> > @@ -1399,7 +1399,7 @@ index acbac2f364a..a53a9d52719 100755
> >    int main ()
> >    {
> >      void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
> > -@@ -15691,7 +16341,7 @@ SHARED_LDFLAGS=3D
> > +@@ -15689,7 +16339,7 @@ SHARED_LDFLAGS=3D
> >    if test "$enable_shared" =3D "yes"; then
> >      x=3D`sed -n -e 's/^[       ]*PICFLAG[      ]*=3D[    ]*//p' <
> ../libiberty/Makefile | sed -n '$p'`
> >      if test -n "$x"; then
> > @@ -1408,7 +1408,7 @@ index acbac2f364a..a53a9d52719 100755
> >      fi
> >    fi
> >
> > -@@ -18313,13 +18963,20 @@ exeext=3D'`$ECHO "$exeext" | $SED
> "$delay_single_quote_subst"`'
> > +@@ -18316,13 +18966,20 @@ exeext=3D'`$ECHO "$exeext" | $SED
> "$delay_single_quote_subst"`'
> >    lt_unset=3D'`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
> >    lt_SP2NL=3D'`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
> >    lt_NL2SP=3D'`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
> > @@ -1429,7 +1429,7 @@ index acbac2f364a..a53a9d52719 100755
> >    STRIP=3D'`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
> >    RANLIB=3D'`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
> >    old_postinstall_cmds=3D'`$ECHO "$old_postinstall_cmds" | $SED
> "$delay_single_quote_subst"`'
> > -@@ -18334,14 +18991,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO
> "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> > +@@ -18337,14 +18994,17 @@ lt_cv_sys_global_symbol_pipe=3D'`$ECHO
> "$lt_cv_sys_global_symbol_pipe" | $SED "$de
> >    lt_cv_sys_global_symbol_to_cdecl=3D'`$ECHO
> "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
> >    lt_cv_sys_global_symbol_to_c_name_address=3D'`$ECHO
> "$lt_cv_sys_global_symbol_to_c_name_address" | $SED
> "$delay_single_quote_subst"`'
> >    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D'`$ECHO
> "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED
> "$delay_single_quote_subst"`'
> > @@ -1448,7 +1448,7 @@ index acbac2f364a..a53a9d52719 100755
> >    DSYMUTIL=3D'`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
> >    NMEDIT=3D'`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
> >    LIPO=3D'`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
> > -@@ -18374,12 +19034,12 @@ hardcode_shlibpath_var=3D'`$ECHO
> "$hardcode_shlibpath_var" | $SED "$delay_single_q
> > +@@ -18377,12 +19037,12 @@ hardcode_shlibpath_var=3D'`$ECHO
> "$hardcode_shlibpath_var" | $SED "$delay_single_q
> >    hardcode_automatic=3D'`$ECHO "$hardcode_automatic" | $SED
> "$delay_single_quote_subst"`'
> >    inherit_rpath=3D'`$ECHO "$inherit_rpath" | $SED
> "$delay_single_quote_subst"`'
> >    link_all_deplibs=3D'`$ECHO "$link_all_deplibs" | $SED
> "$delay_single_quote_subst"`'
> > @@ -1462,7 +1462,7 @@ index acbac2f364a..a53a9d52719 100755
> >    file_list_spec=3D'`$ECHO "$file_list_spec" | $SED
> "$delay_single_quote_subst"`'
> >    variables_saved_for_relink=3D'`$ECHO "$variables_saved_for_relink" |
> $SED "$delay_single_quote_subst"`'
> >    need_lib_prefix=3D'`$ECHO "$need_lib_prefix" | $SED
> "$delay_single_quote_subst"`'
> > -@@ -18434,8 +19094,13 @@ reload_flag \
> > +@@ -18437,8 +19097,13 @@ reload_flag \
> >    OBJDUMP \
> >    deplibs_check_method \
> >    file_magic_cmd \
> > @@ -1476,7 +1476,7 @@ index acbac2f364a..a53a9d52719 100755
> >    STRIP \
> >    RANLIB \
> >    CC \
> > -@@ -18445,12 +19110,14 @@ lt_cv_sys_global_symbol_pipe \
> > +@@ -18448,12 +19113,14 @@ lt_cv_sys_global_symbol_pipe \
> >    lt_cv_sys_global_symbol_to_cdecl \
> >    lt_cv_sys_global_symbol_to_c_name_address \
> >    lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
> > @@ -1492,7 +1492,7 @@ index acbac2f364a..a53a9d52719 100755
> >    DSYMUTIL \
> >    NMEDIT \
> >    LIPO \
> > -@@ -18466,7 +19133,6 @@ no_undefined_flag \
> > +@@ -18469,7 +19136,6 @@ no_undefined_flag \
> >    hardcode_libdir_flag_spec \
> >    hardcode_libdir_flag_spec_ld \
> >    hardcode_libdir_separator \
> > @@ -1500,7 +1500,7 @@ index acbac2f364a..a53a9d52719 100755
> >    exclude_expsyms \
> >    include_expsyms \
> >    file_list_spec \
> > -@@ -18502,6 +19168,7 @@ module_cmds \
> > +@@ -18505,6 +19171,7 @@ module_cmds \
> >    module_expsym_cmds \
> >    export_symbols_cmds \
> >    prelink_cmds \
> > @@ -1508,7 +1508,7 @@ index acbac2f364a..a53a9d52719 100755
> >    postinstall_cmds \
> >    postuninstall_cmds \
> >    finish_cmds \
> > -@@ -19278,7 +19945,8 @@ $as_echo X"$file" |
> > +@@ -19281,7 +19948,8 @@ $as_echo X"$file" |
> >    # NOTE: Changes made to this file will be lost: look at ltmain.sh.
> >    #
> >    #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004,
> 2005,
> > @@ -1518,7 +1518,7 @@ index acbac2f364a..a53a9d52719 100755
> >    #   Written by Gordon Matzigkeit, 1996
> >    #
> >    #   This file is part of GNU Libtool.
> > -@@ -19381,19 +20049,42 @@ SP2NL=3D$lt_lt_SP2NL
> > +@@ -19384,19 +20052,42 @@ SP2NL=3D$lt_lt_SP2NL
> >    # turn newlines into spaces.
> >    NL2SP=3D$lt_lt_NL2SP
> >
> > @@ -1562,7 +1562,7 @@ index acbac2f364a..a53a9d52719 100755
> >    # A symbol stripping program.
> >    STRIP=3D$lt_STRIP
> >
> > -@@ -19423,6 +20114,12 @@
> global_symbol_to_c_name_address=3D$lt_lt_cv_sys_global_symbol_to_c_name_a=
ddress
> > +@@ -19426,6 +20117,12 @@
> global_symbol_to_c_name_address=3D$lt_lt_cv_sys_global_symbol_to_c_name_a=
ddress
> >    # Transform the output of nm in a C name address pair when lib prefi=
x
> is needed.
> >
> global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sys_global_symbol_=
to_c_name_address_lib_prefix
> >
> > @@ -1575,7 +1575,7 @@ index acbac2f364a..a53a9d52719 100755
> >    # The name of the directory that contains temporary libtool files.
> >    objdir=3D$objdir
> >
> > -@@ -19432,6 +20129,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> > +@@ -19435,6 +20132,9 @@ MAGIC_CMD=3D$MAGIC_CMD
> >    # Must we lock files when doing compilation?
> >    need_locks=3D$lt_need_locks
> >
> > @@ -1585,7 +1585,7 @@ index acbac2f364a..a53a9d52719 100755
> >    # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
> >    DSYMUTIL=3D$lt_DSYMUTIL
> >
> > -@@ -19546,12 +20246,12 @@ with_gcc=3D$GCC
> > +@@ -19549,12 +20249,12 @@ with_gcc=3D$GCC
> >    # Compiler flag to turn off builtin functions.
> >    no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag
> >
> > @@ -1601,7 +1601,7 @@ index acbac2f364a..a53a9d52719 100755
> >    # Compiler flag to prevent dynamic linking.
> >    link_static_flag=3D$lt_lt_prog_compiler_static
> >
> > -@@ -19638,9 +20338,6 @@ inherit_rpath=3D$inherit_rpath
> > +@@ -19641,9 +20341,6 @@ inherit_rpath=3D$inherit_rpath
> >    # Whether libtool must link a program against all its dependency
> libraries.
> >    link_all_deplibs=3D$link_all_deplibs
> >
> > @@ -1611,7 +1611,7 @@ index acbac2f364a..a53a9d52719 100755
> >    # Set to "yes" if exported symbols are required.
> >    always_export_symbols=3D$always_export_symbols
> >
> > -@@ -19656,6 +20353,9 @@ include_expsyms=3D$lt_include_expsyms
> > +@@ -19659,6 +20356,9 @@ include_expsyms=3D$lt_include_expsyms
> >    # Commands necessary for linking programs (against libraries) with
> templates.
> >    prelink_cmds=3D$lt_prelink_cmds
> >
> > @@ -1621,7 +1621,7 @@ index acbac2f364a..a53a9d52719 100755
> >    # Specify filename containing input files.
> >    file_list_spec=3D$lt_file_list_spec
> >
> > -@@ -19688,210 +20388,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> > +@@ -19691,210 +20391,169 @@ ltmain=3D"$ac_aux_dir/ltmain.sh"
> >      # if finds mixed CR/LF and LF-only lines.  Since sed operates in
> >      # text mode, it properly converts lines to CR/LF.  This bash probl=
em
> >      # is reportedly fixed, but why not run on old versions too?
> > @@ -1996,10 +1996,10 @@ index acbac2f364a..a53a9d52719 100755
> >      chmod +x "$ofile"
> >
> >   diff --git a/bfd/configure.ac b/bfd/configure.ac
> > -index 7fcc5d4a947..f7191d3f30f 100644
> > +index 6bcfd1b7368..6aedf387cb9 100644
> >   --- a/bfd/configure.ac
> >   +++ b/bfd/configure.ac
> > -@@ -276,7 +276,7 @@ changequote(,)dnl
> > +@@ -275,7 +275,7 @@ changequote(,)dnl
> >      x=3D`sed -n -e 's/^[       ]*PICFLAG[      ]*=3D[    ]*//p' <
> ../libiberty/Makefile | sed -n '$p'`
> >    changequote([,])dnl
> >      if test -n "$x"; then
> > @@ -2009,7 +2009,7 @@ index 7fcc5d4a947..f7191d3f30f 100644
> >    fi
> >
> >   diff --git a/binutils/Makefile.in b/binutils/Makefile.in
> > -index 842a6d99b54..037cccde038 100644
> > +index 67fa5b3b8d9..3273426119c 100644
> >   --- a/binutils/Makefile.in
> >   +++ b/binutils/Makefile.in
> >   @@ -495,6 +495,7 @@ DEBUGINFOD_LIBS =3D @DEBUGINFOD_LIBS@
> > @@ -2037,7 +2037,7 @@ index 842a6d99b54..037cccde038 100644
> >    ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@
> >    am__include =3D @am__include@
> >   diff --git a/binutils/configure b/binutils/configure
> > -index a1092735311..f3bdee98f3f 100755
> > +index e97f4cba053..6e6e08b350a 100755
> >   --- a/binutils/configure
> >   +++ b/binutils/configure
> >   @@ -704,8 +704,11 @@ OTOOL
> > @@ -2069,7 +2069,7 @@ index a1092735311..f3bdee98f3f 100755
> >      --with-debuginfod       Enable debuginfo lookups with debuginfod
> >                              (auto/yes/no)
> >      --with-gnu-ld           assume the C compiler uses GNU ld default=
=3Dno
> > -@@ -4958,8 +4964,8 @@ esac
> > +@@ -4956,8 +4962,8 @@ esac
> >
> >
> >
> > @@ -2080,7 +2080,7 @@ index a1092735311..f3bdee98f3f 100755
> >
> >
> >
> > -@@ -4999,7 +5005,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> > +@@ -4997,7 +5003,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
> >    { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print
> strings" >&5
> >    $as_echo_n "checking how to print strings... " >&6; }
> >    # Test print first, because it will be a builtin if present.
> > @@ -2089,7 +2089,7 @@ index a1092735311..f3bdee98f3f 100755
> >       test "X`print -r -- $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> >      ECHO=3D'print -r --'
> >    elif test "X`printf %s $ECHO 2>/dev/null`" =3D "X$ECHO"; then
> > -@@ -5692,8 +5698,8 @@ $as_echo_n "checking whether the shell
> understands some XSI constructs... " >&6;
> > +@@ -5690,8 +5696,8 @@ $as_echo_n "checking whether the shell
> understands some XSI constructs... " >&6;
> >    # Try some XSI features
> >    xsi_shell=3Dno
> >    ( _lt_dummy=3D"a/b/c"
> > @@ -2100,7 +2100,7 @@ index a1092735311..f3bdee98f3f 100755
> >        && eval 'test $(( 1 + 1 )) -eq 2 \
> >        && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
> >      && xsi_shell=3Dyes
> > -@@ -5742,6 +5748,80 @@ esac
> > +@@ -5740,6 +5746,80 @@ esac
> >
> >
> >
> > @@ -2181,7 +2181,7 @@ index a1092735311..f3bdee98f3f 100755
> >    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to
> reload object files" >&5
> >    $as_echo_n "checking for $LD option to reload object files... " >&6;=
 }
> >    if ${lt_cv_ld_reload_flag+:} false; then :
> > -@@ -5758,6 +5838,11 @@ case $reload_flag in
> > +@@ -5756,6 +5836,11 @@ case $reload_flag in
> >    esac
> >    reload_cmds=3D'$LD$reload_flag -o $output$reload_objs'
> >    case $host_os in
> > @@ -2193,7 +2193,7 @@ index a1092735311..f3bdee98f3f 100755
> >      darwin*)
> >        if test "$GCC" =3D yes; then
> >          reload_cmds=3D'$LTCC $LTCFLAGS -nostdlib ${wl}-r -o
> $output$reload_objs'
> > -@@ -5926,7 +6011,8 @@ mingw* | pw32*)
> > +@@ -5924,7 +6009,8 @@ mingw* | pw32*)
> >        lt_cv_deplibs_check_method=3D'file_magic ^x86 archive import|^x8=
6
> DLL'
> >        lt_cv_file_magic_cmd=3D'func_win32_libid'
> >      else
> > @@ -2203,7 +2203,7 @@ index a1092735311..f3bdee98f3f 100755
> >        lt_cv_file_magic_cmd=3D'$OBJDUMP -f'
> >      fi
> >      ;;
> > -@@ -6085,6 +6171,21 @@ esac
> > +@@ -6083,6 +6169,21 @@ esac
> >    fi
> >    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
> $lt_cv_deplibs_check_method" >&5
> >    $as_echo "$lt_cv_deplibs_check_method" >&6; }
> > @@ -2225,7 +2225,7 @@ index a1092735311..f3bdee98f3f 100755
> >    file_magic_cmd=3D$lt_cv_file_magic_cmd
> >    deplibs_check_method=3D$lt_cv_deplibs_check_method
> >    test -z "$deplibs_check_method" && deplibs_check_method=3Dunknown
> > -@@ -6100,6 +6201,157 @@ test -z "$deplibs_check_method" &&
> deplibs_check_method=3Dunknown
> > +@@ -6098,6 +6199,157 @@ test -z "$deplibs_check_method" &&
> deplibs_check_method=3Dunknown
> >
> >
> >
> > @@ -2383,7 +2383,7 @@ index a1092735311..f3bdee98f3f 100755
> >    plugin_option=3D
> >    plugin_names=3D"liblto_plugin.so liblto_plugin-0.dll
> cyglto_plugin-0.dll"
> >    for plugin in $plugin_names; do
> > -@@ -6114,8 +6366,10 @@ for plugin in $plugin_names; do
> > +@@ -6112,8 +6364,10 @@ for plugin in $plugin_names; do
> >    done
> >
> >    if test -n "$ac_tool_prefix"; then
> > @@ -2396,7 +2396,7 @@ index a1092735311..f3bdee98f3f 100755
> >    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >    $as_echo_n "checking for $ac_word... " >&6; }
> >    if ${ac_cv_prog_AR+:} false; then :
> > -@@ -6131,7 +6385,7 @@ do
> > +@@ -6129,7 +6383,7 @@ do
> >      test -z "$as_dir" && as_dir=3D.
> >        for ac_exec_ext in '' $ac_executable_extensions; do
> >      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -2405,7 +2405,7 @@ index a1092735311..f3bdee98f3f 100755
> >        $as_echo "$as_me:${as_lineno-$LINENO}: found
> $as_dir/$ac_word$ac_exec_ext" >&5
> >        break 2
> >      fi
> > -@@ -6151,11 +6405,15 @@ $as_echo "no" >&6; }
> > +@@ -6149,11 +6403,15 @@ $as_echo "no" >&6; }
> >    fi
> >
> >
> > @@ -2424,7 +2424,7 @@ index a1092735311..f3bdee98f3f 100755
> >    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
> >    $as_echo_n "checking for $ac_word... " >&6; }
> >    if ${ac_cv_prog_ac_ct_AR+:} false; then :
> > -@@ -6171,7 +6429,7 @@ do
> > +@@ -6169,7 +6427,7 @@ do
> >      test -z "$as_dir" && as_dir=3D.
> >        for ac_exec_ext in '' $ac_executable_extensions; do
> >      if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
> > @@ -2433,7 +2433,7 @@ index a1092735311..f3bdee98f3f 100755
> >        $as_echo "$as_me:${as_lineno-$LINENO}: found
> $as_dir/$ac_word$ac_exec_ext" >&5
> >        break 2
> >      fi
> > -@@ -6190,6 +6448,10 @@ else
> > +@@ -6188,6 +6446,10 @@ else
> >    $as_echo "no" >&6; }
> >    fi
> >
> > @@ -2444,7 +2444,7 @@ index a1092735311..f3bdee98f3f 100755
> >      if test "x$ac_ct_AR" =3D x; then
> >        AR=3D"false"
> >      else
> > -@@ -6201,25 +6463,19 @@ ac_tool_warned=3Dyes ;;
> > +@@ -6199,25 +6461,19 @@ ac_tool_warned=3Dyes ;;
> >    esac
> >        AR=3D$ac_ct_AR
> >      fi
> > @@ -2479,7 +2479,7 @@ index a1092735311..f3bdee98f3f 100755
> >
> >
> >
> > -@@ -6231,6 +6487,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> > +@@ -6229,6 +6485,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=3Dcru
> >
> >
> >
> > @@ -2544,7 +2544,7 @@ index a1092735311..f3bdee98f3f 100755
> >    if test -n "$ac_tool_prefix"; then
> >      # Extract the first word of "${ac_tool_prefix}strip", so it can be
> a program name with args.
> >    set dummy ${ac_tool_prefix}strip; ac_word=3D$2
> > -@@ -6570,8 +6884,8 @@ esac
> > +@@ -6568,8 +6882,8 @@ esac
> >    lt_cv_sys_global_symbol_to_cdecl=3D"sed -n -e 's/^T .* \(.*\)$/exter=
n
> int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
> >
> >    # Transform an extracted symbol line into symbol name and symbol
> address
> > @@ -2555,7 +2555,7 @@ index a1092735311..f3bdee98f3f 100755
> >
> >    # Handle CRLF in mingw tool chain
> >    opt_cr=3D
> > -@@ -6607,6 +6921,7 @@ for ac_symprfx in "" "_"; do
> > +@@ -6605,6 +6919,7 @@ for ac_symprfx in "" "_"; do
> >      else
> >        lt_cv_sys_global_symbol_pipe=3D"sed -n -e 's/^.*[
>  ]\($symcode$symcode*\)[         ][
> ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
> >      fi
> > @@ -2563,7 +2563,7 @@ index a1092735311..f3bdee98f3f 100755
> >
> >      # Check to see that the pipe works correctly.
> >      pipe_works=3Dno
> > -@@ -6648,6 +6963,18 @@ _LT_EOF
> > +@@ -6646,6 +6961,18 @@ _LT_EOF
> >          if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
> >       if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
> >         cat <<_LT_EOF > conftest.$ac_ext
> > @@ -2582,7 +2582,7 @@ index a1092735311..f3bdee98f3f 100755
> >    #ifdef __cplusplus
> >    extern "C" {
> >    #endif
> > -@@ -6659,7 +6986,7 @@ _LT_EOF
> > +@@ -6657,7 +6984,7 @@ _LT_EOF
> >         cat <<_LT_EOF >> conftest.$ac_ext
> >
> >    /* The mapping between symbol names and symbols.  */
> > @@ -2591,7 +2591,7 @@ index a1092735311..f3bdee98f3f 100755
> >      const char *name;
> >      void       *address;
> >    }
> > -@@ -6685,8 +7012,8 @@ static const void *lt_preloaded_setup() {
> > +@@ -6683,8 +7010,8 @@ static const void *lt_preloaded_setup() {
> >    _LT_EOF
> >         # Now try linking the two files.
> >         mv conftest.$ac_objext conftstm.$ac_objext
> > @@ -2602,7 +2602,7 @@ index a1092735311..f3bdee98f3f 100755
> >         LIBS=3D"conftstm.$ac_objext"
> >         CFLAGS=3D"$CFLAGS$lt_prog_compiler_no_builtin_flag"
> >         if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}:
> \"$ac_link\""; } >&5
> > -@@ -6696,8 +7023,8 @@ _LT_EOF
> > +@@ -6694,8 +7021,8 @@ _LT_EOF
> >      test $ac_status =3D 0; } && test -s conftest${ac_exeext}; then
> >           pipe_works=3Dyes
> >         fi
> > @@ -2613,7 +2613,7 @@ index a1092735311..f3bdee98f3f 100755
> >       else
> >         echo "cannot find nm_test_func in $nlist" >&5
> >       fi
> > -@@ -6734,6 +7061,18 @@ else
> > +@@ -6732,6 +7059,18 @@ else
> >    $as_echo "ok" >&6; }
> >    fi
> >
> > @@ -2632,7 +2632,7 @@ index a1092735311..f3bdee98f3f 100755
> >
> >
> >
> > -@@ -6750,6 +7089,43 @@ fi
> > +@@ -6748,6 +7087,43 @@ fi
> >
> >
> >
> > @@ -2676,7 +2676,7 @@ index a1092735311..f3bdee98f3f 100755
> >
> >
> >
> > -@@ -6961,6 +7337,123 @@ esac
> > +@@ -6959,6 +7335,123 @@ esac
> >
> >    need_locks=3D"$enable_libtool_lock"
> >
> > @@ -2800,7 +2800,7 @@ index a1092735311..f3bdee98f3f 100755
> >
> >      case $host_os in
> >        rhapsody* | darwin*)
> > -@@ -7524,6 +8017,8 @@ _LT_EOF
> > +@@ -7522,6 +8015,8 @@ _LT_EOF
> >          $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
> >          echo "$AR cru libconftest.a conftest.o" >&5
> >          $AR cru libconftest.a conftest.o 2>&5
> > @@ -2809,7 +2809,7 @@ index a1092735311..f3bdee98f3f 100755
> >          cat > conftest.c << _LT_EOF
> >    int main() { return 0;}
> >    _LT_EOF
> > -@@ -8108,8 +8603,6 @@ fi
> > +@@ -8106,8 +8601,6 @@ fi
> >    lt_prog_compiler_pic=3D
> >    lt_prog_compiler_static=3D
> >
> > @@ -2818,7 +2818,7 @@ index a1092735311..f3bdee98f3f 100755
> >
> >      if test "$GCC" =3D yes; then
> >        lt_prog_compiler_wl=3D'-Wl,'
> > -@@ -8275,6 +8768,12 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
> > +@@ -8273,6 +8766,12 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
> >       lt_prog_compiler_pic=3D'--shared'
> >       lt_prog_compiler_static=3D'--static'
> >       ;;
> > @@ -2831,7 +2831,7 @@ index a1092735311..f3bdee98f3f 100755
> >          pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
> >            # Portland Group compilers (*not* the Pentium gcc compiler,
> >       # which looks to be a dead project)
> > -@@ -8337,7 +8836,7 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
> > +@@ -8335,7 +8834,7 @@ $as_echo_n "checking for $compiler option to
> produce PIC... " >&6; }
> >          lt_prog_compiler_pic=3D'-KPIC'
> >          lt_prog_compiler_static=3D'-Bstatic'
> >          case $cc_basename in
> > @@ -2840,7 +2840,7 @@ index a1092735311..f3bdee98f3f 100755
> >       lt_prog_compiler_wl=3D'-Qoption ld ';;
> >          *)
> >       lt_prog_compiler_wl=3D'-Wl,';;
> > -@@ -8394,13 +8893,17 @@ case $host_os in
> > +@@ -8392,13 +8891,17 @@ case $host_os in
> >        lt_prog_compiler_pic=3D"$lt_prog_compiler_pic -DPIC"
> >        ;;
> >    esac
> > @@ -2864,7 +2864,7 @@ index a1092735311..f3bdee98f3f 100755
> >
> >    #
> >    # Check to make sure the PIC flag actually works.
> > -@@ -8461,6 +8964,11 @@ fi
> > +@@ -8459,6 +8962,11 @@ fi
> >
> >
> >
> > @@ -2876,7 +2876,7 @@ index a1092735311..f3bdee98f3f 100755
> >    #
> >    # Check to make sure the static flag actually works.
> >    #
> > -@@ -8811,7 +9319,8 @@ _LT_EOF
> > +@@ -8809,7 +9317,8 @@ _LT_EOF
> >          allow_undefined_flag=3Dunsupported
> >          always_export_symbols=3Dno
> >          enable_shared_with_static_runtimes=3Dyes
> > @@ -2886,7 +2886,7 @@ index a1092735311..f3bdee98f3f 100755
> >
> >          if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
> >            archive_cmds=3D'$CC -shared $libobjs $deplibs $compiler_flag=
s
> -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker
> --out-implib -Xlinker $lib'
> > -@@ -8910,12 +9419,12 @@ _LT_EOF
> > +@@ -8908,12 +9417,12 @@ _LT_EOF
> >         whole_archive_flag_spec=3D'--whole-archive$convenience
> --no-whole-archive'
> >         hardcode_libdir_flag_spec=3D
> >         hardcode_libdir_flag_spec_ld=3D'-rpath $libdir'
> > @@ -2901,7 +2901,7 @@ index a1092735311..f3bdee98f3f 100755
> >         fi
> >         ;;
> >       esac
> > -@@ -8929,8 +9438,8 @@ _LT_EOF
> > +@@ -8927,8 +9436,8 @@ _LT_EOF
> >       archive_cmds=3D'$LD -Bshareable $libobjs $deplibs $linker_flags -=
o
> $lib'
> >       wlarc=3D
> >          else
> > @@ -2912,7 +2912,7 @@ index a1092735311..f3bdee98f3f 100755
> >          fi
> >          ;;
> >
> > -@@ -8948,8 +9457,8 @@ _LT_EOF
> > +@@ -8946,8 +9455,8 @@ _LT_EOF
> >
> >    _LT_EOF
> >          elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' >
> /dev/null; then
> > @@ -2923,7 +2923,7 @@ index a1092735311..f3bdee98f3f 100755
> >          else
> >       ld_shlibs=3Dno
> >          fi
> > -@@ -8995,8 +9504,8 @@ _LT_EOF
> > +@@ -8993,8 +9502,8 @@ _LT_EOF
> >
> >        *)
> >          if $LD --help 2>&1 | $GREP ': supported targets:.* elf' >
> /dev/null; then
> > @@ -2934,7 +2934,7 @@ index a1092735311..f3bdee98f3f 100755
> >          else
> >       ld_shlibs=3Dno
> >          fi
> > -@@ -9126,7 +9635,13 @@ _LT_EOF
> > +@@ -9124,7 +9633,13 @@ _LT_EOF
> >       allow_undefined_flag=3D'-berok'
> >            # Determine the default libpath from the value encoded in an
> >            # empty executable.
> > @@ -2949,7 +2949,7 @@ index a1092735311..f3bdee98f3f 100755
> >    /* end confdefs.h.  */
> >
> >    int
> > -@@ -9139,22 +9654,29 @@ main ()
> > +@@ -9137,22 +9652,29 @@ main ()
> >    _ACEOF
> >    if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -2992,7 +2992,7 @@ index a1092735311..f3bdee98f3f 100755
> >
> >
> hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpath"
> >            archive_expsym_cmds=3D'$CC -o $output_objdir/$soname $libobj=
s
> $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test
> "x${allow_undefined_flag}" !=3D "x"; then func_echo_all
> "${wl}${allow_undefined_flag}"; else :; fi`
> '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
> > -@@ -9166,7 +9688,13 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> > +@@ -9164,7 +9686,13 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> >       else
> >        # Determine the default libpath from the value encoded in an
> >        # empty executable.
> > @@ -3007,7 +3007,7 @@ index a1092735311..f3bdee98f3f 100755
> >    /* end confdefs.h.  */
> >
> >    int
> > -@@ -9179,22 +9707,29 @@ main ()
> > +@@ -9177,22 +9705,29 @@ main ()
> >    _ACEOF
> >    if ac_fn_c_try_link "$LINENO"; then :
> >
> > @@ -3050,7 +3050,7 @@ index a1092735311..f3bdee98f3f 100755
> >
> >        hardcode_libdir_flag_spec=3D'${wl}-blibpath:$libdir:'"$aix_libpa=
th"
> >         # Warning - without using the other run time loading flags,
> > -@@ -9239,20 +9774,63 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> > +@@ -9237,20 +9772,63 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> >          # Microsoft Visual C++.
> >          # hardcode_libdir_flag_spec is actually meaningless, as there =
is
> >          # no search path for DLLs.
> > @@ -3128,7 +3128,7 @@ index a1092735311..f3bdee98f3f 100755
> >          ;;
> >
> >        darwin* | rhapsody*)
> > -@@ -9313,7 +9891,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> > +@@ -9311,7 +9889,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> >
> >        # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
> >        freebsd* | dragonfly*)
> > @@ -3137,7 +3137,7 @@ index a1092735311..f3bdee98f3f 100755
> >          hardcode_libdir_flag_spec=3D'-R$libdir'
> >          hardcode_direct=3Dyes
> >          hardcode_shlibpath_var=3Dno
> > -@@ -9321,7 +9899,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> > +@@ -9319,7 +9897,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> >
> >        hpux9*)
> >          if test "$GCC" =3D yes; then
> > @@ -3146,7 +3146,7 @@ index a1092735311..f3bdee98f3f 100755
> >          else
> >       archive_cmds=3D'$RM $output_objdir/$soname~$LD -b +b $install_lib=
dir
> -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test
> $output_objdir/$soname =3D $lib || mv $output_objdir/$soname $lib'
> >          fi
> > -@@ -9337,7 +9915,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> > +@@ -9335,7 +9913,7 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> >
> >        hpux10*)
> >          if test "$GCC" =3D yes && test "$with_gnu_ld" =3D no; then
> > @@ -3155,7 +3155,7 @@ index a1092735311..f3bdee98f3f 100755
> >          else
> >       archive_cmds=3D'$LD -b +h $soname +b $install_libdir -o $lib
> $libobjs $deplibs $linker_flags'
> >          fi
> > -@@ -9361,10 +9939,10 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> > +@@ -9359,10 +9937,10 @@ if test -z "$aix_libpath"; then
> aix_libpath=3D"/usr/lib:/lib"; fi
> >         archive_cmds=3D'$CC -shared ${wl}+h ${wl}$soname
> ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
> >         ;;
> >       ia64*)
> > @@ -3168,7 +3168,7 @@ index a1092735311..f3bdee98f3f 100755
> >         ;;
> >       esac
> >          else
> > -@@ -9443,23 +10021,36 @@ fi
> > +@@ -9441,23 +10019,36 @@ fi
> >
> >        irix5* | irix6* |

--00000000000017b02f061f4b8865
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Right your are !! I think it was a pasting error=C2=A0</d=
iv><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, Aug 9, 2024 at 7:50=E2=80=AFPM Takayasu Ito via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;ypa.takayasu.ito=3D=
<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Kem,<=
br>
<br>
=C2=A0&gt; [1] <a href=3D"https://sourceware.org/pipermail/binutils/2024-Ja=
nuary/132213.html" rel=3D"noreferrer" target=3D"_blank">https://sourceware.=
org/pipermail/binutils/2024-January/132213.html</a><br>
<br>
The above changelog is for 2.42.<br>
The one for 2.43 is as follows.<br>
<a href=3D"https://sourceware.org/pipermail/binutils/2024-August/136151.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/pipermail/bi=
nutils/2024-August/136151.html</a><br>
<br>
<br>
On 2024/08/05 13:43, Khem Raj via <a href=3D"http://lists.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Detailed changelog [1]<br>
&gt; <br>
&gt; [1] <a href=3D"https://sourceware.org/pipermail/binutils/2024-January/=
132213.html" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/pi=
permail/binutils/2024-January/132213.html</a><br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0|=
=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0.../{binutils-2.42.inc =3D&gt; binutils-2.43.inc}=C2=A0 |=
=C2=A0 =C2=A0 9 +-<br>
&gt;=C2=A0 =C2=A0....<a href=3D"http://42.bb" rel=3D"noreferrer" target=3D"=
_blank">42.bb</a> =3D&gt; <a href=3D"http://binutils-cross-canadian_2.43.bb=
" rel=3D"noreferrer" target=3D"_blank">binutils-cross-canadian_2.43.bb</a>}=
 |=C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0...<a href=3D"http://s-cross_2.42.bb" rel=3D"noreferrer" t=
arget=3D"_blank">s-cross_2.42.bb</a> =3D&gt; <a href=3D"http://binutils-cro=
ss_2.43.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.43.bb</a>=
} |=C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0...<a href=3D"http://ssdk_2.42.bb" rel=3D"noreferrer" targ=
et=3D"_blank">ssdk_2.42.bb</a> =3D&gt; <a href=3D"http://binutils-crosssdk_=
2.43.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2.43.bb</a>=
} |=C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0...<a href=3D"http://ite_2.42.bb" rel=3D"noreferrer" targe=
t=3D"_blank">ite_2.42.bb</a> =3D&gt; <a href=3D"http://binutils-testsuite_2=
.43.bb" rel=3D"noreferrer" target=3D"_blank">binutils-testsuite_2.43.bb</a>=
} |=C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A0...s-crosssdk-Generate-relocatable-SDKs.patch |=C2=A0 =C2=
=A012 +-<br>
&gt;=C2=A0 =C2=A0...o-not-generate-linker-script-directo.patch |=C2=A0 =C2=
=A0 6 +-<br>
&gt;=C2=A0 =C2=A0...dk-Search-for-alternative-ld.so.conf.patch |=C2=A0 =C2=
=A010 +-<br>
&gt;=C2=A0 =C2=A0...004-Point-scripts-location-to-libdir.patch |=C2=A0 =C2=
=A0 6 +-<br>
&gt;=C2=A0 =C2=A0...stro-compiler-point-to-the-wrong-ins.patch |=C2=A0 =C2=
=A0 4 +-<br>
&gt;=C2=A0 =C2=A0...-system-directories-when-cross-linki.patch |=C2=A0 =C2=
=A057 +-<br>
&gt;=C2=A0 =C2=A0...ect-assembling-for-ppc-wait-mnemonic.patch |=C2=A0 =C2=
=A0 2 +-<br>
&gt;=C2=A0 =C2=A0.../binutils/0008-Use-libtool-2.4.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 1774 +++++++++--------<br>
&gt;=C2=A0 =C2=A0...h-in-libtool-when-sysroot-is-enabled.patch |=C2=A0 =C2=
=A0 2 +-<br>
&gt;=C2=A0 =C2=A0.../0010-sync-with-OE-libtool-changes.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0...or-clang-before-checking-gcc-version.patch |=C2=A0 =C2=
=A0 8 +-<br>
&gt;=C2=A0 =C2=A0...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |=C2=A0 =C2=
=A0 4 +-<br>
&gt;=C2=A0 =C2=A0...sing-_Alignof-when-using-C11-or-newe.patch |=C2=A0 =C2=
=A0 2 +-<br>
&gt;=C2=A0 =C2=A0...-pe-dll.o-entry-deom-targ_extra_ofil.patch |=C2=A0 =C2=
=A0 2 +-<br>
&gt;=C2=A0 =C2=A0...rofng-change-use-of-bignum-to-bigint.patch |=C2=A0 =C2=
=A017 -<br>
&gt;=C2=A0 =C2=A0.../{<a href=3D"http://binutils_2.42.bb" rel=3D"noreferrer=
" target=3D"_blank">binutils_2.42.bb</a> =3D&gt; <a href=3D"http://binutils=
_2.43.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.43.bb</a>}=C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 0<br>
&gt;=C2=A0 =C2=A022 files changed, 961 insertions(+), 958 deletions(-)<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-devtools/binutils/{binutils-2.42.inc =
=3D&gt; binutils-2.43.inc} (90%)<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://b=
inutils-cross-canadian_2.42.bb" rel=3D"noreferrer" target=3D"_blank">binuti=
ls-cross-canadian_2.42.bb</a> =3D&gt; <a href=3D"http://binutils-cross-cana=
dian_2.43.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross-canadian_=
2.43.bb</a>} (100%)<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://b=
inutils-cross_2.42.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_=
2.42.bb</a> =3D&gt; <a href=3D"http://binutils-cross_2.43.bb" rel=3D"norefe=
rrer" target=3D"_blank">binutils-cross_2.43.bb</a>} (100%)<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://b=
inutils-crosssdk_2.42.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cro=
sssdk_2.42.bb</a> =3D&gt; <a href=3D"http://binutils-crosssdk_2.43.bb" rel=
=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2.43.bb</a>} (100%)<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://b=
inutils-testsuite_2.42.bb" rel=3D"noreferrer" target=3D"_blank">binutils-te=
stsuite_2.42.bb</a> =3D&gt; <a href=3D"http://binutils-testsuite_2.43.bb" r=
el=3D"noreferrer" target=3D"_blank">binutils-testsuite_2.43.bb</a>} (100%)<=
br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils=
/0015-gprofng-change-use-of-bignum-to-bigint.patch<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://b=
inutils_2.42.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.42.bb</a> =
=3D&gt; <a href=3D"http://binutils_2.43.bb" rel=3D"noreferrer" target=3D"_b=
lank">binutils_2.43.bb</a>} (100%)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/d=
istro/include/tcmode-default.inc<br>
&gt; index c6bc80c5421..a286d25a53a 100644<br>
&gt; --- a/meta/conf/distro/include/tcmode-default.inc<br>
&gt; +++ b/meta/conf/distro/include/tcmode-default.inc<br>
&gt; @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D &quot;gette=
xt&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0GCCVERSION ?=3D &quot;14.%&quot;<br>
&gt;=C2=A0 =C2=A0SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;<br>
&gt; -BINUVERSION ?=3D &quot;2.42%&quot;<br>
&gt; +BINUVERSION ?=3D &quot;2.43%&quot;<br>
&gt;=C2=A0 =C2=A0GDBVERSION ?=3D &quot;15.%&quot;<br>
&gt;=C2=A0 =C2=A0GLIBCVERSION ?=3D &quot;2.40%&quot;<br>
&gt;=C2=A0 =C2=A0LINUXLIBCVERSION ?=3D &quot;6.10%&quot;<br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/r=
ecipes-devtools/binutils/binutils-2.43.inc<br>
&gt; similarity index 90%<br>
&gt; rename from meta/recipes-devtools/binutils/binutils-2.42.inc<br>
&gt; rename to meta/recipes-devtools/binutils/binutils-2.43.inc<br>
&gt; index bcc333506fe..c1689a82dc2 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/binutils-2.42.inc<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils-2.43.inc<br>
&gt; @@ -12,15 +12,15 @@ LIC_FILES_CHKSUM=3D&quot;\<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# When upgrading to 2.42, please make sure there is no tra=
iling .0, so<br>
&gt;=C2=A0 =C2=A0# that upstream version check can work correctly.<br>
&gt; -PV =3D &quot;2.42&quot;<br>
&gt; -CVE_VERSION =3D &quot;2.42&quot;<br>
&gt; -SRCBRANCH ?=3D &quot;binutils-2_42-branch&quot;<br>
&gt; +PV =3D &quot;2.43&quot;<br>
&gt; +CVE_VERSION =3D &quot;2.43&quot;<br>
&gt; +SRCBRANCH ?=3D &quot;binutils-2_43-branch&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;binutils-(?P&lt;pver&=
gt;\d+_(\d_?)*)&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0CVE_STATUS[CVE-2023-25584] =3D &quot;cpe-incorrect: Applie=
s only for version 2.40 and earlier&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -SRCREV ?=3D &quot;e343b51459ca120ead1d1a0eda14dd7bd8849f4f&quot;<br>
&gt; +SRCREV ?=3D &quot;2fbb863136724cfef2fc2f4c2b7f51be36f132c7&quot;<br>
&gt;=C2=A0 =C2=A0BINUTILS_GIT_URI ?=3D &quot;git://<a href=3D"http://source=
ware.org/git/binutils-gdb.git;branch=3D$%7BSRCBRANCH%7D;protocol=3Dhttps" r=
el=3D"noreferrer" target=3D"_blank">sourceware.org/git/binutils-gdb.git;bra=
nch=3D${SRCBRANCH};protocol=3Dhttps</a>&quot;<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${BINUTILS_GIT_URI} \<br>
&gt; @@ -35,6 +35,5 @@ SRC_URI =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0012-Only-generate-an-RPATH-entry-if=
-LD_RUN_PATH-is-not-e.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0013-Define-alignof-using-_Alignof-w=
hen-using-C11-or-newe.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0014-Remove-duplicate-pe-dll.o-entry=
-deom-targ_extra_ofil.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0file://0015-gprofng-change-use-of-bignum-to-bigin=
t.patch \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0S=C2=A0 =3D &quot;${WORKDIR}/git&quot;<br>
&gt; diff --git a/meta/recipes-devtools/binutils/<a href=3D"http://binutils=
-cross-canadian_2.42.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cros=
s-canadian_2.42.bb</a> b/meta/recipes-devtools/binutils/<a href=3D"http://b=
inutils-cross-canadian_2.43.bb" rel=3D"noreferrer" target=3D"_blank">binuti=
ls-cross-canadian_2.43.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/binutils/<a href=3D"http://binutils-=
cross-canadian_2.42.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross=
-canadian_2.42.bb</a><br>
&gt; rename to meta/recipes-devtools/binutils/<a href=3D"http://binutils-cr=
oss-canadian_2.43.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross-c=
anadian_2.43.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/binutils/<a href=3D"http://binutils=
-cross_2.42.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.42.bb=
</a> b/meta/recipes-devtools/binutils/<a href=3D"http://binutils-cross_2.43=
.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.43.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/binutils/<a href=3D"http://binutils-=
cross_2.42.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.42.bb<=
/a><br>
&gt; rename to meta/recipes-devtools/binutils/<a href=3D"http://binutils-cr=
oss_2.43.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.43.bb</a=
><br>
&gt; diff --git a/meta/recipes-devtools/binutils/<a href=3D"http://binutils=
-crosssdk_2.42.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2=
.42.bb</a> b/meta/recipes-devtools/binutils/<a href=3D"http://binutils-cros=
ssdk_2.43.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2.43.b=
b</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/binutils/<a href=3D"http://binutils-=
crosssdk_2.42.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2.=
42.bb</a><br>
&gt; rename to meta/recipes-devtools/binutils/<a href=3D"http://binutils-cr=
osssdk_2.43.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2.43=
.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/binutils/<a href=3D"http://binutils=
-testsuite_2.42.bb" rel=3D"noreferrer" target=3D"_blank">binutils-testsuite=
_2.42.bb</a> b/meta/recipes-devtools/binutils/<a href=3D"http://binutils-te=
stsuite_2.43.bb" rel=3D"noreferrer" target=3D"_blank">binutils-testsuite_2.=
43.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/binutils/<a href=3D"http://binutils-=
testsuite_2.42.bb" rel=3D"noreferrer" target=3D"_blank">binutils-testsuite_=
2.42.bb</a><br>
&gt; rename to meta/recipes-devtools/binutils/<a href=3D"http://binutils-te=
stsuite_2.43.bb" rel=3D"noreferrer" target=3D"_blank">binutils-testsuite_2.=
43.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-cro=
sssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binu=
tils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch<br>
&gt; index 4ef11c56e7c..3dd559e3961 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-G=
enerate-relocatable-SDKs.patch<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-G=
enerate-relocatable-SDKs.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 089ee95b342e79af09258b45c888a13b35fadf26 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 56d41f0cc6a806d2e8d7dcbfb4cca4cd37fba835 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Mon, 2 Mar 2015 01:58:54 +0000<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] binutils-crosssdk: Generate relocatable S=
DKs<br>
&gt; @@ -34,10 +34,10 @@ index b43ae841a6c..6101a95195b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Output_section_data* odata =3D new Output_data_con=
st(interp, len, 1);<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0diff --git a/ld/genscripts.sh b/ld/genscripts.sh<br>
&gt; -index d6ceb3fe4f5..365c0e778cc 100755<br>
&gt; +index a726b158161..5d2eb737efc 100755<br>
&gt;=C2=A0 =C2=A0--- a/ld/genscripts.sh<br>
&gt;=C2=A0 =C2=A0+++ b/ld/genscripts.sh<br>
&gt; -@@ -298,6 +298,7 @@ DATA_ALIGNMENT_u=3D&quot;${DATA_ALIGNMENT_u-${DAT=
A_ALIGNMENT_r}}&quot;<br>
&gt; +@@ -315,6 +315,7 @@ DATA_ALIGNMENT_u=3D&quot;${DATA_ALIGNMENT_u-${DAT=
A_ALIGNMENT_r}}&quot;<br>
&gt;=C2=A0 =C2=A0 LD_FLAG=3Dr<br>
&gt;=C2=A0 =C2=A0 DATA_ALIGNMENT=3D${DATA_ALIGNMENT_r}<br>
&gt;=C2=A0 =C2=A0 DEFAULT_DATA_ALIGNMENT=3D&quot;ALIGN(${SEGMENT_SIZE})&quo=
t;<br>
&gt; @@ -45,7 +45,7 @@ index d6ceb3fe4f5..365c0e778cc 100755<br>
&gt;=C2=A0 =C2=A0 ( echo &quot;/* Script for -r */&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 source_sh ${CUSTOMIZER_SCRIPT}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 source_sh ${srcdir}/scripttempl/${SCRIPT_NAME}.sc<=
br>
&gt; -@@ -306,10 +307,12 @@ DEFAULT_DATA_ALIGNMENT=3D&quot;ALIGN(${SEGMENT_=
SIZE})&quot;<br>
&gt; +@@ -323,10 +324,12 @@ DEFAULT_DATA_ALIGNMENT=3D&quot;ALIGN(${SEGMENT_=
SIZE})&quot;<br>
&gt;=C2=A0 =C2=A0 LD_FLAG=3Du<br>
&gt;=C2=A0 =C2=A0 DATA_ALIGNMENT=3D${DATA_ALIGNMENT_u}<br>
&gt;=C2=A0 =C2=A0 CONSTRUCTING=3D&quot; &quot;<br>
&gt; @@ -59,10 +59,10 @@ index d6ceb3fe4f5..365c0e778cc 100755<br>
&gt;=C2=A0 =C2=A0 DATA_ALIGNMENT=3D${DATA_ALIGNMENT_}<br>
&gt;=C2=A0 =C2=A0 RELOCATING=3D&quot; &quot;<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/scripttempl/<a href=3D"http://elf.sc" rel=
=3D"noreferrer" target=3D"_blank">elf.sc</a> b/ld/scripttempl/<a href=3D"ht=
tp://elf.sc" rel=3D"noreferrer" target=3D"_blank">elf.sc</a><br>
&gt; -index fae7c2ad71c..7fe37eb1874 100644<br>
&gt; +index 54716110b61..da17fe5cbce 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/scripttempl/<a href=3D"http://elf.sc" rel=3D"nore=
ferrer" target=3D"_blank">elf.sc</a><br>
&gt;=C2=A0 =C2=A0+++ b/ld/scripttempl/<a href=3D"http://elf.sc" rel=3D"nore=
ferrer" target=3D"_blank">elf.sc</a><br>
&gt; -@@ -150,8 +150,8 @@ if test -z &quot;$DATA_SEGMENT_ALIGN&quot;; then<=
br>
&gt; +@@ -152,8 +152,8 @@ if test -z &quot;$DATA_SEGMENT_ALIGN&quot;; then<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 DATA_SEGMENT_RELRO_END=3D&quot;. =3D DATA_S=
EGMENT_RELRO_END (${SEPARATE_GOTPLT-0}, .);&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 fi<br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cro=
ss-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binu=
tils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.pat=
ch<br>
&gt; index 1652473bcb2..3ad1da38e6b 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-n=
ot-generate-linker-script-directo.patch<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-n=
ot-generate-linker-script-directo.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 6fae7afeb713a60755e17443964e46190bb97ede Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 4f2a54c468c448efdd44813273893ec9c541deaf Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Mon, 6 Mar 2017 23:37:05 -0800<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] binutils-cross: Do not generate linker sc=
ript directories<br>
&gt; @@ -22,10 +22,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 1 file changed, 25 deletions(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/genscripts.sh b/ld/genscripts.sh<br>
&gt; -index 365c0e778cc..b0893fda3c5 100755<br>
&gt; +index 5d2eb737efc..ad225b0071d 100755<br>
&gt;=C2=A0 =C2=A0--- a/ld/genscripts.sh<br>
&gt;=C2=A0 =C2=A0+++ b/ld/genscripts.sh<br>
&gt; -@@ -229,31 +229,6 @@ append_to_lib_path()<br>
&gt; +@@ -244,31 +244,6 @@ append_to_lib_path()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nat=
ivesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binu=
tils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.pat=
ch<br>
&gt; index f45690ed68d..ec8e40c132e 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-=
Search-for-alternative-ld.so.conf.patch<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-=
Search-for-alternative-ld.so.conf.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 1fe9aa3f25e09281cb018b29081db4cc44bdc01f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From bbb86582536ba9e4ab0fb4656d4697542172ab78 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@=
linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</=
a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Wed, 19 Feb 2020 09:51:16 -0800<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] binutils-nativesdk: Search for alternativ=
e ld.so.conf in SDK<br>
&gt; @@ -29,7 +29,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 5 files changed, 7 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/Makefile.am b/ld/Makefile.am<br>
&gt; -index f9ee05b1400..07801c2c3ac 100644<br>
&gt; +index 6a9833e5775..b2776d2a1f3 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/Makefile.am<br>
&gt;=C2=A0 =C2=A0+++ b/ld/Makefile.am<br>
&gt;=C2=A0 =C2=A0@@ -42,7 +42,8 @@ ZLIBINC =3D @zlibinc@<br>
&gt; @@ -43,7 +43,7 @@ index f9ee05b1400..07801c2c3ac 100644<br>
&gt;=C2=A0 =C2=A0 NO_WERROR =3D @NO_WERROR@<br>
&gt;=C2=A0 =C2=A0 AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLA=
GS) $(ZSTD_CFLAGS)<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/Makefile.in b/ld/Makefile.in<br>
&gt; -index abb0565718f..6329a12a0d6 100644<br>
&gt; +index 8639e782cdf..19c19088724 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/Makefile.in<br>
&gt;=C2=A0 =C2=A0+++ b/ld/Makefile.in<br>
&gt;=C2=A0 =C2=A0@@ -576,7 +576,8 @@ ZLIB =3D @zlibdir@ -lz<br>
&gt; @@ -57,7 +57,7 @@ index abb0565718f..6329a12a0d6 100644<br>
&gt;=C2=A0 =C2=A0 AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLA=
GS) $(ZSTD_CFLAGS)<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0diff --git a/ld/ldelf.c b/ld/ldelf.c<br>
&gt; -index 2852851dcd5..187b359af86 100644<br>
&gt; +index 09691609fc0..e49c0217ae2 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/ldelf.c<br>
&gt;=C2=A0 =C2=A0+++ b/ld/ldelf.c<br>
&gt;=C2=A0 =C2=A0@@ -939,7 +939,7 @@ ldelf_check_ld_so_conf (const struct b=
fd_link_needed_list *l, int force,<br>
&gt; @@ -70,7 +70,7 @@ index 2852851dcd5..187b359af86 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ldelf_parse_ld_so_conf (&amp;in=
fo, tmppath))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/ldmain.c b/ld/ldmain.c<br>
&gt; -index e90c2021b33..01b306e58a1 100644<br>
&gt; +index 037099b9d37..2f500d73c58 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/ldmain.c<br>
&gt;=C2=A0 =C2=A0+++ b/ld/ldmain.c<br>
&gt;=C2=A0 =C2=A0@@ -69,6 +69,7 @@ char *program_name;<br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-script=
s-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-P=
oint-scripts-location-to-libdir.patch<br>
&gt; index ab12c145ea9..572c2e840ba 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-locat=
ion-to-libdir.patch<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-locat=
ion-to-libdir.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 780109902b00652dfdc080607c614f210e96ae9b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From aa371816a7ad55af4b29ffc32b213a812f4c6216 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Mon, 2 Mar 2015 01:09:58 +0000<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] Point scripts location to libdir<br>
&gt; @@ -12,7 +12,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/Makefile.am b/ld/Makefile.am<br>
&gt; -index 07801c2c3ac..a2bcffecf73 100644<br>
&gt; +index b2776d2a1f3..76ebecb5685 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/Makefile.am<br>
&gt;=C2=A0 =C2=A0+++ b/ld/Makefile.am<br>
&gt;=C2=A0 =C2=A0@@ -51,7 +51,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CFLAG=
S) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)<br>
&gt; @@ -25,7 +25,7 @@ index 07801c2c3ac..a2bcffecf73 100644<br>
&gt;=C2=A0 =C2=A0 EMUL =3D @EMUL@<br>
&gt;=C2=A0 =C2=A0 EMULATION_OFILES =3D @EMULATION_OFILES@<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/Makefile.in b/ld/Makefile.in<br>
&gt; -index 6329a12a0d6..15311048855 100644<br>
&gt; +index 19c19088724..4be38a75feb 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/Makefile.in<br>
&gt;=C2=A0 =C2=A0+++ b/ld/Makefile.in<br>
&gt;=C2=A0 =C2=A0@@ -584,7 +584,7 @@ AM_CFLAGS =3D $(WARN_CFLAGS) $(ELF_CFL=
AGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)<br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-th=
e-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binu=
tils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.pat=
ch<br>
&gt; index f7c3987542f..2b1d57a05ed 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distr=
o-compiler-point-to-the-wrong-ins.patch<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distr=
o-compiler-point-to-the-wrong-ins.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From c8cca8d2364c9f233d6e771136a4d4ff7f405c21 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From cf20233a1d53effa223a8b72ae9c0652a472a87a Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Mon, 2 Mar 2015 01:39:01 +0000<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] don&#39;t let the distro compiler point t=
o the wrong installation<br>
&gt; @@ -17,7 +17,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in=
<br>
&gt; -index 85c4b6b6ef8..cb6e91c8f9b 100644<br>
&gt; +index b77a41c781c..9fb4d6f09c9 100644<br>
&gt;=C2=A0 =C2=A0--- a/libiberty/Makefile.in<br>
&gt;=C2=A0 =C2=A0+++ b/libiberty/Makefile.in<br>
&gt;=C2=A0 =C2=A0@@ -385,7 +385,8 @@ install-strip: install<br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils/0006-warn-for-use=
s-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binu=
tils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.pat=
ch<br>
&gt; index bf6a1a39611..b267e516b37 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-sy=
stem-directories-when-cross-linki.patch<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-sy=
stem-directories-when-cross-linki.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From a92c46e3703d038d7d810bdc91e8540ad9d9150a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 26f6a7a397e62b5e974cf88f6d4d8ba9a3d51e3c Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Fri, 15 Jan 2016 06:31:09 +0000<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] warn for uses of system directories when =
cross linking<br>
&gt; @@ -56,17 +56,17 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 ld/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a> | 10 ++++++++++<br>
&gt;=C2=A0 =C2=A0 ld/ld.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++++=
++<br>
&gt;=C2=A0 =C2=A0 ld/ld.texi=C2=A0 =C2=A0 =C2=A0 | 12 ++++++++++++<br>
&gt; - ld/ldfile.c=C2=A0 =C2=A0 =C2=A0| 17 +++++++++++++++++<br>
&gt; + ld/ldfile.c=C2=A0 =C2=A0 =C2=A0| 16 ++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 ld/ldlex.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A0 ld/ldmain.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++--<br>
&gt;=C2=A0 =C2=A0 ld/lexsup.c=C2=A0 =C2=A0 =C2=A0| 15 +++++++++++++++<br>
&gt; - 9 files changed, 87 insertions(+), 2 deletions(-)<br>
&gt; + 9 files changed, 86 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/<a href=3D"http://config.in" rel=3D"norefe=
rrer" target=3D"_blank">config.in</a> b/ld/<a href=3D"http://config.in" rel=
=3D"noreferrer" target=3D"_blank">config.in</a><br>
&gt; -index 52d62f06ff0..b5944e7ba55 100644<br>
&gt; +index f7c9da3d02a..e4fdbf6db5b 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/<a href=3D"http://config.in" rel=3D"noreferrer" t=
arget=3D"_blank">config.in</a><br>
&gt;=C2=A0 =C2=A0+++ b/ld/<a href=3D"http://config.in" rel=3D"noreferrer" t=
arget=3D"_blank">config.in</a><br>
&gt; -@@ -70,6 +70,9 @@<br>
&gt; +@@ -74,6 +74,9 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0language is requested. */<br>
&gt;=C2=A0 =C2=A0 #undef ENABLE_NLS<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -77,7 +77,7 @@ index 52d62f06ff0..b5944e7ba55 100644<br>
&gt;=C2=A0 =C2=A0 #undef EXTRA_SHLIB_EXTENSION<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0diff --git a/ld/configure b/ld/configure<br>
&gt; -index 6f8a05c3b6c..98a76d6da7f 100755<br>
&gt; +index 1d89e3b0677..dd770216b61 100755<br>
&gt;=C2=A0 =C2=A0--- a/ld/configure<br>
&gt;=C2=A0 =C2=A0+++ b/ld/configure<br>
&gt;=C2=A0 =C2=A0@@ -844,6 +844,7 @@ with_lib_path<br>
&gt; @@ -88,7 +88,7 @@ index 6f8a05c3b6c..98a76d6da7f 100755<br>
&gt;=C2=A0 =C2=A0 enable_gold<br>
&gt;=C2=A0 =C2=A0 enable_got<br>
&gt;=C2=A0 =C2=A0 enable_compressed_debug_sections<br>
&gt; -@@ -1534,6 +1535,8 @@ Optional Features:<br>
&gt; +@@ -1535,6 +1536,8 @@ Optional Features:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-checking=C2=A0 =C2=A0 =C2=A0 =C2=A0enable=
 run-time checks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-targets=C2=A0 =C2=A0 =C2=A0 =C2=A0 altern=
ative target configurations<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --enable-64-bit-bfd=C2=A0 =C2=A0 =C2=A064-bit supp=
ort (on hosts with narrower word sizes)<br>
&gt; @@ -118,10 +118,10 @@ index 6f8a05c3b6c..98a76d6da7f 100755<br>
&gt;=C2=A0 =C2=A0 if test &quot;${enable_gold+set}&quot; =3D set; then :<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 enableval=3D$enable_gold; case &quot;${enableval}&=
quot; in<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/<a href=3D"http://configure.ac" rel=3D"nor=
eferrer" target=3D"_blank">configure.ac</a> b/ld/<a href=3D"http://configur=
e.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 4a11787ae71..104a531fb0f 100644<br>
&gt; +index bdf51a062fa..3d370ff92ce 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/<a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 =C2=A0+++ b/ld/<a href=3D"http://configure.ac" rel=3D"noreferrer=
" target=3D"_blank">configure.ac</a><br>
&gt; -@@ -103,6 +103,16 @@ AC_SUBST(use_sysroot)<br>
&gt; +@@ -102,6 +102,16 @@ AC_SUBST(use_sysroot)<br>
&gt;=C2=A0 =C2=A0 AC_SUBST(TARGET_SYSTEM_ROOT)<br>
&gt;=C2=A0 =C2=A0 AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -139,7 +139,7 @@ index 4a11787ae71..104a531fb0f 100644<br>
&gt;=C2=A0 =C2=A0 dnl &quot;install_as_default&quot; is set to false if gol=
d is the default linker.<br>
&gt;=C2=A0 =C2=A0 dnl &quot;installed_linker&quot; is the installed BFD lin=
ker name.<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/ld.h b/ld/ld.h<br>
&gt; -index 54d9079678c..9f0163b2911 100644<br>
&gt; +index 0dee944cf2a..83bd82d2a2e 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/ld.h<br>
&gt;=C2=A0 =C2=A0+++ b/ld/ld.h<br>
&gt;=C2=A0 =C2=A0@@ -166,6 +166,14 @@ typedef struct<br>
&gt; @@ -158,10 +158,10 @@ index 54d9079678c..9f0163b2911 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 enum endian_enum endian;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0diff --git a/ld/ld.texi b/ld/ld.texi<br>
&gt; -index 4fda259a552..22685f5f1dd 100644<br>
&gt; +index 89e3913317a..178908edf32 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/ld.texi<br>
&gt;=C2=A0 =C2=A0+++ b/ld/ld.texi<br>
&gt; -@@ -3119,6 +3119,18 @@ creation of the metadata note, if one had been=
 enabled by an earlier<br>
&gt; +@@ -3245,6 +3245,18 @@ creation of the metadata note, if one had been=
 enabled by an earlier<br>
&gt;=C2=A0 =C2=A0 occurrence of the --package-metadata option.<br>
&gt;=C2=A0 =C2=A0 If the linker has been built with libjansson, then the JS=
ON string<br>
&gt;=C2=A0 =C2=A0 will be validated.<br>
&gt; @@ -181,14 +181,13 @@ index 4fda259a552..22685f5f1dd 100644<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 @c man end<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/ldfile.c b/ld/ldfile.c<br>
&gt; -index dc9875d8813..49d899ee49d 100644<br>
&gt; +index 87be885d31a..86c8a5b267d 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/ldfile.c<br>
&gt;=C2=A0 =C2=A0+++ b/ld/ldfile.c<br>
&gt; -@@ -327,6 +327,23 @@ ldfile_add_library_path (const char *name, bool =
cmdline)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0new_dirs-&gt;name =3D concat (ld_sysroot, name + =
strlen (&quot;$SYSROOT&quot;), (const char *) NULL);<br>
&gt; -=C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0new_dirs-&gt;name =3D xstrdup (name);<br>
&gt; -+<br>
&gt; +@@ -344,6 +344,22 @@ ldfile_add_library_path (const char *name, enum =
search_dir_source source)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0search_tail_ptr =3D &amp;new_dirs-&gt;next=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0+#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES<br>
&gt;=C2=A0 =C2=A0+=C2=A0 if (command_line.poison_system_directories<br>
&gt;=C2=A0 =C2=A0+=C2=A0 &amp;&amp; ((!strncmp (name, &quot;/lib&quot;, 4))=
<br>
&gt; @@ -205,16 +204,16 @@ index dc9875d8813..49d899ee49d 100644<br>
&gt;=C2=A0 =C2=A0+=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0+#endif<br>
&gt;=C2=A0 =C2=A0+<br>
&gt; +=C2=A0 =C2=A0return new_dirs;<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; - /* Try to open a BFD for a lang_input_statement.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/ldlex.h b/ld/ldlex.h<br>
&gt; -index 161a9d4d8dc..757fe2f7650 100644<br>
&gt; +index defe3fcbbb9..aea75a25dc8 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/ldlex.h<br>
&gt;=C2=A0 =C2=A0+++ b/ld/ldlex.h<br>
&gt; -@@ -147,6 +147,8 @@ enum option_values<br>
&gt; -=C2=A0 =C2=A0OPTION_PLUGIN,<br>
&gt; +@@ -149,6 +149,8 @@ enum option_values<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OPTION_PLUGIN_OPT,<br>
&gt; +=C2=A0 =C2=A0OPTION_PLUGIN_SAVE_TEMPS,<br>
&gt;=C2=A0 =C2=A0 #endif /* BFD_SUPPORTS_PLUGINS */<br>
&gt;=C2=A0 =C2=A0+=C2=A0 OPTION_NO_POISON_SYSTEM_DIRECTORIES,<br>
&gt;=C2=A0 =C2=A0+=C2=A0 OPTION_ERROR_POISON_SYSTEM_DIRECTORIES,<br>
&gt; @@ -222,10 +221,10 @@ index 161a9d4d8dc..757fe2f7650 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OPTION_PRINT_OUTPUT_FORMAT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OPTION_PRINT_SYSROOT,<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/ldmain.c b/ld/ldmain.c<br>
&gt; -index 01b306e58a1..eddefc24332 100644<br>
&gt; +index 2f500d73c58..8b1bf7ad6aa 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/ldmain.c<br>
&gt;=C2=A0 =C2=A0+++ b/ld/ldmain.c<br>
&gt; -@@ -326,6 +326,8 @@ main (int argc, char **argv)<br>
&gt; +@@ -348,6 +348,8 @@ main (int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 command_line.warn_mismatch =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 command_line.warn_search_mismatch =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 command_line.check_section_addresses =3D -1;<br>
&gt; @@ -234,7 +233,7 @@ index 01b306e58a1..eddefc24332 100644<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* We initialize DEMANGLING based on the environme=
nt variable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0COLLECT_NO_DEMANGLE.=C2=A0 The gcc co=
llect2 program will demangle the<br>
&gt; -@@ -1458,7 +1460,7 @@ undefined_symbol (struct bfd_link_info *info,<b=
r>
&gt; +@@ -1489,7 +1491,7 @@ undefined_symbol (struct bfd_link_info *info,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv[1] =3D &quot;undefined-symbol&q=
uot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv[2] =3D (char *) name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv[3] =3D NULL;<br>
&gt; @@ -243,7 +242,7 @@ index 01b306e58a1..eddefc24332 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (verbose)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0einfo (_(&quot;%P: About to run error handli=
ng script &#39;%s&#39; with arguments: &#39;%s&#39; &#39;%s&#39;\n&quot;),<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv[0], argv[1], argv=
[2]);<br>
&gt; -@@ -1479,7 +1481,7 @@ undefined_symbol (struct bfd_link_info *info,<b=
r>
&gt; +@@ -1510,7 +1512,7 @@ undefined_symbol (struct bfd_link_info *info,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 carry on to issue the normal error message.=
=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 #endif /* SUPPORT_ERROR_HANDLING_SCRIPT */<br>
&gt; @@ -253,10 +252,10 @@ index 01b306e58a1..eddefc24332 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (error_count &lt; MAX_ERRORS_IN_A=
_ROW)<br>
&gt;=C2=A0 =C2=A0diff --git a/ld/lexsup.c b/ld/lexsup.c<br>
&gt; -index 099dff8ecde..e9939000b2e 100644<br>
&gt; +index 4aa0124ce2f..65c90d48332 100644<br>
&gt;=C2=A0 =C2=A0--- a/ld/lexsup.c<br>
&gt;=C2=A0 =C2=A0+++ b/ld/lexsup.c<br>
&gt; -@@ -642,6 +642,14 @@ static const struct ld_option ld_options[] =3D<b=
r>
&gt; +@@ -648,6 +648,14 @@ static const struct ld_option ld_options[] =3D<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;method&gt; is: share-unconflicte=
d (default),\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0share-duplicated&quot;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 TWO_DASHES },<br>
&gt; @@ -271,7 +270,7 @@ index 099dff8ecde..e9939000b2e 100644<br>
&gt;=C2=A0 =C2=A0 };<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 #define OPTION_COUNT ARRAY_SIZE (ld_options)<br>
&gt; -@@ -1818,6 +1826,13 @@ parse_args (unsigned argc, char **argv)<br>
&gt; +@@ -1834,6 +1842,13 @@ parse_args (unsigned argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case OPTION_PRINT_MAP_LOCALS:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config.print_map_locals =3D true;<br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils/0007-fix-the-inco=
rrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binuti=
ls/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch<b=
r>
&gt; index f9fa0d4f78d..7144b7d18de 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-a=
ssembling-for-ppc-wait-mnemonic.patch<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-a=
ssembling-for-ppc-wait-mnemonic.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From d35fd95eee9930ab41d9ad637eacb35aa9fe6f44 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From bfc643d4044dccc917549f2db439cff165512b02 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Zhenhua Luo &lt;<a href=3D"mailto:zhenhua.luo@nxp.co=
m" target=3D"_blank">zhenhua.luo@nxp.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Sat, 11 Jun 2016 22:08:29 -0500<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] fix the incorrect assembling for ppc wait=
 mnemonic<br>
&gt; diff --git a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-=
2.4.patch b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.pa=
tch<br>
&gt; index 05f1ed0dc55..19dc7ab7bda 100644<br>
&gt; --- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.pat=
ch<br>
&gt; +++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.pat=
ch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From da089ddacb6506f406acd8939389183a4356ebf0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From a5272ced746039b50606ebeb311c38adad49a817 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 =C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0Date: Sun, 14 Feb 2016 17:04:07 +0000<br>
&gt;=C2=A0 =C2=A0Subject: [PATCH] Use libtool 2.4<br>
&gt; @@ -27,11 +27,11 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 gprofng/src/Makefile.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0 ld/Makefile.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +<br>
&gt;=C2=A0 =C2=A0 ld/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1694 ++++++++++++----<br>
&gt; - libbacktrace/Makefile.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 108 +-<br>
&gt; + libbacktrace/Makefile.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 112 +-<br>
&gt;=C2=A0 =C2=A0 libbacktrace/aclocal.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A073 +-<br>
&gt;=C2=A0 =C2=A0 libbacktrace/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1441 +++++++++----<br>
&gt;=C2=A0 =C2=A0 libctf/Makefile.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt; - libctf/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1334 +++++++++---<br>
&gt; + libctf/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1330 +++++++++---<br>
&gt;=C2=A0 =C2=A0 libsframe/Makefile.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 344 ++--<br>
&gt;=C2=A0 =C2=A0 libsframe/aclocal.m4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 220 +-<br>
&gt;=C2=A0 =C2=A0 libsframe/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 1553 ++++++++++----<br>
&gt; @@ -44,10 +44,10 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 opcodes/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1331 +++++++++---<br>
&gt;=C2=A0 =C2=A0 zlib/Makefile.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +<br>
&gt;=C2=A0 =C2=A0 zlib/configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1331 +++++++++---<br>
&gt; - 35 files changed, 16094 insertions(+), 6104 deletions(-)<br>
&gt; + 35 files changed, 16090 insertions(+), 6108 deletions(-)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0diff --git a/bfd/Makefile.in b/bfd/Makefile.in<br>
&gt; -index faaa0c424b8..5371e093163 100644<br>
&gt; +index b3d97d478ea..8c19e1766fa 100644<br>
&gt;=C2=A0 =C2=A0--- a/bfd/Makefile.in<br>
&gt;=C2=A0 =C2=A0+++ b/bfd/Makefile.in<br>
&gt;=C2=A0 =C2=A0@@ -340,6 +340,7 @@ DATADIRNAME =3D @DATADIRNAME@<br>
&gt; @@ -75,7 +75,7 @@ index faaa0c424b8..5371e093163 100644<br>
&gt;=C2=A0 =C2=A0 ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@<br>
&gt;=C2=A0 =C2=A0 all_backends =3D @all_backends@<br>
&gt;=C2=A0 =C2=A0diff --git a/bfd/configure b/bfd/configure<br>
&gt; -index acbac2f364a..a53a9d52719 100755<br>
&gt; +index 9fe9cf6919f..37b2e6c3393 100755<br>
&gt;=C2=A0 =C2=A0--- a/bfd/configure<br>
&gt;=C2=A0 =C2=A0+++ b/bfd/configure<br>
&gt;=C2=A0 =C2=A0@@ -712,6 +712,9 @@ OTOOL<br>
&gt; @@ -105,7 +105,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-mmap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0try using mmap for BFD input files if available<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-separate-debug-dir=3DDIR<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Look for global separate debug info in D=
IR<br>
&gt; -@@ -5063,8 +5069,8 @@ esac<br>
&gt; +@@ -5061,8 +5067,8 @@ esac<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -116,7 +116,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -5104,7 +5110,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO<br>
&gt; +@@ -5102,7 +5108,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO<br>
&gt;=C2=A0 =C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking ho=
w to print strings&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 $as_echo_n &quot;checking how to print strings... &quot; =
&gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 # Test print first, because it will be a builtin if prese=
nt.<br>
&gt; @@ -125,7 +125,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test &quot;X`print -r -- $ECHO 2&gt;/dev/nul=
l`&quot; =3D &quot;X$ECHO&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ECHO=3D&#39;print -r --&#39;<br>
&gt;=C2=A0 =C2=A0 elif test &quot;X`printf %s $ECHO 2&gt;/dev/null`&quot; =
=3D &quot;X$ECHO&quot;; then<br>
&gt; -@@ -5797,8 +5803,8 @@ $as_echo_n &quot;checking whether the shell und=
erstands some XSI constructs... &quot; &gt;&amp;6;<br>
&gt; +@@ -5795,8 +5801,8 @@ $as_echo_n &quot;checking whether the shell und=
erstands some XSI constructs... &quot; &gt;&amp;6;<br>
&gt;=C2=A0 =C2=A0 # Try some XSI features<br>
&gt;=C2=A0 =C2=A0 xsi_shell=3Dno<br>
&gt;=C2=A0 =C2=A0 ( _lt_dummy=3D&quot;a/b/c&quot;<br>
&gt; @@ -136,7 +136,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; eval &#39;test $(( 1 + 1 )) -eq =
2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; test &quot;${#_lt_dummy}&quot; -=
eq 5&#39; ) &gt;/dev/null 2&gt;&amp;1 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &amp;&amp; xsi_shell=3Dyes<br>
&gt; -@@ -5847,6 +5853,80 @@ esac<br>
&gt; +@@ -5845,6 +5851,80 @@ esac<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -217,7 +217,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking fo=
r $LD option to reload object files&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 $as_echo_n &quot;checking for $LD option to reload object=
 files... &quot; &gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 if ${lt_cv_ld_reload_flag+:} false; then :<br>
&gt; -@@ -5863,6 +5943,11 @@ case $reload_flag in<br>
&gt; +@@ -5861,6 +5941,11 @@ case $reload_flag in<br>
&gt;=C2=A0 =C2=A0 esac<br>
&gt;=C2=A0 =C2=A0 reload_cmds=3D&#39;$LD$reload_flag -o $output$reload_objs=
&#39;<br>
&gt;=C2=A0 =C2=A0 case $host_os in<br>
&gt; @@ -229,7 +229,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 darwin*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reload_cmds=3D&#39;$LTCC $LTCFLAGS -=
nostdlib ${wl}-r -o $output$reload_objs&#39;<br>
&gt; -@@ -6031,7 +6116,8 @@ mingw* | pw32*)<br>
&gt; +@@ -6029,7 +6114,8 @@ mingw* | pw32*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_cv_deplibs_check_method=3D&#39;file_magi=
c ^x86 archive import|^x86 DLL&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_cv_file_magic_cmd=3D&#39;func_win32_libi=
d&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; @@ -239,7 +239,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_cv_file_magic_cmd=3D&#39;$OBJDUMP -f&#39=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; -@@ -6190,6 +6276,21 @@ esac<br>
&gt; +@@ -6188,6 +6274,21 @@ esac<br>
&gt;=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: result: $lt=
_cv_deplibs_check_method&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 $as_echo &quot;$lt_cv_deplibs_check_method&quot; &gt;&amp=
;6; }<br>
&gt; @@ -261,7 +261,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 file_magic_cmd=3D$lt_cv_file_magic_cmd<br>
&gt;=C2=A0 =C2=A0 deplibs_check_method=3D$lt_cv_deplibs_check_method<br>
&gt;=C2=A0 =C2=A0 test -z &quot;$deplibs_check_method&quot; &amp;&amp; depl=
ibs_check_method=3Dunknown<br>
&gt; -@@ -6205,6 +6306,157 @@ test -z &quot;$deplibs_check_method&quot; &am=
p;&amp; deplibs_check_method=3Dunknown<br>
&gt; +@@ -6203,6 +6304,157 @@ test -z &quot;$deplibs_check_method&quot; &am=
p;&amp; deplibs_check_method=3Dunknown<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -419,7 +419,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 plugin_option=3D<br>
&gt;=C2=A0 =C2=A0 plugin_names=3D&quot;liblto_plugin.so liblto_plugin-0.dll=
 cyglto_plugin-0.dll&quot;<br>
&gt;=C2=A0 =C2=A0 for plugin in $plugin_names; do<br>
&gt; -@@ -6219,8 +6471,10 @@ for plugin in $plugin_names; do<br>
&gt; +@@ -6217,8 +6469,10 @@ for plugin in $plugin_names; do<br>
&gt;=C2=A0 =C2=A0 done<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 if test -n &quot;$ac_tool_prefix&quot;; then<br>
&gt; @@ -432,7 +432,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking fo=
r $ac_word&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 $as_echo_n &quot;checking for $ac_word... &quot; &gt;&amp=
;6; }<br>
&gt;=C2=A0 =C2=A0 if ${ac_cv_prog_AR+:} false; then :<br>
&gt; -@@ -6236,7 +6490,7 @@ do<br>
&gt; +@@ -6234,7 +6488,7 @@ do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 test -z &quot;$as_dir&quot; &amp;&amp; as_dir=3D.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 for ac_exec_ext in &#39;&#39; $ac_executabl=
e_extensions; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if as_fn_executable_p &quot;$as_dir/$ac_word$ac_ex=
ec_ext&quot;; then<br>
&gt; @@ -441,7 +441,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 $as_echo &quot;$as_me:${as_lineno-$LINENO}:=
 found $as_dir/$ac_word$ac_exec_ext&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 break 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -@@ -6256,11 +6510,15 @@ $as_echo &quot;no&quot; &gt;&amp;6; }<br>
&gt; +@@ -6254,11 +6508,15 @@ $as_echo &quot;no&quot; &gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -460,7 +460,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking fo=
r $ac_word&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 $as_echo_n &quot;checking for $ac_word... &quot; &gt;&amp=
;6; }<br>
&gt;=C2=A0 =C2=A0 if ${ac_cv_prog_ac_ct_AR+:} false; then :<br>
&gt; -@@ -6276,7 +6534,7 @@ do<br>
&gt; +@@ -6274,7 +6532,7 @@ do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 test -z &quot;$as_dir&quot; &amp;&amp; as_dir=3D.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 for ac_exec_ext in &#39;&#39; $ac_executabl=
e_extensions; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if as_fn_executable_p &quot;$as_dir/$ac_word$ac_ex=
ec_ext&quot;; then<br>
&gt; @@ -469,7 +469,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 $as_echo &quot;$as_me:${as_lineno-$LINENO}:=
 found $as_dir/$ac_word$ac_exec_ext&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 break 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -@@ -6295,6 +6553,10 @@ else<br>
&gt; +@@ -6293,6 +6551,10 @@ else<br>
&gt;=C2=A0 =C2=A0 $as_echo &quot;no&quot; &gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -480,7 +480,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if test &quot;x$ac_ct_AR&quot; =3D x; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 AR=3D&quot;false&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; -@@ -6306,25 +6568,20 @@ ac_tool_warned=3Dyes ;;<br>
&gt; +@@ -6304,25 +6566,20 @@ ac_tool_warned=3Dyes ;;<br>
&gt;=C2=A0 =C2=A0 esac<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 AR=3D$ac_ct_AR<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; @@ -516,7 +516,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -6335,6 +6592,63 @@ test -z &quot;$AR_FLAGS&quot; &amp;&amp; AR_FL=
AGS=3Dcru<br>
&gt; +@@ -6333,6 +6590,63 @@ test -z &quot;$AR_FLAGS&quot; &amp;&amp; AR_FL=
AGS=3Dcru<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -580,7 +580,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 if test -n &quot;$ac_tool_prefix&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Extract the first word of &quot;${ac_tool_prefix=
}strip&quot;, so it can be a program name with args.<br>
&gt; -@@ -6675,8 +6989,8 @@ esac<br>
&gt; +@@ -6673,8 +6987,8 @@ esac<br>
&gt;=C2=A0 =C2=A0 lt_cv_sys_global_symbol_to_cdecl=3D&quot;sed -n -e &#39;s=
/^T .* \(.*\)$/extern int \1();/p&#39; -e &#39;s/^$symcode* .* \(.*\)$/exte=
rn char \1;/p&#39;&quot;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 # Transform an extracted symbol line into symbol name and=
 symbol address<br>
&gt; @@ -591,7 +591,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 # Handle CRLF in mingw tool chain<br>
&gt;=C2=A0 =C2=A0 opt_cr=3D<br>
&gt; -@@ -6712,6 +7026,7 @@ for ac_symprfx in &quot;&quot; &quot;_&quot;; d=
o<br>
&gt; +@@ -6710,6 +7024,7 @@ for ac_symprfx in &quot;&quot; &quot;_&quot;; d=
o<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_cv_sys_global_symbol_pipe=3D&quot;sed -n=
 -e &#39;s/^.*[=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]\($symcode$symcode*\)[=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0][=C2=A0 =C2=A0 =C2=A0 ]*$ac_symprfx$sympat$=
opt_cr$/$symxfrm/p&#39;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; @@ -599,7 +599,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Check to see that the pipe works correctly.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pipe_works=3Dno<br>
&gt; -@@ -6753,6 +7068,18 @@ _LT_EOF<br>
&gt; +@@ -6751,6 +7066,18 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $GREP &#39; nm_test_var$&#39; &qu=
ot;$nlist&quot; &gt;/dev/null; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if $GREP &#39; nm_test_func$&#39; &quot;$nli=
st&quot; &gt;/dev/null; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat &lt;&lt;_LT_EOF &gt; conftest.$ac=
_ext<br>
&gt; @@ -618,7 +618,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 #ifdef __cplusplus<br>
&gt;=C2=A0 =C2=A0 extern &quot;C&quot; {<br>
&gt;=C2=A0 =C2=A0 #endif<br>
&gt; -@@ -6764,7 +7091,7 @@ _LT_EOF<br>
&gt; +@@ -6762,7 +7089,7 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat &lt;&lt;_LT_EOF &gt;&gt; conftest=
.$ac_ext<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 /* The mapping between symbol names and symbols.=C2=A0 */=
<br>
&gt; @@ -627,7 +627,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const char *name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 void=C2=A0 =C2=A0 =C2=A0 =C2=A0*address;<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt; -@@ -6790,8 +7117,8 @@ static const void *lt_preloaded_setup() {<br>
&gt; +@@ -6788,8 +7115,8 @@ static const void *lt_preloaded_setup() {<br>
&gt;=C2=A0 =C2=A0 _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Now try linking the two files.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv conftest.$ac_objext conftstm.$ac_o=
bjext<br>
&gt; @@ -638,7 +638,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIBS=3D&quot;conftstm.$ac_objext&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;$CFLAGS$lt_prog_compil=
er_no_builtin_flag&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if { { eval echo &quot;\&quot;\$as_me=
\&quot;:${as_lineno-$LINENO}: \&quot;$ac_link\&quot;&quot;; } &gt;&amp;5<br=
>
&gt; -@@ -6801,8 +7128,8 @@ _LT_EOF<br>
&gt; +@@ -6799,8 +7126,8 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 test $ac_status =3D 0; } &amp;&amp; test -s confte=
st${ac_exeext}; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pipe_works=3Dyes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; @@ -649,7 +649,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;cannot find nm_test_func i=
n $nlist&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -@@ -6839,6 +7166,14 @@ else<br>
&gt; +@@ -6837,6 +7164,14 @@ else<br>
&gt;=C2=A0 =C2=A0 $as_echo &quot;ok&quot; &gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -664,7 +664,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -6857,6 +7192,47 @@ fi<br>
&gt; +@@ -6855,6 +7190,47 @@ fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -712,7 +712,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -7066,6 +7442,123 @@ esac<br>
&gt; +@@ -7064,6 +7440,123 @@ esac<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 need_locks=3D&quot;$enable_libtool_lock&quot;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -836,7 +836,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 case $host_os in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 rhapsody* | darwin*)<br>
&gt; -@@ -7629,6 +8122,8 @@ _LT_EOF<br>
&gt; +@@ -7627,6 +8120,8 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $LTCC $LTCFLAGS -c -o conftest.o con=
ftest.c 2&gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$AR cru libconftest.a con=
ftest.o&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $AR cru libconftest.a conftest.o 2&g=
t;&amp;5<br>
&gt; @@ -845,7 +845,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt; conftest.c &lt;&lt; _LT_EOF=
<br>
&gt;=C2=A0 =C2=A0 int main() { return 0;}<br>
&gt;=C2=A0 =C2=A0 _LT_EOF<br>
&gt; -@@ -8182,8 +8677,6 @@ fi<br>
&gt; +@@ -8180,8 +8675,6 @@ fi<br>
&gt;=C2=A0 =C2=A0 lt_prog_compiler_pic=3D<br>
&gt;=C2=A0 =C2=A0 lt_prog_compiler_static=3D<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -854,7 +854,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_wl=3D&#39;-Wl,&#39;<br>
&gt; -@@ -8349,6 +8842,12 @@ $as_echo_n &quot;checking for $compiler option=
 to produce PIC... &quot; &gt;&amp;6; }<br>
&gt; +@@ -8347,6 +8840,12 @@ $as_echo_n &quot;checking for $compiler option=
 to produce PIC... &quot; &gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lt_prog_compiler_pic=3D&#39;--shared&#39;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lt_prog_compiler_static=3D&#39;--static&#39;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; @@ -867,7 +867,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgcc* | pgf77* | pgf90* | pgf95* | p=
gfortran*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Portland Group compilers (*=
not* the Pentium gcc compiler,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# which looks to be a dead project)<br>
&gt; -@@ -8411,7 +8910,7 @@ $as_echo_n &quot;checking for $compiler option =
to produce PIC... &quot; &gt;&amp;6; }<br>
&gt; +@@ -8409,7 +8908,7 @@ $as_echo_n &quot;checking for $compiler option =
to produce PIC... &quot; &gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic=3D&#39;-KPIC&#3=
9;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_static=3D&#39;-Bsta=
tic&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case $cc_basename in<br>
&gt; @@ -876,7 +876,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lt_prog_compiler_wl=3D&#39;-Qoption ld &#39;=
;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lt_prog_compiler_wl=3D&#39;-Wl,&#39;;;<br>
&gt; -@@ -8468,13 +8967,17 @@ case $host_os in<br>
&gt; +@@ -8466,13 +8965,17 @@ case $host_os in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic=3D&quot;$lt_prog_compi=
ler_pic -DPIC&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 esac<br>
&gt; @@ -900,7 +900,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 #<br>
&gt;=C2=A0 =C2=A0 # Check to make sure the PIC flag actually works.<br>
&gt; -@@ -8535,6 +9038,11 @@ fi<br>
&gt; +@@ -8533,6 +9036,11 @@ fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -912,7 +912,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 #<br>
&gt;=C2=A0 =C2=A0 # Check to make sure the static flag actually works.<br>
&gt;=C2=A0 =C2=A0 #<br>
&gt; -@@ -8885,7 +9393,8 @@ _LT_EOF<br>
&gt; +@@ -8883,7 +9391,8 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_undefined_flag=3Dunsupported<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 always_export_symbols=3Dno<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_shared_with_static_runtimes=
=3Dyes<br>
&gt; @@ -922,7 +922,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $LD --help 2&gt;&amp;1 | $GREP &#=
39;auto-import&#39; &gt; /dev/null; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$CC -shar=
ed $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enabl=
e-auto-image-base -Xlinker --out-implib -Xlinker $lib&#39;<br>
&gt; -@@ -8984,12 +9493,12 @@ _LT_EOF<br>
&gt; +@@ -8982,12 +9491,12 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0whole_archive_flag_spec=3D&#39;--whol=
e-archive$convenience --no-whole-archive&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hardcode_libdir_flag_spec=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hardcode_libdir_flag_spec_ld=3D&#39;-=
rpath $libdir&#39;<br>
&gt; @@ -937,7 +937,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt; -@@ -9003,8 +9512,8 @@ _LT_EOF<br>
&gt; +@@ -9001,8 +9510,8 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0archive_cmds=3D&#39;$LD -Bshareable $libobjs=
 $deplibs $linker_flags -o $lib&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wlarc=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; @@ -948,7 +948,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -9022,8 +9531,8 @@ _LT_EOF<br>
&gt; +@@ -9020,8 +9529,8 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif $LD --help 2&gt;&amp;1 | $GREP =
&#39;: supported targets:.* elf&#39; &gt; /dev/null; then<br>
&gt; @@ -959,7 +959,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ld_shlibs=3Dno<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -@@ -9069,8 +9578,8 @@ _LT_EOF<br>
&gt; +@@ -9067,8 +9576,8 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $LD --help 2&gt;&amp;1 | $GREP &#=
39;: supported targets:.* elf&#39; &gt; /dev/null; then<br>
&gt; @@ -970,7 +970,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ld_shlibs=3Dno<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -@@ -9200,7 +9709,13 @@ _LT_EOF<br>
&gt; +@@ -9198,7 +9707,13 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0allow_undefined_flag=3D&#39;-berok&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Determine the default libpa=
th from the value encoded in an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # empty executable.<br>
&gt; @@ -985,7 +985,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 /* end confdefs.h.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 int<br>
&gt; -@@ -9213,22 +9728,29 @@ main ()<br>
&gt; +@@ -9211,22 +9726,29 @@ main ()<br>
&gt;=C2=A0 =C2=A0 _ACEOF<br>
&gt;=C2=A0 =C2=A0 if ac_fn_c_try_link &quot;$LINENO&quot;; then :<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -1028,7 +1028,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D&=
#39;${wl}-blibpath:$libdir:&#39;&quot;$aix_libpath&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_expsym_cmds=3D&#39;$C=
C -o $output_objdir/$soname $libobjs $deplibs &#39;&quot;\${wl}$no_entry_fl=
ag&quot;&#39; $compiler_flags `if test &quot;x${allow_undefined_flag}&quot;=
 !=3D &quot;x&quot;; then func_echo_all &quot;${wl}${allow_undefined_flag}&=
quot;; else :; fi` &#39;&quot;\${wl}$exp_sym_flag:\$export_symbols $shared_=
flag&quot;<br>
&gt; -@@ -9240,7 +9762,13 @@ if test -z &quot;$aix_libpath&quot;; then aix_=
libpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt; +@@ -9238,7 +9760,13 @@ if test -z &quot;$aix_libpath&quot;; then aix_=
libpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Determine the default libpath from the va=
lue encoded in an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # empty executable.<br>
&gt; @@ -1043,7 +1043,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 /* end confdefs.h.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 int<br>
&gt; -@@ -9253,22 +9781,29 @@ main ()<br>
&gt; +@@ -9251,22 +9779,29 @@ main ()<br>
&gt;=C2=A0 =C2=A0 _ACEOF<br>
&gt;=C2=A0 =C2=A0 if ac_fn_c_try_link &quot;$LINENO&quot;; then :<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -1086,7 +1086,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D&#39;${wl}-blib=
path:$libdir:&#39;&quot;$aix_libpath&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Warning - without using the other r=
un time loading flags,<br>
&gt; -@@ -9313,20 +9848,63 @@ if test -z &quot;$aix_libpath&quot;; then aix=
_libpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt; +@@ -9311,20 +9846,63 @@ if test -z &quot;$aix_libpath&quot;; then aix=
_libpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Microsoft Visual C++.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # hardcode_libdir_flag_spec is actua=
lly meaningless, as there is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # no search path for DLLs.<br>
&gt; @@ -1164,7 +1164,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 darwin* | rhapsody*)<br>
&gt; -@@ -9387,7 +9965,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_l=
ibpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt; +@@ -9385,7 +9963,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_l=
ibpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # FreeBSD 3 and greater uses gcc -shared to=
 do shared libraries.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 freebsd* | dragonfly*)<br>
&gt; @@ -1173,7 +1173,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D&#39;-R$=
libdir&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_direct=3Dyes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_shlibpath_var=3Dno<br>
&gt; -@@ -9395,7 +9973,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_l=
ibpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt; +@@ -9393,7 +9971,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_l=
ibpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 hpux9*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; th=
en<br>
&gt; @@ -1182,7 +1182,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0archive_cmds=3D&#39;$RM $output_objdir/$sona=
me~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $l=
inker_flags~test $output_objdir/$soname =3D $lib || mv $output_objdir/$sona=
me $lib&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -@@ -9411,7 +9989,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_l=
ibpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt; +@@ -9409,7 +9987,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_l=
ibpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 hpux10*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes &am=
p;&amp; test &quot;$with_gnu_ld&quot; =3D no; then<br>
&gt; @@ -1191,7 +1191,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0archive_cmds=3D&#39;$LD -b +h $soname +b $in=
stall_libdir -o $lib $libobjs $deplibs $linker_flags&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -@@ -9435,10 +10013,10 @@ if test -z &quot;$aix_libpath&quot;; then ai=
x_libpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt; +@@ -9433,10 +10011,10 @@ if test -z &quot;$aix_libpath&quot;; then ai=
x_libpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0archive_cmds=3D&#39;$CC -shared ${wl}=
+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_fl=
ags&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ia64*)<br>
&gt; @@ -1204,7 +1204,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; -@@ -9517,23 +10095,36 @@ fi<br>
&gt; +@@ -9515,23 +10093,36 @@ fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 irix5* | irix6* | nonstopux*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; th=
en<br>
&gt; @@ -1249,7 +1249,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0archive_cmds=3D&#39;$CC -shared $libobjs $de=
plibs $compiler_flags -soname $soname `test -n &quot;$verstring&quot; &amp;=
&amp; func_echo_all &quot;-set_version $verstring&quot;` -update_registry $=
{output_objdir}/so_locations -o $lib&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0archive_expsym_cmds=3D&#39;$CC -shared $libo=
bjs $deplibs $compiler_flags -soname $soname `test -n &quot;$verstring&quot=
; &amp;&amp; func_echo_all &quot;-set_version $verstring&quot;` -update_reg=
istry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib&#=
39;<br>
&gt; -@@ -9618,7 +10209,7 @@ rm -f core conftest.err conftest.$ac_objext \<=
br>
&gt; +@@ -9616,7 +10207,7 @@ rm -f core conftest.err conftest.$ac_objext \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 osf4* | osf5*) # as osf3* with the addition=
 of -msym flag<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; th=
en<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0allow_undefined_flag=3D&#39; ${wl}-expect_un=
resolved ${wl}\*&#39;<br>
&gt; @@ -1258,7 +1258,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hardcode_libdir_flag_spec=3D&#39;${wl}-rpath=
 ${wl}$libdir&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0allow_undefined_flag=3D&#39; -expect_unresol=
ved \*&#39;<br>
&gt; -@@ -9637,9 +10228,9 @@ rm -f core conftest.err conftest.$ac_objext \<=
br>
&gt; +@@ -9635,9 +10226,9 @@ rm -f core conftest.err conftest.$ac_objext \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no_undefined_flag=3D&#39; -z defs&#3=
9;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; th=
en<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wlarc=3D&#39;${wl}&#39;<br>
&gt; @@ -1270,7 +1270,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case `$CC -V 2&gt;&amp;1` in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*&quot;Compilers 5.0&quot;*)<br>
&gt; -@@ -10215,8 +10806,9 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
&gt; +@@ -10213,8 +10804,9 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 need_version=3Dno<br>
&gt;=C2=A0 =C2=A0 =C2=A0 need_lib_prefix=3Dno<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -1282,7 +1282,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 library_names_spec=3D&#39;$libname.dll.a&#3=
9;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # DLL is installed to $(libdir)/../bin by p=
ostinstall_cmds<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 postinstall_cmds=3D&#39;base_file=3D`basena=
me \${file}`~<br>
&gt; -@@ -10249,13 +10841,71 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
&gt; +@@ -10247,13 +10839,71 @@ cygwin* | mingw* | pw32* | cegcc*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 library_names_spec=3D&#39;`echo ${li=
bname} | sed -e &#39;s/^lib/pw/&#39;``echo ${release} | $SED -e &#39;s/[.]/=
-/g&#39;`${versuffix}${shared_ext}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
&gt; @@ -1355,16 +1355,16 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # FIXME: first we should search . and the director=
y the executable is in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 shlibpath_var=3DPATH<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; -@@ -11157,7 +11807,7 @@ else<br>
&gt; +@@ -11155,7 +11805,7 @@ else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_us=
core=3D2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 lt_status=3D$lt_dlunknown<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cat &gt; conftest.$ac_ext &lt;&lt;_LT_EOF<br>
&gt; --#line 11160 &quot;configure&quot;<br>
&gt; +-#line 11158 &quot;configure&quot;<br>
&gt;=C2=A0 =C2=A0+#line $LINENO &quot;configure&quot;<br>
&gt;=C2=A0 =C2=A0 #include &quot;confdefs.h&quot;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 #if HAVE_DLFCN_H<br>
&gt; -@@ -11201,10 +11851,10 @@ else<br>
&gt; +@@ -11199,10 +11849,10 @@ else<br>
&gt;=C2=A0 =C2=A0 /* When -fvisbility=3Dhidden is used, assume the code has=
 been annotated<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0correspondingly for the symbols needed.=C2=
=A0 */<br>
&gt;=C2=A0 =C2=A0 #if defined(__GNUC__) &amp;&amp; (((__GNUC__ =3D=3D 3) &a=
mp;&amp; (__GNUC_MINOR__ &gt;=3D 3)) || (__GNUC__ &gt; 3))<br>
&gt; @@ -1377,16 +1377,16 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 int main ()<br>
&gt;=C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR=
_NOW);<br>
&gt; -@@ -11263,7 +11913,7 @@ else<br>
&gt; +@@ -11261,7 +11911,7 @@ else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_us=
core=3D2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 lt_status=3D$lt_dlunknown<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cat &gt; conftest.$ac_ext &lt;&lt;_LT_EOF<br>
&gt; --#line 11266 &quot;configure&quot;<br>
&gt; +-#line 11264 &quot;configure&quot;<br>
&gt;=C2=A0 =C2=A0+#line $LINENO &quot;configure&quot;<br>
&gt;=C2=A0 =C2=A0 #include &quot;confdefs.h&quot;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 #if HAVE_DLFCN_H<br>
&gt; -@@ -11307,10 +11957,10 @@ else<br>
&gt; +@@ -11305,10 +11955,10 @@ else<br>
&gt;=C2=A0 =C2=A0 /* When -fvisbility=3Dhidden is used, assume the code has=
 been annotated<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0correspondingly for the symbols needed.=C2=
=A0 */<br>
&gt;=C2=A0 =C2=A0 #if defined(__GNUC__) &amp;&amp; (((__GNUC__ =3D=3D 3) &a=
mp;&amp; (__GNUC_MINOR__ &gt;=3D 3)) || (__GNUC__ &gt; 3))<br>
&gt; @@ -1399,7 +1399,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 int main ()<br>
&gt;=C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR=
_NOW);<br>
&gt; -@@ -15691,7 +16341,7 @@ SHARED_LDFLAGS=3D<br>
&gt; +@@ -15689,7 +16339,7 @@ SHARED_LDFLAGS=3D<br>
&gt;=C2=A0 =C2=A0 if test &quot;$enable_shared&quot; =3D &quot;yes&quot;; t=
hen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 x=3D`sed -n -e &#39;s/^[=C2=A0 =C2=A0 =C2=A0 =C2=
=A0]*PICFLAG[=C2=A0 =C2=A0 =C2=A0 ]*=3D[=C2=A0 =C2=A0 ]*//p&#39; &lt; ../li=
biberty/Makefile | sed -n &#39;$p&#39;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if test -n &quot;$x&quot;; then<br>
&gt; @@ -1408,7 +1408,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -18313,13 +18963,20 @@ exeext=3D&#39;`$ECHO &quot;$exeext&quot; | =
$SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt; +@@ -18316,13 +18966,20 @@ exeext=3D&#39;`$ECHO &quot;$exeext&quot; | =
$SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0 lt_unset=3D&#39;`$ECHO &quot;$lt_unset&quot; | $SED &quot=
;$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0 lt_SP2NL=3D&#39;`$ECHO &quot;$lt_SP2NL&quot; | $SED &quot=
;$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0 lt_NL2SP=3D&#39;`$ECHO &quot;$lt_NL2SP&quot; | $SED &quot=
;$delay_single_quote_subst&quot;`&#39;<br>
&gt; @@ -1429,7 +1429,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 STRIP=3D&#39;`$ECHO &quot;$STRIP&quot; | $SED &quot;$dela=
y_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0 RANLIB=3D&#39;`$ECHO &quot;$RANLIB&quot; | $SED &quot;$de=
lay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0 old_postinstall_cmds=3D&#39;`$ECHO &quot;$old_postinstall=
_cmds&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt; -@@ -18334,14 +18991,17 @@ lt_cv_sys_global_symbol_pipe=3D&#39;`$ECHO =
&quot;$lt_cv_sys_global_symbol_pipe&quot; | $SED &quot;$de<br>
&gt; +@@ -18337,14 +18994,17 @@ lt_cv_sys_global_symbol_pipe=3D&#39;`$ECHO =
&quot;$lt_cv_sys_global_symbol_pipe&quot; | $SED &quot;$de<br>
&gt;=C2=A0 =C2=A0 lt_cv_sys_global_symbol_to_cdecl=3D&#39;`$ECHO &quot;$lt_=
cv_sys_global_symbol_to_cdecl&quot; | $SED &quot;$delay_single_quote_subst&=
quot;`&#39;<br>
&gt;=C2=A0 =C2=A0 lt_cv_sys_global_symbol_to_c_name_address=3D&#39;`$ECHO &=
quot;$lt_cv_sys_global_symbol_to_c_name_address&quot; | $SED &quot;$delay_s=
ingle_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0 lt_cv_sys_global_symbol_to_c_name_address_lib_prefix=3D&#=
39;`$ECHO &quot;$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix&quot;=
 | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt; @@ -1448,7 +1448,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 DSYMUTIL=3D&#39;`$ECHO &quot;$DSYMUTIL&quot; | $SED &quot=
;$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0 NMEDIT=3D&#39;`$ECHO &quot;$NMEDIT&quot; | $SED &quot;$de=
lay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0 LIPO=3D&#39;`$ECHO &quot;$LIPO&quot; | $SED &quot;$delay_=
single_quote_subst&quot;`&#39;<br>
&gt; -@@ -18374,12 +19034,12 @@ hardcode_shlibpath_var=3D&#39;`$ECHO &quot;=
$hardcode_shlibpath_var&quot; | $SED &quot;$delay_single_q<br>
&gt; +@@ -18377,12 +19037,12 @@ hardcode_shlibpath_var=3D&#39;`$ECHO &quot;=
$hardcode_shlibpath_var&quot; | $SED &quot;$delay_single_q<br>
&gt;=C2=A0 =C2=A0 hardcode_automatic=3D&#39;`$ECHO &quot;$hardcode_automati=
c&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0 inherit_rpath=3D&#39;`$ECHO &quot;$inherit_rpath&quot; | =
$SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0 link_all_deplibs=3D&#39;`$ECHO &quot;$link_all_deplibs&qu=
ot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt; @@ -1462,7 +1462,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 file_list_spec=3D&#39;`$ECHO &quot;$file_list_spec&quot; =
| $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt;=C2=A0 =C2=A0 variables_saved_for_relink=3D&#39;`$ECHO &quot;$variables=
_saved_for_relink&quot; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<=
br>
&gt;=C2=A0 =C2=A0 need_lib_prefix=3D&#39;`$ECHO &quot;$need_lib_prefix&quot=
; | $SED &quot;$delay_single_quote_subst&quot;`&#39;<br>
&gt; -@@ -18434,8 +19094,13 @@ reload_flag \<br>
&gt; +@@ -18437,8 +19097,13 @@ reload_flag \<br>
&gt;=C2=A0 =C2=A0 OBJDUMP \<br>
&gt;=C2=A0 =C2=A0 deplibs_check_method \<br>
&gt;=C2=A0 =C2=A0 file_magic_cmd \<br>
&gt; @@ -1476,7 +1476,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 STRIP \<br>
&gt;=C2=A0 =C2=A0 RANLIB \<br>
&gt;=C2=A0 =C2=A0 CC \<br>
&gt; -@@ -18445,12 +19110,14 @@ lt_cv_sys_global_symbol_pipe \<br>
&gt; +@@ -18448,12 +19113,14 @@ lt_cv_sys_global_symbol_pipe \<br>
&gt;=C2=A0 =C2=A0 lt_cv_sys_global_symbol_to_cdecl \<br>
&gt;=C2=A0 =C2=A0 lt_cv_sys_global_symbol_to_c_name_address \<br>
&gt;=C2=A0 =C2=A0 lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \<br=
>
&gt; @@ -1492,7 +1492,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 DSYMUTIL \<br>
&gt;=C2=A0 =C2=A0 NMEDIT \<br>
&gt;=C2=A0 =C2=A0 LIPO \<br>
&gt; -@@ -18466,7 +19133,6 @@ no_undefined_flag \<br>
&gt; +@@ -18469,7 +19136,6 @@ no_undefined_flag \<br>
&gt;=C2=A0 =C2=A0 hardcode_libdir_flag_spec \<br>
&gt;=C2=A0 =C2=A0 hardcode_libdir_flag_spec_ld \<br>
&gt;=C2=A0 =C2=A0 hardcode_libdir_separator \<br>
&gt; @@ -1500,7 +1500,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 exclude_expsyms \<br>
&gt;=C2=A0 =C2=A0 include_expsyms \<br>
&gt;=C2=A0 =C2=A0 file_list_spec \<br>
&gt; -@@ -18502,6 +19168,7 @@ module_cmds \<br>
&gt; +@@ -18505,6 +19171,7 @@ module_cmds \<br>
&gt;=C2=A0 =C2=A0 module_expsym_cmds \<br>
&gt;=C2=A0 =C2=A0 export_symbols_cmds \<br>
&gt;=C2=A0 =C2=A0 prelink_cmds \<br>
&gt; @@ -1508,7 +1508,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 postinstall_cmds \<br>
&gt;=C2=A0 =C2=A0 postuninstall_cmds \<br>
&gt;=C2=A0 =C2=A0 finish_cmds \<br>
&gt; -@@ -19278,7 +19945,8 @@ $as_echo X&quot;$file&quot; |<br>
&gt; +@@ -19281,7 +19948,8 @@ $as_echo X&quot;$file&quot; |<br>
&gt;=C2=A0 =C2=A0 # NOTE: Changes made to this file will be lost: look at l=
tmain.sh.<br>
&gt;=C2=A0 =C2=A0 #<br>
&gt;=C2=A0 =C2=A0 #=C2=A0 =C2=A0Copyright (C) 1996, 1997, 1998, 1999, 2000,=
 2001, 2003, 2004, 2005,<br>
&gt; @@ -1518,7 +1518,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 #=C2=A0 =C2=A0Written by Gordon Matzigkeit, 1996<br>
&gt;=C2=A0 =C2=A0 #<br>
&gt;=C2=A0 =C2=A0 #=C2=A0 =C2=A0This file is part of GNU Libtool.<br>
&gt; -@@ -19381,19 +20049,42 @@ SP2NL=3D$lt_lt_SP2NL<br>
&gt; +@@ -19384,19 +20052,42 @@ SP2NL=3D$lt_lt_SP2NL<br>
&gt;=C2=A0 =C2=A0 # turn newlines into spaces.<br>
&gt;=C2=A0 =C2=A0 NL2SP=3D$lt_lt_NL2SP<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -1562,7 +1562,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 # A symbol stripping program.<br>
&gt;=C2=A0 =C2=A0 STRIP=3D$lt_STRIP<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -19423,6 +20114,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_=
sys_global_symbol_to_c_name_address<br>
&gt; +@@ -19426,6 +20117,12 @@ global_symbol_to_c_name_address=3D$lt_lt_cv_=
sys_global_symbol_to_c_name_address<br>
&gt;=C2=A0 =C2=A0 # Transform the output of nm in a C name address pair whe=
n lib prefix is needed.<br>
&gt;=C2=A0 =C2=A0 global_symbol_to_c_name_address_lib_prefix=3D$lt_lt_cv_sy=
s_global_symbol_to_c_name_address_lib_prefix<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -1575,7 +1575,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 # The name of the directory that contains temporary libto=
ol files.<br>
&gt;=C2=A0 =C2=A0 objdir=3D$objdir<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -19432,6 +20129,9 @@ MAGIC_CMD=3D$MAGIC_CMD<br>
&gt; +@@ -19435,6 +20132,9 @@ MAGIC_CMD=3D$MAGIC_CMD<br>
&gt;=C2=A0 =C2=A0 # Must we lock files when doing compilation?<br>
&gt;=C2=A0 =C2=A0 need_locks=3D$lt_need_locks<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -1585,7 +1585,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 # Tool to manipulate archived DWARF debug symbol files on=
 Mac OS X.<br>
&gt;=C2=A0 =C2=A0 DSYMUTIL=3D$lt_DSYMUTIL<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -19546,12 +20246,12 @@ with_gcc=3D$GCC<br>
&gt; +@@ -19549,12 +20249,12 @@ with_gcc=3D$GCC<br>
&gt;=C2=A0 =C2=A0 # Compiler flag to turn off builtin functions.<br>
&gt;=C2=A0 =C2=A0 no_builtin_flag=3D$lt_lt_prog_compiler_no_builtin_flag<br=
>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -1601,7 +1601,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 # Compiler flag to prevent dynamic linking.<br>
&gt;=C2=A0 =C2=A0 link_static_flag=3D$lt_lt_prog_compiler_static<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -19638,9 +20338,6 @@ inherit_rpath=3D$inherit_rpath<br>
&gt; +@@ -19641,9 +20341,6 @@ inherit_rpath=3D$inherit_rpath<br>
&gt;=C2=A0 =C2=A0 # Whether libtool must link a program against all its dep=
endency libraries.<br>
&gt;=C2=A0 =C2=A0 link_all_deplibs=3D$link_all_deplibs<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -1611,7 +1611,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 # Set to &quot;yes&quot; if exported symbols are required=
.<br>
&gt;=C2=A0 =C2=A0 always_export_symbols=3D$always_export_symbols<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -19656,6 +20353,9 @@ include_expsyms=3D$lt_include_expsyms<br>
&gt; +@@ -19659,6 +20356,9 @@ include_expsyms=3D$lt_include_expsyms<br>
&gt;=C2=A0 =C2=A0 # Commands necessary for linking programs (against librar=
ies) with templates.<br>
&gt;=C2=A0 =C2=A0 prelink_cmds=3D$lt_prelink_cmds<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -1621,7 +1621,7 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 # Specify filename containing input files.<br>
&gt;=C2=A0 =C2=A0 file_list_spec=3D$lt_file_list_spec<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -19688,210 +20388,169 @@ ltmain=3D&quot;$ac_aux_dir/ltmain.sh&quot=
;<br>
&gt; +@@ -19691,210 +20391,169 @@ ltmain=3D&quot;$ac_aux_dir/ltmain.sh&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # if finds mixed CR/LF and LF-only lines.=C2=A0 Si=
nce sed operates in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # text mode, it properly converts lines to CR/LF.=
=C2=A0 This bash problem<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # is reportedly fixed, but why not run on old vers=
ions too?<br>
&gt; @@ -1996,10 +1996,10 @@ index acbac2f364a..a53a9d52719 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 chmod +x &quot;$ofile&quot;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0diff --git a/bfd/<a href=3D"http://configure.ac" rel=3D"no=
referrer" target=3D"_blank">configure.ac</a> b/bfd/<a href=3D"http://config=
ure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; -index 7fcc5d4a947..f7191d3f30f 100644<br>
&gt; +index 6bcfd1b7368..6aedf387cb9 100644<br>
&gt;=C2=A0 =C2=A0--- a/bfd/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
&gt;=C2=A0 =C2=A0+++ b/bfd/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
&gt; -@@ -276,7 +276,7 @@ changequote(,)dnl<br>
&gt; +@@ -275,7 +275,7 @@ changequote(,)dnl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 x=3D`sed -n -e &#39;s/^[=C2=A0 =C2=A0 =C2=A0 =C2=
=A0]*PICFLAG[=C2=A0 =C2=A0 =C2=A0 ]*=3D[=C2=A0 =C2=A0 ]*//p&#39; &lt; ../li=
biberty/Makefile | sed -n &#39;$p&#39;`<br>
&gt;=C2=A0 =C2=A0 changequote([,])dnl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if test -n &quot;$x&quot;; then<br>
&gt; @@ -2009,7 +2009,7 @@ index 7fcc5d4a947..f7191d3f30f 100644<br>
&gt;=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0diff --git a/binutils/Makefile.in b/binutils/Makefile.in<b=
r>
&gt; -index 842a6d99b54..037cccde038 100644<br>
&gt; +index 67fa5b3b8d9..3273426119c 100644<br>
&gt;=C2=A0 =C2=A0--- a/binutils/Makefile.in<br>
&gt;=C2=A0 =C2=A0+++ b/binutils/Makefile.in<br>
&gt;=C2=A0 =C2=A0@@ -495,6 +495,7 @@ DEBUGINFOD_LIBS =3D @DEBUGINFOD_LIBS@<=
br>
&gt; @@ -2037,7 +2037,7 @@ index 842a6d99b54..037cccde038 100644<br>
&gt;=C2=A0 =C2=A0 ac_ct_DUMPBIN =3D @ac_ct_DUMPBIN@<br>
&gt;=C2=A0 =C2=A0 am__include =3D @am__include@<br>
&gt;=C2=A0 =C2=A0diff --git a/binutils/configure b/binutils/configure<br>
&gt; -index a1092735311..f3bdee98f3f 100755<br>
&gt; +index e97f4cba053..6e6e08b350a 100755<br>
&gt;=C2=A0 =C2=A0--- a/binutils/configure<br>
&gt;=C2=A0 =C2=A0+++ b/binutils/configure<br>
&gt;=C2=A0 =C2=A0@@ -704,8 +704,11 @@ OTOOL<br>
&gt; @@ -2069,7 +2069,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-debuginfod=C2=A0 =C2=A0 =C2=A0 =C2=A0Enable=
 debuginfo lookups with debuginfod<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (auto/yes/no)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --with-gnu-ld=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0assume the C compiler uses GNU ld default=3Dno<br>
&gt; -@@ -4958,8 +4964,8 @@ esac<br>
&gt; +@@ -4956,8 +4962,8 @@ esac<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -2080,7 +2080,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -4999,7 +5005,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO<br>
&gt; +@@ -4997,7 +5003,7 @@ ECHO=3D$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO<br>
&gt;=C2=A0 =C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking ho=
w to print strings&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 $as_echo_n &quot;checking how to print strings... &quot; =
&gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 # Test print first, because it will be a builtin if prese=
nt.<br>
&gt; @@ -2089,7 +2089,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test &quot;X`print -r -- $ECHO 2&gt;/dev/nul=
l`&quot; =3D &quot;X$ECHO&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ECHO=3D&#39;print -r --&#39;<br>
&gt;=C2=A0 =C2=A0 elif test &quot;X`printf %s $ECHO 2&gt;/dev/null`&quot; =
=3D &quot;X$ECHO&quot;; then<br>
&gt; -@@ -5692,8 +5698,8 @@ $as_echo_n &quot;checking whether the shell und=
erstands some XSI constructs... &quot; &gt;&amp;6;<br>
&gt; +@@ -5690,8 +5696,8 @@ $as_echo_n &quot;checking whether the shell und=
erstands some XSI constructs... &quot; &gt;&amp;6;<br>
&gt;=C2=A0 =C2=A0 # Try some XSI features<br>
&gt;=C2=A0 =C2=A0 xsi_shell=3Dno<br>
&gt;=C2=A0 =C2=A0 ( _lt_dummy=3D&quot;a/b/c&quot;<br>
&gt; @@ -2100,7 +2100,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; eval &#39;test $(( 1 + 1 )) -eq =
2 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; test &quot;${#_lt_dummy}&quot; -=
eq 5&#39; ) &gt;/dev/null 2&gt;&amp;1 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &amp;&amp; xsi_shell=3Dyes<br>
&gt; -@@ -5742,6 +5748,80 @@ esac<br>
&gt; +@@ -5740,6 +5746,80 @@ esac<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -2181,7 +2181,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking fo=
r $LD option to reload object files&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 $as_echo_n &quot;checking for $LD option to reload object=
 files... &quot; &gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 if ${lt_cv_ld_reload_flag+:} false; then :<br>
&gt; -@@ -5758,6 +5838,11 @@ case $reload_flag in<br>
&gt; +@@ -5756,6 +5836,11 @@ case $reload_flag in<br>
&gt;=C2=A0 =C2=A0 esac<br>
&gt;=C2=A0 =C2=A0 reload_cmds=3D&#39;$LD$reload_flag -o $output$reload_objs=
&#39;<br>
&gt;=C2=A0 =C2=A0 case $host_os in<br>
&gt; @@ -2193,7 +2193,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 darwin*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reload_cmds=3D&#39;$LTCC $LTCFLAGS -=
nostdlib ${wl}-r -o $output$reload_objs&#39;<br>
&gt; -@@ -5926,7 +6011,8 @@ mingw* | pw32*)<br>
&gt; +@@ -5924,7 +6009,8 @@ mingw* | pw32*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_cv_deplibs_check_method=3D&#39;file_magi=
c ^x86 archive import|^x86 DLL&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_cv_file_magic_cmd=3D&#39;func_win32_libi=
d&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; @@ -2203,7 +2203,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_cv_file_magic_cmd=3D&#39;$OBJDUMP -f&#39=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; -@@ -6085,6 +6171,21 @@ esac<br>
&gt; +@@ -6083,6 +6169,21 @@ esac<br>
&gt;=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: result: $lt=
_cv_deplibs_check_method&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 $as_echo &quot;$lt_cv_deplibs_check_method&quot; &gt;&amp=
;6; }<br>
&gt; @@ -2225,7 +2225,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 file_magic_cmd=3D$lt_cv_file_magic_cmd<br>
&gt;=C2=A0 =C2=A0 deplibs_check_method=3D$lt_cv_deplibs_check_method<br>
&gt;=C2=A0 =C2=A0 test -z &quot;$deplibs_check_method&quot; &amp;&amp; depl=
ibs_check_method=3Dunknown<br>
&gt; -@@ -6100,6 +6201,157 @@ test -z &quot;$deplibs_check_method&quot; &am=
p;&amp; deplibs_check_method=3Dunknown<br>
&gt; +@@ -6098,6 +6199,157 @@ test -z &quot;$deplibs_check_method&quot; &am=
p;&amp; deplibs_check_method=3Dunknown<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -2383,7 +2383,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 plugin_option=3D<br>
&gt;=C2=A0 =C2=A0 plugin_names=3D&quot;liblto_plugin.so liblto_plugin-0.dll=
 cyglto_plugin-0.dll&quot;<br>
&gt;=C2=A0 =C2=A0 for plugin in $plugin_names; do<br>
&gt; -@@ -6114,8 +6366,10 @@ for plugin in $plugin_names; do<br>
&gt; +@@ -6112,8 +6364,10 @@ for plugin in $plugin_names; do<br>
&gt;=C2=A0 =C2=A0 done<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 if test -n &quot;$ac_tool_prefix&quot;; then<br>
&gt; @@ -2396,7 +2396,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking fo=
r $ac_word&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 $as_echo_n &quot;checking for $ac_word... &quot; &gt;&amp=
;6; }<br>
&gt;=C2=A0 =C2=A0 if ${ac_cv_prog_AR+:} false; then :<br>
&gt; -@@ -6131,7 +6385,7 @@ do<br>
&gt; +@@ -6129,7 +6383,7 @@ do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 test -z &quot;$as_dir&quot; &amp;&amp; as_dir=3D.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 for ac_exec_ext in &#39;&#39; $ac_executabl=
e_extensions; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if as_fn_executable_p &quot;$as_dir/$ac_word$ac_ex=
ec_ext&quot;; then<br>
&gt; @@ -2405,7 +2405,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 $as_echo &quot;$as_me:${as_lineno-$LINENO}:=
 found $as_dir/$ac_word$ac_exec_ext&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 break 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -@@ -6151,11 +6405,15 @@ $as_echo &quot;no&quot; &gt;&amp;6; }<br>
&gt; +@@ -6149,11 +6403,15 @@ $as_echo &quot;no&quot; &gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -2424,7 +2424,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 { $as_echo &quot;$as_me:${as_lineno-$LINENO}: checking fo=
r $ac_word&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 $as_echo_n &quot;checking for $ac_word... &quot; &gt;&amp=
;6; }<br>
&gt;=C2=A0 =C2=A0 if ${ac_cv_prog_ac_ct_AR+:} false; then :<br>
&gt; -@@ -6171,7 +6429,7 @@ do<br>
&gt; +@@ -6169,7 +6427,7 @@ do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 test -z &quot;$as_dir&quot; &amp;&amp; as_dir=3D.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 for ac_exec_ext in &#39;&#39; $ac_executabl=
e_extensions; do<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if as_fn_executable_p &quot;$as_dir/$ac_word$ac_ex=
ec_ext&quot;; then<br>
&gt; @@ -2433,7 +2433,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 $as_echo &quot;$as_me:${as_lineno-$LINENO}:=
 found $as_dir/$ac_word$ac_exec_ext&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 break 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -@@ -6190,6 +6448,10 @@ else<br>
&gt; +@@ -6188,6 +6446,10 @@ else<br>
&gt;=C2=A0 =C2=A0 $as_echo &quot;no&quot; &gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -2444,7 +2444,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if test &quot;x$ac_ct_AR&quot; =3D x; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 AR=3D&quot;false&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else<br>
&gt; -@@ -6201,25 +6463,19 @@ ac_tool_warned=3Dyes ;;<br>
&gt; +@@ -6199,25 +6461,19 @@ ac_tool_warned=3Dyes ;;<br>
&gt;=C2=A0 =C2=A0 esac<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 AR=3D$ac_ct_AR<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; @@ -2479,7 +2479,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -6231,6 +6487,64 @@ test -z &quot;$AR_FLAGS&quot; &amp;&amp; AR_FL=
AGS=3Dcru<br>
&gt; +@@ -6229,6 +6485,64 @@ test -z &quot;$AR_FLAGS&quot; &amp;&amp; AR_FL=
AGS=3Dcru<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -2544,7 +2544,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 if test -n &quot;$ac_tool_prefix&quot;; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Extract the first word of &quot;${ac_tool_prefix=
}strip&quot;, so it can be a program name with args.<br>
&gt;=C2=A0 =C2=A0 set dummy ${ac_tool_prefix}strip; ac_word=3D$2<br>
&gt; -@@ -6570,8 +6884,8 @@ esac<br>
&gt; +@@ -6568,8 +6882,8 @@ esac<br>
&gt;=C2=A0 =C2=A0 lt_cv_sys_global_symbol_to_cdecl=3D&quot;sed -n -e &#39;s=
/^T .* \(.*\)$/extern int \1();/p&#39; -e &#39;s/^$symcode* .* \(.*\)$/exte=
rn char \1;/p&#39;&quot;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 # Transform an extracted symbol line into symbol name and=
 symbol address<br>
&gt; @@ -2555,7 +2555,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 # Handle CRLF in mingw tool chain<br>
&gt;=C2=A0 =C2=A0 opt_cr=3D<br>
&gt; -@@ -6607,6 +6921,7 @@ for ac_symprfx in &quot;&quot; &quot;_&quot;; d=
o<br>
&gt; +@@ -6605,6 +6919,7 @@ for ac_symprfx in &quot;&quot; &quot;_&quot;; d=
o<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_cv_sys_global_symbol_pipe=3D&quot;sed -n=
 -e &#39;s/^.*[=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0]\($symcode$symcode*\)[=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0][=C2=A0 =C2=A0 =C2=A0 ]*$ac_symprfx$sympat$=
opt_cr$/$symxfrm/p&#39;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; @@ -2563,7 +2563,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Check to see that the pipe works correctly.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pipe_works=3Dno<br>
&gt; -@@ -6648,6 +6963,18 @@ _LT_EOF<br>
&gt; +@@ -6646,6 +6961,18 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $GREP &#39; nm_test_var$&#39; &qu=
ot;$nlist&quot; &gt;/dev/null; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if $GREP &#39; nm_test_func$&#39; &quot;$nli=
st&quot; &gt;/dev/null; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat &lt;&lt;_LT_EOF &gt; conftest.$ac=
_ext<br>
&gt; @@ -2582,7 +2582,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 #ifdef __cplusplus<br>
&gt;=C2=A0 =C2=A0 extern &quot;C&quot; {<br>
&gt;=C2=A0 =C2=A0 #endif<br>
&gt; -@@ -6659,7 +6986,7 @@ _LT_EOF<br>
&gt; +@@ -6657,7 +6984,7 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat &lt;&lt;_LT_EOF &gt;&gt; conftest=
.$ac_ext<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 /* The mapping between symbol names and symbols.=C2=A0 */=
<br>
&gt; @@ -2591,7 +2591,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const char *name;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 void=C2=A0 =C2=A0 =C2=A0 =C2=A0*address;<br>
&gt;=C2=A0 =C2=A0 }<br>
&gt; -@@ -6685,8 +7012,8 @@ static const void *lt_preloaded_setup() {<br>
&gt; +@@ -6683,8 +7010,8 @@ static const void *lt_preloaded_setup() {<br>
&gt;=C2=A0 =C2=A0 _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Now try linking the two files.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv conftest.$ac_objext conftstm.$ac_o=
bjext<br>
&gt; @@ -2602,7 +2602,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LIBS=3D&quot;conftstm.$ac_objext&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;$CFLAGS$lt_prog_compil=
er_no_builtin_flag&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if { { eval echo &quot;\&quot;\$as_me=
\&quot;:${as_lineno-$LINENO}: \&quot;$ac_link\&quot;&quot;; } &gt;&amp;5<br=
>
&gt; -@@ -6696,8 +7023,8 @@ _LT_EOF<br>
&gt; +@@ -6694,8 +7021,8 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 test $ac_status =3D 0; } &amp;&amp; test -s confte=
st${ac_exeext}; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pipe_works=3Dyes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; @@ -2613,7 +2613,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;cannot find nm_test_func i=
n $nlist&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -@@ -6734,6 +7061,18 @@ else<br>
&gt; +@@ -6732,6 +7059,18 @@ else<br>
&gt;=C2=A0 =C2=A0 $as_echo &quot;ok&quot; &gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -2632,7 +2632,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -6750,6 +7089,43 @@ fi<br>
&gt; +@@ -6748,6 +7087,43 @@ fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -2676,7 +2676,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -6961,6 +7337,123 @@ esac<br>
&gt; +@@ -6959,6 +7335,123 @@ esac<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 need_locks=3D&quot;$enable_libtool_lock&quot;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -2800,7 +2800,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 case $host_os in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 rhapsody* | darwin*)<br>
&gt; -@@ -7524,6 +8017,8 @@ _LT_EOF<br>
&gt; +@@ -7522,6 +8015,8 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $LTCC $LTCFLAGS -c -o conftest.o con=
ftest.c 2&gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;$AR cru libconftest.a con=
ftest.o&quot; &gt;&amp;5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $AR cru libconftest.a conftest.o 2&g=
t;&amp;5<br>
&gt; @@ -2809,7 +2809,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt; conftest.c &lt;&lt; _LT_EOF=
<br>
&gt;=C2=A0 =C2=A0 int main() { return 0;}<br>
&gt;=C2=A0 =C2=A0 _LT_EOF<br>
&gt; -@@ -8108,8 +8603,6 @@ fi<br>
&gt; +@@ -8106,8 +8601,6 @@ fi<br>
&gt;=C2=A0 =C2=A0 lt_prog_compiler_pic=3D<br>
&gt;=C2=A0 =C2=A0 lt_prog_compiler_static=3D<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -2818,7 +2818,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_wl=3D&#39;-Wl,&#39;<br>
&gt; -@@ -8275,6 +8768,12 @@ $as_echo_n &quot;checking for $compiler option=
 to produce PIC... &quot; &gt;&amp;6; }<br>
&gt; +@@ -8273,6 +8766,12 @@ $as_echo_n &quot;checking for $compiler option=
 to produce PIC... &quot; &gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lt_prog_compiler_pic=3D&#39;--shared&#39;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lt_prog_compiler_static=3D&#39;--static&#39;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; @@ -2831,7 +2831,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgcc* | pgf77* | pgf90* | pgf95* | p=
gfortran*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Portland Group compilers (*=
not* the Pentium gcc compiler,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# which looks to be a dead project)<br>
&gt; -@@ -8337,7 +8836,7 @@ $as_echo_n &quot;checking for $compiler option =
to produce PIC... &quot; &gt;&amp;6; }<br>
&gt; +@@ -8335,7 +8834,7 @@ $as_echo_n &quot;checking for $compiler option =
to produce PIC... &quot; &gt;&amp;6; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic=3D&#39;-KPIC&#3=
9;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_static=3D&#39;-Bsta=
tic&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case $cc_basename in<br>
&gt; @@ -2840,7 +2840,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lt_prog_compiler_wl=3D&#39;-Qoption ld &#39;=
;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lt_prog_compiler_wl=3D&#39;-Wl,&#39;;;<br>
&gt; -@@ -8394,13 +8893,17 @@ case $host_os in<br>
&gt; +@@ -8392,13 +8891,17 @@ case $host_os in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 lt_prog_compiler_pic=3D&quot;$lt_prog_compi=
ler_pic -DPIC&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 esac<br>
&gt; @@ -2864,7 +2864,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 #<br>
&gt;=C2=A0 =C2=A0 # Check to make sure the PIC flag actually works.<br>
&gt; -@@ -8461,6 +8964,11 @@ fi<br>
&gt; +@@ -8459,6 +8962,11 @@ fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -2876,7 +2876,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 #<br>
&gt;=C2=A0 =C2=A0 # Check to make sure the static flag actually works.<br>
&gt;=C2=A0 =C2=A0 #<br>
&gt; -@@ -8811,7 +9319,8 @@ _LT_EOF<br>
&gt; +@@ -8809,7 +9317,8 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_undefined_flag=3Dunsupported<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 always_export_symbols=3Dno<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enable_shared_with_static_runtimes=
=3Dyes<br>
&gt; @@ -2886,7 +2886,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $LD --help 2&gt;&amp;1 | $GREP &#=
39;auto-import&#39; &gt; /dev/null; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_cmds=3D&#39;$CC -shar=
ed $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enabl=
e-auto-image-base -Xlinker --out-implib -Xlinker $lib&#39;<br>
&gt; -@@ -8910,12 +9419,12 @@ _LT_EOF<br>
&gt; +@@ -8908,12 +9417,12 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0whole_archive_flag_spec=3D&#39;--whol=
e-archive$convenience --no-whole-archive&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hardcode_libdir_flag_spec=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hardcode_libdir_flag_spec_ld=3D&#39;-=
rpath $libdir&#39;<br>
&gt; @@ -2901,7 +2901,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt; -@@ -8929,8 +9438,8 @@ _LT_EOF<br>
&gt; +@@ -8927,8 +9436,8 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0archive_cmds=3D&#39;$LD -Bshareable $libobjs=
 $deplibs $linker_flags -o $lib&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wlarc=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; @@ -2912,7 +2912,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; -@@ -8948,8 +9457,8 @@ _LT_EOF<br>
&gt; +@@ -8946,8 +9455,8 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif $LD --help 2&gt;&amp;1 | $GREP =
&#39;: supported targets:.* elf&#39; &gt; /dev/null; then<br>
&gt; @@ -2923,7 +2923,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ld_shlibs=3Dno<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -@@ -8995,8 +9504,8 @@ _LT_EOF<br>
&gt; +@@ -8993,8 +9502,8 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 *)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if $LD --help 2&gt;&amp;1 | $GREP &#=
39;: supported targets:.* elf&#39; &gt; /dev/null; then<br>
&gt; @@ -2934,7 +2934,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ld_shlibs=3Dno<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -@@ -9126,7 +9635,13 @@ _LT_EOF<br>
&gt; +@@ -9124,7 +9633,13 @@ _LT_EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0allow_undefined_flag=3D&#39;-berok&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Determine the default libpa=
th from the value encoded in an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # empty executable.<br>
&gt; @@ -2949,7 +2949,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 /* end confdefs.h.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 int<br>
&gt; -@@ -9139,22 +9654,29 @@ main ()<br>
&gt; +@@ -9137,22 +9652,29 @@ main ()<br>
&gt;=C2=A0 =C2=A0 _ACEOF<br>
&gt;=C2=A0 =C2=A0 if ac_fn_c_try_link &quot;$LINENO&quot;; then :<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -2992,7 +2992,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D&=
#39;${wl}-blibpath:$libdir:&#39;&quot;$aix_libpath&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_expsym_cmds=3D&#39;$C=
C -o $output_objdir/$soname $libobjs $deplibs &#39;&quot;\${wl}$no_entry_fl=
ag&quot;&#39; $compiler_flags `if test &quot;x${allow_undefined_flag}&quot;=
 !=3D &quot;x&quot;; then func_echo_all &quot;${wl}${allow_undefined_flag}&=
quot;; else :; fi` &#39;&quot;\${wl}$exp_sym_flag:\$export_symbols $shared_=
flag&quot;<br>
&gt; -@@ -9166,7 +9688,13 @@ if test -z &quot;$aix_libpath&quot;; then aix_=
libpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt; +@@ -9164,7 +9686,13 @@ if test -z &quot;$aix_libpath&quot;; then aix_=
libpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Determine the default libpath from the va=
lue encoded in an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # empty executable.<br>
&gt; @@ -3007,7 +3007,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 /* end confdefs.h.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 int<br>
&gt; -@@ -9179,22 +9707,29 @@ main ()<br>
&gt; +@@ -9177,22 +9705,29 @@ main ()<br>
&gt;=C2=A0 =C2=A0 _ACEOF<br>
&gt;=C2=A0 =C2=A0 if ac_fn_c_try_link &quot;$LINENO&quot;; then :<br>
&gt;=C2=A0 =C2=A0 <br>
&gt; @@ -3050,7 +3050,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D&#39;${wl}-blib=
path:$libdir:&#39;&quot;$aix_libpath&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Warning - without using the other r=
un time loading flags,<br>
&gt; -@@ -9239,20 +9774,63 @@ if test -z &quot;$aix_libpath&quot;; then aix=
_libpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt; +@@ -9237,20 +9772,63 @@ if test -z &quot;$aix_libpath&quot;; then aix=
_libpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Microsoft Visual C++.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # hardcode_libdir_flag_spec is actua=
lly meaningless, as there is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # no search path for DLLs.<br>
&gt; @@ -3128,7 +3128,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 darwin* | rhapsody*)<br>
&gt; -@@ -9313,7 +9891,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_l=
ibpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt; +@@ -9311,7 +9889,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_l=
ibpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # FreeBSD 3 and greater uses gcc -shared to=
 do shared libraries.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 freebsd* | dragonfly*)<br>
&gt; @@ -3137,7 +3137,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_libdir_flag_spec=3D&#39;-R$=
libdir&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_direct=3Dyes<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hardcode_shlibpath_var=3Dno<br>
&gt; -@@ -9321,7 +9899,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_l=
ibpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt; +@@ -9319,7 +9897,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_l=
ibpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 hpux9*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes; th=
en<br>
&gt; @@ -3146,7 +3146,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0archive_cmds=3D&#39;$RM $output_objdir/$sona=
me~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $l=
inker_flags~test $output_objdir/$soname =3D $lib || mv $output_objdir/$sona=
me $lib&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -@@ -9337,7 +9915,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_l=
ibpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt; +@@ -9335,7 +9913,7 @@ if test -z &quot;$aix_libpath&quot;; then aix_l=
ibpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 hpux10*)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$GCC&quot; =3D yes &am=
p;&amp; test &quot;$with_gnu_ld&quot; =3D no; then<br>
&gt; @@ -3155,7 +3155,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0archive_cmds=3D&#39;$LD -b +h $soname +b $in=
stall_libdir -o $lib $libobjs $deplibs $linker_flags&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -@@ -9361,10 +9939,10 @@ if test -z &quot;$aix_libpath&quot;; then aix=
_libpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt; +@@ -9359,10 +9937,10 @@ if test -z &quot;$aix_libpath&quot;; then aix=
_libpath=3D&quot;/usr/lib:/lib&quot;; fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0archive_cmds=3D&#39;$CC -shared ${wl}=
+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_fl=
ags&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ia64*)<br>
&gt; @@ -3168,7 +3168,7 @@ index a1092735311..f3bdee98f3f 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; -@@ -9443,23 +10021,36 @@ fi<br>
&gt; +@@ -9441,23 +10019,36 @@ fi<br>
&gt;=C2=A0 =C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 irix5* | irix6* | </blockquote></div></div>

--00000000000017b02f061f4b8865--

