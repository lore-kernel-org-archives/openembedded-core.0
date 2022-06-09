Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C918DC43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 10:01:11 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web08.9407.1654768866812888834
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 03:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wn9NUndD;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id b12so14577892ljq.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 03:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CdgxyiZ/5pZvnEcmbqQlEzpe3386otygYhB1/FUC5DI=;
        b=Wn9NUndD2lGLkwLzJuIsHPcxWpDeQ2/PBO0KSQMp4E+kFeVfzKkakS9Urmbri6yVsD
         SyRm7VAKQGULg57D+q+Zk/Yq9p/X7q3SpVXxAyt7ZluK0pApORt0Ba1QNBICseHmSrBV
         gXhVaINb+31nNJP1wP5m0gg3n2wSbtzy3nl+WpBxPVAHLhAdBMr/ndiOjpsSGq9y3WV6
         ndcrqhrduWWndQWIdr8Gvk+fOcu9N0OUyrfoHqDAy1VELSqq3G24TWy3muJLEiO4R+uW
         qXw9wtUVdxxNQ+5GJmR+Hh7HJloFmAPj8Ad3hWmA2OBnsAmR3PtxYeP2nrL8qpkx+YAU
         7iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CdgxyiZ/5pZvnEcmbqQlEzpe3386otygYhB1/FUC5DI=;
        b=FCMMl6qx2fW/CA+T/+HmUgVF3hor+ntmsKD3e9RNe97ePzzFyr3JwAtXdzEtokVPpr
         NCgN3N1wgq28bBXnyaxSpuuDJwkBeiEqAiLBCbmRE1eLU5mr9eW+H6yuueKLewUNEtlg
         jdqG0CKegTVIeSIgm9w3oXK1rV45O8F7dROAF49d2lI3Iyl4Ig6DmWjUlOPyoWy6c1ku
         c//DSI7t1t4FNKEpEz7kSYXeXOwUr9w1owLhoXAZRgonxHwqwTkFSz7l66FOfMfonjoj
         r+XMYyu/HWsco+aus7fAbFWRhijzwArpcXyXGNpBCCLBNRSVe5idC4V73mKLQ1Ubspbm
         TVZw==
X-Gm-Message-State: AOAM532jAhe9Qyy63xyRjMgKBy8TBS1xl6yHaPL531Do6SMyDyn+Zq1t
	GwwTLJG9e9hkP6hHra084iW1WAJZF5PxSrQk59U=
X-Google-Smtp-Source: 
 ABdhPJyZ7CsJtabaUTNe96qIj6rhYWPuJMNo6IqvuDwwfZRvtV+b5IPP+s3n3Unn7g434hxmXFEmhcAkiEapFi6hXDU=
X-Received: by 2002:a2e:97c7:0:b0:255:69f4:b9eb with SMTP id
 m7-20020a2e97c7000000b0025569f4b9ebmr22577928ljj.109.1654768864669; Thu, 09
 Jun 2022 03:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <1654518434-9263-1-git-send-email-wangmy@fujitsu.com>
 <1654518434-9263-3-git-send-email-wangmy@fujitsu.com>
 <20220607124056.78bad3b5@booty>
In-Reply-To: <20220607124056.78bad3b5@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jun 2022 12:00:53 +0200
Message-ID: 
 <CANNYZj-a4m6fq1LoUSYvPF0FXzZowAvS-+WdZt-y9hb=AwAYUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: upgrade 22.0.3 -> 22.1.1
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: wangmy <wangmy@fujitsu.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 10:01:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166768

I have looked into this and submitted a patch upstream for this:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/16942

Let's defer the update until upstream addresses this one way or another.

Alex

On Tue, 7 Jun 2022 at 12:41, Luca Ceresoli via lists.openembedded.org
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:
>
> Hi wangmy,
>
> On Mon, 6 Jun 2022 20:27:12 +0800
> "wangmy" <wangmy@fujitsu.com> wrote:
>
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>
> There are lots of failures when testing with this patch applied:
>
>   (EE) AIGLX error: Calling driver entry point failed
>
> Here are some logs:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5275/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5318/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/5291/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/5338/steps/19/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/4202/steps/13/logs/stdio
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166658): https://lists.openembedded.org/g/openembedded-core/message/166658
> Mute This Topic: https://lists.openembedded.org/mt/91575609/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

