Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC06E6FE51
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 15:16:48 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.124.1695395806703429803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 08:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eKJMDS52;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32003aae100so2604600f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 08:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695395805; x=1696000605; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rkS1mGPjLA/r9ZxPa3qBUDlo4br+m+qup+IkE2Rv/nc=;
        b=eKJMDS52y4ItobTxMqmhB34VLjfVnLA4WlnLyGDjPeVqFJHuZzTqfm02a4B8llNyzl
         OZJx8wvfFSYPf+Bidhv0PhGga/hUpOltLtFeWlagIQNEeQF5Nk53iD0340F0Ru1jjhyv
         V149i2XtoeGt+9b4922sGINrvvrrCZf3/rxPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695395805; x=1696000605;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rkS1mGPjLA/r9ZxPa3qBUDlo4br+m+qup+IkE2Rv/nc=;
        b=RPRXg0riBRPp3ps19j20e/J/XYx6iCUSSAhC5U4whsF4cjV5qE3mHr3e8QQpbD+SEb
         aLaEtlCtykdvROn6o9K7bmj7/Q5ieMhL/J+iNTfXK5BhRSqSFLr/iqVijeDsmHnhtpq9
         0PVpe9Vdj4fxlzytGHvmRJOKSFzAyi55dGIaYEwTsxaA3IqlzulkS5zADnL23Zn9DKCj
         gVDgn4X/UtTMpeEPsLDoal5nO7jJICYKaB/H4GxO5HDy2ugqa+qokh9iacFiBswNJYgL
         2yYiiSYlfU5OLvIQOZ3mXSQFCFwAoPHD8/61YK+xu6IOZWPJIj1LgdqJyA0two23PdGi
         doig==
X-Gm-Message-State: AOJu0Ywmov360ejHs2j2gdSLox2+L6i52uzSRFUGIfsBa6WngyuXPchw
	IEA3dJhB1aY9o3CIkQcsn9X3cg==
X-Google-Smtp-Source: AGHT+IEKdHf7hjg9HspGlUhGSQJXV4HF7PD1g4H2iuQFN98ElAAMTvT6N1P0g+jvUCmyEAWeoKtDPA==
X-Received: by 2002:a5d:50cc:0:b0:31f:e02b:18ae with SMTP id f12-20020a5d50cc000000b0031fe02b18aemr2157687wrt.24.1695395804957;
        Fri, 22 Sep 2023 08:16:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd? ([2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd])
        by smtp.gmail.com with ESMTPSA id a2-20020a5d5082000000b003143cb109d5sm4672432wrt.14.2023.09.22.08.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 08:16:44 -0700 (PDT)
Message-ID: <b735592296f29ef9f60dc9a7249d1c180a035a32.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] musl: Drop MIRRORS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2023 16:16:43 +0100
In-Reply-To: <CAMKF1soqXrRMfeFt6Gk-w9GfFN3CjjFW87qOeBi0F5Bx3kuvJw@mail.gmail.com>
References: <20230922011520.23704-1-raj.khem@gmail.com>
	 <2d66ceecc50d6a5041963c1afa9d55858c0e9bfa.camel@linuxfoundation.org>
	 <CAMKF1soqXrRMfeFt6Gk-w9GfFN3CjjFW87qOeBi0F5Bx3kuvJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 15:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188122

On Fri, 2023-09-22 at 08:10 -0700, Khem Raj wrote:
> On Fri, Sep 22, 2023 at 3:11=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Thu, 2023-09-21 at 18:15 -0700, Khem Raj wrote:
> > > When using mirrors fetcher gets into a weird state when shallow clone=
s
> > > are enables.
> > >=20
> > > ERROR: Bitbake Fetcher Error: UnpackError('No up to date source
> > > found: clone directory not available or not up to date:
> > > /mnt/b/yoe/master/downloads/git2/git.musl-libc.org.git.musl.git;
> > > shallow clone not available:
> > > /mnt/b/yoe/master/downloads/gitshallow_git.musl-
> > > libc.org.git.musl.git_79bdacf-1_master.tar.gz', 'git://git.musl-
> > > libc.org/git/musl.git;branch=3Dmaster;protocol=3Dhttps')
> >=20
> > That sounds like something we should look into and fix?
> >=20
> > I don't think it makes sense as a justification in a commit message.
>=20
> I tried to do it in several ways and somehow fetch is failing. Only
> way I see it work once was when removing the mirrors and rebuilding
> after -ccleanall
> see - https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7=
836
>=20
> if I git fetch these repos from any of mirrors or upstream clones work
> totally fine but git fetcher always complains. No idea whats going on
>=20

Please tell me you're not running -c cleanall on the autobuilder
infrastructure?

Cheers,

Richard

