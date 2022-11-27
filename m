Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A76C43217
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 15:14:23 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.93579.1669562058589820677
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 07:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j1sXk8+L;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: petr.vorel@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id s196so7822494pgs.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 07:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YL3ZlAMdgQ6pBrH20ZIUhlYUOf8Mb7YGYBJ7Lt5mqT0=;
        b=j1sXk8+L8Q/jZPAtNrTlS8B4ml7Bx1LBlzklmdpFSPdeP4w7O4mS9jpobNSWqBPwOi
         RFpU88634WGGWN9b4hmSvoZZhAwzbP2R9UVjo1ssglssIkG7Is/1dEADkyfDEdhpCRfo
         BmGxRUJf+mpnxP6ivMkmftgj8x72zZsjPukFmJuOvJhsvMsu+uvqhzEZyOE57wwz/7Wt
         JwI2Aa0QG/O6nlaUSbP522ev4VNqNY+jUbg14LCHPeYRIS2tuQ16fTpB93xdYM1y7shJ
         JPfQCdmJNCCstD+xNpYz2S22+R0XWrMuUA2Y9tilt/wUotm4SrVrRh6CltreRdCCe3wx
         ou6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YL3ZlAMdgQ6pBrH20ZIUhlYUOf8Mb7YGYBJ7Lt5mqT0=;
        b=lYNZo/CbeqzE/O1/jQWXMwKrBqubnmeXQg3+alWXas08HSevb9KC0J/rl9+blkdgdf
         sEjxusq+cPPD4Q+5DkuRlS754UjUfPxLiavoR2ka5+NUFom2EHE475O1K0eEktkooSOH
         ys21YFriKl1aHOrR+Qd/uCUHyPlRSyByod4oN14E1RHuVgx4aX68jqorrmhgxj3F08xr
         9izmLrGOKg89e//yGwcQ7flxJojIHbuGhVOZ7CSRvP+FvlmWyiSnY7ftUIMqE91DRPIe
         6LIvr/e5v6unsZzdVOqqWRun868ZmElxsctGBRj4w2zBu5vbKSU4ic+ZTpBx/i9Xjqyn
         Md6A==
X-Gm-Message-State: ANoB5pliG4cyI1/C/oouxD1epIND8E1cr80h2XaFWqisXVOwNDY/15ik
	U/766dK7ZCYMNl2SNdSOfnfS9Of2+XVjoNllaZw=
X-Google-Smtp-Source: AA0mqf5kFmghRlzKf2bsNm3ttwwRcxY5AVqW/7uSRjtcovUBltd2//+SnHZcey3e7hAY8BlnDkvj5J1Y3qkS62Xobwc=
X-Received: by 2002:aa7:80c4:0:b0:574:8c08:595f with SMTP id
 a4-20020aa780c4000000b005748c08595fmr16522285pfn.38.1669562057698; Sun, 27
 Nov 2022 07:14:17 -0800 (PST)
MIME-Version: 1.0
References: <20221126005057.464290-1-pevik@seznam.cz> <Y4JXHYTQhS5ODuBy@mail.local>
In-Reply-To: <Y4JXHYTQhS5ODuBy@mail.local>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 27 Nov 2022 16:14:06 +0100
Message-ID: <CAB1t1Czcq2t3Rx8PJ7jW1NDhPrY+QUHY0vwaf_6jegu2rhNuRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] iputils: update to 20221126
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Petr Vorel <pevik@seznam.cz>, openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>, 
	Khem Raj <raj.khem@gmail.com>, Changhyeok Bae <changhyeok.bae@gmail.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 15:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173878

Hi Alexandre,

...
> > -SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff ${PN}-rdisc \
> > -             ${@bb.utils.contains('PACKAGECONFIG', 'rarpd', '${PN}-rarpd', '', d)} \
> > -             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ninfod', '', d)}"
> > +SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff \
>
> This line can't ever parse.
Thank you! The problem is in previous line which should be:
SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff"

I'll send v2.

Kind regards,
Petr
>
> >  PACKAGES += "${SPLITPKGS}"
...

