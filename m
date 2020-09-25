Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.4250.1601027451958095633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 02:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=WDvTmCeN;
 spf=pass (domain: burtonini.com, ip: 209.85.208.194, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f194.google.com with SMTP id s205so1931969lja.7
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 02:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gTaTDOU/Ycz1LOWAV/iAiiFGbq+EGxBniUdOEnphR/I=;
        b=WDvTmCeNL2mfOGcUPUzlpevKu9+AqBzTSgffEbBjj24iRnJB0l0NrNyqlWjMOTtxV2
         z9gpRZldosZ9adyrFSOcS7eMGpUwqMY6by2RmG7nSJO7V5EPnFQ7d5YumCjCDYdd+ybm
         ZP9l8XHtPHYt5/EKBaql8VsnlPj5j6EIzvsh5P6K9fZt2ktL8VXhBEsVnuRF9oYHnqod
         +fR6/PMpCBHvw6n3JMTsgx+fZbRx80rf/+wUB6T6ZC/w5xxpfP3WKZGh2VMJeD6w1/ig
         Zxty/QBHiG7pGP9edheUOtha8Jlc0vRO3EeMo4HJKe6LntTxJBenKvxQQjMLkNBLi5wC
         nuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gTaTDOU/Ycz1LOWAV/iAiiFGbq+EGxBniUdOEnphR/I=;
        b=ajoBRAvoMTim8ewun46OC89XHZwFNjrLcm7MKodFsBkqv2j5xQsztz2YkNyBsj2RG8
         hBgkN8a4d3nLoQy/h07wYIX+y5MuRG16EPjcBwrYpT4v+rHk1EGytWo2DdXXooTf8S1u
         zIv5CiZYz4Heh6lFgt19C2a/KHXWCaHNF+1tGbQYVM727xk2Qq43OEnQNslqw7Lo5GqP
         1ju/dY1q9lgb3Dg7kpXfHkSs+mHzshMIOTJbqOSOU/wPtJnappAEtJVfj2DjQgLCTMF3
         hGD5gLRgbCaLaSLn1J3Wk7nERP0GSzFjS4UtoAtYFNDbhhlhZnjAxxrZEo4Kbq/YzKhD
         K49Q==
X-Gm-Message-State: AOAM530A+aO6snqlXnKdkn4jaw4803FD9OPMfQWdcViajhHWNJzRZtMq
	zuZybpiDIgTepIfOgaQqqELJ8PsOBGIGYle8kka++Q==
X-Google-Smtp-Source: ABdhPJwPe09oSaKLYMdUnlo1+4xfFT5wjs49ykDxfta9KnZFvfyEf2ex9YuRyvPDTUeIOq8gypTaGJIwKitYTv3qRz8=
X-Received: by 2002:a2e:b386:: with SMTP id f6mr1128523lje.186.1601027449857;
 Fri, 25 Sep 2020 02:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200924195800.4164634-1-otavio@ossystems.com.br> <ca282af3-dcce-5d2a-3d4f-96068ec33ec7@embed.me.uk>
In-Reply-To: <ca282af3-dcce-5d2a-3d4f-96068ec33ec7@embed.me.uk>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 25 Sep 2020 10:50:39 +0100
Message-ID: <CAAnfSTutBRBc7aoSPe0+CTUSW=aVP1t_EEJmdFDiy+iZ8UOfmA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Allow enable/disable of rng-tools recommendation on sshd
To: Jack Mitchell <ml@embed.me.uk>
Cc: Otavio Salvador <otavio.salvador@gmail.com>, 
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Sep 2020 at 09:51, Jack Mitchell <ml@embed.me.uk> wrote:
> While rng-tools has also been causing havoc with my images as it seems
> ARM soc support for whatever underlying generator it uses is spotty,
> this seems to be an abuse of packageconfig. Would something like:
>
> BAD_RECOMMENDATIONS_pn-openssh = "rng-tools"
>
> Not perform the same function?

It would, but I don't see this being an abuse of PACKAGECONFIG at all.
It's a configuration option that is configuring the package.

Ross
