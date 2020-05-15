Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.6309.1589509748561579953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 19:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G6pTE3Xl;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id s19so812427edt.12
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 19:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H3kT6qCHPq2ZgkFI8X/Zm0+PWjJD8XczuLN9SnUIeNc=;
        b=G6pTE3XlsHvyrxR4uv3X/aJC8VXPJ5IaZrdFXyqsBZtrIqMqLUuXYdNsOlOFhxI52u
         F7gqFNptGc5BUWUyXvdHYuEe26ftdyQKQSKOTBwlVZKI5pdtKaNCyb92eOJZT3BYErcl
         NxhZqbhcrGhjlA3q+Clbuk/OEjcVlIVhXwQs1ZISCm77IUOtYp7P82RtCI9/yu/I6OAR
         W0LVwZaGAEQ26Mt9V+wLExvlOjmwgNterU2g0Rg1s1WHO33PjtHHk3jHbUPGYn/vnBnr
         BD/A6RFL1o1hTce32BRDGx4RtdLYRuSVDEtechee2i2NpA+/0+AdPSn+XywF/L8eehXE
         zVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H3kT6qCHPq2ZgkFI8X/Zm0+PWjJD8XczuLN9SnUIeNc=;
        b=oNFVZzRQ0VaPYfcSlZheIA52vEUJaz1yvA0iKpuyk8zNQw5DhKInO68Tljzgt73ORB
         7iK16pMnodWQst4I1k869jCGupu8mUbu6XTdUr1vQZ8Rlcz7pneG58fCakRwdBGUhDfD
         8ZVepoD7uCSKuHOc/GUvs5wMzLkE+tuMfRTdzllLxMRgBcz0NVO5AS31wrLSh3XXhRxS
         oih7PUYHXNqAAw5nRsTNM4eBZjqUQEGNCDave/3G4ISdjIIJqDj3/NafyjrW3ssbrfst
         bHl7ugrShv45j9H4wu4IM3EtJAT/iL98ZJWJ5rFraN9yf0JXt2GlspzjN3T1JRxS81cQ
         O1kw==
X-Gm-Message-State: AOAM533F2NQqrPOc9xlBBipVJzNrCt4hPJM0HBc/FK+PksQrffaDuWSa
	RMON2J8mn1g2JIoEo+VMlegTg8vYbrw6VmKICXY=
X-Google-Smtp-Source: ABdhPJylY78FesPO6WlldtbkFec7WimM/K3tkyOCP6KDf0wIpKzZKgHzPqfZ5+s9o1D0VV7UNPepYsoT/kX1x1I6MX8=
X-Received: by 2002:a05:6402:b70:: with SMTP id cb16mr919238edb.234.1589509746630;
 Thu, 14 May 2020 19:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589378829.git.bruce.ashfield@gmail.com>
 <4586b07ae3f2c70500b6627645de2f71760b45e4.camel@linuxfoundation.org>
 <160EEB0DDF36CFC2.25549@lists.openembedded.org> <CADkTA4N9OVMWenYf1p5Tq6xvoa12JOaNNKfccT4of-t33NH6WA@mail.gmail.com>
 <78de346ce051f49a641ca92edd33a778b6881e93.camel@linuxfoundation.org> <CADkTA4O3dR4DTmcb+qEokXbBMEQGM-iXDa25KTxp1XQ0HaPg8w@mail.gmail.com>
In-Reply-To: <CADkTA4O3dR4DTmcb+qEokXbBMEQGM-iXDa25KTxp1XQ0HaPg8w@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 14 May 2020 22:28:55 -0400
Message-ID: <CADkTA4M2TeG=dsApd4Fh2Y-RCghTYbFUoH4C9ymeqHsXzOXqRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] kernel/kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"

On Thu, May 14, 2020 at 10:28 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Thu, May 14, 2020 at 4:10 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2020-05-14 at 15:44 -0400, Bruce Ashfield wrote:
> > > On Thu, May 14, 2020 at 10:22 AM Bruce Ashfield via
> > > lists.openembedded.org
> > > <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > > > On Thu, May 14, 2020 at 10:09 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > On Wed, 2020-05-13 at 10:24 -0400, bruce.ashfield@gmail.com wrote:
> > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > >
> > > > > > Hi all,
> > > > > >
> > > > > > This is a resend of the v5.4 stable bump to v5.4.38, plus a new
> > > > > > -stable
> > > > > > bump to v5.4.40.
> > > > > >
> > > > > > The extra changes to make these pass the AB tests are the kernel
> > > > > > reproducibility commits.
> > > > > >
> > > > > > The issue we had on the last submission was that IKHEADERS was
> > > > > > switched
> > > > > > to a module, and hence was failing reproducibility tests as we didn't
> > > > > > have the timestamp variables exported for the module build. It has
> > > > > > always been a problem, just one we hadn't hit.
> > > > > >
> > > > > > I've left the fix as two commits on purpose, since the copy of the
> > > > > > reproducibility export fixes the problem, and is definitely safe for
> > > > > > dunfell,
> > > > > > and the second commit is my effort to remove the duplication of logic
> > > > > > and
> > > > > > create a common python routine they can call. I've used the
> > > > > > techniques for
> > > > > > subprocess running that I've done in other kernel build elements, but
> > > > > > if they
> > > > > > aren't the right ones to use, point me in the right direction.
> > > > > >
> > > > > > All said, these are green on the AB and should be ok for master and
> > > > > > dunfell.
> > > > >
> > > > > I think this triggers something here:
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1914
> > > > >
> > > >
> > > > In that case, just drop my effort at factoring out the source date
> > > > epoch into a python function.
> > > >
> > > > It looks like the git check went nuts, and since we don't need it, and
> > > > I won't have time to work on it again for a while, if you toss it in
> > > > the bin, all should be well.
> > >
> > > I did tweak the python code to handle the git return code more
> > > gracefully. I did test all the conditional paths before, and they
> > > worked, so I'm not sure how to trigger the failure here.
> > >
> > > I can try an AB run against the fixed up routine, but what target
> > > should I be running ? Obviously quick doesn't hit it, or I would have
> > > seen it.
> >
> > You need to push a plain oe-core branch to oe-core-contrib and point
> > the build at that. This is the target:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/47
> >
> > (qemuarm-oecore)
> >
> > Not setting a DISTRO would also do it.
>
> My local builders are running out of space, so I tried to push to
> oe-core-contrib, I don't have access. I assume a github fork of
> oe-core would work as well.
>
> But when I checked out that target on the AB, it didn't offer me the
> ability to schedule one. Does something need to be granted for that ?

Sorry for the noise, I have this part figured out. I'll try the github
fork of oe-core route.

Bruce

>
> Bruce
>
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
