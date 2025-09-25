Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3DECAC5A5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 04:22:26 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.3726.1758774145272195884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 21:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AgXicK4e;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-eb380939a98so449090276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 21:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758774144; x=1759378944; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2YqNFVqxB7YZwzjWHnikoMAeDvyshv4WsD9SGA5y4k=;
        b=AgXicK4ehi60HdQGcWWQ53V8PKFX+KGfV4lIkyxrhWvCfvvyaPAhw8KizBAYOj7LPx
         rdUzu8fAtoys1wgAPXQsg2DDhzehkl1qm851qFZ8ZGRWgi+SngtPko4VdgViuIkze5zp
         dputBOInIGxbGWbNL3RTXA86NDP7YXm20PcaJzqzYaSYY9bi3yXS0X+PsP6gvN+IufQc
         5mhUzOb440MXmf00LTATVgi4dgNdpzQRs9YAl8BU+A/7GRc1BY7fDy7tkBrZO0Tmzmyr
         eX9TQudWmQH3vozJCuk3SbDKXMZSzsqAjDMwrLAc4TWoaNukGamPAsWuaxfBcREGCruY
         6lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758774144; x=1759378944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z2YqNFVqxB7YZwzjWHnikoMAeDvyshv4WsD9SGA5y4k=;
        b=ll4lrHHCVJHq1tARYHuMBHz8oLxbJHEGuWbXq7vDMbTAyu7qt6fa6+3xMfzDEAl9Pm
         5ezzOkGvrgs8r3GV49ZfghYKBOjdtetMkLAE6tN38liT5sigllyV/WFYOuamJVu9dKSZ
         aGORW2GDX38apKb2KGWXWPPOcraRYH1BUGQvxHQEeesJCHZmpMolcHjhAy31wClQlVGJ
         gnbPw4DZ0tW4c3sRxkjMHfZH/zV36VvYeE6Pf05vzWUfxNIjX0AN58i5UDpSHuEyk/6B
         5sx3SRz0G6mIr+oEY3Vec0H5UFw/Ut/DCJDDuErgFTsgCIQHA9la0CWF5QyAx4nWakCO
         YUnw==
X-Gm-Message-State: AOJu0Yx2cTAj0iu3gk9cOvjx2eQSxhnzeeeaghBfnpTSKLCJmsFK1qHd
	1k2sBU1V/Odeoo7iMIruLu/uPlGVZkYUSM4PXo+hfh4EgRtLs8q9jHByMULZSn006fCQHblS0fg
	ae39N9o9QJlvwjxk225sIdV/8j6FqZeHJIGhcgwU=
X-Gm-Gg: ASbGnctb9IrBFL2l5wnJwkwQ74Zckukmi/AwjNaZYRcpj82NyO89Q5HgXSlgy3IzJHG
	6C/E4UtIbN3oTu+WHoJJ2TcmgwncDpckpcI++dbb0ycI+tcG0N9AlG5yvftmA19kYf8KhKnjcma
	SzULM7K/JB/0AJYJ+F+2bZTRen+WmCjuD3kUgpyJbJoE1zuh0n8wePXcx0VQploQvGJhagzJelx
	X+2INdBgxY5tfx4NrsQ6bxy0i/WpTC9xszkLwm+AFnA8sBW4/+dABobiW+jrus4B7Letu7s9yBl
	GHofUDGVlMylZtrHybW+aqRIL1l+6CB5vDTjPAs=
X-Google-Smtp-Source: AGHT+IHSMhZ6JimI+wQtkf0xTLVKGEe3EANbOjr2eFOLQVpe2u4YFxSY+yefl4db/EzC4vHpId4wdWAEFCmYjS+7zK8=
X-Received: by 2002:a05:6902:3110:b0:eb3:7993:77b5 with SMTP id
 3f1490d57ef6-eb37fc951bfmr1664231276.27.1758774144167; Wed, 24 Sep 2025
 21:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250924120834.2886320-1-ross.burton@arm.com> <20250924120834.2886320-6-ross.burton@arm.com>
In-Reply-To: <20250924120834.2886320-6-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Sep 2025 21:21:56 -0700
X-Gm-Features: AS18NWCEqXnPBpxkqaLGPW88RvAB98j_1oV9q6ra8DVy0X5BdWshvRurftgnPZ0
Message-ID: <CAMKF1sqNX6evVHckndLkd8m=+GiPd-baPTGywcEJMWVvMkku1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 6/7] clang: tell cross-builds of clang how to
 build natively
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 04:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223996

I am seeing that target clang is failing to build

FAILED: [code=3D127] NATIVE/bin/clang-tidy-confusable-chars-gen
/mnt/b/yoe/master/build/tmp/work/riscv64imafdc-yoe-linux/clang/21.1.1/build=
/NATIVE/bin/clang-tidy-confusable-chars-gen

full compile log is here

https://termbin.com/qct7

On Wed, Sep 24, 2025 at 5:09=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> If we pass CROSS_TOOLCHAIN_FLAGS_NATIVE to all the builds, instead of
> just nativesdk, then clang can correctly build its own native tools as
> needed.
>
> This means we can stop manually installing clang-tidy-confusable-chars-ge=
n
> as clang-tidy will build it.  We (currently) still build the tblgen
> binaries once as they're used in several recipes so there's likely value
> in building those once.
>
> Also consolidate the LLVM_TABLEGEN variables as they're not specific to
> a particular class.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/clang/clang_git.bb | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
> index 998c1731f2f..9ccb81a5308 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -120,14 +120,13 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF =
\
>                    -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BUILD}' \
>                    -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=3D'${LLVM_EXPERIM=
ENTAL_TARGETS_TO_BUILD}' \
>                    -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
> -                  -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llv=
m-min-tblgen \
> +                  -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen=
 \
> +                  -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tb=
lgen \
>                    -DLLVM_INCLUDE_TESTS=3DOFF \
> +                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FI=
LE=3D${WORKDIR}/toolchain-native.cmake' \
>  "
>
>  EXTRA_OECMAKE:append:class-nativesdk =3D "\
> -                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FI=
LE=3D${WORKDIR}/toolchain-native.cmake' \
> -                  -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tb=
lgen \
> -                  -DCLANG_TIDY_CONFUSABLE_CHARS_GEN=3D${STAGING_BINDIR_N=
ATIVE}/clang-tidy-confusable-chars-gen \
>                    -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_=
PREFIX}llvm-ranlib \
>                    -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-ar \
>                    -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-nm \
> @@ -205,7 +204,6 @@ do_install:append:class-native () {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', =
d)}; then
>          install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${b=
indir}/clangd-indexer
>      fi
> -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-char=
s-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
>
>      for f in `find ${D}${bindir} -executable -type f -not -type l`; do
>          test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
> @@ -225,7 +223,6 @@ do_install:append:class-nativesdk () {
>          install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${b=
indir}/clangd-indexer
>      fi
>      install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}=
/clang-tblgen
> -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-char=
s-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
>      for f in `find ${D}${bindir} -executable -type f -not -type l`; do
>          test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
>      done
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223972): https://lists.openembedded.org/g/openembedde=
d-core/message/223972
> Mute This Topic: https://lists.openembedded.org/mt/115410450/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

