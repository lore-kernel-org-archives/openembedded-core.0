Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04844C4167B
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 20:28:40 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.63168.1702240118780251255
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 12:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dY8Tzz6o;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c9f8faf57bso47951631fa.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 12:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702240117; x=1702844917; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J00uKbVR23XMxn17Bvr3kpw5td3ced+YydnJoQ5LBtU=;
        b=dY8Tzz6otvcMhJJeMInjMBgiy8p0fbLZZwZlV83Nei31EHytTQxuK7TI7+LFUV6/zJ
         3frqLv9X1d/Zyv6EwAVg2+4pwEFVcmceJyhA1fVkh4XK5XBiY8o5FwGGQxxlLFKwIoEL
         q1vj1yhwTXlSXHgTH27mXq6Cyrwn83ETjk0sxZ8rytYXEGNJAtN4k5UC+E1RQJH7fSDf
         v2s0ZP6stdb8a200IKJl7KV1tEhomw3spfAjLTChIbKaB/Y6tqIDbuzv9q8pQj8OeIZb
         d3OQ0Vq4ywRWZB/Nxhobn+FhiGTSo0z/8pmMs9nVH+CDq9aKMEXDBz2O8z6EJzjPHdaj
         W/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702240117; x=1702844917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J00uKbVR23XMxn17Bvr3kpw5td3ced+YydnJoQ5LBtU=;
        b=lX/rSWIbcuKKekpHo8sy4SxwmGMEv9g16qcdezCV33JARlf8eOagiv3nHrONbCcUaU
         vB0dpll1O1SkWUvaq9rKLJIlazFtIaapbcP+3RiXm+xM5xIjsKoVudl//fGHRM1GpabM
         xi05pZ2/wjM2/Wq7dhw7ZIPhYX6+mzdeCDYUdBbP0djJgQMc0GUOXLk260UXgs5oujb5
         CdbQLzyuU0+iZUPLk9Qd+5yLU4w0iW3nM6KvnoGy8uV5URUSNEwVPAHWo6qhteYNppC8
         q8Kt66ai60Q4cjVXh/l5u66NkUlam6xr68mej1ZCMmCrXz8MLA2mxhCvsO5cHFxr17Bw
         FTgw==
X-Gm-Message-State: AOJu0YyVJonCvVTbvyfyexA0CzOIBSyuIJVyZU+ySiks6E+TdI1pg9T0
	sTU9yhScRq88A4LGNN/dMmVTsIAiJWAq2Qd42fU=
X-Google-Smtp-Source: AGHT+IGse5exhYbg5QAV8vlDm3lzgLLTGX3h4hLiG8HdFRZbojVUg/O4awCCf63evE5vcmv04lxLET8YNdinGtZKZ7A=
X-Received: by 2002:a2e:2c01:0:b0:2c5:19ab:726e with SMTP id
 s1-20020a2e2c01000000b002c519ab726emr1259315ljs.47.1702240116520; Sun, 10 Dec
 2023 12:28:36 -0800 (PST)
MIME-Version: 1.0
References: <20231208140349.3576-1-alex.kiernan@gmail.com> <20231208140349.3576-3-alex.kiernan@gmail.com>
 <a394853b1f2302baab431afe6fd0a1880b8238bd.camel@linuxfoundation.org>
In-Reply-To: <a394853b1f2302baab431afe6fd0a1880b8238bd.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 10 Dec 2023 20:28:24 +0000
Message-ID: <CAO5Uq5RaQYvgye7a=qtwO2abDRP6WvggbKvjLpWuepJ1Rr3Z4A@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 3/7] rust: Upgrade 1.71.0 -> 1.71.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 20:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192125

On Sun, Dec 10, 2023 at 7:39=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-12-08 at 14:03 +0000, Alex Kiernan wrote:
> > https://blog.rust-lang.org/2023/08/03/Rust-1.71.1.html
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D> cargo_1.71.1.bb} | 0
> >  .../rust/{libstd-rs_1.71.0.bb =3D> libstd-rs_1.71.1.bb}           | 0
> >  ...t-cross-canadian_1.71.0.bb =3D> rust-cross-canadian_1.71.1.bb} | 0
> >  .../rust/{rust-llvm_1.71.0.bb =3D> rust-llvm_1.71.1.bb}           | 0
> >  meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
> >  meta/recipes-devtools/rust/{rust_1.71.0.bb =3D> rust_1.71.1.bb}   | 0
> >  6 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D> cargo_1.71.1.b=
b} (100%)
> >  rename meta/recipes-devtools/rust/{libstd-rs_1.71.0.bb =3D> libstd-rs_=
1.71.1.bb} (100%)
> >  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.71.0.bb =3D> =
rust-cross-canadian_1.71.1.bb} (100%)
> >  rename meta/recipes-devtools/rust/{rust-llvm_1.71.0.bb =3D> rust-llvm_=
1.71.1.bb} (100%)
> >  rename meta/recipes-devtools/rust/{rust_1.71.0.bb =3D> rust_1.71.1.bb}=
 (100%)
> >
> > diff --git a/meta/recipes-devtools/rust/cargo_1.71.0.bb b/meta/recipes-=
devtools/rust/cargo_1.71.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/cargo_1.71.0.bb
> > rename to meta/recipes-devtools/rust/cargo_1.71.1.bb
> > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.71.0.bb b/meta/reci=
pes-devtools/rust/libstd-rs_1.71.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
> > rename to meta/recipes-devtools/rust/libstd-rs_1.71.1.bb
> > diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb b=
/meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb
> > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
> > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.71.0.bb b/meta/reci=
pes-devtools/rust/rust-llvm_1.71.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
> > rename to meta/recipes-devtools/rust/rust-llvm_1.71.1.bb
> > diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-=
devtools/rust/rust-source.inc
> > index 3a192e42db7d..0729db6f0b45 100644
> > --- a/meta/recipes-devtools/rust/rust-source.inc
> > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > @@ -7,7 +7,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-$=
{RUST_VERSION}-src.tar.xz;n
> >              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
> >              file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.pat=
ch;patchdir=3D${RUSTSRC} \
> >  "
> > -SRC_URI[rust.sha256sum] =3D "5814699031aafdcc2e2f71fc9b389678cd7042350=
d1583da061463d8e88681c7"
> > +SRC_URI[rust.sha256sum] =3D "371af0fbe04051e20a74dbea6d4e4e548f10f1530=
9c49cae2688afb882b6c7f1"
> >
> >  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> >
> > diff --git a/meta/recipes-devtools/rust/rust_1.71.0.bb b/meta/recipes-d=
evtools/rust/rust_1.71.1.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/rust_1.71.0.bb
> > rename to meta/recipes-devtools/rust/rust_1.71.1.bb
>
> I ran some testing and it looks like we could merge up to 1.71.1
> without autobuilder failures in this series. Beyond that we have the
> reproducibility and zvariant issues.
>

Thanks.

Was the failure at that point reproducibility or the zvariant trait
failure? I just posted an update for zvariant which doesn't see the
trait recursion failure, but at the same time it no longer exercises
crates pulled from git which looked like it was the main purpose it
was fulfilling for testing.

--=20
Alex Kiernan

