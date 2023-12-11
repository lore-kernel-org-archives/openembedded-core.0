Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA78C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 07:15:41 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.3211.1702278933460230022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 23:15:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=njPsnhQ2;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-67ad531686eso41684536d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 23:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702278932; x=1702883732; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CJwL4GnNwXK06jsg+O6BWHbi21MhKPGSoUGVaFllbv0=;
        b=njPsnhQ2dH/BSiCDmTXI8Z8VK58iW/7I3lvfhx1zPlWD8Km42iyor8nr+tsIFa6u+d
         OllZa0FqZ/D/FRHWfQrSSivY0XHFxU+GeN78qT3jNfDJScnhqj78mWniCoDltGtyCmmD
         BJuGMkUnDiww2KGuPglgMShIhuJc7IJDpDN6CGiZcUN0WtfIWhl92t8QTGMN9z+VJ3iT
         kbBY74573oC0Xd7zLnw1IhglM7pjdQI9ddfKXcW+XMBhmQdLD04/GDcjdgRs1PL7eAHg
         Yrh9yFb7AoCXbSa+0M8KUNp/HCvYTNkO6j/zOwq61pHRuQmO4FSFBcKd2cAtWdIx/6bd
         vWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702278932; x=1702883732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJwL4GnNwXK06jsg+O6BWHbi21MhKPGSoUGVaFllbv0=;
        b=vF02X84mNk0t8U6bTvCNb9Zt1c06bQC2XigBTLl8UyxUxW8vGjGN60prrFg78DsqWp
         B6/nOI58fTzTp5e7X9ciAD4FvSPwDybnj3GRHrQktMyRWqx5+I0l/B76jaQ5EptVbzsl
         ALQ/cVeM1kqobBZHQ6UAUyPe3FS3EKZbKE3DRVMzZssN3WQEUuY3d2Boop2TG7JVAYWk
         hcm6WhVgpJoIYvibe71nN3MHo0rk2hOXXUQY3/V42qY8D0vSWKVYgiF0mWvRu8YcQTGR
         08M3derq3AF5IO1Bv+sZwcXqX9JwpbEquZYt46C9UvwA6eOauROc6wkLeEjzOTvovc1e
         cxvA==
X-Gm-Message-State: AOJu0Yz6eD+nhMlay313OnJT7tEuyzR/8W8X9vhj3O3SIbg/ad5ku6wm
	iCpjddrJ3AmreMozsJ+3XqwtpMThqHARcQCBru8=
X-Google-Smtp-Source: AGHT+IEYexo/Jg6h/6UrOn2hidbvXvbHOzWUGXu70+z4cgRDGmYejbVfy4kL94mAsqJBBXqsMKr+3/npowypXAhrm4M=
X-Received: by 2002:a05:6214:dcf:b0:67a:a72d:fbb2 with SMTP id
 15-20020a0562140dcf00b0067aa72dfbb2mr7072849qvt.48.1702278931575; Sun, 10 Dec
 2023 23:15:31 -0800 (PST)
MIME-Version: 1.0
References: <20231208140349.3576-1-alex.kiernan@gmail.com> <20231208140349.3576-3-alex.kiernan@gmail.com>
 <a394853b1f2302baab431afe6fd0a1880b8238bd.camel@linuxfoundation.org> <CAO5Uq5RaQYvgye7a=qtwO2abDRP6WvggbKvjLpWuepJ1Rr3Z4A@mail.gmail.com>
In-Reply-To: <CAO5Uq5RaQYvgye7a=qtwO2abDRP6WvggbKvjLpWuepJ1Rr3Z4A@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 11 Dec 2023 08:15:20 +0100
Message-ID: <CA+cAkerS0D8ai-PhV=tiL=6kbbwbaSV2YTKS0oSrTksNpmDNqA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 3/7] rust: Upgrade 1.71.0 -> 1.71.1
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000006790e060c36b3e7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 07:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192144

--00000000000006790e060c36b3e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 10 Dec 2023 at 21:28, Alex Kiernan <alex.kiernan@gmail.com> wrote:

> On Sun, Dec 10, 2023 at 7:39=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2023-12-08 at 14:03 +0000, Alex Kiernan wrote:
> > > https://blog.rust-lang.org/2023/08/03/Rust-1.71.1.html
> > >
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > >
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
.bb}
> (100%)
> > >  rename meta/recipes-devtools/rust/{libstd-rs_1.71.0.bb =3D>
> libstd-rs_1.71.1.bb} (100%)
> > >  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.71.0.bb =3D=
>
> rust-cross-canadian_1.71.1.bb} (100%)
> > >  rename meta/recipes-devtools/rust/{rust-llvm_1.71.0.bb =3D>
> rust-llvm_1.71.1.bb} (100%)
> > >  rename meta/recipes-devtools/rust/{rust_1.71.0.bb =3D> rust_1.71.1.b=
b}
> (100%)
> > >
> > > diff --git a/meta/recipes-devtools/rust/cargo_1.71.0.bb
> b/meta/recipes-devtools/rust/cargo_1.71.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/cargo_1.71.0.bb
> > > rename to meta/recipes-devtools/rust/cargo_1.71.1.bb
> > > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
> b/meta/recipes-devtools/rust/libstd-rs_1.71.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
> > > rename to meta/recipes-devtools/rust/libstd-rs_1.71.1.bb
> > > diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb
> b/meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb
> > > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
> > > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
> b/meta/recipes-devtools/rust/rust-llvm_1.71.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
> > > rename to meta/recipes-devtools/rust/rust-llvm_1.71.1.bb
> > > diff --git a/meta/recipes-devtools/rust/rust-source.inc
> b/meta/recipes-devtools/rust/rust-source.inc
> > > index 3a192e42db7d..0729db6f0b45 100644
> > > --- a/meta/recipes-devtools/rust/rust-source.inc
> > > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > > @@ -7,7 +7,7 @@ SRC_URI +=3D "
> https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
> > >              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
> > >
> file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=3D$=
{RUSTSRC}
> \
> > >  "
> > > -SRC_URI[rust.sha256sum] =3D
> "5814699031aafdcc2e2f71fc9b389678cd7042350d1583da061463d8e88681c7"
> > > +SRC_URI[rust.sha256sum] =3D
> "371af0fbe04051e20a74dbea6d4e4e548f10f15309c49cae2688afb882b6c7f1"
> > >
> > >  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> > >
> > > diff --git a/meta/recipes-devtools/rust/rust_1.71.0.bb
> b/meta/recipes-devtools/rust/rust_1.71.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/rust/rust_1.71.0.bb
> > > rename to meta/recipes-devtools/rust/rust_1.71.1.bb
> >
> > I ran some testing and it looks like we could merge up to 1.71.1
> > without autobuilder failures in this series. Beyond that we have the
> > reproducibility and zvariant issues.
> >
>
> Thanks.
>
> Was the failure at that point reproducibility or the zvariant trait
> failure? I just posted an update for zvariant which doesn't see the
> trait recursion failure, but at the same time it no longer exercises
> crates pulled from git which looked like it was the main purpose it
> was fulfilling for testing.
>
> I didn't follow issues about this upgrade, but yes, the zvariant recipe
was a demonstration on how to handle crates dependencies that come from git=
.
(there is a specific crate fetcher url parameter: 'git-dependency')

If, for some reason, this is no more possible, the whole recipe can be
removed
(unless there is a direct dependency to zvariant in some  other recipes)


> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192125):
> https://lists.openembedded.org/g/openembedded-core/message/192125
> Mute This Topic: https://lists.openembedded.org/mt/103055164/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000006790e060c36b3e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, 10 Dec 2023 at 21:28, Alex Ki=
ernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Sun, Dec 10, 2023 at 7:39=E2=80=AFPM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, 2023-12-08 at 14:03 +0000, Alex Kiernan wrote:<br>
&gt; &gt; <a href=3D"https://blog.rust-lang.org/2023/08/03/Rust-1.71.1.html=
" rel=3D"noreferrer" target=3D"_blank">https://blog.rust-lang.org/2023/08/0=
3/Rust-1.71.1.html</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gm=
ail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/rust/{<a href=3D"http://cargo_1.71.0.=
bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71.0.bb</a> =3D&gt; <a hre=
f=3D"http://cargo_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.7=
1.1.bb</a>} | 0<br>
&gt; &gt;=C2=A0 .../rust/{<a href=3D"http://libstd-rs_1.71.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">libstd-rs_1.71.0.bb</a> =3D&gt; <a href=3D"http:=
//libstd-rs_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.71.=
1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://t-cross-canadian_1.71.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">t-cross-canadian_1.71.0.bb</a> =3D&gt; <a href=
=3D"http://rust-cross-canadian_1.71.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">rust-cross-canadian_1.71.1.bb</a>} | 0<br>
&gt; &gt;=C2=A0 .../rust/{<a href=3D"http://rust-llvm_1.71.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">rust-llvm_1.71.0.bb</a> =3D&gt; <a href=3D"http:=
//rust-llvm_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.71.=
1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/rust/rust-source.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/rust/{<a href=3D"http://rust_1.71.0.b=
b" rel=3D"noreferrer" target=3D"_blank">rust_1.71.0.bb</a> =3D&gt; <a href=
=3D"http://rust_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.1=
.bb</a>}=C2=A0 =C2=A0| 0<br>
&gt; &gt;=C2=A0 6 files changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http://cargo_=
1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71.0.bb</a> =3D&gt;=
 <a href=3D"http://cargo_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">ca=
rgo_1.71.1.bb</a>} (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http://libstd=
-rs_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.71.0.bb</a>=
 =3D&gt; <a href=3D"http://libstd-rs_1.71.1.bb" rel=3D"noreferrer" target=
=3D"_blank">libstd-rs_1.71.1.bb</a>} (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http://rust-c=
ross-canadian_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-ca=
nadian_1.71.0.bb</a> =3D&gt; <a href=3D"http://rust-cross-canadian_1.71.1.b=
b" rel=3D"noreferrer" target=3D"_blank">rust-cross-canadian_1.71.1.bb</a>} =
(100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http://rust-l=
lvm_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.71.0.bb</a>=
 =3D&gt; <a href=3D"http://rust-llvm_1.71.1.bb" rel=3D"noreferrer" target=
=3D"_blank">rust-llvm_1.71.1.bb</a>} (100%)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http://rust_1=
.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.0.bb</a> =3D&gt; <=
a href=3D"http://rust_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust_=
1.71.1.bb</a>} (100%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://cargo_1=
.71.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71.0.bb</a> b/meta/r=
ecipes-devtools/rust/<a href=3D"http://cargo_1.71.1.bb" rel=3D"noreferrer" =
target=3D"_blank">cargo_1.71.1.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http://cargo_1.=
71.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71.0.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://cargo_1.71=
.1.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.71.1.bb</a><br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://libstd-=
rs_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.71.0.bb</a> =
b/meta/recipes-devtools/rust/<a href=3D"http://libstd-rs_1.71.1.bb" rel=3D"=
noreferrer" target=3D"_blank">libstd-rs_1.71.1.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http://libstd-r=
s_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.71.0.bb</a><b=
r>
&gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://libstd-rs_=
1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.71.1.bb</a><br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust-cr=
oss-canadian_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-can=
adian_1.71.0.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http://rust-cro=
ss-canadian_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-cana=
dian_1.71.1.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http://rust-cro=
ss-canadian_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-cana=
dian_1.71.0.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://rust-cross=
-canadian_1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-canadi=
an_1.71.1.bb</a><br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust-ll=
vm_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.71.0.bb</a> =
b/meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_1.71.1.bb" rel=3D"=
noreferrer" target=3D"_blank">rust-llvm_1.71.1.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http://rust-llv=
m_1.71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.71.0.bb</a><b=
r>
&gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_=
1.71.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.71.1.bb</a><br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/re=
cipes-devtools/rust/rust-source.inc<br>
&gt; &gt; index 3a192e42db7d..0729db6f0b45 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/rust/rust-source.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/rust/rust-source.inc<br>
&gt; &gt; @@ -7,7 +7,7 @@ SRC_URI +=3D &quot;<a href=3D"https://static.rust=
-lang.org/dist/rustc-$%7BRUST_VERSION%7D-src.tar.xz;n" rel=3D"noreferrer" t=
arget=3D"_blank">https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-sr=
c.tar.xz;n</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://zlib-off64=
_t.patch;patchdir=3D${RUSTSRC} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-musl-=
Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=3D${RUSTSRC} \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt; -SRC_URI[rust.sha256sum] =3D &quot;5814699031aafdcc2e2f71fc9b3896=
78cd7042350d1583da061463d8e88681c7&quot;<br>
&gt; &gt; +SRC_URI[rust.sha256sum] =3D &quot;371af0fbe04051e20a74dbea6d4e4e=
548f10f15309c49cae2688afb882b6c7f1&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 RUSTSRC =3D &quot;${WORKDIR}/rustc-${RUST_VERSION}-src&quot=
;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.=
71.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.0.bb</a> b/meta/rec=
ipes-devtools/rust/<a href=3D"http://rust_1.71.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">rust_1.71.1.bb</a><br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/rust/<a href=3D"http://rust_1.7=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.0.bb</a><br>
&gt; &gt; rename to meta/recipes-devtools/rust/<a href=3D"http://rust_1.71.=
1.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.71.1.bb</a><br>
&gt;<br>
&gt; I ran some testing and it looks like we could merge up to 1.71.1<br>
&gt; without autobuilder failures in this series. Beyond that we have the<b=
r>
&gt; reproducibility and zvariant issues.<br>
&gt;<br>
<br>
Thanks.<br>
<br>
Was the failure at that point reproducibility or the zvariant trait<br>
failure? I just posted an update for zvariant which doesn&#39;t see the<br>
trait recursion failure, but at the same time it no longer exercises<br>
crates pulled from git which looked like it was the main purpose it<br>
was fulfilling for testing.<br>
<br></blockquote><div>I didn&#39;t follow issues about this upgrade, but ye=
s, the zvariant recipe</div><div>was a demonstration on how to handle crate=
s dependencies that come from git.</div><div>(there is a specific crate fet=
cher url parameter: &#39;git-dependency&#39;)</div><div><br></div><div>If, =
for some reason, this is no more possible, the whole recipe can be removed<=
/div><div>(unless there is a direct dependency to zvariant in some=C2=A0 ot=
her recipes)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
-- <br>
Alex Kiernan<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192125): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192125" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192125</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103055164/621=
3388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103055164/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000006790e060c36b3e7--

