Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D9EC64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 09:15:38 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.15186.1678439728928543166
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 01:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c0Ab2ed7;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id j11so17799076edq.4
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 01:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678439727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aVqG41iZqHfHzyEvM8N9dDy7hmqt80yLK9XApeS17r8=;
        b=c0Ab2ed7oMYxYe6eG5SOK4SA/TdCn8klIxqieYpi33CozvS3AdWt9v3L/RfhWRlpva
         pw7DrDteExMppvsi1rI9wh1C0lKF7AqdLutLN9VO6dZw6tBfjP6Ni3gWWSBEjtbpBWCG
         +2Sqjc5+hwEmo38UxaRByF9r0rRwJ3VCvMRUtYiVScgHVj91PBoUbStgKU9ktEwkua7V
         dt0j1gEzmBAxwSJgBdiHGX6v8laddC1TYBNUNXSvIzgJzUiVeQ5aoYP9iC5jc5q1l5Y1
         xNG21htLnylFhSNDaCm+qGcrMGnvlv184we8v2X0l3C3CegiIhccJs43NFlQ1Z+Y9aBA
         a40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678439727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVqG41iZqHfHzyEvM8N9dDy7hmqt80yLK9XApeS17r8=;
        b=uxCMk2w5UwnfWZ12QFZfUROsmnWGAxbxzDq4hl4Za0J/SQ4W39U5B5HYxPImViXtGv
         ooPqdmvigqWeDY6qgxhBvJ11xrWS6OA2tjgLcgDPg5cp9TkRpI5j1MZjpOXSsI5//GF1
         eWJQS96O9s7CbEhag2vH3pB03D5rRieFk+LVJJmQd32pXXG9PvQGVcA3ZN7Mc46YK0Gi
         81QIr7lVHJyRU9bC10HnewirOiirMi+uET2E4Dz4XwI41XCEstpK6nae811xsrvvDgcM
         Ilab4NUosFjytr1S0827CM7p0oAPtTclBEACAq+n6CQ0pd9jCFn+pb7xcdfqabAMz+nh
         msag==
X-Gm-Message-State: AO0yUKXPplHI39UUq5luNCy0fpEuqLfRUdaC1gnIufdeqM07VHQifOmP
	iFIyctgDcHKcQKfTa3fnMsc=
X-Google-Smtp-Source: AK7set9izh8jXngqnbq+m2Ebkd7UiKXgFjyraKyM2zxdPuNs6KnDqAHbaA85tJ415yZfNmJvhaCy8g==
X-Received: by 2002:aa7:c3c7:0:b0:4d5:9fc3:d361 with SMTP id l7-20020aa7c3c7000000b004d59fc3d361mr18169744edr.41.1678439727080;
        Fri, 10 Mar 2023 01:15:27 -0800 (PST)
Received: from [192.168.1.143] (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id c22-20020a50d656000000b004c09527d62dsm589551edj.30.2023.03.10.01.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 01:15:26 -0800 (PST)
Message-ID: <643a54cd-c12b-1407-7c7a-814d188f8a97@gmail.com>
Date: Fri, 10 Mar 2023 10:15:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] python3-ninja to speed up cmake builds of python
 modules
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <ed526f1f-9ef4-5c46-1ee5-7eef641c9684@gmail.com>
 <1E9DF585-4E79-46C4-A07D-A56B46F9CB10@arm.com>
 <c01e6137-1b57-4ba7-c60f-479af59e3672@gmail.com>
 <A2660F77-F343-463C-81FD-D571202D3F1D@arm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <A2660F77-F343-463C-81FD-D571202D3F1D@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 09:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178313

2023. 03. 08. 13:40 keltezéssel, Ross Burton írta:
>
>> On 8 Mar 2023, at 12:32, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> The code in pytorch does "import ninja" conditionally,
>> so it expects it as a python module. Also, this specific
>> package and anything that uses pytorch for its build
>> (like torchvision) complains about the same.
>
> That would be:
>
> https://pypi.org/project/ninja/
> https://github.com/scikit-build/ninja-python-distributions
>
> Which is a bit icky.  We have a ninja binary already, I wonder if we can build just the python pieces there.

Is there a way to distinguish between the download files for
cmake vs python3-cmake
ninja vs python3-ninja
?

The file names from pypi.org are exactly the same as
the source downloads of cmake and ninja of the same versions
but obviously with different checksums.


