Return-Path: <ardeleanalex@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52584C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 14:30:25 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.8689.1646145024825078341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 06:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kq41rQLH;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: ardeleanalex@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id n15so11321360plf.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 06:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dr+6XOx0+xmx3xuPDDgAurJDT7cENhh0X8YQ8RU7fGQ=;
        b=kq41rQLHyMzvZg1bUjyGwYEEePsU4COBO3e/KvsxCNP8WHEOQNxtR5eNFSr7w4aJSj
         m4yShY/Ne55vjsXw6rM40uYRDqA+7ABOBJJFqFuTjZjSsT8Rqg5QFktmDzJCWkDmpVna
         DKBuVhmJkrPdAEdaHJo9W/3sExeR0vhA1BKxnrC8uI7Et3XgX354QMpeA4rkslT/rnVm
         yN6JgGE/XRWnGiIMJGeD7rb8ae1yV0qTr0AJ5VBNXTnk6nLungZgGxncbZKbXVjDPbfR
         cUXX7Nrc6lNqZbBVa9mBd+yij3VrG9+6vCGswbtspkOEM7pvpWvVIDZS5MVAMFqw5MQn
         H/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dr+6XOx0+xmx3xuPDDgAurJDT7cENhh0X8YQ8RU7fGQ=;
        b=sOflmwRBKfw1r5lmfQ3xPsq6KuM5gDb6BS5Sneh2WmArKc4a0eOMrSg7o4pFZQiUBQ
         Gd6DFU36SD83nlIDN3e1Phv3+CgYtxfjMDrkdYqNN6vMod74n5aso+ucnx96oFAN0ezt
         hAtecer0KUe6MFseOT6rx9TlU3Z8zN4Y6hGSOHvOq5J/OfMAUNSUjEBf0StNqIU0qa7+
         og50O3uZbSnUSLjYHjYoVeskSOuEIwwd8UwIrEIGmmMkQc3ky1v/mi56TLs73bfdRNuV
         PEiP7RRT3NerZs4BQFKnZZzCxt4/bIvZTdIDpwqd+2S1TnactG5xmQXxYHvsSkZXQmKu
         GrCA==
X-Gm-Message-State: AOAM530VVo62u75J5ZCgFVNJhZ/IXTCQIiJyGk/mmBddXM+x9uS5rZPu
	N2L6L5V2MY0Fj34pSwyRFTRUWr1oChdCXLCk/Do=
X-Google-Smtp-Source: 
 ABdhPJxpzvbXmt8FPkfrM5FZogojuhEZphAUZNxCth9dsueI2ceIO5IaVLVVxrtCEZ+A/2O+JfYAPkXt6nmM3AbPZBQ=
X-Received: by 2002:a17:902:da85:b0:151:8d9e:e31b with SMTP id
 j5-20020a170902da8500b001518d9ee31bmr941702plx.166.1646145024216; Tue, 01 Mar
 2022 06:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20220224153034.5140-1-ardeleanalex@gmail.com>
 <CA+U=DsrLoHsQKqVb06hqnL3UvHJotM5yxBYnvN7y7KM9Ec2tdQ@mail.gmail.com>
 <12d5c909469e4ced0ab136d0ca5f00cbe45567c7.camel@linuxfoundation.org>
In-Reply-To: 
 <12d5c909469e4ced0ab136d0ca5f00cbe45567c7.camel@linuxfoundation.org>
From: Alexandru Ardelean <ardeleanalex@gmail.com>
Date: Tue, 1 Mar 2022 16:30:12 +0200
Message-ID: 
 <CA+U=DsrXewjnaWp2DQM8u=V9AS49vGKcdt17b5kyZ8eth_8LOQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2] libsndfile1: bump to version 1.0.31
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 14:30:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162558

On Tue, Mar 1, 2022 at 4:23 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2022-02-28 at 12:32 +0200, Alexandru Ardelean wrote:
> > On Thu, Feb 24, 2022 at 5:30 PM Alexandru Ardelean
> > <ardeleanalex@gmail.com> wrote:
> > >
> > > It seems that the homepage has moved (for a while now) from
> > >   http://www.mega-nerd.com/libsndfile/
> > > to
> > >   https://libsndfile.github.io/libsndfile/
> > >
> > > On Github, the development group seems to include Erik de Castro Lopo (the
> > > original author of libsndfile1).
> > > Link: https://github.com/orgs/libsndfile/people
> > >
> > > All backported CVE patches are in version 1.0.31 (I've checked).
> > >
> > > The supported format page [1], mentions that Ogg/Opus is supported since
> > > 1.0.29, however that isn't currently added in this patch. And it may
> > > require libopus.
> > > And mp3 is supported at around version 1.1.0, but that version is in beta.
> > >
> > > This change focuses solely on updating to 1.0.31 and removing all
> > > backported patches.
> > >
> > > [1] https://libsndfile.github.io/libsndfile/formats.html
> >
> > Bah...
> >
> > No luck with V2 either.
> > This would require some patch to allow build without libopus support.
> > Since there is no libopus available, it will not include support for
> > libvorbis, libflac.
> > i.e. libsndfile will build, but will say:
> >
> > configure: WARNING: *** One or more of the external libraries (ie
> > libflac, libogg and
> > configure: WARNING: *** libvorbis) is either missing (possibly only
> > the development
> > configure: WARNING: *** headers) or is of an unsupported version.
> > configure: WARNING: ***
> > configure: WARNING: *** Unfortunately, for ease of maintenance, the
> > external libs
> > configure: WARNING: *** are an all or nothing affair.
> >
> >
> > Seems I forgot to check these extra configurations.
> >
> > Please disregard the V2 and apologies for the noise.
> >
> > I may try again with a V3, but let's see.
>
>
> Unfortunately we merged this as it passed the automated testing and there was no
> other review feedback.

Oh.
Now I feel a bit worse.

>
> https://git.yoctoproject.org/poky/commit/?id=fd2c86b06963345683ac5dc4f47f9da8e0c8c69d
>
> It does make me worry about tests here and means we'll have to find some way to
> fix this.

The silent nature of this build issue, suggests a few things to move forward:

1. Propose a patch upstream to cause a build failure if this
configuration isn't complete (i.e. all Xiph libs are enabled or not)
    It's their right to have this all Xiph libs or no Xiph libs support matrix.
2. For Yocto, we could add libopus, in the meantime OR
    Patch-out libopus in the build

There's also the option to revert this [now] and try again.

>
> Cheers,
>
> Richard
>

