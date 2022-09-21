Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF1DECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 13:38:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.6381.1663767486068090339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 06:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JVM3mb9R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so3777753wms.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=DQ0hvor46PD7Sk6ZgnfcjD/oO1OsNN5VW0jYKTIHrCg=;
        b=JVM3mb9RBC2oZgRArDzyoX8dG46+RW7Jv6UBHWh2rQaFY1TcS6npVV+nbsqUZyRo9L
         dSyAbTw/dpjrI0PGb/C5jCPtzQniMJjKsV03YPxv9NM0YP0SfxU/69CeSFJn7nOTbNXw
         LFpKATow6zYdEJkrBmXVYS6Y6ubREJnxJpGHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=DQ0hvor46PD7Sk6ZgnfcjD/oO1OsNN5VW0jYKTIHrCg=;
        b=WjYFZPyX9kPpIrEYfJM+gQb/NXLAoo8FMvzPuDAByKT5aOamDux2lCiuDOcVvDK6Km
         N3BwwIdOPw1OxtpyN5VUa5jeavJazFYG8/a89KHnLS6EABXZXqXmVDQknYXJqQvBHICw
         +jMapbYZ9RlRoM6E74M77IBwAe35WCtx57G3hhDBaClMBeQULryW4v2mdI37yvGY3I+z
         2aRCn6M+g4pb5s5AbutcXIq3vR/kQPnRBryRYh+tIgmRjZyJz0LRPArTTKeglg2iVkJs
         2Sn/9GPtCSBdILefQn7Jbxczuhfinabd9qYTyJmkA4xltH/1ToP1h/qUozUUsom+Zr0d
         z/bQ==
X-Gm-Message-State: ACrzQf2vUoZychTYY4YTT8KbNkPz64aD5dxvgfipqTzKZUMBZwBQ/kek
	5zrZ3zAd1j0AKiaIgQXZHgjRd6MSKm9X5w==
X-Google-Smtp-Source: 
 AMsMyM5V2NGwXQHP3jdGwISsGdezQrH9kP/PZP9pSZGhnVLN3165yfjckha8t5lj8YRJfN8xLowARA==
X-Received: by 2002:a05:600c:4e02:b0:3b4:86bf:a3d0 with SMTP id
 b2-20020a05600c4e0200b003b486bfa3d0mr6009785wmq.24.1663767484324;
        Wed, 21 Sep 2022 06:38:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b663:b06:b4c5:e314?
 ([2001:8b0:aba:5f3c:b663:b06:b4c5:e314])
        by smtp.gmail.com with ESMTPSA id
 z2-20020a056000110200b00223b8168b15sm2426195wrw.66.2022.09.21.06.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 06:38:03 -0700 (PDT)
Message-ID: 
 <f24ebe6e876ed33b07719f339aadd5ef43c28c45.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] virglrenderer: upgrade 0.9.1 -> 0.10.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2022 14:38:02 +0100
In-Reply-To: <20220921075113.187693-1-f_l_k@t-online.de>
References: <20220921075113.187693-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 13:38:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170950

On Wed, 2022-09-21 at 09:51 +0200, Markus Volk wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../virglrenderer/virglrenderer_0.10.3.bb     | 33 +++++++++++++++++++
>  .../virglrenderer/virglrenderer_0.9.1.bb      | 25 --------------
>  2 files changed, 33 insertions(+), 25 deletions(-)
>  create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_0.1=
0.3.bb
>  delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer_0.9=
.1.bb

The patches weren't refreshed leading to fuzz warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5884/step=
s/11/logs/warnings
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5931/step=
s/11/logs/warnings

and many many more like it in that build.

How was this tested? :/

Cheers,

Richard

