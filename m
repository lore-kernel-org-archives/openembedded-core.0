Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.15311.1629899249913078404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 06:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TbZY2fVM;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id d6so37111237edt.7
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 06:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1keUZYsO6QV+8/pMbGNnklBjbjALTJcyjldJHaO+Qw8=;
        b=TbZY2fVM3monyRcw5BgQMRjXA30WhWjVgfJt/lqX6mJNvIiIvHTbCBhHp8NpMyyN5W
         gLpWfQjmbiNr/T+0AuyzfqeP7nHqSFkSmzXzW/IBq2pB89M3C1qtYuB3a3GURKtVR56K
         3RNwuQFqLN6oDPuLGiocjiTt62nwCdUB1iDC+hC9CH28On2Uu6nubjfgdpKh9oitfCmJ
         sFQLXusiVv1troujyZXmoScXbMnaZ0du6b7+cGqjq2ush34G/a0VkQmonGh956xzvc0E
         dDRpogIPAqYxjvZUcnXAKf9tXIdHHJYt7OlvSRPLsDJl97uDDo2fa6ueDOjDdfeDlwGW
         E/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1keUZYsO6QV+8/pMbGNnklBjbjALTJcyjldJHaO+Qw8=;
        b=KAJ6blmNg807KUjwonrOcPDXzJxu9VF4C3sjH47mML+UaV7WjGXAUitCaSjmD1qUBs
         uzUGPaVd8wAzRHdQPt+0iilWwaTKU3SZWJyVbIW1ZgYIjjW/FKeBII7p3AITiXGKEZVn
         X0C0jRj7oI3Z4hZ0WHzONcTMkIaRXFyhNVvPCQMgPjgxV8TSJuJ7UKgDat/9SajL3l7b
         oFg4dPlLHkqEKrz8fKUbAETXDtDbkFBuvzn9H4m1NwUT+t1rch4k5Vc1lrqjFbCUxYz4
         fdzCTAj/MmQ3cyQ8TmULZu+srTnE0ZvIpMC4KT6A6MgLqQAlq7Dj6FIElrBSz0lfMSfx
         1J3Q==
X-Gm-Message-State: AOAM532/a5fk6/2C6ZM/R1uzjnfgMhki8A2UtSuuw5YE9ONeW4zm9lQH
	kHqC0ccN5nQbRAQ63+DndyDAQ/AWOWXJL7polBU=
X-Google-Smtp-Source: ABdhPJxTu8QLyOa1bpkOqnDKlur5VBhLeBwQuhv6uc9jBFxWpSqUz+clyHyrExJImHK+QT0xT+M63hkUlTSZcpKh5ig=
X-Received: by 2002:aa7:cc83:: with SMTP id p3mr49552435edt.365.1629899248148;
 Wed, 25 Aug 2021 06:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210825094106.11829-1-pkj@axis.com> <CAHtQpK7dzG3RPMbPH_5z6-o3p5e0AuLTO+xBW_UX91jSNH7YfA@mail.gmail.com>
 <d6c1a107cf6e4a018443f985d554bf1f@axis.com> <CADkTA4Nb_wm8QST7PRUax9xcUX4HFfdkjrPrW_NyjfmCDH2Mcw@mail.gmail.com>
 <abc8be0925ae4d0499c9bec5d08bacfc@axis.com>
In-Reply-To: <abc8be0925ae4d0499c9bec5d08bacfc@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 25 Aug 2021 09:47:17 -0400
Message-ID: <CADkTA4OP2Ho9R3e152MQBRPQY3Bb7ChWNPOgoJugJsC5PXLRyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lttng-modules: Make it build when CONFIG_TRACEPOINTS is not enabled again
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 25, 2021 at 9:40 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Sent: den 25 augusti 2021 15:18
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: Andrey Zhizhikin <andrey.z@gmail.com>; OE Core mailing list
> > <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] lttng-modules: Make it build when
> > CONFIG_TRACEPOINTS is not enabled again
> >
> > On Wed, Aug 25, 2021 at 8:57 AM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: Andrey Zhizhikin <andrey.z@gmail.com>
> > > > Sent: den 25 augusti 2021 12:20
> > > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>; OE Core mailing list
> > > > <openembedded-core@lists.openembedded.org>
> > > > Subject: Re: [OE-core] [PATCH] lttng-modules: Make it build when
> > > > CONFIG_TRACEPOINTS is not enabled again
> > > >
> > > > Hello Peter,
> > > >
> > > > On Wed, Aug 25, 2021 at 11:41 AM Peter Kjellerstedt
> > > > <peter.kjellerstedt@axis.com> wrote:
> > > > >
> > > > > Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch was
> > updated
> > > > > with the 2.13.0 update (commit 5dad15af), but unfortunately it no
> > longer
> > > > > did what it was intended to do.
> > > > >
> > > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > > ---
> > > > >  ...fail-if-CONFIG_TRACEPOINTS-is-not-en.patch | 42 +++++++++++-----
> > ---
> > > > >  1 file changed, 25 insertions(+), 17 deletions(-)
> > > > >
> > > > > diff --git a/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-
> > not-
> > > > fail-if-CONFIG_TRACEPOINTS-is-not-en.patch b/meta/recipes-
> > > > kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-
> > is-
> > > > not-en.patch
> > > >
> > > > I guess the patch you've refreshed is not a correct one...
> > > >
> > > > There is another patch introduced by Bruce in the commit 18bf7b0
> > > > ("lttng-modules: update devupstream to v2.13-rc "), namely
> > > > 0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
> > > >
> > > > It make sense to refresh rather that one instead of the Makefile one,
> > > > and have it included in the SRC_URI (see discussion in
> > > > https://lists.openembedded.org/g/openembedded-
> > core/topic/84950303#154888).
> > > >
> > > > --
> > > > Regards,
> > > > Andrey.
> > >
> > > Right, I had missed that there were two patches doing the same thing
> > > (though neither actually solved the problem after the update to 2.13.0).
> > > I will send an updated review unifying the patches and adding my
> > solution
> > > to disable building the module when CONFIG_TRACEPOINTS is not enabled.
> > >
> >
> > We really should stop dragging these patches along at all.
> >
> > I have a unified set of patches here as well, but continuing to allow
> > lttng modules to build in configurations like these, just doesn't make
> > sense (which is why I haven't sent them).
> >
> > We should have a distro feature, and simply drop it from package lists
> > when appropriate.
> >
> > Bruce
> >
> > > //Peter
>
> I know nothing about lttng myself, but has passed on your concerns to our
> maintainer for the functionality. Unfortunately he is on vacation for a
> couple of weeks more, so I do not know when I can expect an answer from
> him.
>

No worries.

> So for now I hope we can update the recipe per my patches so that it
> continues to work as before, and then we can take the discussion of
> whether it should be possible to build lttng-modules without
> CONFIG_TRACEPOINTS enabled separately.

Agreed.

I've chucked my patches that fixed the build here as well, since they
were very similar to yours.

I'll continue creating a dummy package / distro feature option here,
since pulling those patches along is a particular pain point for me, as
I continually hit lttng issues as I work through new kernels :D

Bruce

>
> //Peter
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
