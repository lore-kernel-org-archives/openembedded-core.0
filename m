Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D271C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:03:27 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.6814.1747818198563672452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 02:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YzljEe0a;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so1266215566b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 02:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747818197; x=1748422997; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VQy8bf7mfkUbrxrItf9v8Sp72Q/IBd3vpl3kGVYoDys=;
        b=YzljEe0aWs3VLEV4tQlbUmWaorFyX1Ed6S/mlanIJPmyEzpWS5ugzUBhzOID5V7LjO
         iuPvl7L0qBjR64tsUfVBBHM/CAv6WitLPC9zwpiaSsc6l9U5ofKKNmUx1VohMEaQqxqQ
         pfKKU9R4H2gvyG1w4e4wgHFDP0rWfoK5emlB3xkzh8IRuuyLXy3QN/PG98rbZgSVGF9P
         SyRD7H2H2orcbCB8/3NZvhtY+3lAlriqMjdVIwOkJLDXl8lk8mM3lalfukM5Q27xD8dU
         96Y4v404g4Tq8xmbJegIxzsAiEFxCheQUZWmmWC1dau2Rz9FiEL7oDZ5zeeq3n81tbhs
         192A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747818197; x=1748422997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQy8bf7mfkUbrxrItf9v8Sp72Q/IBd3vpl3kGVYoDys=;
        b=K6xuKwbKquQ3XuVVCAhwcNl5Av4j58IK0fr4pPOq6WUwNkTQ87H3n66z6OBJRlGiHO
         N+yHQVp+Wd7ll9YBTsIREFoiVe9us3zPrPiCDFEdqH1VXRCy6QO8fCkmF52yoc/LFcYJ
         cHDb1U/QAW76gBBFBn0EjPaZwvrKRGUrssq/W/1BSdDljzVfCbJ0T4t0njLJa/5llxmN
         0clXMwMb0hhpA17XN7piD9PeeYPRbMEy4h1z2ZdkVo9m0/fouGFWMPVjdJu81Me0lYP+
         xTF9QUtpBJRPrX25Snj7Ic+mN09gnVbTKsGRc5BUSIgDMIthvrbkRDMa2a185tpZXUDU
         BiYw==
X-Forwarded-Encrypted: i=1; AJvYcCVEU36/3KOE+1qq+W1En2zxDYZ1BigYYAi6+Tqbu7/B9QCUCvBr6JeXT3Ak3mPxti7omKYRw6Ji4c+h0hqat8vgUQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyvehTiLnPDasBfthm9bHSVMcWpC3pO2S/HqbWGIpky1r8hJ1ZS
	WO47/hmDlzPlUKQt5Y4HXu8rgA3DM90nY+HIhK33Kf66eTdHHsvAKTYE9Ckojw==
X-Gm-Gg: ASbGncujnc42OM50zGTR9MY36uokrleeYW0EM67aU6LsxhyVf7Uk2QE7FfzveFODaAZ
	ttT3PU8+29pM/I0VEovHk5JT2OAYaA4BQUphYMLlESXwH2Dt2CLkEP234wlxskR1kQeUqwe85t5
	a8FFMkyTlk4U+QsiLox66Aqnlzv8+kdTLt8KaBbrR1ob4v/L6kqIHu8zpG39+PeaS+BeZ5BD/hF
	JSQghMfgupK9M1Fr1Et7KJjJttfCBG1q8qh935z1aL81kgRZ00wupX9WyGgCI3YDkBBmxX3EREw
	9jkyWFtc7ynmfxpH/cNPLYGKur70Y932tBBwo1u8+yZVcpDovkc9mTANuDiU5qn71vXVlw3KFUm
	BzChvokV0
X-Google-Smtp-Source: AGHT+IGJm9dOZS+3G3z9Af1tT9MCH987bX0wtWbby1sZqrAjF6Y2E0qNEl7Is7/t7cScE3unMZzGhw==
X-Received: by 2002:a17:906:5ad8:b0:ad5:3ce3:72f7 with SMTP id a640c23a62f3a-ad53ce4e34bmr1434797666b.7.1747818196657;
        Wed, 21 May 2025 02:03:16 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4e8afdsm872247566b.176.2025.05.21.02.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 02:03:16 -0700 (PDT)
Message-ID: <ea04af94-be68-4ede-8348-1ab60551b00a@gmail.com>
Date: Wed, 21 May 2025 11:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/5] mesa: don't build empty libgles3-mesa in
 GLVND case
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20250520174529.1173460-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20250520174529.1173460-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217008

2025. 05. 20. 19:45 keltezéssel, Dmitry Baryshkov via lists.openembedded.org írta:
> If GLVND is enabled, there is no libgles2-mesa package to depend on
> libgles3-mesa. Stop building unused empty package in this case.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   meta/recipes-graphics/mesa/mesa.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 288027bbb996..89ae71595991 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -247,7 +247,7 @@ RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
>   # GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
>   # Add a dependency so the GLES3 dev package is associated with its implementation.
>   RDEPENDS:libgles2-mesa += "libgles3-mesa"
> -ALLOW_EMPTY:libgles3-mesa = "1"
> +ALLOW_EMPTY:libgles3-mesa = "${@bb.utils.contains('PACKAGECONFIG', 'glvnd', '', '1', d)}"

Why not merge the two packages instead?
The GLES implementation in Mesa includes both 2.x and 3.x,
regardless of being standalone lib or ICD.


