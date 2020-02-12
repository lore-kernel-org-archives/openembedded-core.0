Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3C751600A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 15:30:35 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id a2so1747835vso.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 07:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p0wiuxj52b4r2/uAXAN51qGXC0FE1bY5AuFw4oaYVIk=;
	b=TUdrXeimbgBoTJbgSWI09WuRw6HRdPSEzV6vJ3Ng1db8yK4JMRs/ewdkwCnsQ8k1A3
	p7IhixbAUP0n5DlkQtNeitIr6h9RbOelQk0Vs/Ule3zkqSJUNW4vFyOjUCgyw1LWCO0F
	2M5zbD731kAAXXJA8HVCkXOuHwfZpHKMKoPYQlKGQ23IALRq4wYdr9oYKrgsNJOUVR7H
	D6tebGKIR+95/hmTwYNXvjQ/fA+O9zrhBuHVzHmXib4IOfATdOuOgbMLkeFgra9o0wXz
	BDiMJ4GJVwEmatbJksPM1u4l+ckmfiFStcsTb866VSE0HKGSwoTBCP78Rrh1TCHJ8y2p
	vSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p0wiuxj52b4r2/uAXAN51qGXC0FE1bY5AuFw4oaYVIk=;
	b=mIltZPQWMYK7RGAzWAoHnCqDBqsLd7eHluv+Ppd1zCaEio7UZY11WGSMQ6lJNVdr4h
	jBpo5000JIs7Ustego7zoZDJ6EgP+zUVtAbmDp2H4w567FdCQEEvBGqoDPht6+cbIPF1
	x6G2srSgcfH+vLXNcuezbX09aH4H1m+epGNYedNyWLpZZjDCRNEB5S187b/uhM0ZdbWM
	ctQwo0LYfgXYQYtE6oE4I0zmMK19XpOF77bXlsFsa+d/HQew0+3Os9GsXaEip4HUmuvd
	y8Ot68RMrAtO7TMTVhINaZLPcfsc4a63lprQbjnxRwufTrPUKyk+3NFUl9BeuBhsBK4i
	/DNQ==
X-Gm-Message-State: APjAAAUxiK7si+JZzxH6gRCeKnDPgvvIOzJtuz91bsGQHPIXRngB8neT
	C/aOksv7X7P1zABRqmGVOsOB6HDDL4E/8PQp9uI=
X-Google-Smtp-Source: APXvYqwj1WuzlKQqoHvuzGPfx4rPM8ib5NYL1hSw6Ll9jtZxVPJrEBhGc1wrisjZcVaR4YcRgoJ+qpdcJ86dUDBNEJ0=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr12835526vsa.25.1581521436080; 
	Wed, 12 Feb 2020 07:30:36 -0800 (PST)
MIME-Version: 1.0
References: <20200212051936.1610922-1-raj.khem@gmail.com>
	<CANNYZj9478oh1cNgK0U5oq8RX=q8VMYZpCnPZ8akgvUtQExFmg@mail.gmail.com>
	<CAMKF1srv-UPO0OjHKqqwu0GPW-rcdcO+0NJSnR4B0s-V43i8pg@mail.gmail.com>
In-Reply-To: <CAMKF1srv-UPO0OjHKqqwu0GPW-rcdcO+0NJSnR4B0s-V43i8pg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2020 16:30:19 +0100
Message-ID: <CANNYZj-oaJNCXzPVkkm_B1eTg+75SiDPbkd=iYQkDJeVyTFfQA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Wed, 12 Feb 2020 15:30:35 -0000
Content-Type: multipart/alternative; boundary="00000000000066fe51059e62a7b1"

--00000000000066fe51059e62a7b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maybe we can package rpm better so that the binaries and the libraries go
into separate packages? Then libsolv would only pull in the rpm libraries
and rpm tests would be skipped?

Alex

On Wed 12. Feb 2020 at 16.12, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Feb 11, 2020 at 11:11 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Please let=E2=80=99s try to avoid anonymous python. What problem does t=
his
> solve? If package_rpm is not enabled, then there should not be a dependen=
cy
> chain that builds these anyway.
>
> for non rpm backend opkg, rpm is pulled in which is not desired
> because opkg depends on libsolv
> and libsolv by default depends on rpm which I sent another patch to
> decouple, This caused opkg images to fail tests because testing infra
> found rpm in the image and ran tests for it which obviously would
> fail.
>
>  libsolv does have rpm support as packageconfig but when that
> is disabled then libdnf does not build anymore since it expects rpmdb
> support in libsolv.
>
> so when we do world builds with opkg as package management then dnf
> and libdbf starts to fail
> due to their RPM needs.
>
> IF there was an override to identity packaging backends then we could
> have used that
>
> If you have better suggestions to avoid anon python here, I am all ears.
>
> >
> > Alex
> >
> > On Wed 12. Feb 2020 at 6.20, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> dnf does not work with opkg or dpkg/apt anyway
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 8 ++++++++
> >>  meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 7 +++++++
> >>  2 files changed, 15 insertions(+)
> >>
> >> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> >> index f38167f1ad..9e6d5741af 100644
> >> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> >> +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> >> @@ -84,3 +84,11 @@ SYSTEMD_SERVICE_${PN} =3D "dnf-makecache.service
> dnf-makecache.timer \
> >>                           dnf-automatic-notifyonly.service
> dnf-automatic-notifyonly.timer \
> >>  "
> >>  SYSTEMD_AUTO_ENABLE ?=3D "disable"
> >> +
> >> +python () {
> >> +    pkgb =3D d.getVar("PACKAGE_CLASSES")
> >> +    pkgn =3D d.getVar("PN")
> >> +    pkgv =3D d.getVar("PV")
> >> +    if "package_rpm" not in pkgb:
> >> +        raise bb.parse.SkipPackage("%s-%s Needs rpmdb support in
> libsolv" % (pkgn, pkgv))
> >> +}
> >> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> >> index 882c435b32..5c9326ca64 100644
> >> --- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> >> +++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> >> @@ -27,3 +27,10 @@ EXTRA_OECMAKE_append_class-nativesdk =3D "
> -DWITH_GIR=3DOFF"
> >>
> >>  BBCLASSEXTEND =3D "native nativesdk"
> >>
> >> +python () {
> >> +    pkgb =3D d.getVar("PACKAGE_CLASSES")
> >> +    pkgn =3D d.getVar("PN")
> >> +    pkgv =3D d.getVar("PV")
> >> +    if "package_rpm" not in pkgb:
> >> +        raise bb.parse.SkipPackage("%s-%s Needs rpmdb support in
> libsolv" % (pkgn, pkgv))
> >> +}
> >> --
> >> 2.25.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000066fe51059e62a7b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Maybe we can package rpm better so that the binaries=
 and the libraries go into separate packages? Then libsolv would only pull =
in the rpm libraries and rpm tests would be skipped?</div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 12. Feb 2020 at 16.12, K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, Feb 11, 2020 at 11=
:11 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Please let=E2=80=99s try to avoid anonymous python. What problem does =
this solve? If package_rpm is not enabled, then there should not be a depen=
dency chain that builds these anyway.<br>
<br>
for non rpm backend opkg, rpm is pulled in which is not desired<br>
because opkg depends on libsolv<br>
and libsolv by default depends on rpm which I sent another patch to<br>
decouple, This caused opkg images to fail tests because testing infra<br>
found rpm in the image and ran tests for it which obviously would<br>
fail.<br>
<br>
=C2=A0libsolv does have rpm support as packageconfig but when that<br>
is disabled then libdnf does not build anymore since it expects rpmdb<br>
support in libsolv.<br>
<br>
so when we do world builds with opkg as package management then dnf<br>
and libdbf starts to fail<br>
due to their RPM needs.<br>
<br>
IF there was an override to identity packaging backends then we could<br>
have used that<br>
<br>
If you have better suggestions to avoid anon python here, I am all ears.<br=
>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Wed 12. Feb 2020 at 6.20, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; dnf does not work with opkg or dpkg/apt anyway<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" re=
l=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 8 ++++++++<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a> | 7 +++++++<=
br>
&gt;&gt;=C2=A0 2 files changed, 15 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2=
.bb" rel=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a> b/meta/recipes-d=
evtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">dnf_4.2.2.bb</a><br>
&gt;&gt; index f38167f1ad..9e6d5741af 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" re=
l=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" re=
l=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
&gt;&gt; @@ -84,3 +84,11 @@ SYSTEMD_SERVICE_${PN} =3D &quot;dnf-makecache.s=
ervice dnf-makecache.timer \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnf-automatic-notifyonly.service dnf-automat=
ic-notifyonly.timer \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt;&gt;=C2=A0 SYSTEMD_AUTO_ENABLE ?=3D &quot;disable&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +python () {<br>
&gt;&gt; +=C2=A0 =C2=A0 pkgb =3D d.getVar(&quot;PACKAGE_CLASSES&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 pkgn =3D d.getVar(&quot;PN&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 pkgv =3D d.getVar(&quot;PV&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 if &quot;package_rpm&quot; not in pkgb:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;%s-%=
s Needs rpmdb support in libsolv&quot; % (pkgn, pkgv))<br>
&gt;&gt; +}<br>
&gt;&gt; diff --git a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf=
_0.28.1.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a> b/met=
a/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
&gt;&gt; index 882c435b32..5c9326ca64 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
&gt;&gt; @@ -27,3 +27,10 @@ EXTRA_OECMAKE_append_class-nativesdk =3D &quot;=
 -DWITH_GIR=3DOFF&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;&gt;<br>
&gt;&gt; +python () {<br>
&gt;&gt; +=C2=A0 =C2=A0 pkgb =3D d.getVar(&quot;PACKAGE_CLASSES&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 pkgn =3D d.getVar(&quot;PN&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 pkgv =3D d.getVar(&quot;PV&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 if &quot;package_rpm&quot; not in pkgb:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;%s-%=
s Needs rpmdb support in libsolv&quot; % (pkgn, pkgv))<br>
&gt;&gt; +}<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.0<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000066fe51059e62a7b1--
