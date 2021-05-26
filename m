Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web12.61.1622071586538510023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 16:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitradio.com header.s=google header.b=YOvJmm4Z;
 spf=pass (domain: taitradio.com, ip: 209.85.166.173, mailfrom: douglas.royds@taitradio.com)
Received: by mail-il1-f173.google.com with SMTP id o10so2438654ilm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 16:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitradio.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kkJkK1pY+WIt4LQZXj0CQMigFm+rrcERnVka7nFY3iM=;
        b=YOvJmm4ZJ6b6mjzJe8az9X8eec96oOkLUYG6mw0328ObHNPQKPEXeX3uksXG8Kr3Y4
         gm69sQJqEfl5OTadDwn6kiwBHpw2yra1GLuQUZNZWuMf/GGix1vqT+BBfnMv/kj3x8ZR
         k3gxGwlPcJYK0/YHXCB1IxslRx+8Z2w723cOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kkJkK1pY+WIt4LQZXj0CQMigFm+rrcERnVka7nFY3iM=;
        b=eEEEUV8ZC1QkxHlm9He+MrGOuj5BZ8Q0laVTtAcQpf6+Q26U7p3SotY5oZpiru07XN
         LojZPvHkx5QP926SfrdRt8R3SiOdzro5J/C4Z+iB/xCIIf3SnauRzE+dMhUjsoc1VFp+
         1MU6Jd/R2Xsc1xjrYsmpmgYtIfwhDpOxg/nZd7ywhX7fwyHBz+1XCSTzhB5nOPrVjVEN
         /1v+Yp0lU5xgDEyKxcuZKAtsHX51o+3mZ3W+hDqZEWpHfji4iFgeNCxO6LAu7vflyrgI
         MT7oJ75pYAA8I2fpBGxO9TIbsZtNyvkVF6h8g1Jzxwhu2OphR1GkPRqKqc+UJnyuGvYu
         bhJQ==
X-Gm-Message-State: AOAM532hmQQJHMSZCoWZrV0iTSE9q/EqXOSPrwE+rXj58/prpfqPPpoZ
	NnzqxxeQNa/JEsnQfraCL+EoK6CD9U3/3u08Wh+VOiiYQKphSHRaFsKww/Ac/WgM5CgpcRXfub4
	h0rE27keaxFw1Wmhg/bzgGG/Nq6+88WZpQuhiDaDLoPqFT0kf
X-Google-Smtp-Source: ABdhPJxix/DbyXtLB8CSBXLom/qm8VaFSQWVvASMHSnTKuiyV0OsRuqFZw9TAmF4k9SZeuGZyuz8Aun9LUYEaoVPNnQ=
X-Received: by 2002:a05:6e02:1b0f:: with SMTP id i15mr603946ilv.164.1622071585891;
 Wed, 26 May 2021 16:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210526002744.3683697-1-douglas.royds@taitradio.com>
 <20210526002744.3683697-2-douglas.royds@taitradio.com> <CANPvuRkM5FqLWRFAeWpi9ckhwcL-tcmur7OjW5bQwhcAPxCUug@mail.gmail.com>
In-Reply-To: <CANPvuRkM5FqLWRFAeWpi9ckhwcL-tcmur7OjW5bQwhcAPxCUug@mail.gmail.com>
From: "Douglas" <douglas.royds@taitradio.com>
Date: Thu, 27 May 2021 11:26:14 +1200
Message-ID: <CAFimOt4dFtpWBu0c0a9-qCU6g+wQ2_2LgmBJvFyNf_0SZs0_vQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] Revert "icecc: Don't use icecc when INHIBIT_DEFAULT_DEPS is set"
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, we could, but it's quite a long list, and I'm reluctant to start
naming specific packages.

I only did the INHIBIT_DEFAULT_DEPS test (that I'm reverting here) in
the first place to silence the warnings. I think demoting these
warnings to notes is a better solution.

On Wed, 26 May 2021 at 20:52, Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:
>
> Hi,
>
> Instead of reverting we can add an exception for the packages you mentio=
ned:
> gcc-cross and friends, binutils-cross, and importantly, the linux kernel=
.
>
> Douglas via lists.openembedded.org
> <douglas.royds=3Dtaitradio.com@lists.openembedded.org> escreveu no dia
> quarta, 26/05/2021 =C3=A0(s) 01:28:
> >
> > Although this silenced the warnings, it also turned off icecc for
> > gcc-cross and friends, binutils-cross, and importantly, the linux
> > kernel.
> >
> > This reverts commit 0315aabeff8e6483b737d0e23d6841f1394ad3c8.
> >
> > [YOCTO #13863]
> >
> > Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> > ---
> >  meta/classes/icecc.bbclass | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> > index d095305ed8..0dde960e7a 100644
> > --- a/meta/classes/icecc.bbclass
> > +++ b/meta/classes/icecc.bbclass
> > @@ -138,10 +138,6 @@ def use_icecc(bb,d):
> >      if icecc_is_cross_canadian(bb, d):
> >          return "no"
> >
> > -    if d.getVar('INHIBIT_DEFAULT_DEPS', False):
> > -        # We don't have a compiler, so no icecc
> > -        return "no"
> > -
> >      pn =3D d.getVar('PN')
> >      bpn =3D d.getVar('BPN')
> >
> > --
> > 2.25.1
> >
> >
> >=20
> >
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma

--=20
This Communication is Confidential. We only send and receive email on the
basis of the terms set out at www.taitradio.com/email_disclaimer=20
<http://www.taitradio.com/email_disclaimer>
