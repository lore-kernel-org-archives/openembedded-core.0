Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.29870.1629981795729810711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 05:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vBGPR6Qc;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id r19so4400844eds.13
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 05:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m6W249ckWKDYVptKCwHvhqMwWF2ICUpLymqIb3+nv5o=;
        b=vBGPR6Qcb70DBVnFuXKd1zMrADvia/r1Ktq32dS96SKFgOuAOWbhGBg4iCnDJXVRvw
         l2KF/0sWHd0Fjee4jRt5tXOB7zDi+adERGuUCSHjES8UG/v8VS6rwnjmEJ7wgn6PVJpN
         XFYb99TDElcOVdmODmffWyZsuD2rmuCXNvr+UyrRd1QT0zQK7xFEUNRo7KBH9qZhGv5/
         F6NXEZOlzpb3nnkocFcLDNzDkqlgGWV6OR4kzcZ32oAwwSWAEElBkJE28xQgjr0QLyvF
         ZoKjICW84hsRAnVgqujGr8BmHArIvOIyYE1NpF8XD5kmOUUGpIeo3CLte1rGN0T1dghM
         xWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m6W249ckWKDYVptKCwHvhqMwWF2ICUpLymqIb3+nv5o=;
        b=cCLMg5LOxFksQJ/jlsWkQ6l9A2SQA4WK/i2FU9krumZ3lku5u9vZdK9c00moBoJyuq
         B7BUvGlvubdrJRwEhBkbkOREHUuKlXIjFo/A5xModMjzDbT+3tIi9Lh47aohgd+M72Nk
         Rk0H2bwQOrLsOnncttRySYWH9PBzkVdC90q9GNDAjwLNgwz/V5+LEOenpWkM6cRpW60q
         gs1y/w3hPa4J3MsXYt87kg588KVw0253JMOEPvwQpmPz2A3/NQSZ6QBZyCnhf5M0Bkhx
         TvoqyvkPW8Xt2Ttqvr1yi727oU2cwda4sVWcqr9JOQhT0j9WY9Z5NkMchyLOPnR5Ytkn
         VpbA==
X-Gm-Message-State: AOAM531VTGqEB3hatMgxDIesWBZpbkZyT+wHRRo9kEyUnrvBVaaVeI2l
	IAt9IIjl+V8ujAqIxO5BiBSmYyr7sjxyy0yf/P0=
X-Google-Smtp-Source: ABdhPJzSRcRUo2QAoe05kJPhR5TwavwFpnnxs8Dzk+ivd3b8nm5ZTuTIMFLStG0Wf43gWVRBPDiBTr7WS6MH0TlLv4o=
X-Received: by 2002:a05:6402:d66:: with SMTP id ec38mr4251280edb.234.1629981793783;
 Thu, 26 Aug 2021 05:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629907508.git.bruce.ashfield@gmail.com> <a8785fb579a1573f0f383167023cb7425c3a17fb.camel@linuxfoundation.org>
In-Reply-To: <a8785fb579a1573f0f383167023cb7425c3a17fb.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 26 Aug 2021 08:43:02 -0400
Message-ID: <CADkTA4MS-EOvaJUpLBqv5iK_=Qxra-6LcEBf-vqyiEFLtQwU5g@mail.gmail.com>
Subject: Re: [PATCH 0/4] kernel-yocto: -stable version bumps
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 26, 2021 at 5:39 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-08-25 at 12:06 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Nothing too exciting here. These have all build locally and I haven't picked
> > up any issues (I've stayed off the AB, due to the extra load you mentioned
> > it has been under).
>
> Thanks, the AB has been under a fair bit of strain. There does seem to be
> something wrong with the versions in the series:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2150
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/4179
> https://autobuilder.yoctoproject.org/typhoon/#/builders/122/builds/118
>
> I stopped the build as it was clear it wasn't going to end well.

Looks like something misfired on my SRCREV update. I'll check it
locally and send a v2.

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
