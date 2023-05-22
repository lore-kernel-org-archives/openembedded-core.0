Return-Path: <philmd@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB379C77B75
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 10:08:18 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.18330.1684750093349158739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 03:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=DCZSiDqB;
 spf=pass (domain: linaro.org, ip: 209.85.128.54, mailfrom: philmd@linaro.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f41d087a84so23050445e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 03:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684750091; x=1687342091;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtQXyrgZDOxBRwlOTEpJ+2f141C8ejFNU18spWMbwj4=;
        b=DCZSiDqBtzOz1984bA1T3zmiP1oqCTxuAG8oSMymmmTCxdHtZoXtnq9gPlFv8ZXrmR
         +FyS0znNNHSCmJlyBS87cH5eyUS4iXhKTSMUbR3DScKH6mXaveNYhfOa2dp4g1UTrkX+
         mM9QrSnnQukZPmoCufnj9ljz4aHUY4CUpUzKmTkVVAo/906O0ZvjmJ3Im0d1TfPmU8g4
         cO7otm4xyAJ7WzEg5uwuVr7uKX5/0nFFPWgSPefUsPDxCZMy4XPw4are3ghno40GIj4b
         Wr3CK3Zx5iDAOIcsFR5oEMv3udZdESfMXo3OshxYJc8NRQXOs8OvkIkkDDtTYxvQ6KhT
         badg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684750091; x=1687342091;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HtQXyrgZDOxBRwlOTEpJ+2f141C8ejFNU18spWMbwj4=;
        b=lsTB66kMdaeVJ14UAB+2ClFblY8el99BSiD/F3DoyfsPbLYmIqNCaXVdB4AIFZplFc
         PCRwK2dOgObYCnlXyx7zwZyMUl++wVXAzl8p+oKdBvpaAmFYCYfPI8v0Bt7eEfTvFzoh
         i7VI1mKL0XU718PeYOPMOuP/IFT638mJ75ly5536ORUHnNdpfZtu92cSAIALG5WaydhK
         CRNxEshikVcteExSwCxJbFvZCGjeOm/ECZSiopzTSaMoStDFj5ZLgOF9KegOUtG1aJn/
         jYF7B4EvF/6BxKVcdmVG0bG0nNeT2YsTxWmmIylW8D6AcyzHoOMDYk/ShTM3ZcF6++to
         /jiw==
X-Gm-Message-State: AC+VfDzsbd96+EyL/2tr3MKQAQa0SYGhs8Qx610N6IHX7UN8aOHWpMoJ
	mjd2Op7OBxSgnoxACMk3A94Nwk3qlh+spNMnufc=
X-Google-Smtp-Source: ACHHUZ6l+WMXcGaeb7Vx5xMDFiKfpsJe44op0WHn2w6VEY7jNdEoxSvDiYRVm5zkqGNI9QhdaGcUXg==
X-Received: by 2002:a05:600c:3799:b0:3f6:774:fdc with SMTP id o25-20020a05600c379900b003f607740fdcmr722310wmr.18.1684750091389;
        Mon, 22 May 2023 03:08:11 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id f21-20020a1c6a15000000b003f601a31ca2sm5248849wmc.33.2023.05.22.03.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 03:08:11 -0700 (PDT)
Message-ID: <6217ebec-e6bc-74f6-0285-3c5af3adeae5@linaro.org>
Date: Mon, 22 May 2023 12:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 3/3] qemurunner: add boot logs to do_testimage task logs
 in real time
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20230510125935.4120156-1-mikko.rapeli@linaro.org>
 <20230510125935.4120156-3-mikko.rapeli@linaro.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230510125935.4120156-3-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 10:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181587

On 10/5/23 14:59, Mikko Rapeli wrote:
> Complex boot sequences take a lot of time to reach serial console login.
> In our case boot involves multiple bootloaders like u-boot and grub,
> then hypervisors like xen, then initramfs images which do things like
> validating secure boot and encrypting the main rootfs. All these happen
> before main rootfs serial console login prompt is reached and thus many
> things can go wrong, including race conditions, hangs and deadlocks, and
> thus logging the details is important for development.
> 
> This change adds the qemu serial console logs to do_testimage task logs while
> they are being read out. The logs are not added to bitbake output. This
> enables debugging and tracing the do_testimage via task log file while the boot
> and tests are running.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   meta/lib/oeqa/utils/qemurunner.py | 1 +
>   1 file changed, 1 insertion(+)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>



