Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E71C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 09:44:17 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.9158.1644313455933307868
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 01:44:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BuR3FWty;
 spf=pass (domain: gmail.com, ip: 209.85.166.179,
 mailfrom: uvv.mail@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id o10so13475370ilh.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 01:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=d8rXaLwRNEfdVwtz3v1vOTPS1fPXYhciV47Q3xPg32g=;
        b=BuR3FWtyfaR1H9DsNnUB3IIOzjtaE1D3yVCugDNdv3OVEpqyLlcCnpVfziq9q4Y0jh
         ZELN0+DyiWGhGlIFEBjPbQfhU3ICzgFrSc9Xa+7iFohrq8PEJWad1gH/W5LmmQAwNwzj
         TE9aTMbvwzitadiBKEHlI+TV42sKO92DauVEED4YHLLYs7pvA56QHfbmGvG9PP1KShaD
         ehugFYkr6st431EnuxrNwgsrqNEjbt4aL2GWNE45Gh0TRbrCagoy+ZkrwC92Ja/lBiCg
         nB+gFMi9n7MudCShruknQo9z1W0PApjWO3KLfdAT4m9tKoQwIOIcKhw20k9MroDclHYk
         NJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d8rXaLwRNEfdVwtz3v1vOTPS1fPXYhciV47Q3xPg32g=;
        b=zrsxwj9bTQtxYExfnWKK7tA6GyM4UAjvO7QAy4K8896/gIbp2kYhhhiTEj5QCfnjWZ
         LjVBFoQ9MlE4QO+XhVcA5AwfewNIZvL8GL7UGbgQjKZLZr2KOF7it1OtIu54rfHPXEDf
         KnBZDBGX5PdElfmJsqAKcmptAQVbmMLESZxdD8UsTxn3CLK10F8T7dbo0ka/Hlifllbt
         YmK5hwDzk3dOEHQjjaXjZVAMDALAOGqJovczF5D9EDA62KIssrfyxyuZaok+ex229ekp
         R2rHdchr7eLNjRLzBXAffnFkzJrs2tag3LUFyxctHijB24gMlUsxN5n9XDDIotoXmaaP
         u1fA==
X-Gm-Message-State: AOAM532QvBeH+Vogi4gvGoyJT1xxgVmdBLmidCEqStB2J9C5FLMCOsMv
	vFbe9Hcggr2WgkzMEih5cXM=
X-Google-Smtp-Source: 
 ABdhPJyBz9BldAYUw3UL0fn9fEVXwIA+uhtN/zCNxr2w0KFSGYjIyqoQanryCWhdsawbChR9uZtAzA==
X-Received: by 2002:a92:a001:: with SMTP id e1mr1800036ili.108.1644313455247;
        Tue, 08 Feb 2022 01:44:15 -0800 (PST)
Received: from [10.128.91.32] ([72.10.162.6])
        by smtp.gmail.com with ESMTPSA id
 j14sm7004338ilc.62.2022.02.08.01.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 01:44:14 -0800 (PST)
Message-ID: <6a7d2321-7d84-a052-2657-924d0779b738@gmail.com>
Date: Tue, 8 Feb 2022 10:44:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [OE-core] [RFC] support for multi project toolchain-cmake
Content-Language: en-US
To: Tobias Neumann <yoctoproject@neumann-web.eu>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <1540523266.294149.1643372553712@office.mailbox.org>
 <0c0df739719f528922ef60b1f6e553e3a1d114cf.camel@linuxfoundation.org>
 <1170434594.46461.1644247802042@office.mailbox.org>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <1170434594.46461.1644247802042@office.mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 09:44:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161487

On 07.02.2022 16:30, Tobias Neumann wrote:
>
> Because a SDK is specific for a hardware platform, but not for a project using
> that hardware platform, it is readonly and can be used for all projects with
> this hardware. This however requires that the compiled libraries generated with
> this SDK during the user side build process will be installed at a different
> location, which would be the second sysroot.
>
> Until now we only build a cmake project with external dependencies to the
> installed SDK using this workflow. Further external libraries, not contained in
> the SDK, had to be integrated in this cmake build, either as subdirectory or
> via external builds (using e.g. cmake-superbuilds). We now want to extend this
> workflow by supporting multiple cmake projects with dependencies to each other,
> thus the need for this second sysroot in the build.
>
> best regards
> Tobias

Hi Tobias,
Any reason you set SDK to be read-only? Perhaps your use case can be 
covered by extensible SDK? I mean if you have some shared libraries 
between project, isn't that enough to extend your SDK to solve the 
original problem?

Cheers,
Vyacheslav

