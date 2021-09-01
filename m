Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.9284.1630508776536212005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 08:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LFyXwg1s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id d22-20020a1c1d16000000b002e7777970f0so5021813wmd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 08:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/ME0L8B/XWy02ehq7t3JhkBziIi2qPM0srCtJ2nDAOQ=;
        b=LFyXwg1sVQ50cc2BALNcFJTDpSA47GYN07i8bs56WJKKp54UCHq+tLWiFWLQlyXLMm
         JDhU2P/8KH3w+T3d3TwMMK7fJWHmN445poaEZ6CE00DSpgtJzIbkN0HBnVoBDXT58BBS
         WR62FNYuL5Qd30Bq1n0clkRQD7WzQfm93gpEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/ME0L8B/XWy02ehq7t3JhkBziIi2qPM0srCtJ2nDAOQ=;
        b=o34oz2H0NgcG1aG0RSVDkIS3tS/V6IwO2edfRg+++zvrUspmNJdrFBJW/k7d/JuphL
         opLfBXhkxR7BfvUlOKyj99OM6h4HvG/fegNBKoPt/Ey/2Zc9Sq7qpfw3NnS2LRWfm+So
         7aDBlnQkXbOkjSm3pvkYMo+yK/6c1Qa9BuoGZOhj1DeVPX93X1otw6yRfA2XjGu8f2Qf
         dkB6x2lhBwYuqIdsu0dVXHRbFObj7dTC/NaMAEQIlP89SaeZvpf1u6T7RcEeWJzNZMrl
         3Ko+LYuB2ZVydMqXA4FfYnFmJUjETU3CmMWaJWWE5NmfUs5Oyid18WfLQ31Q/0rmaDn4
         CMZQ==
X-Gm-Message-State: AOAM530N9Oen1E+SNa4q48foaqRaCG7JUpaCgculJUnlhPUwgUWKZILG
	AUTgimZwywljlcfnekhdninxIw==
X-Google-Smtp-Source: ABdhPJxBsehSL7+kR/DrjCxRd+Hc74aBF5biST2dchK5/1+WIZZ/cLzVuXkb9OlORXZ/gzM6f3D6UQ==
X-Received: by 2002:a05:600c:35d6:: with SMTP id r22mr10179690wmq.44.1630508774972;
        Wed, 01 Sep 2021 08:06:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7e06:66c6:32e7:e304? ([2001:8b0:aba:5f3c:7e06:66c6:32e7:e304])
        by smtp.gmail.com with ESMTPSA id a129sm6345668wme.14.2021.09.01.08.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 08:06:14 -0700 (PDT)
Message-ID: <f7d1476df747de63a46fb6ed3c5a36537f292bc1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meta: stop using "virtual/" in RPROVIDES and RDEPENDS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Peter Kjellerstedt
	 <peter.kjellerstedt@axis.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, Patches and
 discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Date: Wed, 01 Sep 2021 16:06:10 +0100
In-Reply-To: <CADkTA4OM5HRLb=tPDNnqKCewRhLYkMsVQvYO8ayYM+iW43OCHw@mail.gmail.com>
References: <20210901092020.116142-1-michael.opdenacker@bootlin.com>
	 <CADkTA4NCnTW5Zx=UJ9Lk0szNdJqENZyZL=pNJVmMXanBHEYr6A@mail.gmail.com>
	 <f6c7916efaf24021815101c3b0086782@axis.com>
	 <CADkTA4OM5HRLb=tPDNnqKCewRhLYkMsVQvYO8ayYM+iW43OCHw@mail.gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-09-01 at 10:52 -0400, Bruce Ashfield wrote:
> On Wed, Sep 1, 2021 at 10:46 AM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> > 
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Bruce Ashfield
> > > Sent: den 1 september 2021 15:24
> > > To: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > > Cc: Patches and discussions about the oe-core layer <openembedded-
> > > core@lists.openembedded.org>
> > > Subject: Re: [OE-core] [PATCH] meta: stop using "virtual/" in RPROVIDES
> > > and RDEPENDS
> > > 
> > > On Wed, Sep 1, 2021 at 5:20 AM Michael Opdenacker
> > > <michael.opdenacker@bootlin.com> wrote:
> > > > 
> > > > Fixes [YOCTO #14538]
> > > > 
> > > > Recipes shouldn't use the "virtual/" string in RPROVIDES and RDEPENDS.
> > > > 
> > > > That's confusing because "virtual/" has no special meaning in
> > > > RPROVIDES and RDEPENDS (unlike in PROVIDES and DEPENDS).
> > > > 
> > > > Instead, using "virtual-" instead of "virtual/"
> > > > as already done in the glibc recipe.
> > > 
> > > We have quite a few cases in meta-virtualization, where the same
> > > unclear syntax is used.
> > > 
> > > I can take care of updating it, if you aren't looking at it already.
> > > 
> > > Bruce
> > 
> > Can anyone enlighten me to what benefit changing "virtual/" to
> > "virtual-" for runtime dependencies gives? AFAIU, this makes no
> > technical difference and everything will still work exactly as
> > before, but with a different provided name.
> 
> Yup.
> 
> > 
> > If you then have virtual/foo for build dependencies and virtual-foo
> > for the corresponding runtime dependencies, then I only see increased
> > confusion with a change like this.
> 
> I don't disagree :D
> 
> I wanted to take care of meta-virt for exactly that reason. I want to
> have a closer look at things, and decide what is the best path to take
> (from a consistency point of view, or leaving it .. if it isn't broken
> :)
> 
> > 
> > And yes, I know about the problems with virtual runtime dependencies,
> > but in my experience, as long as you do not try to create a global
> > package repository with packages from multiple builds, but only use
> > the packages created by bitbake to generate an image, they work as
> > expected.
> 
> That has also been my experience. We've had our virtual/ providers for
> years in meta-virt, and haven't even run into an issue.

Have a look at the discussion on the docs list where people are getting really
confused about whether virtual/ is allowed in the runtime space or not.

I maintain that it is not and never has been supported. I'd like to be able to
continue to say that the "virtual/" namespace is DEPENDS/PROVIDES only. I
therefore suggested the small number of problem entries that sneaked into OE-
Core get fixed. I'd actually got further and suggest we add a QA check that
errors if it sees these in RDEPENDS/PRORIVDES.

The change is focused on us being able to clearly say "don't do it, it isn't
expected to work like virtual/". The alternative is just more confusion and docs
which can't be as clear.

Cheers,

Richard



