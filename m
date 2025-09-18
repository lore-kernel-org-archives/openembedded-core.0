Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A179CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 23:24:02 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.3013.1758237834253134576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 16:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GwQgX9tx;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-ea5cbca279aso1159599276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 16:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758237833; x=1758842633; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USK3IGwJ2gz5aa5Qb0ZTeham70RjgJiAR0JARAON0iY=;
        b=GwQgX9txWpYEapkZNvbJWzp+iLZFWTnSnt0a69K0kE244vMsPEhvEC20YBaIFK8bxu
         2KvPJ9E9kb4PmXJ0iyY3jG4bZGqXT2SXWjt/u3q+vPpKe1aX7nLXLhzzB4rS1L8kHgqM
         4ipnERFROPR/HdutzZ4JHskjXknP0QJFYjFFzvCVAldbYOljhNQ4IXH+eMdmDFsJyb/M
         GTuT5SBy8jQr0f773Gsv5q2CEGOBNh/Wj6kNIcgQQfjjQm1VZMwNF36yXW4Kk66CCyBM
         ++CPJQkU8lMHtVy7nk7nPct0kZHXCUVSa7qEQgs1SgBH+4wN+gDHBk8Km4LgyW3p+kHO
         /XNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758237833; x=1758842633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USK3IGwJ2gz5aa5Qb0ZTeham70RjgJiAR0JARAON0iY=;
        b=P2x/hQ2lBNwsisSiL0KSzwU+AA/Tvdo3cEGF4bWGl/wdisPYy65Qx9XRuvRKbPlzQl
         q+iLfMp71atpu4M8MprglfFsJz/8zIFFGgq0V4w+zy8ZOdfJ/51D1DGN51CM2+hXatP/
         PJBEtr8Hb6qGX77EFcLXCMnNhggAWcMOP04jJ7gkhmMPAw6nlw7Bie7Yt6J6++SHYrRx
         axLh/RFiHRRgpqqEDMIW0bkZrQ7TtBD0OMgP6hD/JnV4o7/dJyq/48aAMOnwoZTSGDtl
         O6wpxe1FGrhOAl22krtMhlSMnFfM2ZWd5tyr3k8g9wJgrpYKjzOdsvd95rmqdOg3yHCD
         3owA==
X-Gm-Message-State: AOJu0YygBo1jSiTdQ10k1Ll2fSg1PUsxdK0PQHdBzakxb7z0pMnSuR8R
	eQ+pZ8UaylQbuwGoC/Wceeb3uNl73AH3zutlXGOr7PpJjFaMdqk0co/0VXO41hIyAoZ3dSFMjwr
	IHkXl/PviZ8xEdhYO408ZQ8OVo5mZv94=
X-Gm-Gg: ASbGncvy/K9G19yK/z0FmZurpT8039qHKosyxpgqsg+J4s4sdAMq0Lsb8eHSFxp8PVs
	pXM98fEP4Ck6J49Y88j9a6By/W8/sxaQvr4EyZnRrqcmg9BfwGoFOCoLGyRSI9XGqhtuaQOiXWp
	xIYQ8YM3ws3960C0nibnIDlHYo4u1jedJdykp4SChqOsziV8S//3g6l45/IlAEFe9QDa+dEeZ4/
	TpmOZf6inMU1eVu2rjRg56C3E50VgoKOyxE7srNi5noIl5tKYb1MHSxQcYVqaDqhk9dlqP7GuGa
	EwYDPasfHJ++1X3WRRnR4ZV3ikNZU15rThohSxt63Q==
X-Google-Smtp-Source: AGHT+IGEqv6B/uij2Z0DR9g4itn0//O3QZhva832Z52qhrmmp7HpchZnfiEO/jx5B2AchTA5Sid0NoJ6ntPLrDUcVM0=
X-Received: by 2002:a05:690c:9a09:b0:735:77b7:492a with SMTP id
 00721157ae682-73d3c5d5e75mr10795137b3.40.1758237833142; Thu, 18 Sep 2025
 16:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250918030540.2172994-1-raj.khem@gmail.com> <0c19a1d8-712a-4fcd-aa8c-a994edc2d8ed@bootlin.com>
 <CAMKF1srhBhGi82_O7KrP_FR92-Dq8_SxJy2g_TJcj875xexwqw@mail.gmail.com>
In-Reply-To: <CAMKF1srhBhGi82_O7KrP_FR92-Dq8_SxJy2g_TJcj875xexwqw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Sep 2025 16:23:26 -0700
X-Gm-Features: AS18NWAAwbYmOIKFeHlwf4HfK3KS48Jx3zaBZX65snIWr8PZFsY0bjPt8bD6FUg
Message-ID: <CAMKF1squ77P0N3G5buwBk0K0054R_pxdQpRjXBtskdHwVK0L2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: Fix nativesdk build after recipe splits
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 23:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223712

On Thu, Sep 18, 2025 at 8:42=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
>
>
> On Thu, Sep 18, 2025 at 1:31=E2=80=AFAM Joao Marcos Costa <joaomarcos.cos=
ta@bootlin.com> wrote:
>>
>> Hello, Khem
>>
>> On 9/18/25 05:05, Khem Raj via lists.openembedded.org wrote:
>> > Splitting llvm, tblgen into their own recipes means we
>> > have to ensure nativesdk clang build can find these tools
>> > in native sysroot, which is would previously build and use
>> > on its own.
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > Cc: Ross Burton <ross.burton@arm.com>
>> > ---
>> >   meta/recipes-devtools/clang/clang_git.bb | 2 ++
>> >   1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-d=
evtools/clang/clang_git.bb
>> > index 9e977379325..bcc799f286b 100644
>> > --- a/meta/recipes-devtools/clang/clang_git.bb
>> > +++ b/meta/recipes-devtools/clang/clang_git.bb
>> > @@ -78,6 +78,8 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
>> >
>> >   EXTRA_OECMAKE:append:class-nativesdk =3D "\
>> >                     -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAI=
N_FILE=3D${WORKDIR}/toolchain-native.cmake' \
>> > +                  -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm=
-tblgen \
>> > +                  -DCLANG_TIDY_CONFUSABLE_CHARS_GEN=3D${STAGING_BINDI=
R_NATIVE}/clang-tidy-confusable-chars-gen \
>> >                     -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TAR=
GET_PREFIX}llvm-ranlib \
>> >                     -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_=
PREFIX}llvm-ar \
>> >                     -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_=
PREFIX}llvm-nm \
>> >
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#223625): https://lists.openembedded.org/g/openembe=
dded-core/message/223625
>> > Mute This Topic: https://lists.openembedded.org/mt/115304299/8026893
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[joaomarcos.costa@bootlin.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> I spotted this error in the autobuilder:
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2266/=
steps/12/logs/stdio
>>
>> Could you please take a look?
>> Thanks!
>
>
> Logs are showing clang-native failure while the change in this patch is l=
imited to nativesdk clang. So it is unrelated to this patch
>
> However change seems to be related to llvm recipe separation series since=
 clang is building this tool during its build and trying to use it from its=
 build area but it=E2=80=99s perhaps not finding libllvm from native sysroo=
t

I poked at the worker on AB where it is failing, I think there is a
cmake patch which is problematic.

https://patchwork.yoctoproject.org/project/oe-core/patch/20250915145134.192=
581-1-ross.burton@arm.com/

clang builds some tools during build and links them to in-tree libLLVM
if it is built in monolithic builds ( which we do ) and this option
omits build time rpaths which causes this problem.

>>



>>
>> --
>> Best regards,
>> Jo=C3=A3o Marcos Costa

