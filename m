Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D241DC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 16:41:54 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.1493.1657903309147867143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MorAuVeR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id p4so3136103wms.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=WVWXA7nfhsdtuXr0FuPeMlk35AMhyOr8uo6hj/Rp80k=;
        b=MorAuVeRznNNJodNZ/i1NbpS1j57qkNP7enPfUMfLsdiUlpoBfyfZ2EdheBhRwEKSZ
         djLZeiIAWDHM3Loa4HZRrb8hVUuv8FjY91QMjj8qfXzczfoc3PSfsYSiCKmZGOxiRkt4
         xq3PVGAmUHitLcd2Tw3LVze6yNoldJizgRRK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=WVWXA7nfhsdtuXr0FuPeMlk35AMhyOr8uo6hj/Rp80k=;
        b=tvgcQltH2+PRTrjcC86+53s2BjHG5iF7AiM2qEcA9jnLojuIfd+tp1PZU+uiAmFlaf
         zVx0tStID1I2A5UPCgO9ffm1bNTZO7CRNc9dgxQf1athcAaaSVUce6NBSh8m8QTmYg/8
         hXdMec3tWa+TDkaOTvONFEmmJyFQ8y8hxFARmkH6TEe4UpFkOG7Kgk+MDApLuQDEqmWG
         9qv0ejtQj2xoemlPZJJzyM1JkwkHxYYjADyAVQsBL4sgcmw2UdA2aqNUgtDgx8T1DOdQ
         DidW3lp1OPPN0mLmQOG/D8iwPqMWf3toHS2UuIxcCw5SkpF+fJqgtFL8G7jxddFTB+HL
         epNg==
X-Gm-Message-State: AJIora9+Xr/5qDRV2nI8KK6Rk9dhXTbxYxqKrAufbo4RCoJcqpUzi4BC
	Oq8BGa4I6iy36UUK69hc0xk6n2+JsHAwhQ==
X-Google-Smtp-Source: 
 AGRyM1sMGvSqZQNsfXDltq/Fc8owIQUpZj3tGeB8fF2k64R+vb0OAEtdVStCPOc0zdDoHy2GgHRyJg==
X-Received: by 2002:a05:600c:3587:b0:3a2:eefa:3c88 with SMTP id
 p7-20020a05600c358700b003a2eefa3c88mr15663499wmq.64.1657903307711;
        Fri, 15 Jul 2022 09:41:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ef6a:f831:81f1:d696?
 ([2001:8b0:aba:5f3c:ef6a:f831:81f1:d696])
        by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c4f5500b0039c5ab7167dsm9614249wmq.48.2022.07.15.09.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 09:41:47 -0700 (PDT)
Message-ID: 
 <c26547d12783ebb94f1d2222403c11cc7c9633d8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-docutils: upgrade 0.18.1 -> 0.19
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2022 17:41:46 +0100
In-Reply-To: <1657611899-30825-1-git-send-email-wangmy@fujitsu.com>
References: <1657611899-30825-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 16:41:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168128

On Tue, 2022-07-12 at 15:44 +0800, wangmy wrote:
> License-Update:
>  year updated to 2022
>  url of some reposity and license changed
>  exceptions of BSD 2-Clause License changed

This last bit sounds a little worrying. Is the code still under BSD-2-
Clause? How did the exceptions change? Were new ones added or removed?
Does it change the license?

Cheers,

Richard



