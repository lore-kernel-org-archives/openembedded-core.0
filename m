Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E218AC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 12:04:12 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.8705.1634645052280754240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 05:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J2JjQ2O3;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id y15so6900328lfk.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 05:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=zUxX76jjoDN3/TphSzT2Nee1HMr+29JlO2tBU2C9JB8=;
        b=J2JjQ2O3K/jYlK5/H4/eC+K4ZoBdtrZ3wRA4lqleCzFysGnnBuB+pH6DU+v0vjpLnb
         PGy0gOUhbENIBdslqAXHgvqg50iJu60EQU/2A+XR7TGPDLQGlk66VEG/sDS8UTsDFYBb
         wwh/TuOirFXPsz+GTY1wuB0XmG6BQ7dEE4sMiZjMdaCQqFk9wW1A8gQv0m/sJy3LNRTc
         Efzv79HzeZ/+V26PgwTCf8GRxUL+GCUkmkuwo8871qXNH4nFg9rT62+d4JO5pcjSGTAP
         g3l2Q+0J76mLBH5AP0ydzprOWTEe+UXlQVEPMNuV1ZtIK7VdYtxwcZLC4smhlP2aVZva
         rmww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zUxX76jjoDN3/TphSzT2Nee1HMr+29JlO2tBU2C9JB8=;
        b=JOWMLJRVZ09NFiVmMbDp9XpxkwWeerPjdsE/oWfK98f+Evg8ChJOy2t5mWJbvtFLrG
         OhDCg0AvtXT+GEfw/IKufdyvXb93JmmPue8ommaNT4MH84IEC2iff8molPFNEECUqWcd
         zFwSvS28mqsWT0Ngwxet+0ZKtLpFjIdho1yBsgeGxsfw3Fowc01KtALSXtyX6JpIN+Fh
         4R0AmCbK2SkXnNIVgBFvCeymw2qpQcWK9XkURL9DsLwdrz1q7R2ScJJyUdmbz94i+hbZ
         jz7ChfiiwmmHcuKt7950vk6yD9HkBf+AS3z8Cj99tAbsse0dP0lRzrdSiyCYzH5dPv8D
         bSpQ==
X-Gm-Message-State: AOAM532fx34Apayt2x4cmd5rhH7tWprPApffrVaDKBT18gOzdG2+9ONR
	x4GFkNJWStT8sAigK0Uykms=
X-Google-Smtp-Source: 
 ABdhPJzLkiO3fz+Y602mFQTO7ZztNXQbzNmrk7QzFWI5FvlRhBSAv93WcDPkvy3F6sXtHk3vHcmMPg==
X-Received: by 2002:a05:6512:3fa4:: with SMTP id
 x36mr6093081lfa.320.1634645050156;
        Tue, 19 Oct 2021 05:04:10 -0700 (PDT)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 u7sm798359ljd.102.2021.10.19.05.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 05:04:09 -0700 (PDT)
Message-ID: <ffc3f889-17ad-2195-08b9-52322577a832@gmail.com>
Date: Tue, 19 Oct 2021 14:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [OE-core] [PATCH 2/2] gawk: reduce strictness of the time test
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20211019113529.1612190-1-ross.burton@arm.com>
 <20211019113529.1612190-2-ross.burton@arm.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20211019113529.1612190-2-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 12:04:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157112

On 10/19/21 13:35, Ross Burton wrote:
> The time.awk test does a sleep() and verifies that the actual delay is
> close to the requested time. However on a loaded system the range of
> acceptable durations is quite tight and will occasionally fail.
> 
> Solve this by increasing the range of acceptable delays slightly to
> between 50% and 200% of the requested delay.
> 
> [ YOCTO #14371 ]
> 

I would have removed the test. These load-sensitive tests are gonna fail 
occasionally, whatever limit you put there.

Jacob

