Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FE4C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 13:24:55 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web08.31730.1652102690614734280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 06:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vkpa8yp8;
 spf=pass (domain: gmail.com, ip: 209.85.128.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2f7bb893309so143905837b3.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 06:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ggtHuEzi53ma35u/g3bXiiMpq8R52gS/nBg5ASBfVPo=;
        b=Vkpa8yp825DjL50Ja0sgN9fWy4RPbjoRW2kiw23yKRS7WLYXeWRIvsP4SJghBCZIS0
         +syG5FlnKp+nVQEzlxWMJ0Wwu0mBLxFgxQ8WwAd7r4QcmSd9yJTuSacE+mDw6Wwgje/A
         ZTjvRbdqTmIwH4/IVWRHjAkz/Ppk356XZW9q/Ef6qJXWtCTNB6U2yzNqMWi+s8INLzIT
         hs37/4R0rZpO6yFQS132XgSv8aHpHu9g0ejSUhZl8KdsxflEhMVWbs1hIe2gnSLV2+Pr
         qwzqzRzc91UFjTXpWs+yaUOsdUy4goAZeeXcutKiAdS/5/lYbtAZ6448dcKbm0H9taz2
         ZukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ggtHuEzi53ma35u/g3bXiiMpq8R52gS/nBg5ASBfVPo=;
        b=30XP2jkZ8PZMgeUXTPCIdgEv2El+8yLu84Ru3hf15wVGy6H4hUidtGgwLXgaDBNsSj
         IQB19mtMvkT8t4T1ERAsACWkojLAstla+rvfZ2mBXObsrPtXNTYWLdw9yQAAMWfzfIF6
         n23nVB9MrZJlzpE1V2GNPk+GoouaHxDWgFjk4EGUCNrbl2HR+d3SScTYb1clWBgvXU2B
         pPN8TPzj4T6AN5l428qpkWlIPGsivUSb6QFdVaYOpMHfqs1TmgX0pzvt4QSMs5P4TGd5
         CFJDpFcJCIrpgzMdvR4vbQa9mjpntq8o0QLIQB4xAnkDvrjjGYzDh0n6/OimbC/h2ngx
         clhw==
X-Gm-Message-State: AOAM532SFz4G+KxP2eYJa7yv+ohcE6nqongNVtvaoyn+IW5vlr5Mn8jL
	whp3mFj9EHYoLCWM2aqv/eMlxNxMFCDdblWgMBw=
X-Google-Smtp-Source: 
 ABdhPJwSsHPHqFYpftdLa9KSpvHl6nOWCKzd2A1iHv4fOVona3LpJkufD3uqsu6Noltv0QeCx3TIO7YlrEM2/jPuG+U=
X-Received: by 2002:a81:6cc1:0:b0:2f8:bb31:143b with SMTP id
 h184-20020a816cc1000000b002f8bb31143bmr13617588ywc.64.1652102689858; Mon, 09
 May 2022 06:24:49 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
In-Reply-To: 
 <0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 May 2022 09:24:38 -0400
Message-ID: 
 <CADkTA4MuiKGp-PqEC2B4UmsiUrVi89kTxm_Bn9=-myOGsoWo_A@mail.gmail.com>
Subject: Re: [OE-core] gcc12 testing results
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 13:24:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165398

On Fri, May 6, 2022 at 11:14 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I reran the gcc 12 testing. We still have an issue with linux-yocto
> 5.10 and edgerouter:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/3046

I just sent the yocto-bsp bump to 5.10.113, which had the identified
-stable fix for gcc12. I can't say it is 100% complete at runtime for
gcc12, but this moves us along.

>
> and meta-virtualization has a couple of issues:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/46
>

I pushed the patch that Ross found on opensuse for gcc12 and Xen. I
can only say that it doesn't break gcc11 at the moment, but again, it
moves us along.

Bruce

> Build is still going.
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165340): https://lists.openembedded.org/g/openembedded-core/message/165340
> Mute This Topic: https://lists.openembedded.org/mt/90935511/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

