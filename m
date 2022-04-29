Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2F1C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 15:39:09 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.11565.1651246739724618764
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 08:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Abkcfhv8;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id p8so7217788pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=gglf8sjbs4QH4F41DtSanxugEHLLU2TQscmJiKDX6CQ=;
        b=Abkcfhv8f6kzck+hKqd1xPGN5sbnfNYoTGNPcWV8hJ1tpBLbv/9vIzfXiAzYKgdgIF
         bC+PPsx4dK6TRhWae4uGCx1qlTiP8whDtCuzZtnzeQaEZxzyn8EVv4IS5p3bU6xSwCuA
         9gi5jq4/B3cnpCd97pSGThsuiO40UAu2qX3X+CJJVtHwkzUXHCD9PVhv+yaoeEGaMLc1
         MpNNhMhWqI0wLN3lKzYWs1uc0dc4JiHpHWXUlZqe9A1KAHjyQx/k+Q6JsqKJvxppjbmV
         22YE8UeRR1Akx8DDeOJhs45rsjvqsxGcpok/R48xGyFPFnURlUyFjkoR4R+GYMbFRYT4
         fSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=gglf8sjbs4QH4F41DtSanxugEHLLU2TQscmJiKDX6CQ=;
        b=XYM5RHSIqqOvrBLCo3Jbi9ELDvLrzGcCsbOYM4U6KlECwYpjbcj/aFkUxemZ6Mjw8E
         CpvJFUkj2jrhMKoN7wA7tIRhCWH70153WpCPrfKy6OywV4B9clQVTdjkOOB/a6OQKYc3
         F8wvY0yy3vDg1M55arxrkCg+FoHX3DPY+Er1aXQVVX+hxTi2BeRLrhiXliWZuC2Ms3gl
         7baaRC8/koCzV+5BD1YAejiXbO/LNQDWJ1fz2vmkomR9ffwGZHhdnkAXA2JUMRuse7x/
         cBF2Ug9OSPMsIyc/1XfD5s7lkia2LqAk7nz4sLt88LM95fuTRSls78RM6j3crL3gDbVI
         c7yg==
X-Gm-Message-State: AOAM530z9DAc1OmHmtRsb3u6SCWLZ4Uy/GZezYqlhs9Bh+YT4RSP8w2O
	Y9oWG/ZFdgDhahYSXEcrrWQ=
X-Google-Smtp-Source: 
 ABdhPJykKdO5md56pH4ku40AjLSTzeoVb0hVoG++DgBj67W6dfZ9nxtdQ2XHlFNswSzHwpod0pXgFg==
X-Received: by 2002:a05:6a00:230d:b0:4f6:ec4f:35ff with SMTP id
 h13-20020a056a00230d00b004f6ec4f35ffmr40661569pfh.53.1651246738787;
        Fri, 29 Apr 2022 08:38:58 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:1012:a2d5:db46:bca7?
 ([2601:646:9200:a0f0:1012:a2d5:db46:bca7])
        by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm14657336pjb.52.2022.04.29.08.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 08:38:58 -0700 (PDT)
Message-ID: <285f86a8-64f3-516c-32f1-6dcf497c6289@gmail.com>
Date: Fri, 29 Apr 2022 08:38:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [OE-core] [PATCH 2/2] volatile-binds: Remove TimeoutSec and allow
 DefaultTimeoutSec to be used
Content-Language: en-US
To: Portia <stephensportia@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20220429073440.136829-1-stephensportia@gmail.com>
 <20220429073440.136829-2-stephensportia@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20220429073440.136829-2-stephensportia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 15:39:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165016



On 4/29/22 12:34 AM, Portia wrote:
> Remove setting TimeoutSec and allow the DefaultTimeSec to be set for the
> volatile-binds services.
> 

Whats the default value? I hope it does not go into infinite loop in 
case the service gets stuck

> Signed-off-by: Portia Stephens <stephensportia@gmail.com>
> ---
>   meta/recipes-core/volatile-binds/files/volatile-binds.service.in | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
> index 8fe7d8d4f9..52384c8264 100644
> --- a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
> +++ b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
> @@ -10,7 +10,6 @@ ConditionPathIsReadWrite=!@where@
>   [Service]
>   Type=oneshot
>   RemainAfterExit=Yes
> -TimeoutSec=0
>   Environment=MOUNT_COPYBIND_AVOID_OVERLAYFS=@avoid_overlayfs@
>   ExecStart=/sbin/mount-copybind @what@ @where@
>   ExecStop=/bin/umount @where@
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164998): https://lists.openembedded.org/g/openembedded-core/message/164998
> Mute This Topic: https://lists.openembedded.org/mt/90771601/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

