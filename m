Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4096FC54FB3
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 02:32:19 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.2148.1748572334045812795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 19:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aWkN+2qd;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234bfe37cccso20879855ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 19:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748572333; x=1749177133; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmkJiDA1icZHBqyULBWGrRpw0catyB/QvK+iAweZM4M=;
        b=aWkN+2qdtwPuJ4bwQzYJ2svORCmoaPR8cDsTLf3YTPnyowuYlzTM8laq1IhcdDKigc
         TU08Xt9yqFQfpCEM28ui8H4WjvkYzFFd6QRVi/pVMW80JJo3WOfq0AzcJ81/u1B2g6uc
         g3kL9rCqrgCTAdnZcQ6TIIbL6kVkPx3COeYSOnxp3ND2EIfIM3MnD3KeoToFyNfk9oeq
         PwxFWhs7FtYa/830uBDGb7lw6KILMTOwb7Yj3lWV8TBLUKl3CySuZnJ08/cXIa4FxBxb
         vsiHo5eWWSG40sRWYUwAenU7yfumGjrQBGePBZjHNmdT6ZhCwm4pi4W5Q+wQQ8wX9oDP
         NwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748572333; x=1749177133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmkJiDA1icZHBqyULBWGrRpw0catyB/QvK+iAweZM4M=;
        b=v+Mw+G/oBRK+kC4BlCtHOHO50psjMyGWcKqDSp8E5k2EzJTIRNbMiYBu8c3uFpqbIw
         Rr1kRRl9ebh70bjOQe2w3nyeoFSGCNT4Z86FXSf1ouEudyF1LHbMlDfwp69FmZXJEnDM
         KG2OPnouIenS66omDuhBVkVGtiucbVWy46EgdgxQLHUtwhWsc1sSkaaF5oFmsaKlIMRd
         ZK7CtPky7PfU33Dxec6NT3sk853d8W6oECdK28gFSWCfxjFkRXQm6LNRZHoXctziGtrS
         CLTF/PlMEU2vwCXvjbIhMnh/yRRb33dKZBdYYjk1QA4i2LyEy+FRb2czRzgIZz94avXD
         Z2lQ==
X-Gm-Message-State: AOJu0YwaP8BJAWcptFfvQLObsDp7Ak/d7jqK5zj+L3wdge2uPbOAx3DT
	kXevdQE5ZQFlVZnOXFqx9qKg5pMcU0NCHla1rH8K9oAAslT+fur/T8i1
X-Gm-Gg: ASbGncs9Jhhg3MbwcrCye3Z1fwHmAO+Xm2kKbj63REegnz0XLkKjyoh5/MVEpJQHLBE
	P7RKSbOOB0CgCR8mlVLdjreIcNby5YglXrZ7yWpw8Flfib7xBeCKACHCJXEsWwBEUz1gZtk6N+h
	cWpK+lV9oOWbOL70CQJEYM9/JMQtlTEJG74/3KjgZreatVtmPCWon9X9V8t5flQNwN8HSgNgJPg
	Or+hhicY/t4DEYJmpm6yPpp8fJGTNvdvakHz6vyGpI37oUQuZvLQFyfi73ET/yhaJ5ooiI0NO/v
	1M99wYfqlW2uYdA85F1nyzEcKiZklkULo6MCfDu4G9GKVExIsBPBSijfF/ChChJqcO3x17yhRjH
	bQp1D3wXb+aSJI80G2sJxClW5e8SwcEAL3Nzm
X-Google-Smtp-Source: AGHT+IFytTCRwKmDGnq7qkNqhZdLQi7NfJLXQnoL83nniA87n+kT0nQsRY6sqBmOoVEIcR994sofpg==
X-Received: by 2002:a17:903:2f85:b0:234:aaa9:f929 with SMTP id d9443c01a7336-2353964798cmr6552425ad.47.1748572333310;
        Thu, 29 May 2025 19:32:13 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:791c:f54:adbb:c8c1? ([2601:646:8201:fd20:791c:f54:adbb:c8c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd93a5sm18752855ad.82.2025.05.29.19.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 19:32:12 -0700 (PDT)
Message-ID: <7571c07b-2225-4449-8169-08b044208072@gmail.com>
Date: Thu, 29 May 2025 19:32:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: alex.kanavin@gmail.com, Yash Shinde <Yash.Shinde@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 "MacLeod, Randy" <randy.macleod@windriver.com>,
 "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
 <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com>
 <47ba1f68-f67b-4c58-b788-63e06fdf4816@windriver.com>
 <CANNYZj-JtVtjk2e+Z=OmVF8RaygO5M1e+6tbQuTZYotbYetQrg@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANNYZj-JtVtjk2e+Z=OmVF8RaygO5M1e+6tbQuTZYotbYetQrg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 02:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217458



On 5/27/25 9:26 AM, Alexander Kanavin via lists.openembedded.org wrote:
> On Tue, 27 May 2025 at 16:42, Yash Shinde <Yash.Shinde@windriver.com> wrote:
>> Yeah, that's the reason.
>>
>> I am not sure how rust-lld is installed in ${D} now. A similar error was
>> previously resolved by using:
>> "+TARGET_CC_ARCH +=
>> "${LDFLAGS}""(https://git.yoctoproject.org/poky/commit/?id=cc24a0ff76f2e227cc3a0f478d078b2158299a80)
>>
>> LDFLAGS are explicitly unset in rust recipe.
>> (https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/rust/rust_1.85.1.bb#n194)
>> I attempted to remove the "unset LDFLAGS" in rust recipe and exported
>> TARGET_CC_ARCH as above, but that didn't work.
>>
>> Is there some different or recommended way to pass LDFLAGS to rust that
>> I might be missing?
> 
> The issue isn't about how to pass LDFLAGS. The issue is that something
> triggers building all these additional things, including rust-lld, and
> you need to narrow down how and where that happens, and how to go back
> to the install set (and build times) we've had in 1.85. Please get to
> the particular point where that decision happens.
> 
> We can't just double the build times without a comprehensive,
> convincing investigation.
> 

Try adding

[rust]
lld = false

to config.toml, but lld might speed up rust packages themselves. So 
perhaps this should be capped under a packageconfig or such, provided 
this works.

> Alex
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217316): https://lists.openembedded.org/g/openembedded-core/message/217316
> Mute This Topic: https://lists.openembedded.org/mt/113268009/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


