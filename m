Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44848.1793199320829238536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 07:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=Z2vlNu2Q;
 spf=pass (domain: 9elements.com, ip: 209.85.218.47, mailfrom: tan.siewert@9elements.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c37b612635bso142684066b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 07:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1793199319; x=1793804119; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zAtGKRB37bTWowEMyP3HfTYiDXfzHB/9yit058DPPFY=;
        b=Z2vlNu2QMdIzb8Zz0LXO73V2Po06Igdn6thsMVb86ZQibzuSTndmwPqPtpAuE3QqT5
         1ty8sL+4gF1A+q7ntD7dSgYrmqrB51fGSun4Q1S9rzZ4y8vy2eBPXfsmq6I2iUshlTt2
         uv6P9Iq7G1HxYdJ95cNyp2MJYWnCa86DHe1dDFfiEDH2IJIvxWJ/hGr+Z+5/WcK8t2cv
         c6XupTdCWc/ISs+Zx7YtKN9numlfNHlc249e2vbgJJV8PXUMGu5VCsODeWoYREguOjnP
         vjwYm1GZwWfquTo8jb8nBcVqcdu37AKEVx8cnAlRVVtEdf67qRQmwZQX1CBrl9JSe4lZ
         Lv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199319; x=1793804119;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAtGKRB37bTWowEMyP3HfTYiDXfzHB/9yit058DPPFY=;
        b=iP9J2oe7s8YhHVVkNmB2E3HS6yApg6w71f3DGVNxjii9FlCPrJ+4HzIAvLgxZYLKr8
         4Q9wPrCHLUoWEboXIL12V2fncnryFqfxNSfw2QJF5DyFkbjUIQvQgKzd+PJ7+phqC1FM
         B8SUr1AyGFaToR0Ulm5MZhgQtA24DtmFimA79ukWjjk3vEdNuKsVA3/w0wdMybQEYKgK
         uq/LljUgnzcjtbhumm9ZNQKl4kTNs/LLVzYT4a3RHbDPv2kGI2iIkIAimgrUY3Ylc3YS
         PjJ1jnK73yl0JgwJolIXiFQcKpA7chKz4ppwVcFKmMxdJ7K2oe2fGlHXN0jVd3p2+SQV
         uMbw==
X-Forwarded-Encrypted: i=1; AKwUvBwEJefqXCtTyOdq+JFpy/Y4jEpY4HquAVsmfI5yD8me9IpjR/U/6/r5L81bLLWuXboeQ0ePuoA9adREKlo9lEqVcQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYI9Ify8OcwwupcYIDnTOmKPTm1ZAAGE7Aub6z1RYdtw8fuRnICM
	iwR3DRIxm7Jb0pQXu8MGwusnu3nPEQORe0zHq1kl2u7fkCcwe2K0Y+NwcntGCPSRFV0Ub1aKkQS
	rx+/A
X-Gm-Gg: AYBFou1FcTmDUBK8p46D3acqqK8Aa8s9yeIdwQRgpivVeHJ4U63rbBfpeVFoqsfREeh
	43WzZxLHdMPKzmZ0Ax2QoCqD95HwG30v8HBFbdl+FJRiAfnznHE1hmDq8BcOPx/T93gUg7H9w+a
	KuzSbl+qt9hV2jcYPrYr7gcV8NXGecZcZcxzXRJTeqF5b9AF4whI1lx+8jTvDe270IYLXZN9/OA
	GQ7mrDMJvlhhpkC3JCIM3tVToK4EEgiKwHZIXJbICSh6Zk6tfRcpwT/YdV+bdpNnFveb1ajuzOX
	cTsZGuVkQO7ax2J4Z/rjvCyX/3v6w1uy8kxbCLShx60zEW4PDqtp/bP17lCyH3SP52ezLgYfaDz
	A9Y0WXOIckm/uXsaleicNnL0JjubkVjZTxn7tNd4trX/qmVqYxjeLM8AUB/YBlv/1Ut1bggl0NS
	jG2OEONZ+uBS7Uw4/4PKzZ2rUpjHN8b8Q7Pd1v7yklcXuPbgc8gNHPlnP2m9KXZhut4a+2TVOwH
	11wmR+yIAIyheGEi47vS+/VZWKHOGusHtQmzeiCpkaK5f+6OUOZwjvaRbfRQNmRWAhwrqzRFdG+
	C/cc3GMp5HMgKsTCSS+kJrw9X8atf9kay4rZROCyYAnzYmR05YTQNn+TAamJ/QRsjER2UiP5GSu
	51T4XJOCIjYmbw7+mijaio4Al
X-Received: by 2002:a05:600c:19c8:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4a967201e9dmr57983465e9.27.1793199009372;
        Wed, 28 Oct 2026 07:50:09 -0700 (PDT)
Return-Path: <tan.siewert@9elements.com>
Received: from ?IPV6:2a01:599:441:aa83:be8d:8cc8:902:f501? ([2a01:599:441:aa83:be8d:8cc8:902:f501])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a977edc08fsm48284485e9.4.2026.10.28.07.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:50:08 -0700 (PDT)
Message-ID: <7edd2f20-a4a9-473c-aec7-4377f2e9a0bc@9elements.com>
Date: Wed, 28 Oct 2026 15:50:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] systemd: add packageconfigs for storage optimisation
To: "Tirumala Pudi, Sai Sireesha" <SaiSireesha.T@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Patrick Williams <patrick@stwcx.xyz>
References: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
 <SA7PR11MB9594AC924FFC3242C77F7B8DE8642@SA7PR11MB9594.namprd11.prod.outlook.com>
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <SA7PR11MB9594AC924FFC3242C77F7B8DE8642@SA7PR11MB9594.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248816

On 10/23/26 10:00 PM, Tirumala Pudi, Sai Sireesha wrote:
> Hi Tan,
> 
> Thanks for sharing the patch series.
> 
> Just wanted to mention that I've submitted a patch upgrading the systemd-related recipes from 262 to 262.1 to the OE-Core mailing list.
 > > I noticed that your series also modifies systemd_262.bb, so there 
may be some overlap depending on the order in which the patches merge.

Thanks for the notice! Given that I have to send a v2 out either way 
I'll just send you a v2 that sets it as prerequisite (if not merged yet).

Thanks!
Tan
