Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BE9C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 09:40:09 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.4300.1667295603703191614
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 02:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WzDfxMN9;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id x21so18707796ljg.10
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 02:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=03aUSS8J9gukHKFn05PPxKIYqG5uVoA8oyTh1rd00Wg=;
        b=WzDfxMN9x3qWtQvwqlyoJjiwUD75b2lO90ixrxxtdSEZgvJWsHdwvldcdXi8+bml+P
         Xx3mwAQR2DnLC1Gyisn/e0JZpqP9yBKtYGl3ddArYUvqo7UP8GUTwaCPZeWsFbvyrarO
         Sy62PfPIBsrGH7dbPv+PTA+EhLIulRns7Otgp4QPn9s31OcNnRSeFrnTovkFBOaCEQ4k
         9b41eaytKHQH5qLjao9DPvvHOrAbHJcZss73PVNVyN1pZ48z44wh6wCLuE1j8x8g0+Cl
         2T1Vx8W9HsYkm7BPb7tdouQUijkmYjfv17MJxSpeTorcmI3HJCk+R2x8g+Vxsxcck5Ay
         P7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03aUSS8J9gukHKFn05PPxKIYqG5uVoA8oyTh1rd00Wg=;
        b=dPWpBg9N6ytFxvc3cdBKLehVPTdEbbZ2MOqbucdUlYvfOtGq69/0dNouj4G1EYPM8a
         sJ9Ngyb8pu+zSnO4v8Jv4bnv8oaSCNfNatGqg4PuwYDDdChOQdrj+tkV8GIyLi37Sne9
         TaBU4XVw7OAlae1q/EXj4sYvlAmrmXZxn8pDZaCiA29lDGISDDvW48F2i3A/iz3YnqBS
         csqPlSZOc65mfmqpxNnh74aBA7VOgojmpkkyDhm4Lj6nSty5QbuU9DcH7x9rn8UL0utJ
         FkDw3yGYffQSlTYgDdOusSljjzhNu54KgKpqTc0rw/gyoVcES6mPxu3uAZGxdDguT6jk
         bMcA==
X-Gm-Message-State: ACrzQf3gkxjwzFKOAUOt/VlLkW7vPvdqGMCZcd9IlYOKf4Rj9B2hdzsa
	b29lNgephhSr1PThlAtxrCaNxA==
X-Google-Smtp-Source: AMsMyM4Dt1IbemSM5SpQ7/+9LQ/TSJbW/5ljcO9hqB3mf05CCj2eUj3rq7nzLauq2WX1ImttqB3+bA==
X-Received: by 2002:a2e:9c88:0:b0:277:139e:6a3d with SMTP id x8-20020a2e9c88000000b00277139e6a3dmr6892762lji.527.1667295601156;
        Tue, 01 Nov 2022 02:40:01 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id z24-20020a196518000000b00494978b0caesm1598502lfb.276.2022.11.01.02.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 02:40:00 -0700 (PDT)
Date: Tue, 1 Nov 2022 11:39:58 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Bergin <peter@berginkonsult.se>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] systemd: change syntax for SRC_URI append
Message-ID: <Y2DpbhnSdM2tyyyw@nuoska>
References: <20221031210902.169924-1-peter@berginkonsult.se>
 <CANNYZj81UaR6CojRriPNwGbq76mk+0Y+j8khBy2ZTrUqm4R1jA@mail.gmail.com>
 <e95e1314-a709-1f5a-548b-e27b4e5d3362@berginkonsult.se>
 <CANNYZj_A3cUHCjkys1_7DtasJU5sD5z0ruQv=WjSVCkwGKjbbg@mail.gmail.com>
 <35e2faf3-7cc5-a266-12f3-73ef600be8b7@berginkonsult.se>
 <CANNYZj-8-Ao5yj=rU7qS9oK=mBASs0Fm0=28sxp849DCOSVw-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-8-Ao5yj=rU7qS9oK=mBASs0Fm0=28sxp849DCOSVw-g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 09:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172356

Hi,

On Tue, Nov 01, 2022 at 10:10:45AM +0100, Alexander Kanavin wrote:
> On Tue, 1 Nov 2022 at 09:12, Peter Bergin <peter@berginkonsult.se> wrote:
> > This opened my eyes for the way systemd recipes are built up in oe-core.
> > It seems a bit the other way around. systemd.inc contains almost only
> > version information. systemd_251.4.bb is huge and contains a lot of
> > thing that I think can be shared among versions. If it had been the
> > other way around it had been easy to have a systemd_git.bb, including
> > systemd.inc, in my local layer (or upstream if desired) that build
> > systemd main branch. What do you think of that? Is is worth working on
> > such a patch? Or are there reasons for that setup?
> 
> I prefer the opposite actually. Where possible, I fold the .inc files
> into the main recipe because that makes maintenance easier, and if
> someone needs to change that in non-upstreamable manner, they have to
> perform a full fork in a private layer. I do not like bits and pieces
> of code scattered all over the place and gathered together by bitbake,
> that does not help readability.

systemd contains both compiled code and large amounts of config files
which frequently need to be changed in various ways in real products. Think of
all the defaults for systemd-networkd, systemd-journald, service files etc.

Thus, it is common to have a bbappend for it which either patches
or otherwise changes these config files (e.g. sed in a
do_install_append()).

In these cases full fork of the poky side recipe is not needed or even
wanted.

What breaks these use cases is use of :append to change various
variables which users also need to change. A SRC_URI:append with 10's of
patches needs SRC_URI:remove for all of them, possibly increasing with
every security update gets really annoying in a .bbappend and users will
need to fully fork the recipes.

The .bb or .inc way of handling the main recipe doesn't really matter as
long it easy in a .bbappend to amend things to the variables like
SRC_URI and that these amendments work when there are small updates to
the recipe from e.g. LTS branch.

Cheers,

-Mikko

