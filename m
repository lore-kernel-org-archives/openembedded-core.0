Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B44EECAAD5
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 14:04:16 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.70817.1661781848013007490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7GES0uPD;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id bj12so15871492ejb.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=vWe8/3ZJott5DnkNUA9J8tLMydQny7lHaOYeasGKuDo=;
        b=7GES0uPDG+CRUuPZ0antRYqLlj2XvmXNpR3KTbPTsrWuPm4hBC0jugPiSKkA4SSJVC
         k6k5k1gfqqfnLlF3Q7WfhbbQPyWN6k9I3oQbjNjRgfvCpUj0KFTieh+Do/3t+m6rxJmw
         XgrtgRCOPtMeLdUrdu3GLifHXMbmdlj9KD4HHPvCDpEcopEnln8yVFZeFN+tU5lGgLww
         22UBLY/PTNsc6D9vCF+DjDyOkPCYRzh00sAfUApnrtVHRq8nsCrFg3Z1TTtOBEq8s9Qp
         3uXAHfIQz1rwBS6gm8n/1bYs0kzpeDAejWO8I5p0ns6wam9MHOnGgrClRZmpsreHHlT5
         Wyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=vWe8/3ZJott5DnkNUA9J8tLMydQny7lHaOYeasGKuDo=;
        b=CdIgMD4JecWR3+GQpj6VBjkh2wkvxTrYePXw1rPNpiOIU7viGAAB4VyY0qD3cQ72s4
         OxP+sMuhLGUYQd+AcLMnz88Kopvm1Hp7nPSIaImwhxJWnnecg4Bpg9ySHVpOWmdq0in1
         TjyS0pV/wf/0iDcUI51EQgrDswGTWCoUOR/Vq94U7ZANcCuvisEL1o077wG179tb//+2
         5okOcis5lgLBMbvXQ+JQKdX2fUpisb/qZ+QFQ89b818jyUzXuzpdlCzIKz8gqWicvx73
         8AoP3v4xHfY9Gf1JX/dQ6vvdGeXECsTDquGbF4aIzeO2blgAb6CpnPvNcX7s/cRT8sCJ
         Qwmw==
X-Gm-Message-State: ACgBeo3lSjT2F7kTVNfMUFpcMAeJSAe4r+7uajr99MZ6uQv5p5n8OQLx
	rtqortqduwMQob2cYV0O6tse0c+8r2nzuGUETCUVWw==
X-Google-Smtp-Source: 
 AA6agR5ods26H946N8rd494d44ekvbcE6ZlaaavXTYt3Ly41NhG8S2GA8cUtO3wlPrL4GRnl0XzkUEDK7nKRgOVIYOM=
X-Received: by 2002:a17:907:628a:b0:72f:678d:6047 with SMTP id
 nd10-20020a170907628a00b0072f678d6047mr13579145ejc.456.1661781846060; Mon, 29
 Aug 2022 07:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646780968.git.steve@sakoman.com>
 <18991.1661753974130042230@lists.openembedded.org>
In-Reply-To: <18991.1661753974130042230@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 29 Aug 2022 04:03:54 -1000
Message-ID: 
 <CAOSpxdaObTJXb3oJy5BO+_SjqT4W29G+2ZcjSqra25g6eBEB8g@mail.gmail.com>
Subject: Re: [OE-core] [dunfell 00/18] Pull request (cover letter only)
To: virendra thakur <thakur.virendra1810@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 14:04:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170013

On Sun, Aug 28, 2022 at 8:19 PM virendra thakur
<thakur.virendra1810@gmail.com> wrote:
>
> When we are planning to integrate this change

This pull request was completed back in March!

Steve

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170007): https://lists.openembedded.org/g/openembedded-core/message/170007
> Mute This Topic: https://lists.openembedded.org/mt/89650554/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

