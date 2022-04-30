Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C01C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 21:35:22 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web12.27497.1651354513520998209
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 14:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ikuPb/7G;
 spf=pass (domain: gmail.com, ip: 209.85.219.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id j2so20353556ybu.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 14:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dWAsVka3RrQazpknKmGm5ku64mhufvbZiPVjOFckAuU=;
        b=ikuPb/7GlmcRYeAzy+7igyZD7xZro1RJcakQ3tbADUbqtK/2lG6lviaCs1TDLDS2jf
         B4tTHmDi0ov2gd6IB28E/43iKx+uXtmzrkwqqeOrkhZTeBYE+0IusqvCPThKbONjVrqy
         jmO44MEVPweJOO9yE8gzc83/1DMzPBy15ysudMwlS+j2D04mW9VXn72DpJKwotd+1OTR
         VJf4XUVfOi7+jRU0qYGO4PC7Na6zeYIZt2+tPFggNf3Qfvw4hse6euIIhd6PKbE4dXPu
         wJPHuMgcyG1Fod1uN6NxS2Z8iVtNxeK8UlPLVt+jMtrXOcbkcoK7lAtRdEXi1hvJ5RAc
         DGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dWAsVka3RrQazpknKmGm5ku64mhufvbZiPVjOFckAuU=;
        b=0Sgc24yzEZjKMBdrz0a15lqQeCDV6EcFbEJfmSD8r6MWOXLhhIqYdtsp+O/IJtpgWm
         f31QwuZoF34mf5mGQwPmlqjpBXALXpVFx+Yg93ZICYL1Q628bfLOkm5eU+D41/DVB2O/
         GmG+rpvAg/tFiOhhfGAjJ0S4wiqaA3YvAhLmbafiEGAH+a9kOBnbzZh0v78BP7gTrrdV
         WMhmlybbOpoTh/7btTW2PM+oKXpuzbEhSJjg1zEjbR2NusZxOLif0NDM6GIZwh9ND5Dg
         /blQ3ZNXIvHkTzMUmJuwsbwUf2/j/eLqQoKFLzB7eye+wCNgs1anZD8+v3HHnzDTxDbC
         5/vQ==
X-Gm-Message-State: AOAM533VeDpCLxuKDWLXnTO38fLTGueZBTWnWTolZoBhYSzdPn6hDgQS
	TrGJgKm+cPxJxpOugHar8BetNf1kUDZvq+8tDa4=
X-Google-Smtp-Source: 
 ABdhPJxQC2557JESPtfAjfZxidfFG+ErjfDQvCuX66Dt+rfXI0H9ea0plsXQ+h4dmSEr6b0NU1wDzFW7I615mJLzrzI=
X-Received: by 2002:a05:6902:114c:b0:641:87a7:da90 with SMTP id
 p12-20020a056902114c00b0064187a7da90mr5199058ybu.561.1651354512652; Sat, 30
 Apr 2022 14:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
 <821e6cab4677b71af00197cf2be80680d57aa4ea.camel@linuxfoundation.org>
 <16EA5E7263695663.11702@lists.openembedded.org>
 <16EA76835C38B7CA.4798@lists.openembedded.org>
 <16EA920E59E6B6F1.28542@lists.openembedded.org>
In-Reply-To: <16EA920E59E6B6F1.28542@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 30 Apr 2022 17:35:01 -0400
Message-ID: 
 <CADkTA4M6NzCMVtEhiu+Hyaqp4gMZViP1XRH1qP1t2Ds3S6TL1w@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Sat, 30 Apr 2022 21:35:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165075

On Sat, Apr 30, 2022 at 12:26 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Fri, Apr 29, 2022 at 4:02 PM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> >
> > On Fri, Apr 29, 2022 at 8:41 AM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > >
> > > On Fri, Apr 29, 2022 at 7:51 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, 2022-04-28 at 09:47 -0400, bruce.ashfield@gmail.com wrote:
> > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >
> > > > > Richard,
> > > > >
> > > > > This is mainly a resend of the pull request that I sent just before
> > > > > the release builds.
> > > > >
> > > > > At that time, there was a ppc boot issue, which I've fixed. There was
> > > > > also a ptest warning, which I couldn't reproduce, so let's see if it
> > > > > pops back up on the AB.
> > > > >
> > > > > There is also a known issue with some of the arm reorganization done
> > > > > for the -tiny cleaup. Jon has been working on fixes to that series, and
> > > > > I've cc'd him here so he can add context. It was some boot issues,
> > > > > even in the -standard kernel for sato (last I checked).
> > > > >
> > > > > The issue with the ARM changes is that they've already been pushed
> > > > > to my repos, so everything stacks on top. If we can't get them fixed
> > > > > shortly, I can temporarily revert and do a new patch on top.
> > > > >
> > > > > Khem has also indicated that the 5.15.36 -stable has all of the changes
> > > > > required for gcc12, so it would be a good bump to get under test.
> > > >
> > > > The testing says this is mostly good with two issues. Firstly, strace ptests are
> > > > regressing:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3435
> > > > and I suspect:
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3188
> > > > will too when it finishes.
> > > >
> > > > There was another patch causing other ptest failures so I had to do a second
> > > > pass but I think the strace issue above is from a kernel change.
> > >
> > > I'll see about running the strace locally today. Hopefully it pops up
> > > here so I can debug.
> >
> > FYI: I have the landlock test case passing here, there's just an
> > output difference from the kernel. The test is passing.
>
> I have located the exact kernel commit that changed the output, hence
> why the test is failing.
>
> strace upstream hasn't adjusted yet, so I'll spin up a patch, and get
> send patches to the list over the weekend.

The two patches that fix the strace ptest fail, and qemuarm graphical
boot are on the list.

Bruce

>
> Bruce
>
> >
> > I had two other strace tests fail, but they look like OOMs/resource
> > problems, and they don't show up on the autobuilder, so I'm going to
> > ignore them for now.
> >
> > >
> > > >
> > > > Secondly, qemuarm graphics fails:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5132
> > > >
> > > > I did try adding Jon's other qemuarm patches:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5136
> > > >
> > > > and it still fails. I've not looked further as yet, just reporting what the
> > > > varoious combinations of patches in testing showed.
> > >
> > > Yep, Jon has indicated that he still has more patches to come, but my
> > > queue is unfortunately blocked on them, unless we take that breakage
> > > or I do a revert of the first series.
> > >
> > > I'll wait another day or so, and will do the revert after that.
> > >
> >
> > I have your suggested patch under test, but that build is still running.
> >
> > I'll follow up over the weekend with the strace + qemuarm
> > configuration changes onto the end of my queue.
> >
> > Bruce
> >
> > > Bruce
> > >
> > > >
> > > > Cheers,
> > > >
> > > > Richard
> > > >
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
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
> View/Reply Online (#165067): https://lists.openembedded.org/g/openembedded-core/message/165067
> Mute This Topic: https://lists.openembedded.org/mt/90753174/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

