Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EF8C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 14:43:45 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.12292.1639061023901244805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 06:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zO1zTMux;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.42,
 mailfrom: steve@sakoman.com)
Received: by mail-wm1-f42.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso4252925wmr.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 06:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X2ycy1sg9bh0GNc9Q/yOC9dTLmGESTp2eS/fayCMyHk=;
        b=zO1zTMuxoi8ZIWtWXtj4XQz8D/8O8qs1BuqpK2k5Y7vjVEC/idXfW6zHX5Q5qjwJfN
         gyc+KdBWjjZuxghBKLYqyTU9qOR+qMKLMJFxN3zQOxIc250wCx9tLFii3/r5FO3IBek2
         YuMXbgXa2H79pXVKJbqFFjovTyCBaBf8jFnL4rYVwnhXULPPiPGpWqNadqBPutKh33Oh
         vJYG42OIc7dAJkSZbO3/BIDDEaTxDSYZQtTCEsgy4cKm9lj2vh13aP3TFUgsFw9NJW8K
         sZQ5GFZm9yuWRmPFXm1C2znv1Odr7EjvZx05q2+B2NI9loTJIYHEMQo7jEcsqDYt0/ey
         T2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X2ycy1sg9bh0GNc9Q/yOC9dTLmGESTp2eS/fayCMyHk=;
        b=Aup3gscevWwuVW02hg6pN5RIwIATYYsSXwnz2PDVg9pvMNoIM0hUyT/luY1kjj3kaq
         69AXWZXdrBjH75dArAae8ToDw1iHTz1foX1qCK85+oFC5FVRuKsguAQd5GlRA2M3imaz
         rG2qIVh1zyFbatCdELMKkbIQRVBQyNuiqONTLa7JJFjbEnQkjahF3EpbgHLzgXpuBI3T
         5wAQXkZH4lYuPBieHxvLh9HR1oR05oGveoLGPEoee/1VPEv8hW/dMdoEmgE6tUiBRlgu
         smCDD2H2WJzgcpRxzqztlBnHD3Co654snbNPTRi8Vutnb0cq1jMSpHGrzPu7LEftOC+y
         Ap3g==
X-Gm-Message-State: AOAM5329a3Q2VfTYhsWKD2LFgKor6xzLg0D3Kj2ujO4eTMvzGHJ2lt0/
	9o2FTwHSx675O6UmL1M4DOBeBDPqKp7EypgeTBoK5Q==
X-Google-Smtp-Source: 
 ABdhPJy+1G/etvNKs4eTJPDywQ6Muxt4e6/IFdNsrr+y7ZhW69Tou1Dmyaj3720noFOLfFhm5/R/aEVLaANvZa/WBjw=
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr7926142wml.23.1639061021966;
 Thu, 09 Dec 2021 06:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20211209065335.2999735-1-timothy.t.orling@intel.com>
 <CAApg2=S+t867iCm7e4+JaJLStP1KX2F2NtCeLMLS7EVgfbTV=Q@mail.gmail.com>
 <CAOyo-84-u5dFSfFOK2tcLbpyHffA9NanU00LJEyVZ5pbTr+uPA@mail.gmail.com>
In-Reply-To: 
 <CAOyo-84-u5dFSfFOK2tcLbpyHffA9NanU00LJEyVZ5pbTr+uPA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 9 Dec 2021 04:43:31 -1000
Message-ID: 
 <CAOSpxdZfzDQ7m15hfDPehLEBdvvHAWk83t0B3Pmdkz9z4ZXBpA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] gcc: Add CVE-2021-37322 to the list of
 CVEs to ignore
To: Tim Orling <tim.orling@konsulko.com>
Cc: Marta Rybczynska <rybczynska@gmail.com>, Tim Orling <ticotimo@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 14:43:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159452

On Thu, Dec 9, 2021 at 4:36 AM Tim Orling <tim.orling@konsulko.com> wrote:
>
>
>
> On Thu, Dec 9, 2021 at 4:12 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
>>
>> On Thu, Dec 9, 2021 at 7:53 AM Tim Orling <ticotimo@gmail.com> wrote:
>> >
>> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >
>> > The CVE applies to binutils 2.26 and not to gcc so ignore there.
>> >
>>
>> Tim,
>> Have you requested a NVD database change on this one? Or you prefer me to do it?
>>
> I have not. I was simply back-porting the patch from Richard.

It's always preferable to request a change to the database when it is
wrong.  They are usually pretty responsive.

I'll take the patch for now, and if/when they accept the update we can
remove the exception in master/dunfell.

Steve

