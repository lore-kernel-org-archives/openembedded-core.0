Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.2563.1626984747014443525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 13:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ELvgFpzT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id l6so4052844wmq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 13:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5+6bqgfMwUPGUGBiwP0/FztSj33jwVinqTtjw3QYHlo=;
        b=ELvgFpzTCyiGxsUqZO0jrDpPqBYeQQ1CqqRipJ8e9jjtn2WXvLO82WDdOgYPNwn7KR
         JXuhBytIRV5vqd6fDSfAVD4eCgnyogcpiJon4JR6/7ymWnbZaVdwLTwWBR/DPtoag5B2
         p9i93DohzSpBDL+YgAAN7KhXVpH/AQ7EjCfQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5+6bqgfMwUPGUGBiwP0/FztSj33jwVinqTtjw3QYHlo=;
        b=RtUvsgtViHQqvrsShYR3xF82EzaVp4RREDceJruCaFUZYMZNwsA1DGDAksTH47pOZ6
         cqwURovuIPC/t3z3a7JsmmjZsxekt3paRHChryQAupKZIymNGaxJCGtqdPxSrsbPQuS3
         CldwgOuA48IkpT9fgDMldEeAFOD2Oq8QL0kl2J9lSsT5IQ6RU5qApsEsHznHnXa/A9Zz
         QS5cEc+b2r1l2fm31ZNxAs9lOICcEUSN/ZlqGeNF6zPEnKV5a7j4HMOw39Sbwo6ess/P
         XscKLhYDPjblobvBvHNPjGtdqg6FUtdEsmWYjn7kUkCDf3KiuWuHxc2GPWjFq2MiCkx6
         pAXg==
X-Gm-Message-State: AOAM530I1pXpUnATPA1DpzrKhxgpi2ng9hgokqRvaxNbgQrl+RloCrgV
	PMk13LoGwI2GL6tdJg6zJi5GSQ==
X-Google-Smtp-Source: ABdhPJz4UvdF1efNDY0BosFvgSP/8cILJoY7CwnH+vlLncJD9GMop4zJM0uYP1WLIIH/Yzftoj3uAA==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr1210627wmh.151.1626984745296;
        Thu, 22 Jul 2021 13:12:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8? ([2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8])
        by smtp.gmail.com with ESMTPSA id y11sm3487409wmi.33.2021.07.22.13.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 13:12:24 -0700 (PDT)
Message-ID: <b5db19ce0db64893e7aa0e2d678584244347a4c9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] esdk: locked sig mismatch warnings when build from esdk env
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jul 2021 21:12:23 +0100
In-Reply-To: <CAMKF1sqMvVhVK4j6k5Y7dUp7=jnh6xrwQNPtSDrf6L07FFpLWA@mail.gmail.com>
References: <20210624165421.32088-1-raj.khem@gmail.com>
	 <CAMKF1soqvCNDPaZtAStEyT6W1S_KdQyyfuu_L0inj3re9AQosQ@mail.gmail.com>
	 <CAMKF1sqMvVhVK4j6k5Y7dUp7=jnh6xrwQNPtSDrf6L07FFpLWA@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-07-22 at 12:36 -0700, Khem Raj wrote:
> ping^2, this helps with installing ESDK which has components using
> multiple git repos in SRC_URI
> if there is any issue with this patch, please reply here.

I think it may break when you add repos like meta-selftest which exist 
alongside meta in OE-Core. I haven't had time to prove/disprove that
thought though...

Cheers,

Richard

