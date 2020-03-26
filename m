Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.34419.1585220660584353297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 04:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=doZGfwCC;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id a6so4896213ilr.4
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 04:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ety4QPFx37ZnyIuC+hMhpge8niEhq61S1oncysWLV1w=;
        b=doZGfwCCI9cIKalsz5JuZ++kuS33DXoLb+R8G8xsCNLnnyoXow8e4p2ZM7jK4/0wBc
         RY5eWFxqc4jbCYfXBbESJuSsDSBXynBM72gBXInYUFhrrfFSGJg2E2J1w4Cg8DrD9Ufy
         rClx6+F4j0qZ/IYS4XeFQL72Mcrs2JKCgSxQmnLLbw5+VDCkVzzp83mnB/DAW55TNwdj
         e9yDaFdl1ajOd736D6n+/T+C47P9PUPYJ4yHT+iYNZNk6Ekmd7jjiHwp+3a1yLRA+rSj
         1SIB8tVz+BgSEZ1lxDtcHQ1UfWzharEWPveQ5kee6HNVunfYLZDZXv4PnFSk20Lcuyrd
         UIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ety4QPFx37ZnyIuC+hMhpge8niEhq61S1oncysWLV1w=;
        b=hTeoqP1Z4FpdrZmazlzRQmjU0siW2ReiZBJJUVizpXW47wB2LJ2Va8BENQWFbid7+p
         pE+1+gWF0w2sNCnXhTUtNMHwzdjhJu4j+9BLrDzu/mMyJR1Zq4wzuc7ZBprQes3C/RHQ
         o/TqpQ6f4rMEID2mw9MGjOkZPucJHme6ZIAHAa948BNuCFI4FQYGuY1Zhvb7Giq9VWRh
         E7Rtsr8TqekL167v7aNfWnDQIEbVM68eKk8A866luWNSQldx0CXvVfOKEuKixLE0naOl
         RWg0KDYiIlJdCgFm0z9dK6P+OfYeh9eZ0V2NsUqj7m5RAFSDQegjF+ZalmawTCXyuMGh
         E21A==
X-Gm-Message-State: ANhLgQ1fQs60iY+h/yvSsiR67xd8licQtsAkwy++hFl9Z936AeLilMER
	ZDqcNzWZ8/feZ6JTNCQBHc9INbp9Ti0YPuAOrfc=
X-Google-Smtp-Source: ADFU+vtr+adpAHWYej1qlWW7liUEKb4WCz9IMAyVB89MJianpK6L9CN8xo3ER63LHkibJl+CrhGNHdcPaQgm7TRhYm4=
X-Received: by 2002:a92:8659:: with SMTP id g86mr8276465ild.267.1585220660014;
 Thu, 26 Mar 2020 04:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200319011206.14726-1-schnitzeltony@gmail.com>
 <CALbNGRQ-4wLXC-fttpLc6ixJYxWb0HHGgsDQr+x8RhvxLGOgpw@mail.gmail.com> <3ac793ad1e480d3af9c599bdce6e21a02a33162d.camel@linuxfoundation.org>
In-Reply-To: <3ac793ad1e480d3af9c599bdce6e21a02a33162d.camel@linuxfoundation.org>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Thu, 26 Mar 2020 12:04:08 +0100
Message-ID: <CALbNGRSt0HeMjGnxnvjM_DkopkZ_yxAuQaD2WJdsSj0=K=UgPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libnotify: upgrade 0.7.8 -> 0.7.9 / port to meson
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2020 at 11:02 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-03-26 at 09:13 +0100, Andreas M?ller wrote:
> > On Thu, Mar 19, 2020 at 2:12 AM Andreas M=C3=BCller <
> > schnitzeltony@gmail.com> wrote:
> > > From [1]:
> > > New in 0.7.9
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > * Fixed linking in darwin [Iain, Marco; !5]
> > > * Added man page for notify-send [Jan; !6]
> > > * Dropped autotools [Jan; !11]
> > >
> > > [1]
> > > http://ftp.gnome.org/pub/gnome/sources/libnotify/0.7/libnotify-0.7.9.=
news
> > >
> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > >
> > >
> > Ping?
>
> We're at feature freeze and stabilisation for 3.1. I've already taken a
> number of things I probably shouldn't at this stage but changing
> software over to meson poses far too much risk at this point in the
> release so this cannot go in, sorry.
>
> Cheers,
>
> Richard
Ahh - ok - sorry

Andreas
