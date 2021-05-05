Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.957.1620255339650721128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 15:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f9dUMS32;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id a22so2709076qkl.10
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 15:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ilwHKgXihjuvAjBnnnx/GErubHqvl2wXIeepRanrgK4=;
        b=f9dUMS32cnW/Mlpunn83cCQ3PympfgsiRmr6e22XJtB9gzIVv04MAFPgg93bPYh/zz
         UhqT8tvxjhqmV6Y5pQrRU7mLqpRg5Fivx+/vBubHQqKK9ZFt91LQmeBH4L2U76yGYoRS
         jICcY9Zvx5U/uYOM4da3cEfbrbGm/m2V92UlGmuNHHDM+hVTf62NleAnv8+CnDeBdE/w
         tRGDOQGVUh9q4yo0A7uYM9lThdXWIX/yKwQjcNtpa5sYKgjSLzRq0lkCIzp76CHWjQhp
         dklZYh412NFMrk47g+rwQhscEns1Dz753RLYK/bK8sHl3pwc9Pk+Lpgr/trUSp8Afe+o
         JBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ilwHKgXihjuvAjBnnnx/GErubHqvl2wXIeepRanrgK4=;
        b=ZDt3Y3vGD/K4GOOsgwnfZu3e28V7eEkLLry5XlS3Rm/5PsVTS8tBN4TAlbBVVVLL1C
         vCL+Mr2ihXCYHNaRI4l+CUgb2tO4PdH+m0L+IA2hxP8FCVdaMGhatjnO2VQ3cvl/v61L
         ZcJhSzopAbLEUnNMMHiRJHaTGH1751okLuzw0Hnxlbs0yX57YGscV708nH1DFot9uPUs
         Did8wxKz/2OnAzLACcwhDihl7m2WQvUCoctXP1AgHYS8Sg8UHa6GfaRCsrRxsy+D7QMa
         Z/sY/DZNeTZHlO4Spj9EZyJgA7G9uvX5vYEwsXc2D0vXiePQpLY7USJhjGCxdlKPQsNI
         Wvhw==
X-Gm-Message-State: AOAM530QGRU8FCdYeuQoyoxkiUGQgsYy3QFB6yiKD4TKXjYjoLwbZjPf
	vA8lZDmNJ6a7r0MkfSeA63hdKKJa/Qk9U4pC/ms=
X-Google-Smtp-Source: ABdhPJwnUSheQaY7sXZbWdTHvzoDu6gZbJUypFgfyD+18uLWTuGNTibPhrrcK3joDQY2JIMzKXmGYy3DLvfqypZskHA=
X-Received: by 2002:a37:9607:: with SMTP id y7mr1127009qkd.25.1620255338824;
 Wed, 05 May 2021 15:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-58-alex.kanavin@gmail.com> <CAMKF1spEqemKRZAwWnDMupsSmk7rteUef6P1HbmC0-KtsOjO_w@mail.gmail.com>
 <CANNYZj9scBK7xAZpR1A3Fs9AiC8MT_EZHqszbGfiAkZSZgMYwg@mail.gmail.com>
 <443c94b6db48ae6b7daae10b529b8ea420be4add.camel@linuxfoundation.org>
 <CAMKF1so4BWNatThY_tixepiRUvzH=kfE7_4BWHroj4RnzSVQyA@mail.gmail.com>
 <0dc03ad24ae6700f7757b6afca84c37758759d29.camel@linuxfoundation.org>
 <CAMKF1spWRv+mhtzRti5vpn8ja94CgrJLnJ5sSt10VaX_AUhHbg@mail.gmail.com> <669dfd1f4c2d3c444cbff5c467187ed24306b4e6.camel@linuxfoundation.org>
In-Reply-To: <669dfd1f4c2d3c444cbff5c467187ed24306b4e6.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 15:55:28 -0700
Message-ID: <CAMKF1sr6XJ5LQ8XkkaVJdezvdspw_zAAjbbohcU=r-bh7bhYaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 58/61] gi-docgen: add a recipe and class
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ea875005c19d171d"

--000000000000ea875005c19d171d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 5, 2021 at 3:16 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2021-05-05 at 15:07 -0700, Khem Raj wrote:
> > On Wed, May 5, 2021 at 2:52 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2021-05-05 at 14:28 -0700, Khem Raj wrote:
> > > > On Wed, May 5, 2021 at 2:09 PM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Wed, 2021-05-05 at 20:45 +0200, Alexander Kanavin wrote:
> > > > > > On Wed, 5 May 2021 at 20:05, Khem Raj <raj.khem@gmail.com>
> wrote:
> > > > > > > On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> > > > > > > >
> > > > > > > > This seems to be the gtk-doc successor, and gnome
> > > > > > > > projects such as pango and gdk-pixbuf have started
> > > > > > > > transitioning to it.
> > > > > > > >
> > > > > > >
> > > > > > > going through
> > > > > > > https://gitlab.gnome.org/GNOME/gi-docgen#disclaimer
> > > > > > >
> > > > > > > it seems that its still under development and not declared
> stable, so
> > > > > > > I am wary of the churn it will cause.
> > > > > > > I would prefer to wait until at least its declared prime time
> for
> > > > > > > system wide inclusion.
> > > > > > >
> > > > > >
> > > > > >
> > > > > > It is only built if you enable api-documentation, and even then
> used only
> > > > > > in pango and gdk-pixbuf. I'd say it's fairly well contained.
> > > > >
> > > > > I did also have a quick chat with friends in that community and
> their advice
> > > > > was that it was ok to switch now FWIW...
> > > >
> > > > ok, that helps, perhaps they can reflect this assertion in document
> above?
> > > > but still, depending upon abandoned packages needs to be answered b=
y
> > > > upstream IMO before we tread down this path
> > >
> > > Reading that disclaimer, it seems to be saying they're making it work
> for gtk.
> > > We're using it in the gtk related components it is being developed fo=
r
> so I'm
> > > not sure there is an issue. What it says not to do is use it for
> general non-gtk
> > > code. We're not using it outside gtk?
> >
> > This above says
> >
> > GI-DocGen is still in development. The recommended use of GI-DocGen is
> > to add it as a sub-project to your Meson build system, and vendor it
> > when releasing dist archives.
> >
> > we are trying to use it in system mode and not vendored along with
> > packages which need it. Perhaps I am misunderstanding?
>
> Effectively we are vendoring it since only things with a dependency on it
> will see it
> and we're only depending on it from things which it is intended for. It
> isn't like
> we're making it a system wide development tool.


I thought vendoring would mean you don=E2=80=99t need the tools that are us=
ed but
the output is captured like how configure file is pregenerated in autoconf
world

But I guess we want the updates so as long as we can make progress with
upstream on seeing if these dependencies would have some adopters so they
can be maintained we should be good



>
> Cheers,
>
> Richard
>
>

--000000000000ea875005c19d171d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, May 5, 2021 at 3:16 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 2021-=
05-05 at 15:07 -0700, Khem Raj wrote:<br>
&gt; On Wed, May 5, 2021 at 2:52 PM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; On Wed, 2021-05-05 at 14:28 -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; On Wed, May 5, 2021 at 2:09 PM Richard Purdie<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" ta=
rget=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On Wed, 2021-05-05 at 20:45 +0200, Alexander Kanavin wr=
ote:<br>
&gt; &gt; &gt; &gt; &gt; On Wed, 5 May 2021 at 20:05, Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Wed, May 5, 2021 at 8:20 AM Alexander Kana=
vin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.ka=
navin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; This seems to be the gtk-doc successor, =
and gnome<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; projects such as pango and gdk-pixbuf ha=
ve started<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; transitioning to it.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; going through<br>
&gt; &gt; &gt; &gt; &gt; &gt; <a href=3D"https://gitlab.gnome.org/GNOME/gi-=
docgen#disclaimer" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnom=
e.org/GNOME/gi-docgen#disclaimer</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; it seems that its still under development and=
 not declared stable, so<br>
&gt; &gt; &gt; &gt; &gt; &gt; I am wary of the churn it will cause.<br>
&gt; &gt; &gt; &gt; &gt; &gt; I would prefer to wait until at least its dec=
lared prime time for<br>
&gt; &gt; &gt; &gt; &gt; &gt; system wide inclusion.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; It is only built if you enable api-documentation, =
and even then used only<br>
&gt; &gt; &gt; &gt; &gt; in pango and gdk-pixbuf. I&#39;d say it&#39;s fair=
ly well contained.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; I did also have a quick chat with friends in that commu=
nity and their advice<br>
&gt; &gt; &gt; &gt; was that it was ok to switch now FWIW...<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ok, that helps, perhaps they can reflect this assertion in d=
ocument above?<br>
&gt; &gt; &gt; but still, depending upon abandoned packages needs to be ans=
wered by<br>
&gt; &gt; &gt; upstream IMO before we tread down this path<br>
&gt; &gt; <br>
&gt; &gt; Reading that disclaimer, it seems to be saying they&#39;re making=
 it work for gtk.<br>
&gt; &gt; We&#39;re using it in the gtk related components it is being deve=
loped for so I&#39;m<br>
&gt; &gt; not sure there is an issue. What it says not to do is use it for =
general non-gtk<br>
&gt; &gt; code. We&#39;re not using it outside gtk?<br>
&gt; <br>
&gt; This above says<br>
&gt; <br>
&gt; GI-DocGen is still in development. The recommended use of GI-DocGen is=
<br>
&gt; to add it as a sub-project to your Meson build system, and vendor it<b=
r>
&gt; when releasing dist archives.<br>
&gt; <br>
&gt; we are trying to use it in system mode and not vendored along with<br>
&gt; packages which need it. Perhaps I am misunderstanding?<br>
<br>
Effectively we are vendoring it since only things with a dependency on it w=
ill see it<br>
and we&#39;re only depending on it from things which it is intended for. It=
 isn&#39;t like <br>
we&#39;re making it a system wide development tool.</blockquote><div dir=3D=
"auto"><br></div><div dir=3D"auto">I thought vendoring would mean you don=
=E2=80=99t need the tools that are used but the output is captured like how=
 configure file is pregenerated in autoconf world=C2=A0</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">But I guess we want the updates so as long =
as we can make progress with upstream on seeing if these dependencies would=
 have some adopters so they can be maintained we should be good=C2=A0</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000ea875005c19d171d--
