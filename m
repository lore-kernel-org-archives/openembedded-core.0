Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6AEC433F5
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 21:58:12 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.240.1642024691489188756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 13:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BLG6lhT1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id v123so2577518wme.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 13:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=M6Nf7/rCgtSqB3m3AHLCQWAxH2yLCiAmcFVM78wRKKo=;
        b=BLG6lhT164UcUq8pYJoHIIMmrz9U/Kgu00JAW0MaacaKoojUfgTLdLKVAdsRd9/Fb3
         2Nt+xynrjsc52sMCCrq8IM2iuGjAjtN0/Age1HmPo08oqErGHxB4v5Vg3yD9LzP7KnnN
         atEavPCxP80Lp7rKfh/J5HQcHxh0U1agr6yAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=M6Nf7/rCgtSqB3m3AHLCQWAxH2yLCiAmcFVM78wRKKo=;
        b=M5sKRtXJO/ASm9sAtkPDXs4R5+CC9xPeqga0svt6nejGxzh6lrgsM9KaErkwOMS5o8
         vFrdwNBl8pd6NWrMsVDccqGwCxPSW5Sen4jeKkG6ENAKv0CANSclGCoLjuoip1NC8rqK
         RAf7lAsI/+8gCnSe+rV2Y8U4RzzPZ6/mB3wJ67deuazhzkSTqYx9euubU0vBIrT/qHT3
         D8pBSq2GUHQcur1gFxFgNLHCWmyTWjI08UEot8jzV7w8te8ncmt2ezoHWVCw9xLvXuvj
         xMeTVDWy6OcvtXz4mXtAbMUWaO7/qz2MCrdLpgletPrA2R54GIzsZhCXZvD2MMO0dTh+
         v01g==
X-Gm-Message-State: AOAM531s1Ee7IeMUqqBY3vKfyJvghWcybnKJsusWmELklcoZSE+VEhYQ
	4KJ9e1hKiQciS2ALhrVAgLbA/Q==
X-Google-Smtp-Source: 
 ABdhPJzrZ9aiIpymrjmVtPBgMGNu+QhFriqxYsw5jsN8yTwWJuDnGveKOYZ4B2+a01obmGaXEH4Wdg==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr8311747wmj.168.1642024689983;
        Wed, 12 Jan 2022 13:58:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c73:f637:3634:b28d?
 ([2001:8b0:aba:5f3c:5c73:f637:3634:b28d])
        by smtp.gmail.com with ESMTPSA id p9sm953840wmb.32.2022.01.12.13.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 13:58:09 -0800 (PST)
Message-ID: 
 <bc571d45ac0dc66bb9a3409b1215815ca369283f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] tune-cortexa72: Enable the crc extension by
 default for cortexa72
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, Kevin Hao <kexin.hao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jan 2022 21:58:08 +0000
In-Reply-To: 
 <CAPoiz9wdB1z_mC5Td6RpN63ED_7Mm+7vBmDQtf=XoRmYLwCrVA@mail.gmail.com>
References: <20220112090708.1597301-1-kexin.hao@windriver.com>
	 <CAPoiz9wdB1z_mC5Td6RpN63ED_7Mm+7vBmDQtf=XoRmYLwCrVA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 21:58:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160501

On Wed, 2022-01-12 at 14:23 -0500, Jon Mason wrote:
> On Wed, Jan 12, 2022 at 4:11 AM Kevin Hao <kexin.hao@windriver.com> wrote:
> > 
> > The crc extension is optional for the ARMv8.0 but is mandatory for the
> > cortexa72, so there is no reason not to enable it for the cortexa72
> > tune. With this change, the cortexa72-crc seems redundant. But we
> > had better to keep it to be compatible with the BSP which already used
> > that tune.
> > 
> > Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> 
> Acked-by: Jon Mason <jdmason@kudzu.us>
> 
> From the GCC sources, it's hard coded for A34, A35, A53, A57, A72,
> A73, and almost all of the others listed.  I can patch the rest.

I did wonder if we should just drop the duplicate tune too. It will cause an
error but it is an error that should be quickly/easily fixed...

Cheers,

Richard


