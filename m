Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.5762.1601502078703400420
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 14:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=xD+6i9Wz;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.194, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f194.google.com with SMTP id q5so3146980qkc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 14:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3eRgzbSNKJx4eZW6ZMNxGcG9eZGFkstLuj7iQuT/9SA=;
        b=xD+6i9Wza1E4UXXbQQac6vsYr2FWR4SE6FdvoRZZdPxbz3SqZEIGIn/OCLEITFD5aE
         3x9fMavBEUHwR+h3sMyZTfOYLPJzIGqqz6KOC3XQAZ8BO/Q+Uos9FOfASZS6rNSnilnQ
         eXbYYCdhNbMAWAtBpJbBcwiMh8mioF75aCEkxbG70K6DvDXRjuhI1iCmUvot75bUniwO
         q/nIROVAiyz7vqfhXsVQ7J0dRCcFwnbCMCK/TuCr8HHYTvI590wDH+zdHq0h5dz1Lod9
         ak6nM7Zsaleppp2y6JijzU63/ILNEhD/airFkBsBbODyG43m1DIbe6beatVPB+DtPd3c
         pmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3eRgzbSNKJx4eZW6ZMNxGcG9eZGFkstLuj7iQuT/9SA=;
        b=GCet9Oy65sNVUs0oJ4Soehzysko2PKbSNsPD9efXbcOr5ZZjw7DqlPFLRAUuwvUfhZ
         0Cjf/7tUqA7EB9HNpYCvgC+nHa5+dlnI+lF4PdBmAiJLJTtlgOcSsp8/ri+br+oSgi8P
         fuSybI1OhdfLwRqclK+7NpXQ8UL8RkM2+ib+689dBIdH3CT3P7hDYDpcxGxu0L7F60Or
         +cXAkU2h8Zz5oNR4OhaaSoUFpHzGQ8rVuw46M+0fhYAlSrTTawmuIvYKfZMiZHvPifBF
         XRcRj7QLXhMXKjC5l559sQN8m1Y2gWD6nHTcBsC4zNcHzuHGsWlSsdnBIGVGKkh+DiD5
         NCiQ==
X-Gm-Message-State: AOAM531+cbQGnZvHk1zV16uS2JEuf1vtIz9ZLQiFWWsflbReO3eXddID
	4b67RcddLn4Dfa3M0eMH5kb07G2k3BklmGm2
X-Google-Smtp-Source: ABdhPJwuZ8Eq1vT5BulwV6WtNnFT1ZtyHnnLf2GmPiWWS8wtGJILTPO8GqRCv5fYgIw5KpAwwi6Ipw==
X-Received: by 2002:a37:7c2:: with SMTP id 185mr4389085qkh.304.1601502077414;
        Wed, 30 Sep 2020 14:41:17 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id x9sm3673899qts.65.2020.09.30.14.41.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 14:41:16 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f182.google.com with SMTP id z2so2573102qtv.12
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 14:41:16 -0700 (PDT)
X-Received: by 2002:aed:3e44:: with SMTP id m4mr4508741qtf.33.1601502076033;
 Wed, 30 Sep 2020 14:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211644.119920-1-otavio@ossystems.com.br> <CAMKF1srtqeTcBsXoR=DLa73_b7Zswf+TbuAw2zZPiRpraoZi-Q@mail.gmail.com>
In-Reply-To: <CAMKF1srtqeTcBsXoR=DLa73_b7Zswf+TbuAw2zZPiRpraoZi-Q@mail.gmail.com>
Date: Wed, 30 Sep 2020 18:41:03 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqcGWVwmX_5Gf=GKTAuAPSAMsVx9v_2er8-gb0VQJkNRA@mail.gmail.com>
Message-ID: <CAP9ODKqcGWVwmX_5Gf=GKTAuAPSAMsVx9v_2er8-gb0VQJkNRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] weston-init: Add environment file support for systemd unit file
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Fabio Berton <fabio.berton@ossystems.com.br>, Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 30 de set. de 2020 =C3=A0s 18:31, Khem Raj <raj.khem@gmail.com> es=
creveu:
> On Wed, Sep 30, 2020 at 2:17 PM Otavio Salvador
> <otavio.salvador@gmail.com> wrote:
> > diff --git a/meta/recipes-graphics/wayland/weston-init/weston@.service =
b/meta/recipes-graphics/wayland/weston-init/weston@.service
> > index 0a1df15bdf..ce8f4fb71a 100644
> > --- a/meta/recipes-graphics/wayland/weston-init/weston@.service
> > +++ b/meta/recipes-graphics/wayland/weston-init/weston@.service
> > @@ -29,6 +29,7 @@ ConditionPathExists=3D/dev/tty0
> >  [Service]
> >  # Requires systemd-notify.so Weston plugin.
> >  Type=3Dnotify
> > +EnvironmentFile=3D/etc/default/weston
>
> Lets make it not fail when not there
>
> EnvironmentFile=3D-/etc/default/weston

We made it required as it is always installed. So I think it should be
required. How it could not be available?


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
