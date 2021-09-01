Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.9093.1630507960278535603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 07:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qPZSxoBT;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id q3so4208364edt.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dVp1fXv0mb87I+vbtD8fzKC698/8P+YuxjnTdbRXzqQ=;
        b=qPZSxoBTjfWOOiHXJG1TIAMneeVMwQPZmMttGvNp0NIlyF5IB6crrqYxoKi/nWsJL9
         OXxEDqHyeq0TZVuRib+nG7ceg3fnXOao2dKpxNC8G7AaAj6b7YNx1kpputRsEYX2E1Ij
         8gLOARGlX4yNzMKNrs6naddiATXuuCy4UNn+S8XNmDXj2UnzeJcjewkCZjyENlN7pFP/
         M+2ChK39jqKJuFt8vgVuPxx7Om9H7b23oZ1xlbLieBNq9Qm2ZkhA6U0Mn4w6rX0WrVF+
         1jJkEpHFwrZxLwBTTxMicPq2bwaQz+r8rvxdS2crhoKswP2pCVc4DGSaniOXl75c5K+m
         BkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dVp1fXv0mb87I+vbtD8fzKC698/8P+YuxjnTdbRXzqQ=;
        b=VACy2mXhDtKZzhULPnCc2EzXI5lmHjbt0ihFjXPXaMJ6nWgGUaak/3li9f0exWZr3t
         aoZmBASKuFXZ84sFmFb83NpVDEjUpEJmdtpVQfFn/vY2J/nl956fbXaYKy3QlJEhtW8F
         TLu7+SZ7toKBKU2H9L7Kko4ez6XpDx1UOnnA+XNNNmY7diDuDnu5dLLBwB4p2DS4D8RJ
         Bi/weIsAPnZl1UP75OcOYemkcHHdR9g2PCu84R6JfpX/TpETUsFRQVAUUGdj0TT7IwWZ
         oTsIw3NUdW3a/70HTIcWv6vW6JYXYziWt9+zA9tlecvdSo5lAHrATKSkxQhRjqVvCtcq
         TIuw==
X-Gm-Message-State: AOAM530MVr5B2/VWQBncqS3621Yy9urmGdbt9YZGQM4kXHMC+cfbpWIj
	ogzmSKZDVq18+mgld42Fs5aAtUYfABM/0lkHeHw=
X-Google-Smtp-Source: ABdhPJyf4ZMfEjWjDWRHUpHeJnFg0jnQn0cC3RzVLtMf04qEWCUfZ9mnVZIl+L63pyltb0Gx+WNQVuH3bYrwVETMP0g=
X-Received: by 2002:a50:ed09:: with SMTP id j9mr20598eds.164.1630507958651;
 Wed, 01 Sep 2021 07:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210901092020.116142-1-michael.opdenacker@bootlin.com>
 <CADkTA4NCnTW5Zx=UJ9Lk0szNdJqENZyZL=pNJVmMXanBHEYr6A@mail.gmail.com> <f6c7916efaf24021815101c3b0086782@axis.com>
In-Reply-To: <f6c7916efaf24021815101c3b0086782@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 1 Sep 2021 10:52:27 -0400
Message-ID: <CADkTA4OM5HRLb=tPDNnqKCewRhLYkMsVQvYO8ayYM+iW43OCHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meta: stop using "virtual/" in RPROVIDES and RDEPENDS
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 10:46 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Bruce Ashfield
> > Sent: den 1 september 2021 15:24
> > To: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] meta: stop using "virtual/" in RPROVIDES
> > and RDEPENDS
> >
> > On Wed, Sep 1, 2021 at 5:20 AM Michael Opdenacker
> > <michael.opdenacker@bootlin.com> wrote:
> > >
> > > Fixes [YOCTO #14538]
> > >
> > > Recipes shouldn't use the "virtual/" string in RPROVIDES and RDEPENDS.
> > >
> > > That's confusing because "virtual/" has no special meaning in
> > > RPROVIDES and RDEPENDS (unlike in PROVIDES and DEPENDS).
> > >
> > > Instead, using "virtual-" instead of "virtual/"
> > > as already done in the glibc recipe.
> >
> > We have quite a few cases in meta-virtualization, where the same
> > unclear syntax is used.
> >
> > I can take care of updating it, if you aren't looking at it already.
> >
> > Bruce
>
> Can anyone enlighten me to what benefit changing "virtual/" to
> "virtual-" for runtime dependencies gives? AFAIU, this makes no
> technical difference and everything will still work exactly as
> before, but with a different provided name.

Yup.

>
> If you then have virtual/foo for build dependencies and virtual-foo
> for the corresponding runtime dependencies, then I only see increased
> confusion with a change like this.

I don't disagree :D

I wanted to take care of meta-virt for exactly that reason. I want to
have a closer look at things, and decide what is the best path to take
(from a consistency point of view, or leaving it .. if it isn't broken
:)

>
> And yes, I know about the problems with virtual runtime dependencies,
> but in my experience, as long as you do not try to create a global
> package repository with packages from multiple builds, but only use
> the packages created by bitbake to generate an image, they work as
> expected.

That has also been my experience. We've had our virtual/ providers for
years in meta-virt, and haven't even run into an issue.

Bruce

>
> //Peter
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
