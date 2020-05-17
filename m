Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.32238.1589757697961474906
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 16:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ffmtjRj9;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id x12so6694946qts.9
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 16:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1hrwTOo/EfaTz31psYLgzFk3NHjI/ZQH2F0/h05NKXk=;
        b=ffmtjRj9PixEG+saCq0HKHMMwXUW7BQTaqkZokJQuVb6S9oWXU9OBS4ZuuGn9vZydu
         XxFAAW8OJG0i97rBgiUqQB3Q8JXRInd4KiQkSHc66xnEbiyj93s7dkmw6ZuQZQn7KmXV
         jhhUtDTsLEA9X38jtciZKtOeU4Il11ANRQDks4pjLwvGUyAajGrPhNcN4hq1vYjQGy+/
         sU54QAR5iU9gp2UGcfGxhQristOUCQjL3y02sqS0itbf2krLxsfVibtqs+wS7qplgita
         WGK08Oi3KkQWUndzwK0cTWF7a5bdvZeEoi2raS4PgXYdIY+DBwL43NXuf5H1KNAOH2sM
         pFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1hrwTOo/EfaTz31psYLgzFk3NHjI/ZQH2F0/h05NKXk=;
        b=a+IUdjMMvA8lImu/UvsGZfgvEtx5TwckiQ1v6MLj76BYG+rR2oVQ+JDpgekRjjg6zu
         kOreUmeebWWE9t5uqcoutL/O1rW3SXcgzvOXPG0GHrPRw+D71kAObLb7NI6MV/xOHUId
         UQZ3og+pxmD2f73K7q0dlCfnaAUhuOF3bbZd4HQEHk764MHgbeuNHGT9rW4zwgQ/ee4c
         1JG3q7xVK6HTU/1S10TxhN/pQi++xpH2BZ1e6AzKTAlk/VUG8cRRMts68uxW9yjIR7ga
         16X0ALMRWvZs3AHU4d8BbPN2jIFEE+iEs8KymYeTpytd9N6Ob2NUe9xS02mpXO5L+L6d
         nWeA==
X-Gm-Message-State: AOAM532lvZTok/33N1Dpgs3KVKF9VOzi1yCiWAML1vFkwjNoWCjDSYNL
	yRToRIFkOJ/gOCd4yU1+u1jxJ3s6Nqg8n6cxDco=
X-Google-Smtp-Source: ABdhPJyFZyTJl1vBhMf13GJXEf1uKNX4KdYM4grWVvdI2LVbDWuo9be9vUKBfbUhyH9hf1mKonfdxo4oG5MXt8oGNcA=
X-Received: by 2002:ac8:555a:: with SMTP id o26mr13658468qtr.190.1589757697016;
 Sun, 17 May 2020 16:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <VE1PR04MB6621CBC0F321F39DAFEBE548E2A40@VE1PR04MB6621.eurprd04.prod.outlook.com>
 <CAHtQpK43_Ytsw6JnOoPx6xTd9zhQZY6A1OzDhNFXFW57Ttmohg@mail.gmail.com>
 <CAP9ODKpsh=K=-LzUS9O2zsDH3MQt=z6RWjGCJyEZC-AZ8ZNe7g@mail.gmail.com>
 <CAMKF1src7dw_OOKM2SkV4+-XqO9aqQ-wzxvtQm2ec-Vaav-GKA@mail.gmail.com> <CAP9ODKqOJ5f2VsWwu6ZoH4Ry2+g-dv3q0DcwcYX1qRo0GQNmdA@mail.gmail.com>
In-Reply-To: <CAP9ODKqOJ5f2VsWwu6ZoH4Ry2+g-dv3q0DcwcYX1qRo0GQNmdA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 17 May 2020 16:21:10 -0700
Message-ID: <CAMKF1sqmeLozraV-if3x1_Z3R=u5iF7vJbO4tWCUbwq=AAM5pg@mail.gmail.com>
Subject: Re: [OE-core] Cannot disable weston
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, Tom Hochstein <tom.hochstein@nxp.com>, 
	"Patches and discussions about the oe-core layer (openembedded-core@lists.openembedded.org)" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 17, 2020 at 2:52 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Hello Khem,
>
> On Sat, May 16, 2020 at 12:00 PM Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, May 6, 2020 at 1:58 PM Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> > >
> > > Hello all,
> > >
> > > Adding Khem on Cc.
> > >
> > > On Wed, May 6, 2020 at 5:42 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > > On Wed, May 6, 2020 at 10:29 PM Tom Hochstein <tom.hochstein@nxp.com> wrote:
> > > > >
> > > > > We are no longer able to disable weston service with standard `systemctl disable weston@root.service`.
> > > >
> > > > I've faced similar issues a while back, and also found out that weston
> > > > has been actually started twice: once from udev, and once from
> > > > systemd. At that time, I removed the udev locally on the EVK and
> > > > didn't look further into it.
> > > >
> > > > > On boot the service is started again. It seems likely this started with the introduction of a starting udev rule:
> > > > >
> > > > > https://github.com/openembedded/openembedded-core/commit/aa3bced2e1de2f4ba507aa014835b06edccc138a#diff-d92aa97566c1bd0dd1eb817bb4511cda
> > > > >
> > > > > Is this behaving correctly? Can the rule be made to honor the service disablement?
> > > >
> > > > Or the other way around: can the systemd service be disabled? Or in
> > > > general: is it possible to leave only one of those mechanisms, and
> > > > which one is the correct one?
> > >
> > > Why the udev support was added and why this cannot be done in the service?
> > >
> >
> > udev service integrates well when you have weston but for some reason
> > no drm on machine so it only launches
> > when system detects graphics/drm
> >
> > if you need to manually control it then disable the udev rule and it
> > will show up disabled always and then can be managed
> > manually.
>
> I understand the use case you are intending to cover however:
>
> - we now have two overlapping mechanisms to start the weston service
> - we have more than a way to control the weston service
>
> it is confusing and I don't foresee a easy way to disable the udev
> service. How do you think it should be done?
>

In a bbappend remove udev service. Like you would do to disable
service if it was controlled by systemd service

>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
