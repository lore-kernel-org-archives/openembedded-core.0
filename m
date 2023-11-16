Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11151C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 10:10:07 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.3837.1700129400194714280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 02:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NCq2xayQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c6b30acacdso7688221fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 02:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700129398; x=1700734198; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EJEzvdTw2x03EvcXJFUR1kG3NEPD4budnq7flcWUh+s=;
        b=NCq2xayQ3ZHBs/wMV7eykblQamN7spUIlGgX6MwYMez0cqBDl1hDABSpfMGSfoa9XC
         rTukFkPNqKn/UwAGbggIQbOXyoJcxtT7Jxgh0gMmFw8mE9as8+zDIi4l08m0p3uO5oI9
         phiL7ePqnNpSIQvLjZzGmGUBzqsct41S3Hgu/hIL9J73EEqSH7I+JdhgGdcmfJcFcKgX
         Bzvf8Q6a6LNR1ZdupoH5QJEg6iuWWNJOhRqQ55nbcwA9Lqc9awgdpGI2Ki8Cw27If9ti
         SqTmJejG5QgzmYofjf6SiwIhjoAVzrvnpDxtN1tNZWFL1ZLMjNbJWyky+cjPTGxDTHXh
         hOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700129398; x=1700734198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJEzvdTw2x03EvcXJFUR1kG3NEPD4budnq7flcWUh+s=;
        b=BNEoEpGBfbQ7BRLVGO1dd7bI1iuwndUFYHsChjpAuUHPh3nGH5qH8LPGjHxCKa07F9
         epvJvZKQp+8Wi/hcMKEhv6Nao7g6w23aCOhFv+HmX/bgVZJTFeDW/FiwQn1+C0vnZneb
         GewBU7R28FxSFM9tUcwmVxj7+XYwc69TkD3L50wCqb6gn0aua84Oa1dc6hY81eqnzrz7
         /38LcFU2HKUMfqNSLyy2ENJ7GsK5JEeXNdKa/X/aiC5sWS8vEpOSbfxa6BMm4rr/oRzz
         f0TzlsYYdTj7TmIvIyVz7S+zb1gQqnnnCg2+ZkHaHLrhZpI0yUx/M+2aROaHdFY4dYkb
         D7EQ==
X-Gm-Message-State: AOJu0YwqCScwcKedEYljSlNh6heaoTWyUIx526szeEvgVHnPKAobOnsO
	XKjIHKcuMBzO6daHkgdYQJRrloNnOHqvgubuXW0qTYAK
X-Google-Smtp-Source: AGHT+IGrUP6CFXMR4VR8QjuxNfbVDQQ/wbpmMNt3a7ePFXHWlICgFHyVCDZeZTymeleIW0PIQ2zW1/Xksw5qOllKPJI=
X-Received: by 2002:a2e:8506:0:b0:2c5:1989:ce1c with SMTP id
 j6-20020a2e8506000000b002c51989ce1cmr1527357lji.26.1700129398118; Thu, 16 Nov
 2023 02:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20231116080124.3175506-1-archana.polampalli@windriver.com> <20231116080124.3175506-3-archana.polampalli@windriver.com>
In-Reply-To: <20231116080124.3175506-3-archana.polampalli@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 Nov 2023 11:09:46 +0100
Message-ID: <CANNYZj-aidVanAOftQPkR_6FgXHhOKVn8dK-JKzUgcDzeTZYCg@mail.gmail.com>
Subject: Re: [oe-core][dunfell][PATCH 3/3] vim: Upgrade 9.0.2048 -> 9.0.2068
To: archana.polampalli@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 10:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190768

On Thu, 16 Nov 2023 at 09:01, Polampalli, Archana via
lists.openembedded.org
<archana.polampalli=windriver.com@lists.openembedded.org> wrote:
> -PV .= ".2048"
> +PV .= ".2068"
>  SRCREV = "982ef16059bd163a77271107020defde0740bbd6"

This commit doesn't change the git revision, and so the actual source
remains as it was.

Alex

