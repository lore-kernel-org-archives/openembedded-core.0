Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40362C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 05:28:54 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web09.22288.1639459731359008409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 21:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L/1jg9ew;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id a2so17429293qtx.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 21:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vw6jmbZVymDJ/8nijPhfEtaw2kA9OsslPoGZFYez+gY=;
        b=L/1jg9ewlqt3nTzVVnnfCuUCSmm6WNeYQJjxFa7Hk8mLghJTBb1O/EdhXtUBLWDOiG
         Rfwmg2gAcNcHT/0Tfn9/mVwUloRFF8zhBmFE3+oPmerW0Rtp83pmjeI0Aw+QtLEc5Ztv
         +TIahCaFp8N5MO6Unr1LqHkAuGhCOyetPlsQdetDS8m4JCH9P38/ZlvZPuoowGV+NqR/
         Sdi0La+A84idj9dS03z+KItC1zagJC48z+1hgmDFUumkdKKK2Y+sydMwlUn10w4jEPzy
         pKTrnANiJYaVItmiOfCFsku8BpK70B0wbKLvUXJOCEOHgnhZHkqaCU9mERpmNWADuF/y
         e7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vw6jmbZVymDJ/8nijPhfEtaw2kA9OsslPoGZFYez+gY=;
        b=bH+Fd8x4uvDfWzndAa8je7+PVY5+3S8z+zf8bdDfqloJzz4Kb6nIWJyOpMwMijASj0
         jupkcgrB3izmXvO5+lW/A2+qGqQz9iq61PEQhMZIWau+S/5R8ttPmKFYBAzSxaSEOqAG
         x+yeAggMa7CH0S2SDSlpGyBBZzlX2lPBzit4XrpFax+ll+x3qhIGc2hk4Tnr7SZM/g/h
         e/xLvcqwRGyglRM/I9qi2WeK15y0husYK4o8z/CxIyiFsZVaulNGjoX05CK4b0WiUDg2
         PVw0H25F1g1ohGTCuH8Mk5jbiLKFvuOmGLClUwyqC6nCTSP8qxap3LgE1pFjP2LGtKBI
         k2fA==
X-Gm-Message-State: AOAM5325058kzeaIDZ5hFhmvCfpc7VbCe7rJqC+MloAPPNCbbXDxPWbD
	mceVi+mony5NQPDKgBbAqLmP9sz7ZHCvV+CNDg0=
X-Google-Smtp-Source: 
 ABdhPJzuSL7Wo58BRT2BfZWDCKTJeX4C/PKe3VAI1yrvvgjEMCf5x4esLdsFOlZetu3M3+jYiBCjnMng/Y4cJe3b8Tk=
X-Received: by 2002:aed:30a3:: with SMTP id 32mr3689002qtf.660.1639459730384;
 Mon, 13 Dec 2021 21:28:50 -0800 (PST)
MIME-Version: 1.0
References: <01159b35-cec2-1b90-f11c-77f6991b32b8@ni.com>
 <CADkTA4OokaT7oK2-QspYD4bYcRwWapGFE9rKSAq8UoEY1hVCrQ@mail.gmail.com>
 <24583f43-3b8d-6476-96b8-18bdf19781f3@ni.com>
In-Reply-To: <24583f43-3b8d-6476-96b8-18bdf19781f3@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Dec 2021 21:28:23 -0800
Message-ID: 
 <CAMKF1sp4foD8g82=NjDQ+XUCOe+QBGzAJs7_o9DLN34+hTj-Ng@mail.gmail.com>
Subject: Re: [OE-core] The state of DKMS in the Yocto community
To: Alex Stewart <alex.stewart@ni.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 05:28:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159681

On Mon, Dec 13, 2021 at 4:28 AM Alex Stewart <alex.stewart@ni.com> wrote:
>
> On 12/11/21 09:24, Bruce Ashfield wrote:
> > On Fri, Dec 10, 2021 at 3:58 PM Alex Stewart <alex.stewart@ni.com> wrote:
> >> Hey List,
> >>
> >> I'm trying to work out the mysterious state of DKMS in OE-Core.
> >>
> >> Our (NI) OE distributions rely heavily on DKMS to (un)install our
> >> ecosystem of kernel drivers at runtime across our product lines. To
> >> facilitate that, we authored a dkms_2.4.0.bb recipe [1] back in 2017,
> >> which we have carried out-of-stream since.
> >>
> >> We tried to upstream it, and the patched rev'ed a couple of times [2];
> >> but it seems to have never made it into a yocto release.
> >>
> >> Though some other recipes mention DKMS passingly, I don't see anywhere
> >> that OE-Core officially supports it. Nor does my googling reveal anyone
> >> else who uses DKMS. I find that a little hard to believe, though I
> >> understand that it's probably relatively rare in the embedded space.
> >>
> >>
> >> @all
> >> So does anyone else on the list use DKMS in their yocto distribution?
> >> Are you maintaining a DKMS recipe out-of-stream as well?
> >>
> >>
> >> @maintainers
> >> If NI upgraded our DKMS recipe to a more recent version than 2.4.0 and
> >> submitted it again to OE-Core, would you accept it? If not, we will move
> >> it to our own meta layer and accept that we are unique in this regard.
> > I used to have a DKMS recipe myself (at my previous employer), but
> > never submitted it, because generally speaking, there are better ways
> > to do things in OE.
> >
> > DKMS tends to avoid proper cross compilation (which of course we
> > already do), or is often used to distribute proprietary code (which we
> > don't want to encourage), or is avoiding the need to upstream the
> > module code (which we also don't want to encourage).  It also only
> > tends to be used on a subset of the architectures that have enough
> > memory/cpu to build on target, so by definition it is a bit more
> > niche.
>
> Yeah; I agree. In our case, we have several dozen drivers split across
> many product teams and largely distributing internally-controlled
> source. At this stage, it isn't feasible for us to build them all within
> OE - which is unfortunate.
>
> Many of those drivers are also required to support both our OE
> distribution, as well as a small matrix of supported generic Linux
> desktop OSes. So having them manage their own DKMS packages reduces the
> surface area for packaging errors.
>
> I don't expect that either of those considerations is common in the OE
> community.
>
> > We of course already have the ability to build modules on the target
> > (we have a test case in core that does just that), so what is in core
> > can support what DKMS needs to build on target.
>
> I'm not sure which test case you're referencing, do you have a link or
> could you expand on what you mean?
>
> > I don't see this as something that makes sense in oe-core (but maybe
> > I'm not fully understanding the case, and where the current support is
> > failing), but could of course be contributed to another layer.
>
> That's fair. Our use case is motivated more by an organizational failure
> than a failure of the OE tooling.
>
>
> @Khem
> You're maintaining the meta-oe layer; correct? Do you have any interest
> in a DKMS recipe?

I cant say how much maintenance work it is upfront. I have been bitten with some
hairy recipes e.g. kernel-selftest which need active maintenance for
which I might not
have time to do myself. However, looking at what Bruce explains, it
seems the value
add it not as much either, so I am less inclined to have it unless
there are others in
community who will find it useful and service it timely manner and
test it, keep it working
with all test combinations etc

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

