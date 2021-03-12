Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web08.5196.1615534412375641559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 23:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YxT1EOe9;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id g185so23391973qkf.6
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 23:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Dxp++GyGwPWeW02m14ou1y6ezPH2d1h3kSCDAjlpJY=;
        b=YxT1EOe9XhRjX26mwPY1qw61BDiytWOCbp0IFsGNNqlM+EN1beGJJ9JvbqXsNgJQku
         iBn8nggHYkdJOkfvG/hkq6GBOoOfWCllrDo55LnvC9y+amCs50j7Bi7YdUKGV/5lbZey
         5V+kgWA7A2rlXrBqY0o5nq+6mYSKSvQCjPWsImuE7Bb6DAPoSsfAGv9ioEyJzNlIO7Yo
         Sd6YjtFMleYrKLA0Xf3tFLlYjz+1ZdPG9K/olQkRdib9fD144r0fUtLJyMThEkxnv461
         gvEhHEyyi0h/yXoTFW6SD94uqDaxDrhuJUvtbslCr5jV5AGXpq7SZmrmlsZE0glVcrzJ
         J/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Dxp++GyGwPWeW02m14ou1y6ezPH2d1h3kSCDAjlpJY=;
        b=Rib6zUR3SKCJy4BTu09XkhhPfiYUbY/yypSNUpBunGj6xgseri/uOr9u07LoMOa50F
         lWPMLrJEt2J4LogzVZ5rstDT06hrUiefyftHZzO1YGDwESt0wwHetVMQ9g4oNAeNPP8R
         f70LhU0fawFYJnkx8Pc0tL6F5yyuSawzXAnv24ZiHLX/seoiKkScPS5/LezzsuOd0jmd
         rfPMoywTF8axYgrctLVOLxGDvAhYJoo3SXXIcsAKjEZXnAcoM1VoFYxQGF8Pl1t613Vi
         NwFasEO+c4KgwlA4JDvjBcNEuNbC+hxd9so2tJ+n4TwyZD3ML/3/jtEpA8I8VpLak+cc
         HG/w==
X-Gm-Message-State: AOAM533RuDbVYhyWupWB9qKG+OBva92ig3Kn0YZPNeXritUemGJAgWnu
	fNHnxwHS1bxtJO3SMTFAG7X3Oa9xS5es4jyWxjY=
X-Google-Smtp-Source: ABdhPJwls6ndx2euxil9fuKZEMtepd542u/khTeMlzWJNENc01Mm4x54AOLhBkOVnKGpNpwlLEoYGIM1DYob5CvyC1A=
X-Received: by 2002:a05:620a:124f:: with SMTP id a15mr11234381qkl.125.1615534411342;
 Thu, 11 Mar 2021 23:33:31 -0800 (PST)
MIME-Version: 1.0
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
 <165E1F647C435468.32571@lists.openembedded.org> <cf285d04-d8e1-e3a2-25de-9c3f02ad0678@topic.nl>
 <086cde14-14c7-0c28-1cc4-33156b45bf0a@windriver.com> <9af0d495-c07f-2ea4-4084-bb24fad59747@topic.nl>
In-Reply-To: <9af0d495-c07f-2ea4-4084-bb24fad59747@topic.nl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Mar 2021 23:33:05 -0800
Message-ID: <CAMKF1sqj+tfjzHDeJbaNjeg139CQgNKvhrb0gejDbuxk4TN-LA@mail.gmail.com>
Subject: Re: [OE-core] GCC crashes on aarch64 since gatesgarth
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 11:22 PM Mike Looijmans <mike.looijmans@topic.nl> wrote:
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
>
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
> On 05-03-2021 00:32, Randy MacLeod wrote:
> > On 2021-02-05 2:49 a.m., Mike Looijmans wrote:
> >> I've been doing quite some tests and things last week, my conclusion
> >> so far is that the latest gcc seems to trigger a bug particular to
> >> this CPU. Maybe even this particular batch.
> >>
> >> Hours of testing found no issues with RAM.
> >>
> >> I've also done huge amounts of builds with zeus, no problems.
> >>
> >> Then googling for "illegal instruction gcc ryzen 1700" reveals quite
> >> a few threads on something that sounds suspiciously similar. Though
> >> it makes me wonder why I never encountered it before, since these are
> >> all many years old. I did try a bunch of the suggestions done there,
> >> but so far no luck.
> >>
> >>
> >
> > Any update on this bug Mike?
> > Have you opened a YP bug? If not please do.
> > I'd like to see if the problem still happens on master.
>
> Interesting.
>
> I just built the 64-kernel using OE master and no crashes, everything
> went fine. With the gatesgarth branch, it'd crash at least two times
> during kernel compilation.
>
> So something has been fixed since then?

can you try by disabling uninative ?

>
>
> --
> Mike Looijmans
>
>
> 
>
