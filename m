Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web10.6697.1601504379708216455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=tqJWfNoo;
 spf=pass (domain: ossystems.com.br, ip: 209.85.167.66, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-lf1-f66.google.com with SMTP id z19so4090430lfr.4
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nEPv4e03gXjwLJ6yL0/IbbjYv8lljakh9HFAre/PGtQ=;
        b=tqJWfNooHeidlYgJ0CBncRYX55g7oH0KOFlMa9tmsZ4BSvkyoJd6r10yPJ3WVqeTFe
         IGKM2X6kjgYQhqYz89Sd5kxR7PIzQBIeWk/YahuvPhbQeDz0pRK9gLcwr/5HN4eDOQK8
         le/fDrYWef7sqpPUo8CDBem8U4g1RsqMGNHRwxlArSRvbojtVq3VXxbv30vIlIs3MmUc
         NF+SavKGG98GAEuEt3fYT+u1XFSfUX4DY2U0SnK41rR62OoBEtWR+mWt0jO8TUju61SS
         ViFswOmGoPYbs7q+cREGJlzy+dEo/I7fzedkRaR/EkdpgWfVIAo9l37nQ2SbSTcqLjUv
         mq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nEPv4e03gXjwLJ6yL0/IbbjYv8lljakh9HFAre/PGtQ=;
        b=E+8uBGA/5ch+NBP7ksifwOowetoM0b10FY7B9SfQ0uXIJFjy+OPSkVyhKoaWfVr548
         qI3pueFm8l0Qd10nNMPWr/6BiV2jbKOJqSbbx/8ix+3MYupoqMyn5zx6G7N4igdxKuOy
         paJ+3XqEoa3gRKBGs8S1aJYhXHZmUzukUDpNElzBmh2J7yfzuQhdxrDqzUyHMB5kKLEZ
         TOImTP+zeT7gLJG05oMUEwfiiyVIsNHhBvrvUSbl20HPBGk3KRRexbF4tKqGQvd2/wVv
         Y+zz+MUNar80U0+I89D/MxUsPBIZOzGdotcNdCck+jx1CPxHszgIE2hM1g+N0TQwXePe
         mRxQ==
X-Gm-Message-State: AOAM53163vsIA4t+lqaJH+Xxy0peTblsF3h/PDG/rF77+qu9qvMmxBuj
	P341Oh0yuIWq9cBTLZ7PxqRiZM5uB7T32T7o
X-Google-Smtp-Source: ABdhPJz5wYBIsMBAxiBMsWTyxJ+EGDQCL60WrAC+yCV9a1eOTqHd5BLaTUvPmINg8qdS3KLcTf+D4g==
X-Received: by 2002:a19:771d:: with SMTP id s29mr1426041lfc.521.1601504377260;
        Wed, 30 Sep 2020 15:19:37 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id b197sm327397lfd.251.2020.09.30.15.19.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 15:19:36 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-lf1-f47.google.com with SMTP id x69so4085051lff.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:19:36 -0700 (PDT)
X-Received: by 2002:a19:9152:: with SMTP id y18mr1714627lfj.376.1601504376381;
 Wed, 30 Sep 2020 15:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211644.119920-1-otavio@ossystems.com.br>
 <CAMKF1srtqeTcBsXoR=DLa73_b7Zswf+TbuAw2zZPiRpraoZi-Q@mail.gmail.com>
 <CAP9ODKqcGWVwmX_5Gf=GKTAuAPSAMsVx9v_2er8-gb0VQJkNRA@mail.gmail.com> <CAMKF1soHfZrR5vCkbZ4wmYi+7-phdty_sBR74MYsth5Nw7Q88Q@mail.gmail.com>
In-Reply-To: <CAMKF1soHfZrR5vCkbZ4wmYi+7-phdty_sBR74MYsth5Nw7Q88Q@mail.gmail.com>
Date: Wed, 30 Sep 2020 19:19:23 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrXC9UFeXVzPLvmC-e3KMUyXkgyFqPBFaMB2-Qn3-t+QA@mail.gmail.com>
Message-ID: <CAP9ODKrXC9UFeXVzPLvmC-e3KMUyXkgyFqPBFaMB2-Qn3-t+QA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] weston-init: Add environment file support for systemd unit file
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Fabio Berton <fabio.berton@ossystems.com.br>, Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 30 de set. de 2020 =C3=A0s 18:55, Khem Raj <raj.khem@gmail.com> es=
creveu:
> On Wed, Sep 30, 2020 at 2:41 PM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> >
> > Em qua., 30 de set. de 2020 =C3=A0s 18:31, Khem Raj <raj.khem@gmail.com=
> escreveu:
> > > On Wed, Sep 30, 2020 at 2:17 PM Otavio Salvador
> > > <otavio.salvador@gmail.com> wrote:
> > > > diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.serv=
ice b/meta/recipes-graphics/wayland/weston-init/weston@.service
> > > > index 0a1df15bdf..ce8f4fb71a 100644
> > > > --- a/meta/recipes-graphics/wayland/weston-init/weston@.service
> > > > +++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
> > > > @@ -29,6 +29,7 @@ ConditionPathExists=3D/dev/tty0
> > > >  [Service]
> > > >  # Requires systemd-notify.so Weston plugin.
> > > >  Type=3Dnotify
> > > > +EnvironmentFile=3D/etc/default/weston
> > >
> > > Lets make it not fail when not there
> > >
> > > EnvironmentFile=3D-/etc/default/weston
> >
> > We made it required as it is always installed. So I think it should be
> > required. How it could not be available?
>
> These are optional environment settings, this will enforce someone to
> push an empty file if they need to override it instead of just
> deleting it.

The point is weston-init[1] always install it as well as the service file.

1. https://github.com/openembedded/openembedded-core/blob/master/meta/recip=
es-graphics/wayland/weston-init.bb#L27

So it does sounds wrong to allow it to not be there. The recipe
explicitly adds it in every case.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
