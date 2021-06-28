Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.114.1624909402886622140
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 12:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=msf+n1xH;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id j184so28707712qkd.6
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 12:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5By6umHQHr6aTe/SWuUX8KsbBKW5pvLvH5YIIlR60BQ=;
        b=msf+n1xHrGPl4Ot63yFwuyF1jhxm1S2CIv3jPM5m5c1jd/4BH+6sifeZsbh+91gxMR
         CDsY964mlKzXDMryw5u6jJOHTi47QUdVDs0X6xW8a5t8LGReWgPA0gC9FklPVodNBrQq
         dxRdsk1FoCuHbu3dX2SDcY3y9oc0T5mU16q06i1rRGsuUXBWKrpRm/8SNGCQNa7Dy9QY
         RPTX/KCHtk/YYqeN3WWDv+Ar0ni5Bure5IpfqjQ6pPsGtNV+MgdQ5GZW4nuCHGRbVVlJ
         hdlewgYKvTJr1M6/ub1jORGSpB2Aq321yVT1jXnHzeVQaySqSdNtmBvmuzxy99ZQabFa
         bS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5By6umHQHr6aTe/SWuUX8KsbBKW5pvLvH5YIIlR60BQ=;
        b=A5wDfeDpbV/4cVXEujCTRhLq4fRKkilus9+3LsDKKDqYgBBeiprqaOObfHCntyhYJO
         +SeNY75ZBzNOQGUdYA7/cGW+PtQX1e/UAREMpKwJk6NUMNaqYOJqbRwwPIwueoMSnUSk
         RtoJKmqv9wiJYnPNNu6LXkdYrbHgDdX63J1ivWHl+45mBTng7Jt4o4/BD7sTCpYwqaqt
         nkrdsPKwcYnmamkSwJdR1MN+89fWWhcgeP1p0YDXkUpsIArmGHFr77Z/8Kef//HIMqJo
         8/kKakwKRX+yRjciB5h5k/clnHl2Ax5KzDAYhT+aeA1lQP/1Kw6XjaWJ/eUKN53FXKc2
         Y+JA==
X-Gm-Message-State: AOAM531AZjq/PeOQt6CTPQES0GXBA71L+EE0Ui46fjRmu9Bl4VohyRe8
	4s838StoV2zOhCY45litjk/LNaNjNQs0ChMBaYDFqU2iscI=
X-Google-Smtp-Source: ABdhPJzMkPGv7rJD40B9SFGbrLMGozu+SMU8lSv1bFL1o+i+wP3yulZsoV6UztqNPQ9sAkDX2kjRAAOMjYNbA5C5QXE=
X-Received: by 2002:a37:59c7:: with SMTP id n190mr26713808qkb.146.1624909401975;
 Mon, 28 Jun 2021 12:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
 <c11c5d80-1913-00eb-343d-a8b344352298@gmail.com> <CAAQYJAsGX9ExxsmoGUY8wO_Bp_JscSoRJ-pBiNJ4oBf5eBf5CQ@mail.gmail.com>
 <6e2bcb94-8b02-50c1-bf5b-8fc3ce464d91@gmail.com> <20210628191055.GF5525@pbcl.net>
In-Reply-To: <20210628191055.GF5525@pbcl.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 28 Jun 2021 12:42:55 -0700
Message-ID: <CAMKF1sr1mXehpm31m_ByS8ytGmQ--Zf42qst+SqPQK1w53f_Sw@mail.gmail.com>
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
To: Phil Blundell <pb@pbcl.net>
Cc: Andrea Adami <andrea.adami@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 12:10 PM Phil Blundell <pb@pbcl.net> wrote:
>
> On Mon, Jun 28, 2021 at 11:46:08AM -0700, Khem Raj wrote:
> > I still hope that if we can add a proper neon detection patch to meson
> > they would be ok to accept it.
>
> Why doesn't the runtime detection work in the way that upstream clearly
> think it ought to?

probably it does, someone has to test it on device without vfp.
Currently it is still failing to compile.
so first that needs to be fixed.
>
> p.
>
