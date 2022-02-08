Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3FEC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 10:25:22 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.9333.1644315921002978414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 02:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BWe6bkli;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id w21so24745959uan.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 02:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UJIMFzr97pdH/Lga82V7OPwT9VYDRWlkyFKIvVw9A94=;
        b=BWe6bkli7ttssFKrSUmR/8fyFh60jzjdxreuIdw80RiRZLN6Lb3DczsX1cDlmqwgEU
         iw4ndBSpggj7MKNPyeODx9jGaLdhrpYXU8EjSK0Z7s8zW8nf16OLQxVVlhWDylxaZhKP
         SwF9O/t8GEen8XtE/OIId+Y+76o7TYQSyOBHYMu023NOREYlLX5cbqSemU2P8u0IBRbu
         yjyJ2NRtIlg1nkmse1Z9ytyEmWapl5mDMab5V3e5JsM+akliI5Ay/Ih30grPq5+tvgRa
         6xQi9asYzj2YB7RqhrxJcT5ESvA/bApxOik7YOYnD9TCwP/ov0wB9Bt4gtHaOgzlrlbs
         Bv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UJIMFzr97pdH/Lga82V7OPwT9VYDRWlkyFKIvVw9A94=;
        b=ackQ/qdwZznAjeJhszAdrojCSSAT0nG89d1AWrA42s8gj5a+WNrTtO+5pjA6ezprKn
         Px+kS9bziGcumWkDmzLWsEk5lhimPIVCAIy9ZBjhcSMlz2Pr35Q9zntIsl5V+eD2hrf1
         /M/tj0E6+uafWlErNdq7S2gyx8g1PekVmRBkq2SgmC7khDTyUaAg1R1hm/itL9W1xwAx
         67uSVHxvN35Ol6wDmtn+EBAQNIKw1WEGQ7B2+dDxvP7lil93qqpZpBkpiSONqYNfdZs6
         IidOwgQJZXq7EUTIx7ZL7xxjX5gu7BXSZAo/lNnZPnUIDO2zr7HwrDKPPuAZhtPvq0xl
         FVCQ==
X-Gm-Message-State: AOAM530bK00+ekP9boM3Pdc2gA4Fih4iq8ZFlyxJmarN9dOEIq6TmSz/
	6hznkXb16Xp9rkvQq0HpaiqbMswoO1sKhodvMxM=
X-Google-Smtp-Source: 
 ABdhPJxKkgAhh2Wc7+PpDvb5+9I6g9nqWmoSc+7uvOcDaRhScbpFYIDPx15B78/VseqalviOfTxl/t2LxbY+vx23cF8=
X-Received: by 2002:a9f:2c0a:: with SMTP id r10mr1301150uaj.89.1644315920072;
 Tue, 08 Feb 2022 02:25:20 -0800 (PST)
MIME-Version: 1.0
References: <1644308725-5262-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1644308725-5262-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Feb 2022 11:25:08 +0100
Message-ID: 
 <CANNYZj8X+Ryn4Jo5U=j=FcAjfff8o-J+TqZpr3HdGSA40amRVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ed: upgrade 1.17 -> 1.18
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 10:25:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161490

On Tue, 8 Feb 2022 at 09:26, wangmy <wangmy@fujitsu.com> wrote:

> License-Update:
> year updated to 2022.
> license changed from GNU3 to GNU2.
>  LICENSE = "GPLv3+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
> -                    file://ed.h;endline=20;md5=b72aa5eaafef318c6bfc37f858469113 \
> -                    file://main.c;endline=17;md5=2c93e24f4db3528a00a24c7df5618e41 \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
> +                    file://ed.h;endline=20;md5=6e6a818b0593f937fc63ba08d5e314bf \
> +                    file://main.c;endline=17;md5=8419a08bb12936f32384a0d1c0f9e74c \


If the license changed, you need to update the LICENSE field. Also a
bit more research would be appreciated: can you find and link the
commit where the change occurred?

Alex

