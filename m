Return-Path: <drew.moseley@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D900FC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 18:44:55 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.1195.1659379491302449450
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 11:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g5XK5taR;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: drew.moseley@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id r24so8743712qtx.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 11:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=RavcEOUvo6zDUiCLgjlwuOKf7i8pG5NqUfLh0kvmUik=;
        b=g5XK5taRnQG+f7+BxpHAfusTylaxSqduDmQV2PVJFnLx3zvY9AtczRULNWrx13qmli
         29NvHH6Hawx6lKac80iIDpU6EeFCZa4f4keH0wUtKnUD2Kz3q8UkhuLjjmiSvr3Xoq7X
         iyEvEP3v8J/Ib4++KB+zfJhXLBsiO417Gp7IRKvmualShxNLaDtsvgFWAiaUoVRfkXjj
         /8VDIaoF3KDbDxdTmzZHM9G2MGHVUEZX8WPMu5WWoriB0P0sQfEioxvrL2c5cOhAfY17
         K9fKSnBR13VE/G6D137D/PlD8meTq0uDaBX92b5CQYKLGEy1C308ocWqGI1zdPe+Xeeh
         H1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=RavcEOUvo6zDUiCLgjlwuOKf7i8pG5NqUfLh0kvmUik=;
        b=MJdEMeTa4V11JOFP6E+Q7tRdnHxfjSc0MKkaI+4SPryC5qJ+EtP7ndh5a0Jhjz7P3y
         2Pg5cwcLMZRtRjS6OT5Ph5wDmfZ5UwMdsODzjySxrt3xMli2nZwsqUp+n/k52xZ/Q4d/
         dZ2TSqF2jr817toeTsHJUvX0Q9izIooGTOfd3A17WAbjII3aB0q8MXe/LWAPONE7TWb3
         nOtCPHQW9WPnACcMryXhaNMd0qbujl1y0JsFuEnbHRj5aZ5VJKsGbDPcS22YWqPk+4DY
         SIKmlfkbKbr16WOR7YRnPV7Wf9EOSjD4/n0v48Sj8gLMOSu61nMRmF0yU1843acrXshN
         OCqw==
X-Gm-Message-State: AJIora/TuKzPZuA+EmnsjLsDpB/JIS1ISeKISziogN+S/7au2pv+M90x
	KX1YJW9AXL39LkiwIwLK4ixuONR+Tf0=
X-Google-Smtp-Source: 
 AGRyM1tjs9vsV+Bs6HHDH602qK6jldJcp6LZkydDU6dPnydmKrsuAoaO3aVz7MaZ6qHB/FxcBVeK2g==
X-Received: by 2002:ac8:5d86:0:b0:31e:fb3b:ec2b with SMTP id
 d6-20020ac85d86000000b0031efb3bec2bmr15283486qtx.28.1659379489970;
        Mon, 01 Aug 2022 11:44:49 -0700 (PDT)
Received: from [192.168.17.41] ([24.96.56.90])
        by smtp.gmail.com with ESMTPSA id
 t16-20020a05620a451000b006b5f06186aesm9050538qkp.65.2022.08.01.11.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 11:44:49 -0700 (PDT)
Message-ID: <3562f626-f6ca-3573-cf0f-49374af11b80@gmail.com>
Date: Mon, 1 Aug 2022 14:44:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core][PATCH] rng-tools: Replace obsolete "wants
 systemd-udev-settle"
Content-Language: en-US
From: Drew Moseley <drew.moseley@gmail.com>
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com, ch@denx.de
References: <e0dab0cb-4eb9-78df-6854-8fdf1ba5d059@denx.de>
 <20220726131758.3371000-1-drew@moseleynet.net>
In-Reply-To: <20220726131758.3371000-1-drew@moseleynet.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 18:44:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168758

On 7/26/22 9:17 AM, drew.moseley@gmail.com wrote:

> From: Drew Moseley <drew@moseleynet.net>
>
> The systemd-udev-settle service is listed as obsolete and does in
> some cases result in a significant boot time.  Replace that with
> "after systemd-modules-load" to allow the random source hardware
> to be loaded in the proper sequence.
>
> Before this change:
>
>     Startup finished in 4.025s (kernel) + 2min 13.236s (userspace) = 2min 17.262s
>     multi-user.target reached after 2min 8.153s in userspace
>
> After this change:
>
>     Startup finished in 3.956s (kernel) + 13.294s (userspace) = 17.250s
>     multi-user.target reached after 9.522s in userspace
>
> Signed-off-by: Drew Moseley <drew@moseleynet.net>
> ---
>   meta/recipes-support/rng-tools/rng-tools/rngd.service | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> index 568686e80e..e818cfcf78 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
> +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> @@ -3,7 +3,7 @@ Description=Hardware RNG Entropy Gatherer Daemon
>   DefaultDependencies=no
>   After=systemd-udev-settle.service
>   Before=sysinit.target shutdown.target
> -Wants=systemd-udev-settle.service
> +After=systemd-modules-load.service
>   Conflicts=shutdown.target
>   
>   [Service]


Hi Khem, Claudius,

Any thoughts on this change? Obviously I cannot verify if the original 
hardware combination issue is resolved and unfortunately it sounds like 
you cannot either but I'm using this successfully to work around the 
delayed boots I was seeing here.

Drew

-- 
mailto:drew@moseleynet.net


