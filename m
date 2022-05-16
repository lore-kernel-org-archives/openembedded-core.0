Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA67EC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 13:18:10 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.28536.1652707087936317870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 06:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K5J5DRxq;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id bq30so25758924lfb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=3Fapeqx5cJrE6+gVjnJUOxgwcZFPrcWZNL9UwlcC2Uk=;
        b=K5J5DRxqBfuP0lFIlqfo3dTku/o95+CzXtZefYihuNSNvPMwG/z9vJSklEqbARaJxT
         gDe4rt/TRmlGKZuDrE558oVuNeBCPoiQRPLeAvU80q9ishFp/F5iBsmfjwMT3lygvUg0
         bS4eSEAB+w+kZWirdr6zF/sL6IoeE6/kYatMBiPlJHOu2KnQ+rrTbs1yp+RwpA90yXE5
         o9Jwg9v/to6NfTERWtbLBFFZlUwnaYTCUKYq9JhGVQCM75qSqCxDZuY1Vbbc3KmpHTgY
         Qpr80+mxdMiOE3qmie6g21rPzw1eSNTeY3/ujI5NMcZsrI3oPySfAKJ/uEC4Avi6uFAX
         1uuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3Fapeqx5cJrE6+gVjnJUOxgwcZFPrcWZNL9UwlcC2Uk=;
        b=a1AN95yE5/kzKMjHqUBAaFc3fQ1wxWiARpL9cmdcI0Ub7GH2NRwOiAcsAViJBleVl6
         plYimsJ6T5eAMvoKXqdPsJFXvlbbgPGoy5Ky6ckSfBFfMYtwpoaXWd8LzjL+RT7deLqJ
         OZ1GXZ6Z2bPSIRcPgQvXPg1nESVGeOcS5CEu5TmC4E3kgFi90YHpyKKSkW9gwJ7naOY6
         v0hW1PSGra7heh1+HsorKWfKVZCRqRI2oxSBgLda4V/KyRd4XMv1KMRe5YLjT+R8Hgho
         E/OxRLuPsSs+N3X8gwa3QCQYj7S8DrkY1VN2SNg8AfVG/lQlTjnssGqqocPunJ/zHwVd
         sP/A==
X-Gm-Message-State: AOAM532DjrajShhlAZhSYBtrlU0X62PUF+XJcyFETVH5qPE68qB0lvBB
	xn2vpGbQxmojVDV/l7td71M=
X-Google-Smtp-Source: 
 ABdhPJwdT0aqmidyK7SRrD+ROw9fA0LSngSYzpFBtxSE6nMPHItjqb6qfnSFL+fuMJDeZqTXiPxoyw==
X-Received: by 2002:a19:6b19:0:b0:471:f39c:7d1d with SMTP id
 d25-20020a196b19000000b00471f39c7d1dmr13107205lfa.443.1652707086146;
        Mon, 16 May 2022 06:18:06 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 c9-20020a197609000000b0047255d2113bsm1303203lff.106.2022.05.16.06.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 06:18:05 -0700 (PDT)
Message-ID: <eafd8c17-02e4-9ff9-3e9b-df806f3dbaa4@gmail.com>
Date: Mon, 16 May 2022 15:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [OE-core] [PATCH] selftest/imagefeatures/overlayfs: Always append
 to DISTRO_FEATURES
Content-Language: en-US
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 richard.purdie@linuxfoundation.org, openembedded-core@lists.openembedded.org
References: <20220516112849.448882-1-richard.purdie@linuxfoundation.org>
 <7763f240-35b1-27d8-f2ec-8860dbea0e48@gmail.com>
 <63b10a5b05a1a029e50725341b1cb5cf4838ac53.camel@linuxfoundation.org>
 <660498bc-9239-4f1f-097d-29b562ba76a3@gmail.com>
 <e6c6fc91-5e14-3084-40e0-ac4e8be76c1b@theobroma-systems.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <e6c6fc91-5e14-3084-40e0-ac4e8be76c1b@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 13:18:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165682

On 5/16/22 15:01, Quentin Schulz wrote:
> Hi Jacob,
> 
> On 5/16/22 14:52, Jacob Kroon wrote:
>> On 5/16/22 14:38, richard.purdie@linuxfoundation.org wrote:
>>> On Mon, 2022-05-16 at 13:43 +0200, Jacob Kroon wrote:
>>>> Hi Richard,
>>>>
>>>> On 5/16/22 13:28, Richard Purdie wrote:
>>>>> Using += unintentionally removes all over entries from 
>>>>> DISTRO_FEATURES and
>>>>
>>>> "over", you mean "other" ? If so, how is that possible ?
>>>
>>> I mean other, I'll fix the typo. It happens due to:
>>>
>>> meta-poky/conf/distro/poky.conf:DISTRO_FEATURES ?= 
>>> "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
>>>
>>> which interacts badly with "+=" :(
>>>
>>> I'm not happy about the situation with variable interactions but still
>>> not entirely sure the best way to proceed.
>>>
>>
>> That is surprising to me. I tried this snippet in a Makefile:
>>
>> foo ?= bar1
>>
>>
>>
>> foo += bar2
>>
> 
> Same for Bitbake.
> 
> However:
> foo += bar2
> 
> foo ?= bar1
> 
> will return " bar2", while make returns "bar2" (note the missing leading 
> space).
> 
> The issue is where the ?= is located. If it is in a recipe, 
> configuration files need to use :append otherwise they will override ?= 
> (as configuration files are parsed before recipes).
> 

Right, I see. So the "+="-operator is behaving as expected, but in this 
case the order of the statements forces usage of the append-override :-/

Jacob

