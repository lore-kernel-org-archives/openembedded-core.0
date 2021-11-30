Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD939C433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 08:14:02 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.73499.1638260041322909634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 00:14:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TVyHuKDi;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id k37so51686429lfv.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 00:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=tZWNMWRgKZi7gUCk0xWS1WLjhpfFwe9Z5MpztXihIr8=;
        b=TVyHuKDiCIv7FaPn925wl2xLEB0YRkr9wVAdmJM4lf00GmHgGuaKLTABqY8gw6jg+/
         qiD/0nZy7A0zPQLCHmFscf8iyzHsMOfB7yV8lfbQ4QOQDcx/3LxHzKjWIzRxZrElOYOG
         UdBTT1vnfnjn4P/n/YqdQWZK4qNwXUYGDaicA1N2tlfxkUEyKBq3kIcNM+wR8p8nzhCM
         nP6l7DXVR8sTo7sv18wGGuQ005mP3Fxq1jGmdv1lYstbD4PI5PVSv9SEraBQKu/fFX+5
         kV4fVaCywTwVopbqmGyLK0+zxYojoFVUDA/wAjKd98ay6K2oH81v0RMSrCUtiSBOBo2R
         gHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tZWNMWRgKZi7gUCk0xWS1WLjhpfFwe9Z5MpztXihIr8=;
        b=qbX6wPHWFiHbhvBZutjvqY/G/2uiwTN2qr4aUwukDdTn/G2m91OkcE8jvz5ALengYp
         KgFTQFJo8agSHkj1Yig+qtkJpvOqiTb7XXKfTIl7h92KBU2BZZ4DuCi2NkXJ0F5/1qQ9
         da2l84MNcHCkXcl6PEqL5BAXNEJfZr8NbzGybUJAXy7Nguc0UnOse2OwKGH8EM5jMkoB
         72FggGiARsASLPynrSbDtjnfiOnqudWMHfiMeQkzZyRb7bXDPNqb9Fja2+3kObGQKHaw
         TDYLJ+bsHK16uzN2DnGFSZZVZAh4fGfVfCU4pUSGCdsufFoFGXOtYLcs5n4RpiysU6fD
         7L5A==
X-Gm-Message-State: AOAM533IlrYEIDOGphHt2DKZKjcRZJpnSSXIa6F83JnLMGlymHtB1r5E
	gMEGzXxqh8rhVDalts0zgu3BaCqj5mU5ABxI
X-Google-Smtp-Source: 
 ABdhPJwD4zLMRYD5+KpdapKeCtK510I9Xfm0WP1SJ6PxaPqnhPcKlaMY7OasFXK0nbeMnLLu2YxRVw==
X-Received: by 2002:ac2:55ae:: with SMTP id y14mr52456699lfg.27.1638260038771;
        Tue, 30 Nov 2021 00:13:58 -0800 (PST)
Received: from [10.135.94.89] ([45.92.33.29])
        by smtp.gmail.com with ESMTPSA id
 m15sm1632213lfg.165.2021.11.30.00.13.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 00:13:58 -0800 (PST)
Message-ID: <4611c03e-e581-89d5-b067-af301d9c1afc@gmail.com>
Date: Tue, 30 Nov 2021 09:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [OE-core] [PATCH 0/6] Pull request (cover letter only)
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <16B8DDF86EA1F6BB.995@lists.openembedded.org>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <16B8DDF86EA1F6BB.995@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 08:14:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158972

Just pinging to check if anyone had a chance to take a look at it

Thanks,
Vyacheslav

On 19.11.2021 07:15, Vyacheslav Yurkov via lists.openembedded.org wrote:
> This is a V1 of overlayfs-etc image feature implementation, that allows
> to setup the whole /etc under overlayfs. Please review and merge if you
> find it OK
>
> The following changes since commit 0d15632f3db787d3f08eb260732567e62f52ffb3:
>
>    libtasn1: upgrade 4.17.0 -> 4.18.0 (2021-11-16 22:19:47 +0000)
>
> are available in the Git repository at:
>
>    git://github.com/UVV-gh/openembedded-core feature/overlayfs-etc
>    https://github.com/UVV-gh/openembedded-core/tree/feature/overlayfs-etc
>
> Vyacheslav Yurkov (6):
>    overlayfs-etc: mount etc as overlayfs
>    wic: image for overlayfs-etc tests
>    image: add overlayfs-etc image feature
>    oeqa/selftest: overlayfs helper function
>    oeqa/selftest: unit tests for overlayfs-etc
>    overlayfs: update notes on /etc
>
>   meta-selftest/wic/overlayfs_etc.wks.in    |   4 +
>   meta/classes/image.bbclass                |   3 +-
>   meta/classes/overlayfs-etc.bbclass        |  93 ++++++++++++
>   meta/classes/overlayfs.bbclass            |   1 +
>   meta/lib/oeqa/selftest/cases/overlayfs.py | 173 ++++++++++++++++++++--
>   5 files changed, 257 insertions(+), 17 deletions(-)
>   create mode 100644 meta-selftest/wic/overlayfs_etc.wks.in
>   create mode 100644 meta/classes/overlayfs-etc.bbclass
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158492): https://lists.openembedded.org/g/openembedded-core/message/158492
> Mute This Topic: https://lists.openembedded.org/mt/87162486/4455192
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [uvv.mail@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

