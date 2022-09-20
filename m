Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3187C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 20:30:16 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.2181.1663705807275164690
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 13:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VUUypDIA;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id jm5so2579462plb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 13:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tdHKSnLPzDQYZyXGYUVF51Y0cAJl/mNCeSAybVbPprU=;
        b=VUUypDIAjVCG2n6NkbMAH8ai6Kd6/ipqAjRVjHBQenVqCo87FY0dOfcC3Q7q91ypXh
         KxGjexIuK58rB1N/dI5KBR3OG8dKG6yXAZFskR9YxmD5fsd+EHigk5qNP4v0i7tykqC3
         2JzpFF1v/1b6wA2KZbB2DIm5DnSMUSV9txSLY4JmvXLSzF5B6SkKwkCtsBnvi5cf54D2
         VQXsB92/0/+teAJFGm6N9u96SUBmYISbyW47IIL31CGPFlZviPUv6yi1w+6ep6zRp+ZP
         +a9ikWMufynFVh27o/lsNSlUyHrN6YdmfVbJAy1Sq8MtjHhbiNl5GNS9j6UZBH7laHpz
         pzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tdHKSnLPzDQYZyXGYUVF51Y0cAJl/mNCeSAybVbPprU=;
        b=CynhPU5dxszP0CbH/2EPb4w3H76vaj2rX0U+2l1ynUvg/355pK01uwGRT2Hl2AimnA
         kItVUYLLx4oOGvLJKntzVKJR8c03gvxcD+bXnC5TMul/8gco+wcMaf2u0d9SiT3Y4+df
         LXqUkf994lFJFXGof8WvmuATljtSXQgx+duFNOjaSO/SWRtw1Y2JG0bfzFCLEKNZOUac
         3/dGD9xOnrpK6ngEotkQZ+HXljkI8eIcsHvGlvD8s/ux4fgtqsBLFx3O+SFE9CJb3ryv
         kENy7TDDvhFv7Dr06KbLOlLuqgH+NYP3+c+SuO9x7/h7qg9l9GcdjiuKPUj/z3fgMhW7
         KYyA==
X-Gm-Message-State: ACrzQf2cFD5poHlXStWv3EoCvvoI3v4PDwYp/tLmWabI7zTSPBrHMRQW
	5FhbsiNzmt9ny9DOlH089sA/bM8c4aNwIE6olx4=
X-Google-Smtp-Source: 
 AMsMyM6zkG5PSW6U3SzvBm431NglkrZvNNVvh1SKJ285OEeoY1wRlArOJwDI8AqBvtfbZAHji6F6EUASLI2iwI4BpH0=
X-Received: by 2002:a17:902:aa46:b0:178:9ee5:c7f1 with SMTP id
 c6-20020a170902aa4600b001789ee5c7f1mr1364955plr.69.1663705806617; Tue, 20 Sep
 2022 13:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1663597409.git.bruce.ashfield@gmail.com>
 <029dd3e7238551e5ff6c687a001988485c6a3687.camel@linuxfoundation.org>
 <CADkTA4Oon-WbV8x+TTfhDH2eGo6yjoQpxPsE-RXuqU0u7OWx0g@mail.gmail.com>
 <aa9014096363f371afa9b472ea8fce3329d80eaa.camel@linuxfoundation.org>
In-Reply-To: 
 <aa9014096363f371afa9b472ea8fce3329d80eaa.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 20 Sep 2022 16:29:55 -0400
Message-ID: 
 <CADkTA4NM+u=ADmOi2=FLQWhJMtZ7JP+6__ivwHGX0tZGF0MxzA@mail.gmail.com>
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andrei Gherzan <andrei@gherzan.com>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 20:30:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170906

On Tue, Sep 20, 2022 at 8:55 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-09-20 at 08:53 -0400, Bruce Ashfield wrote:
> > On Tue, Sep 20, 2022 at 8:22 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2022-09-19 at 10:28 -0400, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > Richard,
> > > >
> > > > Here's the next set of -stable updates to the active reference kernels.
> > > > I also have updates back to 5.4 that I'll send to the various stable
> > > > branches shortly.
> > > >
> > > > I also have a couple of kern-tools fixes. One to solve a problem reported
> > > > on the list about some directory structures (typically created from KAS)
> > > > to break the meta-data phase of the kernel build. I've fixed that issue,
> > > > then fixed the other regressions that fix caused, and have everything
> > > > passing sanity. There shouldn't be any fallout, but I'll be keeping a
> > > > close eye on things.
> > > >
> > > > I also have Khem's MDIO configuration change in the queue, along with
> > > > a previously hidden kern-tools feature that allows it to not warn if
> > > > something is 'enabled' (y or m).
> > >
> > > I have a patch in master-next I'm testing for the perf issue. On
> > > testing that, this set of config warnings became clear for poky-tiny:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/6157
> >
> > That's very likely due to this change from Andrei :
> > https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=yocto-5.19&id=d334505d98a85ffe7549026d10e43cccd897e19c
> >
> > Was that a qemuarm64 configuration ?
>
> It warned on qemux86:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/6157/steps/12/logs/stdio
>
> qemux86-64:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/6157/steps/16/logs/stdio
>
> qemuarm64:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/6157/steps/18/logs/stdio
>
> so on all the arches we test for tiny.
>

I've reproduced it locally .. the fix is a bit fiddly. I'm going to
try some things tonight / tomorrow and will send a patch that goes
onto the end of the series to fix it up.

Bruce

> Cheers,
>
> Richard



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

