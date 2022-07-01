Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3EDC43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:57:20 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.39486.1656687436842380319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T4YvoWne;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 h15-20020a17090a648f00b001ef3c529d77so5429196pjj.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zlJVSVHsZvXQ9as3yJvxTgGbF7LyXMjRsX2Kgyaz39M=;
        b=T4YvoWne8HuvI6J5qyXu7RnELH7/8Eu8Fm359B6fZx7BbdgbWcCnoJk5JS0DwB425b
         NoCAto9LOk4pHf22Wv4BjskBpRb2tAeDaIASfrJp002KYy246TJuzM9N9w1fXlUk/l5m
         R6J83kMHE0/ygAZxoxvN6MWK5/ceLhdbyVZ5avzKrdvVleWDWgQN3AAWkrQSB0r2arnO
         +P50x6gGof+a0FeXaJaCkkPvuELyfZz7CPQwwTggU+iKcjgeGqXm+QdrwjpLWX8ATGg0
         YbHIuZF/MOJFZeDMtQQAhvvmnCfpcDNEYYiYbd1SPjb+Gfqxb7fkoR51FysXZALeP/2R
         jT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zlJVSVHsZvXQ9as3yJvxTgGbF7LyXMjRsX2Kgyaz39M=;
        b=0g7eiLdnPdF3Oo4zLZVo5JsWGGgI+sfzCBM5QIV/tsVS7A9OVkgyTDAhEZOGjl8uO7
         3N4YbCUiaIF/F9taYH37Diz0ZD3wfGtpOofbNc7MC6tiqmH8YIOzU1EmZHGpZfr7/jzl
         u/e9KWV5u/REgA+vWUY4vOEUiInL94oXR0ZZUuFbLo0MMFsUY2jon4g3MCiCZbT5L6tS
         iPZSzw5eKeVGaYnvkUxPFLnvM7N2ZozsyV8JNV5Iy/S0rCIrBxUl7oex46riClD6USRh
         iXELHWtKYpVNm+uXy0ifZrjbnLlmCuQRXLmvQYTwvC+jb3DZ/yXUandcrsnFtBkbTV/Y
         iqAA==
X-Gm-Message-State: AJIora/brHP39HA6ybz4xG+ijBlisdijowl7MMjLBtQnNVlh4GBTq3FX
	2+7CiZRxQKlYgECAVhVs+5cVxz9CQIrjc0LcoHE=
X-Google-Smtp-Source: 
 AGRyM1tsPKxnCuwextsJvofCw+OctvxQmcFxvOT+ZBeY2tVaVAgiRm8sT0FrKpoCqRaF0Na9y19R7+iMVxDzDWYrsJc=
X-Received: by 2002:a17:903:228d:b0:16a:59bc:6132 with SMTP id
 b13-20020a170903228d00b0016a59bc6132mr20525149plh.126.1656687436196; Fri, 01
 Jul 2022 07:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656616115.git.bruce.ashfield@gmail.com>
 <16FDAC3178C621FE.2437@lists.openembedded.org>
 <16FDB5A16CDF6390.2437@lists.openembedded.org>
 <16FDB9E325C9E889.5468@lists.openembedded.org>
 <694b9d319c6fa7a57807a188e5c8b27992a17e76.camel@linuxfoundation.org>
In-Reply-To: 
 <694b9d319c6fa7a57807a188e5c8b27992a17e76.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 1 Jul 2022 10:57:03 -0400
Message-ID: 
 <CADkTA4NAgvcGGoWcFOSUO74i8Fp7018ONvzy0c5ghpGowM7Gvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:57:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167532

On Fri, Jul 1, 2022 at 10:49 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-07-01 at 15:10 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Fri, 2022-07-01 at 13:52 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Fri, 2022-07-01 at 10:59 +0100, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > On Thu, 2022-06-30 at 15:16 -0400, bruce.ashfield@gmail.com wrote:
> > > > > With conference travel and issues with meta-virtualization, I've been
> > > > > behind in sending this out .. but I have been queueing changes, I just
> > > > > wanted to be around in case something breaks.
> > > > >
> > > > > Here are the -stable updates and the start of my efforts to bring
> > > > > 5.19 in as the new reference kernel for the fall release.
> > > > >
> > > > > lttng-modules needed it's normal tweaks to work against the 5.19 source,
> > > > > but otherwise, nothing significant has popped up.  I have other parts
> > > > > of that uprev under test (libc-headers, systemtap, etc).
> > > >
> > > > Thanks Bruce!
> > > >
> > > > Unfortunately there was one issue the autobuilder found, a
> > > > reproducibility issue in perf:
> > > >
> > > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220630-53gdlqxv/packages/diff-html/
> > > >
> > > > I've not looked into it other than looking at the above link but it
> > > > seems some python paths are creeping into the binaries.
> > >
> > > This looked a little suspicious to me:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-5.15.y&id=18f2967418d031a390a5befe855dd0faa8af70b9
> >
> > Confirmed that it is this change. Not sure why but at least we have an
> > idea of where the isssue is.
> >
> > I've also sent a patch to insane.bbclass to change WARN_QA such that we
> > can detect this kind of issue much earlier in people's local builds. It
> > may expose issues in other layers but those issues probably do need
> > exposing at this point too...
>
> This breaks:
>
> override PYTHON := $(call get-executable-or-default,PYTHON,$(subst -config,,$(PYTHON_AUTO)))
>
> as somehow PYTHON is expanded to a full path, yet:
>
> override PYTHON := $(call get-executable-or-default,PYTHON,$(PYTHON_AUTO))
>
> this works and doesn't expand PYTHON. I have no idea why, it doesn't
> make sense.
>

urk. I'm off today for a Stat holiday (and Monday as well), but will
poke at this throughout the weekend to try and come up with ideas

first step, get geared up to test reproducibility locally, step 0,
find my old notes on the subject :)

Bruce

> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

