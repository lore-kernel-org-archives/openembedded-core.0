Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.7876.1624456310224836629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 06:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dUrx61xk;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id r5so4272368lfr.5
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 06:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zUsWYeDiVGcfvhlxuKqY6tLrt0OpLSE73NH37y4T25U=;
        b=dUrx61xkJzHwoVLxjxex9shvpeX93CndowtgFwKfH0G/NNt2vJqCrmw4yvhSuRDUhD
         WSE8pdawB6++bfjUxd1ssl9tNbdYeMFYg5vAhBzMaDiWoRFePTOcSkw/OKESjJ6dLtHM
         n9vimbiABRfZ85wzBSdsZ1qhA8lKXrRLGt35jiLe/lCpRBfrKC4UcC8vGdBFJDQwZZSW
         gfqQzmu2vk8EjXhDdGWkaFuwoAqdHteoVHSqZacZwsI+KR3v/KkYD9SAzLLap1uRQ90f
         b8O1WXv3DRLT/qCbQxyA9g6KlCWNzJcL1aHohr//dVLh01DiM0F3rTEJg5fFQBUP33Zz
         2IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zUsWYeDiVGcfvhlxuKqY6tLrt0OpLSE73NH37y4T25U=;
        b=D/FeUZoQPbhC2nZkc8VUQH2WGiuEqeFjMlgDQmT/C7lkWAZxcw2nGzr/S5jMsWwp0Z
         WNPQvEOYUWKKUdQ5rCMMLv1ZF0HeYWxWzlVq57j3rHmcjmUSVErvmLtDyLq18xNW5TfA
         FBkWd5Wp+Oj+1PJyCxVxQRVOTZhtmG8IjKTynWPRa30fVF/f2vMU1QeOaNME0wa7v9FA
         eD0D4HriVlkyz7ndiAf3DdaOxNW/bq/n6bFrNzmtSYY001Cu7HO1TQdpIE94RLnr1hDv
         mh/ZDBx9ymR3oVciGd/HgCnY/jQTuD9uzXEekbQCk74ShKR9vo9SMvOHsH+umZrroeSJ
         G4cw==
X-Gm-Message-State: AOAM533GBeFydV6G3JNJv3kpZvYIS2Z+ODYdlAuiUkw+8FHyiQr7deYT
	TitrNUiRXxo//1OsxhAch6Sz9+zWwr2T8OibDxI=
X-Google-Smtp-Source: ABdhPJxLIOXgmDPhTercbqCLYD112jHi1v/pxQKCnfxJKO0wOEs1e8kUrPD4BdffN2HqxbjAm54UMpX+omWGjfoKY/8=
X-Received: by 2002:ac2:431a:: with SMTP id l26mr7268814lfh.429.1624456308533;
 Wed, 23 Jun 2021 06:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210622221818.4613-1-andrea.adami@gmail.com> <20210622221818.4613-2-andrea.adami@gmail.com>
 <e7a7a1a335404229b99a7815b2b6e15b@XBOX03.axis.com> <CAAQYJAtBoiaX180FxOKzXPwm0hciYQths0eOYiTRSyZypmdrkA@mail.gmail.com>
In-Reply-To: <CAAQYJAtBoiaX180FxOKzXPwm0hciYQths0eOYiTRSyZypmdrkA@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Wed, 23 Jun 2021 15:51:36 +0200
Message-ID: <CAHtQpK5erwo++s8pLwHdkjbBvuwwZzNZb6ejjPvxx5g=w1dNdQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_devicetree only if KERNEL_DEVICETREE is set
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Andrea,

On Wed, Jun 23, 2021 at 3:16 PM Andrea Adami <andrea.adami@gmail.com> wrote:
>
> On Wed, Jun 23, 2021 at 11:32 AM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Andrea Adami
> > > Sent: den 23 juni 2021 00:18
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_devicetree
> > > only if KERNEL_DEVICETREE is set
> > >
> > > Now it unconditionally tries to create package kernel-devicetre even for
> > > legacy devices w/out DT.
> > >
> > > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > > ---
> > >  meta/classes/kernel.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > index 06e6446a08..68369e3791 100644
> > > --- a/meta/classes/kernel.bbclass
> > > +++ b/meta/classes/kernel.bbclass
> > > @@ -779,4 +779,4 @@ addtask deploy after do_populate_sysroot
> > > do_packagedata
> > >  EXPORT_FUNCTIONS do_deploy
> > >
> > >  # Add using Device Tree support
> > > -inherit kernel-devicetree
> > > +inherit ${@ "" if d.getVar("KERNEL_DEVICETREE" == "") else "kernel-devicetree" }
> >
> > That doesn't look correct. Don't you mean something like this:
> >
> > inherit ${@ "kernel-devicetree" if d.getVar("KERNEL_DEVICETREE") else "" }
> >
>
> As you prefer, I don't think bitbake has likely/unlikely optimization.
> I took the style-example from line 6 where it reads
>
> KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") ==
> "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
>
> I am for any option providing a guard.

I guess you've missed the closing bracket in your statement, please
take a look at the comparison operator.

As yet another option, maybe even something like this:
inherit ${@oe.utils.ifelse(d.getVar('KERNEL_DEVICETREE') == '', '',
'kernel-devicetree')}

However, I'm not sure what would happened if KERNEL_DEVICETREE is
undefined, as in this case bitbake should return "None" according to
the documentation.

>
> Cheers
> A.A.
>
>
> > > --
> > > 2.17.1
> >
> > //Peter
> >
>
> 
>


-- 
Regards,
Andrey.
