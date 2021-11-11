Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2626C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 17:22:46 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web09.2726.1636651365536912804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 09:22:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C1X9EB1U;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id b17so13467942uas.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 09:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kGyN709ZguFBP4UKso7tOkhT7mc6QrKw7x5fZGqOKMU=;
        b=C1X9EB1UNfgSHJVlseD8Ydyi5BhgREzUmncCFxUQhDtN7KNpsv7IBZzhI7HrLSuEyX
         BQe4BiMVTj1NJz6aINCwRM9Ed+H6N3FpxywgaFKTu6j9oNj9ubgi5YvKdSi6ISyK4eB2
         XM82nDD5OFO+dsf8KGNN48oiwZCYRFUBQHKy5hwDVxke7jyB/w4S77oeQRYHoBHcMBpZ
         vWhc+GR6U1Im24NEreAeinnRPdjgnZYOcfMEcIcCzukyNJ7zvhDR3ebpKQdZUTyKuIyp
         wbfBglo/8wBC5Zvpfqh62pOGBHQiC1A9mwOmw1tF3YFPRAygjUGK+IKt5r3lZPzL8Ga7
         Tj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kGyN709ZguFBP4UKso7tOkhT7mc6QrKw7x5fZGqOKMU=;
        b=Fkdjp3DanWSb5SjIAZCQMmsQ1xJZZVvIyP2NofSnKEJ2xcTQSkjnfqWYosEbF2A/mD
         Hsb0tWJPv/JKQLr77t9h9ehBXFBfmqBGqItj72rLEGmYG7KzlHgY3PX/SLP0fuB5kxCa
         7rqeuuBJM7+BYZTj/itSISJcpJ/wR0eQacJPM91VlS2Ns+8hvmVYRDtXCIqa6P/qeCKv
         lOt9sMbal7G5bNCohAoKqG/nBniyX188/Lz9MpGS1RMsLwoU/o+VPA62ooMXI0k7nPve
         6I+vl6eq3UhrFNryP3IyBpV4DisQSae2Mx58JZzdlX7de2uQkuTy0nmNY59RUM1JusCk
         SzxA==
X-Gm-Message-State: AOAM531QDJPkAX2tQicefxwWAbnhfxdxwyP51Pi7TUBBFJxy1xge1RLx
	kMM2ajxqQdBQgJ1PSZ36zbyDpUSmD+iYO1hLiM0=
X-Google-Smtp-Source: 
 ABdhPJzjIheS7COpNCDCrRrT96bl+9ZSX8mTly89WSzPih7+kxWdJSU0WYaPmHD2jDz6SCpKs7XriMZGV88ICzXJXHY=
X-Received: by 2002:ab0:484:: with SMTP id 4mr12492416uaw.71.1636651364416;
 Thu, 11 Nov 2021 09:22:44 -0800 (PST)
MIME-Version: 1.0
References: <20211111100531.3822580-1-alex@linutronix.de>
 <CAMKF1sq33pUGxV75AWgB20maqXeaJ-zbGykWFQSoLL+2HCVgzg@mail.gmail.com>
 <064d80643beb1d723008816d7dea76497a8d0533.camel@linuxfoundation.org>
 <CAMKF1srJ34x1VS2kxgyni0XgmG2sutaP=3rrNcxhBWZCrYGumA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srJ34x1VS2kxgyni0XgmG2sutaP=3rrNcxhBWZCrYGumA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Nov 2021 18:22:33 +0100
Message-ID: 
 <CANNYZj-WStDnU0zNg=915j+aGXw=piLbQE40xQZQvMOBwusDxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xserver-xorg: add missing libtirpc dependency
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000327fea05d0869758"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 17:22:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158195

--000000000000327fea05d0869758
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW, once the next LTS is out, I'm going to propose the following (I
already have the patches):

- nodistro/default oe-core set gets opengl/wayland features (but not vulkan
just yet :)
- AB's config.json gets a 'only-x11' configuration where those features are
removed, and sato images/SDKs are built and tested
- everything else is transitioned to weston, and perhaps phosh :)

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakanavin/transit=
ion-to-weston
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilder-helper/log/?h=
=3Dcontrib/akanavin/transition-to-weston

Alex

On Thu, 11 Nov 2021 at 17:26, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Nov 11, 2021 at 7:23 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2021-11-11 at 06:58 -0800, Khem Raj wrote:
> > >
> > >
> > > On Thu, Nov 11, 2021 at 2:05 AM Alexander Kanavin <
> alex.kanavin@gmail.com>
> > > wrote:
> > > > This wasn't a problem in poky, but was exposed with a nodistro buil=
d.
> > > >
> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > ---
> > > >  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > > > b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > > > index 4a7048aced..71c934ef38 100644
> > > > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > > > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > > > @@ -28,7 +28,7 @@ inherit meson pkgconfig
> > > >  inherit features_check
> > > >  REQUIRED_DISTRO_FEATURES =3D "x11"
> > > >
> > > > -LIB_DEPS =3D "pixman libxfont2 xtrans libxau libxext libxdmcp libd=
rm
> > > > libxkbfile
> > > > libpciaccess libxcvt"
> > > > +LIB_DEPS =3D "pixman libxfont2 xtrans libxau libxext libxdmcp libd=
rm
> > > > libxkbfile
> > > > libpciaccess libxcvt libtirpc"
> > > >
> > >
> > >
> > > Interesting. Do we know what the difference is?
> > > Perhaps a distro feature gap ? We should try to get poky close to no
> distro as
> > > it=E2=80=99s reference distro
> > > Less work in maintaining nodistro would be beneficial
> >
> > The difference is enable/disable of opengl. They are already very close=
,
> that is
> > one of the few major differences and in some ways it is useful to test
> both.
>
> I see. yes it is important to test opengl and non-opengl case.
>
> >
> > Cheers,
> >
> > Richard
> > >
> >
> >
>

--000000000000327fea05d0869758
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>FWIW, once the next LTS is out, I&#39;m going to prop=
ose the following (I already have the patches):</div><div><br></div><div>- =
nodistro/default oe-core set gets opengl/wayland features (but not vulkan j=
ust yet :)<br></div><div></div><div>- AB&#39;s config.json gets a &#39;only=
-x11&#39; configuration where those features are removed, and sato images/S=
DKs are built and tested</div><div></div><div>- everything else is transiti=
oned to weston, and perhaps phosh :)</div><div><br></div><div><a href=3D"ht=
tp://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakanavin/transitio=
n-to-weston">http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Daka=
navin/transition-to-weston</a></div><div><a href=3D"http://git.yoctoproject=
.org/cgit/cgit.cgi/yocto-autobuilder-helper/log/?h=3Dcontrib/akanavin/trans=
ition-to-weston">http://git.yoctoproject.org/cgit/cgit.cgi/yocto-autobuilde=
r-helper/log/?h=3Dcontrib/akanavin/transition-to-weston</a></div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, 11 Nov 2021 at 17:26, Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Nov 11, 2021 at 7:=
23 AM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, 2021-11-11 at 06:58 -0800, Khem Raj wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Nov 11, 2021 at 2:05 AM Alexander Kanavin &lt;<a href=3D"=
mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>=
&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; This wasn&#39;t a problem in poky, but was exposed with a no=
distro build.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@=
linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | =
2 +-<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg=
.inc<br>
&gt; &gt; &gt; b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc<br>
&gt; &gt; &gt; index 4a7048aced..71c934ef38 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc<br=
>
&gt; &gt; &gt; +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc<br=
>
&gt; &gt; &gt; @@ -28,7 +28,7 @@ inherit meson pkgconfig<br>
&gt; &gt; &gt;=C2=A0 inherit features_check<br>
&gt; &gt; &gt;=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -LIB_DEPS =3D &quot;pixman libxfont2 xtrans libxau libxext l=
ibxdmcp libdrm<br>
&gt; &gt; &gt; libxkbfile<br>
&gt; &gt; &gt; libpciaccess libxcvt&quot;<br>
&gt; &gt; &gt; +LIB_DEPS =3D &quot;pixman libxfont2 xtrans libxau libxext l=
ibxdmcp libdrm<br>
&gt; &gt; &gt; libxkbfile<br>
&gt; &gt; &gt; libpciaccess libxcvt libtirpc&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Interesting. Do we know what the difference is?<br>
&gt; &gt; Perhaps a distro feature gap ? We should try to get poky close to=
 no distro as<br>
&gt; &gt; it=E2=80=99s reference distro<br>
&gt; &gt; Less work in maintaining nodistro would be beneficial<br>
&gt;<br>
&gt; The difference is enable/disable of opengl. They are already very clos=
e, that is<br>
&gt; one of the few major differences and in some ways it is useful to test=
 both.<br>
<br>
I see. yes it is important to test opengl and non-opengl case.<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--000000000000327fea05d0869758--

