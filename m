Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.4629.1622108725106618063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 02:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RRFIXp5J;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id lg14so7017983ejb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 02:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TYaapIrGtEVpmfbNZdvCUInkywBZMmwDwJ0G2frHQl4=;
        b=RRFIXp5JtuCjK3WhYHk6rZFLRYJtHycChmUsS9rEKm6kV+O4BB5ORoogYeMqyfGAKI
         IjvCkM7nYH2Q9cIYj5k2UsdKCPubMrqACXpetQ7xIQvn8i39Yem7q5AcXQeOnVxHrX2M
         mHDetBWlux2NRvvSUFS0JADuJVHAKg3ObBvSe/5SuO81A9SXkKJNn+iK4lYO5bGICBrZ
         gCu93H6ZvBIbW9wQEetblILhyIixG/vTqwMmC6PnQDT38ZxMw3J51Tc+kdFDPMrivtcY
         K6//RMcM7YjmSSgOM4wFwN9GkG6tU7i/z8fcbK0aXBxRUSZ/42c9VD0JY48RRAKdTV0n
         A2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TYaapIrGtEVpmfbNZdvCUInkywBZMmwDwJ0G2frHQl4=;
        b=QrLWTTo5ukmp6dsb0xCTKNp9mYesVDOl3mSgPKpE+I6pm9GzeD5QnUSkMmfT0jvl04
         D1Vq/6K3HLfdmvAf+yghBapl1QY9HeiJbCXLb1v0pTVOYa+vu/rnV7tL0EojaS1jaZ0i
         hRWz/JI0N44LmFaORkLKxLZbaX4RBPcEjcJ4imuEmeihbB35xBiQlI3gT/nFxft/ck8w
         FSshHaM3uLDKt1GUcqhleNMA17LUh3c5eg+0vu7xUl8n5FPlXKA9uzxE7ad5BLh6KIxO
         7Vu5eA5a7FDYStBSDi6lCa/VpRBb+wawqUJv9geJM6BzvV27gca0IyG2DLw9Sp/JPb/1
         V/5A==
X-Gm-Message-State: AOAM530iKuO1/skZ2aSUO73hBUl2iI33CTX/sbMVqAZbxBtq8ekk+9zL
	PkG97RF0N6qKHbGTT1KZVX44nIm672+bOcjdwcs=
X-Google-Smtp-Source: ABdhPJyR4LGMsnZTH5dExyhp/6x+WgRPMv7ZXo/fjH5/39HwtoHpT65Qh/4fpptrKOnm62a4Z7hfWTrk2nED/NAFX0I=
X-Received: by 2002:a17:907:377:: with SMTP id rs23mr2811515ejb.12.1622108723387;
 Thu, 27 May 2021 02:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210526002744.3683697-1-douglas.royds@taitradio.com>
 <20210526002744.3683697-2-douglas.royds@taitradio.com> <CANPvuRkM5FqLWRFAeWpi9ckhwcL-tcmur7OjW5bQwhcAPxCUug@mail.gmail.com>
 <CAFimOt4dFtpWBu0c0a9-qCU6g+wQ2_2LgmBJvFyNf_0SZs0_vQ@mail.gmail.com>
In-Reply-To: <CAFimOt4dFtpWBu0c0a9-qCU6g+wQ2_2LgmBJvFyNf_0SZs0_vQ@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 27 May 2021 10:45:12 +0100
Message-ID: <CANPvuRm+zxXNn4J4zT9OkUkJS+r1gi2GnhKZF1y-Wp9dPr=UeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] Revert "icecc: Don't use icecc when INHIBIT_DEFAULT_DEPS is set"
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Douglas Royds <douglas.royds@taitradio.com> escreveu no dia quinta,
27/05/2021 =C3=A0(s) 00:26:
>
> Yes, we could, but it's quite a long list, and I'm reluctant to start
> naming specific packages.
>
> I only did the INHIBIT_DEFAULT_DEPS test (that I'm reverting here) in
> the first place to silence the warnings. I think demoting these
> warnings to notes is a better solution.

I agree.
Probably it is more problematic to maintain, especially if the list of
packages is long.

>
> On Wed, 26 May 2021 at 20:52, Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
> >
> > Hi,
> >
> > Instead of reverting we can add an exception for the packages you ment=
ioned:
> > gcc-cross and friends, binutils-cross, and importantly, the linux kern=
el.
> >
> > Douglas via lists.openembedded.org
> > <douglas.royds=3Dtaitradio.com@lists.openembedded.org> escreveu no dia
> > quarta, 26/05/2021 =C3=A0(s) 01:28:
> > >
> > > Although this silenced the warnings, it also turned off icecc for
> > > gcc-cross and friends, binutils-cross, and importantly, the linux
> > > kernel.
> > >
> > > This reverts commit 0315aabeff8e6483b737d0e23d6841f1394ad3c8.
> > >
> > > [YOCTO #13863]
> > >
> > > Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> > > ---
> > >  meta/classes/icecc.bbclass | 4 ----
> > >  1 file changed, 4 deletions(-)
> > >
> > > diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> > > index d095305ed8..0dde960e7a 100644
> > > --- a/meta/classes/icecc.bbclass
> > > +++ b/meta/classes/icecc.bbclass
> > > @@ -138,10 +138,6 @@ def use_icecc(bb,d):
> > >      if icecc_is_cross_canadian(bb, d):
> > >          return "no"
> > >
> > > -    if d.getVar('INHIBIT_DEFAULT_DEPS', False):
> > > -        # We don't have a compiler, so no icecc
> > > -        return "no"
> > > -
> > >      pn =3D d.getVar('PN')
> > >      bpn =3D d.getVar('BPN')
> > >
> > > --
> > > 2.25.1
> > >
> > >
> > >=20
> > >
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
> --
> This Communication is Confidential. We only send and receive email on th=
e
> basis of the terms set out at www.taitradio.com/email_disclaimer
> <http://www.taitradio.com/email_disclaimer>



--=20
Best regards,

Jos=C3=A9 Quaresma
