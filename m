Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web09.8731.1632492413915341054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zpIL7p6p;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id j195so6005176ybj.8
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=jXDEKNIwZ6trifaIIoM1Y0Rq7llEJ/u9Q+Lu2t5PNQk=;
        b=zpIL7p6p07J9NdcvE1QqeMRZ3CNeQNczrE8IygG71dLB/kZFs/lFmKpkk8jpSweShm
         LQR8Uv+0vut8ZgwXOFLtIp5IUYrYb9bcZvBy54v621WmoViElBooO0bxF1RlOIE3iiv6
         1Gjt9rJoaWOdvP7DLrfgVLKUs/aS4rF8/+Pgtq6vxbMd1IuEgvegCo2yk8MJ4k51pMK2
         IUBpbNU9cIKR82XEelJ7YR/IFR3PuZWP1NFjSeu5UUjdaW3VEy8rdVFraHw1TBy9LVGd
         MirqEErbsGB83R3WTiGqjygP55NXJ9wO4TJl/0a5+e4lgyqESgskJDqXj1srskBiYcJB
         NRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=jXDEKNIwZ6trifaIIoM1Y0Rq7llEJ/u9Q+Lu2t5PNQk=;
        b=lMFCnb0bl+MWbi5pJbjboLA32G0yI+/q5FxMgZoFo/Zbts/X3EzKRY7Uva/r6ovMi4
         TQV2MUPsObE9JVpaCGu3NPqOACJmLsEDOvo6gLdLtoD1q9NyBDkV0NgXln7qIxbndRFK
         KMkdQVbt6fnouhzmDydirCUEe8KMKzxwzvk7ZRc/HVPzR+WGtp5QXn7yolsGXNdVcLPT
         cC4h/BbsB3ZKp6tCP5wBIr1L8uAZCkcKEo5ODBAj98ytenp4jvj+bxVBlEAXn7lfqwzc
         XujscGo5iANCFX3oc1kF7OsexMUhDissBChrVuRwdaTwoJUw2GS3iNOvNqq2WPel+fLV
         cOUQ==
X-Gm-Message-State: AOAM530HYuLfb2A+x1fkISTsyH/8a3r3DJYfhAr643SlPxG434p7YeQc
	JY5w7ZQKUKmCGVVJVYZLemq3xDB2Yg/IAn6SnDs=
X-Google-Smtp-Source: ABdhPJzbs5vfM13U7UTaoZKFrvm6wdvhlad/anUTo23ka+JBnW12BwxwUiL/2bIJ7Ft9QLdlxHQ/3Sulhye5/jbFc8w=
X-Received: by 2002:a25:5607:: with SMTP id k7mr13273594ybb.378.1632492413133;
 Fri, 24 Sep 2021 07:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR06MB5158D59D789C935EC1276930A0A29@AM6PR06MB5158.eurprd06.prod.outlook.com>
In-Reply-To: <AM6PR06MB5158D59D789C935EC1276930A0A29@AM6PR06MB5158.eurprd06.prod.outlook.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Fri, 24 Sep 2021 04:06:41 -1000
Message-ID: <CAGDS+n=_Yq3B_bFRGhpdEkRSSj9ntUZj=iwoffmZDo1RZdcNTA@mail.gmail.com>
Subject: Re: Backport request to dunfell: "Unlicense"
To: TOSCANELLI Massimo <massimo.toscanelli@leica-geosystems.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Massimo,

The proper way to request a backport is to send a patch to the mailing
list (openembedded-core@lists.openembedded.org) so that others in the
community have an opportunity to comment.

I suspect there won't be an issue, but let's follow the process!

Steve

On Wed, Sep 22, 2021 at 5:08 AM TOSCANELLI Massimo
<massimo.toscanelli@leica-geosystems.com> wrote:
>
> Dear Steve,
>
>
>
> I would need the =E2=80=9CUnlicense=E2=80=9D license in dunfell.
>
> Is it possible to backport this commit?
>
> https://github.com/openembedded/openembedded-core/commit/7698f3145a9c4877=
8d7bb79f54df169cf375349c
>
>
>
> Looking forward to your reply
>
>
>
> Massimo Toscanelli
