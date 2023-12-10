Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADFAC4167B
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 22:50:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.66046.1702248625137469086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 14:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EFGWXbyZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c1e3ea2f2so41965105e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 14:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702248623; x=1702853423; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pL6CRhRThpwNWYjbNJpltpr9egsOAa+F7zPk6e2ZiiE=;
        b=EFGWXbyZtJ1bSIA6T8rozfc+Ts3gpkrFJpfb+Y+NkmcyfwHbBGDf1LPsSRf/DEpIAu
         4elQAIynBTN4kuXy2rU2Iy+VN47WQ/siPgWOTgGF9aQLZw/hScQaLieJgqwHtdFJpsct
         3rVdIflgBuhUN5n0la4i/9c24r8Dhu4IXt4ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702248623; x=1702853423;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pL6CRhRThpwNWYjbNJpltpr9egsOAa+F7zPk6e2ZiiE=;
        b=FaEN87K+sVYZMC2nztKoexYIuARKB/kbel09EfnTGWpwEjFoPPDXRvAyU5F8c7K+zH
         4FhCM7/eU++zozGVv3+dRalHpI55ipcXx80q9xuaURXsI7h2R/fZp2HBjuOPhxpWdJLA
         zrB2FJqImoXEYNKHQCoLbjWoBbVXfoCVLdTDs8heSuAWaf4wO5VsFLjAK0qcBkzWVWun
         a614ALQ7V/n0qR57uPUK4WSitjWiItKopbmbeyA5MdwAP1q8t6i7tC4Qv4cuMKzEBV8f
         /Ny7v3Ac/msSz9xU66cnKuTvQ9ea55AQmyoeWPNiGMiVhkRfHABNMrfGR0BxGNA3+V5s
         jlgg==
X-Gm-Message-State: AOJu0YzKx2BN6Cg/RC9nn3QCxcufaTQMwgVfE8yGy3JmgMuuh7hSsA9z
	Y0NFAuBPyzWChWACwM3Tw+N93g==
X-Google-Smtp-Source: AGHT+IHxJn0YDfJJpmV9zkg+EJcyC3S77xe5YEpKuUEGsWry/F5oDZcGTWesCGcWh69f9sODZfgpYA==
X-Received: by 2002:adf:e58e:0:b0:333:1b9e:624a with SMTP id l14-20020adfe58e000000b003331b9e624amr2338876wrm.47.1702248623251;
        Sun, 10 Dec 2023 14:50:23 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:659f:462d:68c0:d464? ([2001:8b0:aba:5f3c:659f:462d:68c0:d464])
        by smtp.gmail.com with ESMTPSA id m11-20020a05600c4f4b00b0040b561924bbsm13141364wmq.21.2023.12.10.14.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 14:50:22 -0800 (PST)
Message-ID: <9e370dbe4c4d38df3c2846fd6afdb729723b3a41.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 3/7] rust: Upgrade 1.71.0 -> 1.71.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 10 Dec 2023 22:50:19 +0000
In-Reply-To: <CAO5Uq5RaQYvgye7a=qtwO2abDRP6WvggbKvjLpWuepJ1Rr3Z4A@mail.gmail.com>
References: <20231208140349.3576-1-alex.kiernan@gmail.com>
	 <20231208140349.3576-3-alex.kiernan@gmail.com>
	 <a394853b1f2302baab431afe6fd0a1880b8238bd.camel@linuxfoundation.org>
	 <CAO5Uq5RaQYvgye7a=qtwO2abDRP6WvggbKvjLpWuepJ1Rr3Z4A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 22:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192128

On Sun, 2023-12-10 at 20:28 +0000, Alex Kiernan wrote:
> On Sun, Dec 10, 2023 at 7:39=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Fri, 2023-12-08 at 14:03 +0000, Alex Kiernan wrote:
> > > https://blog.rust-lang.org/2023/08/03/Rust-1.71.1.html
> > >=20
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > >=20
> > >  meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D> cargo_1.71.1.bb} | =
0
> > >  .../rust/{libstd-rs_1.71.0.bb =3D> libstd-rs_1.71.1.bb}           | =
0
> > >  ...t-cross-canadian_1.71.0.bb =3D> rust-cross-canadian_1.71.1.bb} | =
0
> > >  .../rust/{rust-llvm_1.71.0.bb =3D> rust-llvm_1.71.1.bb}           | =
0
> > >  meta/recipes-devtools/rust/rust-source.inc                      | 2 =
+-
> > >  meta/recipes-devtools/rust/{rust_1.71.0.bb =3D> rust_1.71.1.bb}   | =
0
> > >  6 files changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D> cargo_1.71.1=
.bb} (100%)
> > >  rename meta/recipes-devtools/rust/{libstd-rs_1.71.0.bb =3D> libstd-r=
s_1.71.1.bb} (100%)
> > >  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.71.0.bb =3D=
> rust-cross-canadian_1.71.1.bb} (100%)
> > >  rename meta/recipes-devtools/rust/{rust-llvm_1.71.0.bb =3D> rust-llv=
m_1.71.1.bb} (100%)
> > >  rename meta/recipes-devtools/rust/{rust_1.71.0.bb =3D> rust_1.71.1.b=
b} (100%)
> > >=20
> > > diff --git a/meta/recipes-devtools/rust/cargo_1.71.0.bb b/meta/recipe=
s-devtools/rust/cargo_1.71.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/cargo_1.71.0.bb
> > > rename to meta/recipes-devtools/rust/cargo_1.71.1.bb
> > > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.71.0.bb b/meta/re=
cipes-devtools/rust/libstd-rs_1.71.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
> > > rename to meta/recipes-devtools/rust/libstd-rs_1.71.1.bb
> > > diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb=
 b/meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb
> > > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
> > > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.71.0.bb b/meta/re=
cipes-devtools/rust/rust-llvm_1.71.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
> > > rename to meta/recipes-devtools/rust/rust-llvm_1.71.1.bb
> > > diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipe=
s-devtools/rust/rust-source.inc
> > > index 3a192e42db7d..0729db6f0b45 100644
> > > --- a/meta/recipes-devtools/rust/rust-source.inc
> > > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > > @@ -7,7 +7,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc=
-${RUST_VERSION}-src.tar.xz;n
> > >              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
> > >              file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.p=
atch;patchdir=3D${RUSTSRC} \
> > >  "
> > > -SRC_URI[rust.sha256sum] =3D "5814699031aafdcc2e2f71fc9b389678cd70423=
50d1583da061463d8e88681c7"
> > > +SRC_URI[rust.sha256sum] =3D "371af0fbe04051e20a74dbea6d4e4e548f10f15=
309c49cae2688afb882b6c7f1"
> > >=20
> > >  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> > >=20
> > > diff --git a/meta/recipes-devtools/rust/rust_1.71.0.bb b/meta/recipes=
-devtools/rust/rust_1.71.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/rust_1.71.0.bb
> > > rename to meta/recipes-devtools/rust/rust_1.71.1.bb
> >=20
> > I ran some testing and it looks like we could merge up to 1.71.1
> > without autobuilder failures in this series. Beyond that we have the
> > reproducibility and zvariant issues.
> >=20
>=20
> Thanks.
>=20
> Was the failure at that point reproducibility or the zvariant trait
> failure? I just posted an update for zvariant which doesn't see the
> trait recursion failure, but at the same time it no longer exercises
> crates pulled from git which looked like it was the main purpose it
> was fulfilling for testing.

Both I think and yes, the argument for zvariant was that it allowed us
the crate testing :/.

Cheers,

Richard

