Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D75C41535
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 10:42:38 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.60025.1702636952122597815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 02:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=goHbwsdl;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so5425595e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 02:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702636949; x=1703241749; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kPJdTrE1CwKW1Hl3s2upGMlgRzUITEkWsp29St02Wjw=;
        b=goHbwsdlyKXUJvcAj0E+NV3vi3F88udCmjpUWafisfHDx+nkg0ypGHE8uSwrjt1B4Q
         dKzEOGYzI1EbBB12wi4uLH0NNK78DpPrYVHoVCPzTMGQo6tfUqqmmAefAvsOAoL2df7b
         lf/p3eSCDt7WwaxC4ys9X0sO2QzrtYAOd6GmoGdczID8vh15i0VdJKKsN7IV0DbuP9fV
         sFo9DbkWaVAs1QE+XBaku7GPaCXWqNTOpiW25UsaZeF5XwdA1Vj4r25OWkHwvRf13ASo
         Mq+ur2lJuo9/3lUR0479nC9OW+Ws8/1r+E7+dcR8ghOHP/cK98UtiGZzYSRfYvY4uIVX
         tTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702636949; x=1703241749;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPJdTrE1CwKW1Hl3s2upGMlgRzUITEkWsp29St02Wjw=;
        b=PtaTonjKv7i4dwBH6IcS6WjXUrN/PZQ93GrdOGhHMZrFviKkgI3kpm65BH3gxpYZrl
         0RfFypAAplQtX261FmT2QzhjC9cvX9hmkZZitHXJSHJ1bf1cGZ8G7gJNzo1ASPqZvQJm
         CJj9NZGXmJCbvsIuAp5GtAmLiVG9vGJgvR2UCjNFGlgU8MFsYNmz31LdlG0r5gB+3qmZ
         k3dJHeE1naN7M+S3iv7T58LMCgCYWzsuzQi+3ldTKh/ehkF0aNkFy2MCClUorWLP3pZl
         PgWEOOylMeIU+y4DgYB7cqNoPQlJfy3JbDpsyq0y7jRm1nDS1w9nANk1YDXz9FUlqc3n
         fs3g==
X-Gm-Message-State: AOJu0Yy9m4nEnkBLWAceR8DO2yWjbsBn6iM0Bn+hUHZAXBLhdLthluAh
	RfHVAsrJnEyMp9RA0eAqHrRHJUDVmj8Fhc16zeI=
X-Google-Smtp-Source: AGHT+IEDhDCd3QKJQeDh9JIrSHdMCO2Qa3CN/v5oX2WFyAd0y5w7FE9RCoHMffpGrULAlcZEZSKLEw==
X-Received: by 2002:a05:600c:2289:b0:40c:709:d924 with SMTP id 9-20020a05600c228900b0040c0709d924mr5510973wmf.147.1702636949625;
        Fri, 15 Dec 2023 02:42:29 -0800 (PST)
Received: from [192.168.0.28] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm30984882wms.30.2023.12.15.02.42.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 02:42:29 -0800 (PST)
Message-ID: <b7dc93a7-c28e-4e2d-a04b-04c196054764@smile.fr>
Date: Fri, 15 Dec 2023 11:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] util-linux: Delete md-raid tests
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20231214193436.224539-1-raj.khem@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20231214193436.224539-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 10:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192424

Hi,

Le 14/12/2023 à 20:34, Khem Raj a écrit :
> These tests are marked as known failures upstream as well [1]
> if we delete them then we can drop dependency on mdadm for ptests which
> can further reduce the dependency chain for ptest enabled minimal images
> 
> [1] https://github.com/util-linux/util-linux/commit/7519c3edab120b14623931d5ddb16fdc6e7cad5d
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/util-linux/util-linux_2.39.2.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Just tested it: this patch also work to remove bluez from the dependency chain of a default core-image-minimal build (https://bugzilla.yoctoproject.org/show_bug.cgi?id=15323)

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

