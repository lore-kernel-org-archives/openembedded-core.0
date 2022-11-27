Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA551C4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 21:55:45 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.102434.1669586142727576182
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 13:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IaRKdyy9;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: petr.vorel@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id b29so8730028pfp.13
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SJexZNZkQk0J9B52tktlGTDYiudhZvFA4Ludsl/ttL8=;
        b=IaRKdyy97udvgl44gT5cEueKVhWbFncTB9Xf+VVu3siK8E3Wvc/g1IF+Zat94m37Tt
         u9xQYj/e+MwjeN59t133A5iZjJDtMrP/OAtqq4CBeFfl/KtPz6HkxWs7r/Ejn0X3zIS3
         Ia5kR6TRL1P5omIRuH9hzkgbTys8l3OMD0x+9W0R8fpILJ5eC4ZGkeJxxAtfcm4qm80X
         jb7WEobpsO/bzjacoZ/KnoCgkwzbnL62vHW5+pT2UAotesoNFHFLrKvbB5D/KizdTFc9
         vVBlz7z0VafndERvWN0xAei+0I6Ncr6vD2bPnjQv0DX2BidUO4Gg2unzSIDjenW0ZqjX
         etXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJexZNZkQk0J9B52tktlGTDYiudhZvFA4Ludsl/ttL8=;
        b=4Dbt4eKgApONod0jcDuSK4Y50nLaQ6d+UQwDVtitNrsSd+NE1+1RAA7T01PtjeawgK
         ksyvl06z/NW0H8CeHz8FPa4s3wVdBowpji5NIhGNgg3NAQcPEWYzYMN+l9LBgpxcS7Ea
         S8IIUS1qybGhGa00V7yG19EdCEUR/OD/TtmJXBeWJiMTkF2jUhA0IVstAJvxwVNxSbVe
         htFHRfBG5a2IFT4R23FQKFITr46THXIlkhh7Hy/4jPQqtnufhLzsJ2PYb9A/N39oUnLk
         BSS6W4i9owO8mpa6pDnDNqq1+HxkswTLDN5K2WpAi5o3X3JfYRaZOoehXPvMn0N/7LDl
         lRNA==
X-Gm-Message-State: ANoB5pnAAKWzx2Aoq2hz49LHnO2ArgqIs23FJbc0q43OGkBzOoG+fOUX
	hFrp3+8zc63V7u/Umg2ZcdVlXogockHTpv4iUyw=
X-Google-Smtp-Source: AA0mqf58axFyl+RW4y0d7RtDV1YEYLtfqzQ1glBUcMZoYeT5wOja/HHf33GJt29iiHe3+FHjZt8Xi6PQMPg/clO8ZhQ=
X-Received: by 2002:a63:f90d:0:b0:477:7f9:aecd with SMTP id
 h13-20020a63f90d000000b0047707f9aecdmr31494995pgi.242.1669586142172; Sun, 27
 Nov 2022 13:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20221127151708.473859-1-pevik@seznam.cz> <Y4OvnGtP+XQBEjXc@mail.local>
In-Reply-To: <Y4OvnGtP+XQBEjXc@mail.local>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 27 Nov 2022 22:55:31 +0100
Message-ID: <CAB1t1Cym1x5-k7yG3QCB+br+J-d0AouFJMBHObywPb7-F-PO7Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/1] iputils: update to 20221126
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
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 21:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173886

On Sun, 27 Nov 2022 at 19:42, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> You should at least build test your patches

OK, I'll do. What always discourages me is that unlike Buildroot
build, openembedded takes so long.

What I usually do:
cd ..; git clone git://git.openembedded.org/bitbake.git; cd -
. oe-init-build-env
bitbake iputils

If there is anything I can speedup a build (e.g. using some of host
utils to build really just the target) please let me know.

>
> On 27/11/2022 16:17:08+0100, Petr Vorel wrote:
> > -PACKAGECONFIG ??= "libcap rarpd \
> > -                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ninfod', '', d)} \
> > +PACKAGECONFIG ??= "libcap \
> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', d)} \
>
> This probably doesn't work either
Not sure what's wrong on this, but maybe build shows that out.

Kind regards,
Petr

>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

