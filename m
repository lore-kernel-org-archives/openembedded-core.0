Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.8391.1603976642956960808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 06:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f3UOBiJR;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id w25so1435537vsk.9
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 06:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1vqJnH5fR3/hNq/jEH4NQgRiq3VpHJ+c9+m78kXc7iY=;
        b=f3UOBiJRxfBFyOgquRj2VdGb+wXmY7Z94T+H02ox66/KGzodDg0inEacGTtNd99jDX
         q4SX+TL7sNvLjcBQeilMnmYPT6NC3HbKTyobd6Z/7NF+bRgZTSle4v0tDm5KZ+bC+627
         8Py9jR2nLIyWzlkoGJQUZTFEguMXM0Z53ZMzmVHyETV7j+nIxx8EJJQHoqBXFFPBHdfz
         vGDSVZBuf8cwKZsn7AY2b1OissZ4ND9rVURBJt4UavjdjlHCjzyoFf43Ug/bzRZ+boZO
         gqhzW3xY1zsZSP4AI+9RXymlv8wYm5you2qmnCuEeSyOT3S+d4v31TL3f1lttjs6ccOx
         LEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1vqJnH5fR3/hNq/jEH4NQgRiq3VpHJ+c9+m78kXc7iY=;
        b=E2mcV9TVDCQJB6CGyw8k8KDraaN4tIeLsc1dYyVa0WxSpxLSmNfRjf24mhnoLBT+bB
         JekBcDCC2zi940JaH0vNsZ0xqfk4AEt1ikwG6nOLBjKU6lEeiY1+PE147J18WR44/PLv
         96LeMRTyyxLT0cvuoLMTM6IbIZF4zfjIaxlHwUN1Q8jiqsSadYExI7FmEkQ8xo9MjMB6
         vY2JjrvVjzE1nOHHFUo0ft9dtHM6onkLNvbCrWC8LkbjsCfxamtPLfhF3fCglBwxI2XE
         TZdshrvimm2aMsxqCFFBgpLUHl3UiunxyfU/KabcAsFJu/dErJxsboO2krWY8eqeaD1r
         dJuQ==
X-Gm-Message-State: AOAM533vvUPFVNdCySyxUVcy3CIp2Y1WnqQf0UGfXnemY5kmj+JNw6Zb
	4+334jzslFckJ67VK+t8nwHI4lGmvH2ZUOJ9uGw=
X-Google-Smtp-Source: ABdhPJwXdfbcWI8tWDxeY7FxmPe4FFewuk5KFFtrL+FwxFb5/WUdNhDLa+Ufsg6oqLGtK+Em+1WkIYb9+hcedUbtUlg=
X-Received: by 2002:a05:6102:119:: with SMTP id z25mr2732312vsq.51.1603976642213;
 Thu, 29 Oct 2020 06:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
 <6c5cc7223aec5587143b1d7e165346494a4ab77d.camel@linuxfoundation.org>
 <CANPvuRkMioP_k1f6=xj3Gn==wQq-JUtzqcux=sCV98CibvKFrA@mail.gmail.com>
 <CANNYZj9x+mWxJ6NnUarwF3Q1YjoqmDYq83ZwFc8aQY2fyQjtuQ@mail.gmail.com>
 <2002eb09317f295e090792f561e8ff33a67b8e96.camel@linuxfoundation.org> <CANPvuRk13xJMo=AoTc29=BwCTqcgB56bNsQ4DuSNC2SnhuGwAg@mail.gmail.com>
In-Reply-To: <CANPvuRk13xJMo=AoTc29=BwCTqcgB56bNsQ4DuSNC2SnhuGwAg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 29 Oct 2020 14:03:49 +0100
Message-ID: <CANNYZj8Yzap6Np9_RndKXDEEJU1pYUFdbQcAQk5j+u-q_wxM1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 00/21] Updates the gstreamer to version 1.18.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fcbd9505b2cee935"

--000000000000fcbd9505b2cee935
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

gstreamer-libav 1.16 had this:
LICENSE_FLAGS =3D "commercial"

Update to 1.18 dropped this erroneously - I think once it's restored, the
issue will be solved.

Alext

On Thu, 29 Oct 2020 at 13:52, Jose Quaresma <quaresma.jose@gmail.com> wrote=
:

> ffmpeg is disabled because of LICENSE_FLAGS_WHITELIST in the build
> configuration.
> I think there are no issues with the removal of x11 from distro futures.
> It is present on the autobuilder logs:
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'ffmpeg' (but
>
> /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstream=
er/
> gstreamer1.0-libav_1.18.0.bb
> DEPENDS on or otherwise requires it)
> ffmpeg was skipped: because it has a restricted license 'commercial'.
> Which is not whitelisted in LICENSE_FLAGS_WHITELIST
>
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> quinta, 29/10/2020 =C3=A0(s) 12:32:
> >
> > On Thu, 2020-10-29 at 13:20 +0100, Alexander Kanavin wrote:
> > > Wait, ffmpeg has been available in oe-core for a long time:
> > >
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-multimed=
ia/ffmpeg
> > >
> > > So the issue is not the absence of ffmpeg.
> >
> > Right, that shouldn't be the issue. I think its the disabling of X11
> > that is breaking something somehow.
> >
> > You can see the configuration used at the start of:
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2629/st=
eps/8/logs/step1b
> >
> > the key component being:
> >
> > DISTRO_FEATURES_remove =3D 'x11'
> >
> > I think ffmpeg is being disabled due to x11 being removed but something
> > which depends on ffmpeg is being left enabled accidentally.
> >
> > Cheers,
> >
> > Richard
> >
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>

--000000000000fcbd9505b2cee935
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>gstreamer-libav 1.16 had this:</div><div>LICENSE_FLAG=
S =3D &quot;commercial&quot;</div><div><br></div><div>Update to 1.18 droppe=
d this erroneously - I think once it&#39;s restored, the issue will be solv=
ed.<br></div><div><br></div><div>Alext<br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 29 Oct 2020 at 13:5=
2, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_=
blank">quaresma.jose@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">ffmpeg is disabled because of LICENSE_FLAGS_W=
HITELIST in the build<br>
configuration.<br>
I think there are no issues with the removal of x11 from distro futures.<br=
>
It is present on the autobuilder logs:<br>
<br>
NOTE: Resolving any missing task queue dependencies<br>
ERROR: Nothing PROVIDES &#39;ffmpeg&#39; (but<br>
/home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstreamer=
/<a href=3D"http://gstreamer1.0-libav_1.18.0.bb" rel=3D"noreferrer" target=
=3D"_blank">gstreamer1.0-libav_1.18.0.bb</a><br>
DEPENDS on or otherwise requires it)<br>
ffmpeg was skipped: because it has a restricted license &#39;commercial&#39=
;.<br>
Which is not whitelisted in LICENSE_FLAGS_WHITELIST<br>
<br>
<br>
Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" ta=
rget=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu no dia<=
br>
quinta, 29/10/2020 =C3=A0(s) 12:32:<br>
&gt;<br>
&gt; On Thu, 2020-10-29 at 13:20 +0100, Alexander Kanavin wrote:<br>
&gt; &gt; Wait, ffmpeg has been available in oe-core for a long time:<br>
&gt; &gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/me=
ta/recipes-multimedia/ffmpeg" rel=3D"noreferrer" target=3D"_blank">http://g=
it.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-multimedia/ffmpeg<=
/a><br>
&gt; &gt;<br>
&gt; &gt; So the issue is not the absence of ffmpeg.<br>
&gt;<br>
&gt; Right, that shouldn&#39;t be the issue. I think its the disabling of X=
11<br>
&gt; that is breaking something somehow.<br>
&gt;<br>
&gt; You can see the configuration used at the start of:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/40/=
builds/2629/steps/8/logs/step1b" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2629/steps/8/l=
ogs/step1b</a><br>
&gt;<br>
&gt; the key component being:<br>
&gt;<br>
&gt; DISTRO_FEATURES_remove =3D &#39;x11&#39;<br>
&gt;<br>
&gt; I think ffmpeg is being disabled due to x11 being removed but somethin=
g<br>
&gt; which depends on ffmpeg is being left enabled accidentally.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
<br>
<br>
-- <br>
best regards,<br>
Jos=C3=A9 Quaresma<br>
</blockquote></div>

--000000000000fcbd9505b2cee935--
