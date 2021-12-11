Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB6AC433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 15:24:29 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.22739.1639236267452320172
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 07:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mkOp9UGV;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id l25so39085332eda.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 07:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5+6gfVMLakmsLb1g0nDzVwtcQgjOpa43z1AXOhN98EM=;
        b=mkOp9UGVyIp4vj5OoKxo2AEfvrpBbjX6DOZZM/hnpNicdIV2xTVEpOYhmsEapH2RI5
         bDezHpFmQL/z1fo84iG+OsmA4cdFvmrJDM4lNUeZDXjORYAvrycfOXju8NMgPhMtC51a
         UJBBUh+RTvTRw64sn6rk6d2tr58IvXRIQ7P53wQtaqF64Z4rb48Lp6JHttSw3f5uw8Bv
         xm4L10ObMfFSAziwm2mI9IOHv/cj184bsSZjgY4INzHKvspR2fdUMNRdkyAHOLqd0Vvc
         IUX2sUuTO0md31DzULrlcKQej2K1wENoe5nyUPgdsALaXdyAf1TzJOBIZy2q78px4poS
         bpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5+6gfVMLakmsLb1g0nDzVwtcQgjOpa43z1AXOhN98EM=;
        b=sTNAGzD01hqO4EoDllzKf5Lw/GH/BEP7tk6+FPrvR1eawAQ7cr88j6HvK88XdiCSGN
         fX1oYIAf7UnOab7t7sZHwm+jI/Q/3tMq8wVbWO/6+Ywwh9MjnR+K9Tn4tkQK2S0Vqgjn
         Cvr1wBAhZalo0X70YR7n69gRM0oeYuT+u5isYVcFjDJ0r63SiAec/3aQpGulQ1l8/wCG
         bSLesMMo6eZd/shvvtHKVRiceDq89qJRXwUsTG1XwYmKDvWXVWfSfP2qt93xqre5fT4T
         soj3ybu/Vo0Vin5iAKOpyBxjfeQ0WuRl8S1wC4mS0051lAHEYzINlAy9wb4aRk0O/VIF
         0MXQ==
X-Gm-Message-State: AOAM5322T6+vlB7j9yZB/3rq5BjWYP2FqEq5tcHZG965VUsJ3m1uUeT+
	GtIEmV6LBltd9wNTdBz58gJsF8nI1Sd/kXXubvQ=
X-Google-Smtp-Source: 
 ABdhPJywaYkM+WpTBQ9PhTNpZBv9VzjrVk4+dVhAQQ/02pdJkU16HjvdGGb+c5e1VPEaGMNe6bEPZ5Cbfzct9hiQR78=
X-Received: by 2002:a05:6402:1a42:: with SMTP id
 bf2mr45527207edb.64.1639236265761;
 Sat, 11 Dec 2021 07:24:25 -0800 (PST)
MIME-Version: 1.0
References: <01159b35-cec2-1b90-f11c-77f6991b32b8@ni.com>
In-Reply-To: <01159b35-cec2-1b90-f11c-77f6991b32b8@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 11 Dec 2021 10:24:14 -0500
Message-ID: 
 <CADkTA4OokaT7oK2-QspYD4bYcRwWapGFE9rKSAq8UoEY1hVCrQ@mail.gmail.com>
Subject: Re: [OE-core] The state of DKMS in the Yocto community
To: Alex Stewart <alex.stewart@ni.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Dec 2021 15:24:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159569

On Fri, Dec 10, 2021 at 3:58 PM Alex Stewart <alex.stewart@ni.com> wrote:
>
> Hey List,
>
> I'm trying to work out the mysterious state of DKMS in OE-Core.
>
> Our (NI) OE distributions rely heavily on DKMS to (un)install our
> ecosystem of kernel drivers at runtime across our product lines. To
> facilitate that, we authored a dkms_2.4.0.bb recipe [1] back in 2017,
> which we have carried out-of-stream since.
>
> We tried to upstream it, and the patched rev'ed a couple of times [2];
> but it seems to have never made it into a yocto release.
>
> Though some other recipes mention DKMS passingly, I don't see anywhere
> that OE-Core officially supports it. Nor does my googling reveal anyone
> else who uses DKMS. I find that a little hard to believe, though I
> understand that it's probably relatively rare in the embedded space.
>
>
> @all
> So does anyone else on the list use DKMS in their yocto distribution?
> Are you maintaining a DKMS recipe out-of-stream as well?
>
>
> @maintainers
> If NI upgraded our DKMS recipe to a more recent version than 2.4.0 and
> submitted it again to OE-Core, would you accept it? If not, we will move
> it to our own meta layer and accept that we are unique in this regard.

I used to have a DKMS recipe myself (at my previous employer), but
never submitted it, because generally speaking, there are better ways
to do things in OE.

DKMS tends to avoid proper cross compilation (which of course we
already do), or is often used to distribute proprietary code (which we
don't want to encourage), or is avoiding the need to upstream the
module code (which we also don't want to encourage).  It also only
tends to be used on a subset of the architectures that have enough
memory/cpu to build on target, so by definition it is a bit more
niche.

We of course already have the ability to build modules on the target
(we have a test case in core that does just that), so what is in core
can support what DKMS needs to build on target.

I don't see this as something that makes sense in oe-core (but maybe
I'm not fully understanding the case, and where the current support is
failing), but could of course be contributed to another layer.

Cheers,

Bruce


>
>
> [1]
> https://github.com/ni/openembedded-core/commit/5789a27b68d95f3840bb8c4cb0d7b28d538c9a50
>
> [2] https://lists.openembedded.org/g/openembedded-core/message/100680
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
> View/Reply Online (#159558): https://lists.openembedded.org/g/openembedded-core/message/159558
> Mute This Topic: https://lists.openembedded.org/mt/87645999/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

