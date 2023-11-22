Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443ABC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 10:43:57 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.16412.1700649833020575280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 02:43:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mfw3R9P+;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c887d1fb8fso31399321fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700649831; x=1701254631; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+LZpjTaI6pu+tuVvxPW9q7ZBmmWX/4JKjliuu2ntc3c=;
        b=Mfw3R9P+sG3SG6gMqw3LLK1dyJegw2xfLNhOdnxybb9DDkDMN+y3P38JOC4BNkX5cH
         PxEVtvZSpT4Kd27en4wyTdmYOPNTbj1CcpVnlaZ+GFskxgZhn9JB6Cgs7ZEY9GvWcZ+n
         eUwKjuqBWQTxrAgpcPYsAsgw4qq6ro4dx0ePASX3JQC/mRXnHWAuwfkrcnF6u4v4g8/m
         eYp2iakycqssNQD8mFIJQLp/tTZ2ziqMQ14mYoQ4uBw0YxAUwI2ZXwRHmrN9jbwkvPOd
         jNaODlPesY2eTp9wN5tB8st4Te1x9s7vmlyAwhKZi44oxQskxEyy3Hwb9vns6lCMAni0
         6zag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700649831; x=1701254631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LZpjTaI6pu+tuVvxPW9q7ZBmmWX/4JKjliuu2ntc3c=;
        b=IYOPTZ4w8RcoOauF/fELdWxRbMaBWZhyWAQdJWMay6S6ey0vU/4HGffckq09ECgrOZ
         oGYDfz0wT8RqS30QPxisHC/MSkX0+WbVKTk0fyh9/JafOExAOo7bJhTn+Ab7/ZTmSlLr
         kO1bGPBhCfmTH/hNhNfexLlcBlIqn7KobY2ibU0a9mAeNqm9DLR3tJtuM1WDcXxhq+qz
         CV9IlgW2CPB/SBwpAf51G2+6+pCtYf2WqEZTvOT+MEjMCtuJAghNxK+v5IbIrPrKd5gZ
         sKR5WYEpVrXk7bWHHmEj1LCPDIZ5PzHPP4F6Vz4mAZ4Zb8ps7PkEB3rwjQC4UZAZYMgK
         npiw==
X-Gm-Message-State: AOJu0Ywg/AJ2KFa3fGip+LqszGxHcAH9ijurPSKp2aB6ka7Zh/+8qVrU
	1TqKyp8Naf9CQmmeYZ+fJxwiDYW/H4WgzlMrTqs=
X-Google-Smtp-Source: AGHT+IEyfIMIthIaaQTdk0Hk+h7jM/Rm2OcjDy9c+HO8xjxkM7X8l3Jr3fLsRrlEk7l7f6arX0G8PsQtVkJKrp7k2/8=
X-Received: by 2002:a2e:b7c7:0:b0:2c8:3888:bbae with SMTP id
 p7-20020a2eb7c7000000b002c83888bbaemr1543135ljo.41.1700649830901; Wed, 22 Nov
 2023 02:43:50 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj9g0uu40tyH9+QY-W7s7ND+6OoUOwhDHVxsfF3=1vhikQ@mail.gmail.com>
 <31510.1700648444824257996@lists.openembedded.org>
In-Reply-To: <31510.1700648444824257996@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Nov 2023 11:43:39 +0100
Message-ID: <CANNYZj-6+RzvY_SyrsWw8O770ZwzOE80RkMH0sF6UJ803VkOSg@mail.gmail.com>
Subject: Re: [OE-core] [Kirkstone] joe editor broken with current ncurses
To: tobias.jakobi@compleo-cs.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 10:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191056

On Wed, 22 Nov 2023 at 11:20, <tobias.jakobi@compleo-cs.com> wrote:
>
> I verified this by:
> - copying the recipe from master verbatim into our layer
> - building our image
> - putting image on hardware
> - firing up joe
>
> Joe then shows the same broken behaviour that it does with the ncurses 6.3 snapshot in kirkstone.
>
> Or do you want me to replace our kirkstone oe-core layer with master oe-core? I don't think this is going to work anyway, since some of our support layers (we are using a Toradex SoM powered by a NXP i.MX7) are not compatible with master.

You then need to build master with something that works, perhaps
simply a qemu machine? No layers needed other than oe-core and
whatever provides ncurses apps you need to test.

Alex

