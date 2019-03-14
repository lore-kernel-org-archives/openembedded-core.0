Return-Path: <kergoth@gmail.com>
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
	[209.85.167.170])
	by mail.openembedded.org (Postfix) with ESMTP id 84CAA6B7C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 18:44:46 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id b4so5271299oif.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pXcPhqSsKYeihfxOE5na9tN71lGs40APZcmbw8zCWFw=;
	b=pnh6s4T0JX9HEJBnrcgUIUSUZaM8WpUS7HX4AIke17lpT46LXU8ztaCw+6otE6QaIn
	SvYTb2p1MFg+b8RtyDuknZhSFtBNIAI6226sBKeQGlb9hjYFklHw0nRVPx5MR+bh5tRG
	VuQNBYCbKjXwKT6KBKuBwio/v3Hdowvk23lSR2GrGx21b6WyjL/8/SFesc8FjVwtnhhb
	oOVtCKF+djJj6msBz1xzEkKmdtdQwkjHJDZm8HakK6qld2DFn1gQBAmpwv8tXxqjyFAG
	hBwuh/5ps5o8odwuFmSBKGQhepfMufCvNKMq+8V9TXApnW9uSj4pdJVXw6ha+mj6oWln
	d5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pXcPhqSsKYeihfxOE5na9tN71lGs40APZcmbw8zCWFw=;
	b=NmMLwJkd/uQNfPvYQAkD6BIZUnzOuFWy8B4Vu1cktcIJNYJTtMqcrC0nLF/+r0g8yq
	Q/2TGjC5jDt+dSEgfIKsdbi/1wIJfQVmJBHRSRqGFc2ykw5wDxcEtjbbrdzixjkuVbZp
	w13zS7EZpmStLvaU2H6zgfLeP/1XVRInrdhVAAMdtfDugeDI90GyvLaHUMRbtEtV7k81
	kjazcaxFmOM9BroI8p+xr+gYB1AcyoiFMa/MU4SFX7RD0yS3GvLFyRpf+LtjTs2AS4u2
	e2kyJJuNDz+590ENS8Sn4TgeMf1EzTUeSO9V3pM5Ag19n5z0+2sKK+JuxdCJ746dOEVH
	NiBQ==
X-Gm-Message-State: APjAAAUIuB0ORxfc7SmuzUArhkhWkXjWFPqmWfqruCXvYm3Il9vsl1PH
	tYZzwPKEfwzXts0ER3pMPApb125ohbGtIfuDQO8=
X-Google-Smtp-Source: APXvYqxHc2dweC4MpIv2/UvktRNwFa5ouSOTIY5azWQLA3HQkBH/aZwN+25uLlTjIqlEjkMOwU6ns+7G27wCIlFuU3k=
X-Received: by 2002:aca:b886:: with SMTP id i128mr3037848oif.65.1552589087115; 
	Thu, 14 Mar 2019 11:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <1552499826-26884-1-git-send-email-mark.asselstine@windriver.com>
	<CABcZANmQp3PNhqGMwekPmiaq=prZBBwtPftzJvzeTYJFYfDRDA@mail.gmail.com>
	<2708854.tNq2jWpnpt@yow-masselst-lx1>
In-Reply-To: <2708854.tNq2jWpnpt@yow-masselst-lx1>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 14 Mar 2019 11:44:35 -0700
Message-ID: <CABcZAN=zWYoO_uPrs5--1O-eFHXUHwzweBYHj4sRkkTVqEEpRA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] go.bbclass: Export GOARM
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2019 18:44:46 -0000
Content-Type: multipart/alternative; boundary="000000000000050f6d0584125129"

--000000000000050f6d0584125129
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good to know, thanks. Possibly something to improve in bitbake at some
point in the future.

On Thu, Mar 14, 2019 at 11:32 AM Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Wednesday, March 13, 2019 3:40:18 PM EDT Christopher Larson wrote:
> > How would bitbake respond to an =E2=80=98export=E2=80=99 line with the =
empty string? I.e.
> > can you do an actual conditional export the way we do conditional
> inherits,
> > so it still is only exported for arm, even if the value is set to the
> empty
> > string for others?
>
> Unfortunately no. It is a parsing error.
>
> I am working on alternatives and will hopefully have something out shortl=
y.
>
> MarkA
>
> >
> > On Wed, Mar 13, 2019 at 10:57 AM Mark Asselstine <
> >
> > mark.asselstine@windriver.com> wrote:
> > > When building GO packages for ARM (v5, v6, v7) it is expected that th=
e
> > > GOARM env variable is set during the build. Not having GOARM exported
> > > will result in GO binaries which can't be executed on the target
> > > (terminate with segfault). Per https://github.com/golang/go/wiki/GoAr=
m
> > >
> > > We already have the logic in goarch.bbclass to determine the correct
> > > value of GOARM (see GOARM_TARGET), but currently this is only used to
> > > build go itself (go-cross_1.*.bb requires go-cross.inc --> export
> > > GOARM =3D "${TARGET_GOARM}").
> > >
> > > Here we export GOARM but we do it such that it is only exported if we
> > > are building for 'arm' and only when recipes requiring/inheriting
> > > go.bbclass are be used to build for the target.
> > >
> > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > ---
> > >
> > > Richard,
> > >
> > > MarkH and I were debating this one some. He was suggesting I add
> > > 'GOARM ?=3D ""' so as not to leave things undefined for non-arm targe=
t
> > > builds. I however, like the behavior of this as submitted here as
> > > non-arm target builds don't get polluted with a useless export in
> > > their do_compile scripts and such. The question is as presented here
> > > is the behavior deterministic?
> > >
> > >
> > > meta/classes/go.bbclass | 3 +++
> > >
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> > > index af331f8..72e2c29 100644
> > > --- a/meta/classes/go.bbclass
> > > +++ b/meta/classes/go.bbclass
> > > @@ -8,6 +8,9 @@ GOROOT =3D "${STAGING_LIBDIR}/go"
> > >
> > >  export GOROOT
> > >  export GOROOT_FINAL =3D "${libdir}/go"
> > >
> > > +GOARM_arm_class-target =3D "${TARGET_GOARM}"
> > > +export GOARM
> > > +
> > >
> > >  DEPENDS_GOLANG_class-target =3D "virtual/${TUNE_PKGARCH}-go
> > >
> > > virtual/${TARGET_PREFIX}go-runtime"
> > >
> > >  DEPENDS_GOLANG_class-native =3D "go-native"
> > >  DEPENDS_GOLANG_class-nativesdk =3D "virtual/${TARGET_PREFIX}go-cross=
sdk
> > >
> > > virtual/${TARGET_PREFIX}go-runtime"
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
>

--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000050f6d0584125129
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good to know, thanks. Possibly something to improve in bit=
bake at some point in the future.</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 14, 2019 at 11:32 AM Mark Asse=
lstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com">mark.asselstine=
@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:sol=
id;border-left-color:rgb(204,204,204);padding-left:1ex">On Wednesday, March=
 13, 2019 3:40:18 PM EDT Christopher Larson wrote:<br>
&gt; How would bitbake respond to an =E2=80=98export=E2=80=99 line with the=
 empty string? I.e.<br>
&gt; can you do an actual conditional export the way we do conditional inhe=
rits,<br>
&gt; so it still is only exported for arm, even if the value is set to the =
empty<br>
&gt; string for others?<br>
<br>
Unfortunately no. It is a parsing error.<br>
<br>
I am working on alternatives and will hopefully have something out shortly.=
<br>
<br>
MarkA<br>
<br>
&gt; <br>
&gt; On Wed, Mar 13, 2019 at 10:57 AM Mark Asselstine &lt;<br>
&gt; <br>
&gt; <a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mar=
k.asselstine@windriver.com</a>&gt; wrote:<br>
&gt; &gt; When building GO packages for ARM (v5, v6, v7) it is expected tha=
t the<br>
&gt; &gt; GOARM env variable is set during the build. Not having GOARM expo=
rted<br>
&gt; &gt; will result in GO binaries which can&#39;t be executed on the tar=
get<br>
&gt; &gt; (terminate with segfault). Per <a href=3D"https://github.com/gola=
ng/go/wiki/GoArm" rel=3D"noreferrer" target=3D"_blank">https://github.com/g=
olang/go/wiki/GoArm</a><br>
&gt; &gt; <br>
&gt; &gt; We already have the logic in goarch.bbclass to determine the corr=
ect<br>
&gt; &gt; value of GOARM (see GOARM_TARGET), but currently this is only use=
d to<br>
&gt; &gt; build go itself (go-cross_1.*.bb requires go-cross.inc --&gt; exp=
ort<br>
&gt; &gt; GOARM =3D &quot;${TARGET_GOARM}&quot;).<br>
&gt; &gt; <br>
&gt; &gt; Here we export GOARM but we do it such that it is only exported i=
f we<br>
&gt; &gt; are building for &#39;arm&#39; and only when recipes requiring/in=
heriting<br>
&gt; &gt; go.bbclass are be used to build for the target.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselst=
ine@windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<=
br>
&gt; &gt; ---<br>
&gt; &gt; <br>
&gt; &gt; Richard,<br>
&gt; &gt; <br>
&gt; &gt; MarkH and I were debating this one some. He was suggesting I add<=
br>
&gt; &gt; &#39;GOARM ?=3D &quot;&quot;&#39; so as not to leave things undef=
ined for non-arm target<br>
&gt; &gt; builds. I however, like the behavior of this as submitted here as=
<br>
&gt; &gt; non-arm target builds don&#39;t get polluted with a useless expor=
t in<br>
&gt; &gt; their do_compile scripts and such. The question is as presented h=
ere<br>
&gt; &gt; is the behavior deterministic?<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; meta/classes/go.bbclass | 3 +++<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass<br=
>
&gt; &gt; index af331f8..72e2c29 100644<br>
&gt; &gt; --- a/meta/classes/go.bbclass<br>
&gt; &gt; +++ b/meta/classes/go.bbclass<br>
&gt; &gt; @@ -8,6 +8,9 @@ GOROOT =3D &quot;${STAGING_LIBDIR}/go&quot;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 export GOROOT<br>
&gt; &gt;=C2=A0 export GOROOT_FINAL =3D &quot;${libdir}/go&quot;<br>
&gt; &gt; <br>
&gt; &gt; +GOARM_arm_class-target =3D &quot;${TARGET_GOARM}&quot;<br>
&gt; &gt; +export GOARM<br>
&gt; &gt; +<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 DEPENDS_GOLANG_class-target =3D &quot;virtual/${TUNE_PKGARC=
H}-go<br>
&gt; &gt; <br>
&gt; &gt; virtual/${TARGET_PREFIX}go-runtime&quot;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 DEPENDS_GOLANG_class-native =3D &quot;go-native&quot;<br>
&gt; &gt;=C2=A0 DEPENDS_GOLANG_class-nativesdk =3D &quot;virtual/${TARGET_P=
REFIX}go-crosssdk<br>
&gt; &gt; <br>
&gt; &gt; virtual/${TARGET_PREFIX}go-runtime&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.7.4<br>
&gt; &gt; <br>
&gt; &gt; --<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/mailman/listinfo/openembedded-core</a><br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christoph=
er Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></d=
iv>

--000000000000050f6d0584125129--
