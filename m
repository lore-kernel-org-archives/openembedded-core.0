Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6060C31D97
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 08:14:44 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.45584.1719994479794429616
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 01:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RHNw8r8h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42565cdf99cso45015035e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 01:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719994478; x=1720599278; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o68gsO83YnX9I1ApOUimTaaUDMTmefVp3T+WUQQzJB4=;
        b=RHNw8r8hlldjsb2rhzvVT5PJxko5iBHTMic3Hu63jGUnApmQW7OFZnr4u4igNEecJ7
         4uzJGvg1/Fi6QZQkdfSvY51X24mbF53xvAEAhkFGRR0YCAMkOz67GSwx8pcXwXjz9cQX
         pBvsNj655enNP6B1KAemWNx4v8MR9sVJCdths=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719994478; x=1720599278;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o68gsO83YnX9I1ApOUimTaaUDMTmefVp3T+WUQQzJB4=;
        b=XgQKjzR6FJX81zHqbFSCCmzkMvDimDDD13i2/3I8skjJtU+YgDfRzqL1z1T3UNDc2c
         uHq+UQ961Vck33XJNGWKkKEHKv3og6I/pK0MFz6K4gKA1Xh6s1blM6Ms6WnG9vrFuc33
         PATVlFKWYyDBGyGEkqd6IUm5lC/Xtfuaa9GFf4pm3T1dBOexw00F/uUQdAZS41ejUoEW
         a9i9qIL0CRgflRCcSwncVGEUO9yFTQUz2Xlqa/MhRV3XPNeDOT2LCx0RCd8QT4mf/DrT
         1eH8p5s0uyIdZjqn1BrC86Du+aqe1XAzE5weCURsIudcl4v2Oem7yBDjtwV2gTMQGW1h
         lX+g==
X-Forwarded-Encrypted: i=1; AJvYcCVq9Wc8vnex0NWV4L2uxzE8ASNymuWyweYQjNSFA/0i3mgje/pl4FlKm90DFaMvB/Pz1dB9JbI/aAvQ6tB58soCAaz7ur+zsU5wllXheThXqE23UKaloCkL
X-Gm-Message-State: AOJu0Yxg4lIqZ172fqbuMnClfNBRF5rFj1amg6ncwhLgJvpJRp/Qq0JC
	ipAmMR4IMMcZaQIPLGqq3xzYUGm4n4qHBmzcHIOOalQEuWhq4o/OZlEeFtjAxH8=
X-Google-Smtp-Source: AGHT+IHF9gcUEQ2XksfOM6JvjTL+7jwMmKW/753zQWH4Z3OhMc1Fpfd6ddnxb8vS8tXhtzJDZT4thA==
X-Received: by 2002:adf:a298:0:b0:367:8811:cab7 with SMTP id ffacd0b85a97d-3678811cc46mr3211864f8f.41.1719994477911;
        Wed, 03 Jul 2024 01:14:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d2d5:cacb:a2f6:fe0b? ([2001:8b0:aba:5f3c:d2d5:cacb:a2f6:fe0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af55c0asm227051645e9.15.2024.07.03.01.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 01:14:37 -0700 (PDT)
Message-ID: <e196c7761406a0fd8a7fcd38fa198cc60dca271e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 9/9] rust: Upgrade 1.77.2->1.78.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 03 Jul 2024 09:14:36 +0100
In-Reply-To: <13008.1719941840698289649@lists.openembedded.org>
References: <089531C6-530F-49CA-B977-1663251F7A94@arm.com>
	 <13008.1719941840698289649@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 08:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201459

On Tue, 2024-07-02 at 10:37 -0700, Sundeep KOKKONDA via
lists.openembedded.org wrote:
> On Tue, Jul 2, 2024 at 08:38 PM, Ross Burton wrote:
> > My builder is running oe-selftest -r rust on the incremental
> > upgrades to see what of those fail, but I=E2=80=99m not running
> > reproducible builds yet.
> >=20
> > 1.76 was successful, 1.77 is building.
> Can you check for reproducible tests also? That helps to see where
> the issue is triggered.
>=20

I ran the tests with 1.77.2 and this looked much better, there was only
one failure:

https://valkyrie.yoctoproject.org/#/builders/49/builds/55/steps/12/logs/std=
io

So it looks like most of the issues are 1.78 related apart from the one
above.=20

Cheers,

Richard

