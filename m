Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9670BC433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 20:02:01 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web09.14663.1651262519521125930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 13:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jXxCif7t;
 spf=pass (domain: gmail.com, ip: 209.85.128.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2f7b815ac06so96415507b3.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 13:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pb7vQ1HIlhYfLPz2lobNOABRixn17RMNfO4Rw0qLT7o=;
        b=jXxCif7tI9UVqMT/rE2sJmYLo5/TovszM5uvjBl26A1gKMmn0gv7rXfk9wdPnZY+fo
         6SSlnwx7mJ1zvXOTRdhzGpiOlWqJr5zhr9DOPGN8DyWAC7Ui/CXPjnAWQ6JsEzLwFa6U
         p9g890JspyjdzmpnHBQ+X3xAxKlgVpefxzlWAxdiAqdwv5dyUsAoEntPXwrluY9mCaVG
         srrbkOdpu7B3m+Ad+9HM3+F5XAtsalygUDnrJ7Qd8SNKQN83u2j5bqHu1wagSegeO+wy
         BOYx814+5aNBzahBr3oQqEVWDIneqqwC174J0sz0w74iMwpYlTPcJ2kutn3niDpRj5g9
         R6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pb7vQ1HIlhYfLPz2lobNOABRixn17RMNfO4Rw0qLT7o=;
        b=tqRKaWw3trP7rNYCAnZT+wiRGLcFn6LcaWM4PpQCk8LtPMZWlPlVxYtKz6pqebQZoY
         Uk3BjWP3ssfWlUl+Pv6qoUl9F8/Hntuqh1EWd+PuShHsFr/yYwvNCIIsNaABmxOKGusX
         JLBHIgSwOOP9lVj6zGWsY7QdYRkt27Oe5UAu5ygFhDizUZzPVE03GWWl697i/dFZNhKJ
         CRC04EX5xrFhepMgdz6njWuPlfM53etrqakR0PNs6lQfICg37Or5Vu2mRHjuQsaad6db
         OXXtybspOltlnon7/HOPq1LgntLreqgCiibVfGdV1i9n2YS8zmNMFEMKCcfajPsyWPDx
         5fzA==
X-Gm-Message-State: AOAM531gIINUOcng2xyeJ1aqWKxUiobw7GVeLYEj8w8ks9br96rUfNrv
	sX+GYcUx+J/7ud//fD1yj8QVBCKa+w3FSBZJCGA=
X-Google-Smtp-Source: 
 ABdhPJyjru08FoyAmpepAPs2uSQP0jO2KLukxY2JL8yznY5pp8Ue/Rppacbv2QO/vTDL5woVsCDMMifYUjniLkjEG+E=
X-Received: by 2002:a81:6cc1:0:b0:2f8:bb31:143b with SMTP id
 h184-20020a816cc1000000b002f8bb31143bmr1027113ywc.64.1651262518521; Fri, 29
 Apr 2022 13:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
 <821e6cab4677b71af00197cf2be80680d57aa4ea.camel@linuxfoundation.org>
 <16EA5E7263695663.11702@lists.openembedded.org>
In-Reply-To: <16EA5E7263695663.11702@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 29 Apr 2022 16:01:47 -0400
Message-ID: 
 <CADkTA4P2VT3BoaRSwQbVT=wxyFWxPQh9B=FOBRe_dSek7zbPHQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 20:02:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165057

On Fri, Apr 29, 2022 at 8:41 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Fri, Apr 29, 2022 at 7:51 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2022-04-28 at 09:47 -0400, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Richard,
> > >
> > > This is mainly a resend of the pull request that I sent just before
> > > the release builds.
> > >
> > > At that time, there was a ppc boot issue, which I've fixed. There was
> > > also a ptest warning, which I couldn't reproduce, so let's see if it
> > > pops back up on the AB.
> > >
> > > There is also a known issue with some of the arm reorganization done
> > > for the -tiny cleaup. Jon has been working on fixes to that series, and
> > > I've cc'd him here so he can add context. It was some boot issues,
> > > even in the -standard kernel for sato (last I checked).
> > >
> > > The issue with the ARM changes is that they've already been pushed
> > > to my repos, so everything stacks on top. If we can't get them fixed
> > > shortly, I can temporarily revert and do a new patch on top.
> > >
> > > Khem has also indicated that the 5.15.36 -stable has all of the changes
> > > required for gcc12, so it would be a good bump to get under test.
> >
> > The testing says this is mostly good with two issues. Firstly, strace ptests are
> > regressing:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3435
> > and I suspect:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3188
> > will too when it finishes.
> >
> > There was another patch causing other ptest failures so I had to do a second
> > pass but I think the strace issue above is from a kernel change.
>
> I'll see about running the strace locally today. Hopefully it pops up
> here so I can debug.

FYI: I have the landlock test case passing here, there's just an
output difference from the kernel. The test is passing.

I had two other strace tests fail, but they look like OOMs/resource
problems, and they don't show up on the autobuilder, so I'm going to
ignore them for now.

>
> >
> > Secondly, qemuarm graphics fails:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5132
> >
> > I did try adding Jon's other qemuarm patches:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5136
> >
> > and it still fails. I've not looked further as yet, just reporting what the
> > varoious combinations of patches in testing showed.
>
> Yep, Jon has indicated that he still has more patches to come, but my
> queue is unfortunately blocked on them, unless we take that breakage
> or I do a revert of the first series.
>
> I'll wait another day or so, and will do the revert after that.
>

I have your suggested patch under test, but that build is still running.

I'll follow up over the weekend with the strace + qemuarm
configuration changes onto the end of my queue.

Bruce

> Bruce
>
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> >
> >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165010): https://lists.openembedded.org/g/openembedded-core/message/165010
> Mute This Topic: https://lists.openembedded.org/mt/90753174/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

