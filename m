Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.9191.1624461754265971080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 08:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=isVTey5s;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id d7so4090162edx.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 08:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mUqId5D4VykV2IbWv1ztzGIwa9zb/A9p1Q77BgIbzX0=;
        b=isVTey5sMrcaqZOjTPdR24oKH6eoouclYWXMWJA59pOFgMn4lW10mq/Qi0GqaJ35n0
         h2dvaJtOI2/nJ9c7oLRfYY8g2g4PdRSopaT5I53bNjc8yZzP75lh5ThVlAoRCPH0tFKZ
         jtX23v14Six0hZmRHzrtktI7qPds0vq6qjIpPShbKqdZJMoye1Fy9D7rL1ZJ+K/EbiGT
         2B38PL8BeFl17P4wJt7sX7UyImHdNdu05gXWUfcdzVAbI+5WUxow6uTi9FNLi+Sbapib
         SV9bkWoOZjI/IkmOsEGNlRf86DDIhyrA9kY748ZgsW0xxteaLnzR9gXK7KHDjC1RucdK
         fULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mUqId5D4VykV2IbWv1ztzGIwa9zb/A9p1Q77BgIbzX0=;
        b=eS4gyHfoUj+DiJu3BwnP2PgLFJQ71ky/UeNvRxfrMnGWBiBpb/9UOZ7E3tF1+ikKcz
         ynCRJTd/kujX1Cg1pAMv6+AVCzxVf0DOD4R9IoKJyAL56KhQZkCNOgrcTpN/0Qi2rNm1
         e7OYw7mU/c3Bcoti6bOf/fsC4+VEXKWTK8ABlXM884e7h58zfKt3L5KJD2KdPnRx5UOU
         9ekHLhxGNchiEI+OjWlOPbpDQ6p+2UOYiG5+KNyZbwJ/t0SAR4hqwVsidoaVJOCx5C3x
         ktfHE63TvFrLZj5ubTZaxFxBggrQb7cBmdJ2wYFTTiVdUOz1MNQmyxzFT5EiKJ3Tf92E
         bYVQ==
X-Gm-Message-State: AOAM531rF2vJUZe3r64/M260A/SUkE2Ez79mKgKlF8DlCQuC0fH+n9Qi
	O0ZC0WYj0+VsUqDjpt6FM6PsNkbgimH25gohvxg=
X-Google-Smtp-Source: ABdhPJzKJNg0R97/3SJ9Bx9V5hnGBUO8RRv/BoAruLoEA1C6NNlvJbH5k5aD0QQTBVx26rlbbvIDjhCnWz1m9lWOGrk=
X-Received: by 2002:a05:6402:5191:: with SMTP id q17mr253483edd.321.1624461752843;
 Wed, 23 Jun 2021 08:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210622221818.4613-1-andrea.adami@gmail.com> <20210622221818.4613-2-andrea.adami@gmail.com>
 <e7a7a1a335404229b99a7815b2b6e15b@XBOX03.axis.com> <CAAQYJAtBoiaX180FxOKzXPwm0hciYQths0eOYiTRSyZypmdrkA@mail.gmail.com>
 <CAHtQpK5erwo++s8pLwHdkjbBvuwwZzNZb6ejjPvxx5g=w1dNdQ@mail.gmail.com>
In-Reply-To: <CAHtQpK5erwo++s8pLwHdkjbBvuwwZzNZb6ejjPvxx5g=w1dNdQ@mail.gmail.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Wed, 23 Jun 2021 17:22:21 +0200
Message-ID: <CAAQYJAv9ear6oUz8c1c5QaFyMfxuVG7xN==dfpC+yXPQJNdgwg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_devicetree only if KERNEL_DEVICETREE is set
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 23, 2021 at 3:51 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Hello Andrea,
>
> On Wed, Jun 23, 2021 at 3:16 PM Andrea Adami <andrea.adami@gmail.com> wrote:
> >
> > On Wed, Jun 23, 2021 at 11:32 AM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > core@lists.openembedded.org> On Behalf Of Andrea Adami
> > > > Sent: den 23 juni 2021 00:18
> > > > To: openembedded-core@lists.openembedded.org
> > > > Subject: [OE-core][PATCH 2/2] kernel.bbclass: inherit kernel_devicetree
> > > > only if KERNEL_DEVICETREE is set
> > > >
> > > > Now it unconditionally tries to create package kernel-devicetre even for
> > > > legacy devices w/out DT.
> > > >
> > > > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > > > ---
> > > >  meta/classes/kernel.bbclass | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > > index 06e6446a08..68369e3791 100644
> > > > --- a/meta/classes/kernel.bbclass
> > > > +++ b/meta/classes/kernel.bbclass
> > > > @@ -779,4 +779,4 @@ addtask deploy after do_populate_sysroot
> > > > do_packagedata
> > > >  EXPORT_FUNCTIONS do_deploy
> > > >
> > > >  # Add using Device Tree support
> > > > -inherit kernel-devicetree
> > > > +inherit ${@ "" if d.getVar("KERNEL_DEVICETREE" == "") else "kernel-devicetree" }
> > >
> > > That doesn't look correct. Don't you mean something like this:
> > >
> > > inherit ${@ "kernel-devicetree" if d.getVar("KERNEL_DEVICETREE") else "" }
> > >
> >
> > As you prefer, I don't think bitbake has likely/unlikely optimization.
> > I took the style-example from line 6 where it reads
> >
> > KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") ==
> > "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
> >
> > I am for any option providing a guard.
>
> I guess you've missed the closing bracket in your statement, please
> take a look at the comparison operator.

The code as it is doesn't raise any parse error.
There is opening bracket and closing bracket, what more?

We can discuss about the form, someone suggested anonymous python for
both patches.

Thanks for reviewing
A.A.

>
> As yet another option, maybe even something like this:
> inherit ${@oe.utils.ifelse(d.getVar('KERNEL_DEVICETREE') == '', '',
> 'kernel-devicetree')}
>
> However, I'm not sure what would happened if KERNEL_DEVICETREE is
> undefined, as in this case bitbake should return "None" according to
> the documentation.
>
> >
> > Cheers
> > A.A.
> >
> >
> > > > --
> > > > 2.17.1
> > >
> > > //Peter
> > >
> >
> > 
> >
>
>
> --
> Regards,
> Andrey.
