Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C05C38A02
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:09 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.2315.1649356663731848076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 11:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ofYwlqXq;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id ot30so12596147ejb.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 11:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q/qQSvYwf8HXDdVR1Cl6N3LLFqGPEQTN1dbjdtkTf5E=;
        b=ofYwlqXqRQ6+n+uWY+Nic/NE568nTOgkVaOMMQFRwf8Hxaba4jKkkuw19COD6Nt83U
         llxhanctp0X8+Lmu/rNp8CkrM/VOJ8xmFY0Eg2mhDKSgGD7OO/cKbALqmaVPrCcwh3fv
         SqRq6FZzxCX9iOHf+2pN9F0Q6bAvxqLgKeiqzwO00OScf1m1JCWrzjnZJ518wo8nwgYZ
         tTBGvhCY+/2AKm9pvX/SFmMm11MdXDRb9pEM/M4wvaKDM278ynM/c0X7CZw3moLTPBBm
         6dVxT1oxKV/qCnrBaBud2dSSAmyfrPbUGp00hFpjCL2Cy56HYWsb41VbJlEk4lKOW8xL
         Ghfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q/qQSvYwf8HXDdVR1Cl6N3LLFqGPEQTN1dbjdtkTf5E=;
        b=IpUxWnu7IDwB0yhE0i/W1aFftEcv1+FpCFSbPa+prEev+7VUJQM1eFKGBYl1xi7LnM
         vslq00cC8JkerQedk0IAc1Jzt7DjW7UVWsy9VMa1TNADedpiG3sxZn5a+3BmCQLSyfBN
         s8xjJAC12LCjXeBIGQA4q5aLkVQEyM/J5ns56moLj3qYYowKcTpbU5MgxGu+QoD6PNZ9
         cyvcB2pi2+i8sAXvRW3fmuaj8rWgYxCXaykAjiDyo795h6oWYrUgY7vBTWX4j0S4XbBs
         5mV7ezB4DJ6/7cbqBfaYrdjaGryfXuo7E/leWjgf3ZOwyCPUq4zr03CBAgqVOdbgBfqe
         2yIg==
X-Gm-Message-State: AOAM530fiNLwdXLUwjYhNor04KLLiMePI5MsXuYy38gmvdf99jzuiIfd
	LjK9UHKisCm/0AephCb4lc5YFsw9UIAhBvZbbYyurw==
X-Google-Smtp-Source: 
 ABdhPJzVniKrmNdber2Y+XelQWz+MW7q8iKAuv+wOnG9Bib/PBQIFfa46FG2eRGeB45oSB94Azl31f/1h085xr2ljQw=
X-Received: by 2002:a17:907:6e06:b0:6e4:dae7:9574 with SMTP id
 sd6-20020a1709076e0600b006e4dae79574mr15247391ejc.540.1649356662007; Thu, 07
 Apr 2022 11:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <16E3A40F5847C949.23740@lists.openembedded.org>
 <CANp-EDaZHkXKg8WiOT+Jq+tR4WzQ0DDyeDPHrG2xRnUMy85r_g@mail.gmail.com>
In-Reply-To: 
 <CANp-EDaZHkXKg8WiOT+Jq+tR4WzQ0DDyeDPHrG2xRnUMy85r_g@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 7 Apr 2022 08:37:30 -1000
Message-ID: 
 <CAOSpxdaiZq+JDh1iCMzY0pHDWWKK4wO+U0gxxcoMisQXG_JJnQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] vim: Upgrade 8.2.4524 -> 8.2.4681
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164134

On Thu, Apr 7, 2022 at 6:52 AM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> Sorry, please ignore this patch... it is already queued in
> stable/dunfell-nut branch.

No problem, I noticed :-)

Steve

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164115): https://lists.openembedded.org/g/openembedded-core/message/164115
> Mute This Topic: https://lists.openembedded.org/mt/90314181/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

