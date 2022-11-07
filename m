Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE72C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:17:52 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.2133.1667848669182686262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 11:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Oom9yoAx;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id z24so17823323ljn.4
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 11:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uEncH0qOA0e3CDtr/up3OMtW5TBf8tC7Yd2ldUZOYPI=;
        b=Oom9yoAxJtFxvej87EuoQYQPupaLDRfyuuSMem5E3fZEO2HLcjsSvzCtCo172S0oSz
         avx3RXK6tjat92lpEkZIeWubOcR0gCsO3lh6EVFkq84Pi/TI8lwUTV1T09SPIb8uku0k
         ez17Rq6mVDz7x80paxBejbo83pCBBkaNNWAL/XwRrOCA55GmrlhBNn9p3NqZ4rhJDqwh
         DeWFtXI/tZvQj1WsuWH1MY1pb2s4Um1nYCojNtIrd7NNjS2/TeqaPFSIT1BwFbDuXFGZ
         LCl46/2yz24bpcyqFUfhGRMyDVFY6uJEm1FBMlJrlXz0/n848zfe3ZbD1ZkIjcSA0i3H
         a5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uEncH0qOA0e3CDtr/up3OMtW5TBf8tC7Yd2ldUZOYPI=;
        b=R7JCXBwXCBKx/lbgC7/+de9XHy5acm650s900EepWEyj1NOWns+adQueAeXt/QgSbD
         OjjoIi5b3O0M/zHJi0I7pumYiiW2eyClkJeLISa+oGRxJ6bRx/84HVKlrmq+gsdUVX37
         RyNGX/Uh7x+YrNRG0izVTV+5r2rJh0g/3e+dsLqVYfy85TtfMkSDLbCxR1PAD5+zRLIj
         8qri7M/ATx9bEZmmYZMV8g5AVdnv9Cal+phSuJW2/6VqS1l2GFjv45RzyZ3wZD0Xledk
         BMc91bDoxnl11iMCxjUC98e6giXctCVaTDhJ0FidZjyw0Ks+mwwsOB2ySxejANnTBGpA
         isfg==
X-Gm-Message-State: ANoB5pn56xZZ5EqhaVZdWyGep7gRfpLIyLkGLtYk0nd7cHPX63zrrP+I
	y6O9gnu3xZtLmFTC4MM7vTpsMYLZwNXKPdoczac=
X-Google-Smtp-Source: AA0mqf4cmGCuhodkBI/hylzZSoErWEhpRugIdu/lPMgdIH84KS2j2YhrAF3E6mXEM6hxwNONYASPH81F9voUvpreAA0=
X-Received: by 2002:a2e:7405:0:b0:278:a461:cb73 with SMTP id
 p5-20020a2e7405000000b00278a461cb73mr3187863ljc.31.1667848667345; Mon, 07 Nov
 2022 11:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20221107145508.1051404-1-alex@linutronix.de> <20221107145508.1051404-35-alex@linutronix.de>
 <CAMKF1sqCg_V_-aSv7BeEBfvbzJNy2xq+N9fb21gfK78xbrWg_w@mail.gmail.com>
In-Reply-To: <CAMKF1sqCg_V_-aSv7BeEBfvbzJNy2xq+N9fb21gfK78xbrWg_w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Nov 2022 20:17:36 +0100
Message-ID: <CANNYZj_bqc065F9V_BdLf_kZAc9Jaa0Nn+R3mAj3qwigFrZ-PQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 35/48] netbase: upgrade 6.3 -> 6.4
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 19:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172932

On Mon, 7 Nov 2022 at 19:09, Khem Raj <raj.khem@gmail.com> wrote:
> >  }
> > +
> > +S = "${WORKDIR}/netbase"
>
> Is there a change in path name in the new tarball?

Seems so:
http://ftp.debian.org/debian/pool/main/n/netbase/

I didn't expect 'devtool upgrade' to be this clever.

Alex

