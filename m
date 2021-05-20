Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.323.1621534236121906159
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 11:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QwOLMSVm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id d11so18566310wrw.8
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 11:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=UiVBBDUktiXfb3Xk2YMuohXe3w5ovUbXV1mDmfJ0q90=;
        b=QwOLMSVm7AluFfCENeMtVh2h8gVkHedCdmdj2uYM4AtzeBuBeqyOhQVGbKtEPYB1e6
         Q+m2BMyiZbKa5Nk13UxDvPQ2Yl/bKPBw21EzdWKbApSt5mP8StE3pJDg6eZOIJXo0MrK
         7Ylx/ELYRojJ0wZGIMpVSULWqu8LqzPIWJBhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UiVBBDUktiXfb3Xk2YMuohXe3w5ovUbXV1mDmfJ0q90=;
        b=Q0okhbhIqn2dgq4Kuhu1xrwHCXw+fmlD2he7Z4TqBQo4e/6mDD42qppBMdKogJLKLF
         zm/D9X5jk1CM3e1jYHY3l4kr2uwOwglmR6hzxZUGwmH+tjPASqElr65OSQj+IQBNriV7
         LTN2dW+ruIO/iCJ6ghmeL+8PuR0wPdtnQk2i8Kh+40NU0rVikjhnPfqJYX4g4mxSqH7H
         8gTkW6jF8tKqi5Z94zNCihpzLTJ5k14ao9nu7gyaXKKamlRgjRRFfTJjjm77bVFu3yZi
         8nb58JPGN7vzEQaW+fA8MvrEBOf1pnjZglxYsovgjFZkKd07zOT5WB0v7CXGWJqoQbqh
         IW3g==
X-Gm-Message-State: AOAM5327EDM/LXY+x3Mt/+9/nHFkewwo0CGb/VKS4OWBBGEFM+qdQTZN
	vhcVwoKiG6AUGmT7JYv1mWJd8w==
X-Google-Smtp-Source: ABdhPJyFlR2u0lhiq+eNhfou6y5K8PemD/hRdxPMC7LaRmVTHvqOy/oxrV761eI7bwtEiXyORfuteQ==
X-Received: by 2002:adf:e506:: with SMTP id j6mr5492377wrm.374.1621534234522;
        Thu, 20 May 2021 11:10:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:56da:83e7:85fe:8f81? ([2001:8b0:aba:5f3c:56da:83e7:85fe:8f81])
        by smtp.gmail.com with ESMTPSA id 61sm4580605wrm.52.2021.05.20.11.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 11:10:34 -0700 (PDT)
Message-ID: <b6237bf807c4c9823f6dd92393dac50e3dd8dcab.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] elfutils: upgrade 0.183 -> 0.184
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Cc: Jon Mason <Jon.Mason@arm.com>
Date: Thu, 20 May 2021 19:10:33 +0100
In-Reply-To: <1621500436-22668-1-git-send-email-wangmy@fujitsu.com>
References: <1621500436-22668-1-git-send-email-wangmy@fujitsu.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-05-20 at 16:47 +0800, wangmy wrote:
> 0001-add-support-for-ipkg-to-debuginfod.cxx.patch
> removed since it is included in 0.184.
> 
> refresh 0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> and 0015-config-eu.am-do-not-use-Werror.patch
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{elfutils_0.183.bb => elfutils_0.184.bb}  |  3 +-
>  ...d-support-for-ipkg-to-debuginfod.cxx.patch | 33 -----------
>  ...infod-client.c-correct-string-format.patch | 56 +++++++++----------
>  .../0015-config-eu.am-do-not-use-Werror.patch | 19 ++++---
>  4 files changed, 37 insertions(+), 74 deletions(-)
>  rename meta/recipes-devtools/elfutils/{elfutils_0.183.bb => elfutils_0.184.bb} (97%)
>  delete mode 100644 meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch

Fails on the autobuilder in testing in ptest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1815/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2104/steps/12/logs/stdio

Cheers,

Richard

