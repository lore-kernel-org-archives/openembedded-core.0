Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BABCC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 13:41:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.20151.1646055704091187538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 05:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=USq/3lkn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so6042183wmp.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 05:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=MAt5vRg/pwIIS7IkG7HGUXvxd2eMEgu80QOJQv7225o=;
        b=USq/3lkn0I8F6TgUN/j/c/T3rChqB8X5sY27FfZDbhKk8wfNM5qMupn6mgKLvsOgUV
         auR9md6EdQgX2ZynUS9ymtY5yEN5pjmOeG9saYCToU478SXUebZ8b4ytdkvdFneLcYIn
         WOQm6NgaeI7a8QkVSS0rLswXVKzqcOs01nwt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MAt5vRg/pwIIS7IkG7HGUXvxd2eMEgu80QOJQv7225o=;
        b=YJt51rLgS7cq9+7twF71EzwH8TtwB/PfOYBXr/iPWl9V+TOtuORkmHB2/dVykTWyON
         opm7rp0CCW3L53NSc1DfRvkGU4dHqlVvelxFCVOLv9bPEeV9Y+E3GIIukBziMAvmzTqc
         IJ8A8OBTq/0yKFOyYJBmhuuupFa3plIMYweZdZQ4OQ9T6JzdHhbZBEG3ZytaU63Vlorb
         Pc/kzEp181xKfee8V5qvBYNwaCAyn0i/UJtiqjU3DTKTcjGA4ufWYC3DdgTuo9HHgWcp
         ziH3qhhzQYU9oCNq31dyUBOHoUXDP1rkOk0s9nwEQCRYSEfMb6nrbJwO8qVZq2E+mTU1
         uv0A==
X-Gm-Message-State: AOAM531/ekA/4v9ytpqWkN7oEfQgZ6V5DlSDzQsqeYl2lJDQ1Iwv++Xo
	O7TCRs/BBavLN+aj1SkKmmxSYw==
X-Google-Smtp-Source: 
 ABdhPJyaazDnHEv1Xz92XxNbPDN+VlBLHAVHOqCKlETrta430+UihkZlr51IcaQ2rwwOgn5xHgML8w==
X-Received: by 2002:a05:600c:2185:b0:381:4c16:2f2e with SMTP id
 e5-20020a05600c218500b003814c162f2emr8023296wme.74.1646055702515;
        Mon, 28 Feb 2022 05:41:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7be6:4a6f:2d8e:ec86?
 ([2001:8b0:aba:5f3c:7be6:4a6f:2d8e:ec86])
        by smtp.gmail.com with ESMTPSA id
 n5-20020adffe05000000b001edf8fc0cc3sm10514123wrr.41.2022.02.28.05.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 05:41:41 -0800 (PST)
Message-ID: 
 <eee2ca92c2a0078b9f767737e20445927f7f2f5d.camel@linuxfoundation.org>
Subject: Re: [PATCH] bitbake.conf: add BB_NUMBER_THREADS to
 BB_HASHEXCLUDE_COMMON
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Feb 2022 13:41:39 +0000
In-Reply-To: <20220228084250.3874136-1-rasmus.villemoes@prevas.dk>
References: <20220228084250.3874136-1-rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 13:41:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162454

On Mon, 2022-02-28 at 09:42 +0100, Rasmus Villemoes wrote:
> The imx-gpu-sdk recipe in the meta-imx layer references
> ${BB_NUMBER_THREADS} in its do_compile function. Changing
> BB_NUMBER_THREADS between bitbake invocations leads to the well-known
> 
>   When reparsing ...meta-imx/meta-sdk/recipes-graphics/imx-gpu-sdk/imx-gpu-sdk_5.8.0.bb:do_compile, the basehash value changed from 69be88cf220840ff2203e11cfe65681880b0bf9b88db67d50c1ba772b883bd18 to 5e6d5029fac8d7856ada4c2eca359568298f82cdb64567d7dd4deda503d9f83a. The metadata is not deterministic and this needs to be fixed.
> 
> And I'm not the first to hit this problem with that recipe:
> https://community.nxp.com/t5/i-MX-Processors/imx-gpu-sdk-compile-error-IMX8MP-IMX8MM-IMX8MQ/td-p/1217864
> 
> This happens because BB_NUMBER_THREADS is in BB_HASHCONFIG_IGNORE_VARS,
> so changing it does not cause the recipe to be reparsed, but it is not
> included in BB_HASHEXCLUDE_COMMON and thus
> BB_BASEHASH_IGNORE_VARS. This is inconsistent with and in contrast to
> both PARALLEL_MAKE and OMP_NUM_THREADS, the latter of which even has
> ${BB_NUMBER_THREADS} as default value.

Technically imx-gpu-sdk is incorrect. BB_NUMBER_THREADS is the number of tasks
bitbake should run. PARALLEL_MAKE is what is used for parallelism in do_compile.

I appreciate that has -j in but you can use: ${@oe.utils.parallel_make(d)} to
obtain the value that recipe needs.

Cheers,

Richard


