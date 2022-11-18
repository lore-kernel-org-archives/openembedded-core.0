Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89215C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 16:11:16 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.164.1668787872067379028
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 08:11:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A0+KR57I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id cl5so9940421wrb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 08:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vgJ6gaRnyv8Od4KHDdgpRS/IWUQoeCdI1OUo1WHJyhc=;
        b=A0+KR57Iwe7yuDFZwHVGo1WElREIzWy4m4cunuSvYkxj+E/WGHVPHpB1RgaHYVg5Ua
         WYhfFDvP/Pr8BtS3FrI4044oj+R6XJKH3mLmdSQqORLPeBTOqBS1UJjDfkiqcjVstGms
         QDBcUEfqXTeMQROjpyYYPuB+zABzn1aDsQkAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgJ6gaRnyv8Od4KHDdgpRS/IWUQoeCdI1OUo1WHJyhc=;
        b=xd+Uf/W7OE/sjhMAmRwSUtHv50h+kYANeNaMWC8E1UL4TEc0W7PzBjhOBhpqol3LeO
         ej7opNDprPVxc5WENfHOma23aACWgcOUqkZsl2wFGDw+7svXMl8y+in6r22MRwzWmVig
         WKvxyloP/gutchz9JDgW5TmNVPmc0/EjRukL6GSw6jypG/WYg3xfyGu6ykW/Ugh1bNuq
         eImVBFBrA2O9/EYVUXDAsjOPnbDodnyVYN5U69iIOxzV2MZNcApW1E653Hc9djluK3y5
         1woMJZDSzUCQy1KieLRSC1yg/rGfDRrIMAu7EArKfq5v+AoyEYQMwMgmcHPiIyVSHz4x
         kGWQ==
X-Gm-Message-State: ANoB5pljZgS/DnNV3QXn1c/OM++CmRyn8O0hAXUFE3mTQhMxKblD3Xn7
	yzirxRnsRRJWYHSHKEnqQBeq7A==
X-Google-Smtp-Source: AA0mqf5xVJ5ByjalBXd+0u4T3m6mL3BHyM2I5bPzALRGCE6pALtLJDaeP6VI1YMdVTzvX2g3o/IO/g==
X-Received: by 2002:adf:f1cc:0:b0:236:e629:adab with SMTP id z12-20020adff1cc000000b00236e629adabmr4955699wro.621.1668787870278;
        Fri, 18 Nov 2022 08:11:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a603:eef1:6736:def4? ([2001:8b0:aba:5f3c:a603:eef1:6736:def4])
        by smtp.gmail.com with ESMTPSA id q5-20020a5d61c5000000b002362f6fcaf5sm3997172wrv.48.2022.11.18.08.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 08:11:09 -0800 (PST)
Message-ID: <a7d53c70e704a72d2a05a0fb4a96a93dc4b9c4b8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/2] image specific configuration with oeqa
 runtime tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2022 16:11:08 +0000
In-Reply-To: <Y3erTB2Qulh8Wfn+@nuoska>
References: <20221117071223.107064-1-mikko.rapeli@linaro.org>
	 <5b79cba0817750882a0ef1f1dd9b9581abc9db28.camel@linuxfoundation.org>
	 <Y3ZVup8YKv6LQzuF@nuoska>
	 <4f16ed270c2b979839830929c703494d221b2228.camel@linuxfoundation.org>
	 <Y3eXdWibCGQBV6Wt@nuoska>
	 <6b088587f876fd2cf76ad8b1b13fac6a7c92cfc6.camel@linuxfoundation.org>
	 <Y3erTB2Qulh8Wfn+@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 16:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173475

On Fri, 2022-11-18 at 17:57 +0200, Mikko Rapeli wrote:
> On Fri, Nov 18, 2022 at 03:04:29PM +0000, Richard Purdie wrote:
>=20
> > My concern is having multiple different file formats and data streams.
> > It means we no longer have one definitive data mechanism but two, then
> > the argument for people also shipping yaml and other files with recipes
> > also becomes difficult. We'd also have people wanting to query from one
> > to the other eventually.
> >=20
> > The real issue here seems to be that our data format (.bb) is
> > struggling with some forms of data. I've therefore a preference for
> > fixing that rather than encouraging working around it.
>=20
> For oeqa runtime tests I propose this json file. If tests have any
> customization need they should use either image recipe variables or this
> file format if recipe variables can't support the format. For other
> alternatives I'd need pointers where to implement and what. ptests are
> normal packages so they don't complicate this.

The key question this comes down to is can anyone suggest a syntax for
including python data structures in our metadata (and/or json data)?

Cheers,

Richard


