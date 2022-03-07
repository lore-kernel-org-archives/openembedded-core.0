Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAE2C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 22:40:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.1830.1646692803420206358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 14:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IAJIpeRK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id i8so25590587wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 14:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=V9OoyauY997cKQtf2LCRKSPhvTOZuUZ5ht8SUdhsav0=;
        b=IAJIpeRKA0cV2CHsrsb4ygG3VBhS3eq/BxX284eSD6kjv85qNbgax4R1ljU/sIBW2Y
         ha/81anp0Xy90xt6wRVVaXK04WLocYpl+ND27EzRI82IJ0KyBwlO3YZAiaYf3xoRW1e7
         9s1REUAQV1snGMZXzw0xBb51lMOqM5mejgyUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=V9OoyauY997cKQtf2LCRKSPhvTOZuUZ5ht8SUdhsav0=;
        b=BZ3FGhQMnjXo6uKYnUxxpG3PpP5cvC/6ZccksFV9dRP4F25b4hSwEpu/5GcPs3GbTO
         AR/OHrvzH/4euKoDrm750Ddco1IjSyvC0aECb4VP5ubY5cMtq0pmxBlGcHb3VBCUBoAJ
         dj7+VRGKuvQy/ADgCFqB5dltZPEqEfGC6onFGFRwLFQlCoc0SFlNfhDqoXgtUqMRSdHa
         vXV90W/8piwhlVli7swp6STUFYMh3bblmRmgKOmTBC6K8O/XQ64aXUMq+gF1gQYvquHg
         o6WHuGOwlBB1tou7bfAxrDrtpAGvPEgajnkifif/9q3OLg60F5avK7hFaOcqP/SBifLP
         dROQ==
X-Gm-Message-State: AOAM533Y5BCch5Ojuq49ya9e/riomLVEePkAIndwReOoAixE57W2IBCR
	unhYXFU4yZdSCMrF6wxvnC6hYw==
X-Google-Smtp-Source: 
 ABdhPJwXS+u2FeJdExho9k4uppcHxMFUY738TBCt73vkWFuLAqpnqwVxPVJ0+XC+u1t97Xi1XG2XWw==
X-Received: by 2002:a5d:4392:0:b0:1f1:e683:de90 with SMTP id
 i18-20020a5d4392000000b001f1e683de90mr7885764wrq.551.1646692801781;
        Mon, 07 Mar 2022 14:40:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1a2:8f31:9d13:9148?
 ([2001:8b0:aba:5f3c:1a2:8f31:9d13:9148])
        by smtp.gmail.com with ESMTPSA id
 k13-20020a7bc40d000000b00381890032dfsm515516wmi.1.2022.03.07.14.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 14:40:01 -0800 (PST)
Message-ID: 
 <1c35c3cc1c02cff551da6b43e39a500ec36493bb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libsdl2: Make libunwind dependency optional
 for native builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Carlos Rafael Giani <crg7475@mailbox.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 07 Mar 2022 22:39:59 +0000
In-Reply-To: 
 <CANNYZj8W_Zpae8GjiaJBasg8eQxsyZHDbtK7WFpNHLjZTrPCxQ@mail.gmail.com>
References: <20220307080750.489418-1-crg7475@mailbox.org>
	 <16DA0F4A680FB7A0.15718@lists.openembedded.org>
	 <CANNYZj8W_Zpae8GjiaJBasg8eQxsyZHDbtK7WFpNHLjZTrPCxQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 22:40:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162869

On Mon, 2022-03-07 at 10:31 +0100, Alexander Kanavin wrote:
> Also, is this going to cause non-deterministic builds?

Yes, it would break if sstate is reused from a system with to a system without
libunwind.

Can we just disable libunwind for native?

Cheers,

Richard


