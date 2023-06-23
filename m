Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4647EEB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 16:52:38 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.39453.1687518925163091871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 04:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=x/J6+v6o;
 spf=pass (domain: baylibre.com, ip: 209.85.221.51, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3112902f785so1646983f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 04:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687518923; x=1690110923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBA2ZSco5wm8WD2STol51tVGcPeqW9mwc/QFNV4N6bQ=;
        b=x/J6+v6oYfakHDm0AdY4kyhZ9agZyPf4l3lwgGWl+OUy4KT3bKqEqf5R99Co4ocTFk
         NHo+waOsglXR4xVW8eUBNDFzGHAhA50/MDgowjzxmWiaKYKz0WNlt5Qg6VZuWhWajCUO
         HmbEZpaTjbOhQAVqRNvPlZoz6FLHoBnM7DP0i1OqH3eRWvIXKCWMqBcJ5r2xw6Y8tsvR
         /p1leXeyjkkSMT6YuKxxzmr9xcujRBcfT861LEHlWtyF8rfDN2AiblC9p8kfqJD+urov
         edrbTUg+caIjZCV6bGHyepoGz3Ua5DjNn7Uzw9Y100Ua8LH1qJZfCYt9aHlw+luNnO/l
         rtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687518923; x=1690110923;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBA2ZSco5wm8WD2STol51tVGcPeqW9mwc/QFNV4N6bQ=;
        b=f9+STGs/yB7OIp4Lihg4zDac8+lq0PfK5zatbnaXDhkIu8mfY+BXDiZgEwFZ+E5wcR
         EOKzca/iyaGDHWZEQJsNm862C2wvxWXIFLyqijWK2EoyJ90ZDxg2pV4IE+Ohzwz1zIg/
         toHf/S50mP55exX+fxYE/Vcdjb4Kha1Osw8xad+9AJRsnYcECSlRH3T0QqkgzBsFTvmz
         Ldj3jYhzLCGvvva3nt2sXFU5AA7UAE6013E7pUUaSY4alq/umlLmz0rofW8rZ8awvyGO
         8zxh92mjmuxvHuJUTwySgjeH+vcm6Gvm1/DjQJpz+pmaXh5wCfFYCmuCC4P83kfZeKvL
         +cDw==
X-Gm-Message-State: AC+VfDy4coBKNNh8b/e2xi9P5nMhUSgDwJPeYVMRV9iE5xhjcVwhdvs+
	AZjb4NfGO4FbvWiQ5yWW555Hxg==
X-Google-Smtp-Source: ACHHUZ7KyAYXLO3vZCYNgcvhWPnP/YcuyRWTL8kPOOEugYlzZvaMgpECedxdH4Yh8Nm+CyNM7HyIGA==
X-Received: by 2002:a5d:430d:0:b0:30f:d052:2edb with SMTP id h13-20020a5d430d000000b0030fd0522edbmr19915534wrq.35.1687518923515;
        Fri, 23 Jun 2023 04:15:23 -0700 (PDT)
Received: from [192.168.178.55] ([194.110.145.167])
        by smtp.gmail.com with ESMTPSA id q6-20020adff506000000b00307c8d6b4a0sm9284200wro.26.2023.06.23.04.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 04:15:22 -0700 (PDT)
Message-ID: <f8451ff2-de3d-5ef6-1bf1-53ad9bd8f381@baylibre.com>
Date: Fri, 23 Jun 2023 12:15:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH v2 2/3] weston: Upgrade 11.0.1 -> 12.0.1
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Tom Hochstein <tom.hochstein@nxp.com>
References: <cover.1687444823.git.pidge@baylibre.com>
 <acca25d2cbd58d50cbaa3962f922990fee700403.1687444823.git.pidge@baylibre.com>
 <20230623121659.75aefd1e@booty>
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
In-Reply-To: <20230623121659.75aefd1e@booty>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 16:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183349

On 23/06/2023 11:16, Luca Ceresoli wrote:
> Hello Eilís,
> 
> On Thu, 22 Jun 2023 15:42:16 +0100
> Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com> wrote:
> 
>> Tracking https://gitlab.freedesktop.org/wayland/weston/-/issues/488
>> we're keeping -Ddeprecated-launcher-logind but plans should be made to
>> remove this/work around.
>>
>> We also need to add xcb-util-cursor from meta-openembedded as this is
>> now required for ptest. When this is pulled we can remove from meta-oe.
>>
>> Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
>> ---
>>   .../wayland/{weston_11.0.1.bb => weston_12.0.1.bb}    | 11 ++++++++---
>>   .../xorg-lib/xcb-util-cursor_0.1.4.bb                 | 10 ++++++++++
> 
> This is triggering failures on no-x11 builds:
> 
> stdio: ERROR: Nothing PROVIDES 'xcb-util' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/wayland/weston_12.0.1.bb DEPENDS on or otherwise requires it)
> stdio: ERROR: Nothing PROVIDES 'xcb-util-cursor' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/wayland/weston_12.0.1.bb DEPENDS on or otherwise requires it)
> stdio: ERROR: Nothing RPROVIDES 'weston' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/wayland/weston_12.0.1.bb, /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/wayland/weston-init.bb, /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS on or otherwise requires it)
> stdio: ERROR: Nothing RPROVIDES 'weston-init' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/wayland/weston_12.0.1.bb, /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/wayland/weston-init.bb, /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS on or otherwise requires it)
> stdio: ERROR: Nothing RPROVIDES 'weston-dev' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/wayland/weston_12.0.1.bb RDEPENDS on or otherwise requires it)
> stdio: ERROR: Nothing RPROVIDES 'weston-init-dev' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/wayland/weston-init.bb RDEPENDS on or otherwise requires it)
> stdio: ERROR: Nothing RPROVIDES 'weston-examples' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS on or otherwise requires it)
> 
> Full logs:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7354/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7354/steps/15/logs/stdio
> 
> Patch "weston: Cleanup and fix x11 and xwayland dependencies"
> (https://lore.kernel.org/openembedded-core/20230622203913.183451-1-tom.hochstein@nxp.com/T/#u)
> was sent a few hours after yours by Tom (in Cc:). Do think it could fix
> this error? FYI I'm running a new test build with Tom's patch and
> without this series.

No, but it does point to where I think the issue is. Specifically, the 
DEPENDS for ptest was incorrect, in that it pulls xcb-util for ptest, 
even if we're doing a no-x11 build. I need to see what ptest does for 
no-x11 if xcb-util doesn't exist and rework based on that. I'll have a 
v3 early next week.

> 
> Additionally a new recipe in core needs a maintainer, and as such it is
> warning:
> 
> WARNING: xcb-util-cursor-0.1.4-r0 do_fetch: QA Issue: Recipe xcb-util-cursor in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb does not have an assigned maintainer. Please add an entry into meta/conf/distro/include/maintainers.inc. [missing-metadata]
> 

I'll add that in v3 and take maintainership.

> Full log:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5511/steps/13/logs/stdio
> 
> Luca
> 

-- 
Eilís 'pidge' Ní Fhlannagáin
BayLibre - At the Heart of Embedded Linux
www.baylibre.com


