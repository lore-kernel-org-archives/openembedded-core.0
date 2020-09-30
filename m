Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.7248.1601506034829193852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V9Te2NMM;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id c2so3298449qkf.10
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DdfCiV380bZtNc9BJkciTQmDYiG6wPLWhLGF7bRZGkw=;
        b=V9Te2NMMk1pVd2yICZ6qa3dG+CB+Si+d0FXIadmGEyP0E5jBBMWEEKUQxHUfu4p+72
         f8OOjbFljBx2HFTUG/DP88rAY1XRe3EYI720R/wAQggHRGv6QIhYzoEb8sBaKfV1QtA7
         8iyel5tnDyhHHPYVDtg5kWICgDS0PlVZ6BaV5h+K0FM6TU+vFQiMl35eFnJXRhsQ56vO
         ZLb1UYNRkSY9IiEscOFr0tW5EsdtUIvECEBg8kYiBsL1Ee36mI+LEY8RXjgh40DSW4gB
         JG+y64dYC9NzaQDQK1JQKXdgwNOOZwfRGQTtMyDhnDQm6JQ2zSjeZ4eSt5ZQLJZiaSDG
         Xy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DdfCiV380bZtNc9BJkciTQmDYiG6wPLWhLGF7bRZGkw=;
        b=P58q6itzEKfw+U5CfSSAZQ4X8QDPjfyyc2lWOzKtQOEwN/k/oCkuwYKA5/JgholT9t
         AAcam7WOY3jrg7MZoGMT+g0DxtGEH31wWy7eROOETK8zOMqKIqKldSEr6shdf9sLSwzc
         rXIgurQZMATZiq7taQ266dumJPgjmlJFmQpXvB7PEBYhsDYi8GStge6dEFDUWYplzCyU
         mv1G8DKhDHZasuR6rvlFAIM+lMJIU+mar/ZtBIffQ2O132rtlFgi5DhKTcj3BGPQIz8S
         KSwohfpis9TvetbP7G9Wt+HWBfCF+a0FBOW+kb42DrHUyTnMStw7nkbmFwCVtCqg5mYa
         OnpQ==
X-Gm-Message-State: AOAM530eQP4+rHdA9O/OYo897iVz1Rb7qAnbrxwS1TSbZPJVqOQORQjF
	On0xXUOGRmaloM1PbN6C3FCbW+EFje2NsgOvx76mJonJHPg=
X-Google-Smtp-Source: ABdhPJzHRrtNsnJ/VMt/bIcUFPkezgTiu7cglibYDmng/TcBCN1XeKqZVPjuKy9RoxboUtDPOKG30CWCjMUKkQdh5Aw=
X-Received: by 2002:a05:620a:7f6:: with SMTP id k22mr4935507qkk.337.1601506033832;
 Wed, 30 Sep 2020 15:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211644.119920-1-otavio@ossystems.com.br>
 <CAMKF1srtqeTcBsXoR=DLa73_b7Zswf+TbuAw2zZPiRpraoZi-Q@mail.gmail.com>
 <CAP9ODKqcGWVwmX_5Gf=GKTAuAPSAMsVx9v_2er8-gb0VQJkNRA@mail.gmail.com>
 <CAMKF1soHfZrR5vCkbZ4wmYi+7-phdty_sBR74MYsth5Nw7Q88Q@mail.gmail.com> <CAP9ODKrXC9UFeXVzPLvmC-e3KMUyXkgyFqPBFaMB2-Qn3-t+QA@mail.gmail.com>
In-Reply-To: <CAP9ODKrXC9UFeXVzPLvmC-e3KMUyXkgyFqPBFaMB2-Qn3-t+QA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 30 Sep 2020 15:46:47 -0700
Message-ID: <CAMKF1sru9YYgXY3J9dAzAZQe=NRJYsRqsAjk3+FvfoP4UEEFbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] weston-init: Add environment file support for systemd unit file
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Fabio Berton <fabio.berton@ossystems.com.br>, Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 3:19 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Em qua., 30 de set. de 2020 =C3=A0s 18:55, Khem Raj <raj.khem@gmail.com> =
escreveu:
> > On Wed, Sep 30, 2020 at 2:41 PM Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> > >
> > > Em qua., 30 de set. de 2020 =C3=A0s 18:31, Khem Raj <raj.khem@gmail.c=
om> escreveu:
> > > > On Wed, Sep 30, 2020 at 2:17 PM Otavio Salvador
> > > > <otavio.salvador@gmail.com> wrote:
> > > > > diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.se=
rvice b/meta/recipes-graphics/wayland/weston-init/weston@.service
> > > > > index 0a1df15bdf..ce8f4fb71a 100644
> > > > > --- a/meta/recipes-graphics/wayland/weston-init/weston@.service
> > > > > +++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
> > > > > @@ -29,6 +29,7 @@ ConditionPathExists=3D/dev/tty0
> > > > >  [Service]
> > > > >  # Requires systemd-notify.so Weston plugin.
> > > > >  Type=3Dnotify
> > > > > +EnvironmentFile=3D/etc/default/weston
> > > >
> > > > Lets make it not fail when not there
> > > >
> > > > EnvironmentFile=3D-/etc/default/weston
> > >
> > > We made it required as it is always installed. So I think it should b=
e
> > > required. How it could not be available?
> >
> > These are optional environment settings, this will enforce someone to
> > push an empty file if they need to override it instead of just
> > deleting it.
>
> The point is weston-init[1] always install it as well as the service file=
.
>
> 1. https://github.com/openembedded/openembedded-core/blob/master/meta/rec=
ipes-graphics/wayland/weston-init.bb#L27
>
> So it does sounds wrong to allow it to not be there. The recipe
> explicitly adds it in every case.

Hmm so we do install empty file by default. Perhaps then it will work.

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
