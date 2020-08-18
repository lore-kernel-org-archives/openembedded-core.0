Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.70930.1597770653945182223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 10:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JGG+Ub3t;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id n129so18941427qkd.6
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 10:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IimS3Q64Snw1q1RXVMreLRKNhrk4LiTQ2JE3ZgkHTQs=;
        b=JGG+Ub3t+KhvQJQY4UllegtZJ6Ii/TQTfn5L/SajwC/O30I6lhHzVz492voxKO4OIO
         q+TkV/GdPeq8kpMs8UBqhyBF0x84BVqRUe8MWT0zdglIl2Pd4XJm3xB+iGgD4syUAd8v
         rxMWZUR1We0VMfoAs/F2jWUO+q8g8ggXWGlvT4yq9XJzAjbEBCceU6vv4gXpzfP7C1ro
         XvAT+wHGA9FFFYg6Lc+s1bL9rIvxMlJXxyi+KFX0YpS+kgvwVZmHN/XwQbk2/6lxJZKS
         zEG8pvu5f9idzBqrH4SyAD6WW2JxHkDTHW6owE/UB+mvluQhprg9B1cOFobrS7UmXeby
         2BhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IimS3Q64Snw1q1RXVMreLRKNhrk4LiTQ2JE3ZgkHTQs=;
        b=HGs0Lg83tiiacKAlq4XsUnGnq9n0EoXAZlIR6QFZKXAumLQl4jUOehPo8kySp6mLMg
         eP2n1Tu5fbO4hgSg+PUJsmOo+A0vkPBZ62OXzLaZg4gfI2GK+8x9NdsYNEdQQf1clRYn
         4YjZM/oAGdiwmonWwv/2ehgS8cqrTkmeTgamDsOWkRQEJ92sNAUxg4MQdG2kLL6xdPWq
         ER3Yz49/YAlG8a0Ul9TIoJ8zPt5aTRXJjVQWOfZfOB4c7YVXlRzHYCnESaZawjvVfsA6
         XJdrs8oonswipcWDA0P8NkQIfGcx0GYZ+gWlQK2WpvW3o8qZSBpFaNKaM1+nFEbD/mOS
         7dIQ==
X-Gm-Message-State: AOAM532GLc7uVR17Dm1EYj/z+Or0xcjzXrq2I9smN46YbExNbf50PbeQ
	EAfWD/SohhdfjKBy5jxuWHF8gvEPU+3LVj1fPqE=
X-Google-Smtp-Source: ABdhPJzhfAEuz6i/vLeBIISrXW40gxFcEuC8tVH7zvm54AQy0Z7rygQymKNS0Qo0XBkEpcYfnxUUBiRgwG+RB3WwYrQ=
X-Received: by 2002:a05:620a:209b:: with SMTP id e27mr17498404qka.431.1597770653066;
 Tue, 18 Aug 2020 10:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200807164249.32605-1-alex.kiernan@gmail.com>
 <CAMKF1spoj_R_-=CvzV6OE==jpEb0SiGj6FXPi17LoNZjivCOWA@mail.gmail.com>
 <16299320E916D773.23035@lists.openembedded.org> <CAO5Uq5Qc+rVRjAiK6vTiZzG8Ayd3RU0Pko==FXB-OF=krXkLqQ@mail.gmail.com>
 <CAMKF1sp4LUgBiEVYZMYOD9gJaNZePTOG56Xk+ovM1D0bzJDg6Q@mail.gmail.com> <CAO5Uq5RTiJ7Gjv9yq_axtpVu55AYwe87gmuOC96j3Zk1uO_LMA@mail.gmail.com>
In-Reply-To: <CAO5Uq5RTiJ7Gjv9yq_axtpVu55AYwe87gmuOC96j3Zk1uO_LMA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 18 Aug 2020 10:10:26 -0700
Message-ID: <CAMKF1sopMLzU_dxx0+uGB2xHM+3JzgVYkju=GpBskhOAe_L2Mw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] systemd: upgrade v245.6 -> v246
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2020 at 9:43 AM Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
>
> On Sun, Aug 9, 2020 at 3:24 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On Sun, Aug 9, 2020 at 4:04 AM Alex Kiernan <alex.kiernan@gmail.com> wr=
ote:
> >>
> >> On Sun, Aug 9, 2020 at 11:35 AM Alex Kiernan via
> >> lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.or=
g>
> >> wrote:
> >> >
> >> > On Sun, Aug 9, 2020 at 7:22 AM Khem Raj <raj.khem@gmail.com> wrote:
> >> > >
> >> > > Hi Alex
> >> > >
> >> > > I am seeing a packaging failure for iwd
> >> > >
> >> > > http://errors.yoctoproject.org/Errors/Details/459665/
> >> > >
> >> > >  which seems to originate from this patch
> >> > > iwd configure detects path to systemd modules load directory if
> >> > > --with-systemd-modloaddir is not specified using pkgconfing to enq=
uire
> >> > > modulesloaddir variable from systemd.pc
> >> > > and the value for this has changed in latest systemd via this patc=
h
> >> > >
> >> > > https://github.com/systemd/systemd/commit/4a56315a990b802860170ecd=
1bbd3eb68e14a38b
> >> > >
> >> > > as a result now
> >> > >
> >> > > modules_load_dir=3D${rootprefix}/lib/modules-load.d
> >> > > modulesloaddir=3D${modules_load_dir}
> >> > >
> >> > > but rootprefix is empty in OE version of systemd.pc i systemd < 24=
6  had
> >> > >
> >> > > modulesloaddir=3D${prefix}/lib/modules-load.d
> >> > >
> >> > > and prefix=3D/usr
> >> > >
> >> > > I could have easily fixed it in iwd by adding the additional confi=
gure
> >> > > option but it seems that systemd recipe should rather be fixed to =
use
> >> > > proper value for ROOTPREFIX
> >> > >
> >> >
> >> > Presumably this is building with usrmerge?
> >> >
> >>
> >> Having dug a bit more, I suspect this is without usrmerge?
> >
> >
> > That=E2=80=99s correct
> >
> >>
> >>
> >> It looks to me like that upstream change is just wrong for the !usrmer=
ge case.
> >
> >
> > I am not sure perhaps best to ask upstream Via comments to systemd comm=
it
> >
>
> https://github.com/systemd/systemd/issues/16773
>
> I have a patch locally which "fixes" it, but waiting to see first what
> the upstream view is.


thanks for followup Alex,
>
> --
> Alex Kiernan
