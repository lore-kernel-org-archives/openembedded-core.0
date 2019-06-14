Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 915797D414
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 12:45:39 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id j184so1874787oih.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 05:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jNXuOjC8WGSGhLvfbJai06550xN0CjCxajWjnsO58Hs=;
	b=WUDeTtq/cr0jbGhASlIt6K3W2VTndHSjOh5aUcoWs2Gf02KCBT8p+OvtSKojDyCV05
	2gFWFJl9a2ODbnG9TVHXq1W/0cC6UawAZWKzwz8q2hwLXbAjTiBSiABKMaiRtTQ32OfZ
	qR+l7qpwUEA14zaFrCdRBbPTa0w/aLgBLKultuKGfJhCmN7YSYABcA/Y1vxNQh+FdwhF
	wqpWDslOYFcvXGGDupw+6VSvQjgRilL6TBN2CM2SvZ9m0ASLUbtXZTMixMDpnXQC1o0J
	0PAv8pH+noLhok7K4FZsCECP5MwyrwRhFCa/rWn8iYHnq7CwEtIICGO1hcMZXJBpXzx7
	Azwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jNXuOjC8WGSGhLvfbJai06550xN0CjCxajWjnsO58Hs=;
	b=q38rPG8MyyPH4qws/fOwQ9b6Nc7V0a/mf/9CR1H57F8inrSpd1lwwvjy/6doB8NQ1B
	2p62N2xJRBLaywmqHvxE6YgwEzcA38nm00SIr15EtJn8lUGoC93jbtppAZVoUfrhuXsZ
	RINojrtBFW6nsP8g/Mqz0IiWpfc9lZ1sOjy2/apgz9fDbvN3Owv+K4y90M5DYZ2PZ137
	m97t2OKa+Ie1FZTYnQWeuCkajvf/I5ZiVAk1LgWPW5PuwvVky30C+EtK5lHQ7TWFwqIV
	chqB3PXykRHfdryqiPZvizmJf0MHv6O6cTXoth8+cSlfBAGYE2s4XTwmq4ymC1V5xe8z
	If/w==
X-Gm-Message-State: APjAAAVTMI2HfW2Js+ZwwxBvnV+4f64bbx8CIiO1KRc8Sj0/7y0DPM2o
	ynpspkqDTNH4WZ50AterYQ51QWj6LPOhvrVSSXw=
X-Google-Smtp-Source: APXvYqy7Q4DYbCDFRYR3IZyoJByc3AmZNtrXW/dQBSGalYrZE/PHY250N8kPWAMseqnZ0XYfm1RNyKeP2RYlpY+3Cns=
X-Received: by 2002:aca:4d8:: with SMTP id 207mr1738070oie.88.1560516340515;
	Fri, 14 Jun 2019 05:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
	<20190614120448.2wg2523qu67la7mh@pengutronix.de>
	<ee3249ee4f978ee2ee7c74b0af81fe971ca66300.camel@linuxfoundation.org>
	<20190614123451.c5idgiizmqnlhob4@pengutronix.de>
In-Reply-To: <20190614123451.c5idgiizmqnlhob4@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Jun 2019 14:45:29 +0200
Message-ID: <CANNYZj-7=AVo51+aRpCL7k14VFiDhCtXozsSzZTbPWZO0=Ud1A@mail.gmail.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: kernel@pengutronix.de, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
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
X-List-Received-Date: Fri, 14 Jun 2019 12:45:39 -0000
Content-Type: multipart/alternative; boundary="00000000000024862d058b4806cf"

--00000000000024862d058b4806cf
Content-Type: text/plain; charset="UTF-8"

I tend to agree with Marco: I am not sure there is a use case for swrast
anymore, not even as a fallback. About the only thing it is useful for is
glxgears. On real hardware you want the real driver without fallbacks, on
qemu you want virgl.

I would rather replace swrast with virgl in the qemu machine configs.
Currently it's pulled in implicitly via the megadriver package which has
virgl included because it is enabled by default in the mesa recipe. From
what I can see beaglebone etc. are not affected by this.

Alex

On Fri, 14 Jun 2019 at 14:35, Marco Felsch <m.felsch@pengutronix.de> wrote:

> On 19-06-14 13:11, richard.purdie@linuxfoundation.org wrote:
> > On Fri, 2019-06-14 at 14:04 +0200, Marco Felsch wrote:
> > > On 19-06-14 11:55, Richard Purdie wrote:
> > > > On Thu, 2019-06-13 at 19:54 +0200, Marco Felsch wrote:
> > > > > Most of the time we are compiling for embedded targets which have
> > > > > dedicated hardware combinations. Enabling swrast by default isn't
> > > > > a
> > > > > good
> > > > > solution for such devices because if the hardware render node has
> > > > > an
> > > > > issue or doesn't support a special format/request Mesa will
> > > > > fallback
> > > > > to
> > > > > the software renderer. This will make it harder to debug
> > > > > performance
> > > > > issues.
> > > > >
> > > > > A better way is to let the user decide if a software renderer is
> > > > > needed e.g. if the system has no hardware renderer or to have
> > > > > such a
> > > > > fallback device. This way the user knows that the software
> > > > > renderer
> > > > > is
> > > > > enabled.
> > > > >
> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > ---
> > > > > v3
> > > > > - rebased on current master-next branch
> > > >
> > > > I think this breaks the autobuilder:
> > > >
> > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/694
> > >
> > > thanks for covering that. Why didn't I get a email?
> >
> > The patchtest emails come from quick tests. This is a test of full
> > builds on the autobuilder with batched together patches. The system has
> > no real knowledge of which patch causes which failure so its a manual
> > process. We don't have the infrastructure to run all patches through
> > the full autobuilder tests individually.
> >
> > >  Anyway thats
> > > interessting. IMHO it isn't a good solution to rely on that fact that
> > > the package have some 'random' default enabled drivers. Should we fix
> > > the qemu configs or should I add:
> > >
> > > PACKAGECONFIG_append_qemuall = " swrast"
> >
> > The assumption is that swrast makes a good fallback and would be
> > available in most cases.
>
> No I don't think that it is a good fallback, following my patch
> description. If you are on a embedded device you want the hw-renderer
> and not the sw one. A good example: After I updated my kernel, my
> hw-renderer wasn't available anymore and my application didn't start.
> Thats a very good indication that something went bad. With the swrast
> enabled I wouldn't see that immediately.
>
> > I suspect qemuall might not fix beaglebone-yocto or some of the
> > hardware BSPs.
>
> As I discribed in the patch description if you want that fallback you
> have to enable it. IMHO this is the better way instead of to be a
> 'smart' package.
>
> > Its also assumed these packages are shared amongst multiple machines
> > which may need different drivers.
> >
> > I suspect this means the defaults should be on but I am happy to have
> > more PACKAGECONFIG options to control things for people who want to
> > customise/micro-optimise.
>
> Optimising wasn't my main motivation. Avoiding 'random' performace
> issues after a upgrade (kernel, mesa) was my main motivation. Do you get
> me?
>
> Regards,
>   Marco
>
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000024862d058b4806cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I tend to agree with Marco: I am not sure there is a =
use case for swrast anymore, not even as a fallback. About the only thing i=
t is useful for is glxgears. On real hardware you want the real driver with=
out fallbacks, on qemu you want virgl.</div><div><br></div><div>I would rat=
her replace swrast with virgl in the qemu machine configs. Currently it&#39=
;s pulled in implicitly via the megadriver package which has virgl included=
 because it is enabled by default in the mesa recipe. From what I can see b=
eaglebone etc. are not affected by this.<br></div><div><br></div><div>Alex<=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, 14 Jun 2019 at 14:35, Marco Felsch &lt;<a href=3D"mailto:m=
.felsch@pengutronix.de">m.felsch@pengutronix.de</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On 19-06-14 13:11, <a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a> wrote:<br>
&gt; On Fri, 2019-06-14 at 14:04 +0200, Marco Felsch wrote:<br>
&gt; &gt; On 19-06-14 11:55, Richard Purdie wrote:<br>
&gt; &gt; &gt; On Thu, 2019-06-13 at 19:54 +0200, Marco Felsch wrote:<br>
&gt; &gt; &gt; &gt; Most of the time we are compiling for embedded targets =
which have<br>
&gt; &gt; &gt; &gt; dedicated hardware combinations. Enabling swrast by def=
ault isn&#39;t<br>
&gt; &gt; &gt; &gt; a<br>
&gt; &gt; &gt; &gt; good<br>
&gt; &gt; &gt; &gt; solution for such devices because if the hardware rende=
r node has<br>
&gt; &gt; &gt; &gt; an<br>
&gt; &gt; &gt; &gt; issue or doesn&#39;t support a special format/request M=
esa will<br>
&gt; &gt; &gt; &gt; fallback<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; the software renderer. This will make it harder to debu=
g<br>
&gt; &gt; &gt; &gt; performance<br>
&gt; &gt; &gt; &gt; issues.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; A better way is to let the user decide if a software re=
nderer is<br>
&gt; &gt; &gt; &gt; needed e.g. if the system has no hardware renderer or t=
o have<br>
&gt; &gt; &gt; &gt; such a<br>
&gt; &gt; &gt; &gt; fallback device. This way the user knows that the softw=
are<br>
&gt; &gt; &gt; &gt; renderer<br>
&gt; &gt; &gt; &gt; is<br>
&gt; &gt; &gt; &gt; enabled.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Signed-off-by: Marco Felsch &lt;<a href=3D"mailto:m.fel=
sch@pengutronix.de" target=3D"_blank">m.felsch@pengutronix.de</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; v3<br>
&gt; &gt; &gt; &gt; - rebased on current master-next branch<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I think this breaks the autobuilder:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/bu=
ilders/57/builds/694" rel=3D"noreferrer" target=3D"_blank">https://autobuil=
der.yoctoproject.org/typhoon/#/builders/57/builds/694</a><br>
&gt; &gt; <br>
&gt; &gt; thanks for covering that. Why didn&#39;t I get a email?<br>
&gt; <br>
&gt; The patchtest emails come from quick tests. This is a test of full<br>
&gt; builds on the autobuilder with batched together patches. The system ha=
s<br>
&gt; no real knowledge of which patch causes which failure so its a manual<=
br>
&gt; process. We don&#39;t have the infrastructure to run all patches throu=
gh<br>
&gt; the full autobuilder tests individually.<br>
&gt; <br>
&gt; &gt;=C2=A0 Anyway thats<br>
&gt; &gt; interessting. IMHO it isn&#39;t a good solution to rely on that f=
act that<br>
&gt; &gt; the package have some &#39;random&#39; default enabled drivers. S=
hould we fix<br>
&gt; &gt; the qemu configs or should I add:<br>
&gt; &gt; <br>
&gt; &gt; PACKAGECONFIG_append_qemuall =3D &quot; swrast&quot;<br>
&gt; <br>
&gt; The assumption is that swrast makes a good fallback and would be<br>
&gt; available in most cases.<br>
<br>
No I don&#39;t think that it is a good fallback, following my patch<br>
description. If you are on a embedded device you want the hw-renderer<br>
and not the sw one. A good example: After I updated my kernel, my<br>
hw-renderer wasn&#39;t available anymore and my application didn&#39;t star=
t.<br>
Thats a very good indication that something went bad. With the swrast<br>
enabled I wouldn&#39;t see that immediately.<br>
<br>
&gt; I suspect qemuall might not fix beaglebone-yocto or some of the<br>
&gt; hardware BSPs.<br>
<br>
As I discribed in the patch description if you want that fallback you<br>
have to enable it. IMHO this is the better way instead of to be a<br>
&#39;smart&#39; package.<br>
<br>
&gt; Its also assumed these packages are shared amongst multiple machines<b=
r>
&gt; which may need different drivers.<br>
&gt; <br>
&gt; I suspect this means the defaults should be on but I am happy to have<=
br>
&gt; more PACKAGECONFIG options to control things for people who want to<br=
>
&gt; customise/micro-optimise.<br>
<br>
Optimising wasn&#39;t my main motivation. Avoiding &#39;random&#39; perform=
ace<br>
issues after a upgrade (kernel, mesa) was my main motivation. Do you get<br=
>
me?<br>
<br>
Regards,<br>
=C2=A0 Marco<br>
<br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-- <br>
Pengutronix e.K.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
Industrial Linux Solutions=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| <a href=3D"http://www.pengutronix.de/" rel=3D"noreferrer" ta=
rget=3D"_blank">http://www.pengutronix.de/</a>=C2=A0 |<br>
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0=C2=A0=
 =C2=A0 |<br>
Amtsgericht Hildesheim, HRA 2686=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
Fax:=C2=A0 =C2=A0+49-5121-206917-5555 |<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000024862d058b4806cf--
