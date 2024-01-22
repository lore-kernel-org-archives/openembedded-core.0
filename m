Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2238C46CD2
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 22:30:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.6997.1705962609557939637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 14:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=H5WaFF0H;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40ea5653f6bso31078185e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705962608; x=1706567408; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5N47bM4LJLMC9ZEsi+bGA6S51mSfG7hcSzQuCFouHc=;
        b=H5WaFF0HUpRQEcPx1OtE2a9fAEg4Eefj/AYc2J4dyQ553LKVJvcO12hq430zzoAXMa
         weoZg9jg7t6S+gY9Z4qVth4vZDncV0SzyRhRbTwQ+XOsWDAU2gR2QPoZhNQI4ivplwtl
         VuCOxwLSRCrY5WY4UDA10LeHXWyqs1x7SKmKnGdavmy+t/P83gBD9Gfv7NvRFwLjU0N3
         vy3JFZ5wg+0768SulAQ9Kqwx8ekfLm0jglkBzeNC1SF2Ob2kRMdgwebyM0kOYggCaAKz
         bupWIBlM8tSAudHXtxdlUw9978t2GVLq4qwfQ/DDixhvOcEMgBI6Kw2eOQ0jKf4hJLf/
         HkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705962608; x=1706567408;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5N47bM4LJLMC9ZEsi+bGA6S51mSfG7hcSzQuCFouHc=;
        b=tOpyFdgrOutQQGFxBCuxvDNuao1FcW6H3FfGC5HoReXYM49tIKBpgKVvZplEYmr28l
         C/RpmwLG8i/UL0B/MlqGgCKXKbardPrxWJLhdiT1tKHSjrbzwtWV7nRNJJu3qsEUSqAH
         vWQtXRlBkrwPIuk73dLE29/euQjI7cLdeiLQxPYT+XFsxVy3YmTtGr3TQvhN/VymX0Nq
         WlfsA6gpxl2ZTsse5Z3xhxOMDc5hhErF8SL2LCbE5hVsWnWaXw8LQFYRNK/5HvQ7AbUQ
         Si7Q2kBmxJYOu+FRUh50ijTd2DVdGFzAf14DWTbqk9JtC1c8KOqYawGYLPSPA4O/VAQr
         tN3A==
X-Gm-Message-State: AOJu0YxfeCFuPisSstrAvm5Cg5tpu1GJxFDNxdy9UHwfa342/vqWYkdE
	fDLXY+EzL/crTeFKh6e7/ixSu92n7jX48iiLSYls1Zv237qyFzBfVE55Lfu1RAs=
X-Google-Smtp-Source: AGHT+IHj8nmVwK/sN6h3Je/Otw5jA/G49f9P+6ck0ahPaR8bP7PCQDV0UR57xpq3lQeOkV0/lONDGw==
X-Received: by 2002:a7b:c7ca:0:b0:40e:509c:36ec with SMTP id z10-20020a7bc7ca000000b0040e509c36ecmr2651751wmk.206.1705962607999;
        Mon, 22 Jan 2024 14:30:07 -0800 (PST)
Received: from [192.168.0.28] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id fl21-20020a05600c0b9500b0040e9d507424sm14093628wmb.5.2024.01.22.14.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 14:30:07 -0800 (PST)
Message-ID: <b9a69f67-802a-4c94-88ec-1c16d787d3da@smile.fr>
Date: Mon, 22 Jan 2024 23:30:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3-yamllint: Add recipe
Content-Language: en-US
To: reatmon@ti.com, openembedded-core@lists.openembedded.org
References: <20240122200704.21018-1-reatmon@ti.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20240122200704.21018-1-reatmon@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 22:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194194

Hi,

Le 22/01/2024 à 21:07, Ryan Eatmon via lists.openembedded.org a écrit :
> Add recipe for yamllint.  There is an upcoming change in u-boot where
> the binman tool is now configured to call yamllint to verify the configs
> during compile time.
> 
> There was a previous patch a year ago from Trevor Woerner that never
> made it into oe-core.  This patch is a reworking of his patch but
> pointing to a newer version.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../python/python3-yamllint_1.33.0.bb             | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-yamllint_1.33.0.bb

FYI, this new recipe lacks a maintainer and throw this warning :
WARNING: python3-yamllint-1.33.0-r0 do_recipe_qa: QA Issue: Recipe python3-yamllint in [...]/poky/meta/recipes-devtools/python/python3-yamllint_1.33.0.bb does not have an assigned maintainer. Please add an entry into meta/conf/distro/include/maintainers.inc. [missing-maintainer]

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

