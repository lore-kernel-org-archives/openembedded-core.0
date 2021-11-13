Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75DEC433EF
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 17:35:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.272.1636824931142454357
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fQAxMVvP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso12365731wml.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7UdGqlIceEHwOEijwVsHJp03avjQb2jQD/FbCIdn85U=;
        b=fQAxMVvPNb9rMBvp9sLaMHzae4i6cqMgZ/jrapZheLtcERzGmQZbMP8I7ZaiQJ16QK
         uWyeMuS9TfE0PzwaWjRO9C5GFCoaXGlOpx7vriGk5E4+PLzHVtaZUYPrnL/xI7B17bMM
         JXF5DNotrOvbmxUzIGeIFi2JFc151B7u55i4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7UdGqlIceEHwOEijwVsHJp03avjQb2jQD/FbCIdn85U=;
        b=vbaSjh5TaJaDJJw/nWf/Ku+B1XDqa1/M4eb+c3SU5Y7NoRH9cV3508jEj628rTKgDV
         w9mn0hmLtKcMTrOvtZyIZB3VZteg4Mu0oUmXcmuse/lqPqsqSBNY9lnMuYvd1Lsueg1B
         uADz/0yNXeLe3e5ilRNcRx7i5pVM+mTJqcwU1lpqUa7AyI/UgR4sZLH/JdnIvPNzp/0E
         KX0NlbFAtUlibdruvb6D6S4SyqGM7s4djMljXuulrH+eUYwTH1fVz6h4KcMuxiMitSyh
         XywIrQPiHGbN7k7WeQ9Tk3BMy6m9GtIYwGBQdcuBYhl2ziMLP5iAtWY6BBzODMk/Fi7R
         s6wg==
X-Gm-Message-State: AOAM533wHYN0Kjo+zo+JK+NSNXx1rW4AJJ9/w8+XFTW4ZC+cfw0hmwZk
	IVrrj/C4icnDM8EkMDyZvHHE/A==
X-Google-Smtp-Source: 
 ABdhPJyi+OOfVyNdAFx/FuFUCdTRu/Mq4slyEZvgOIXBvV7cWP4uYn8aCKpUUAJL1lm8alJPAOgh5w==
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr11482999wmq.32.1636824929543;
        Sat, 13 Nov 2021 09:35:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4f1d:7b2:7d47:57f5?
 ([2001:8b0:aba:5f3c:4f1d:7b2:7d47:57f5])
        by smtp.gmail.com with ESMTPSA id
 m34sm16520274wms.25.2021.11.13.09.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 09:35:29 -0800 (PST)
Message-ID: 
 <1fb768c238f52677f9aa028bec31ef8352030ca8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2] python-numpy: move recipe to python
 directory
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Date: Sat, 13 Nov 2021 17:35:26 +0000
In-Reply-To: <20211113170219.372539-1-yi.zhao@windriver.com>
References: <20211113170219.372539-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 17:35:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158251

On Sun, 2021-11-14 at 01:02 +0800, Yi Zhao wrote:
> This recipe had been moved out from python directory since 2016[1] in
> order to share patches between python2 and python3. But now there is no
> reason to keep it in its own directory as we only keep python3-nump.
> Move it back to python directory.
> 
> Also add python3-json to RDEPENDS to fix import error:
> $ python3
> > > > import numpy
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "/usr/lib/python3.10/site-packages/numpy/__init__.py", line 138, in <module>
>     from ._version import get_versions
>   File "/usr/lib/python3.10/site-packages/numpy/_version.py", line 7, in <module>
>     import json
> ModuleNotFoundError: No module named 'json'
> > > 

Please make these two separate commits since they're not really related.

Cheers,

Richard



