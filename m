Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.446.1592604860486750182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 15:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O2h+xy6Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id r9so9773132wmh.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 15:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Qyxr/uBeNmU5yJr8D4UUyiWrkaM1Y9pABHQqzc108Go=;
        b=O2h+xy6YFuegASdDnaFveuQU2QAzOBy22YEDrHNmQ76nIKZLJ1hS3GyvrSVuRNerPb
         jc36KnRK0Xq17VeHDn8z1lVjvkKdEO1TPcZlrlyfss1rpVLHto0P2SzF2ahrbQCYbLrH
         0Xd0nb1+I5WqZln6tGZrxV/Lc2zhu8lqtpRg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Qyxr/uBeNmU5yJr8D4UUyiWrkaM1Y9pABHQqzc108Go=;
        b=kkxrzEbsinc3mYzY5ZqdpcqbKdz5DOI4zyfTdrnxR1Dx88rzjOpn9Huagxd7w7DKPz
         0NqUuMEZPcufwnsdD3DQf4xrwaqNfMhlp8mOe0wRHNQ9g74iY1Pp/RRZ0LcDo4rgiLeu
         M8o217mQmJZylaudKdD7GRYezMRgeRldjY9MAo9G9bcVclof+CHoSna/0YbDMQEQyiQ2
         +meQzy0iRwwC6Xy7+O9QIljO59Y6u2NQJTciwqL1C1IBmUqtjHQwxxvGY35ynQAXX7rT
         6APJ/AXYrMgqjsSeEI/6UsX6mt/p0A6NFeRWxixFueshh5hvdKOPTtdatcC7pcVQw+PI
         0uLg==
X-Gm-Message-State: AOAM532I5Mc7Bu+rT6QfUQ/Q1dBEnNuD/dJt+PJqfM5iALxr1ldrQXfK
	KU/rhkjWQPll8AL10EcQAL7w8Q==
X-Google-Smtp-Source: ABdhPJx/rgLxJOohPFXfWDmZeCZGUnTn5pJkIfWssJUQhAkKqdsmU8i5Nt+2LD3XW0Uvn68KFLh6cg==
X-Received: by 2002:a7b:cb4c:: with SMTP id v12mr5672368wmj.43.1592604858889;
        Fri, 19 Jun 2020 15:14:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j14sm8644138wrs.75.2020.06.19.15.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 15:14:18 -0700 (PDT)
Message-ID: <386362e4937341d265b2e10d87dc472eb2e4f7fa.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3] igt-gpu-tools: add new package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Arthur She <arthur.she@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Jun 2020 23:14:17 +0100
In-Reply-To: <20200619180922.57663-1-arthur.she@linaro.org>
References: <20200619180922.57663-1-arthur.she@linaro.org>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-19 at 11:09 -0700, Arthur She wrote:
> igt-gpu-tools is a collection of tools for development and testing of
> the DRM
> drivers. (https://gitlab.freedesktop.org/drm/igt-gpu-tools)
> This recipe is originally copied from meta-intel and added the
> following
> modifications
> 1. Enable ARM architecture
> 2. Enable igt-runner and Chamelium
> 3. Build git HEAD code instead of a specific version
> The original recipe in the meta-intel will be removed and replaced by
> this one to avoid having a duplicate recipe.
> It is applicable to be submitted to oe-core, because it provides
> a core validation functionality that is needed by all providing DRM
> drivers and not just to a single arch.
> 
> Signed-off-by: Arthur She <arthur.she@linaro.org>

Looks like it has a number of dependencies not in OE-Core?

WARNING: Nothing PROVIDES 'xmlrpc-c' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb DEPENDS on or otherwise requires it)
WARNING: Nothing PROVIDES 'gsl' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb DEPENDS on or otherwise requires it)

Cheers,

Richard

