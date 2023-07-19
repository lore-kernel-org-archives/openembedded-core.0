Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E941C001B0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 07:47:55 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.8930.1689752865964774711
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 00:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oLv0Iput;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9891c73e0fbso109263366b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 00:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689752864; x=1692344864;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKRvJTZj/qwPHQg6BbI2CLWDlbDSCPGDISQY/Iiyl+Q=;
        b=oLv0Iputo3VUHlVxlew2dOoDJlvu34I7b2sB3tYzUBtQjmo0Q2JAj8vY9MaXioH7e+
         HxTy1JO9BzEAz+5pLWr18rInbFVb6PYcfuHrYBdQnsBLibTdWImz3NcGAavT4/HxspNc
         ckSqDxTm9tvk7OsZau3tLk5kl6DMHw7Db/1yuRJRrcbD0zFGC0B2FKwcdccH3uecN3nw
         i6ZBuP3O8aaooAfReBLAtxRQu3PmJ5YjeJ6jBgx7a2JvOvbwaari5blJwXVteI0N/iOF
         Y6UlcSYXYRYs7DhUTKU3QWush3N5jEK6qsxD2kiqQLit2d7clEDsqmwLQFwMrj7K073j
         P8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689752864; x=1692344864;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AKRvJTZj/qwPHQg6BbI2CLWDlbDSCPGDISQY/Iiyl+Q=;
        b=LrOMhqXE8H2JUv7dyKQ3pOxwU1RJ76sU03k1buII6bHKOCDCHJKB3axfb4rogW8ZaL
         dU114zCbluNCz5k2fOELtPXcN0TocQ5XAu1ARPnlLGYpIDmEKy3A/jB77YN1Y27rCBsr
         K5Fq92LT0zS8/3xtseaMceMvIGvyvrYH8s9QOK6m9jAoKTbCNJbqACY0GwZgT/zx+UIj
         JJUouQSiHCRQzulso5wnqkeAoHeQM2TqIXt6shjlBhMEjfP+ZvQ0XOPUvf0rqSwNQxX+
         XNq7XKmTHJfe8+RIWddYOeeDxJUijllWc7ZZd0h+FIPVgYxV5bKP29Iero6sSqmlFdSM
         azzw==
X-Gm-Message-State: ABy/qLbmq+bhr9DZ0dUijhXHXsv9IUNTVJFeqz5xr1JV5qLYnH3gxjal
	XtxRAuprM7rl1IU+rhH0aB4=
X-Google-Smtp-Source: APBJJlEaiL2wpFWFZwYqFT6gy4T7nLm08owi+0mURhhxIk3h2LoQCpV8ZCvKqBpXe0yHHH6UCYti6g==
X-Received: by 2002:a17:906:1cd:b0:98f:8481:24b3 with SMTP id 13-20020a17090601cd00b0098f848124b3mr1372031ejj.37.1689752864021;
        Wed, 19 Jul 2023 00:47:44 -0700 (PDT)
Received: from [10.134.51.120] ([89.249.73.142])
        by smtp.gmail.com with ESMTPSA id w13-20020a170906184d00b0099293cdbc98sm1977999eje.145.2023.07.19.00.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 00:47:43 -0700 (PDT)
Message-ID: <29408a27-b514-2d12-a72a-9389c4f511a0@gmail.com>
Date: Wed, 19 Jul 2023 09:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [OE-core] systemd service@ bug
Content-Language: en-US
To: Yuta Hayama <hayama@lineo.co.jp>, Dvorkin Dmitry <dvorkin@tibbo.com>,
 openembedded-core@lists.openembedded.org
References: <3d682b83-f0e8-7add-3dcd-3e850e30f7c6@tibbo.com>
 <80e8328b-6820-28aa-c2fe-6a73ddad3d01@lineo.co.jp>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <80e8328b-6820-28aa-c2fe-6a73ddad3d01@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 07:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184567

Hey,
Usually Steve Sakoman cherry-picks patches from master. If it's not the 
case, it was probably not applied clearly or simply overlooked. You can 
submit a backport with the branch tag.

Vyacheslav

On 19.07.2023 03:48, Yuta Hayama wrote:
> Hi,
>
> This issue has been fixed in master.
> https://git.openembedded.org/openembedded-core/commit/?id=d18b939fb08b37380ce95934da38e6522392621c
>
> But, yes. This patch has not yet been backported to the any stable branch.
>
>
> I don't know about the maintenance process for the stable branch, but I
> expect that patch will probably be queued and backported to dunfell in
> a month or so.
>
> Please let me know if anyone knows anything about this. Should we simply
> wait? Or do I have to submit a backport request?
>
>
> Regards,
>
> Yuta Hayama


