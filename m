Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0A0C433F5
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 21:11:02 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web08.24139.1636233061061184872
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 14:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WVIG6JEN;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id v138so32311223ybb.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 14:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yGehTjBrC71JJ6J3bkqbqdtBgCTXTOl9gfahWXpXXu0=;
        b=WVIG6JENVw2zN5phCNDoaQuZdgTcSTs59O336RSpjxBywlAiKQQ2n5oS4VM6UBKq3j
         40ViEI8yY96pgWTZaHkkIdg5Sl0zGML2L0qbrm5DaBuyF8umzUdJwkcYRBzQ1W8jMbV5
         iKGsp09mrQu3oAmgg0023FtO97/NtiCOxiWca7ex4CMrcEp4lhmVg0/0p4OzW5S6PzcV
         7EPK2SBwyfKM/1IHTytFA1IJ4ozAzB9yrFYql0783LTalGDlomG8hCoKMSrvT6ES9BMG
         RAl/VdjI3+Fk9WcacvOry2ikc0Z1xL685p8Y9EjaUmlgeKSMb6ydEtm4xl1yvoMuKlAW
         cnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yGehTjBrC71JJ6J3bkqbqdtBgCTXTOl9gfahWXpXXu0=;
        b=EbuDjAVIvW8Q5IVBKiLYAfKhbyNSPZZbqJihfB+JZtNZNF9ewDZN8l2IMRmmLFMtdE
         Q/kqTDV8t24jJBQ8olU2mz+L/QzVroe+U6mmBISvuUpQT09Xnbp1un8S3k+Y3sX2pbxP
         8y4TR6QA2ZPJe0bbLANO26tB6s/B54fbeb5cfetljbHnA4m8FiIJ0bIF8juEf2YEYtYJ
         wrKDdE9dRZpriqBwcq0qfK3xsV9bsd8nnC+Z7nI1a8I0i9c31f3hgvUsW5e6ufKLeuvr
         g8BW8yyPZKwHr914rpFE2g28vaO0vNPBXSa2YXxOw6FiFNGL27j8qI7Km7kHKRti/hcK
         2euA==
X-Gm-Message-State: AOAM531Zy5V5QxchV7s+QcZz4UnuXryETjHmFe1fxhFLCRBwAN/ndKJn
	y9BUNVk6ZJd8QaTPhOPclIpKxVAKXXBluI4/Fdg=
X-Google-Smtp-Source: 
 ABdhPJyhaWAV00lWgDktV5ycND+FkaQJl29Nog787MBkqYoDY76iivO9NnE1AshzaVAQpI4R3lw8yU6ca6mnuvMSM4g=
X-Received: by 2002:a25:7102:: with SMTP id m2mr72790277ybc.25.1636233060269;
 Sat, 06 Nov 2021 14:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211106125915.13227-1-marex@denx.de>
 <CAGDS+n=4kaGR8_3QmAEopN+paMnBPPXfFTTuK2nujrXM_tqEFg@mail.gmail.com>
 <d1cb91bd-3bf3-928f-d57c-be677220ebf5@denx.de>
In-Reply-To: <d1cb91bd-3bf3-928f-d57c-be677220ebf5@denx.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 6 Nov 2021 11:10:49 -1000
Message-ID: 
 <CAGDS+nnJkVMNUc_gZq6gcM3VeUbwKkc01=rjj5obqaACgnU0uw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] piglit: upgrade to latest revision
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Nov 2021 21:11:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157945

On Sat, Nov 6, 2021 at 6:24 AM Marek Vasut <marex@denx.de> wrote:
>
> On 11/6/21 5:01 PM, Steve Sakoman wrote:
> > On Sat, Nov 6, 2021 at 2:59 AM Marek Vasut <marex@denx.de> wrote:
> >>
> >> Update piglit to latest git revision and update the branch name,
> >> since the original one is no longer updated. Make sure the VK
> >> tests are only enabled if VK is also enabled in PACKAGECONFIG,
> >> and that this is opt-in, otherwise older systems fail to build.
> >>
> >> Cherry picked from squashed commits:
> >>    eb3a8d4c7b ("piglit: upgrade to latest revision")
> >>    a27b06f73a ("piglit: upgrade to latest revision")
> >>    bb091bc0be ("piglit: upgrade to latest revision")
> >>    394746d1cb ("piglit: upgrade to latest revision")
> >>    5aec8cff94 ("piglit: upgrade to latest revision")
> >>    fc4c82773d ("piglit: fix reproducibility")
> >>    6fbec0f12a ("piglit: update to latest revision")
> >>    8d23a0d498 ("piglit: upgrade to latest revision")
> >>    5144d515fe ("piglit: upgrade to latest revision")
> >>    dd085bd577 ("piglit: upgrade to latest revision")
> >>    9ba6df1b2c ("piglit: upgrade to latest revision")
> >>    1ccd71eb3e ("piglit: upgrade to latest revision")
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >> Cc: Anuj Mittal <anuj.mittal@intel.com>
> >> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> Cc: Steve Sakoman <steve@sakoman.com>
> >> ---
> >> NOTE: Why backport this -- because graphics testing on oe-core dunfell
> >
> > I am having trouble parsing the reason.  Could you explain?
>
> I just want to be able to run latest GPU tests with all the fixes in
> place on the LTS versions of OE builds, not some obsolete broken version
> of those tests, that's all.
>
> Since piglit isn't something which you deploy as production application,
> but rather something you use to test your drivers (both kernel and
> userspace), I think it is OK to keep it up to date.

Thanks for clarifying!

Steve

