Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07629C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 22:58:47 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.39.1642114726213194223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 14:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=bwv6vCos;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id y17so8993502qtx.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 14:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b+i7rtmgnJMownyVM/43hogMhsZRTWU+0yCV/JR0Ek0=;
        b=bwv6vCosjtB+ty6l86bEPfhDPjXgbkuC8VDbGuhuE1IG65qL88bpEVhueFqWD3F8zk
         EhrWOS8CE/vd6Joy2ffv2Y6imWG+mj1H8f9Y69EXo25JYSkbs7N/HeVZI0makcKbYcia
         MWYDXzbo02Q3SFZKqvKDkgCKpg3IW0k5FO+Fi+XyS2XbpCWwsqnhLxYD1ZdeRQE2vqZo
         7ke10W11+oQ9UOpGCriJ7IPvTJJDwRhyYhShmBDfxRoQ1GOoRGdLkabNl8Dw8medfmIe
         KF360vn4gop31Nc4oZ42ZvOMgoHbZxP77R3/oVN6O11qSi0aZQsFgGwbN4y1hSlMTek7
         Ur4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b+i7rtmgnJMownyVM/43hogMhsZRTWU+0yCV/JR0Ek0=;
        b=xwbNgVQK6f6+nYme99YZ01hHGmRUG2IJ4wgwCQQXMmHuwRqwRJtoMstJnoYvkax2PF
         ICqA16gVnJhVWxbbvrU9BMjSfrDBi7uIqNvEMaSKZvbxe5fEw8b+Nm47HBlaDlVQZocK
         cIw4HU3TQjFtf7qEd4zNIeS0f7n8jzvbmBC5Ta+AM659Zzj7UkJdm1y2CIiZt3C5Qwkg
         1LqXl0jLMNOnFh+jTwHcZulu4UoUGK/aON+prPChw2Xv6CCDdIH5VXjfhXLi/2pinty4
         VB5mv+BZHjxpq5UgfW1xijEa3iJhj+Nj4M2hT1kDpA7FUZRPyJm2wC4lMSVhpdvKSfqv
         i5kg==
X-Gm-Message-State: AOAM530tOGsCcgOyLoyO6R6afwnhe3GEOHUGhxUMhsnKKMqoSLhfnF9L
	3moUoR78y7XdYjMIvCRr8gttJQ==
X-Google-Smtp-Source: 
 ABdhPJwWgWq5ijV+1IlkXUJgrmfrQxMqP4DHOetVtHcik1btEEBLMg3h57d3fHu1cIxibsnVn2IWgA==
X-Received: by 2002:ac8:5c09:: with SMTP id i9mr5450255qti.413.1642114725312;
        Thu, 13 Jan 2022 14:58:45 -0800 (PST)
Received: from kudzu.us ([2605:a601:a63c:b500:df9:ee38:a0f0:1841])
        by smtp.gmail.com with ESMTPSA id
 u20sm2549189qke.3.2022.01.13.14.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 14:58:45 -0800 (PST)
Date: Thu, 13 Jan 2022 17:58:43 -0500
From: Jon Mason <jdmason@kudzu.us>
To: Kevin Hao <kexin.hao@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] tune-cortexa72: Enable the crc extension by
 default for cortexa72
Message-ID: <YeCuoxwTpqkh/5Nv@kudzu.us>
References: <20220112090708.1597301-1-kexin.hao@windriver.com>
 <CAPoiz9wdB1z_mC5Td6RpN63ED_7Mm+7vBmDQtf=XoRmYLwCrVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAPoiz9wdB1z_mC5Td6RpN63ED_7Mm+7vBmDQtf=XoRmYLwCrVA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 22:58:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160540

On Wed, Jan 12, 2022 at 02:23:38PM -0500, Jon Mason wrote:
> On Wed, Jan 12, 2022 at 4:11 AM Kevin Hao <kexin.hao@windriver.com> wrote:
> >
> > The crc extension is optional for the ARMv8.0 but is mandatory for the
> > cortexa72, so there is no reason not to enable it for the cortexa72
> > tune. With this change, the cortexa72-crc seems redundant. But we
> > had better to keep it to be compatible with the BSP which already used
> > that tune.
> >
> > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> 
> Acked-by: Jon Mason <jdmason@kudzu.us>
> 
> From the GCC sources, it's hard coded for A34, A35, A53, A57, A72,
> A73, and almost all of the others listed.  I can patch the rest.

Looking over the other ARMv8.0 that we have tunes for, there are none
that have CRC except A72 (which is now removed).  And `git blame`
shows I didn't add that (much to my relief).  So please disregard my
comment about about needing to make additional changes.

Thanks,
Jon

> 
> Thanks,
> Jon
> 
> 
> > ---
> >  .../machine/include/arm/armv8a/tune-cortexa72.inc    | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > index 3651cf6e802b..4c9add32f5f5 100644
> > --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > @@ -10,12 +10,12 @@ AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
> >  ARMPKGARCH:tune-cortexa72             = "cortexa72"
> >  ARMPKGARCH:tune-cortexa72-crc         = "cortexa72"
> >  ARMPKGARCH:tune-cortexa72-crc-crypto  = "cortexa72"
> > -TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a} cortexa72"
> > -TUNE_FEATURES:tune-cortexa72-crc      = "${TUNE_FEATURES:tune-cortexa72} crc"
> > -TUNE_FEATURES:tune-cortexa72-crc-crypto   = "${TUNE_FEATURES:tune-cortexa72} crc crypto"
> > -PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8} cortexa72"
> > -PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72 cortexa72-crc"
> > -PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crc cortexa72-crc-crypto"
> > +TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa72"
> > +TUNE_FEATURES:tune-cortexa72-crc      = "${TUNE_FEATURES:tune-cortexa72}"
> > +TUNE_FEATURES:tune-cortexa72-crc-crypto   = "${TUNE_FEATURES:tune-cortexa72} crypto"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8-crc} cortexa72"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72"
> > +PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crc-crypto"
> >  BASE_LIB:tune-cortexa72            = "lib64"
> >  BASE_LIB:tune-cortexa72-crc        = "lib64"
> >  BASE_LIB:tune-cortexa72-crc-crypto = "lib64"
> > --
> > 2.31.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#160480): https://lists.openembedded.org/g/openembedded-core/message/160480
> > Mute This Topic: https://lists.openembedded.org/mt/88369540/3616920
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jdmason@kudzu.us]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> 

