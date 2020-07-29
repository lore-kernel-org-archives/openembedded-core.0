Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.6314.1596030213498676365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 06:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ds1kVRJp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 9so2753750wmj.5
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 06:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bSV/gN0oGi5Tee/EIemAbjRSpZUCrNOn2V56wpz8T5M=;
        b=ds1kVRJpgQDhgE2s5K2a7gm0vRRNQw4d2wrX+FKurdkelp3GLl9xXQHBhuYyWfB7KI
         Kj1XSDBMVS3yonpeYvrBUqPlCcsCr4mH/6+FxJdzS2XcTotWITqSHwX06sBTMWQS2u76
         u/vAlJ9FUWfoVciEgTUAMLYjquuhkVkE6u0gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bSV/gN0oGi5Tee/EIemAbjRSpZUCrNOn2V56wpz8T5M=;
        b=WHP8gmHktWecRZ8rsclhpQ0OnFcUj7LmxWmiWszi1cI5oiVLqg8hcc2PuXlx7LfYLF
         NDWtwbushW6QuHTkTAACgI5Js8kkwBXBb0x5IEwGzv0s4Shk74FEqDxYD6myGkMDwU4k
         cGLhZLXPJ4ru/3n8mdjA49MHZr4m/gHkEfjewrTJFCv/OvJk5X3B63Xn+sdAdr5mZ+4m
         ayoHv9knUugKmH+ISUQQ8Fd2SEmIFoxOv4AeGBkvyjgTnD6cOWURVQeUNQ6X39DfSobb
         /ntS5ntckf4jpCbCQicXODSD+xA+u70PfMS9aKSZDvtnEVHY2wizuT87pCFELnVbfUGO
         32YQ==
X-Gm-Message-State: AOAM530aBIs9xe18DzgCgaNp+Ed7Dw5wsIHHLHrlEltieL0ef7ValdKO
	VCSPnrFoyfhaSCBKsEB9WEUqNg==
X-Google-Smtp-Source: ABdhPJw3pfXsCa/HdIevwanIX0mwhFThmlLvnckPwzLlzbKeidkL/GcZgVG1VqYQNUJuwk2z3fv0Yw==
X-Received: by 2002:a1c:35ca:: with SMTP id c193mr8618064wma.17.1596030211876;
        Wed, 29 Jul 2020 06:43:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:20af:3d2:ab93:e15b])
        by smtp.gmail.com with ESMTPSA id 65sm6767618wre.6.2020.07.29.06.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 06:43:28 -0700 (PDT)
Message-ID: <e7a7ee265ac55cf179980f9deb5579b068e12299.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2] ltp: remove OOM tests from runtest/mm
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jul 2020 14:43:28 +0100
In-Reply-To: <87bljyqvzk.fsf@windriver.com>
References: <20200729130916.38764-1-matthew.zeng@windriver.com>
	 <d05d7357b7199a1e787d7f0510eaeacb46740a0a.camel@linuxfoundation.org>
	 <87bljyqvzk.fsf@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-29 at 09:41 -0400, Mingde (Matthew) Zeng wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> > On Wed, 2020-07-29 at 09:09 -0400, Matthew wrote:
> > > Fixes [YOCTO #13802]
> > 
> > Thanks, we can reference the bug but I don't think we can yet claim
> > it
> > fixes it.
> 
> Sure, would something like the following work?
> 
> Reference [YOCTO #13802]

Simply "[YOCTO #13802]" is fine (I'll tweak the commit message as I
merge).

> > The missing log issue happened again:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/908
> > so I think there are multiple issues at play here.
> 
> Can you attach this build's log.do_testimage so I can have a further
> look?

Sorry, that build directory has been reused in this case :( Next time
that happens I'll try and spot/grab it.

> > Is there any way to have the logging logged to disk straight away
> > rather than stuck internally in oeqa's logging buffers? That way we
> > could see which tests had run before a hang?
> > 
> > Also, could we make the scp failure non-fatal, maybe a warning so
> > that
> > when it fails we can look at the rest of the logs?
> 
> I'll further investigate this idea.

Thanks!

Cheers,

Richard

