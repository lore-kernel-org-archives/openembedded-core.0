Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B774C63684
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.17293.1650104752571180161
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 03:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fur+PJ9N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id g18so13173855wrb.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 03:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=DYtmlqjNdoBPyVdzU2Qro8XloRYNZ7FLflPGSP9OceY=;
        b=fur+PJ9NQUT82EMCr4m0A0zwi1yCSOTMGKdcEv+zso5m6Rkc93NpSOnUJw1yk00ckr
         5J3mkjwxoW+iqB1v3/9z4EHod2RsXztRymLgVh3GyptVhZqaMz9I6jiRrm2Vbp7jEKMv
         W3ntL8s0E2oK+Q9XZqvAMeYrAJuFc4xNwPULk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DYtmlqjNdoBPyVdzU2Qro8XloRYNZ7FLflPGSP9OceY=;
        b=WmoM29VtLXAu6QUgb42/DTHYxUOPFswO/WIh8cOGLFwCuTqH01kBv1Jb6MS6X66mzk
         wy++DRDGSMDCVrrVd6gWF//OTypUIPauOOoZ5ZU4HlMYplah2U0POHjrqDZBUe7RU8zQ
         GC3y1Y69w9I29Zrdqf5AczQVZaOX2p/LUZrfW7TxPylwvr9GRap3KHEc/hE61dkvFXay
         R5yp27/jzGMAnd0TYqyptMzaa65tO1m/V7BuvQfP+d8seaY50lq/Or3i3DYDf7rYrgY5
         z+L8HLkG6N5NcYYRYNJcUSAEn2bVvL9OrYzhcB2fll3OKbeF33c+Wd6XyyN3Q3cYTxEi
         rLGg==
X-Gm-Message-State: AOAM532M3dn/U1BnWVFnuM7rLpFr0MBngN77QqzYlTQMcbxOQ5TxCGVp
	S7CdHoGuf5d2+oMzlIvMu/w5eQ==
X-Google-Smtp-Source: 
 ABdhPJxQW9pPWKC0BA01dh3y4Jlj3TwdHVOYaKOH5MGo6x4iS7RuHrczonKtzveeeyaEW3FajSreQg==
X-Received: by 2002:a05:6000:381:b0:20a:8a52:5c86 with SMTP id
 u1-20020a056000038100b0020a8a525c86mr1066308wrf.554.1650104750750;
        Sat, 16 Apr 2022 03:25:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:78b1:67ef:e54f:6288?
 ([2001:8b0:aba:5f3c:78b1:67ef:e54f:6288])
        by smtp.gmail.com with ESMTPSA id
 n7-20020a5d5987000000b00207891050d4sm5856038wri.46.2022.04.16.03.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 03:25:50 -0700 (PDT)
Message-ID: 
 <ce8699fcd1a3b74b65cf7eee803d9e349cf0b6f0.camel@linuxfoundation.org>
Subject: Re: [OE-core] License mismatched for libxshmfence_1.3.bb and
 recipeutils-test_1.2.bb
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, oe-core
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 16 Apr 2022 11:25:48 +0100
In-Reply-To: <1c7fe0e3-6ad0-19ba-d461-84ef0f626941@windriver.com>
References: <73be0c1d-e8e8-5361-5132-62f2c837205c@windriver.com>
	 <c79d74d02d7f6b58628fdb4521f60808c2d55020.camel@linuxfoundation.org>
	 <8062c9cb-3fee-7c9c-ef87-a19b777ca2c1@windriver.com>
	 <428626f1e547d6d3c17c3b6f19ff3f161fb6d8e9.camel@linuxfoundation.org>
	 <1c7fe0e3-6ad0-19ba-d461-84ef0f626941@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164531

On Sat, 2022-04-16 at 17:59 +0800, Robert Yang wrote:
> 
> On 4/16/22 17:50, Richard Purdie wrote:
> > On Sat, 2022-04-16 at 17:48 +0800, Robert Yang wrote:
> > > Thank you very much, I'm trying to run the test cases, but I found that you've
> > > already fixed them, thanks again.
> > 
> > I don't know why it was set to proprietary in the test but it doesn't seem to
> > cause any regressions so I removed it. It is at an older version which should
> > mean it doesn't affect other builds so I'm happy to leave it on the older
> > version.
> 
> The following supported versions have the same problem, should we also fix them?
> 
> Dunfell
> Hardknott
> Honister
> 
> I'd like to send the patches after testing if we need fix them.

It would seem reasonable although hardknott is due to have it's final build
soon.

Cheers,

Richard


