Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.2699.1600735293511436483
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 17:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mOYoZb1D;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id gr14so20416113ejb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 17:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fh9Vk6XxC7U3koA3pxZqag+uxxpmx/qCAm7ZyXMYJZQ=;
        b=mOYoZb1Db05UoqH6xaCOQkEGWFx1i/4VA8fFkEiYzeparRdLgW3/1P5JuOw+IdDkI9
         MWdgvpUr5bdl0tnn0m0HuQOBQQU0UWySjGOji8Kf1bd1PH/xiZwsPk7zY51eR6xaHiUg
         4QkMTNadSzLhUb4fi1zaZWDQH1gsuXd9WhSDGrmjPZZ0hMVndNui2RRy/GGCSvV7UD70
         3YeDHslz14tCaIeV9PCw83jDiu8M4WBOussR4Sl8vaM4KMA/R7ZCKOfFURizD1+yYDFX
         +smHicG2zKxNf1hIKguY2oPZ+SP9SXQmgtVqoqU2+muDCkfsqgiqzhCfWL1cjM0gUxhJ
         wV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fh9Vk6XxC7U3koA3pxZqag+uxxpmx/qCAm7ZyXMYJZQ=;
        b=MsCTuoEEBLijzoP5vbOiifbP0m0C+OnjC7AUWCrOJvPGsMJfdPr/sBwl8T3ZVNIA8r
         zXu35p0qYUY4ygC0Asm3RL8/FwN2yf8YeH8XjNDuvmrqeuaweLz7S0YxG5bXzIXNzHMx
         dCxI+EyGKE8b11ESh1571uGDXZC620htA7NO3VxVdbPp7GSVqqKktrenOdBVry0u51I4
         OMCdUN5tZafF99V0XsW8R9CEYXumf9Hemo1eBQNbHtUBqT77DN13r2vb50oEAWSnaMfi
         cINPuY9WIp4hfY5MTGqE0ipgXJAW7ujX6V5/PKZlmv+oB90lDQ/vuCoo62zSp3koU6/b
         E+vw==
X-Gm-Message-State: AOAM532uKQ0APaoVKVW+6l8uyOugijgn8OYpl+0As6W5J8GHRPNpcylb
	hfWrZIy0KV7G/rVTRtgsVHei861qVoAJsHxdG88=
X-Google-Smtp-Source: ABdhPJw25qpuEsFNqYsRC27auelhtWUhhDGp9Qv9RBAmJGfM2o5UUW7bFKfkiNl5exut5a3HK9nJ8uJR6graHQkA8Eo=
X-Received: by 2002:a17:906:e18:: with SMTP id l24mr2226133eji.334.1600735291546;
 Mon, 21 Sep 2020 17:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200921141544.3145189-1-yann@blade-group.com>
 <20200921141544.3145189-9-yann@blade-group.com> <1c41fc0d0f0928baeacb628812cafd66de745b75.camel@linuxfoundation.org>
 <CA+4=imb9n8r-taOxj68JagEVJkisUFk3vHVbKOru8Td24kLHdg@mail.gmail.com> <581392d58d402cf3b79f8bd36f8d5d5f7fa4c1bd.camel@linuxfoundation.org>
In-Reply-To: <581392d58d402cf3b79f8bd36f8d5d5f7fa4c1bd.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 21 Sep 2020 20:41:20 -0400
Message-ID: <CADkTA4M4nAke3L=GPseCHGT=rmqVnKbNWGd8QEyzz_saeKt3pQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 8/8] New systemtap.bb class, and systemtap-demo.bb to illustrate it.
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yann Dirson <yann.dirson@blade-group.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 6:51 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-09-21 at 23:23 +0200, Yann Dirson wrote:
> >
> >
> > Le lun. 21 sept. 2020 =C3=A0 21:46, Richard Purdie <
> > richard.purdie@linuxfoundation.org> a =C3=A9crit :
> > > On Mon, 2020-09-21 at 16:15 +0200, Yann Dirson wrote:
> > > > From: Yann Dirson <yann@blade-group.com>
> > > >
> > > > ---
> > > >  meta/classes/systemtap.bbclass                | 74
> > > +++++++++++++++++++
> > > >  .../systemtap/systemtap-demo_git.bb           | 71
> > > ++++++++++++++++++
> > > >  2 files changed, 145 insertions(+)
> > > >  create mode 100644 meta/classes/systemtap.bbclass
> > > >  create mode 100644 meta/recipes-kernel/systemtap/systemtap-
> > > demo_git.bb
> > >
> > > I'm afraid this patch is going to throw warnings all over the
> > > autobuilder, e.g.:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/24=
88
> > >
> > > (and there will be more).
> > >
> > > We are trying to ensure all warnings are solved so that any that do
> > > show are real issues and this patch would significantly distract
> > > from
> > > that.
> >
> > OK, we could default to built just the handful of probes that should
> > always build, and give instructions for those willing to use the
> > current behaviour.
>
> I think that is going to be safer and we could grow into more examples
> if/as/when we van build them.

Also, as the person that usually picks up systemtap breakage first
on our new kernel versions .. we need to make sure that the reworked
recipe and class pass the oe-selftest for stap.

It is doing on target compilation, so ideally, that test should be expande=
d
to test bot the cross and on-target variants.

Cheers,

Bruce

>
> >
> > > I'm also wary that we're now in feature freeze for release so
> > > perhaps
> > > these changes should wait until 3.3?
> >
> > OK, I can reroll a series with just the fixes.
>
> That would be great.
>
> > For the rest should I just wait for the gatesgarth branch to be
> > created and resubmit then ?
>
> Once we start taking new work on master, yes.
>
> Also, for a new recipe like this we need a maintainers entry, else we
> see:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1377
>
> Cheers,
>
> Richard
>
>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
