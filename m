Return-Path: <philmd@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9554AEB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 08:17:54 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.8281.1689841064933900182
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 01:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=aJuZk9fS;
 spf=pass (domain: linaro.org, ip: 209.85.221.53, mailfrom: philmd@linaro.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3144bf65ce9so395571f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 01:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689841063; x=1690445863;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JW/zEmAa7g/sym9QgMTeGBIHAgdrGjzqTti1iQI8H0A=;
        b=aJuZk9fSBgzhM3VsawNnyktBLaSYvfqOlrccFM4WOf+5OoHnr0F+ws8N/9uXEm+dei
         4p3fC+COCJd1Q5wpP7/ypRv7KIzSxQrQKUnJQ0lJiBrXfNRWBLTgo3rVtXYr6CfSI0vi
         anA8sZp9yeiBThMGCwynzlJok+s/GKLAFvcGuxFofxo5NC3nvQKN+UjuuiMR/nhpwptl
         680B9RvbPaHE3KGzL+CTwB+jMJznLyM9DB5B2zQQwLpKCocJ/cQbDtPRK7c9d8C/lMpF
         hVQbh3fiM10bbqSAaP9hTFHdmMy/YEatSn0Mh/v9pyEKAgUAZDGoOCB0UatZM77JAhdE
         CVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689841063; x=1690445863;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JW/zEmAa7g/sym9QgMTeGBIHAgdrGjzqTti1iQI8H0A=;
        b=H/8Rglwhd7yv3y8Rqe0mlhJwxiCa+a9344oliceGm/KWndV6pG+oqRvFFmgw18QlDK
         Lvi8pZztKMgStJxPb/Xwxc/SrbnLXIau4sBCbZdbtFylz6grlir97mwRi0fEO+esVcJ6
         Co9dR568U4WagEkUTxe+ZIXb+2smF6KJc/lzPAvYSxo5soiY62rZOYgop0WyZ8tfMuEo
         GWVVkWXMyHR8dmbtWi9t8KqUB57wsOirV+XOX7kgqEiROpkedZs9RMNgGQyPx5vkMF1o
         OX5OsC5JByxkb/fGDy+0wwx90EnB5ELoy5GUYR47KMz0VUypWqbdWyBw16v/qbbHdGaB
         Sd5g==
X-Gm-Message-State: ABy/qLb/3A/VOTptrlowIYzRb8d3aVVs++zjaSrNoRlWFGhpofPPaHM+
	3OaMV89IhDqBo5sBmmRzVJDvKw==
X-Google-Smtp-Source: APBJJlEJOlCa4++bxae6B9yTmeR6EYq+9xkulQpcnr08uB7dgTbsLSoWJATQMdj9Ah13wCCRSuiQjQ==
X-Received: by 2002:a5d:4387:0:b0:314:544d:199b with SMTP id i7-20020a5d4387000000b00314544d199bmr1533742wrq.6.1689841063329;
        Thu, 20 Jul 2023 01:17:43 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.214.178])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600011c700b00313fd294d6csm591836wrx.7.2023.07.20.01.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 01:17:42 -0700 (PDT)
Message-ID: <aee2f929-501b-769f-7af3-09880ca24a19@linaro.org>
Date: Thu, 20 Jul 2023 10:17:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [OE-core][dunfell][PATCH] qemu: backport Debian patch to fix
 CVE-2023-0330
Content-Language: en-US
To: Vijay Anusuri <vanusuri@mvista.com>,
 openembedded-core@lists.openembedded.org
References: <20230714135402.1664938-1-vanusuri@mvista.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230714135402.1664938-1-vanusuri@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 08:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184625

On 14/7/23 15:54, Vijay Anusuri wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
> 
> import patch from ubuntu to fix
>   CVE-2023-0330
> 
> Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches?h=ubuntu/focal-security
> Upstream commit
> https://gitlab.com/qemu-project/qemu/-/commit/b987718bbb1d0eabf95499b976212dd5f0120d75]
> 
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>   .../qemu/qemu/CVE-2023-0330.patch             | 77 +++++++++++++++++++
>   2 files changed, 78 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


