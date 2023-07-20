Return-Path: <philmd@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1F0EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 08:17:24 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.8271.1689841035639517891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 01:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=atxml138;
 spf=pass (domain: linaro.org, ip: 209.85.128.45, mailfrom: philmd@linaro.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fbf1b82d9cso3704805e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 01:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689841034; x=1690445834;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vXshR/ugQKoiwODvMYn2okawtiGhZYJgMTnWoneQ0EA=;
        b=atxml138bG+brlIDvGxgdJ6N2K/64j4Syy8qAOiUgtP7V2GS65zV/SFTCYa1vlUBQz
         x8Th1a26QmU/3XnArRdo2zCAPrsGIxJ4TidtQkn3/RWPgjO3LvBvWfTsIvXbeHXQZ4EK
         IqQNLDmrRAhkY/16pNeZm1CpPv1tOg3nwdFffw1ccrZ7CZA+HA0PbAL5jtYwrx36LHZF
         DtgHPsPYY6XrtlYTwnXnZwRzvrxSip3S3fhCKUdTkxbwJ2E0PmBJqkzomtd0XlpIRqT7
         A0+Cu6L1ilD649w2TVIthgq8kn0gSmRPxrjjoLkrovqrYvzMeZTpK37GuNEFC/TTxtX4
         uFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689841034; x=1690445834;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vXshR/ugQKoiwODvMYn2okawtiGhZYJgMTnWoneQ0EA=;
        b=HFrnztsBujnXBwJNM6wV6g8oObWPLmiaAIGGN29qxQw6sOL1TaBwmJvwHAbqeCzXue
         6B7nz7B95z8377KOyAnxX+XR5QakqaCzWZ0nZj/CHxHy02n/KNxZ+Qxhy9N1KOABojW5
         c/uMfvEc3hn6aC6p/hifR1g5TzBqolrCuoOCW+hZFF1B2phEDIdmwoNY3yKS1nfc8xlM
         GN3r1Y9g2l1hKkQxPKF+hGpqtOJ9A3eDdHdj5Ll8I5OIKlCwk3OvsFCspNnCfFlSPSnz
         lDaw9BtOCetMLowtovgIfCAiQlMP0q2oB/eUp3SxI7CrhAyrehRsAE+iA4Z2psdIZpW5
         rfeQ==
X-Gm-Message-State: ABy/qLaOPidAfcjd5/hiSCvsS3UfVexXfRVzQX3T480Wiwy+66QdbFOO
	1jBRJLWoAe1+kj4qVgLnlhKkq/irJUWbL3ZWphk=
X-Google-Smtp-Source: APBJJlFCQhCagrKa5aeTjTaFa1LFAm+NVidTyJmhyhhVOU48ksuCRMQVm+XswmM9vEtf6H35QYxkFA==
X-Received: by 2002:a7b:c84c:0:b0:3f7:678c:74b0 with SMTP id c12-20020a7bc84c000000b003f7678c74b0mr3777359wml.12.1689841033933;
        Thu, 20 Jul 2023 01:17:13 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.214.178])
        by smtp.gmail.com with ESMTPSA id x12-20020a5d650c000000b003143aa0ca8asm578829wru.13.2023.07.20.01.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 01:17:13 -0700 (PDT)
Message-ID: <763b2041-070c-8253-234d-f86df4c0cc60@linaro.org>
Date: Thu, 20 Jul 2023 10:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [OE-core][kirkstone][PATCH] qemu: backport Debian patch to fix
 CVE-2023-0330
Content-Language: en-US
To: Vijay Anusuri <vanusuri@mvista.com>,
 openembedded-core@lists.openembedded.org
References: <20230718060104.988551-1-vanusuri@mvista.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230718060104.988551-1-vanusuri@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 08:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184624

On 18/7/23 08:01, Vijay Anusuri wrote:
> From: Vijay Anusuri <vanusuri@mvista.com>
> 
> import patch from ubuntu to fix
>   CVE-2023-0330
> 
> Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/qemu/tree/debian/patches?h=ubuntu/jammy-security
> Upstream commit https://gitlab.com/qemu-project/qemu/-/commit/b987718bbb1d0eabf95499b976212dd5f0120d75]
> 
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>   .../qemu/qemu/CVE-2023-0330.patch             | 75 +++++++++++++++++++
>   2 files changed, 76 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


