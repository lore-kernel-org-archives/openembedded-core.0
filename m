Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78587C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 14:26:15 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.5351.1659623166345258934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zl2Ulwl2;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.42,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f42.google.com with SMTP id w3so9911527edc.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 07:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+19GD0yjxlAVECxfURzUhTi9+tjB08Yysrai5FxpvwI=;
        b=zl2Ulwl2bzYsFFQJP8u3Q6S5iypBUozEKxGL1zKLqfLsMY++CKHjt+1POMhwFnfy3y
         WAijMZ2PWZIZecpIaVFpGnFvKxij0IG2Iu4ZUZfZzM8pJZMRB40YJ6r5zIxMarnQs3P/
         KKbNeDQNB4QIP7Rv9TfFVWyUeK0xU7Y/dqliQlcQJisvfNGYSU+spNOT+ql/SCqfkkGc
         NNySiODw2Btoj2YAgMh2ZuX6oB6E9Ff7UYeYPO8Fa2VgTfvqd/Oik9iPhT6nunSn2skk
         WJS0amR+MOrY338IlppMfKPrOmhaD43bLtx/3+nCZRCMk9gA2foaiqKkZVqvUfyVh0lK
         rKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+19GD0yjxlAVECxfURzUhTi9+tjB08Yysrai5FxpvwI=;
        b=seRb3Y7gFmjp8JbO+vAr9np27JsJ6To6Ms3RYtSSIaRCLYuE148r1qYVt5h7hUdE2l
         7VmWdUxJnN+lcqTeniki2DLh2bRQge5gonlfT3OBJ0PPATgcZRfr0vN6fAQyl65ioACf
         49I1DJmUW0+n3FIT9PA5ssyGztX+ySVl4o5O2iAy1zvaXDbEVbAMN+UGACzgCWtyBuNT
         QsYEjYM0YI5wTD2ikzu0WQAXHYBzqOlft2DoE81H+37Owhcr6wc3kztPMMkQlK+/Ghna
         AYWKttBLr2JRQ4Siu1EDG41XzGOVK/PCenXtUVZ3vIS3fMRmPXNv4F4jcRqXdyhveMIx
         aOAQ==
X-Gm-Message-State: ACgBeo1VsJ81hBmJEW+HSpP8voF4aQA3r7R6oiopLbFsxXbNZeLs7ueq
	msq+6RJM6ppQrQvh6bgugpUq1kkcoyDvihj4vsoz/g==
X-Google-Smtp-Source: 
 AA6agR7ZI0kmfE3XnDJZKDuWrqLgwZaehUSXVOiJguQvulCh/Yi2C1HkvcecqOkzsD5EvRiOPs7uWtncGiDc4SjE6d4=
X-Received: by 2002:a05:6402:90d:b0:43b:9ee5:f7eb with SMTP id
 g13-20020a056402090d00b0043b9ee5f7ebmr2270164edz.71.1659623164813; Thu, 04
 Aug 2022 07:26:04 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CA+chaQf5nGwAaLifnZxghK2dHiesGo6mpcFpb_PR=fFgp-7vsA@mail.gmail.com>
 <19859.1659612044516984045@lists.openembedded.org> <Yuu0RAEKrQp7uD/M@jama>
In-Reply-To: <Yuu0RAEKrQp7uD/M@jama>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 4 Aug 2022 04:25:52 -1000
Message-ID: 
 <CAOSpxdadMoyp26x-XGZ1wBX428m3Cnd1Bqihe1xokjVj0OyZnQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] glibc : stable 2.35 branch updates
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 14:26:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168857

On Thu, Aug 4, 2022 at 1:58 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> On Thu, Aug 04, 2022 at 04:20:44AM -0700, Sundeep KOKKONDA wrote:
> > Is there a fix available for this issue and was it taken to glibc branches? I checked glibc 2.35 branch now could not see any new commits available.
> > If there is any fix/workaround required then it should be patched in ' meta/recipes-core/glibc/ ' OR if it is a bug in glibc then it should be corrected by glibc. It seems the mentioned issue is still on-going and no fix is available yet.
>
> Then maybe we should hold on more "stable" updates for kirkstone, before
> the DEBUG_BUILD regression from the previous upgrade is fixed? The
> regression tests are great, but they don't help to detect issues like
> the DEBUG_BUILD.
>
> This change also seems to target kirkstone directly without being tested
> in master first. I know Khem has a change for 2.36 glibc for master, but
> maybe merging this update in master first (and resolving the DEBUG_BUILD
> issue even with that revert I've sent earlier) could be merged before
> that.

I've been waiting for your DEBUG_BUILD regression fix to hit master so
I can take it in kirkstone.

The 4.0.3  build is scheduled for Monday, but will likely be held up
waiting for a linux-yocto intermittent reproducibility fix.  I suspect
I should also wait for your patch too before doing the 4.0.3 build.

Steve

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168846): https://lists.openembedded.org/g/openembedded-core/message/168846
> Mute This Topic: https://lists.openembedded.org/mt/92807904/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

