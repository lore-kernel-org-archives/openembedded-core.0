Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3342AC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 12:41:08 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web09.9512.1651236058350226790
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 05:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A+FxnO6J;
 spf=pass (domain: gmail.com, ip: 209.85.219.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id w187so14262238ybe.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 05:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aPbVXaSfDXKxHNOzBdSlCiAiR2UAHupxqg8MOAajvUg=;
        b=A+FxnO6JP7YOww8O0MmuLESRrcpSlZKJlVYF23zd1dCUSn0SknVsaalIguW5REA3dY
         fasvBu6eDLNTmtxTuGfk9goalNDv6qgr8tX3UV/ZdZ8KTnOR1FyLSXtjRRpUsuACMJdz
         mKXk7axpqUM0s8o9XDeHmTKFhHwl12j/pgZFMtko7RHejGFygRUJ3XPFFB0l0GIA6MYG
         H2j7nipM/rx79qeycww28q8AyocbPblampvHMK+/hjvABKT1L/38gfpHFdxJJs37l+7k
         0aKf4ryw81P/37VGAwkMTInmdaD1ZxfL66kIN5WBU23QBOcsZTbwv1i1cYvbOLE3lKyL
         /D9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aPbVXaSfDXKxHNOzBdSlCiAiR2UAHupxqg8MOAajvUg=;
        b=H8GxQcTGfmCBWVE6htG9jLIOMvmWjFG10glxCfS0ZGm9aR1OV4m34m7C3aGRN7aDHH
         4p0aAgapRg1N4+jMFUW0YYm+kzTYAC3rd+thHO4RAcpCAlR2POaPyLbzOVcMK5RIQ9GO
         15xwwO08L3GIuEpno2vyyQXXdu4rdn05PicfIoIske+P/Fy3NEyaE89EHDWEyFUCKbWU
         5YvFWaDLb7itUe9HVR5I054PpuODYsgG7ROdiLzZlIS51KV982GvqUjPZknu5X4TnS8T
         pYBYAera1uYD+2tK9pDQe2FMWzNVjknz2HesrP9Uwi/HgrgwoxM8ChJQpxWexpDTZ7YI
         3FdA==
X-Gm-Message-State: AOAM533ehbK3IZOt2izVT3X/j7wmMjiP94YDY35vIY5iFYzb5Cg0cKGE
	FTM969bz3xhObbsIfCzf3WUG86Hl8bogMFJtnPk=
X-Google-Smtp-Source: 
 ABdhPJyUPrRbCmmftvLn4+hHCqFHGVzBPsEr/ot7LWJhUuahoK5fokb3HjnJJB8ou/kpd4JScV1tnkqcQw+NqeRap9o=
X-Received: by 2002:a25:3b8f:0:b0:644:afb4:57a6 with SMTP id
 i137-20020a253b8f000000b00644afb457a6mr35123733yba.40.1651236057393; Fri, 29
 Apr 2022 05:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651153370.git.bruce.ashfield@gmail.com>
 <821e6cab4677b71af00197cf2be80680d57aa4ea.camel@linuxfoundation.org>
In-Reply-To: 
 <821e6cab4677b71af00197cf2be80680d57aa4ea.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 29 Apr 2022 08:40:46 -0400
Message-ID: 
 <CADkTA4Mj0sqjgX57L6bGX8OMuWeid-XDgmqUaDg=8jd=MDV62w@mail.gmail.com>
Subject: Re: [PATCH 00/15] kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
	Jon Mason <jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 12:41:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165010

On Fri, Apr 29, 2022 at 7:51 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-04-28 at 09:47 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > This is mainly a resend of the pull request that I sent just before
> > the release builds.
> >
> > At that time, there was a ppc boot issue, which I've fixed. There was
> > also a ptest warning, which I couldn't reproduce, so let's see if it
> > pops back up on the AB.
> >
> > There is also a known issue with some of the arm reorganization done
> > for the -tiny cleaup. Jon has been working on fixes to that series, and
> > I've cc'd him here so he can add context. It was some boot issues,
> > even in the -standard kernel for sato (last I checked).
> >
> > The issue with the ARM changes is that they've already been pushed
> > to my repos, so everything stacks on top. If we can't get them fixed
> > shortly, I can temporarily revert and do a new patch on top.
> >
> > Khem has also indicated that the 5.15.36 -stable has all of the changes
> > required for gcc12, so it would be a good bump to get under test.
>
> The testing says this is mostly good with two issues. Firstly, strace ptests are
> regressing:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3435
> and I suspect:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3188
> will too when it finishes.
>
> There was another patch causing other ptest failures so I had to do a second
> pass but I think the strace issue above is from a kernel change.

I'll see about running the strace locally today. Hopefully it pops up
here so I can debug.

>
> Secondly, qemuarm graphics fails:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5132
>
> I did try adding Jon's other qemuarm patches:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5136
>
> and it still fails. I've not looked further as yet, just reporting what the
> varoious combinations of patches in testing showed.

Yep, Jon has indicated that he still has more patches to come, but my
queue is unfortunately blocked on them, unless we take that breakage
or I do a revert of the first series.

I'll wait another day or so, and will do the revert after that.

Bruce

>
> Cheers,
>
> Richard
>
>
>
>
>



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

