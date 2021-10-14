Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDA3C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:39:01 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.8794.1634215140944356251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p2XfQKaN;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id t16so23774089eds.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r09Mom0y2gj+V7+IxsUkDKbpuKrrBR1iANjf0FXiKhA=;
        b=p2XfQKaNoZ70s9L2etUvzorhhB4YXI8GzGNJyXXDe+PDYfAd3Cs5GTJS1IHt9B5dz3
         e/frByROIsLNDatErCwVClSnxOfV3rTrhWItD9qu9tgXL0g3dhkaxAI6RtybCRiDW8gv
         RhtkMmuphGsvtaDiddbjTdTMzRoVf5AMdUxlKpxCeSTeV8+IHPIoFthcaD+lbR1eP9B2
         t3XZ0Hi2nTc6pACBDY4ixQhc5qmjBCMszdKBP2nQkhxmXP7fXCnzddozRASfgZ6NsH04
         SSm6PeNQWmYvh5/ZMxmqX1NqHewf0QFnxgfhNYw/WtO5b6qtkYekBQXYNCDGiVU6QGpa
         i94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r09Mom0y2gj+V7+IxsUkDKbpuKrrBR1iANjf0FXiKhA=;
        b=IY7UpyIjz6CejQa8ppDxhb1EqWRT92DLAZY0RD1VAaqJLf6O+lnzchlH5svnzjRShe
         fDvMFt4cA+3enDCxhAoGDB3B5/1RCW5mjevaNPW22+SsB4V0fJjR49yXSnHgw5bpHHu/
         D82aGFGYzJlHCWlHsJmlGy6B9lXMUSy+l3HbuZgBeCibYxjk53bMXqKls1aSx6QOTHP4
         5gjmxr99ObgSlsGkSnjgxAFtISDX8TnqrZOtBx6eTi8Yax/8+3RVQjQ6LKAUDhDNn+IM
         lJ2DaocpyoDT2TkXVBUUb2YhTVeuItnYAAOzcswu5iO6y5mnmV+dKfBkYGXqG7tw9EeG
         EXww==
X-Gm-Message-State: AOAM532JcGo7zy3kGzShrqYQqgilAJDBjEwymv989FYavN5Gu6AHInRE
	kz7vUGxBiMlV7PfA5rtiwPukL3fI508ha/KSbCw=
X-Google-Smtp-Source: 
 ABdhPJw7IRnhKOvuLBF1kVFAF4xdSyTaTRg1hxh8Km6lFimtJWWFobEO9hUyLBpNuXKuQp+ELp1OG+7AgdSihVBG+Mw=
X-Received: by 2002:a17:907:3e8e:: with SMTP id
 hs14mr3540942ejc.35.1634215137862;
 Thu, 14 Oct 2021 05:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
 <20211014121025.2913401-7-richard.purdie@linuxfoundation.org>
 <CADkTA4MccXdOvzaEoHOX-wVj-iFsLRb7OsDpO+myowr3f0gT=w@mail.gmail.com>
 <f83e1f3063a28ca1e761ab11656846fd71ca41e2.camel@linuxfoundation.org>
In-Reply-To: 
 <f83e1f3063a28ca1e761ab11656846fd71ca41e2.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Oct 2021 08:38:46 -0400
Message-ID: 
 <CADkTA4NZRmGhb92Y22MnGsQhdxZOUtpg99pu0LahdZgyCJCzzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] reproducible: Drop
 BUILD_REPRODUCIBLE_BINARIES
 variable
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:39:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156950

On Thu, Oct 14, 2021 at 8:32 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-10-14 at 08:28 -0400, Bruce Ashfield wrote:
> > On Thu, Oct 14, 2021 at 8:10 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > We want things to be reproduicble and the variable doesn't really change
> > > much any more. Drop the remaining uses and make those code paths always
> > > active.
> >
> > It wasn't clear to me from reading the patch.  What is the way that
> > someone would now get the current timestamp into a kernel build, if
> > that's the behaviour that they want ?
>
> With this change they probably don't get the option. If we want that to be
> configurable, we should probably move the control to a different variable which
> is focused specifically on the kernel. The hardest bit is probably picking a
> name!

This is probably the most surprising feature of reproducibility for
kernel developers, and a question that I've gotten multiple times
("what happened to my timestamp ?" followed by "how do I turn this
off?")

Most kernel developers already don't really like the "yocto workflow",
and this adds another element in that category. It is common in a
debug scenario to check the timestamp of the running kernel to make
sure that you've actually booted the one you just built.

>
> You don't really want to turn off all reproducibility everywhere for just the
> kernel timestamping change.

Agreed.

And agreed on picking the name, could it be something around
KERNEL_DEBUG ? And we could even put a bbnote (that they won't see,
but that's the best I can think of) that indicates that
reproducibility is on and the timestamp is set to <x> .. and the
opposite when reproducibility is off ?

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

