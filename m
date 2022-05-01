Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC9E4C433EF
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:13:59 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.14.1651421635821828799
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 09:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rCsdkpZG;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id m20so23866576ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 09:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fjqe/4qkjdJV5NPKHuyJEVU0TRQEJG9g/H5xA2eszTU=;
        b=rCsdkpZG9nmI+e5dxL72Z25Ivh+73fieqidLBVpkOr55Mfiw8IsPDJqAhbQJSlesqQ
         cEOIjeA/e6T5+7c++0+c+3/+x1qyy3QzDs8p+LWstn0RNlzm8olvLx3oNy+2nlgvaEH2
         RVFib8iWjqDTazfU07V2Ltxg2sv43ZR7NSR8TkHGT0s7HsndNl1pKybf+r2YBEQBKol9
         S8omDYnL6y79up0klfrhNnJelZYdIhm3vDs4gaqEazkoHuG0/T1W1QDVmgSluF4vhbyi
         13eVK0yucqQ6U32WDPvl7Uu+YFYBcmu2X8jidv8QOnzh/OvL6njMNiIk4wAf/ivLlCPK
         QNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fjqe/4qkjdJV5NPKHuyJEVU0TRQEJG9g/H5xA2eszTU=;
        b=D0no01yS85l2DvySbaqNSqYxhw8YJWOPVdIHYgjRc5EEHoSvIcm89HygC9K3fZVDUd
         ZGwxoN4OOJC3ugWU2dWp/QFWCbiIMC1sOjx/1pA1qfdUSWITZN2sqDbBxakX1tGdSXAA
         DEKasZ/VSGa+YGyazMEIqa5A6mDZ3x3G0o7vF0AEXSWlbusRyCbHOA7f/VD9Edht3upZ
         tLRvCQHRRj9sy/ColLwUjyRAEjAlIcgigexv8ApA67btCZSN7ybgs+X4RTv2BLK2DnQL
         hhQS3GCYH72WJJxD7YrN9k0+BlQCP9jwIH2z9rONniTAJ7M8p0evEd8FNS8LgZ3P7/aC
         xKQQ==
X-Gm-Message-State: AOAM532sWVU45Xzxiqbbm0qsVqiv177BnW/7aWZ1iOYadc8sBNSV+bOm
	lbYPAScELz2X8zmRZOT9ZfrhVeb+425bzs6UuAlAOg==
X-Google-Smtp-Source: 
 ABdhPJy1wp+1MOBekaK0wZNtIxNovi3LiuSnVGbCXuwb1IITHys6dFZ2ZdmaaUaGXNN2YjXA5vPRlswJ9+8X+IpPlNQ=
X-Received: by 2002:a17:907:3f8b:b0:6e8:318d:1def with SMTP id
 hr11-20020a1709073f8b00b006e8318d1defmr8208937ejc.153.1651421634056; Sun, 01
 May 2022 09:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <CCiH.1651417911204942511.4PTj@lists.openembedded.org>
In-Reply-To: <CCiH.1651417911204942511.4PTj@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 1 May 2022 06:13:42 -1000
Message-ID: 
 <CAOSpxdauyRx_uCPuBPuxRq1RK15wDkLejgCzPmmpU2Ko4pdBNQ@mail.gmail.com>
Subject: Re: [OE-core] backported "neard: Switch SRC_URI to git repo" patch
 from master to dunfell and warrior branch
To: rahul.kumar_3@philips.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 16:13:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165083

On Sun, May 1, 2022 at 5:11 AM Rahul Kumar via lists.openembedded.org
<rahul.kumar_3=philips.com@lists.openembedded.org> wrote:
>
> Hi Team,
>
> I backported  "neard: Switch SRC_URI to git repo" patch from master to dunfell and warrior branch.

I already have this in my queue for dunfell and kirkstone.

Steve

>
> https://patchwork.yoctoproject.org/project/oe-core/patch/20220429121744.2196669-1-rahulkumar@code1.emi.philips.com/
> https://patchwork.yoctoproject.org/project/oe-core/patch/20220429100159.2196288-1-rahulkumar@code1.emi.philips.com/
>
> @Steve Sakoman and @Armin Kuster ,Requesting You or any community member to Review the patch.
>
> Thanks & Regards
> Rahul Kumar
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165082): https://lists.openembedded.org/g/openembedded-core/message/165082
> Mute This Topic: https://lists.openembedded.org/mt/90816117/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

