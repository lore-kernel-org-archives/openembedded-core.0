Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43419C47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 11:32:41 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.13642.1706268753798710946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 03:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LhmOXn+z;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: zboszor@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d75c97ea6aso1726205ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 03:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706268753; x=1706873553; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RG1j4+Pz8eFtQIKBWhd+zFWsu/B2om5SMbZeJ+cAo18=;
        b=LhmOXn+zeNLJkvlYcciDBvMXhZKFAE1T/amuCXUh9gxcjODz36gnhXKoX7lmUmyNIW
         FW1Fh34Vi2JATjbgMHKpxOl8LAXjxlJIknKo5FIyrTo9eoNOEunyaMh8TC+2yhNYSUtl
         vS0kzMpRogi/vn2hqVV4KnUpu1+PbXDFDXVDJg1WEB1zlpkLm9NAIDANXhIqfHIbiaGT
         nosl4HkWkk0uXJqvxy68yrkAeajc3jOV+9w26oRIhchrTgzV3zOlwBZLz1Wxeb65EJsA
         ZeMAyMZIU8PIwJYDI2p9H6KzUp7OpCOEzTe3OovXvvZML0/VOfeSEPyW8gdN+sdLPHsF
         prEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706268753; x=1706873553;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RG1j4+Pz8eFtQIKBWhd+zFWsu/B2om5SMbZeJ+cAo18=;
        b=mqXo3F8VLhvQNaUEekB9mEHopYmoAGMsuZdibsSwp9kiqynojyuy1LGuuIn4NHlwgh
         PfXXkrQ0Q+aDPvsh/MRjDxMtJwj/9XcM+w4voJYJUFUKsOboGiMAOKsveRMIFEYflKPx
         xbTP+GKNVK2gbJzqg3KzXsTzyhcDe+36NO9VYNY7tW4cm/SmpwG2OxXhPUlCS7uGxqZ5
         DFyxi/FnVNA5XsUtveUWH2highiDQvQ1qNhxxcVGp1+74PARM5TbJcKmQjM4YWgWRFaX
         t2SdiGR0xXNBv4ynIE1/cPUWX+u1giQGAo2zbt609THVXHwuK2vkwJ+Qipyw0NNVUT6f
         wg3g==
X-Gm-Message-State: AOJu0Yy/Mi/rJqlm29f7aNKxQaJLzD/bpaxsXPYveE4ee1pjsIakMOsY
	LPlAkarGzC01mhxeOuYD0+JoAZ0x5FJ7Cus/A/J1LoOOmiXUViOY
X-Google-Smtp-Source: AGHT+IGCLcqU4XQR1cY/elMv8gRvmn8oXASGBEC3nwAkNizEHAIFOG/uZxpNU1YCrROeRcrQbHfxqg==
X-Received: by 2002:a17:902:be09:b0:1d5:f38f:ec36 with SMTP id r9-20020a170902be0900b001d5f38fec36mr1001541pls.35.1706268753084;
        Fri, 26 Jan 2024 03:32:33 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id y21-20020a170902e19500b001d5af7fbda0sm805487pla.122.2024.01.26.03.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 03:32:32 -0800 (PST)
Message-ID: <421a8734-8e1c-4e19-9f34-ae72828f5ee8@gmail.com>
Date: Fri, 26 Jan 2024 12:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] bb.utils.vercmp_string_op() vs Python 3.12
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
References: <4ed80c78-5940-454d-b4a7-a820f04f0f08@gmail.com>
 <CA+chaQfrEKrfFDEKt3__x1pg2SPApqU60e8RWOYHPOvmUDGcpg@mail.gmail.com>
 <17ADE16B2210C84D.24595@lists.openembedded.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <17ADE16B2210C84D.24595@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 11:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194353

2024. 01. 26. 12:14 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2024. 01. 26. 11:53 keltezéssel, Martin Jansa írta:
>> > I copied vercmp_string_op() and all others called by it from bitbake/lib/bb/utils.py 
>> into a new python script.
>>
>> It's not an issue in vercmp_string_op itself,

Here's what the internal waf in jack 1.9.22 says:

zozo@localhost:~/jack2$ python3 waf --version
waf 2.0.12 (54841218840ffa34fddf834680a5a17db69caa12)
zozo@localhost:~/jack2$ python3 --version
Python 3.12.1

No SyntaxWarning emitted, no matter how many times I try.
This is why I think it's an internal python 3.12.x issue.


