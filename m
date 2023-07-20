Return-Path: <philmd@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D95EB64DD
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 08:15:34 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.8246.1689840929098855004
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 01:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=F+YbLMAB;
 spf=pass (domain: linaro.org, ip: 209.85.128.44, mailfrom: philmd@linaro.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fbfa811667so10231425e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 01:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689840927; x=1690445727;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A+TmusmeRK+bQzKEu/zAMeB1mu0hgb0Ni0xw4IpywYU=;
        b=F+YbLMABjxOZTW1fletktmStV0QjgrBq3o9atkF3vvrDSkqBUhFEE1KIF4VKmWixSq
         RlXzG1CPtQWFeoEAlYodpnlrMNtvaB0+uJLGMVjV+8Z+Qqx15j/EYnWovyA2WZzg6ZDo
         fBzRACioVnfNGeiJR7oXpUt9ttzE3fyVEvTvgwmx/evqa6U1h11JIJ8Bejo7QG+mz/wt
         SEd0cE5I/xzcdNFWOHfpppZ5PJRvYdKE6dtJbxR3oZdS8I4Dd7CLEc225XnO8SHgv41r
         blfh2kRZS6xnTQYAN6Rqe6DFzQjIubRD5mgbZ+sjf2IFXXBSxna+DnyrFBLdwbblG22x
         Kylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689840927; x=1690445727;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+TmusmeRK+bQzKEu/zAMeB1mu0hgb0Ni0xw4IpywYU=;
        b=UZ7mZBv7U45Qre1869Q07Rfki/sEB/M9OmcTRWE7jFMDzXXVjodMGhyBrXZ0Y52GP6
         I9nnqrepGB1N+mn7T7XilijL+gOxxdp4wlD4J3yZh22pvVDRk5ZM9Bc7j2bAk3Jbdj6M
         Fhr39lWKqlWL4gjml9XW1v7nh1QQxC5LhPR3AKyk6fQ7y4yxhkBIhc2qcFsN7ekNrx6m
         Rs25qTiOp8elfhpzFfN8oRe8kvaD6RD6MyAV4noJYwd3gdv/S10Jd1pwVKr1SXbAjjLT
         W4a+btgWmvRxJDmFlgMFFna9z/pnAPsTuQZ62eBmBM2EGHB4RF3OP016wUth3vsWmLcu
         U8Cw==
X-Gm-Message-State: ABy/qLbZdawEmKvArF3T3tQCdl2jyBxEQa5pwataXMsHcMVnxXdLiLX3
	YaCspiGJ/JGmpyXslsbUytdPkA==
X-Google-Smtp-Source: APBJJlHyDEvd67oqCT/cOVMWB02R0tFj09UhmyuQK57r2bBT6STflyJ6W0kiaitrbt7BrlekjvLIOA==
X-Received: by 2002:a1c:7917:0:b0:3f7:c92:57a0 with SMTP id l23-20020a1c7917000000b003f70c9257a0mr3637380wme.14.1689840927251;
        Thu, 20 Jul 2023 01:15:27 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.214.178])
        by smtp.gmail.com with ESMTPSA id hn32-20020a05600ca3a000b003f9bd9e3226sm584756wmb.7.2023.07.20.01.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 01:15:26 -0700 (PDT)
Message-ID: <dd6a2890-da4a-5988-e026-660febb76a13@linaro.org>
Date: Thu, 20 Jul 2023 10:15:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [oe-core][mickledore][PATCH 1/1] qemu: fix CVE-2023-0330
Content-Language: en-US
To: archana.polampalli@windriver.com, openembedded-core@lists.openembedded.org
Cc: Hari.GPillai@windriver.com
References: <20230718153514.536611-1-archana.polampalli@windriver.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230718153514.536611-1-archana.polampalli@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 08:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184623

On 18/7/23 17:35, Polampalli, Archana via lists.openembedded.org wrote:
> A vulnerability in the lsi53c895a device affects the latest version
> of qemu. A DMA-MMIO reentrancy problem may lead to memory corruption
> bugs like stack overflow or use-after-free.
> 
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-0330
> 
> Upstream patches:
> https://gitlab.com/qemu-project/qemu/-/commit/b987718bbb1d0eabf95499b976212dd5f0120d75
> 
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>   .../qemu/qemu/CVE-2023-0330.patch             | 75 +++++++++++++++++++
>   2 files changed, 76 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


