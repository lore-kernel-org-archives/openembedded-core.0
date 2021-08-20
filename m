Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.80998.1629448317676479984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 01:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bzvEtHYT;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id r19so12817473eds.13
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DOqNE8jz3Yw/OLmKZ7Ib+VC/MFnZreoF9f/KIyjDaD4=;
        b=bzvEtHYT4gEveJXOJRsR9oLOrW1C9E/cUIB/c/xgJ1tHNmYJjX8WV+AtuXP0fJRdyN
         2tigujKL7MM71/JmVPGpNp1Bt7WdLIlryQtBG72LYbeW7r16vaHgEP5SpD056JCkBza4
         F6Y7Vxn9b1PokasrOlQpSwVQQtpQKmt0Rx25ZQ4mD5Gtne0DuyBXTzVwd+k026gWAPfH
         VofiTrE0MIPWMz9ipOOE7n6iokrqovRayW4hVTSOO6DgAKZGne1FoCSCZeKOS2EdKchv
         DVLrjpU8LygZtHowl4grBo8DM0/GAGUABKm6a1c1t0ggPYNGNPDt02btg8t3t++EApx2
         nAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DOqNE8jz3Yw/OLmKZ7Ib+VC/MFnZreoF9f/KIyjDaD4=;
        b=cbuTuSEORFaVbgm9hsC5j5Q3SDGVt8i8ETQ10GILa4dP9RyPaPofY3iav1F/rA0Iow
         SprLsioCYqFGZzV7tKPGZjQ+Ux1y0AGUd3EzM9np8HLi7v4VjQTE3EdYiBUnhZIzfTMa
         uNviLhvovfHq1BPL05EDqTe1N8kUgRdPUyGsQjwYOM31Wx6G0d1NO7Xjj/ZDa/8x2NEr
         AJshHNs+Su9DkLMFH4RvCmbLtTsYhBBAm3GyFwoZgqY57OkZUDJ1UFRX3pMJzeZuofwL
         w52/25FuyCYvoLELC+EazgxFXk5M1LL4EVhMbrh7tzbTERmzas8kq4ij+nBeB7P7uvAU
         C2AA==
X-Gm-Message-State: AOAM533tH6fheA44leMkQVm6UgPrKmF/WqtuWCOvuu+kLOh24MFlARvX
	ozFV/n9I/FppjrR2cboFjDV1YDolbhjmmXR5UEc=
X-Google-Smtp-Source: ABdhPJz35Hde5GZO88pX9fbraiMYmmOy7WLZKu7BIRaJI00Q7VFfUP0Q3ZBR2ZTqm/b+nRxDTnWee1JuHTYa8t4Ihq4=
X-Received: by 2002:a05:6402:70a:: with SMTP id w10mr21027002edx.213.1629448316076;
 Fri, 20 Aug 2021 01:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210818202954.143099-1-quaresma.jose@gmail.com> <4f17fad6060570b1ff87c54973ae46d3242565c6.camel@linuxfoundation.org>
In-Reply-To: <4f17fad6060570b1ff87c54973ae46d3242565c6.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 20 Aug 2021 09:31:44 +0100
Message-ID: <CANPvuRm8THwf2PNC+89OcQgon5vTTfMF8FsXUp9watnVtTnQ8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/4] sstate.bbclass: track found files on mirrors with a counter
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I Richard

It's not being easy to integrate this series.
In September I will take a look again.

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
quinta, 19/08/2021 =C3=A0(s) 10:14:
>
> On Wed, 2021-08-18 at 21:29 +0100, Jose Quaresma wrote:
> > We don't need extra python collections to count the found files
> > on the sstate cache and sstate mirrors.
> > The main found collections provides all the files that were found,
> > then we only need to count the files on sstate mirror
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/sstate.bbclass | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
>
> I'm afraid there is still some change in this series causing problems.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2464
>
> Many of the failures in that build seem to be triggered only when this
> patch series is applied. I thought it was the locking issue but there
> appears to be something else.
>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma
