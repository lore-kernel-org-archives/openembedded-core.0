Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE85C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 11:07:17 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.50064.1638788835149637900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NtUs/6BI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso10081131wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EPc8gClpFl/ym/AMN1VTllrT4KrJF1Nxiy4k7Kegtn0=;
        b=NtUs/6BIQ4AG4VrTNpyoMwoK5GHyC5qdD9sh4DBT+adGXu1kdikq1vTkXuFnyS88Fz
         W1Wr/EzhlIO6rITu65dPVyAYFS/Oko/LwQNaZf2tHAV5JyHDsELz3uCPNzQER+BVhM0o
         vDJWJq7oRyDIDzzBdbYtFGUKWyc9TaUF9l1/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EPc8gClpFl/ym/AMN1VTllrT4KrJF1Nxiy4k7Kegtn0=;
        b=izMyN1F1MUz9I4Mwz6o/kWHiMK3YgOCppIrIhK1KAUcXcTfXnnTb8VetXwOTypAvXv
         2vwmWonNPz+pgUUpaE0dLNJNCnf47ZydXBpeNJsoF9qMS434XTFee7k5rQ7myiAYbPIQ
         2NMocW8eqHV4z3wuD/5YUpJU1urjETsfwUuSj0aLYCspC6tva5BEenHYUxQzLC87BkWy
         AQ+oth9bcmJYMGlczpuQIS8ETu7KS9Er3prZf9glEuwOmZEqdmN/wxQ5wLuaMLD634B3
         Tw+rk9d0ocB2apY8rFE0+6gFx64j4WL6BhXc48BMZt3LyXH6zLe9SGoIJvVC6l+upuYF
         KXVw==
X-Gm-Message-State: AOAM530nHLxAdIFjrRUSVO3WhNnt/w1Tc0tj/F/QXEEbd3T7Xu5IUb7v
	Q3YSLNs1K6oxsB1zAR+XFoP2tQ==
X-Google-Smtp-Source: 
 ABdhPJy5qs4R6SqdlgTCQ5qw3Mzs400l/DliWB5PsPub2Hvv3WuTwkx5rloDJnYLa0m40QqsqCNC2w==
X-Received: by 2002:a1c:1903:: with SMTP id 3mr38005354wmz.89.1638788833340;
        Mon, 06 Dec 2021 03:07:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:50e7:dab5:2141:24aa?
 ([2001:8b0:aba:5f3c:50e7:dab5:2141:24aa])
        by smtp.gmail.com with ESMTPSA id
 p2sm13130236wmq.23.2021.12.06.03.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 03:07:13 -0800 (PST)
Message-ID: 
 <b5d775737830c3ca7864bf650eac4b5ac2cbe19a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/26] python3: drop unneeded multiprocessing
 module patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Hongxu Jia
	 <hongxu.jia@windriver.com>
Date: Mon, 06 Dec 2021 11:07:11 +0000
In-Reply-To: <20211204071323.2480163-5-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
	 <20211204071323.2480163-5-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 11:07:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159219

On Sat, 2021-12-04 at 08:13 +0100, Alexander Kanavin wrote:
> I ran the reproducing sequence on qemux86, and it went fine:
> 
> root@qemux86:~# python3
> Python 3.10.0 (default, Oct  4 2021, 17:55:55) [GCC 11.2.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> > > > import multiprocessing
> > > > pool_sema = multiprocessing.BoundedSemaphore(value=1)
> > > > pool_sema.acquire()
> True
> > > > pool_sema.release()
> > > > 
> 
> Additionally AB testing revealed no issues, and the description isn't entirely
> clear about where and how the problem occurs, so I can't submit it upsream
> without having that understanding and how to demonstrate the problem.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> 

There is a slightly different explanation here. libpthread was merged into libc
so this fix becomes a null-op on glibc. Not sure if musl has a separate pthread
but if so we could/should test that?

Cheers,

Richard



