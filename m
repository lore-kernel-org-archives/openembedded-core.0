Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9D5C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 15:15:40 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.39663.1656688536662696430
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 08:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DWnWNWC1;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id cv13so2895049pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 08:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8w2xQCMA5uxAz0fny51bMoOv0Sd28XmoChLV0S5cpSA=;
        b=DWnWNWC1/RodKIpTYKszq6y8qy1mjn+UR9Mq3rfmVfiz4Ss9eB+eThFXa50G/TwP8z
         5dSJlPNiluEabbr1VetjaavqKmXtKNb9Q19T/kgzfyOF0ogAcCzHJzConaYA4/cCa4bI
         yFjITgi+lxNHsOf3hRbwARQMgyCQn62tvaf1vkClSPdPMYtoEbLDJHlJKQ98ATmdyzNR
         4TbmljRg0xo07crR14n11sB54S74OOFb9Kzkr7E1wIfexysX/fmUS8TX5Idxyf6lvDQO
         bKi2GWP3K0VPHog74uXY8hp/Eq0v31EZE4ZrB1PQhL4dKuZIGt4xWJn7gb1p612LbZ6S
         VF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8w2xQCMA5uxAz0fny51bMoOv0Sd28XmoChLV0S5cpSA=;
        b=nkruwqgNfLtirE/TWPUW6Y9RqrwkXwUEPNDQ9vZsRig3mSDED1ygn3TkoIEdvuevcl
         rdJb6nW2Sk6lP2ZxXiAZKXISln50e5YnN4Ky3wTzXBg3cYILH09tI4GiX589Rhhkhy0L
         00sbC+c/m165Pz+LdmVOYbBhwmM+i55wIqGIQzziGWuym0Na+jXV2Zci3jDhh4vjAAsC
         asJH1pp7KkUxrEg+KHN/KOAUlPNX/M+08NyOqXRFkK/Lw0c0uIyY1wrWnd566xrjjoX7
         zpdcWRsrqapHMi8ml7GI6iDbVd+NQuw5njLnNCEZq1KdKjvrmQxrOfFDStsY4usp85SW
         /A5w==
X-Gm-Message-State: AJIora8vWB7xpuqNReFSPqalrkeVtfjGGu59N6C8REmKAmSed5O9aLBL
	kfuPuWShWiKB3uK5zcW9o7D12pulGCXkZq0jbWI=
X-Google-Smtp-Source: 
 AGRyM1v456FcOcLghW8xRLE7pKDCeRqfLqQyhdY/OyNtyZONwrs3I9x8YHXh1s8/8BSyltBdfLi4Z7rZCF9OlW2iUWY=
X-Received: by 2002:a17:90b:1808:b0:1ec:9559:3060 with SMTP id
 lw8-20020a17090b180800b001ec95593060mr19534347pjb.163.1656688536000; Fri, 01
 Jul 2022 08:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656616115.git.bruce.ashfield@gmail.com>
 <16FDAC3178C621FE.2437@lists.openembedded.org>
 <16FDB5A16CDF6390.2437@lists.openembedded.org>
 <16FDB9E325C9E889.5468@lists.openembedded.org>
 <694b9d319c6fa7a57807a188e5c8b27992a17e76.camel@linuxfoundation.org>
 <CADkTA4NAgvcGGoWcFOSUO74i8Fp7018ONvzy0c5ghpGowM7Gvw@mail.gmail.com>
 <0f5a0dbb2359bb4fe02e6669463787e042463ff2.camel@linuxfoundation.org>
In-Reply-To: 
 <0f5a0dbb2359bb4fe02e6669463787e042463ff2.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 1 Jul 2022 11:15:23 -0400
Message-ID: 
 <CADkTA4MuDTCTHpWUarjuca1nFHDy7fP0=qges_ONOcYmop3F-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 15:15:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167534

On Fri, Jul 1, 2022 at 11:01 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-07-01 at 10:57 -0400, Bruce Ashfield wrote:
> > On Fri, Jul 1, 2022 at 10:49 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Fri, 2022-07-01 at 15:10 +0100, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > On Fri, 2022-07-01 at 13:52 +0100, Richard Purdie via
> > > > lists.openembedded.org wrote:
> > > > > On Fri, 2022-07-01 at 10:59 +0100, Richard Purdie via
> > > > > lists.openembedded.org wrote:
> > > > > > On Thu, 2022-06-30 at 15:16 -0400, bruce.ashfield@gmail.com wrote:
> > > > > > > With conference travel and issues with meta-virtualization, I've been
> > > > > > > behind in sending this out .. but I have been queueing changes, I just
> > > > > > > wanted to be around in case something breaks.
> > > > > > >
> > > > > > > Here are the -stable updates and the start of my efforts to bring
> > > > > > > 5.19 in as the new reference kernel for the fall release.
> > > > > > >
> > > > > > > lttng-modules needed it's normal tweaks to work against the 5.19 source,
> > > > > > > but otherwise, nothing significant has popped up.  I have other parts
> > > > > > > of that uprev under test (libc-headers, systemtap, etc).
> > > > > >
> > > > > > Thanks Bruce!
> > > > > >
> > > > > > Unfortunately there was one issue the autobuilder found, a
> > > > > > reproducibility issue in perf:
> > > > > >
> > > > > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220630-53gdlqxv/packages/diff-html/
> > > > > >
> > > > > > I've not looked into it other than looking at the above link but it
> > > > > > seems some python paths are creeping into the binaries.
> > > > >
> > > > > This looked a little suspicious to me:
> > > > >
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-5.15.y&id=18f2967418d031a390a5befe855dd0faa8af70b9
> > > >
> > > > Confirmed that it is this change. Not sure why but at least we have an
> > > > idea of where the isssue is.
> > > >
> > > > I've also sent a patch to insane.bbclass to change WARN_QA such that we
> > > > can detect this kind of issue much earlier in people's local builds. It
> > > > may expose issues in other layers but those issues probably do need
> > > > exposing at this point too...
> > >
> > > This breaks:
> > >
> > > override PYTHON := $(call get-executable-or-default,PYTHON,$(subst -config,,$(PYTHON_AUTO)))
> > >
> > > as somehow PYTHON is expanded to a full path, yet:
> > >
> > > override PYTHON := $(call get-executable-or-default,PYTHON,$(PYTHON_AUTO))
> > >
> > > this works and doesn't expand PYTHON. I have no idea why, it doesn't
> > > make sense.
> > >
> >
> > urk. I'm off today for a Stat holiday (and Monday as well), but will
> > poke at this throughout the weekend to try and come up with ideas
> >
> > first step, get geared up to test reproducibility locally, step 0,
> > find my old notes on the subject :)
>
> The insane.bbclass change helps as you don't need a full
> reproducibility build test. It is basically looking for buildpaths
> (TOPDIR) in the binaries.
>
> In other words just do a "strings perf | grep python3" and if you see a
> full build path there, there is a problem.
>
> You can see if on the compile commandline with a -DPYTHON= definition
> too. If it is a full path, it is broken.

Sounds good.

I see the QA patch.

I'm on it, and will follow up when I know more.

Bruce

>
> Cheers,
>
> Richard
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

