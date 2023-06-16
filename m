Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEC0EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 12:46:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.6721.1686917180116538778
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 05:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=JNoWRQ36;
 spf=pass (domain: baylibre.com, ip: 209.85.128.50, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f8d65ecdbbso4813035e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 05:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686917178; x=1689509178;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9AJAziK1qr9LmGNCPAIB61AfaBd+nrucmh1361ZEOJ0=;
        b=JNoWRQ360QkRd8ylOVdSoc5Jgo6aTTeaS+h8F8zrSzPj2gQyGfxAvTOVlY3p0HQU8I
         Hayu2hI7dddK4KA2PuLxgOhjT2gH7MyPmPCA+gasKTlgOukffz/VThLo5414jlQV/4lr
         Z9iD8oOcB03wpiENA9feHIhOfr7tPyFGOrLyiDVVdkuqcd7x6tJZhB1V7aKRfgisJimr
         7Rjd27dzziDTFvV1+BdmCOd81Xs1wqDvXOJFCqLD60Y816sV6NXawkekrEXxTBeqXV0v
         4h6K+waJRbCt8qPITDWvZC+qapiG1kiTbUPykJu/aBY66hRVC/r+dbMy0Ub0NRlcNRM1
         OJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686917178; x=1689509178;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9AJAziK1qr9LmGNCPAIB61AfaBd+nrucmh1361ZEOJ0=;
        b=cFK1d4N//2htB6NaCM04Nu40ey69GFmg3mfpkyO/83aTCW89bC1eZjagdrpae9uojJ
         m2IOBgLFls1SArkVOnm5VLyHAuupZfJBqThmduxR0TGUaRU7t1pmmrkEXfDSErsfEIqA
         D1Qe62694+tUWDNb4zvAEri4Pve4HfZ711QgTZkrAnUYjvY5UkaVUCWN2JVRGsJyrrmL
         CVkp7iiW3MmWHVniz/fDkYV4JlaRY55DFruXRhDBl9Rm5nIgtWwt+rEtoahFEmLF2lAA
         Hm9vsrQN9x1GqUa7/k4lHVGiRQsV5O4C9gQHIlgXW+g/3Ix8ZIoolrS5ihKEa4J6TJQy
         /xQQ==
X-Gm-Message-State: AC+VfDzatcycII6TM6MDUzXVrbo2HTCq5gojVSTgRpVfAT90gdAw8+xi
	Hu03cXUCkcpfUWKqrc9YvZ0PlA==
X-Google-Smtp-Source: ACHHUZ5TLoVKBM9nRt36iwz2Ot/hVvhJ65Lzc0ZzoH2EQcMM4cD3pBH4PlxUqkEwF9NgHlX6I8lOwA==
X-Received: by 2002:a7b:c7ca:0:b0:3f7:e65f:7af2 with SMTP id z10-20020a7bc7ca000000b003f7e65f7af2mr1373426wmk.39.1686917178290;
        Fri, 16 Jun 2023 05:06:18 -0700 (PDT)
Received: from [192.168.178.55] ([194.110.145.180])
        by smtp.gmail.com with ESMTPSA id i1-20020a5d4381000000b0030c4d8930b1sm23437393wrq.91.2023.06.16.05.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 05:06:17 -0700 (PDT)
Message-ID: <bfdd1d9b-2f7b-2368-5d89-d2e2661d7894@baylibre.com>
Date: Fri, 16 Jun 2023 13:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH 0/3] wayland/weston upgrades
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <cover.1686856412.git.pidge@baylibre.com>
 <66bd3738b2a2175863074cde65ff76d175bfc735.camel@linuxfoundation.org>
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
In-Reply-To: <66bd3738b2a2175863074cde65ff76d175bfc735.camel@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 12:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183019

On 16/06/2023 08:31, Richard Purdie wrote:
> On Thu, 2023-06-15 at 20:20 +0100, Eilís 'pidge' Ní Fhlannagáin wrote:
>> Nothing really surprising here, except we should note that launcher-logind is
>> being depreciated so some thought on how that is dealt with will need to occur.
>>
>> Eilís 'pidge' Ní Fhlannagáin (3):
>>    wayland-utils: upgrade 1.1.0 -> 1.2.0
>>    weston: Upgrade 11.0.1 -> 12.0.1
>>    xwayland: Upgrade 23.1.1 -> 23.1.2
>>
>>   ...ayland-info-Fix-build-without-libdrm.patch | 42 -------------------
>>   ...-utils_1.1.0.bb => wayland-utils_1.2.0.bb} |  3 +-
>>   .../{weston_11.0.1.bb => weston_12.0.1.bb}    | 10 +++--
>>   ...{xwayland_23.1.1.bb => xwayland_23.1.2.bb} |  2 +-
>>   4 files changed, 9 insertions(+), 48 deletions(-)
>>   delete mode 100644 meta/recipes-graphics/wayland/files/0001-wayland-info-Fix-build-without-libdrm.patch
>>   rename meta/recipes-graphics/wayland/{wayland-utils_1.1.0.bb => wayland-utils_1.2.0.bb} (82%)
>>   rename meta/recipes-graphics/wayland/{weston_11.0.1.bb => weston_12.0.1.bb} (92%)
>>   rename meta/recipes-graphics/xwayland/{xwayland_23.1.1.bb => xwayland_23.1.2.bb} (95%)
> 
> Thanks for these. Unfortunately there is a bit more work needed as I
> think you didn't have ptests enabled:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/7200/steps/11/logs/stdio
> 
> | Dependency xcb found: YES 1.15 (cached)
> | Run-time dependency xcb-cursor found: NO (tried pkgconfig and cmake)
> |
> | ../weston-12.0.1/tests/meson.build:317:2: ERROR: Problem encountered:
> xcb and xcb-cursor required for running xwayland tests
> 
> which happened on musl and a load of other places in the parent build.

Thanks RP, I'll look today.

> 
> Cheers,
> 
> Richard

-- 
Eilís 'pidge' Ní Fhlannagáin
BayLibre - At the Heart of Embedded Linux
www.baylibre.com


