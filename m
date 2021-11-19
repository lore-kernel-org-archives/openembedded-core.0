Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E386C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 12:29:43 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.8162.1637324981912601787
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 04:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gvlsh1ip;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so7389209wmz.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 04:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7kR2zCxgj32Une30jB9WfT2KtkoNU3LRb+ACDKzsqR0=;
        b=gvlsh1iplheZHAJwkFGEeXTwD8aUWcHCAmmWj5LD88j+p+NeVqZmfMePRwX7FeFB7t
         RIGZzRMSqR+gwZFR1DUbw9nWAztebKLnoEjOkkwSRZTHjQZFNCp8Ra5XnEOdJbkKeO3h
         sEiY+nRGydg9F6+0UxCKipjgaQu9YmuQ3P97Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7kR2zCxgj32Une30jB9WfT2KtkoNU3LRb+ACDKzsqR0=;
        b=Ad3H3tt8YgLQ+pH+mDoeyi5yXG/WzCGbw8/RXMJVHtvNVLchUwqStiams0GGgQlgch
         GC/80abDQ18TLp8YPsHA3iZdEDHaHhS8R6IfSaT3Hquz9TKgSsaUpuJ9LvcqXUPqeOzm
         tsdVrUSzUN6A0oyUzuQC5NK4PIOE9fqsN5PDeRNcjnrFHckcSy9h1SbT2G8Wi7zr+to/
         SQYQIv1zimDpC7dt6tCcZZwx0wdRasYorVBoI72dKZKD/sOvWdAhlvD4H4Pbg4GvA3Rp
         H9QGs+qw+fUg/JPUiXOHwGlRnh7b7IHcDlclFdBd5RE8tkSOCduESYeFaiyP8D8LwT6K
         nukQ==
X-Gm-Message-State: AOAM5305Si3CNtT7g8ZTacf7rjYiquKaiJTHcPtjJVpFo7hKr/SIdwcW
	oEELOJkl/K6OQx2zme90lau7+g==
X-Google-Smtp-Source: 
 ABdhPJwbdtn2EqY+ZsrHjWywI4vcjLjws2ZkqiDjW8nlhP2rfi5JbW9excM2H0+8My7iPNA7hsWXdA==
X-Received: by 2002:a1c:7d0f:: with SMTP id y15mr6551410wmc.191.1637324980127;
        Fri, 19 Nov 2021 04:29:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa24:506c:323a:9c49?
 ([2001:8b0:aba:5f3c:fa24:506c:323a:9c49])
        by smtp.gmail.com with ESMTPSA id
 p19sm3181426wmq.4.2021.11.19.04.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 04:29:39 -0800 (PST)
Message-ID: 
 <b66f8b68585c7c2648c5931a8e931ab864626dfb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/36] groff: mark patch as non-upstreamable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Nov 2021 12:29:37 +0000
In-Reply-To: 
 <CANNYZj_7qsm0zf1CfeDF=_mzkj+xWJa3G+D-cFC_WSgGnRA-ow@mail.gmail.com>
References: <20211117153525.257146-1-alex@linutronix.de>
	 <20211117153525.257146-2-alex@linutronix.de>
	 <84c2e406c6127e55e7bdea01f2bcade6a9ab1c89.camel@linuxfoundation.org>
	 <16B8EF5BF2691601.30231@lists.openembedded.org>
	 <CANNYZj_7qsm0zf1CfeDF=_mzkj+xWJa3G+D-cFC_WSgGnRA-ow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 12:29:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158519

On Fri, 2021-11-19 at 13:08 +0100, Alexander Kanavin wrote:
> I checked; the patches are the same, except the upstream one misses one file,
> which is fixed in a different upstream patch. I'd say we can keep things as
> they are.

Can we mark as a backport of those two commits then?

Cheers,

Richard




