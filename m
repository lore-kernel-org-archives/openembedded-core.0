Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.12339.1617717402352739876
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 06:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KWmB3H7T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id j18so14335564wra.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Apr 2021 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Kha0YLKsmFPgyIWC3Znvlx7ctD42xNHdRbLWPz1xnsA=;
        b=KWmB3H7TPT/DSOKLm9gAgzBf3NlKAIglqeDtDMgU13TbFxdfhmg1DnQ4D7WaVW08ah
         SedSFb2+HONlDzfw7XcGbbsZTn3SHU+6QYKuxxYaE58bhmb1E7Xs/iBLP3YKGhOnZ2ss
         yO/umR4NLzKj/grX8/9RnOZnxwaWd5D62DTk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Kha0YLKsmFPgyIWC3Znvlx7ctD42xNHdRbLWPz1xnsA=;
        b=LgMROm1xzGHvqykpV96r81Z4cxwYQrSZ3v0BsjapvTw1WIJB3ZAQv0VFPlro+2MBB5
         nq8zy2S2a7U4dEzhiegoIus5oIIheFK4BXLvmleKPu6MzpfJT438i9gFWjdATweybvSa
         sdWlmX1WgcFsnMGCL+u8BSKax52TUwmFFmt7+InQUHHFtZo/pc+l+LlRpxzgkGkmGEhf
         FS5iqmWE9lmyUC8isj4mYTNWLmvMy/4pPxDHr2YO+uS9wT9VlfPJpUEH+860AOzI8kTT
         X5PHL9dnIjjXPNYZ6fzODz2MTzrCYRUjy91hRtcVdMlFDbQMCpCgmH55jt2ZvCu5oecT
         rrbQ==
X-Gm-Message-State: AOAM530CYCdML4vI/cNzY8ipfv+F6+yQGe7D/NcRL4z7277Q/jowXq5S
	pdk55Ql8q9I89HIT/jwWipNlZQ==
X-Google-Smtp-Source: ABdhPJzks2GFk8M+VQX6tcFcBfks/e5S/vvnPgJb2KA7R8K5aLUHTmnNuvive5HcXsuGIJllM3o7Lg==
X-Received: by 2002:adf:aa9d:: with SMTP id h29mr13859489wrc.98.1617717400879;
        Tue, 06 Apr 2021 06:56:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7a9e:d3b:5548:6469? ([2001:8b0:aba:5f3c:7a9e:d3b:5548:6469])
        by smtp.gmail.com with ESMTPSA id d2sm17338690wrs.10.2021.04.06.06.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 06:56:40 -0700 (PDT)
Message-ID: <859e51dbbe40cb44fefb3a53e7c032fa1d4b79a3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/4] u-boot: Support for SPL verified boot
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, 
	openembedded-core@lists.openembedded.org
Cc: joel@jms.id.au, andrew@aj.id.au, openbmc@lists.ozlabs.org
Date: Tue, 06 Apr 2021 14:56:39 +0100
In-Reply-To: <c6e39587-2a84-fe75-5311-81be9f5fae84@linux.vnet.ibm.com>
References: <20210326201410.13906-1-klaus@linux.vnet.ibm.com>
	 <f303476a66be3cc3beea01d3a71e2db1ef1d44c4.camel@linuxfoundation.org>
	 <c6e39587-2a84-fe75-5311-81be9f5fae84@linux.vnet.ibm.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-04-06 at 10:21 -0300, Klaus Heinrich Kiwi wrote:
> 
> On 4/6/2021 7:57 AM, Richard Purdie wrote:
> > On Fri, 2021-03-26 at 17:14 -0300, Klaus Heinrich Kiwi wrote:
> > > This patch series aims at extending U-Boot's verified boot support to
> > > also include SPL.
> 
> > > Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> > 
> > I've merged this, I wanted to say a big thanks for writing some test cases
> > for these code paths. It should start to help a lot in this area in the
> > future. I'm going to be asking that future fixes in this area add/improve
> > test cases to cover issues too.
> > 
> 
> 
> Thanks Richard.
> 
> FYI, there's a patch I sent recently with relatively important fixes (for some
> corner cases) that should apply on top of the patches above:
> 
> Subject: [PATCH] uboot: Fixes SPL verified boot on corner cases
> Date: Mar 31, 2021
> 
> I'd recommend applying that patch as well, before yocto / other projects start
> pulling from oe-core.

Thanks, it didn't apply 100% cleanly which is why I'd deferred it but I've got
to apply and am testing...

Cheers,

Richard

