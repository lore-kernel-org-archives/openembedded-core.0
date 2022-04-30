Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417A6C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 04:26:45 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web09.18971.1651292803316273981
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 21:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cDDtvbJu;
 spf=pass (domain: gmail.com, ip: 209.85.128.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2f16645872fso103395887b3.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 21:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gEsFcqPxbbGB0Ek0utqPSPCzzrtRsPWmE0/VntNgYBE=;
        b=cDDtvbJuphM32lMjWSue57hZHf7eEN8nOGZK3/bI8RoWnGZWtfS94Qu3EfNVMuQIL5
         tygUJRF0Or8IYsG84YV7j7f406h+gH5sfK2/tUZye5r0izJaGlbVuUcsQ2VkfZX7Bkcr
         1stFABRkwgW0TjopzB7VQ/3UwLarBCPdHZ6q3Nd+IeKsd7Ek/8vcriCsK7QDZmVFMS4u
         Su824sbAlmsM8NwwMUA99KVu2UxvxekzrtPtwJTl2yGyk3ndDCyVTPuipXWDEw6Nbkot
         Edoj5p3ysHLJDhDS/In9u+xZ6jQx15t0cZYSXf3XoVmEeuydbf2WbysoGze8CbHRyJoI
         8scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gEsFcqPxbbGB0Ek0utqPSPCzzrtRsPWmE0/VntNgYBE=;
        b=Udr4VnaoQNNXGYlFQVc3Z8Wn3a02jVepQUK4CRV9BQ7s6l8YNzaK1mZg851C02Znov
         lS/rTuEBHHY9KAzuPDZ92nH3TSkNkEfPs5UPuCPrMb3mDYV+u6TtgRlORCbRgYKC9qwM
         Lnul7ySMgXAN5dBMTFJTctvnW5Loek/nOWRpa4gORY5U/DB9ptB8H/pXSLTTHPMaEwMN
         UBKRXXd5wNUVKmORu6/3nQ7m1kc2Eejh2A178AsOIrNpoPPPRpmW4MK0RdExSMxr+l4w
         NBFu/jQo3vljvJILHpM6XWYXj7+ZcRy3VJUuC9iUQupp5DP+kVVvf1jY5bEN3EwQhM5q
         sGag==
X-Gm-Message-State: AOAM530r5xTYa6LRw+htaI2jT+Tf8CekX826hRFvaPaV4bNCVdSeg3PR
	T3MpprEowol2kErD1bH2L1BZCeziBkzCNkT4aSM=
X-Google-Smtp-Source: 
 ABdhPJwBSGNBD8JLVxIO4WHLunNWw+PP3Lb2CR1fMaU7vd6A/w6JS5IlyeXlF/4DMG5+/RM7U16TSnvC3XEtOC7nwTg=
X-Received: by 2002:a0d:f406:0:b0:2f4:e5c2:90f0 with SMTP id
 d6-20020a0df406000000b002f4e5c290f0mr2517645ywf.407.1651292802443; Fri, 29
 Apr 2022 21:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
 <821e6cab4677b71af00197cf2be80680d57aa4ea.camel@linuxfoundation.org>
 <16EA5E7263695663.11702@lists.openembedded.org>
 <16EA76835C38B7CA.4798@lists.openembedded.org>
In-Reply-To: <16EA76835C38B7CA.4798@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 30 Apr 2022 00:26:31 -0400
Message-ID: 
 <CADkTA4P2agP4r-9Ds1w=qOOdgi-0ZjeWDwqr1NHkX--VyY-BcA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/15] kernel-yocto: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Apr 2022 04:26:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165067

On Fri, Apr 29, 2022 at 4:02 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Fri, Apr 29, 2022 at 8:41 AM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> >
> > On Fri, Apr 29, 2022 at 7:51 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Thu, 2022-04-28 at 09:47 -0400, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > Richard,
> > > >
> > > > This is mainly a resend of the pull request that I sent just before
> > > > the release builds.
> > > >
> > > > At that time, there was a ppc boot issue, which I've fixed. There was
> > > > also a ptest warning, which I couldn't reproduce, so let's see if it
> > > > pops back up on the AB.
> > > >
> > > > There is also a known issue with some of the arm reorganization done
> > > > for the -tiny cleaup. Jon has been working on fixes to that series, and
> > > > I've cc'd him here so he can add context. It was some boot issues,
> > > > even in the -standard kernel for sato (last I checked).
> > > >
> > > > The issue with the ARM changes is that they've already been pushed
> > > > to my repos, so everything stacks on top. If we can't get them fixed
> > > > shortly, I can temporarily revert and do a new patch on top.
> > > >
> > > > Khem has also indicated that the 5.15.36 -stable has all of the changes
> > > > required for gcc12, so it would be a good bump to get under test.
> > >
> > > The testing says this is mostly good with two issues. Firstly, strace ptests are
> > > regressing:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3435
> > > and I suspect:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3188
> > > will too when it finishes.
> > >
> > > There was another patch causing other ptest failures so I had to do a second
> > > pass but I think the strace issue above is from a kernel change.
> >
> > I'll see about running the strace locally today. Hopefully it pops up
> > here so I can debug.
>
> FYI: I have the landlock test case passing here, there's just an
> output difference from the kernel. The test is passing.

I have located the exact kernel commit that changed the output, hence
why the test is failing.

strace upstream hasn't adjusted yet, so I'll spin up a patch, and get
send patches to the list over the weekend.

Bruce

>
> I had two other strace tests fail, but they look like OOMs/resource
> problems, and they don't show up on the autobuilder, so I'm going to
> ignore them for now.
>
> >
> > >
> > > Secondly, qemuarm graphics fails:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5132
> > >
> > > I did try adding Jon's other qemuarm patches:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5136
> > >
> > > and it still fails. I've not looked further as yet, just reporting what the
> > > varoious combinations of patches in testing showed.
> >
> > Yep, Jon has indicated that he still has more patches to come, but my
> > queue is unfortunately blocked on them, unless we take that breakage
> > or I do a revert of the first series.
> >
> > I'll wait another day or so, and will do the revert after that.
> >
>
> I have your suggested patch under test, but that build is still running.
>
> I'll follow up over the weekend with the strace + qemuarm
> configuration changes onto the end of my queue.
>
> Bruce
>
> > Bruce
> >
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > >
> > >
> > >
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165057): https://lists.openembedded.org/g/openembedded-core/message/165057
> Mute This Topic: https://lists.openembedded.org/mt/90753174/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

