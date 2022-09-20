Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB9FC6FA8B
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 12:53:38 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.11446.1663678407848539063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 05:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N8LmDT0q;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id l65so2635366pfl.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 05:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=pvWIpV9KMPVliLw1P/ACuFwNbJgzMCB6a1hgVgvsQX8=;
        b=N8LmDT0qP40Bolk313fu/Xga/iqMrPG+DT2wMzbblOrYl998qSAHY7VScyiIkLZAE8
         ogv6/h7GqUlyBHTSj/wDiRZ5GSkcqqXTxNFnV6gfymcJPigCATH+uFe1jgIZcHaRDhnz
         jbZplgPrsvOZ9qnvvE53Ozs4gSyHMam6Xk9/jCDu6EIBpBoy4+TjSPQ0VColiil3vOrT
         WwuzQ1uiJ3DWmgBrJ59zfMfBqOv8vhdaDDNPEue9su7M7jR8rTSWhz+NdrzfWML6nxl6
         cGWz8uOCGutWEq3cK2eagsAbTWlZf+uCvofY+mOvlEOYcfD05jaZU1mRlCw2XxruKDJV
         3eFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=pvWIpV9KMPVliLw1P/ACuFwNbJgzMCB6a1hgVgvsQX8=;
        b=2G1J1aJzfq+Gc2fQe4j9nKmjb82XU9q7Vyk0xG1RFUqVdPOgYmlcloETN2ZzeTrTDp
         oRm+mMNpvF8hcFHI7ygKWEzAC3Hoy6ur+VJRrbUrWT5YLo7+xnW4M30gK5edcIlRNL+Z
         LC2scDanP59dj4w8/sPiP8eaYT7YuCQLVGud8XCUujYjtUn70pSH03xx8vo/GujDvjSb
         jEJ47SC7wVOp5yTqSrrk5n5ILBKj1vxQ5i1auAQOGDTPkaecau4NvlBihLp9dERF7GQw
         AHQdzonpiDGRWw8vKs22uPZP61USNHDCPp3Nqeo3EWVcEs6ww8Kpru/yIWL0BvQfWDhq
         oF1g==
X-Gm-Message-State: ACrzQf3HlF4NtBmuakBwoy79DmAo2syEe4TFD5wo7087Omz/uyJOihBv
	c4/invhQvssEAq5VcCIU/NBfnBRBzkkblHpHknA=
X-Google-Smtp-Source: 
 AMsMyM6Z6e/KZigvYbzrr5dQuFzkKLHKF0tmUAM65TBAe9RSDmvt/52xCxe+pqGhSmJishouXKKU7chzmVVdC+ZbHbI=
X-Received: by 2002:a05:6a00:84a:b0:542:4254:17f9 with SMTP id
 q10-20020a056a00084a00b00542425417f9mr23516032pfk.75.1663678407197; Tue, 20
 Sep 2022 05:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1663597409.git.bruce.ashfield@gmail.com>
 <029dd3e7238551e5ff6c687a001988485c6a3687.camel@linuxfoundation.org>
In-Reply-To: 
 <029dd3e7238551e5ff6c687a001988485c6a3687.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 20 Sep 2022 08:53:16 -0400
Message-ID: 
 <CADkTA4Oon-WbV8x+TTfhDH2eGo6yjoQpxPsE-RXuqU0u7OWx0g@mail.gmail.com>
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 12:53:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170898

On Tue, Sep 20, 2022 at 8:22 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2022-09-19 at 10:28 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Here's the next set of -stable updates to the active reference kernels.
> > I also have updates back to 5.4 that I'll send to the various stable
> > branches shortly.
> >
> > I also have a couple of kern-tools fixes. One to solve a problem reported
> > on the list about some directory structures (typically created from KAS)
> > to break the meta-data phase of the kernel build. I've fixed that issue,
> > then fixed the other regressions that fix caused, and have everything
> > passing sanity. There shouldn't be any fallout, but I'll be keeping a
> > close eye on things.
> >
> > I also have Khem's MDIO configuration change in the queue, along with
> > a previously hidden kern-tools feature that allows it to not warn if
> > something is 'enabled' (y or m).
>
> I have a patch in master-next I'm testing for the perf issue. On
> testing that, this set of config warnings became clear for poky-tiny:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/6157

That's very likely due to this change from Andrei :
https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=yocto-5.19&id=d334505d98a85ffe7549026d10e43cccd897e19c

Was that a qemuarm64 configuration ?

Bruce


>
> Cheers,
>
> Richard



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

