Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFA7C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:12:21 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.51787.1681150331019963977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ReTLw+yb;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-18436e0b673so6078897fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681150330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4hml9Yqqfh54VoVnn+/bIMgNzD/os0SqRCQCJkjeUM=;
        b=ReTLw+ybY7jjvGdLYaj37Kl41nnfH9OCoGoVAsq1282kaRpRFig2uZZeB7JCCiPJEg
         ZgjNVaYWU2Pp915vOl8Hj2jPEOQiXkqaz2Pw9caXxiV5DBfuVZiHB4pGSVuacPh+2QiQ
         khIzH4gIYk/AEE5RvfW1s3yq68y8mMYdtOkPBCBeyA1SUZPrTE0Rrc9MTlONjBvQMdQr
         O91yHsia7EeZpGWy09H2SxdnsBF6vB91HU2TyFamKfw1Zo7J738gGSUL6b7WQcFl6snQ
         qJVHIPTbPaLOxL0n2daY1BV7H147vKbXzP+zlL6glwwP28SazzzMUURss6Ed5TXjKXhA
         lkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681150330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4hml9Yqqfh54VoVnn+/bIMgNzD/os0SqRCQCJkjeUM=;
        b=q7Xtxutjk+iPUQ/Urbqf8BfBLivlC+ulrP7hP+xdiWhuhEwii+oxgUDn3VoRKOKUij
         PxxwF2ecRZey0BCn1CeiJA1ju6gTc1pb9at7/OMsAkDZ0md3SpnnjJxq1/uyUCaghmnK
         orr2V/BHEemlVmvKoXV4qTBL8cu1o5swf/9DW5oBt5/GhX9wH05bxRucIyhJHz4pZqkz
         saYXTG4LKFWxnqHCM0fLdGpDnBpcqRFBMA2Z1XBTKIJUa21i4jq+AweANmsNVoUTtXVD
         iCUJN7oWJs/3Pz+T0VbNfxsMVWhEutMXDulszAmx48McLiCT56pQoTKuW/psvjxAH+8o
         beBw==
X-Gm-Message-State: AAQBX9cLddYHSgo1hH3GbZB7BWAwY97Ks/8YT9AtsQlRxVMKO0vXNASc
	wKzeUk2cTaq4UOU5MY2YGrcAegbTY6yClSO8cgo=
X-Google-Smtp-Source: AKy350bWQDQBnQUktG65+OOIJ87ACKJ535SfZ9GjT5gWed8rHzh00wLO4eQ6QuhZi4udb27cTGDXTN9sxXoEVVLKazM=
X-Received: by 2002:a05:6870:12cf:b0:17a:b713:63e9 with SMTP id
 15-20020a05687012cf00b0017ab71363e9mr3874931oam.4.1681150330138; Mon, 10 Apr
 2023 11:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230410094122.5865-1-alex.kiernan@gmail.com> <CAMKF1sq_jvEn5VYmAnRj8HKrXtGAWj8cmD+O6eRHiBqdsLf_EQ@mail.gmail.com>
 <2023041017305195b4c7aa@mail.local>
In-Reply-To: <2023041017305195b4c7aa@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Apr 2023 11:11:44 -0700
Message-ID: <CAMKF1sp-r4THLG2xfSDiVf=gkaO3aH8SvM0s+keNgAR9mow0tQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.68.1 -> 1.68.2
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 18:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179902

Thanks, I'll also check it out. I think the checksums for the musl
patch would need updating I think as the versions of these crates
might have changed.

On Mon, Apr 10, 2023 at 10:30=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> My current a-full has this patch.
>
> On 10/04/2023 10:21:16-0700, Khem Raj wrote:
> > If possible, Can you test this on top of contrib/abelloni/master-next
> > for musl target ?
> >
> > On Mon, Apr 10, 2023 at 2:42=E2=80=AFAM Alex Kiernan <alex.kiernan@gmai=
l.com> wrote:
> > >
> > > Changes:
> > >
> > > * Update the GitHub RSA host key bundled within Cargo. The key was
> > >   rotated by GitHub on 2023-03-24 after the old one leaked.
> > > * Mark the old GitHub RSA host key as revoked. This will prevent Carg=
o
> > >   from accepting the leaked key even when trusted by the system.
> > > * Add support for @revoked and a better error message for
> > >   @cert-authority in Cargo=E2=80=99s SSH host key verification
> > >
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > >
> > >  meta/recipes-devtools/rust/{cargo_1.68.1.bb =3D> cargo_1.68.2.bb} | =
0
> > >  .../rust/{libstd-rs_1.68.1.bb =3D> libstd-rs_1.68.2.bb}           | =
0
> > >  ...t-cross-canadian_1.68.1.bb =3D> rust-cross-canadian_1.68.2.bb} | =
0
> > >  .../rust/{rust-llvm_1.68.1.bb =3D> rust-llvm_1.68.2.bb}           | =
0
> > >  meta/recipes-devtools/rust/rust-source.inc                      | 2 =
+-
> > >  meta/recipes-devtools/rust/{rust_1.68.1.bb =3D> rust_1.68.2.bb}   | =
0
> > >  6 files changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta/recipes-devtools/rust/{cargo_1.68.1.bb =3D> cargo_1.68.2=
.bb} (100%)
> > >  rename meta/recipes-devtools/rust/{libstd-rs_1.68.1.bb =3D> libstd-r=
s_1.68.2.bb} (100%)
> > >  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.68.1.bb =3D=
> rust-cross-canadian_1.68.2.bb} (100%)
> > >  rename meta/recipes-devtools/rust/{rust-llvm_1.68.1.bb =3D> rust-llv=
m_1.68.2.bb} (100%)
> > >  rename meta/recipes-devtools/rust/{rust_1.68.1.bb =3D> rust_1.68.2.b=
b} (100%)
> > >
> > > diff --git a/meta/recipes-devtools/rust/cargo_1.68.1.bb b/meta/recipe=
s-devtools/rust/cargo_1.68.2.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/cargo_1.68.1.bb
> > > rename to meta/recipes-devtools/rust/cargo_1.68.2.bb
> > > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.68.1.bb b/meta/re=
cipes-devtools/rust/libstd-rs_1.68.2.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/libstd-rs_1.68.1.bb
> > > rename to meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
> > > diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.68.1.bb=
 b/meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/rust-cross-canadian_1.68.1.bb
> > > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
> > > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.68.1.bb b/meta/re=
cipes-devtools/rust/rust-llvm_1.68.2.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/rust-llvm_1.68.1.bb
> > > rename to meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
> > > diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipe=
s-devtools/rust/rust-source.inc
> > > index c8f5a5a9c4c4..6d3a4b131e26 100644
> > > --- a/meta/recipes-devtools/rust/rust-source.inc
> > > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > > @@ -7,7 +7,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc=
-${RUST_VERSION}-src.tar.xz;n
> > >              file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;pa=
tchdir=3D${RUSTSRC} \
> > >              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
> > >  "
> > > -SRC_URI[rust.sha256sum] =3D "5b8ea94085b65e75c1fa6310e2f90bd706fa80b=
fcb3544fe26f4037b911d9fb2"
> > > +SRC_URI[rust.sha256sum] =3D "ce1a115f6aafa912b4622906a92b626354973af=
a9288e2c7750df4dcf3390fc0"
> > >
> > >  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> > >
> > > diff --git a/meta/recipes-devtools/rust/rust_1.68.1.bb b/meta/recipes=
-devtools/rust/rust_1.68.2.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/rust_1.68.1.bb
> > > rename to meta/recipes-devtools/rust/rust_1.68.2.bb
> > > --
> > > 2.39.0
> > >
> > >
> > >
> > >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#179897): https://lists.openembedded.org/g/openembed=
ded-core/message/179897
> > Mute This Topic: https://lists.openembedded.org/mt/98172309/3617179
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

