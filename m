Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1B2C433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:43:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.10611.1637171029902101492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:43:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fx50pAie;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so2762597wmz.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Uks18Lh7Fwym4AWbijplweQUVAhzbU32WTbUw6Irgms=;
        b=fx50pAiewIOvLNKNtdqnOfFWl/267IhX/p/YQdWnz5qaTYWQ6XzWZUVtimM28TT6Z4
         KBJCjd3ybyF4srufapVJYe6KN2qKHqRnEo/RU9Kd5QkYLZkX++oJHrKEcXdaBy15U8qi
         4opeuZHldhmCl6d0B5smHUZal8LFC6IEHRA6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Uks18Lh7Fwym4AWbijplweQUVAhzbU32WTbUw6Irgms=;
        b=0eH8MsIDCciyNkjwSpNwOBsS4GFGYy7ZHPbyA1Hox2WZ9kK3VPasAXECOuohzc2oOP
         cqy1rG0Iu84MYjz+SSE3X2OUj2g5LSMyC6/wZdOiJvnUD/xD1VLfzHE0a84HjNrauGec
         Odq2yKx+AvU3Dt4cdUMC5pl5QQF1TIF9U9ht4RJhyRsZdVPTmpR32TE7fG9QqIoTTJ7i
         tSYNwRVgOc3bP98vlnXdtbX7q4qiezBniyV20KfQgVcVtZIJ0kJMDkkQ/d6ARCDShR5g
         RBt9HQN75OJr8+H3zmpS/U/4WMbRkriRS55haB8IMwYcI2VFn1KNeSKcN+ZA5IgsDdTn
         /wUw==
X-Gm-Message-State: AOAM533QLBE4KNnOxppfnNVFVyI3JnbujBUNF3Yv/el5nTucmeoSuq2f
	MAu0l5G/qD3ck6DbNBsckhtmsw==
X-Google-Smtp-Source: 
 ABdhPJzEtjFuw2XWVfXHXD54G2XAMMkCH1dpB+HHWas9r8GGFA/B93K1EXeka5wiikplCW9Ekv094w==
X-Received: by 2002:a1c:7201:: with SMTP id n1mr1712149wmc.176.1637171028356;
        Wed, 17 Nov 2021 09:43:48 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:41f4:5ebc:325d:efc3?
 ([2001:8b0:aba:5f3c:41f4:5ebc:325d:efc3])
        by smtp.gmail.com with ESMTPSA id c1sm526757wrt.14.2021.11.17.09.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 09:43:48 -0800 (PST)
Message-ID: 
 <0451887421f06e23f56f63a1f0298c6a2aa25c7e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/8] kbd: add nativesdk
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Date: Wed, 17 Nov 2021 17:43:47 +0000
In-Reply-To: <20211117123201.111905-7-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <20211117123201.111905-7-luca.boccassi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 17:43:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158445

On Wed, 2021-11-17 at 12:31 +0000, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Required to build systemd tools

If systemd needs these to build, wouldn't it be depending on kbd-native?

Or are you saying that systemd-tools needs something in here at runtime?

I don't mind extending the recipe if we really need it but that isn't what the
commit message says so at the very least that needs to be clearer.

Cheers,

Richard


