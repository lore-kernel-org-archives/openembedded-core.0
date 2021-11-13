Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81975C433EF
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 09:29:06 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.4271.1636795736981761540
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 01:28:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iLaq/UYm;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id p19so10771312qtw.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 01:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6PQ6E70AQatJA4V1vARaIM5MpRKy7WAcTGGnTjsjF48=;
        b=iLaq/UYmqajLaJowTpdLmKvXdgnry8fon8ZnZH0Q/tCQYjwCF8706YFgEBFAhX795D
         /JHoYNQ6ht5KNPgaLJ80+TCfGbHEOcs6fJyTiEHxOUNyHQHKhhqpytMGdHe3a9vV6oEZ
         g0m455El1nHdDSTJXBhKcqhIltjkdFqeuFuplaiXV+NKWggfjspa4Wj/tGMArlZ5Ll6d
         ZSck3E0lusiY52K/5TN9zHXC3CCPs3qZp6Thz9drXDnuyb63Z/X+7pJ4yNxbj6X5eKfJ
         /iPfqJgWK6FxXEtBe3qa8X7KnXeKz9RBNzjxugJH6ErD8k+GDXLk3OUK8Y8942YXc6RN
         UDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6PQ6E70AQatJA4V1vARaIM5MpRKy7WAcTGGnTjsjF48=;
        b=7Jd6cFtm9It1Vxf7tBRxTV0aZwSrjVYwe+Itk+3JCWtpsdFHaINxh7hwzi/j/i5pdN
         Baqi+iFZiOOKeT5wG0mDT2tpf/f72EryPaqGGWPU22dT7yM+L/occuoD+BF6pbSEUekx
         gYXiKxQnQpgw4RV7AjBYDlSON85MYOOxMctTsA17dEHHfGLguGh8m4247LDQ96NJlxKj
         a6NP2CnUWgI0RKFBzu0eeGpLSlBwfTQkT3Q3kxPOQJ/Iy3z5wozxeT8otLB+YERtOx0D
         S43wuOtQhsUW6L1oC7nLDXdApGLoZrs9RDlpxE2Tigy9O9JpYo4B046OETKUfWfLszXW
         vkaw==
X-Gm-Message-State: AOAM533lq20l1fn+FcagS1MevNRiRsL0dW0kmZNqTFF5M2oQ2MOlj61k
	G8Q5ahymNi8KySHX0Uo4g1AkbW5fgkVkF3kw6CQ=
X-Google-Smtp-Source: 
 ABdhPJwAd2qG/14smU/6mB/PcbGPWAaX0TLHIVN1XcRb6Aa3rRoL4/fiaDSZJdq2PnompEZXOI4iFAZAVjQoBYr9WGQ=
X-Received: by 2002:ac8:5786:: with SMTP id v6mr10882025qta.225.1636795736060;
 Sat, 13 Nov 2021 01:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20211113083234.3913831-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211113083234.3913831-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 Nov 2021 01:28:30 -0800
Message-ID: 
 <CAMKF1sqOKP1V=nLqRkqNW6VzAmyxzH33PUoY0NG9PwzewGKybA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] packagegrou-core-x11-base: Drop dbus dependency
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 09:29:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158241

typo in subject line

On Sat, Nov 13, 2021 at 12:32 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> dbus isn't an x11 dependency and this suffers from debian renaming. Simply drop
> the dependency.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../recipes-graphics/packagegroups/packagegroup-core-x11-base.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> index 4e6d9908c74..0185c93354c 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
> @@ -9,7 +9,6 @@ REQUIRED_DISTRO_FEATURES = "x11"
>  RDEPENDS:${PN} = "\
>      packagegroup-core-x11-xserver \
>      packagegroup-core-x11-utils \
> -    dbus \
>      matchbox-terminal \
>      matchbox-wm \
>      mini-x-session \
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158240): https://lists.openembedded.org/g/openembedded-core/message/158240
> Mute This Topic: https://lists.openembedded.org/mt/87025059/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

