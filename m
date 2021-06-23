Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.1571.1624476423994874555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 12:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fe1kaJS+;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id s6so4991149edu.10
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 12:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ygBgDLb2IXJewG7i6o0GnkMgZIOMrpLSEzbh/Ve+ubc=;
        b=fe1kaJS+I9z2G+gel9/da4zBW2SgQPw3S7YkkXHuH1MfNizj07pF636m8itNzMMa/e
         iYSg/b6SnJ3/Ftn2JbZIK0bNirv2NfIkbCcCYoP1xK++LGtjgyj5XlC+6hzvzINKb5+D
         WoKVXx2fDONqTdeXTiFRJ5GUbQX3Nb8wIaZYHEakqOepf9db4lSTgHTXOXN5N0BQUc6h
         uGQxoYDdAh+iRcnbQ3i40de8DOtWAb3CaojAHsnGbCKixPtRy8y0/hqAEn9GrN/bK06J
         sn54YMZU8K2D4qH/W7/PLjsjGQVm6a9uPHqZnO4q7ivIca2DSo7qRso4Nv2EZKStO/3S
         A6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ygBgDLb2IXJewG7i6o0GnkMgZIOMrpLSEzbh/Ve+ubc=;
        b=MNY5rruReVlsrb7201WVeCMDIgEE2a2QS25Df2/gvt3dW+zBfBa2SgULaieAtwBhAH
         Fwk2q/Ty+4TV29iOXVD7Me5sSYAc3HL8e9XqvldOsb00LxoocWuKuMWgfWBzkFESjvIh
         UuLBqFv5mRfwsL1/MtkMOxRAB3k2paBp1dGkVerX/GGa9/poST4qjGtgXqHJEm1WtTJM
         qEBRB/82mFmqgHDC+8Xf5OaacN04GFboRAFK0sAAZoCOycyMRacU7isOw3rypUJcrrC+
         W0DM9Y1rEMVEexUuOBY8ebZi3gy8NDbUyz4reTHWeCxpS1TxhRaARCPZC3oeWDEiCNB9
         5xFw==
X-Gm-Message-State: AOAM5326ThJodIB4esvVS4VgUfwOFuGWt7ifm8ZYdsN+9GyWG3QQ43pB
	+tLKv74ZqeCJPoEPZnaWVEni+20i7t+6aVmWHqU=
X-Google-Smtp-Source: ABdhPJztj4S88DlnxxN5n264v/XAt48ubviXqN1FE6D4tw14DpVv5lOx6OhfrISlEEOdLZ2/QXeGcLWMbT1jPF3TUNY=
X-Received: by 2002:a05:6402:26ce:: with SMTP id x14mr1944870edd.104.1624476422365;
 Wed, 23 Jun 2021 12:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210622221818.4613-1-andrea.adami@gmail.com> <20210622221818.4613-2-andrea.adami@gmail.com>
 <e7a7a1a335404229b99a7815b2b6e15b@XBOX03.axis.com> <CAAQYJAtBoiaX180FxOKzXPwm0hciYQths0eOYiTRSyZypmdrkA@mail.gmail.com>
 <CAHtQpK5erwo++s8pLwHdkjbBvuwwZzNZb6ejjPvxx5g=w1dNdQ@mail.gmail.com>
 <CAAQYJAv9ear6oUz8c1c5QaFyMfxuVG7xN==dfpC+yXPQJNdgwg@mail.gmail.com> <20210623160222.ftqara6lcqmn4vgj@jama>
In-Reply-To: <20210623160222.ftqara6lcqmn4vgj@jama>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Wed, 23 Jun 2021 21:26:51 +0200
Message-ID: <CAAQYJAsjdcB_okKOXupCcp3AQB_rcL7KXA6KWvuDVLYPp0qgBQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_devicetree only if KERNEL_DEVICETREE is set
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thank you, I'll send v2.
I am waiting RP comments about the other patch of the series for
kernel.bbclass which exposed this one issue.

Martin, I tried to remove the patch from patchwork but all stops end 2020.
Am I missing something? New links?
Thanks all
A.A.

On Wed, Jun 23, 2021 at 6:02 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Wed, Jun 23, 2021 at 05:22:21PM +0200, Andrea Adami wrote:
> > On Wed, Jun 23, 2021 at 3:51 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > >
> > > Hello Andrea,
> > >
> > > On Wed, Jun 23, 2021 at 3:16 PM Andrea Adami <andrea.adami@gmail.com> wrote:
> > > >
> > > > On Wed, Jun 23, 2021 at 11:32 AM Peter Kjellerstedt
> > > > <peter.kjellerstedt@axis.com> wrote:
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > > > core@lists.openembedded.org> On Behalf Of Andrea Adami
> > > > > > Sent: den 23 juni 2021 00:18
> > > > > > To: openembedded-core@lists.openembedded.org
> > > > > > Subject: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_devicetree
> > > > > > only if KERNEL_DEVICETREE is set
> > > > > >
> > > > > > Now it unconditionally tries to create package kernel-devicetre even for
> > > > > > legacy devices w/out DT.
> > > > > >
> > > > > > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > > > > > ---
> > > > > >  meta/classes/kernel.bbclass | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > > > > index 06e6446a08..68369e3791 100644
> > > > > > --- a/meta/classes/kernel.bbclass
> > > > > > +++ b/meta/classes/kernel.bbclass
> > > > > > @@ -779,4 +779,4 @@ addtask deploy after do_populate_sysroot
> > > > > > do_packagedata
> > > > > >  EXPORT_FUNCTIONS do_deploy
> > > > > >
> > > > > >  # Add using Device Tree support
> > > > > > -inherit kernel-devicetree
> > > > > > +inherit ${@ "" if d.getVar("KERNEL_DEVICETREE" == "") else "kernel-devicetree" }
> > > > >
> > > > > That doesn't look correct. Don't you mean something like this:
> > > > >
> > > > > inherit ${@ "kernel-devicetree" if d.getVar("KERNEL_DEVICETREE") else "" }
> > > > >
> > > >
> > > > As you prefer, I don't think bitbake has likely/unlikely optimization.
> > > > I took the style-example from line 6 where it reads
> > > >
> > > > KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") ==
> > > > "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
> > > >
> > > > I am for any option providing a guard.
> > >
> > > I guess you've missed the closing bracket in your statement, please
> > > take a look at the comparison operator.
> >
> > The code as it is doesn't raise any parse error.
> > There is opening bracket and closing bracket, what more?
>
> d.getVar("KERNEL_DEVICETREE" == "")
> vs
> d.getVar("KERNEL_DEVICETREE") == ""
>
> > We can discuss about the form, someone suggested anonymous python for
> > both patches.
> >
> > Thanks for reviewing
> > A.A.
> >
> > >
> > > As yet another option, maybe even something like this:
> > > inherit ${@oe.utils.ifelse(d.getVar('KERNEL_DEVICETREE') == '', '',
> > > 'kernel-devicetree')}
> > >
> > > However, I'm not sure what would happened if KERNEL_DEVICETREE is
> > > undefined, as in this case bitbake should return "None" according to
> > > the documentation.
> > >
> > > >
> > > > Cheers
> > > > A.A.
> > > >
> > > >
> > > > > > --
> > > > > > 2.17.1
> > > > >
> > > > > //Peter
> > > > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > Regards,
> > > Andrey.
>
> >
> > 
> >
>
