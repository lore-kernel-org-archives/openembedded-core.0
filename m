Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web12.19979.1590694224658751629
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 12:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y8S8EuRX;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id r10so64466vsa.12
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 12:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oorbRpXxdZFcfa77KHga6BCcqG90XGhVsDcEh+nnU9A=;
        b=Y8S8EuRXYDXG6XVLSl79LIrdWJU8t/rVfwyj9j1CgD6ycqX3KI3zPQV1oefvQ8zGRQ
         3jSISSMJC7B2JJWmN/br5OHkgYaXuoyzVsUdi0gwRuSZoW1Wb78UCprsvqBHL1Shyxtw
         kX6BHmCF6mFuS00kKxF2JpNOLttINGmSU7a5NnhOwClahq+d3nYvzrje15pVPptZ986P
         glmgUT1m/csgp8H7v8fSEWubBV5kqIKI3TE5GqTysOa3K0nAmuQS7puQvfQAjzyGjVK3
         E9EvbAFgCVN1GUmu6qy/3iB6K8r2cbjLgjTRsPUElqMAJZJUSiaNjC+d9qKw/5epLTCP
         qYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oorbRpXxdZFcfa77KHga6BCcqG90XGhVsDcEh+nnU9A=;
        b=LZLGPoeuyDSOBFh7mNmz+92EAc3WHaV8C9GhI+eTzc0UPhVIqBHjJw20Ln53mLfqBJ
         GtldNi6f1xbAXBKXcU0NwRi/vmdx5CaXqmlN4vTamilxgMRB3AJ0V59HDapWLavo/4yh
         Oj9sdyMyScKOU/3Y78JsQOdT00mvbaRm+tjhM9E8CYy3bJ/GzWN7iGVhmZ0XergOb2rQ
         TlvOZa8pXVVsDD1M9rK1V8aYiG4iwUz7q0dU/pNki0QsY5zLXc076Wfs7vME0orFM5q5
         qAx6WgjxCo/PBWcFcRWM/ta5VCVM/RG+0C5HYrXcrIl1Vpv3gpj7tQTN0xj5kLSmQzj1
         RK9g==
X-Gm-Message-State: AOAM530RcGJYlVN/DfrFEDWE2Ll1mK7ZaAaFqoEmyI7zcSxJgeDVYYx3
	k0EYct7cri7W13fdoZ2y4YcS2cwpcHj/tw7IyQQ=
X-Google-Smtp-Source: ABdhPJw+WZw2gyUFNq4pb+SUbGMKTXDz1L2ixCu3jgNofyJG0KwVhcWICYgd4Y1NO1YZ+WUNf0IC6gxByB5XZaBxGSk=
X-Received: by 2002:a67:f356:: with SMTP id p22mr3583085vsm.130.1590694223656;
 Thu, 28 May 2020 12:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200527155011.3165976-1-raj.khem@gmail.com> <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <20200527231145.GO17660@denix.org> <f8ee3144eaa92a32d6661f397d7042da9a7db46d.camel@linuxfoundation.org>
 <20200528133912.GB12536@localhost> <CAJ86T=WmE-3Q4Y4ezZs56RRbZ21P=tomBHiSpzyyir_j6wV27w@mail.gmail.com>
 <20200528190428.GA996@localhost>
In-Reply-To: <20200528190428.GA996@localhost>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 28 May 2020 12:30:13 -0700
Message-ID: <CAJ86T=XsWpXH=UwEc+T_vy3ddKK0C0MOghk0hR3SNabQjmnL+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
To: Adrian Bunk <bunk@stusta.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Denys Dmytriyenko <denis@denix.org>, 
	Khem Raj <raj.khem@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 28, 2020 at 12:04 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, May 28, 2020 at 10:38:15AM -0700, Andre McCurdy wrote:
> > On Thu, May 28, 2020 at 6:39 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Thu, May 28, 2020 at 02:20:02PM +0100, Richard Purdie wrote:
> > > >
> > > > Right, external toolchains I can understand having specific version
> > > > requirements. What I don't really understand is external toolchains
> > > > would come with their own headers in most cases I can think of?
> > >
> > > What I don't really understand is why kernel 4.1 was mentioned
> > > in the submission.
> > >
> > > At kernel 4.1 times the latest gcc was gcc 5.
> > >
> > > gcc 5 is not even supported as host gcc in master,
> > > and target builds are only tested with gcc 10.
> >
> > Is that an argument that users with an older vendor kernel should not
> > update to newer versions of OE? Or that OE should provide older
> > versions of gcc (in addition to the default) in order to support older
> > kernels?
>
> It is an argument that ancient external toolchains will anyway not work.
>
> > And where does it leave OLDEST_KERNEL (currently set to 3.2.0)?
>
> OLDEST_KERNEL is just what is passed to glibc as lowest supported kernel,
> other OE components might have higher version requirements.
>
> > If even kernel 4.1 is too old to be used with OE master then
> > OLDEST_KERNEL looks like it should be updated to avoid giving users
> > with older kernels false hope.
>
> linux-libc-headers are the headers used by the C library in the
> toolchain, this is unrelated to the kernel running on the target.

All your statements are either well known information or already
explained in the thread...

What I was trying to get at is why you felt that bringing up the fact
the kernel 4.1 was released at around the time gcc 5 was current is
important? Presumably because you don't think people should be trying
to use kernel 4.1 with gcc 10 in OE master? If so, then the logical
conclusion is that either we should make that clearer (because it's
not clear at the moment, especially for new users who don't fully
understand how OLDEST_KERNEL is used) or provide an alternative (e.g.
older versions of gcc) for users who can't follow the latest kernel
but do want to follow the latest version of OE.
