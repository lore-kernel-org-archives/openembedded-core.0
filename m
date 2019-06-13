Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 072657E7D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 19:07:14 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id g13so32713903edu.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 12:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ev8sWP7K1/6cxONrA5nqkqo0o9iJ3Xu4LNPgPj/pJ2Y=;
	b=aNW0f9If9wtVKqDwiQOt14ucg/3ScoyXzZXNpSFwLK+Q0HnPb++E79RF+BP81g/wyv
	eT+6w1Ib0Ivdr3m9qEJzzXozVIjVrLWVp8UP2mIBJqlOAnI+lt78VD+qsSF6jZtycDSI
	pTtks4sYxyMx6PvMoUSuRE8BbhWzXCKZmVo9Ny4CJZMHo5r5ot0bBAHR9AaHRkMPWaVH
	CnwxrT3qfF7m2g+hbO4UgZOds2Pd1YTyP/9Luy7OWekpJ5cYQQm310UOKlAw5CArFP1A
	rj+canHI+nYP0RdKGoBpbC/J0VAdtZ2wHEDQL8Xbfl03TITr67gkNwLQZSFIFU1CJfub
	dWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ev8sWP7K1/6cxONrA5nqkqo0o9iJ3Xu4LNPgPj/pJ2Y=;
	b=Mn7Fr0DDpPtkrJJIW4zN2urBq8RWtUQygU0O2BNTj6CPfz4dd+HdUxR182kw2zhQ3h
	jR8F4SqCPsQjQk7yI+YYnAoLTmjwSMaFX2+r82hR74XxTvrOulYmZ7YL5bP4cW7pEhdx
	e6Wh2MVdNDfiGY7xG/XJoJEdMDsS/ZXwaVkyep4wEYfmEuLSLeD4aN4ETtfxhFJwitZY
	P1Gr9yLpzcmD5cvHA9N2ge+pmirFn1Tz6zOKpxpGbVyXo/HfZmi0gX1E+qSZrrhYtEHk
	5e59BsR0Yjkwfx3qQGsDD2TmqyTr7VrS3ZKs7X7+LM0wg7bsUu33ScsbnbSw3XmFV14d
	IJ5A==
X-Gm-Message-State: APjAAAUJ5ooc4BfXDqgw8kUSB26fx7JSTvqHriymFEvSj0hnLsAaY800
	JZ8JyqEpZb4Tk/kxacES47v3a6ajRFx/iwO40Ps=
X-Google-Smtp-Source: APXvYqwfLdK9icWXCjRnEY3xEIqp8vzenV3UziCO/VruS3INQU4yWhUtuKtw47twRDTeFy0s3lbFrAaJZ1I8Ve9yKBo=
X-Received: by 2002:aa7:df93:: with SMTP id b19mr18708576edy.153.1560452835552;
	Thu, 13 Jun 2019 12:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
	<CA+chaQcYku6dt_owA-OD2KAm5ZYqyhtFjnZ6EUAR8cRUJLY5Mw@mail.gmail.com>
	<20190613183815.mhc2w5mbpqqfb6va@pengutronix.de>
In-Reply-To: <20190613183815.mhc2w5mbpqqfb6va@pengutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 13 Jun 2019 21:07:09 +0200
Message-ID: <CA+chaQdqJG_xuXimc+vVi1s5V4xi1Kw4oxRod7rUvL-L=Qtk8Q@mail.gmail.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: kernel@pengutronix.de, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 13 Jun 2019 19:07:15 -0000
Content-Type: multipart/alternative; boundary="000000000000f3b187058b393cfe"

--000000000000f3b187058b393cfe
Content-Type: text/plain; charset="UTF-8"

Sure, follow-up patch is fine with me.

On Thu, Jun 13, 2019 at 8:38 PM Marco Felsch <m.felsch@pengutronix.de>
wrote:

> Hi Martin,
>
> On 19-06-13 20:17, Martin Jansa wrote:
> > Looks like nice cleanup, but is someone still using llvm 3.2 or older?
>
> I don't know but I learned to avoid breaking changes.
>
> > With PACKAGECONFIG for almost each gallium driver it might be easier to
> get
> > rid
> > of GALLIUMDRIVERS_LLVM33, GALLIUMDRIVERS_LLVM33_ENABLED,
> GALLIUMDRIVERS_LLVM
> > variables and use just GALLIUMDRIVERS.
>
> Sure that will increase readability and drops unneeded variables :) But
> can we add a follow up patch to address this?
>
> > In worst case scenario people using llvm 3.2 or older will need to
> redefine
> > some of these PACKAGECONFIGs but that shouldn't be big issue considering
> > that they probably have different mesa recipe already.
>
> I'm not that deep inside LLVM just googled it and saw that the current
> version is 8.0.1 so maybe you are right.
>
> > People can then select right list of drivers with or without
> > using gallium-llvm as well.
>
> As I wrote above we should address this by a seperate patch to keep the
> diff as small as possible :)
>
> Regards,
>   Marco
>
> >
> >
> > On Thu, Jun 13, 2019 at 7:54 PM Marco Felsch <m.felsch@pengutronix.de>
> > wrote:
> >
> > > Most of the time we are compiling for embedded targets which have
> > > dedicated hardware combinations. Enabling swrast by default isn't a
> good
> > > solution for such devices because if the hardware render node has an
> > > issue or doesn't support a special format/request Mesa will fallback to
> > > the software renderer. This will make it harder to debug performance
> > > issues.
> > >
> > > A better way is to let the user decide if a software renderer is
> > > needed e.g. if the system has no hardware renderer or to have such a
> > > fallback device. This way the user knows that the software renderer is
> > > enabled.
> > >
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > > v3
> > > - rebased on current master-next branch
> > >
> > >  meta/recipes-graphics/mesa/mesa.inc | 22 +++++++++++++---------
> > >  1 file changed, 13 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/meta/recipes-graphics/mesa/mesa.inc
> > > b/meta/recipes-graphics/mesa/mesa.inc
> > > index 3ecfb8506c..a6d36cf21c 100644
> > > --- a/meta/recipes-graphics/mesa/mesa.inc
> > > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > > @@ -90,23 +90,27 @@ PACKAGECONFIG[egl] = "-Degl=true, -Degl=false"
> > >
> > >  PACKAGECONFIG[etnaviv] = ""
> > >  PACKAGECONFIG[kmsro] = ""
> > > +PACKAGECONFIG[swrast] = ""
> > >
> > > -GALLIUMDRIVERS = "swrast"
> > > -GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG',
> 'etnaviv',
> > > ',etnaviv', '', d)}"
> > > -GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro',
> > > ',kmsro', '', d)}"
> > > +GALLIUMDRIVERS = ""
> > > +GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'swrast',
> > > 'swrast', '', d)}"
> > > +GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',
> > > 'etnaviv', '', d)}"
> > > +GALLIUMDRIVERS +="${@bb.utils.contains('PACKAGECONFIG', 'kmsro',
> 'kmsro',
> > > '', d)}"
> > >
> > >  # radeonsi requires LLVM
> > > -GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600',
> > > ',radeonsi', '', d)}"
> > > +GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600',
> > > 'radeonsi', '', d)}"
> > >  GALLIUMDRIVERS_LLVM33_ENABLED =
> > > "${@oe.utils.version_less_or_equal('MESA_LLVM_RELEASE', '3.2', False,
> > > len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
> > > -GALLIUMDRIVERS_LLVM =
> "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if
> > > ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
> > > +GALLIUMDRIVERS_LLVM = "r300 svga nouveau
> ${@'${GALLIUMDRIVERS_LLVM33}' if
> > > ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
> > >
> > >  PACKAGECONFIG[r600] = ""
> > >
> > > -GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG',
> > > 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
> > > -GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600',
> > > ',r600', '', d)}"
> > > -GALLIUMDRIVERS_append = ",virgl"
> > > +GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG',
> 'gallium-llvm',
> > > '${GALLIUMDRIVERS_LLVM}', '', d)}"
> > > +GALLIUMDRIVERS += "${@bb.utils.contains('PACKAGECONFIG', 'r600',
> 'r600',
> > > '', d)}"
> > > +GALLIUMDRIVERS += "virgl"
> > > +GALLIUMDRIVERS_MESON = "${@",".join("${GALLIUMDRIVERS}".split())}"
> > > +
> > > +PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS_MESON},
> > > -Dgallium-drivers=''"
> > >
> > > -PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS},
> > > -Dgallium-drivers=''"
> > >  MESA_LLVM_RELEASE ?= "8.0.0"
> > >  PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true,
> > > -Dllvm=false, llvm${MESA_LLVM_RELEASE} llvm-native \
> > >                                 ${@'elfutils' if
> > > ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
>
> --
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>

--000000000000f3b187058b393cfe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure, follow-up patch is fine with me.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 13, 2019=
 at 8:38 PM Marco Felsch &lt;<a href=3D"mailto:m.felsch@pengutronix.de">m.f=
elsch@pengutronix.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hi Martin,<br>
<br>
On 19-06-13 20:17, Martin Jansa wrote:<br>
&gt; Looks like nice cleanup, but is someone still using llvm 3.2 or older?=
<br>
<br>
I don&#39;t know but I learned to avoid breaking changes.<br>
<br>
&gt; With PACKAGECONFIG for almost each gallium driver it might be easier t=
o get<br>
&gt; rid<br>
&gt; of GALLIUMDRIVERS_LLVM33, GALLIUMDRIVERS_LLVM33_ENABLED, GALLIUMDRIVER=
S_LLVM<br>
&gt; variables and use just GALLIUMDRIVERS.<br>
<br>
Sure that will increase readability and drops unneeded variables :) But<br>
can we add a follow up patch to address this?<br>
<br>
&gt; In worst case scenario people using llvm 3.2 or older will need to red=
efine<br>
&gt; some of these PACKAGECONFIGs but that shouldn&#39;t be big issue consi=
dering<br>
&gt; that they probably have different mesa recipe already.<br>
<br>
I&#39;m not that deep inside LLVM just googled it and saw that the current<=
br>
version is 8.0.1 so maybe you are right.<br>
<br>
&gt; People can then select right list of drivers with or without<br>
&gt; using gallium-llvm as well.<br>
<br>
As I wrote above we should address this by a seperate patch to keep the<br>
diff as small as possible :)<br>
<br>
Regards,<br>
=C2=A0 Marco<br>
<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Jun 13, 2019 at 7:54 PM Marco Felsch &lt;<a href=3D"mailto:m.f=
elsch@pengutronix.de" target=3D"_blank">m.felsch@pengutronix.de</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; Most of the time we are compiling for embedded targets which have=
<br>
&gt; &gt; dedicated hardware combinations. Enabling swrast by default isn&#=
39;t a good<br>
&gt; &gt; solution for such devices because if the hardware render node has=
 an<br>
&gt; &gt; issue or doesn&#39;t support a special format/request Mesa will f=
allback to<br>
&gt; &gt; the software renderer. This will make it harder to debug performa=
nce<br>
&gt; &gt; issues.<br>
&gt; &gt;<br>
&gt; &gt; A better way is to let the user decide if a software renderer is<=
br>
&gt; &gt; needed e.g. if the system has no hardware renderer or to have suc=
h a<br>
&gt; &gt; fallback device. This way the user knows that the software render=
er is<br>
&gt; &gt; enabled.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Marco Felsch &lt;<a href=3D"mailto:m.felsch@pengut=
ronix.de" target=3D"_blank">m.felsch@pengutronix.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; v3<br>
&gt; &gt; - rebased on current master-next branch<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 meta/recipes-graphics/mesa/mesa.inc | 22 +++++++++++++-----=
----<br>
&gt; &gt;=C2=A0 1 file changed, 13 insertions(+), 9 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; &gt; b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; &gt; index 3ecfb8506c..a6d36cf21c 100644<br>
&gt; &gt; --- a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; &gt; +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt; &gt; @@ -90,23 +90,27 @@ PACKAGECONFIG[egl] =3D &quot;-Degl=3Dtrue, -D=
egl=3Dfalse&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PACKAGECONFIG[etnaviv] =3D &quot;&quot;<br>
&gt; &gt;=C2=A0 PACKAGECONFIG[kmsro] =3D &quot;&quot;<br>
&gt; &gt; +PACKAGECONFIG[swrast] =3D &quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt; -GALLIUMDRIVERS =3D &quot;swrast&quot;<br>
&gt; &gt; -GALLIUMDRIVERS_append =3D&quot;${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;etnaviv&#39;,<br>
&gt; &gt; &#39;,etnaviv&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; -GALLIUMDRIVERS_append =3D&quot;${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;kmsro&#39;,<br>
&gt; &gt; &#39;,kmsro&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; +GALLIUMDRIVERS =3D &quot;&quot;<br>
&gt; &gt; +GALLIUMDRIVERS +=3D&quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;swrast&#39;,<br>
&gt; &gt; &#39;swrast&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; +GALLIUMDRIVERS +=3D&quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;etnaviv&#39;,<br>
&gt; &gt; &#39;etnaviv&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; +GALLIUMDRIVERS +=3D&quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;kmsro&#39;, &#39;kmsro&#39;,<br>
&gt; &gt; &#39;&#39;, d)}&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # radeonsi requires LLVM<br>
&gt; &gt; -GALLIUMDRIVERS_LLVM33 =3D &quot;${@bb.utils.contains(&#39;PACKAG=
ECONFIG&#39;, &#39;r600&#39;,<br>
&gt; &gt; &#39;,radeonsi&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; +GALLIUMDRIVERS_LLVM33 =3D &quot;${@bb.utils.contains(&#39;PACKAG=
ECONFIG&#39;, &#39;r600&#39;,<br>
&gt; &gt; &#39;radeonsi&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt;=C2=A0 GALLIUMDRIVERS_LLVM33_ENABLED =3D<br>
&gt; &gt; &quot;${@oe.utils.version_less_or_equal(&#39;MESA_LLVM_RELEASE&#3=
9;, &#39;3.2&#39;, False,<br>
&gt; &gt; len(&#39;${GALLIUMDRIVERS_LLVM33}&#39;) &gt; 0, d)}&quot;<br>
&gt; &gt; -GALLIUMDRIVERS_LLVM =3D &quot;r300,svga,nouveau${@&#39;,${GALLIU=
MDRIVERS_LLVM33}&#39; if<br>
&gt; &gt; ${GALLIUMDRIVERS_LLVM33_ENABLED} else &#39;&#39;}&quot;<br>
&gt; &gt; +GALLIUMDRIVERS_LLVM =3D &quot;r300 svga nouveau ${@&#39;${GALLIU=
MDRIVERS_LLVM33}&#39; if<br>
&gt; &gt; ${GALLIUMDRIVERS_LLVM33_ENABLED} else &#39;&#39;}&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PACKAGECONFIG[r600] =3D &quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt; -GALLIUMDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;PACKAG=
ECONFIG&#39;,<br>
&gt; &gt; &#39;gallium-llvm&#39;, &#39;,${GALLIUMDRIVERS_LLVM}&#39;, &#39;&=
#39;, d)}&quot;<br>
&gt; &gt; -GALLIUMDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;PACKAG=
ECONFIG&#39;, &#39;r600&#39;,<br>
&gt; &gt; &#39;,r600&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; -GALLIUMDRIVERS_append =3D &quot;,virgl&quot;<br>
&gt; &gt; +GALLIUMDRIVERS +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFI=
G&#39;, &#39;gallium-llvm&#39;,<br>
&gt; &gt; &#39;${GALLIUMDRIVERS_LLVM}&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt; +GALLIUMDRIVERS +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFI=
G&#39;, &#39;r600&#39;, &#39;r600&#39;,<br>
&gt; &gt; &#39;&#39;, d)}&quot;<br>
&gt; &gt; +GALLIUMDRIVERS +=3D &quot;virgl&quot;<br>
&gt; &gt; +GALLIUMDRIVERS_MESON =3D &quot;${@&quot;,&quot;.join(&quot;${GAL=
LIUMDRIVERS}&quot;.split())}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +PACKAGECONFIG[gallium] =3D &quot;-Dgallium-drivers=3D${GALLIUMDR=
IVERS_MESON},<br>
&gt; &gt; -Dgallium-drivers=3D&#39;&#39;&quot;<br>
&gt; &gt;<br>
&gt; &gt; -PACKAGECONFIG[gallium] =3D &quot;-Dgallium-drivers=3D${GALLIUMDR=
IVERS},<br>
&gt; &gt; -Dgallium-drivers=3D&#39;&#39;&quot;<br>
&gt; &gt;=C2=A0 MESA_LLVM_RELEASE ?=3D &quot;8.0.0&quot;<br>
&gt; &gt;=C2=A0 PACKAGECONFIG[gallium-llvm] =3D &quot;-Dllvm=3Dtrue -Dshare=
d-llvm=3Dtrue,<br>
&gt; &gt; -Dllvm=3Dfalse, llvm${MESA_LLVM_RELEASE} llvm-native \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@&#39;elfutils&#39; i=
f<br>
&gt; &gt; ${GALLIUMDRIVERS_LLVM33_ENABLED} else &#39;&#39;}&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.20.1<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/mailman/listinfo/openembedded-core</a><br>
&gt; &gt;<br>
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
</blockquote></div>

--000000000000f3b187058b393cfe--
