Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CC6C4167B
	for <webhook@archiver.kernel.org>; Sat,  2 Dec 2023 00:04:23 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.7993.1701475452968773453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 16:04:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NAmhMXEz;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1fb06f38df0so219913fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 16:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701475452; x=1702080252; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMc3mB86yYHE2hhZukSb9MtLiQNUXGiBJ79NzcsE4VU=;
        b=NAmhMXEz9uGI4rrwYpyKJlGeUN5KLmuKVONLz+fgEdygcvtZ+iDa+XaUkdfZbpNy6S
         2rodMzpfAnrmm8Owo4Bfhdcw9Pvd2zARu3yAgqwiz+Lu4XhmmWWGKo/Oj+j765nrVjld
         HqIcWYlhZvqO7rR6ogrjO4muibF7R6g7ObOq7QwdiPR0bp9Crt9BEl1/QRzI2imqWSau
         Wfe2pJ+L86PLEnNHgKIbC3/7DQgCbLped4ODq4xPPqAvJh3Gg+6UKU5HBBsL/Xz/0nf6
         o4mPZ6KZE0R96NzyrE2svSF3icVkLAAP5xKXwjcvQjJd4+YW7yHMgPk98h55t3Q4/2HU
         iEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701475452; x=1702080252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMc3mB86yYHE2hhZukSb9MtLiQNUXGiBJ79NzcsE4VU=;
        b=vCMSKVW4xC4NHmkhUVHSrEopWfsczvX7a0LmFi2V1iuabBoXx+laurx6yC6O2jVMjl
         F1V8wJXaOmrmGKmAjnSuzdKOlaO0e2wStFVklPCC65aV8WXU9r5MOnZxUaJfhH06xeLM
         foOP+uuNCN1hKATN4Mcw9j8APG207SXvDqx25Hx9h6f2Ug2vTIzBzDFnGRmMMT5zdStF
         D2EkLmB0z0I33b6hILLuZCF79UlpECfU5TuBCwTWY7fZO4zLNwzcC/xcGUppplbctwNB
         FbeI9arsGfqyaWDcWxQzLPFWHY9NeZ4Nqu9ZQ6qtFX5Mo4aIoaWsPq34pJoFApFnK3oL
         DL+Q==
X-Gm-Message-State: AOJu0Yzc1DDEzPeC7GqZIgALR60xyDA04Msy97S3xOKDTr5gDUvp88CO
	mquA0ERMwmPrlgk562UR9sIZ1sBHCssxoSw1z+TxnbyC
X-Google-Smtp-Source: AGHT+IEmhaK4+yPKW21e+wTZ2qVKKodJkqKH7qBM2YKsJqnsu+zD6Emn+SRnsdi2nepBzDaUoiBaS4jC9YsVDikYxyI=
X-Received: by 2002:a05:6871:1c7:b0:1fa:ebd9:7d41 with SMTP id
 q7-20020a05687101c700b001faebd97d41mr495755oad.26.1701475452022; Fri, 01 Dec
 2023 16:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20231201183356.311137-1-raj.khem@gmail.com> <20231201183356.311137-6-raj.khem@gmail.com>
 <179CD8EAC4F00896.18076@lists.openembedded.org> <2023120123550896838280@mail.local>
In-Reply-To: <2023120123550896838280@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Dec 2023 16:03:45 -0800
Message-ID: <CAMKF1spbYvCj-XkJWmboM_11wBdRdMXjWF_bjr_sUDboLKfY9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] llvm: Upgrade to 17.0.6
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Dec 2023 00:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191695

On Fri, Dec 1, 2023 at 3:55=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 02/12/2023 00:27:39+0100, Alexandre Belloni via lists.openembedded.org=
 wrote:
> > This breaks:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/7190=
/steps/11/logs/stdio
>
> Actually, this one reproduced without the patch
>

how is llvm used by rust ?

> > https://autobuilder.yoctoproject.org/typhoon/#/builders/146/builds/960/=
steps/12/logs/stdio
>
> But not this one.
>
> >
> > On 01/12/2023 10:33:54-0800, Khem Raj wrote:
> > > Bring in these changes
> > >
> > > * 6009708b4367 Revert "[runtimes] Add missing test dependencies to ch=
eck-all (#72955)"
> > > * 04caadc61fa2 [Driver] Enable __float128 support on X86 on FreeBSD /=
 NetBSD (#72788)
> > > * e919a83f96fe eliminate python SyntaxWarnings from check-all output.
> > > * f6c231c15ec8 [clang-format] Fix crashes in AlignArrayOfStructures (=
#72520)
> > > * f74f3e6f58d3 [clang] Fix sorting module headers (#73146)
> > > * 7e30ce9528d9 [JITLink][aarch32] Change writeRegister's return type =
to void.
> > > * 03373fd9cb6c [CMake] Support building shared library for NetBSD
> > > * 21af3b62b632 workflows/release-binaries: Do a preliminary build to =
fill ccache (#72576)
> > > * 201faeca595e Add RV64 constraint to SRLIW (#69416)
> > > * e957e6dcb29d [runtimes] Add missing test dependencies to check-all =
(#72955)
> > > * f8575ff46f89 [clang-format] Fix a bug in aligning comments above PP=
Directive (#72791)
> > > * a71237b9f67f [clangd] Avoid null result in FindRecordTypeAt()
> > > * 308c816de5a4 Bump version to 17.0.6
> > > * 442401f7c0ca remove tests from bad merge
> > > * 76c7e0e1e2d1 Use the correct namespace for looking up matching oper=
ator!=3D (#68922)
> > > * b5cbb35408a3 [libc++] Use correct size for deallocation of arrays i=
n shared_ptr (#68233)
> > > * e6de86cb9ef8 Revert "Reland [clang] Canonicalize system headers in =
dependency file when -canonical-prefixes" (#71697)
> > > * bb66d8f8f73b [clang][WebAssembly] Link crt1 even in case of -shared
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-de=
vtools/llvm/llvm_git.bb
> > > index de8d4116868..9a88549260a 100644
> > > --- a/meta/recipes-devtools/llvm/llvm_git.bb
> > > +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> > > @@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target =3D " ncurses-=
terminfo"
> > >
> > >  inherit cmake pkgconfig
> > >
> > > -PV =3D "17.0.5"
> > > +PV =3D "17.0.6"
> > >
> > >  MAJOR_VERSION =3D "${@oe.utils.trim_version("${PV}", 1)}"
> > >
> > >  LLVM_RELEASE =3D "${PV}"
> > >
> > >  BRANCH =3D "release/${MAJOR_VERSION}.x"
> > > -SRCREV =3D "98bfdac5ce82d1679f8af9a57501471812ab68d7"
> > > +SRCREV =3D "6009708b4367171ccdbf4b5905cb6a803753fe18"
> > >  SRC_URI =3D "git://github.com/llvm/llvm-project.git;branch=3D${BRANC=
H};protocol=3Dhttps \
> > >             file://0007-llvm-allow-env-override-of-exe-path.patch;str=
iplevel=3D2 \
> > >             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-nam=
e-as-we.patch;striplevel=3D2 \
> > > --
> > > 2.43.0
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191693): https://lists.openembedded.org/g/openembed=
ded-core/message/191693
> > Mute This Topic: https://lists.openembedded.org/mt/102921840/3617179
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

