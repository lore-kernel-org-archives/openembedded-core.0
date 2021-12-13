Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1D0C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:54:36 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.11207.1639403675795882386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JctvmX4J;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id o20so52731422eds.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+kbssrh8gFsCJ36mkRugdB5HL/I+CTuFvA0kctYoMdM=;
        b=JctvmX4JILs0SNbGrIKFA07w0UB3MR1y0Qn+iGzHYFRdc96fT+cWm5pFxHwLIdweWG
         UjdQgwZt4sxFMLpNIxViTnysaywPl0gFgy1cVYsCboJHkvfYvjO36UeISQEYf0V/mbIy
         knocP9rMv3MPRqf6VXj1hYbpK81BLyLq9bSleznoMQUI2mTY/udo9tFFpOUBihQin9re
         J+B0YJoTzp6KYhN0f4ijSzoE8b1E0wNWzvFMzenaJEawL8aRYAOxdDOKD90bdqp/y51G
         bBpVKg4uurCNTHti867gEBx2nMB0EOfOWY+BBO4ZRQbpyJS4hcyphltcQ6oocf/+t4iR
         xVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+kbssrh8gFsCJ36mkRugdB5HL/I+CTuFvA0kctYoMdM=;
        b=JIzRkAsSgFwG3ci4HOVMXhFfQpZHVTFQR6saCRWsYhVxweEbYsHnG6KmTKYH4XUADr
         393eO5trj95OlGFNa1u3oCVKQrHY9q3iAVEtMD43y615QgTrmzgSLBtFACKaUFv+yTzN
         U9FIrClIz7pplKASf4pV2rZId0oClaohS5GA6n1PKDx2N6uWIuUE9Nq7sujlC9EAiehH
         42DyfI0GXA2+eLvdusbvwgS/64Sj13lQbU0DjH2AAeIiT0QRslLCeuAubY3abXyi0hTO
         9wVHmCisyNqSL+kJw2hJjSJxEh9oAJN29GsxItClhJCZbzZIeBL9WMh7MNqpNJUkWyLA
         A3Aw==
X-Gm-Message-State: AOAM532gEqUffyxar4cfkGnWCIo/q6vUKR/iTi7MQBkGu54gjngFqC6Y
	oKeY3fb6bC/kYigM9akSgt1VS+hV+vsTrI9gyuY=
X-Google-Smtp-Source: 
 ABdhPJyhrUex7+kqlGmHt7EKtJUbjkUVP6qyK8AoUnCMr+81PqQxCWRtGbu4hbYzxqdAdO6M83FA3P+LIzYn/Bjcfso=
X-Received: by 2002:a17:907:7f8f:: with SMTP id
 qk15mr42184271ejc.455.1639403674139;
 Mon, 13 Dec 2021 05:54:34 -0800 (PST)
MIME-Version: 1.0
References: <01159b35-cec2-1b90-f11c-77f6991b32b8@ni.com>
 <CADkTA4OokaT7oK2-QspYD4bYcRwWapGFE9rKSAq8UoEY1hVCrQ@mail.gmail.com>
 <24583f43-3b8d-6476-96b8-18bdf19781f3@ni.com>
In-Reply-To: <24583f43-3b8d-6476-96b8-18bdf19781f3@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 13 Dec 2021 08:54:22 -0500
Message-ID: 
 <CADkTA4P1OW_KGMFoBa5kPGb+zGBc4pkS0v+JHDbDF7+Y5LQ9ow@mail.gmail.com>
Subject: Re: [OE-core] The state of DKMS in the Yocto community
To: Alex Stewart <alex.stewart@ni.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:54:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159637

On Mon, Dec 13, 2021 at 7:28 AM Alex Stewart <alex.stewart@ni.com> wrote:
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

I was just referring to the kernel-devsrc package, and that it supports
both eSDK and on-target compilation of kernel modules. We have a
hello-mod that is part of the oe-tests (it is copied to the target, built
and insmod'd).

So we know that the actual build will work on the target and that all
the dependencies are in place. We just don't have any wrapping
framework around the build.

Cheers,

Bruce

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
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159618): https://lists.openembedded.org/g/openembedded-core/message/159618
> Mute This Topic: https://lists.openembedded.org/mt/87645999/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

