Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.454.1585090662424532217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="key unavailable" header.i=@linuxfoundation.org header.s=google header.b=XiYT9C4F;
 spf=temperror, err=temporary DNS error (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id 65so728456wrl.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 15:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0CnjRdZCI24l/B43uptTBakhjWquM8NxBbzbLd5AN4w=;
        b=XiYT9C4FuD+npEo7mgHf61WhLQxPaNV/irjG80kJA5caMX5pMuXP43bgrTNlqJSnJ1
         U96vcbFxt+lng6flhBir4MmL0HvqDBUwo3x+3EJiMIg1yintHZ4SSuyGp0dLc8D9X1d7
         Q8RTdyZpPF3XXdaHffklbjpYJkXvYDZCHIEZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0CnjRdZCI24l/B43uptTBakhjWquM8NxBbzbLd5AN4w=;
        b=Lmuungj0xPsJpSp03In6AZu4F1aRLwW4hTvmBliXZZHuPjfGm3zEQwBMD6h3hsUK+q
         DlUUJ9GHHPSAML86YWSKMgwfQz66ZnMVCmX4EoH7USXWXBSivj3LLdkfnVupItTtG4AB
         DaM1GfROChz4uwm4CnHKCrZRFQeWTUlGzAkMkDpN8/L0xNb2s93sKF047lAAfasgGucL
         AhPZ8ta0P2vDY3ZUPnbhE3dwyMlCebHol6lZYdnpvH65gNFYGHg4zR4Q4pBbPgbLfdXU
         Hhm13A3k42TrTrChMj9+8/Dt8j6isbEe+0hXKpdww/TA9NNWEGp6VtQI/rkTQlb4YaQi
         TmRg==
X-Gm-Message-State: ANhLgQ2ID74Jq3G59n3zy8M3Nien8hKC0WUxT5Tn9Y3hvdD3OJS9VYBO
	kFpEtkvJ9eAGOFKOrpSEj0UBwQ==
X-Google-Smtp-Source: ADFU+vvrL1m9a0KgZDkjoXev2S/EGXf29yTrrsmoHzxzcU0AjZ13cIuwlKdBFfDFaneii8gGYW5yew==
X-Received: by 2002:adf:b307:: with SMTP id j7mr47737wrd.128.1585090660951;
        Tue, 24 Mar 2020 15:57:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a1sm31055134wro.72.2020.03.24.15.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:57:40 -0700 (PDT)
Message-ID: <1745659de941c18de2c96c16b3f8c3fc5b457c7d.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] security_flags.inc: fix flags missing from SDK toolchain
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Antoine Manache <a.manache@gmail.com>, Tom Hochstein
 <tom.hochstein@nxp.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Mar 2020 22:57:39 +0000
In-Reply-To: <CAMu9SpKSFfexqz2sqsr6ZyPtdeSCu1XfLYSSznX1FtpG5=TK7g@mail.gmail.com>
References: <20200324170259.3206-1-tom.hochstein@nxp.com>
	 <CAMu9SpJmwRw9gmCJS4NkdhMuyNdVij_-C4AsyeLs+zb6+pV2fA@mail.gmail.com>
	 <5e1f58719f8835201ddcd82bb19af555f5c2dcc2.camel@linuxfoundation.org>
	 <VE1PR04MB6621F3264C205F46AACCA6AFE2F10@VE1PR04MB6621.eurprd04.prod.outlook.com>
	 <CAMu9SpKSFfexqz2sqsr6ZyPtdeSCu1XfLYSSznX1FtpG5=TK7g@mail.gmail.com>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-24 at 20:06 +0100, Antoine Manache wrote:
> Absolutely.
> I would add an example of issue I've seen in a software project.
> Someone developing a new application and using the image-based SDK
> that I provided got the right functional behaviour on target.
> Once this application was integrated into the core image of our Yocto
> project (new recipe), the same tests on target failed (application
> crash).
> The root cause was : the two binaries produced were different because
> the effective GCC options at compile time were different between both
> methods (security flags not enabled when compiling with the SDK).
> Antoine

Thanks. Antonine's emails/patches are coming through as html and hence
are mangled and I can't apply them which is probably where things got
lost previously.

I've therefore taken Tom's version with some tweaks to the commit
message.

Cheers,

Richard

