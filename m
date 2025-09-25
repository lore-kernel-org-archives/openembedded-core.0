Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD42CAC5AA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 05:01:46 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.4008.1758776497523966628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 22:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aK0K4ldK;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-eb380939a98so466716276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 22:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758776496; x=1759381296; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi7JpKBW4254RIY0BeU/A9kWcxJ3z+2YNLhaoZ+Ta5Y=;
        b=aK0K4ldK0dXJLC115YIRxN92SFERkUKM0VI0tB9BCeKauR09c20j3wz/P374M74Xb6
         23GSaltKd61j5LRfxj0veRig6l1/HpWixKjc29an2T2gyJZj+/TyOntq8nEQuQOXAhbr
         wmjxMr0lOqInReX96eqX3IF0Kck+RKKurIacq/cJxb+5aD0m482Qt1YNIFipWzGtUSrz
         Ky10icY3ufUjmDysoqbw3mYCi+NOaHaEGBRhU3l3T79pjv36qf94WGGxTitv50H9SO8S
         EUl9ZvyMxknza0ye2pTBWm8NxhWqxSxL1WtsHGcypiFFHT95DA+2Uzz3tbMGxmhV5Wpe
         Qe7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758776496; x=1759381296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pi7JpKBW4254RIY0BeU/A9kWcxJ3z+2YNLhaoZ+Ta5Y=;
        b=mZPxy0kpYB2xPb8g3Uq3pl1fDy/ump/KfnWYts2DJ8pxzeCxskyosxeSugNOxTiJtd
         e0PxPqqSMhoilsYxMEXRN9SPEf/TlLPS7Di5EjGDxKmUVJexqRecTcUae5HYnJJExkUf
         6OLSRSdVS73iVQ8HyXB0hwmuLWlIi/Jsqrj2Kbi2Y2sud1A5JogPO7KB0mSUkKC9D0uv
         TH/xED/NXzg2MvCz4xWuCiFq7zqlRzECNhKcXUbFAefvcUIwc3KQw+MQb7fOoZQOK9R4
         FxbVoFRqaPgYAyXCpJs4iBnpAh+VRdrgar1D6QK6OzEQOduyTBsVisY6pMAP5X/JZFUr
         tQxw==
X-Gm-Message-State: AOJu0YwHWm99wD9erDcgyPCDXdC3Oa2O0q/q2yu4cDxHC/nvceuU49bl
	EEV7aWKQqsYIVjui/OV5dsckH2XRCESGoxgFUbrqjGE37fhvKOaHctUyT/ISIq7YUpRjBmEhx2o
	O35tbIfR1uvz22B9BzOTV8QgYsjBfHtrivQHIphM=
X-Gm-Gg: ASbGncvtNMOtdR6BfjGIyZ0WaYkwfCtbBpjMLdp2REv0Zn0L/jzcjzkgHO7mUTfxNcH
	TVbf+qDUzAv4tpb97LZzOKgsmW2itZbc7ipPlX5y6lDzM0dYDVLmjR249Prr1MIF/F+bdmHaWwL
	QvHm/ec4Sgi0/Qlu8JF8GhGjPHyRVKk7WshIGvqQPRa0T/PIVMu7hlrYrYlklZe6xGzQBETgVA/
	OSx3RwMNEF1kFDQ+HpfZPFwagdF94UINtIAnwoGjsI0JCyNiMxD0+aYtxANdDx6D6/LyFlBYZdo
	9bhLQrpS2EnPs8bu6ozIFia3TDRJk+dYyc7Ych0=
X-Google-Smtp-Source: AGHT+IFA+xY8Q0qjDTonQUeYUVSyRW8QFPNZv6fIQ/sFFj9PMY4HcxSPRK19GoBkLQAPUVoA/9/O+JvgGFdVOjat0sc=
X-Received: by 2002:a05:6902:4a8b:b0:eb1:eb93:4029 with SMTP id
 3f1490d57ef6-eb37fc94f9fmr1974592276.26.1758776496250; Wed, 24 Sep 2025
 22:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250924120834.2886320-1-ross.burton@arm.com> <20250924120834.2886320-6-ross.burton@arm.com>
 <CAMKF1sqNX6evVHckndLkd8m=+GiPd-baPTGywcEJMWVvMkku1A@mail.gmail.com> <CAMKF1sr3VaEtA4prCFLdjJfkypD2JxaZ5v15zTL_5LGG4qW1Sg@mail.gmail.com>
In-Reply-To: <CAMKF1sr3VaEtA4prCFLdjJfkypD2JxaZ5v15zTL_5LGG4qW1Sg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Sep 2025 22:01:09 -0700
X-Gm-Features: AS18NWCB9BBaQrFdNUWKjKsjHTuk2FxGTZipx2IyCVNJU8sF2EM4yoIISUy-8Wc
Message-ID: <CAMKF1soVmdffXtGU=9naikbUEqJh-eeitgNQRiW7pZBG8ryHpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 6/7] clang: tell cross-builds of clang how to
 build natively
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 05:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223998

Nevermind, I guess we need this series and
https://lore.kernel.org/openembedded-core/20250924120745.2883969-1-ross.bur=
ton@arm.com/T/#t
together for cmake fixes. Once  I applied the second series things look bet=
ter.

On Wed, Sep 24, 2025 at 9:39=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> AB also showing same failure
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/953/st=
eps/14/logs/stdio
>
> On Wed, Sep 24, 2025 at 9:21=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > I am seeing that target clang is failing to build
> >
> > FAILED: [code=3D127] NATIVE/bin/clang-tidy-confusable-chars-gen
> > /mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/clang/21.1.1/b=
uild/NATIVE/bin/clang-tidy-confusable-chars-gen
> >
> > full compile log is here
> >
> > https://termbin.com/qct7
> >
> > On Wed, Sep 24, 2025 at 5:09=E2=80=AFAM Ross Burton via lists.openembed=
ded.org
> > <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> > >
> > > If we pass CROSS_TOOLCHAIN_FLAGS_NATIVE to all the builds, instead of
> > > just nativesdk, then clang can correctly build its own native tools a=
s
> > > needed.
> > >
> > > This means we can stop manually installing clang-tidy-confusable-char=
s-gen
> > > as clang-tidy will build it.  We (currently) still build the tblgen
> > > binaries once as they're used in several recipes so there's likely va=
lue
> > > in building those once.
> > >
> > > Also consolidate the LLVM_TABLEGEN variables as they're not specific =
to
> > > a particular class.
> > >
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  meta/recipes-devtools/clang/clang_git.bb | 9 +++------
> > >  1 file changed, 3 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-=
devtools/clang/clang_git.bb
> > > index 998c1731f2f..9ccb81a5308 100644
> > > --- a/meta/recipes-devtools/clang/clang_git.bb
> > > +++ b/meta/recipes-devtools/clang/clang_git.bb
> > > @@ -120,14 +120,13 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3D=
OFF \
> > >                    -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BUILD=
}' \
> > >                    -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=3D'${LLVM_EXP=
ERIMENTAL_TARGETS_TO_BUILD}' \
> > >                    -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} =
\
> > > -                  -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}=
/llvm-min-tblgen \
> > > +                  -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tb=
lgen \
> > > +                  -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llv=
m-tblgen \
> > >                    -DLLVM_INCLUDE_TESTS=3DOFF \
> > > +                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAI=
N_FILE=3D${WORKDIR}/toolchain-native.cmake' \
> > >  "
> > >
> > >  EXTRA_OECMAKE:append:class-nativesdk =3D "\
> > > -                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAI=
N_FILE=3D${WORKDIR}/toolchain-native.cmake' \
> > > -                  -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llv=
m-tblgen \
> > > -                  -DCLANG_TIDY_CONFUSABLE_CHARS_GEN=3D${STAGING_BIND=
IR_NATIVE}/clang-tidy-confusable-chars-gen \
> > >                    -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TAR=
GET_PREFIX}llvm-ranlib \
> > >                    -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_=
PREFIX}llvm-ar \
> > >                    -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_=
PREFIX}llvm-nm \
> > > @@ -205,7 +204,6 @@ do_install:append:class-native () {
> > >      if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'fals=
e', d)}; then
> > >          install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D=
}${bindir}/clangd-indexer
> > >      fi
> > > -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-=
chars-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
> > >
> > >      for f in `find ${D}${bindir} -executable -type f -not -type l`; =
do
> > >          test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
> > > @@ -225,7 +223,6 @@ do_install:append:class-nativesdk () {
> > >          install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D=
}${bindir}/clangd-indexer
> > >      fi
> > >      install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bin=
dir}/clang-tblgen
> > > -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-=
chars-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
> > >      for f in `find ${D}${bindir} -executable -type f -not -type l`; =
do
> > >          test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
> > >      done
> > > --
> > > 2.43.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#223972): https://lists.openembedded.org/g/openemb=
edded-core/message/223972
> > > Mute This Topic: https://lists.openembedded.org/mt/115410450/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

