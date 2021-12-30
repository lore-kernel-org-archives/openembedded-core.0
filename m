Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793FCC433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 17:35:13 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.923.1640885712161619673
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 09:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hpmBx0ta;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 f134-20020a1c1f8c000000b00345c05bc12dso13662168wmf.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 09:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=eRE964QpwOhS30PD7yPGoNKuH8dJTrgdYY5HRvrqKgk=;
        b=hpmBx0tab8hTqxN/pZOFbVCvW/Z8A0F9eErojgyHPWUz7QP7bLKucfnVKsQjmZ4EFz
         DubZGP5MxZbxyfA8zdaNLsE0+70sSPYrAONRVoC+zruWk+wXzuR02HWiR/qhrNCE5SAq
         hDyvyV+lPbuxWDBMIGS8nTNKEKvXnBHLybYBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eRE964QpwOhS30PD7yPGoNKuH8dJTrgdYY5HRvrqKgk=;
        b=0rocLCHtgmD9XCWNHixQZSgJCExsmfqHoOarhhO+lgC/OtK0LVhw+8H3EOzQ/aRpiI
         0lAAUMyoBoo4de+2ULg7uIIBJ9t2+O1HEIKQI5JfFLKReMw5PDEthjJaFSYxfML5V1+p
         pO0N+aE/BVkHFG5Ca5Fm5Zs3zPOsiEfhtm+jrOj1ZpRUGKwZZmpZUSsrOwam9erbBZnL
         jRHuHB9oB04+Euq7WlLv9I1KKtyrc679UKDvpo3RzQTMFoMDil6KvgfVFllyc5+Jwl3M
         9WKcFMZ18ibQIs1ZAgMT2tyCIeNPllg7/U22Yp0B0ReCPDyxhGEeADoZZyr42lkeueWs
         XRRg==
X-Gm-Message-State: AOAM5316w7FdLyTaIdylmtdooN7lLDXJlnLj7ztM/zY5KdQJupUFyKzw
	dmzp3Psu58eAnB4JSAnuBTqSqw==
X-Google-Smtp-Source: 
 ABdhPJwZIb4K8k70pSYDYygcjTmcOsKYjQbh5kx54PThLalDd764WMoTINRNMd1Sjl+1MRm/bMaZ3w==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr26490612wmg.24.1640885710549;
        Thu, 30 Dec 2021 09:35:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5338:1a89:4b16:d611?
 ([2001:8b0:aba:5f3c:5338:1a89:4b16:d611])
        by smtp.gmail.com with ESMTPSA id
 s1sm26719929wmh.35.2021.12.30.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 09:35:10 -0800 (PST)
Message-ID: 
 <269d6dc8ebd0eceb4f4171d73bca9a988cdacaf4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] qemu: Upgrade 6.1.0 -> 6.2.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Dec 2021 17:35:07 +0000
In-Reply-To: 
 <CAMKF1soVmyWyfwR7MgmfxXU7gxyEcihVqnYy5MSAJ_r+Nuvukw@mail.gmail.com>
References: <20211219232626.940899-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1soVmyWyfwR7MgmfxXU7gxyEcihVqnYy5MSAJ_r+Nuvukw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Dec 2021 17:35:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160062

On Tue, 2021-12-28 at 19:26 -0800, Khem Raj wrote:
> I am seeing that it now fails to build for riscv64 target where it
> fails to configure
> 
> ERROR: Unknown CPU family riscv, see
> https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.
> 
> ERROR: meson setup failed

Looks like we need something like:

https://git.qemu.org/?p=qemu.git;a=commitdiff;h=c94c239496256f1f1cb589825d052c2f3e26ebf6

Cheers,

Richard


