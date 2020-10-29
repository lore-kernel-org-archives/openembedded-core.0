Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web09.8661.1603978099246183488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 06:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A16njvLZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id za3so3818145ejb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sk+z/l9cORTD7Kn8bpS9+VA9pVksMP/70321HzYDRDk=;
        b=A16njvLZ1UKByU0V1kQ8NYWd+9dDe9hluHYvEJugJBlnyWT6q9/wn3sRsoJ3eGWocH
         Q5/+5DbI/88zrQ7hIq/ZTdLxZoS6K4kKoaH09MEgJg9AS1OAG1MAj+8H5EqzKikgj7c8
         G5w+PkoGWbDWDvrECexNEJs2M87F0MG0g3b57jKfO1THRVNArwjAJjIGKaXWMxvlUIPi
         EJfyomp5pPWnGpHK9RNju4oDDJHoBlX0uUNO4OaKH9AeJLWBjtjz5ukfTv2QDEGkmigt
         z+6SUROSV0hBna33ioa4YSTt0pWLOWDbF7e7xK0oPjOSS3I4kwkfI+NALWi4+2e1F6Mz
         3SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sk+z/l9cORTD7Kn8bpS9+VA9pVksMP/70321HzYDRDk=;
        b=fQp9ULMA4qWQEZ4Mm4+b39bKEJ1J/SZPVsJYDqi5o+rnA9uBEHEmHSPZ09kWYVKwMK
         ESjs2u/spaCS3riKJE69s4GtA3qt9/pBbdAXciulqK5elmqmexswb//w9uZ1Lz6S0aJo
         Kp+sPXHHUiG1Xpk/wlC+erMflpAmke/5xsUa0aTw+jkJx1V6bY5AkmvTi8yUgSQsFbOg
         akD3sCkCft/mzq+TauGtRSTg+AGCj2bZ0LYB/NkY/kuiLyY9LJQijGBNIGnudLekXsFO
         zAPThmmXndkx6fWYXB2cm2AD0zw4uGfcj2Vk/3PjVA12WOCr9O4C34pJm5pq+1xqzVmz
         QZpg==
X-Gm-Message-State: AOAM531mgP9Yc2HrU5l+nJkPPVoLNHZ6pMNr9N1RcGwp7KN+zTWL3M1g
	1wotrgSbyKtBkqVItxiN9DH9nwxs1oyN4ZL0p7o=
X-Google-Smtp-Source: ABdhPJx4+cNJ+lx+QNbDGJBDbTfMCKSDw44CPxvX9cs0ri3EHqh9bqz/HVzM8xR5P37fhJPf+yvbMf+unDPFOgSbbT0=
X-Received: by 2002:a17:907:1102:: with SMTP id qu2mr4074635ejb.300.1603978097746;
 Thu, 29 Oct 2020 06:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
 <6c5cc7223aec5587143b1d7e165346494a4ab77d.camel@linuxfoundation.org>
 <CANPvuRkMioP_k1f6=xj3Gn==wQq-JUtzqcux=sCV98CibvKFrA@mail.gmail.com>
 <CANNYZj9x+mWxJ6NnUarwF3Q1YjoqmDYq83ZwFc8aQY2fyQjtuQ@mail.gmail.com>
 <2002eb09317f295e090792f561e8ff33a67b8e96.camel@linuxfoundation.org>
 <CANPvuRk13xJMo=AoTc29=BwCTqcgB56bNsQ4DuSNC2SnhuGwAg@mail.gmail.com>
 <CANNYZj8Yzap6Np9_RndKXDEEJU1pYUFdbQcAQk5j+u-q_wxM1w@mail.gmail.com>
 <CANPvuRnJPi06YBz1uL8tc39DGszd0Q3UGX9rAMaQg2xDtHjD6g@mail.gmail.com> <b15be544910d17ec6b22af8a5ea50dc1958c97d0.camel@linuxfoundation.org>
In-Reply-To: <b15be544910d17ec6b22af8a5ea50dc1958c97d0.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 29 Oct 2020 13:28:16 +0000
Message-ID: <CANPvuR=5u9GXGu8L5KsFuA9fBxhhtSJTmv+2a=MXriME6cLusQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 00/21] Updates the gstreamer to version 1.18.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
quinta, 29/10/2020 =C3=A0(s) 13:17:
>
> On Thu, 2020-10-29 at 13:10 +0000, Jose Quaresma wrote:
> > It is dropped because the all the code is now LGPL-2.1+
> > I have reference this on the commit
> > The LICENSE_FLAGS =3D "commercial" is there on 1.16 because the copy of
> > the ffmpeg on the archive
>
> I think if libav needs ffmpeg, it will need that line (with a comment
> explaining its due to the dependency). I'm assuming libav without
> ffmpeg doesn't make sense/work?

Yes it true
I will add a V2 with this fixed

>
> Cheers,
>
> Richard
>


--=20
best regards,
Jos=C3=A9 Quaresma
