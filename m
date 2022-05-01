Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E070AC433EF
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 18:57:30 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.1756.1651431444897710939
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 11:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=i8W6VXhr;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id g20so14484565edw.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pofNLE3PvC7H9P2gofp9nUA9jOaju8ycW8os0qSRQmg=;
        b=i8W6VXhr0snUi3FmByszDYM9lRKi7RlNr0MuEhWBwgxe4YTeHaoTNYpfIfTiuw0Jsa
         f4qY5xVXek5FjQQTEQ1jekBByqHzFxsXsSm7vH7cMGL6E+EDHXZtcgTf8m7KxwaYZzr6
         ZFqofA6v06rmULGitG/rQXpLM+aOQF81x6JQoRTSDgJB6WykEIcJgE5QvYYSnbUBGB55
         HAFxgbxt9cQvDSI9QYM05bVLaQ/GdCy83SNccZt1PasHcaRrZZesPYG6ohuLQbXn4H4N
         dX1kIBSFmDCubpD4iM2FxLoS85J/jeuu/m6MMP/gXhTYGbhyfmMsV/L0j1sktOte+G3G
         ItYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pofNLE3PvC7H9P2gofp9nUA9jOaju8ycW8os0qSRQmg=;
        b=r8Vy1bpt8OiasNYk6vyMD7JADAd6su+DEqC7gXgVtYTcOlAhIF+fZemqf2/Ts1AeWD
         509eZtKnImS0LwEZroyNDHGPnSJ9KrF9oWroEhUpeiAty447R/gwzOi0+GVy754WQSJv
         P+smOqt83O0RNH0x98Wn1cpNOUfui9xENzeD9AWqqnImvPSU0jCFn7Vwq7G9s08VsphB
         3yXmlT8Yg0gVWnR+ZEC/QDaNKn5f/pQsZ6dM/VNb2Dm2EGoX31dqPjN1FaWmmDvFB30Q
         r4luFXAq8Cw6AJLQ7yvhmcO7Rz5tJrBzFUhfOl1esXASXbpLH4ljKbaNK2dbLznOiXdv
         oR2A==
X-Gm-Message-State: AOAM5308fbkXVRRtlCVPA0S8mGAkjr3HoxggxjUaM2c1FNyb6XI5056Z
	bHrfH3J6mNTR8ywxK+UO9mwWlcSd2ZrReEPN4UJznA==
X-Google-Smtp-Source: 
 ABdhPJxuVr4YIz7aSs6VRwqjEXzXtZFl9eaDam+cGe1u2POETkGPzhF1Jz6gckfXyEfmrL56AxEnulO7KYewwt/7epE=
X-Received: by 2002:a05:6402:43c4:b0:41d:9403:8dca with SMTP id
 p4-20020a05640243c400b0041d94038dcamr9817870edc.184.1651431443004; Sun, 01
 May 2022 11:57:23 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdbykaeQLMiW2kqRfmnVireDGWATGm7sCPrj2+ai5_pRKg@mail.gmail.com>
 <375.1651426832338027277@lists.openembedded.org>
In-Reply-To: <375.1651426832338027277@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 1 May 2022 08:57:11 -1000
Message-ID: 
 <CAOSpxda9JBb3G3=49Mf5SqdSzWqgb+XTPaj9TfFFMS8YWKNUjg@mail.gmail.com>
Subject: Re: [OE-core] backported "neard: Switch SRC_URI to git repo" patch
 from master to dunfell and warrior branch
To: Rahul Chauhan <rahulchauhankitps@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 18:57:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165087

On Sun, May 1, 2022 at 7:40 AM Rahul Chauhan
<rahulchauhankitps@gmail.com> wrote:
>
> Thanks Steve.
>
> Is there any way to track the patch in queue?
> So that we can insure that this patch is going to include in respective branch.

For the two LTS branches that I maintain you can view the patches
under test in the
<release>-nut branch on poky-contrib.

So for dunfell:

https://git.yoctoproject.org/poky-contrib/log/?h=stable/dunfell-nut

and kirkstone:

https://git.yoctoproject.org/poky-contrib/log/?h=stable/kirkstone-nut

Steve

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165086): https://lists.openembedded.org/g/openembedded-core/message/165086
> Mute This Topic: https://lists.openembedded.org/mt/90816117/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

