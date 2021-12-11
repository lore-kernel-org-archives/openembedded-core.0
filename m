Return-Path: <leon@sidebranch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47463C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 14:17:01 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.22070.1639232219005917471
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 06:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20210112.gappssmtp.com header.s=20210112
 header.b=aYm4MtZI;
 spf=softfail (domain: sidebranch.com, ip: 209.85.208.50,
 mailfrom: leon@sidebranch.com)
Received: by mail-ed1-f50.google.com with SMTP id y12so37564901eda.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 06:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iw/VgumCEMyHYlNFLYSfWPrB1AhFitXh6TFalGv+Mlk=;
        b=aYm4MtZIRDqSfJmpSCF639aAPHBfNFuPULB9XUIoF546cDeP5Sb/hsdeov+ti+Q0I2
         Mng2LtSN+XRmJXao3tfQa3PXNBu8lrZ5M0/FvqQ9pB3gVz9dQQ2MlwOi+2Tuslw8Q3k/
         GHMDWMVkF3jEuS5OAdFgbfPYx1zf+2uD4kRry1A4sinHzbK9ghXAmxVWsK3avyi7widV
         Z2kan3kWpSQmfp48Y3oPauVOKXdSdWbT3cmgwk+MZRyZV9GJ6dckusiiuWTHDR1G+73m
         slr0Xj2J8A0YY0mahk45X9a036MMh3b/uVeuDqVq9U3ExtMft8+tw2+c3oHjNEziAD6n
         EVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iw/VgumCEMyHYlNFLYSfWPrB1AhFitXh6TFalGv+Mlk=;
        b=WN3C7Jwbgab9vQAftYsX6s6LB4nw17oxRsnYOuD7jlGsBWyiaGeDoQKJBXnSJGEnyi
         YUBpv4LDdtv/H22Cr3PlMWaqGR0g40mioOgDq95pcSOEmhYYOhhG/iIyBW4tz4jx6y+x
         b44XMr+Q4ffE/UvWdxyC+xGewssgjdrQfYqHgjvAsEoFQEoTlGGPYyBsim6uR/DZE+zg
         mjTXcPsyKencJGU3QchPMR9YMlFlC1IO3mUaXnfkIYQ87ruOWu1M/m3TYO2nlqKR9EXu
         VVfYjCI+oSw+D8a9+jkQQJcv7uyK4wyasBWd2r/VFpK3PqoR+fi/x1K33+w0eY1kq7Fu
         XJpw==
X-Gm-Message-State: AOAM5339YINLLn0CGn4BU07bam92Ipk9VGfSt4Lv8gW13d+yIxOOa9IQ
	JLRqzCb6xEy06KBqE4urJ5ZU7uJRA/f0zY+i1AGeZpFmXUMgNA==
X-Google-Smtp-Source: 
 ABdhPJwvJwj//sVhJi6Y4UDrqT6USzyfbOMV6dR8nHBp+DoyxdFsLhXw4457lVHM3HAXexETGVyHb65JqfobNhh5yzQ=
X-Received: by 2002:a05:6402:278e:: with SMTP id
 b14mr47508279ede.354.1639232217012;
 Sat, 11 Dec 2021 06:16:57 -0800 (PST)
MIME-Version: 1.0
References: <01159b35-cec2-1b90-f11c-77f6991b32b8@ni.com>
In-Reply-To: <01159b35-cec2-1b90-f11c-77f6991b32b8@ni.com>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Sat, 11 Dec 2021 15:16:46 +0100
Message-ID: 
 <CAMjhiJifppMq6o6H4PftX5YyR-ZV3cYYiniSReA00YXpCXT-3g@mail.gmail.com>
Subject: Re: [OE-core] The state of DKMS in the Yocto community
To: Alex Stewart <alex.stewart@ni.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Dec 2021 14:17:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159567

Hello Alex,

with DKMS, do you mean cross-compiling out-of-kernel modules on the
build machine (that runs the Yocto/OpenEmbedded driven build)?

Or do you mean provisioning the target with enough tools to allow
compiling out-of-kernel modules there from source?

In the first case, yes, I can share such recipe for reasonably recent releases.

Regards,

Leon.

-- 
Leon Woestenberg
leon@sidebranch.com
T: +31 40 711 42 76
M: +31 6 472 30 372

Sidebranch Embedded Systems
Eindhoven, The Netherlands
http://www.sidebranch.com



On Fri, Dec 10, 2021 at 9:58 PM Alex Stewart <alex.stewart@ni.com> wrote:
>
> Hey List,
>
> I'm trying to work out the mysterious state of DKMS in OE-Core.
>
> Our (NI) OE distributions rely heavily on DKMS to (un)install our
> ecosystem of kernel drivers at runtime across our product lines. To
> facilitate that, we authored a dkms_2.4.0.bb recipe [1] back in 2017,
> which we have carried out-of-stream since.
>
> We tried to upstream it, and the patched rev'ed a couple of times [2];
> but it seems to have never made it into a yocto release.
>
> Though some other recipes mention DKMS passingly, I don't see anywhere
> that OE-Core officially supports it. Nor does my googling reveal anyone
> else who uses DKMS. I find that a little hard to believe, though I
> understand that it's probably relatively rare in the embedded space.
>
>
> @all
> So does anyone else on the list use DKMS in their yocto distribution?
> Are you maintaining a DKMS recipe out-of-stream as well?
>
>
> @maintainers
> If NI upgraded our DKMS recipe to a more recent version than 2.4.0 and
> submitted it again to OE-Core, would you accept it? If not, we will move
> it to our own meta layer and accept that we are unique in this regard.
>
>
> [1]
> https://github.com/ni/openembedded-core/commit/5789a27b68d95f3840bb8c4cb0d7b28d538c9a50
>
> [2] https://lists.openembedded.org/g/openembedded-core/message/100680
>
> Thanks,
>
> --
> Alex Stewart
> Software Engineer - NI Real-Time OS
> NI (National Instruments)
>
> alex.stewart@ni.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159558): https://lists.openembedded.org/g/openembedded-core/message/159558
> Mute This Topic: https://lists.openembedded.org/mt/87645999/1051774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [leon@sidebranch.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

