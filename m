Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA7EC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 14:56:35 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.11479.1639666594200550295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 06:56:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MY5ZrSlK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id y196so19075578wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 06:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/ZA0LcFMLBYaY2C9DD1QuY3uNg0mCsSbYEuhSyI3tc8=;
        b=MY5ZrSlKvOMGYBA31wXzVFU2bCcrW3mQ9VKFyK3RFHMvThoBDwu8vtiZcg80mLP/44
         TTWArZhRDB+/Rqk0xyLETMLI77FNpcrThnRVg43hwfIQvuQFAZI1qM53kHqUZZztc2bv
         JC4wOF4HuBIT6KLSaPcI+BTe9+aaF/Tzo0u3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/ZA0LcFMLBYaY2C9DD1QuY3uNg0mCsSbYEuhSyI3tc8=;
        b=JltdorUmKwSSFF4YHM+cP+11UJQfZi6fOH/wH1Xo2k2Gkvb+25hz0vr4r+cfanNsdb
         IH2WDoaPR7bAWhCKyDdMtfkdt6/Kk5PnoPOPUKG5OKugVL6xj9mQ25b5r7OcaS9/+MiS
         Gxh8PqC8QBWARO0GynZyfmiT1w55IxNqsIEhNqUraZ1XhRlbJjZbkrQbESdQAWcE0f9Z
         BDqPjlPhmVxG403bz/YXPuOzeWILHvpKPWkIo9muTTrLbu5IBNeBslgpRKca1KBvVQ03
         Bl36JKQIZdRPtdaE3aLDQSzJCl5f3vw3yf0nmU1lH+6wSn7MOjiQ44lPDOJd1YnTiFY5
         WM3A==
X-Gm-Message-State: AOAM532nrgUTeFabWAmo5MpLjc7L8jOc6yNfxRykCceYD/HKbHsRVtxJ
	2qFvQ/IRaiGz+RMH8w2vBj0eWw==
X-Google-Smtp-Source: 
 ABdhPJyQ6Zg84c/X0vgPn3DxTr6smtizjvkvslywHDL8CEhL258sNaoL2uhVMGxaTAc242hy6c+0ig==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr5338318wmc.89.1639666592758;
        Thu, 16 Dec 2021 06:56:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bea:ecb7:80b0:2828?
 ([2001:8b0:aba:5f3c:7bea:ecb7:80b0:2828])
        by smtp.gmail.com with ESMTPSA id
 j85sm8941384wmj.3.2021.12.16.06.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 06:56:32 -0800 (PST)
Message-ID: 
 <2ffcdc396e21ae39e5cb0e9f55b7a887ed97ce36.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/3] support Android target in all build system
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hsia-Jun Li <randy.li@synaptics.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Dec 2021 14:56:31 +0000
In-Reply-To: <20211216103846.718910-1-randy.li@synaptics.com>
References: <20211216103846.718910-1-randy.li@synaptics.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 14:56:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159792

On Thu, 2021-12-16 at 18:38 +0800, Hsia-Jun Li wrote:
> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
> 
> Both meson and cmake would work fine, left those GNU autotools,
> customer script projects.
> 
> The behaviour of meson would become that as the following for
> the Android target:
> lib/libfoo.so is the real binary library
> lib/libfoo.so.x -> libfoo.so
> lib/libfoo.so.x.y -> libfoo.so
> 
> But when you tell the autotools the target host is android,
> it won't make any difference in its output library. I would
> like to fix that but I am not good at m4 script.
> 
> Hsia-Jun(Randy) Li (3):
>   cmake.bbclass: support android os
>   classes/meson: support Android os
>   [WIP]: openssl: fix Android target

The first couple of patches look ok but I'd like to understand whether there is
real world usable output from the build after applying them? If not, I think we
should probably wait until we can see the bigger picture of what other changes
would be needed to make this work rather than making tweaks piecemeal.

Can you describe what level of functionality these patches give to a build?

Cheers,

Richard


