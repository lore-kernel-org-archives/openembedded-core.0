Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id B8BFE6BCA9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 08:15:44 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id o187so4452695vka.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 00:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=132DunKoWIwxkAWXT5AkGYvlZ6bwpHlb3WHfzpSeS8c=;
	b=hUMhY+FtZhDRV3SRhKFDcgFhr0PpSLA1Qp8OnfCec3UoS0yTjxo+6x/eMO7vTJf42g
	NqU8dQY0mE6B9yb0xahWMUwvWL9rOT25a/vjVg9L+6fttZPJGcdToTSTUBtdP2jx4W6p
	4PUyM+p04tAFPXu0l5QvEfBUAODJ9zoCJ9yZX3wBa+cnzOGhFcKagc9ejhF6RQ3MbFrv
	AvomYGIqDQiw961dY/MHvBTK3IT5IvlXMsNWCmoFoSk9/3XzeAiolEjlRgzjPxm3G0Au
	ot1WkTopVvXQN56HfsXmSeyQe+mpMOUEuQrVcHsVW6HBpQ8m9rum8qHkzBn2nf1AMzfa
	9WeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=132DunKoWIwxkAWXT5AkGYvlZ6bwpHlb3WHfzpSeS8c=;
	b=CnHIWDchAJS0b5iZIw+8ylGDdDRWWR8zVn6U4Ki1+lXKQfrnj71xCfT4B6CqwMLYQN
	bdl3QA2LnESWHntDWxtIxn6M3r65QYqamYnw6Utl4aOfGdRLGYmgKrMfWQhDb1F8LFMi
	ehgpFTLX7NNM9zHvSdLvZZaEJEb55zHe+Rf0wGeyOa4KOlzwLDeQK0Yg1VlStfeyo+jA
	Dw/6gITfxR9PwsgDVmFxx9VqawZddaf2OTGseNrC30ILeH/MGqJ7zS2VO+22YaNkj1Ae
	ykXNdJf7N1MPPfDANqA+6Sy6EHMi+JKBVYUF6+Ib72yhYvX7XIBjKy3N+DMhurLY+Gcz
	Si4g==
X-Gm-Message-State: APjAAAXR3+nIEmXjb+TNipwUWLdMCu2TmufEbYLr6ZsZxgotcQ01oUl4
	L/KJBkGw6I+rTjw7BFBlAUNWR6i5/I6HGDb/cJ4=
X-Google-Smtp-Source: APXvYqzjJKX+XyFFzoQUWNVWiuUuxO+UrTlorLeD4DAvrf2C2srQtwMKgXtVsjiDAHZ05uhBTcwv13KF0+ojE7XWCwk=
X-Received: by 2002:a1f:7cc2:: with SMTP id x185mr13640222vkc.1.1579076144354; 
	Wed, 15 Jan 2020 00:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20200113211005.14693-1-maxime.roussinbelanger@gmail.com>
	<CANNYZj-2ZLcTC7j=SGTY5O6h-Z2FNRZnkNgzQcWNedSDnPBZUA@mail.gmail.com>
	<CAE=T-s6n8LLsucxfy3kioMqaAvG5gQenwNpsGqW55Gf8a_3NVQ@mail.gmail.com>
In-Reply-To: <CAE=T-s6n8LLsucxfy3kioMqaAvG5gQenwNpsGqW55Gf8a_3NVQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Jan 2020 09:15:33 +0100
Message-ID: <CANNYZj_FwUCjUnwOYDUPdJdceU423+SbsR5hGC+ngxcfQ0CKmA@mail.gmail.com>
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: gdk-pixbuf: add man packageconfig
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
X-List-Received-Date: Wed, 15 Jan 2020 08:15:45 -0000
Content-Type: multipart/alternative; boundary="000000000000a85902059c295038"

--000000000000a85902059c295038
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't know: I am not seeing the issue locally, and it doesn't happen on
the autobuilder, so it's difficult to give a useful answer.

Alex

On Wed, 15 Jan 2020 at 02:26, Maxime Roussin-B=C3=A9langer <
maxime.roussinbelanger@gmail.com> wrote:

> I have modified the recipe to use manpages, but it is impossible to run a
> build from master, because
> of my python3 pyenv setup. I had to add
>
> +DEPENDS =3D "python3-native"
>
> to ca-certificates, without it was impossible to go through the
> do_configure step. It was using the python3
> from my system instead of the one provided by yocto? I am a bit lost here=
.
>
> What do you think? Should it have python3-native? There is a fairly recen=
t
> patch
> to use python3 `file://0001-certdata2pem.py-use-python3.patch`
>
> Thanks,
> Max.
>
> On Mon, Jan 13, 2020 at 4:20 PM Alexander Kanavin <alex.kanavin@gmail.com=
>
> wrote:
> >
> > The correct way to configure this is to inherit manpages class, and nam=
e
> the option 'manpages' as well.
> >
> > Alex
> >
> > On Mon, 13 Jan 2020 at 22:10, Maxime Roussin-B=C3=A9langer <
> maxime.roussinbelanger@gmail.com> wrote:
> >>
> >> The current default for the meson configuration is to build
> >> the man. It will only do it if it finds the xsltproc binary
> >> and man option (default: on).
> >>
> >> Adding the packageconfig make sure that xsltproc will be
> >> found in the correct path (recipe-sysroot-native) and that
> >> the docbook can be used.
> >>
> >> The docbook is needed because xsltproc is used with the
> >> --nonet option, which prevents the uses of the internet to
> >> fetch DFD's.
> >>
> >> This recipe has been working for probably everyone with the
> >> current configuration, however if for some reason xsltproc
> >> can be found inside PATH, meson will use it.
> >>
> >> Signed-off-by: Maxime Roussin-B=C3=A9langer <
> maxime.roussinbelanger@gmail.com>
> >> ---
> >>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> >> index 699c4ecd0b..f6cc25cd8c 100644
> >> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> >> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> >> @@ -53,6 +53,7 @@ PACKAGECONFIG[png] =3D "-Dpng=3Dtrue,-Dpng=3Dfalse,l=
ibpng"
> >>  PACKAGECONFIG[jpeg] =3D "-Djpeg=3Dtrue,-Djpeg=3Dfalse,jpeg"
> >>  PACKAGECONFIG[tiff] =3D "-Dtiff=3Dtrue,-Dtiff=3Dfalse,tiff"
> >>  PACKAGECONFIG[jpeg2000] =3D "-Djasper=3Dtrue,-Djasper=3Dfalse,jasper"
> >> +PACKAGECONFIG[man] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native
> docbook-xsl-stylesheets-native,"
> >>
> >>  PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue,-Dx11=3Dfalse,virtual/libx11"
> >>
> >> --
> >> 2.20.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a85902059c295038
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I don&#39;t know: I am not seeing the issue locally, =
and it doesn&#39;t happen on the autobuilder, so it&#39;s difficult to give=
 a useful answer.</div><div><br></div><div>Alex<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 15 Jan 202=
0 at 02:26, Maxime Roussin-B=C3=A9langer &lt;<a href=3D"mailto:maxime.rouss=
inbelanger@gmail.com">maxime.roussinbelanger@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I ha=
ve modified the recipe to use manpages, but it is impossible to run a build=
 from master, because<div>of my python3 pyenv setup. I had to add</div><div=
><br></div><div>+DEPENDS =3D &quot;python3-native&quot;</div><div><br></div=
><div>to ca-certificates, without it was impossible to go through the do_co=
nfigure step. It was using the python3</div><div>from my system instead of =
the one provided by yocto? I am a bit lost here.</div><div><br></div><div>W=
hat do you think? Should it have python3-native? There is a fairly recent p=
atch</div><div>to use python3 `file://0001-certdata2pem.py-use-python3.patc=
h`</div><div><br></div><div>Thanks,</div><div>Max.</div><div><br>On Mon, Ja=
n 13, 2020 at 4:20 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>&gt;<=
br>&gt; The correct way to configure this is to inherit manpages class, and=
 name the option &#39;manpages&#39; as well.<br>&gt;<br>&gt; Alex<br>&gt;<b=
r>&gt; On Mon, 13 Jan 2020 at 22:10, Maxime Roussin-B=C3=A9langer &lt;<a hr=
ef=3D"mailto:maxime.roussinbelanger@gmail.com" target=3D"_blank">maxime.rou=
ssinbelanger@gmail.com</a>&gt; wrote:<br>&gt;&gt;<br>&gt;&gt; The current d=
efault for the meson configuration is to build<br>&gt;&gt; the man. It will=
 only do it if it finds the xsltproc binary<br>&gt;&gt; and man option (def=
ault: on).<br>&gt;&gt;<br>&gt;&gt; Adding the packageconfig make sure that =
xsltproc will be<br>&gt;&gt; found in the correct path (recipe-sysroot-nati=
ve) and that<br>&gt;&gt; the docbook can be used.<br>&gt;&gt;<br>&gt;&gt; T=
he docbook is needed because xsltproc is used with the<br>&gt;&gt; --nonet =
option, which prevents the uses of the internet to<br>&gt;&gt; fetch DFD&#3=
9;s.<br>&gt;&gt;<br>&gt;&gt; This recipe has been working for probably ever=
yone with the<br>&gt;&gt; current configuration, however if for some reason=
 xsltproc<br>&gt;&gt; can be found inside PATH, meson will use it.<br>&gt;&=
gt;<br>&gt;&gt; Signed-off-by: Maxime Roussin-B=C3=A9langer &lt;<a href=3D"=
mailto:maxime.roussinbelanger@gmail.com" target=3D"_blank">maxime.roussinbe=
langer@gmail.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; =C2=A0meta/recipes-gno=
me/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.40.0.bb" target=3D"_blank">gdk=
-pixbuf_2.40.0.bb</a> | 1 +<br>&gt;&gt; =C2=A01 file changed, 1 insertion(+=
)<br>&gt;&gt;<br>&gt;&gt; diff --git a/meta/recipes-gnome/gdk-pixbuf/<a hre=
f=3D"http://gdk-pixbuf_2.40.0.bb" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a=
> b/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.40.0.bb" t=
arget=3D"_blank">gdk-pixbuf_2.40.0.bb</a><br>&gt;&gt; index 699c4ecd0b..f6c=
c25cd8c 100644<br>&gt;&gt; --- a/meta/recipes-gnome/gdk-pixbuf/<a href=3D"h=
ttp://gdk-pixbuf_2.40.0.bb" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a><br>&=
gt;&gt; +++ b/meta/recipes-gnome/gdk-pixbuf/<a href=3D"http://gdk-pixbuf_2.=
40.0.bb" target=3D"_blank">gdk-pixbuf_2.40.0.bb</a><br>&gt;&gt; @@ -53,6 +5=
3,7 @@ PACKAGECONFIG[png] =3D &quot;-Dpng=3Dtrue,-Dpng=3Dfalse,libpng&quot;=
<br>&gt;&gt; =C2=A0PACKAGECONFIG[jpeg] =3D &quot;-Djpeg=3Dtrue,-Djpeg=3Dfal=
se,jpeg&quot;<br>&gt;&gt; =C2=A0PACKAGECONFIG[tiff] =3D &quot;-Dtiff=3Dtrue=
,-Dtiff=3Dfalse,tiff&quot;<br>&gt;&gt; =C2=A0PACKAGECONFIG[jpeg2000] =3D &q=
uot;-Djasper=3Dtrue,-Djasper=3Dfalse,jasper&quot;<br>&gt;&gt; +PACKAGECONFI=
G[man] =3D &quot;-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native docbook-xsl-styl=
esheets-native,&quot;<br>&gt;&gt;<br>&gt;&gt; =C2=A0PACKAGECONFIG[x11] =3D =
&quot;-Dx11=3Dtrue,-Dx11=3Dfalse,virtual/libx11&quot;<br>&gt;&gt;<br>&gt;&g=
t; --<br>&gt;&gt; 2.20.1<br>&gt;&gt;<br>&gt;&gt; --<br>&gt;&gt; ___________=
____________________________________<br>&gt;&gt; Openembedded-core mailing =
list<br>&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org=
" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>&gt;&gt=
; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-co=
re" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openem=
bedded-core</a></div></div>
</blockquote></div>

--000000000000a85902059c295038--
