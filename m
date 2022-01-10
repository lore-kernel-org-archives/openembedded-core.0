Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F49CC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 13:59:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.31832.1641823177882588608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 05:59:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zc5XkaF+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id l4so8801108wmq.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 05:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xEmERTNXjhiCjAUqwhGtz2VeDUNqny7ARoiduJIKzw8=;
        b=Zc5XkaF+I9QcHlWwvogeLhj+Isx+scHr5Y26YtkuZHp9w6GYugRaNik9s1SS9AOOqf
         4S/ykmUkmtiAGlNZFr6DRhoi1ExVafeUBXP3Mx2yP04gzc5NTnCNvbqcUfZMD0mt2m4+
         994NpqH6C9uKhEqo90OATMmX6EuhQyMAalUgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xEmERTNXjhiCjAUqwhGtz2VeDUNqny7ARoiduJIKzw8=;
        b=nt6i5+R422AjEuPtjxIpNOerC31Bm/v1p80QCIB1BDj3edKVPRHp611rdwrhzsEPl8
         E1+EHXW49YDzVRgEo8bDpude3S/JK2xh5Ht806TMOOQt869bvhApG7qrh/tQvbpjGiKk
         xoHXVb9o/42VnI4OSdLsK26LfeUW7U7A9JnYWYc/JZRNZPMSlZPtB0FA2AUKUP65fI49
         wiT5FRFQqME/3CqeqxPH1LK5KTAOnO98eOgpPDvQ7c3fgBuBET3vcFbJTEIDgBKNrW7v
         SKXota8gVOAhMGKU5ADQ7X+M1duRLwAD2p/ioOAYy6CzoDB4r8WNql95Ry9EkttNMuAJ
         dLfg==
X-Gm-Message-State: AOAM531lTQK1SUBgOPbjBOm+OYCsNHFfPyQ6dyxjfkVeJLDczR8sMxlM
	zFNsZeB3Cz31+8XVmE9MIjy+7Q==
X-Google-Smtp-Source: 
 ABdhPJy14SQb8X2MYM9voJA4E172xrB20UAmh2IneM7DBkQuNAZFJxdoTaaaeixgH2Ex+5pL6m8+kQ==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr2738426wmi.43.1641823176208;
        Mon, 10 Jan 2022 05:59:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:988f:80f:f286:3191?
 ([2001:8b0:aba:5f3c:988f:80f:f286:3191])
        by smtp.gmail.com with ESMTPSA id
 s1sm5451402wrv.38.2022.01.10.05.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 05:59:35 -0800 (PST)
Message-ID: 
 <4d829edff8abad25269693d4f199b582b5bdf879.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/14] python3: drop unneeded multiprocessing
 module patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Hongxu Jia
	 <hongxu.jia@windriver.com>
Date: Mon, 10 Jan 2022 13:59:35 +0000
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 13:59:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160353

On Sun, 2022-01-09 at 23:27 +0100, Alexander Kanavin wrote:
> I ran the reproducing sequence on qemux86, qemux86_64 and same targets with musl,
> and it went fine:
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

Isn't this now working since pthread was merged into the main libc library and
therefore separate linking for pthread is no longer needed?

Cheers,

Richard



