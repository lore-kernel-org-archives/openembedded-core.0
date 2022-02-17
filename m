Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DB6C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 19:54:41 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.1708.1645127681245811520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 11:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pyi/WciG;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 h7-20020a17090a648700b001b927560c2bso6457859pjj.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 11:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=+sF5jDMTQlnPPEFqo06NatnRTO5VHRaL5EvsDq5Ht6k=;
        b=pyi/WciGxUdkjpQIP6teUbPJApIGKJzv15Ekc60tk8jfXikdSsEtjb11WciEWnQq4z
         8QSPxzssDJaQTkYlzbJHXjbdPzYyTQv7deKhDzJAnafwO0X38F66j4TkLSqqyJq3WyJH
         cLBfjfun7V3z5nMGIIs/emaI/mEa7Qr2sS9z+KU6wdA1+/Unkk+OGSKECmtYC0jB2t5d
         tvlk6Bvnm7rROEbg4Dmc5YpDeBNlhoHilpyTuzxKlLeq9Ilt2eeBfS5DhcWhGYE5tAay
         fdfgjFZX8jKfhszsFlzGbuipy3Q3Zo6aMLQMoWULfvLkxE5E1e+fS2eKLH8Y6UuloiEy
         U0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=+sF5jDMTQlnPPEFqo06NatnRTO5VHRaL5EvsDq5Ht6k=;
        b=X3UwIc7wIoHZCzaa7ldl7MlvAvUZhxXLLtZJxvk0dMFSFoBNgT+OrfVDo3oY4QhGFj
         geMLYrSK2/75W+54618c2tLIR047ZjnWs/6E/KxpOJpibeZwzz1E1DFLg9OhpyMSr34d
         U8oshzNNICYHq45AxhZWESDTmhtIoD2ApLGnXgoCxmtwVtFE/qhpIix5keVg+Y8WYW4h
         cadWIoMjBEk2L6LkB8c3Nv+86P5ucEiLsKjSLFbkTvbi4lqhAId64jXWsylvCKlOG5yM
         wGsMhEZikYwnUEFx2xA++4eBolld/HszhDpmIlayMn2cpDpqsZlCFSLV9Xo2NLJ4aJSw
         Eozw==
X-Gm-Message-State: AOAM533BemcwnNVMzbhzLtYLxDBb+i6gs2Gq03kpS9tPicPoIXfq1RSR
	4LvuduT4z4AK5ndnMuFyuuw=
X-Google-Smtp-Source: 
 ABdhPJyvA95fp/wMskzrWfZ4qDySXD477nWhYG+idcW07xgidzwMTZk7juAlFGpS0k4gNmvWlXgP0Q==
X-Received: by 2002:a17:903:234e:b0:14d:ca32:c5a4 with SMTP id
 c14-20020a170903234e00b0014dca32c5a4mr4151194plh.140.1645127680718;
        Thu, 17 Feb 2022 11:54:40 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:9887:2763:ad87:2b2e?
 ([2601:646:9200:a0f0:9887:2763:ad87:2b2e])
        by smtp.gmail.com with ESMTPSA id b6sm455007pfv.5.2022.02.17.11.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 11:54:40 -0800 (PST)
Message-ID: <0d022bb4-9fe0-effa-d6b9-50812f060cdc@gmail.com>
Date: Thu, 17 Feb 2022 11:54:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [OE-core] [PATCH 02/28] weston-init: replace deprecated/disabled
 fbdev with drm backend
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
 <20220217160939.1424397-2-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220217160939.1424397-2-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 19:54:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161854



On 2/17/22 8:09 AM, Alexander Kanavin wrote:
> drm will default to opengl rendering by default; if this is
> problematic, --use-pixman option may help, apply only where
> it's proven necessary.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/recipes-graphics/wayland/weston-init.bb | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
> index e02da0c358..8e8c0454be 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -19,13 +19,7 @@ PACKAGECONFIG ??= ""
>   PACKAGECONFIG[no-idle-timeout] = ",,"
>   
>   DEFAULTBACKEND ??= ""
> -DEFAULTBACKEND:qemuall ?= "fbdev"
> -DEFAULTBACKEND:qemuarm64 = "drm"
> -DEFAULTBACKEND:qemux86 = "drm"
> -DEFAULTBACKEND:qemux86-64 = "drm"
> -# gallium swrast was found to crash weston on startup in x32 qemu
> -DEFAULTBACKEND:qemux86-64:x86-x32 = "fbdev"
> -DEFAULTBACKEND:x86-x32 = "fbdev"
> +DEFAULTBACKEND:qemuall ?= "drm"
>   

Does this switch fbdev->drm backend work on all qemu implementations we 
have in oe-core ?


>   do_install() {
>           if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161819): https://lists.openembedded.org/g/openembedded-core/message/161819
> Mute This Topic: https://lists.openembedded.org/mt/89212436/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

