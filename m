Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.14980.1629897473696835666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 06:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uz0R1Y8N;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id b7so36944336edu.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 06:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ymX/iltly0mWfs0xGLO4R/hBlsSzGcI/WAsPBpueMjY=;
        b=Uz0R1Y8NnRok5K4FJQ/UXKP4RRRr4/aDxyu4oVCpal+lFajSMI1vTS3DxkpylO+Jw+
         yjjGLNGnskwtlI14/WY4K92SxkUELzyyNA2evJghwnPquSk3qrx3NlLgMN1R0xxFPpAG
         GQL70g9nE29C+I1uYkWSWdGhBf8VkRqZEDUZ8gh+cF75WFy8a4xZJ7kiDxu6VSItuqTx
         GZ0JnzT5k1ZRcgAbV64OeVzO/IRkAY8aT+QMCZMJxslTsOe7pSUo04JwxdoATFW0oiT7
         XwUxhfYMao0CwWcm39DuLD1u/n6zr6Jgg9ebJwbXZwXB1Dhi3jbWqKSraemzrFE65FEc
         cO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ymX/iltly0mWfs0xGLO4R/hBlsSzGcI/WAsPBpueMjY=;
        b=T9zeqMTgEcYAGr0Qp7Ai7k317i/0SIDgAZbJtaV5QnDxafDvgQ/s9UjvUqgh8NjdJ5
         6Z20gfpfEbyyl1KrD06Oe9Jb3YSwkhObeCsGelYYp7GRO0UVGJUzI/tg1u6lTQ3YyPcz
         FUyM656BDyGwloM+mokKh94T7VFdGVDv8XpPAL4U+jGByv2gj7y1B2l5ETkSV66NRr6+
         /iS+2dbcfg9BzUhUgn2J8U5dx5PKGg3xfs2VA/8eGpky9lngZLQ4fO1srgKpaBDTGKOA
         UsVNK/iRw/1iZemV+atRghwlFFhCp1tj4vJJ8VjySkyfptevhTz1THsMgK9VAnwt22q0
         2DyA==
X-Gm-Message-State: AOAM5310eqLiB111VqqPvmROAQkE/U4s+mzV5wy2X0mfNBGOSEY6l5eI
	pjPWJW7p882QYx9xomKrLLwBNMmkEPDiIv5eu0k=
X-Google-Smtp-Source: ABdhPJz/HY3lUE7rPYSW8F1d+Qi3WjyHOYb83WikjBMW3wSR8EHX66Tna0Q0kviqQGInzc48yR9RW+85FIRzO+khgs4=
X-Received: by 2002:aa7:c685:: with SMTP id n5mr28433108edq.27.1629897472158;
 Wed, 25 Aug 2021 06:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210825094106.11829-1-pkj@axis.com> <CAHtQpK7dzG3RPMbPH_5z6-o3p5e0AuLTO+xBW_UX91jSNH7YfA@mail.gmail.com>
 <d6c1a107cf6e4a018443f985d554bf1f@axis.com>
In-Reply-To: <d6c1a107cf6e4a018443f985d554bf1f@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 25 Aug 2021 09:17:41 -0400
Message-ID: <CADkTA4Nb_wm8QST7PRUax9xcUX4HFfdkjrPrW_NyjfmCDH2Mcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lttng-modules: Make it build when CONFIG_TRACEPOINTS is not enabled again
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 25, 2021 at 8:57 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Andrey Zhizhikin <andrey.z@gmail.com>
> > Sent: den 25 augusti 2021 12:20
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>; OE Core mailing list
> > <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] lttng-modules: Make it build when
> > CONFIG_TRACEPOINTS is not enabled again
> >
> > Hello Peter,
> >
> > On Wed, Aug 25, 2021 at 11:41 AM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch was updated
> > > with the 2.13.0 update (commit 5dad15af), but unfortunately it no longer
> > > did what it was intended to do.
> > >
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  ...fail-if-CONFIG_TRACEPOINTS-is-not-en.patch | 42 +++++++++++--------
> > >  1 file changed, 25 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-
> > fail-if-CONFIG_TRACEPOINTS-is-not-en.patch b/meta/recipes-
> > kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-
> > not-en.patch
> >
> > I guess the patch you've refreshed is not a correct one...
> >
> > There is another patch introduced by Bruce in the commit 18bf7b0
> > ("lttng-modules: update devupstream to v2.13-rc "), namely
> > 0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
> >
> > It make sense to refresh rather that one instead of the Makefile one,
> > and have it included in the SRC_URI (see discussion in
> > https://lists.openembedded.org/g/openembedded-core/topic/84950303#154888).
> >
> > --
> > Regards,
> > Andrey.
>
> Right, I had missed that there were two patches doing the same thing
> (though neither actually solved the problem after the update to 2.13.0).
> I will send an updated review unifying the patches and adding my solution
> to disable building the module when CONFIG_TRACEPOINTS is not enabled.
>

We really should stop dragging these patches along at all.

I have a unified set of patches here as well, but continuing to allow
lttng modules to build in configurations like these, just doesn't make
sense (which is why I haven't sent them).

We should have a distro feature, and simply drop it from package lists
when appropriate.

Bruce

> //Peter
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
