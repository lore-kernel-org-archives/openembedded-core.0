Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.6336.1589641209332726964
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2020 08:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JGHrD3Y8;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id a4so2590583qvj.3
        for <openembedded-core@lists.openembedded.org>; Sat, 16 May 2020 08:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CJvM/ybXj4exMqrEvgFOMBmUYTR0WvI1N8Q4j4pa3w4=;
        b=JGHrD3Y82gquFneQmmFhB0bo6AZY9H1Togg7CIyV+imfCZG1OalRmKG2P3ZIR+cc/s
         OQYMXuwz3nL4bvveaVwjKlXS/Ovis77L6c302fF7Notoy7ozZ9hF7TfC987OWfU4Qfe/
         Q7lv/tYnSQ/ZZXIVJ+A/LSUFhV9/fZF7cx3D86hOJZjBGjsAMjKril4kTe0zcWo6TRsU
         XEtHcKPgZKybAo703uIZLEMQKGu++HkqzTSonq8ebz3Scb98+Uje/hGLJOKV44VnrKRp
         VgGycdkX49s/6OL42lp5ATX/OwnuF6yx/BmLx5xX7DfTDrtPIiy6Gkp6GxXikNJJ0RV7
         Uxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CJvM/ybXj4exMqrEvgFOMBmUYTR0WvI1N8Q4j4pa3w4=;
        b=rKwOmvhkHFTERD3CsuzSL+YA/+y2O/ciP8t+RVDdmjOt2Ojki5uP7Qlq1I//nbSfYI
         enZgXP4bGj6XkePmQNmSem2AX34ryzgSypCKHz+p/uEtq2nraDi0XXV7j6eaEpzCtybB
         IJNcv7K0TpO/L22NNW9qDDTeZ/ggaaYhKSVcLHPJRBO502WGq5RUK3nUFEqj/lE+k/rZ
         pC7OPNHSxIbaBG5jrOYGhPHgLfmTSTDUYplpe5fBffl62M9NFQw4K6JFIy0yUA6cxeS7
         WZmKclH7eH+pRrodcQnPh/viiWYATrpR6JWHC+VWbgHIvLIduXIyiOW2RPSee4SlU9bi
         4/zA==
X-Gm-Message-State: AOAM5305gUtGbXABUbvukC5UuTticd7opUcwUa3XaZExb8jxCzdVxZr4
	KPXP0+58yF7w8+9Ar+DScTuYETAe6gmSF+NADz8=
X-Google-Smtp-Source: ABdhPJyf3szmneKQmfMHPXrRVyaHyc9b6oHHXtYlLNeN6B8wud7VtetC/ISC6caxxT2NBwpxwsIDKdBffiHuZTZmTcQ=
X-Received: by 2002:a0c:8324:: with SMTP id j33mr8377476qva.23.1589641208337;
 Sat, 16 May 2020 08:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <VE1PR04MB6621CBC0F321F39DAFEBE548E2A40@VE1PR04MB6621.eurprd04.prod.outlook.com>
 <CAHtQpK43_Ytsw6JnOoPx6xTd9zhQZY6A1OzDhNFXFW57Ttmohg@mail.gmail.com> <CAP9ODKpsh=K=-LzUS9O2zsDH3MQt=z6RWjGCJyEZC-AZ8ZNe7g@mail.gmail.com>
In-Reply-To: <CAP9ODKpsh=K=-LzUS9O2zsDH3MQt=z6RWjGCJyEZC-AZ8ZNe7g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 16 May 2020 07:59:42 -0700
Message-ID: <CAMKF1src7dw_OOKM2SkV4+-XqO9aqQ-wzxvtQm2ec-Vaav-GKA@mail.gmail.com>
Subject: Re: [OE-core] Cannot disable weston
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, Tom Hochstein <tom.hochstein@nxp.com>, 
	"Patches and discussions about the oe-core layer (openembedded-core@lists.openembedded.org)" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 6, 2020 at 1:58 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Hello all,
>
> Adding Khem on Cc.
>
> On Wed, May 6, 2020 at 5:42 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > On Wed, May 6, 2020 at 10:29 PM Tom Hochstein <tom.hochstein@nxp.com> wrote:
> > >
> > > We are no longer able to disable weston service with standard `systemctl disable weston@root.service`.
> >
> > I've faced similar issues a while back, and also found out that weston
> > has been actually started twice: once from udev, and once from
> > systemd. At that time, I removed the udev locally on the EVK and
> > didn't look further into it.
> >
> > > On boot the service is started again. It seems likely this started with the introduction of a starting udev rule:
> > >
> > > https://github.com/openembedded/openembedded-core/commit/aa3bced2e1de2f4ba507aa014835b06edccc138a#diff-d92aa97566c1bd0dd1eb817bb4511cda
> > >
> > > Is this behaving correctly? Can the rule be made to honor the service disablement?
> >
> > Or the other way around: can the systemd service be disabled? Or in
> > general: is it possible to leave only one of those mechanisms, and
> > which one is the correct one?
>
> Why the udev support was added and why this cannot be done in the service?
>

udev service integrates well when you have weston but for some reason
no drm on machine so it only launches
when system detects graphics/drm

if you need to manually control it then disable the udev rule and it
will show up disabled always and then can be managed
manually.

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
