Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41659D5AE45
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 11:23:10 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3842.1765624977343659639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 03:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aybGAd+y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fed090e5fso293036f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765624976; x=1766229776; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/PxYpnJO1oAjV3WbqqnkCVg8LXlaoHXAwekpDm0toQ=;
        b=aybGAd+yhCWuPojKjlltREtpUqJKv6B1byX1V0nUqOmm4H0paP50cfKxyndBwSEUbn
         KgBPbLAqwhLWi3C5cUIhkjXS8xglhMN50m4pbF8uq1faMFlygxNLi3zYV1Kmqh7GWqed
         N2+rnnvem28qOhRuemylabIPPnhwTVGGRwU4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765624976; x=1766229776;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/PxYpnJO1oAjV3WbqqnkCVg8LXlaoHXAwekpDm0toQ=;
        b=xOaDvANFV0QQy9ltuCZYEiU54svnZ8Q0tx3pCVoLEhuLcYQgmJ16mPs/ppuwOCKzzF
         Py0p46RfELEQCRksOHt4f1NHzIu/Z/v2Bn+9xwktr16IlZNvfygHkmUrmKpKSwZCAkSe
         hmeAwGUeij7Wceey8Ww0o1Br/YhIXRO4mPjCqoOZA0xviT9FW+3VE2CiuMiyYO+waqKE
         MW3pSXGM7Fr/uj4RVhzR0QMXL3oEMieSFoKnNROlSqT1/pFi3Aafod0s02m/iNfT6Jps
         3Y8yowE/wCykQGWOcyztCOBGK4SH1kMtZm6Y03bdZw4113kWIPKRbzVH4X53puGCzvj8
         iXWw==
X-Forwarded-Encrypted: i=1; AJvYcCVoUNYdpKZZRK+AN+Hob2DvPMss9ki9Bln/CMNpJ44mW1kUPBnWv663DS+RyDNfpAdeZIRqdKk4/mjy81VCL/Yq0g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyVWIhXcXNtJwUtFwFFSiAED2RgmEisnbhf5kDZlE3SHOU8JALd
	f82VhrPXpGZZwCLRTjfFIMvOSz3AIww3KrlNyrfoKvtt2ovkB6jz9l/f2J6tQKZ9UsW2cQ1YSmu
	BV2dKczM=
X-Gm-Gg: AY/fxX5hKe8ugCBTcva0FlFgJEoj7Wc1IpPGLfcnjp/QN3ncfdoUC0F+IhZQUnQr/Qt
	wHQyUieNOezRxvaOu22rB0NHoJuz5sWhsqUt/TBnEX6dqU2vyB9ZuxwE5GHCqlO9xqy10rVoqDw
	bOZT2WIB+1m3tSgpWgX8ZfL1MEiPs0ZPjqXRVxbJ6KO8ZDhT4W63jaUiQEkT6RcrvhaiLsgiEQc
	L6JUAgefqCnr4gxrUO3rfZLiTp2zEoLkwRBiFjHsRlL9+RUbfdHYwqPO9RrhfDdlugtp7fPm2+O
	vFsH9ImYHTzf1lwu+p+MezzNPjObijcfIyuuPukD2aYG4yNiJWHmae+CR+rRVk0fnyRfB9oufue
	hgZ1TF+hddEd/j62//rGOdbLzPQ9EsnL3EdWXc7Yzzpj3cMITEZasJMOfW1L9kXR4HF3IlSkjGa
	d319Wmb2uYu8QyqTuRomtnuYloXEWGsh0D1tPRDex4e8XwHtKg1w5kyqkyJPtLFiVcLXzoC2qWH
	8WrIMbO638=
X-Google-Smtp-Source: AGHT+IGDfI2iraMMCGrKQLPP+Vn/+kc7UUGoQCMMSdDcrHeyN80NlMqT9z812tQZeT1VbSqPYbwylg==
X-Received: by 2002:a05:6000:18a7:b0:42f:b0ab:7b48 with SMTP id ffacd0b85a97d-42fb447668emr4668237f8f.1.1765624975556;
        Sat, 13 Dec 2025 03:22:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b58:105a:9d9d:c6ff? ([2001:8b0:aba:5f3c:b58:105a:9d9d:c6ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b8a841sm18256386f8f.30.2025.12.13.03.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 03:22:54 -0800 (PST)
Message-ID: <dedf101cfde93ffee140e1262c79beab5f0e6bef.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] default-providers.inc: Let libva-native
 provide libva-dev-native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Sat, 13 Dec 2025 11:22:54 +0000
In-Reply-To: <20251213095547.1028402-1-raj.khem@gmail.com>
References: <20251213095547.1028402-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 11:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227687

On Sat, 2025-12-13 at 01:55 -0800, Khem Raj via lists.openembedded.org wrot=
e:
> This fixes parsing errors e.g.
> NOTE: Multiple providers are available for runtime libva-dev-native (libv=
a-initial-native, libva-native)
> Consider defining a PREFERRED_RPROVIDER entry to match libva-dev-native
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/conf/distro/include/default-providers.inc | 3 +++
> =C2=A01 file changed, 3 insertions(+)

This isn't the right way to fix this. Why is libva-initial-native providing=
 this?

Cheers,

Richard

