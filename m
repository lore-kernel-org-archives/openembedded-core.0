Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D83C433EF
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 19:37:00 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.13031.1636918618687480273
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 11:36:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=enk4lrfN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso11172021wms.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 11:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cGZSFL2aQBY2hFaNcpGz8kylIJhlQWoaQojR5p2ouwA=;
        b=enk4lrfNb7FX58mj9EHfOc9l1cQpFvBVwTus/28l2rx5XJJaWxl7lYvDgrbbnhzkBO
         UtdRj8tiRbDthi3Oh9bfKt9RPirzkhoI+x1OOg1p+JYVFJCZ0lJ8nisAEBQB2ilQ2Lay
         2+O6eDwIir2oxMPVFhlDo7B6NguwDIcmUQJE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cGZSFL2aQBY2hFaNcpGz8kylIJhlQWoaQojR5p2ouwA=;
        b=moenCBGii+dGlc0xobJDfF0nuye6VKR9IBmlUZih0BokDdkYMgd71tnJ4raRdIGlnA
         z5c7EFDGIUgbATH02t28MWkpalFVK/3gW0UqHpirt43gHI02+t3YyP6MbaQPATtbVFKq
         bKK/VgzU23GmPPoUgYhMdF2yFrEapHlWEyep89Nbg055SLNaE8Nq9TUV1y4VwnwPoHH6
         ALyIx9XUHeojIQ8BYp75ovYJB2wNEQMxCM/oFmB8HmdDp1OL/1WuAzoEq/fp9roFOlWE
         QLQfdIX1YYEOl0ZskifXxFfTZwI8PsLAfhccFuWA8KMKbK2euRDaRjA+qyJH0O6vJk3R
         1/QQ==
X-Gm-Message-State: AOAM532NVZRLMnGimyTCP/qfhUCJRjj8AIEUlLyOXjA2SInFJofXLP/w
	HrJutIGv3H52WIot1ib2q/pdWQ==
X-Google-Smtp-Source: 
 ABdhPJwoHCYBzUMQOQv3/oHBIAY04sf1pNNpbyQUXNv8HKsNvA+sRyIgdk8Q7vBt1O9DRIqB49E7Gg==
X-Received: by 2002:a1c:790d:: with SMTP id
 l13mr54999400wme.101.1636918616913;
        Sun, 14 Nov 2021 11:36:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2532:5b3a:7e94:ed1b?
 ([2001:8b0:aba:5f3c:2532:5b3a:7e94:ed1b])
        by smtp.gmail.com with ESMTPSA id
 u14sm12034167wrt.49.2021.11.14.11.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 11:36:56 -0800 (PST)
Message-ID: 
 <dfc7b7fc105d153303d7d5933689d9b469fb5a22.camel@linuxfoundation.org>
Subject: Re: [hardknott][PATCH] mklibs: remove recipes and class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 14 Nov 2021 19:36:53 +0000
In-Reply-To: <20211114065008.3899-1-jacob.kroon@gmail.com>
References: <20211114065008.3899-1-jacob.kroon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 19:37:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158262

On Sun, 2021-11-14 at 07:50 +0100, Jacob Kroon wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> This is not enabled or tested by default, and has never been
> ported to python 3 upstream[1], which means it doesn't work at all
> with plain poky. If you need it, please put it in a separate layer
> and/or modernize to work with py3.
> 
> https://salsa.debian.org/installer-team/mklibs/-/blob/master/src/mklibs
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 908df863b419d1cad7317153101fc827e7e3a354)

What issue is it causing in hardknott? Normally we don't backport invasive
changes like that...

Cheers,

Richard


