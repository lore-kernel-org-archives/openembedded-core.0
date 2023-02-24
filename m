Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C10C7EE23
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 16:41:31 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.22711.1677256890705509791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 08:41:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RCYDRiuO;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id eg37so53253651edb.12
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 08:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RPFeEmxdZVSuRhxOXrRa7TzLQ0Kj0QOZAFv3qGNUzio=;
        b=RCYDRiuO3s7IFQwmep2eOz2BJtnp5V73siSjBx5QXPPKKCZAma5B2WeaIv6g+IaUPZ
         enjCi6dpfakkrFIIW/E4uMFQO6L1lt7lw8NMi5pFR7v5o5Sfjj521ZnJqPZKOKFfoJR2
         KWmt/WyHrDWdtbnV1vtto0ctfwVWxcKkkFYXS70B2+tiRBryvLDsRDMncMZhhIqknFN2
         ZwAo61c1ovsMw0yhfQaDmZzpdMuTvrYsyUOU/pGz72B0kCjPsBdoMKed+3uu/0JMyieb
         7iIeedRwYrqdzx73q1hgBvK7J8VN3fLn+P80wN8tpBSv8ZCiQkfUYtJqX1CJ48Tw1rgH
         S0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RPFeEmxdZVSuRhxOXrRa7TzLQ0Kj0QOZAFv3qGNUzio=;
        b=1zWtWImUlXb3FY2FbDE34CIxtG8/1vb74cP6gK5X1ZVyB0jSUygxlqGQeb1W8Qx0j6
         PMkvaltm+dh045DhLm0JQslEq5Nn+vXzHNdSYVpmLiyRaFkWKIR9JYzSapGR7NQhK6kW
         mXq5Xy/PSw5B0YpTx3eKhXkqR+jjUD2rYO+Xz6qrUkEer/qKoexmSqCM/wiuhEBxyjsX
         O3Q5k6E9iQHuyImi9hNmG402Q5xuSlGPSiDohO9MR8oMe5/UQFShuoKW5OunpSsPyjMX
         +UtAe8oVcVll7nmpJfM8vSQFbN9eTIweAII5+lDSanq8cYRKamuF/yKucms2AqWMKaXZ
         vCGA==
X-Gm-Message-State: AO0yUKUjEeOsqX62TCakb1QEnP1wru2KKtZ20dW0F+/L6gOQOERFlTo2
	6tdpo/LaD1V9wUnb9hCoaeo=
X-Google-Smtp-Source: AK7set991BW33wFzu5t6QofmvahYnHKAR/EK2464ofPbHwncF096DYfk8CyM7RoKoNg/+omDlZWqrg==
X-Received: by 2002:a17:906:5f93:b0:8af:2a97:91d4 with SMTP id a19-20020a1709065f9300b008af2a9791d4mr23042032eju.14.1677256889091;
        Fri, 24 Feb 2023 08:41:29 -0800 (PST)
Received: from [192.168.1.143] ([188.36.69.43])
        by smtp.gmail.com with ESMTPSA id t24-20020a1709066bd800b008c6c47f59c1sm7791788ejs.48.2023.02.24.08.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 08:41:28 -0800 (PST)
Message-ID: <8e7ae600-0df9-65d2-a82c-13a1680779be@gmail.com>
Date: Fri, 24 Feb 2023 17:41:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH 4/4] mesa: Add PACKAGECONFIG "rusticl"
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230224093850.3393567-1-zboszor@gmail.com>
 <20230224093850.3393567-4-zboszor@gmail.com>
 <3EE6D20C-8A7C-4772-BF56-E1CD25B12B6B@arm.com>
 <1746BAA6D62E4C0A.18951@lists.openembedded.org>
 <0dd9eb47-521e-7840-9196-f485f080b44c@gmail.com>
 <1746BD3631A1C7C1.29542@lists.openembedded.org>
 <CANNYZj-TwJHY4b6Ap8jaX3vw51VzQ06Dc5WGd7pAzFZ+k0vbOw@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-TwJHY4b6Ap8jaX3vw51VzQ06Dc5WGd7pAzFZ+k0vbOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 16:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177696

2023. 02. 24. 12:12 keltezéssel, Alexander Kanavin írta:
> On Fri, 24 Feb 2023 at 11:52, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
>> It also succeeds when there is no inherit rust at all, in the current
>> master branch recipe.
>>
>> If inherit rust is conditional, and condition is false, then there is
>> some other change that triggers the failure, and that change should be
>> conditional as well.
> Or is it the other way around - fails when condition should be true?
> How did you write it?

Copied from a different recipe and modified for this use case:

inherit ${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'rust', '', d)}


> Alex


