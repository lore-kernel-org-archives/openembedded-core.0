Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0005C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 17:10:17 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.112.1671210611293108609
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 09:10:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JyKUUSTQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id n63so1542492iod.7
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 09:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ASkSMIaw1l5Q85a7pncyfKS4mn8KdXHryCJjCPdQjRc=;
        b=JyKUUSTQrAdShHfqDA/d7qQQh5UsUN7G5XnipBmuOniyDKlILrNXrBEZT9/e1KmzDG
         bIAuScEu0ESXXVS9wNtBrke+3oJLCUtl+vqp9zdTAEiojRDuHNr+JGhNHPo78CxQpm2g
         HummFNlQsTfg1/guqkT/SVX/qMnuL9tilEBl0HZfuyHCZrjR5N+J/jIQJtEoxLfdfFdA
         YX4wQ8cUvsKDT77xeO0YqqXswaTPAwW6fMkgBfs7MWkx1jWkWvul1yJDrbEJ077p9WT6
         cF/nV+u+RaEXWH+9/L9TELxLzdDDIOd2xE40vWEtoKK5zmGMOmbZFxEHEjYpD7yx1QpS
         U8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASkSMIaw1l5Q85a7pncyfKS4mn8KdXHryCJjCPdQjRc=;
        b=26E/FsGyfDRZsw/KZxswU7CNcJAWsKMB9yhUJ2RYfRsRidpdsRFzA9ndkkHU8yv+nP
         r8Xr86jsgB6LSzyZKhbG2MgiTuBxkG7/eDGg6v71FJtYmjeptg9ukkvC3GPOOu4/Bgyr
         4tzO6K6acrh8d7enBIq0gIwvHWZ6Hp2F1V/YLSJyutHJZK4TOizsQlJm40xYGpQg0mey
         trdEDhunWXDCfojrlchj/04ZtlgaTqLSc1ZKeWMqO9yIE848Tdun7ShihgbWTxXyMe5L
         lavzJ9TZgmQh24cl65uTFqvNmxuu02rdmUDzXzukqj5V1X5LfnJKlasERScsp2lf88E6
         z/+Q==
X-Gm-Message-State: ANoB5pldly2UfsBf66jNoobGkOpEzQtsCUqP+MWrLvAX7M17fE1r/cZH
	5rKp0ANJTWzR8vxuSwvOtRu4fmrxJ3GOcUHAm2E=
X-Google-Smtp-Source: AA0mqf5yWM0v8ukWawQgDC2hXYf8DTPSkKMnaUlPCOLWxZi7ZccEebjwjsgHFrH/XIOwXb3X7HixDy8Pai8C3qts1eE=
X-Received: by 2002:a05:6602:2817:b0:6e0:339c:cfed with SMTP id
 d23-20020a056602281700b006e0339ccfedmr5934644ioe.24.1671210610633; Fri, 16
 Dec 2022 09:10:10 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5R6p-cWBUDVtULZou_1XSae4AnJRmEgr9pw6ORZ-fQpjw@mail.gmail.com>
 <56cb8d9eb90734fcb59851040f5ca9d7ed0d4f7c.camel@linuxfoundation.org>
In-Reply-To: <56cb8d9eb90734fcb59851040f5ca9d7ed0d4f7c.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 16 Dec 2022 17:09:59 +0000
Message-ID: <CAO5Uq5SpDgXNzJ7cN0mzmXEq-FhL2=aP0SUQiJR6zQd08Bm0Og@mail.gmail.com>
Subject: Re: [OE-core] Target rust
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 17:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174761

On Fri, Dec 16, 2022 at 2:16 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-12-16 at 10:42 +0000, Alex Kiernan wrote:
> > Does anyone actually use target rust? I thought we had some test
> > coverage, but I'm failing to find it.
>
> A basic hello world on target:
>
> https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/runtime/cases/rust.py
>
> but we could do with something more along the lines of:
>
> https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/runtime/cases/gcc.py
>
> adding.
>
> We do also have:
>
> https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/sdk/cases/rust.py
>
> which are basic tests for rust in the SDK.
>
> > After the thread on stable/beta/nightly, I started playing with it on
> > target and so far have:
> >
> > * we're missing the rustlib/<target>/target.json
> > * we don't have gcc/binutils in RDEPENDS so there's no linker
> > * no libc-dev/libgcc-dev
> >
> > I'm not sure how target dev tools ever get used/installed as it's not
> > something I've ever touched, so maybe the last one/two are expected?
> > But the missing target.json just makes rustc bail on startup - looks
> > like 16b4ac3f558f ("rust: Enable nativesdk and target builds + replace
> > rust-tools-cross-canadian") might be where it got dropped, just
> > checking.
>
> On target rust never worked.

I don't know if it ever worked in meta-rust - a number of the
fixes/patches I came across from that time suggested it might have
done, but it was years ago.

> I made it build and tried to clean up a
> variety of things but I moved on to other things before getting to the
> target toolchain/runtime testing. Patches to move forward welcome,
> especially with tests. The work I did was to at least try and get
> things onto a proper footing for the future.
>

I'll have a look at some tests, since having figured out how to make
it work, I'd rather it didn't regress, even if I don't actually intend
to use it!

With the target.json patch I sent up, plus gcc binutils libc-dev
libgcc-dev added to an image `rustc` on target generates working
binaries.

-- 
Alex Kiernan

