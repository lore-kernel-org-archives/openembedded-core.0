Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.6367.1601035806057429040
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 05:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=QTfe9NBQ;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.195, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f195.google.com with SMTP id b2so1589330qtp.8
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 05:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NVz5wv1JUD+C/8CK4nT8Svyt68IcwUQ0JUNHUfoolJI=;
        b=QTfe9NBQU5Xvt3r80T8XjHXtWbcrGALIE4wFCDoRs+rtlz6jZYDfc9Dckb4pVZRz4a
         uLuulaPtIJRma2IU2klqRx9w8cyxZK0Y9U8RxBVHvl+qBgOumthKZS/nbJW6xeK6eSlN
         s/+2ItnBvWlvvx382Qtrvdf87MyTunKgW9yKbrq5BqvuSF2gGQ9OHct6K3wROJkS1MG+
         T/OYCmELTKCapWH7R7g/D+8EVRiP1KCP1s8wYXT+IddVujYVwbcFGAHNWp/hs4PlV6aK
         0ohgtBMf76sUf9kr/a9cZcn2dsa320htwUOugI0xko2SrsreePhEo/xlZkn+5sd/CRc9
         bvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NVz5wv1JUD+C/8CK4nT8Svyt68IcwUQ0JUNHUfoolJI=;
        b=hFEifa+RTn7HrRfPJaWoNrZLsHr01tTrF3LrrJGcnwCkN6Un8B90RQQYSEXWpVCkrl
         HoQiCTA46u+2MfQTSyt6cvkcaWgoxMmrqV1uJw6jhW7eKK2+OTH5FhdG2RvBS0z7+xJ0
         36sX4CLFzsybLFhAEiTfKJlHMsavpLTSptEHzXiAxzbRHjhgZnDnTLtTnWAU+Ed32O62
         DMUWbwfZSrq146gSgKkl98GB7h0j8Lo3RHawBa17QKd6N/o+TTSaF0eVxx2UWEjKFr1v
         oWLDoU5grGiZejPHilcZL9tBPHJwQZ/0NBYO5bKth4rtkDRdg5zudajimXY6WUA4+wDo
         NejQ==
X-Gm-Message-State: AOAM530uJp04dklO3/yWnOXHdFKGh7P71FsQ3fpkphAluY+uafarjjlp
	FiAjorvzyfqpU0cbc4plGpLc6pYqT3NJ6lyB
X-Google-Smtp-Source: ABdhPJxNTKnAFixw20/y0X4BSL1oYSq8kD7+e4oeB9zn5SDU/KMZXzlfvCkQaShd17zSzIVbI+u47w==
X-Received: by 2002:ac8:35ee:: with SMTP id l43mr3989740qtb.169.1601035804560;
        Fri, 25 Sep 2020 05:10:04 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id j6sm1703503qtn.97.2020.09.25.05.10.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 05:10:03 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f171.google.com with SMTP id e7so1576841qtj.11
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 05:10:03 -0700 (PDT)
X-Received: by 2002:aed:3442:: with SMTP id w60mr4103829qtd.100.1601035803055;
 Fri, 25 Sep 2020 05:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200924195800.4164634-1-otavio@ossystems.com.br> <CAAnfSTvrT7_40JPPpeNM7eJouLK7e0VELGRMHgd-VjKSfa+y5Q@mail.gmail.com>
In-Reply-To: <CAAnfSTvrT7_40JPPpeNM7eJouLK7e0VELGRMHgd-VjKSfa+y5Q@mail.gmail.com>
Date: Fri, 25 Sep 2020 09:09:50 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrN1AyavUxUqEW0HaGGMVZ1SygLVy88zrFFEKUScELoGg@mail.gmail.com>
Message-ID: <CAP9ODKrN1AyavUxUqEW0HaGGMVZ1SygLVy88zrFFEKUScELoGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Allow enable/disable of rng-tools recommendation on sshd
To: Ross Burton <ross@burtonini.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 25 de set. de 2020 =C3=A0s 06:58, Ross Burton <ross@burtonini.com>=
 escreveu:
> On Thu, 24 Sep 2020 at 20:58, Otavio Salvador <otavio.salvador@gmail.com>=
 wrote:
> > We are adding a new PACKAGECONFIG option ('rng-tools') to control if we
> > wish the openssh-sshd to RRECOMMENDS the 'rng-tools' package. We are
> > enabling it by default so there is no behavior change.
>
> Is this fundamentally because many targets now have hardware RNGs that
> the kernel is using, and so rng-tools serves no purpose?
>
> This was originally added with data from iMX6 (oe-core
> 9b01375236e19e3366c58877c4154d7c71632984) and I'm curious if this
> followup is related to other improvements that have been made to iMX6
> since. Is there a better user space tool, or is the kernel using the
> hardware RNG out of the box?

Exactly, we can use it from the kernel and most of time it is of no-use.

> I ask because I'm strongly tempted to argue that we should be assuming
> that a RNG is available and let BSPs turn this on if required.

I added this enabled by default so we can backport it to Dunfell (as
it won't change the current behavior). For master, we can turn it off
and let distro to enable it if need.

I'd like to get this one merged first (and send the backport request)
and then I can send a patch to disable it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
