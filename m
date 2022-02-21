Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6D4C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 07:25:13 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.8080.1645428312197810537
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 23:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UXYadr11;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id t25so1594652uaa.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 23:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H8rQ/JifFf8mf/ynis9Dzz3pU/3X8z+qBr2DJZUJgmg=;
        b=UXYadr11prswJmdoh5dQVGR1U5H6TvfKDvwzOJvFVwBo8hDSwwBjhtGtIi9ZZ/IHXE
         TpNz4d85gnnGYX6AcEXdnCI8hcMemLPe8il36VuDjHEN0Cvwb/JTOxW46UwKYF+ApgCO
         CQmQWSfj0m8hyjZrmF0J6ci3Yy20lol4YTUW/QF3E8t5Dr2uQVWykPhEHeC0bxsScl8W
         5XHFSH6lDMAEGEHpXE6VaLZlDC+3Zj0njnmTiqb8A5px7cNZXUDyLynj8UlVI2YhHR73
         MCXei7lJ5JkANcSaBvJt3MCMVbVlo8pdjV5JYaLeLmL/idrENSIEAuuoYoW3T1m2QxvQ
         Vd/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H8rQ/JifFf8mf/ynis9Dzz3pU/3X8z+qBr2DJZUJgmg=;
        b=KB8i8Tllfe+pP601IcblNJJvp3/rvLcsQ/L67msIikWH5IhbVN5w45gstxzWcQ8DaK
         zM4rDp7B5v8mKlePCOuSuGuT4ethvsaP9CDZmm0nXNj+H4R5WpML1/AOHhjIFqxRResN
         3adD3QSTjtUBOJMXhyAQBYTr1i/MxFq37RVNiWTd6j1oyGnUDScohCxzS6khLayx5BSn
         IfYcSCeCu5L5wgfCTTIqU+O+EiFwzFnWKICRoOP1Pp+TWOmvPU7Mw+lTscGm5ILXu8sK
         qPdpVxRNjS+5j/YRtbaiyLLOiWgCH6jiW3Wxzh5pxfSSZHmLZUDcgfD3TOML6nvtwZ7F
         Hr9w==
X-Gm-Message-State: AOAM530s1JDb6tsH5Yz3QkJS/wwfzIsBiy163Z12dpnsXQRfIRH0stur
	36/p71We4KskmNabGqN8YWBYNiCrtP7JeSQWFNM=
X-Google-Smtp-Source: 
 ABdhPJwEsOmSG+sbkdYyHRGBrRb+hpdXe4xG8UQmlAaKV8tIppiePKMkuFHxZBmCFdbdpdigcy/d57d/3lTXl3NeOXk=
X-Received: by 2002:ab0:6698:0:b0:342:4be6:a61f with SMTP id
 a24-20020ab06698000000b003424be6a61fmr1619602uan.12.1645428311186; Sun, 20
 Feb 2022 23:25:11 -0800 (PST)
MIME-Version: 1.0
References: <20220219080636.119901-1-pgowda.cve@gmail.com>
 <704c8ad858ef74120a2223744141ef697132616d.camel@linuxfoundation.org>
In-Reply-To: 
 <704c8ad858ef74120a2223744141ef697132616d.camel@linuxfoundation.org>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Mon, 21 Feb 2022 12:55:00 +0530
Message-ID: 
 <CALY4987GhynHMLzg-jxuc1d0BAThFkZ3nqYpbH8nFzFm7dh_AA@mail.gmail.com>
Subject: Re: [honister][PATCH V3] Rust Oe-Selftest implementation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>, Vinay Kumar <vinay.m.engg@gmail.com>,
 alex.kanavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 07:25:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162016

Hi Richard,

> This looks interesting and is improving, thanks. I haven't done a full review on
> it but as I glanced through it, I had some questions. See inline below.

Thanks for reviewing the patch and letting me know about your suggestions.

> Why do we patch some tests out but exclude others here? What is the difference?
The excluded folders errored out even though they were ignored. There
are no tests in
some of the excluded folders. Hence, they were excluded from being run.

> What does 40 mean here?
Sorry for the confusion. It has been removed.

> python3-native is normally through an inherit python3native so this could mean
> you're not using it?
Removed as not needed.

> We're quite past 1.18.0 now so is that still needed?
Removed as not needed.

> We've just removed most LooseVersion references from OE-Core since disutils is
> deprecated. You can use bb.utils functions instead, like here:
Removed as not needed.

> We don't need/want python 2 support here?
Sorry. Did not get the comment here. Can you please elaborate?

> We're now a much later version of rust so do we need to support 1.32? That could
> solve the LooseVersion problem too!
Thanks for pointing this out. It has been removed as not needed.

> s/Yocto/OE/
Done.

> PARALLEL_MAKE isn't used above so I doubt this is needed now? (I realise the
Removed as it's not required.

Thanks,
pgowda

