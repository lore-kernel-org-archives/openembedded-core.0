Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.1180.1619551071202160945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Apr 2021 12:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LxIExPBM;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: petr.vorel@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id q9so6412180wrs.6
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Apr 2021 12:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=YBqrvRHstnyKjIfMKjNW1uMAPt8dnf+M/O12inXMBII=;
        b=LxIExPBMuBirkL3nXpWpu656VW7GRvHO0gxAbHn/tqEn4kJjTMfRV3hDkymXXcwyq+
         KxZJ5BerRuqMmfvFZGMn/0xEbRQcBOfgPbIxS3nhLr27obrWRSA8CCP23pQBGiTbtH5p
         FzKi31H54XNL3xwg9D0LBowUR5sOv0l6p8PdkT5sr3gLgVMA/j8vI4Pjpt2OGQqQ8mAY
         +TgrR71Pv9lEXthmfueyG2c7K7YxeMfWYo2MooXf2o09+ad0gDOU4IfGiqFcZO8eoAan
         M6i1qzdSvgM7M2YMmlKnQ88jfryugq1lDQjzt+HN2zsRSHZXkctBfQFQmBxmUc0E5XjG
         OOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=YBqrvRHstnyKjIfMKjNW1uMAPt8dnf+M/O12inXMBII=;
        b=njk4Nmpadrg5I/lnWV5dLr4GKs8s5N1R9ayaLtZQnVXhf335T8sjlEsqMLBhWQFKym
         J9Vc6i8DHTPx2QYDEiMuwkA8JivqzNIIwIu+s3MAx43b6a2npwOuVW7CudectDJ14tZU
         xzSrHsvzVbpAJV74/TWbCC64j1D9IaB0yQAZGEy6XWxxNGeobjabNGZKWVzs0L9KsRTw
         CyFalEzcUGm0vHxlGVkDEUuZIhMaVJpwOXSMU4AVLD+0xRkXsOI9PR7rGUs01MXWSj/s
         MKOtaHsFxvOaUl02iNKR+m2YLBkFiJRPlnLMDd5YuvUGqsVf6wUNlsRHZt0vvM8Gws9g
         QidA==
X-Gm-Message-State: AOAM531OdDPxpI4U7PmEl/h+uqhdix+zYg4ubVqy9dIX0Oh7sWhmj4M7
	FwvQG7Ty3AgT82EgXDtRa4E=
X-Google-Smtp-Source: ABdhPJxezfTbgAuOHAlfJPuFlpNbdlADo8Wvmk3A11q4/eTIIcmUNvV6lqm9/8Y5sQDZYw2m3XN+HQ==
X-Received: by 2002:a5d:4a02:: with SMTP id m2mr20631008wrq.188.1619551069697;
        Tue, 27 Apr 2021 12:17:49 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id q128sm3769452wma.39.2021.04.27.12.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 12:17:49 -0700 (PDT)
Date: Tue, 27 Apr 2021 21:17:46 +0200
From: "Petr Vorel" <petr.vorel@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] LTP drop MUSL specific patch
Message-ID: <YIhjWj/HwYya8k1l@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <YIcMLMtsNSTlinqq@pevik>
 <CAJ86T=VDx=w4FB34BZhsGcFYO8zAJ27kE6t9d_3xbBvkpOPDfg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VDx=w4FB34BZhsGcFYO8zAJ27kE6t9d_3xbBvkpOPDfg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

> On Mon, Apr 26, 2021 at 11:53 AM Petr Vorel <petr.vorel@gmail.com> wrote:

> > Hi Khem, Richard,

> > I'd like to replace MUSL specific patch
> > meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
> > with just removing broken files. We use this in upstream CI for Alpine, I ported
> > it to Buildroot [2], where works well. It's better because it does allow to
> > handle MUSL without rebasing this patch.

> > I was looking into the docs, it looks to me that do_configure [3] might be good hook
> > to add it into. But it looks like by default it contains oe_runmake clean [4].
> > Or should I use different hook? And how to find the default content of chosen
> > hook? (if I need to extend it, I'll have to provide the original as well)

> Changes to source files, including removing them, should be done as
> part of the do_patch task. Since do_patch is implemented in python you
> can't simply _append shell script commands to it, but you can add a
> shell function via do_patch[postfuncs]. If you grep for
> "do_patch[postfuncs]" in oe-core you should find a few examples.

One more question: how to make this function MUSL specific?
I noticed some functions has suffix "_libc-musl" (e.g.
do_install_append_libc-musl), but I guess this would not work for
do_patch[postfuncs], where I specify the name.

Kind regards,
Petr
