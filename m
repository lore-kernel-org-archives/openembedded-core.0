Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C09DC4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 16:15:02 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.10573.1671293696342130165
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 08:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: aehs29@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id h6so2696036iof.9
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 08:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQRQHqn3VRPz1q8KfNbLb4sjDZs8dXvlDTUe44fChzw=;
        b=LmJhxy3wqjiEdWetocXWWWSc5TSCNRSTZaLfnPsPL/rJjFpJ2FnzLzeRnK3V6oeQk9
         jZEjnjqkkd7OWgeqU6JZ7VEXFmMFXhXEAQO+6Qe/kPzn6c3fe1DHrA0IS39EWcWiDBwR
         j4JxJHKwq0wUjvYZHJQMAqJNuiSd75XUkQiVJW7oD3I4Q2RfLOIliKA0TjosHJq59KNR
         s8XJvrO25IFIb6cRXCADwA6Luiy103H56nZqcjCdUlhtOoIiGY7YKKB7CphAgnnt4+F6
         roD2o6/4kFOEOM1lkskDiatZfluxIGMJAPNNEHg8TmNfRDsTwzjiL5NTsb/vMLnOGUKZ
         PD7A==
X-Gm-Message-State: ANoB5pnnjBuyn1DW9m2X7xnGJybsNj86Ws47NThBH+lB2Z3SrcELGA8p
	pKLAjmecWEqzI4SvHXrgvfJ4LkaBS/lvnA==
X-Google-Smtp-Source: AA0mqf7QhigNvswej5flVSGJLgyXgQyIfdaRMpnZ5nDXA6FKsZnhOHqlnWM5HPkGr5beF773v6sdFg==
X-Received: by 2002:a5d:8909:0:b0:6df:74a6:2144 with SMTP id b9-20020a5d8909000000b006df74a62144mr22532903ion.7.1671293695159;
        Sat, 17 Dec 2022 08:14:55 -0800 (PST)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id c10-20020a0566022d0a00b006cf3a1c02e6sm1858265iow.15.2022.12.17.08.14.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 08:14:54 -0800 (PST)
Received: by mail-io1-f53.google.com with SMTP id 3so2688663iou.12
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 08:14:54 -0800 (PST)
X-Received: by 2002:a02:95e9:0:b0:38a:3a8a:91cc with SMTP id
 b96-20020a0295e9000000b0038a3a8a91ccmr11647229jai.42.1671293694468; Sat, 17
 Dec 2022 08:14:54 -0800 (PST)
MIME-Version: 1.0
References: <20221217012158.923251-1-alejandro@enedino.org> <2819d42c2b62ba3e815f21adbe07b27cd1d72868.camel@linuxfoundation.org>
In-Reply-To: <2819d42c2b62ba3e815f21adbe07b27cd1d72868.camel@linuxfoundation.org>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Sat, 17 Dec 2022 09:14:44 -0700
X-Gmail-Original-Message-ID: <CAHMutrYuJejy8RSTsOU7zpOY8+YN4BLVzn+HC=-8v3g7HZ1_1w@mail.gmail.com>
Message-ID: <CAHMutrYuJejy8RSTsOU7zpOY8+YN4BLVzn+HC=-8v3g7HZ1_1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Enable building rust from stable, beta
 and nightly channels
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f9677a05f0086210"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 16:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174778

--000000000000f9677a05f0086210
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 17, 2022, 2:56 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2022-12-16 at 18:21 -0700, Alejandro Hernandez Samaniego wrote:
> > From: Alejandro Hernandez Samaniego <alejandro@enedino.org>
> >
> > Rust follows the train release model via the stable, beta and nightly
> channels,
> > by default we build rust from the stable channel, however there are
> certain
> > features which are only available in the beta or nightly channels.
> >
> > Make these channels available by setting a RUST_CHANNEL variable which
> defaults
> > to stable making this change transparent to the user.
> >
> > The snapshot version used by rust during its compilation wont
> necessarily match
> > the version being built, specially if were building from an unstable
> channel,
> > to avoid confusion rename this to SNAPSHOT_VERSION and use RUST_VERSION
> for the
> > version to be built, which is automatically defined to PV.
> >
> > Append -beta or -nightly to rusts PV for signature awareness.
> >
> > It is important to note that this does not build rust from the
> beta/nightly
> > published tarball (which today build rust v1.67.0 and v1.68.0
> respectively),
> > instead this builds rust from the current selected version (1.66.0) and
> enables
> > the beta/nightly features for that version.
> >
> > Setting the variable RUST_CHANNEL=nightly results in the following:
> >
> > $ rustc -Vv
> > rustc 1.66.0-nightly
> >
> > Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
> > ---
> >  meta/recipes-devtools/rust/rust-snapshot.inc | 7 ++++---
> >  meta/recipes-devtools/rust/rust-source.inc   | 5 +++--
> >  meta/recipes-devtools/rust/rust.inc          | 6 +++++-
> >  3 files changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc
> b/meta/recipes-devtools/rust/rust-snapshot.inc
> > index 222f34f9a8..6420bcff55 100644
> > --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> > +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> > @@ -5,7 +5,8 @@
> >  ## The version is replicated here.
> >  ## TODO: find a way to add additional SRC_URIs based on the contents of
> an
> >  ##       earlier SRC_URI.
> > -RS_VERSION = "1.65.0"
> > +
> > +SNAPSHOT_VERSION = "1.65.0"
> >  CARGO_VERSION = "1.65.0"
> >
> >  # TODO: Add hashes for other architecture toolchains as well. Make a
> script?
> > @@ -27,6 +28,6 @@ SRC_URI += " \
> >
> https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=cargo-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components
> \
> >  "
> >
> > -RUST_STD_SNAPSHOT =
> "rust-std-${RS_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
> > -RUSTC_SNAPSHOT =
> "rustc-${RS_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
> > +RUST_STD_SNAPSHOT =
> "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
> > +RUSTC_SNAPSHOT =
> "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
> >  CARGO_SNAPSHOT =
> "cargo-${CARGO_VERSION}-${RUST_BUILD_ARCH}-unknown-linux-gnu"
> > diff --git a/meta/recipes-devtools/rust/rust-source.inc
> b/meta/recipes-devtools/rust/rust-source.inc
> > index 1c511917e2..91a6c5a942 100644
> > --- a/meta/recipes-devtools/rust/rust-source.inc
> > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > @@ -1,4 +1,5 @@
> > -SRC_URI += "
> https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
> > +RUST_VERSION ?= "${@d.getVar('PV').split('-')[0]}"
> > +SRC_URI += "
> https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;name=rust
> "
> >  SRC_URI[rust.sha256sum] =
> "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c"
> >
> >  SRC_URI:append:class-target:pn-rust = " \
> > @@ -6,7 +7,7 @@ SRC_URI:append:class-target:pn-rust = " \
> >      file://crossbeam_atomic.patch"
> >  SRC_URI:append:class-nativesdk:pn-nativesdk-rust = "
> file://hardcodepaths.patch"
> >
> > -RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
> > +RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
> >
> >  UPSTREAM_CHECK_URI = "
> https://forge.rust-lang.org/infra/other-installation-methods.html"
> >  UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
> > diff --git a/meta/recipes-devtools/rust/rust.inc
> b/meta/recipes-devtools/rust/rust.inc
> > index 8d25e7993a..37a04e1204 100644
> > --- a/meta/recipes-devtools/rust/rust.inc
> > +++ b/meta/recipes-devtools/rust/rust.inc
> > @@ -13,6 +13,10 @@ DEPENDS:append:class-nativesdk = "
> nativesdk-rust-llvm"
> >
> >  S = "${RUSTSRC}"
> >
> > +# Use at your own risk, accepted values are stable, beta and nightly
> > +RUST_CHANNEL ?= "stable"
> > +PV:append = "${@bb.utils.contains('RUST_CHANNEL', 'stable', '',
> '-${RUST_CHANNEL}', d)}"
> > +
> >  export FORCE_CRATE_HASH="${BB_TASKHASH}"
>
> Did you try it with .= instead of append? I'd really prefer not to use
> append unless we have to, mainly so we lead by example...
>
> Cheers,
>
> Richard


You are right, I should've done this with .= instead, my mistake, I will
test it and send a v3.

Cheers,

Alejandro

>


>
>
>
>

--000000000000f9677a05f0086210
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,sans-serif;font-size:small"><br></div></div=
><div dir=3D"auto"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Sat, Dec 17, 2022, 2:56 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Fri, 2022-12-16 at 18:21 -0700, Alejandro Hernan=
dez Samaniego wrote:<br>
&gt; From: Alejandro Hernandez Samaniego &lt;<a href=3D"mailto:alejandro@en=
edino.org" rel=3D"noreferrer" target=3D"_blank">alejandro@enedino.org</a>&g=
t;<br>
&gt; <br>
&gt; Rust follows the train release model via the stable, beta and nightly =
channels,<br>
&gt; by default we build rust from the stable channel, however there are ce=
rtain<br>
&gt; features which are only available in the beta or nightly channels.<br>
&gt; <br>
&gt; Make these channels available by setting a RUST_CHANNEL variable which=
 defaults<br>
&gt; to stable making this change transparent to the user.<br>
&gt; <br>
&gt; The snapshot version used by rust during its compilation wont necessar=
ily match<br>
&gt; the version being built, specially if were building from an unstable c=
hannel,<br>
&gt; to avoid confusion rename this to SNAPSHOT_VERSION and use RUST_VERSIO=
N for the<br>
&gt; version to be built, which is automatically defined to PV.<br>
&gt; <br>
&gt; Append -beta or -nightly to rusts PV for signature awareness.<br>
&gt; <br>
&gt; It is important to note that this does not build rust from the beta/ni=
ghtly<br>
&gt; published tarball (which today build rust v1.67.0 and v1.68.0 respecti=
vely),<br>
&gt; instead this builds rust from the current selected version (1.66.0) an=
d enables<br>
&gt; the beta/nightly features for that version.<br>
&gt; <br>
&gt; Setting the variable RUST_CHANNEL=3Dnightly results in the following:<=
br>
&gt; <br>
&gt; $ rustc -Vv<br>
&gt; rustc 1.66.0-nightly<br>
&gt; <br>
&gt; Signed-off-by: Alejandro Hernandez Samaniego &lt;<a href=3D"mailto:ale=
jandro@enedino.org" rel=3D"noreferrer" target=3D"_blank">alejandro@enedino.=
org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/rust/rust-snapshot.inc | 7 ++++---<br>
&gt;=C2=A0 meta/recipes-devtools/rust/rust-source.inc=C2=A0 =C2=A0| 5 +++--=
<br>
&gt;=C2=A0 meta/recipes-devtools/rust/rust.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 6 +++++-<br>
&gt;=C2=A0 3 files changed, 12 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recip=
es-devtools/rust/rust-snapshot.inc<br>
&gt; index 222f34f9a8..6420bcff55 100644<br>
&gt; --- a/meta/recipes-devtools/rust/rust-snapshot.inc<br>
&gt; +++ b/meta/recipes-devtools/rust/rust-snapshot.inc<br>
&gt; @@ -5,7 +5,8 @@<br>
&gt;=C2=A0 ## The version is replicated here.<br>
&gt;=C2=A0 ## TODO: find a way to add additional SRC_URIs based on the cont=
ents of an<br>
&gt;=C2=A0 ##=C2=A0 =C2=A0 =C2=A0 =C2=A0earlier SRC_URI.<br>
&gt; -RS_VERSION =3D &quot;1.65.0&quot;<br>
&gt; +<br>
&gt; +SNAPSHOT_VERSION =3D &quot;1.65.0&quot;<br>
&gt;=C2=A0 CARGO_VERSION =3D &quot;1.65.0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # TODO: Add hashes for other architecture toolchains as well. Ma=
ke a script?<br>
&gt; @@ -27,6 +28,6 @@ SRC_URI +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://static.rust-lang.org/dist/$%7BC=
ARGO_SNAPSHOT%7D.tar.xz;name=3Dcargo-snapshot-$%7BRUST_BUILD_ARCH%7D;subdir=
=3Drust-snapshot-components" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=3Dcargo-s=
napshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt; -RUST_STD_SNAPSHOT =3D &quot;rust-std-${RS_VERSION}-${RUST_BUILD_ARCH}=
-unknown-linux-gnu&quot;<br>
&gt; -RUSTC_SNAPSHOT =3D &quot;rustc-${RS_VERSION}-${RUST_BUILD_ARCH}-unkno=
wn-linux-gnu&quot;<br>
&gt; +RUST_STD_SNAPSHOT =3D &quot;rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD=
_ARCH}-unknown-linux-gnu&quot;<br>
&gt; +RUSTC_SNAPSHOT =3D &quot;rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}=
-unknown-linux-gnu&quot;<br>
&gt;=C2=A0 CARGO_SNAPSHOT =3D &quot;cargo-${CARGO_VERSION}-${RUST_BUILD_ARC=
H}-unknown-linux-gnu&quot;<br>
&gt; diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes=
-devtools/rust/rust-source.inc<br>
&gt; index 1c511917e2..91a6c5a942 100644<br>
&gt; --- a/meta/recipes-devtools/rust/rust-source.inc<br>
&gt; +++ b/meta/recipes-devtools/rust/rust-source.inc<br>
&gt; @@ -1,4 +1,5 @@<br>
&gt; -SRC_URI +=3D &quot;<a href=3D"https://static.rust-lang.org/dist/rustc=
-$%7BPV%7D-src.tar.xz;name=3Drust" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=3Drus=
t</a>&quot;<br>
&gt; +RUST_VERSION ?=3D &quot;${@d.getVar(&#39;PV&#39;).split(&#39;-&#39;)[=
0]}&quot;<br>
&gt; +SRC_URI +=3D &quot;<a href=3D"https://static.rust-lang.org/dist/rustc=
-$%7BRUST_VERSION%7D-src.tar.xz;name=3Drust" rel=3D"noreferrer noreferrer" =
target=3D"_blank">https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-s=
rc.tar.xz;name=3Drust</a>&quot;<br>
&gt;=C2=A0 SRC_URI[rust.sha256sum] =3D &quot;0dc176e34fae9871f855a6ba4cb30f=
a19d69c5b4428d29281a07419c4950715c&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI:append:class-target:pn-rust =3D &quot; \<br>
&gt; @@ -6,7 +7,7 @@ SRC_URI:append:class-target:pn-rust =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://crossbeam_atomic.patch&quot;<br>
&gt;=C2=A0 SRC_URI:append:class-nativesdk:pn-nativesdk-rust =3D &quot; file=
://hardcodepaths.patch&quot;<br>
&gt;=C2=A0 <br>
&gt; -RUSTSRC =3D &quot;${WORKDIR}/rustc-${PV}-src&quot;<br>
&gt; +RUSTSRC =3D &quot;${WORKDIR}/rustc-${RUST_VERSION}-src&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://forge.rust-lang.=
org/infra/other-installation-methods.html" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://forge.rust-lang.org/infra/other-installation-method=
s.html</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;rustc-(?P&lt;pver&gt;\d+(\.\d+)+)=
-src&quot;<br>
&gt; diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtoo=
ls/rust/rust.inc<br>
&gt; index 8d25e7993a..37a04e1204 100644<br>
&gt; --- a/meta/recipes-devtools/rust/rust.inc<br>
&gt; +++ b/meta/recipes-devtools/rust/rust.inc<br>
&gt; @@ -13,6 +13,10 @@ DEPENDS:append:class-nativesdk =3D &quot; nativesdk=
-rust-llvm&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 S =3D &quot;${RUSTSRC}&quot;<br>
&gt;=C2=A0 <br>
&gt; +# Use at your own risk, accepted values are stable, beta and nightly<=
br>
&gt; +RUST_CHANNEL ?=3D &quot;stable&quot;<br>
&gt; +PV:append =3D &quot;${@bb.utils.contains(&#39;RUST_CHANNEL&#39;, &#39=
;stable&#39;, &#39;&#39;, &#39;-${RUST_CHANNEL}&#39;, d)}&quot;<br>
&gt; +<br>
&gt;=C2=A0 export FORCE_CRATE_HASH=3D&quot;${BB_TASKHASH}&quot;<br>
<br>
Did you try it with .=3D instead of append? I&#39;d really prefer not to us=
e<br>
append unless we have to, mainly so we lead by example...<br>
<br>
Cheers,<br>
<br>
Richard<span class=3D"gmail_default" style=3D"font-family:arial,sans-serif;=
font-size:small"></span></blockquote><div><br></div><div class=3D"gmail_def=
ault" style=3D"font-family:arial,sans-serif;font-size:small">You are right,=
 I should&#39;ve done this with .=3D instead, my mistake, I will test it an=
d send a v3.</div><div class=3D"gmail_default" style=3D"font-family:arial,s=
ans-serif;font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-family:arial,sans-serif;font-size:small">Cheers,</div><div class=3D"gm=
ail_default" style=3D"font-family:arial,sans-serif;font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-=
size:small">Alejandro</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><spa=
n class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:s=
mall"></span><br>
<br>
<br><br>
</blockquote></div></div>
</div></div>

--000000000000f9677a05f0086210--

