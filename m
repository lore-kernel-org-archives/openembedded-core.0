Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F1FC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 09:13:06 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web10.24265.1647249186316477038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 02:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fzXez3sA;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id s195so7940290vkb.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 02:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6gjfX2aWP0FEE3dGO0bBN4wSA3/5I+4ni8/G9s8e9BU=;
        b=fzXez3sAEibco3+aAFAcQXDoCg/T2xQ2of3o4NOtl/qL4mcxB+kYhyMFF6gG9zwOd+
         uVgMy9q5xXwPKTYHXTUQfRUTXKhWs4ojSm85VgFz55P0Xkxmr66dAWXc2D5jAk7Kxsrn
         Em9l5x4KFuo/gEPfXK5Y/z5Wn+tbOxRsicP2RbclI6Do9p5+ezJ8Hain4id8bzrbQaPJ
         59CeaBViIf3bpR0WpnxK5OOCQ71q7TptPq66hqluSKFv+s6VqTK0tdcvOJkyP+cp20wV
         NToCqMiFB3xoPnO4T08qXcNDNjH5VQ7SrXq/QMstuc5tNH9WVMPqJJv3V9o0TDYVxn/t
         VwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6gjfX2aWP0FEE3dGO0bBN4wSA3/5I+4ni8/G9s8e9BU=;
        b=mlAYCmCfedtFE62cWE8GG0i/3lo5E8wwXtkgmW0pb2x4Ie8G5/2ozuS2rY+Wn9EBNp
         +Fa4tTvctR+nuW2BNa+pgJyKR2ls6BVfqcjqNDLQ9lxp95o+O4BXUTc77J7J+MviSMhv
         aiQVKZGD0+nm7kvfSLGLewWEOWSfhsdKkGPYSsla1l/q/Z/URNvIEPD2T8N6FFjL2wTb
         SNKCjqx9WBAI6a0IuBMSKRWt6AOTcaf8F0Rm8kcPrK0cbYvdJIoKf92XAGh11fe2oUUi
         0pv4NJo4+YSiL8ENx9pgo+uhxsSPdtarTQHD0ZRQgCiu5zpYlJxX9jzqPX3Vj6kVipgU
         W2vA==
X-Gm-Message-State: AOAM532bRnZL5xiFaGQMrGNZevBTCAbrQKjvxrLV8gBnct6+ovRuaLc5
	3z3mKRWed9aF8OjmnhyVqKqGTbiHFUYbjg3Ey/I=
X-Google-Smtp-Source: 
 ABdhPJzP889mQ9L+M5eytZy8AchmZQoufBgPKxD7iBCD9dNUbwOIMx9FdPP2slCDeesYQ/66BJ9E1yIKH3xnYUMJ2wY=
X-Received: by 2002:a05:6122:208d:b0:337:7db2:8684 with SMTP id
 i13-20020a056122208d00b003377db28684mr9165074vkd.1.1647249185382; Mon, 14 Mar
 2022 02:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220314071037.3702941-1-f_l_k@t-online.de>
 <CANNYZj98CMmxXUKXhGboOfK_9WTu499GL=EomTpw9Y3SWS3oaA@mail.gmail.com>
 <74c5d185-8abe-6afe-724c-8cc7b6529997@t-online.de>
 <CANNYZj9wcs9-XFD_zXob3i6WiwqMedeaC9qu7cuhGBcaqLyeGw@mail.gmail.com>
 <506cd2c0-20eb-a782-a34e-506d230bc32d@t-online.de>
In-Reply-To: <506cd2c0-20eb-a782-a34e-506d230bc32d@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Mar 2022 10:12:54 +0100
Message-ID: 
 <CANNYZj9zCgyxo8_DJtrOuDiXYxK35KWTypGnbRx6-i=HnZ2i-w@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] cairo: update to v1.17.4
To: Markus Volk <f_l_k@t-online.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 09:13:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163135

On Mon, 14 Mar 2022 at 10:07, Markus Volk <f_l_k@t-online.de> wrote:
> just when I thought it was a bit inconvenient to have only one version
> every few years
>
> and no bugfix versions in between i found that there is something like
> that on gitlab.
>
> https://gitlab.freedesktop.org/cairo/cairo/-/commits/1.16/

I'm fairly sure it's a question of lacking maintainers. It's a major
problem everywhere, the market economy just doesn't reward that work.

Alex

