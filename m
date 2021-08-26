Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.33206.1629995117175837400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 09:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YK36nn7H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id z4so5986976wrr.6
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 09:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=IPi20Uk/BsYzJqCvMPQzM/PqESZbeYBstC7ia55q/dE=;
        b=YK36nn7HkFYxIf3JliUaPa+vio1Dg7aZmaderWGtyLsuRC7RI0TObCfpBRcWscn4/0
         pkqVDzXtYYH7WIp7nTLKiyc/LNWy6kctwPFwQhZ4a7Q+34RpeAM6FUEmUwxCe32nL/li
         mRDL7UrjWrC7NYq8XkCd8yMv5IeBn8irP5Cbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IPi20Uk/BsYzJqCvMPQzM/PqESZbeYBstC7ia55q/dE=;
        b=lHAUqLeZUPBSl6HjvQFD8EZtEzVTyepDugM34nmzsbxPtFS9qcuKDxJ2j8yE8hx8/4
         eiTFv2nZKE+08qBFpnMYeysEsRHEHbf/uxBiNKj1eI7d7Fn5IynqRMtdizf5EX08UAL7
         vPL89AD0Q130VHzAVQEQCgp4PHl1dW52FKJ3LHB3s2Ju9hhsn0YHyuNN6ynrVqr1nDio
         HzgH86G98QtJCXTNLjiyJOkIEysPaBJMnvDAwY1BfIOHSGaAGypbKfpaBamLKSOzPW+P
         wzDiL7gFtUs5YFDyDC8P7kFcblo3qYjsJE69dtVwVrqRvCFIefLpmfF3eqC9uSh44Z8o
         df3Q==
X-Gm-Message-State: AOAM531P9GLqZpbtQo4H8q2KnTxjMAqVPnlV8cGDR2jevmLgSyCPhfIr
	o58Os27ymcLITWSxfy6L7josXQ==
X-Google-Smtp-Source: ABdhPJzlRTAYOS68YUmvNmmlHALbh4iBIz9bT1x8+jeQp6Yoi9RwtV2lsx1FZkCsBDwItqPFPBIEEg==
X-Received: by 2002:adf:f101:: with SMTP id r1mr5033000wro.355.1629995115668;
        Thu, 26 Aug 2021 09:25:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4? ([2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4])
        by smtp.gmail.com with ESMTPSA id y4sm3022725wmi.22.2021.08.26.09.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 09:25:15 -0700 (PDT)
Message-ID: <06310ae3618ccbb469ab025784da5b023704f2f7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] glibc: ptest: Add support for running glibc test suite with ptest
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Nathan Rossi <nathan@nathanrossi.com>, Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Adhemerval Zanella
	 <adhemerval.zanella@linaro.org>
Date: Thu, 26 Aug 2021 17:25:13 +0100
In-Reply-To: <20210826161212.12024b6b@ktm>
References: <20210823150853.2817-1-lukma@denx.de>
	 <20210823150853.2817-2-lukma@denx.de>
	 <ada9987d-399b-7a73-2aa5-c09dcca41fb3@gmail.com>
	 <20210823202414.731c6749@ktm>
	 <CAMKF1srLFY_R4KX3gG3hZMhZNtjSN8D4mEp0Wwr78Se9RE_20g@mail.gmail.com>
	 <20210823220926.37d87121@ktm>
	 <CAMKF1sqKH=RiOn-WVp_=ZQmLnSJ43VUUfKyv+E1KR9bCn01j3Q@mail.gmail.com>
	 <20210824093601.768c0c05@ktm>
	 <34041d492af033ff34a273e07057ea9c767cabf7.camel@linuxfoundation.org>
	 <20210824104213.6be82b74@ktm> <20210826142749.51466c70@ktm>
	 <2beacaf42a7970cca6fce14c2200184b9d852446.camel@linuxfoundation.org>
	 <20210826161212.12024b6b@ktm>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-08-26 at 16:12 +0200, Lukasz Majewski wrote:
> > On Thu, 2021-08-26 at 14:27 +0200, Lukasz Majewski wrote:
> > > 
> > > Do you have any more feedback regarding this patch?  
> > 
> > We're at feature freeze and this wasn't a planned change so it is too
> > late for this release cycle,
> 
> I see. Thanks for the update.
> 
> BTW: When one can expect the Yocto/poky would accept new patches again?
>
> 
> Honister is going to be released on October 2021 [1]. After this date
> this patch is going to be reconsidered?

I'd expect new development to start being looked at around the time of the
release, yes.

> > I'm struggling with the things that were
> > planned.
> 
> I can imagine that after the "override" change a lot of attention is
> necessary.
> 
> > 
> > I need to spend some time looking at what the other code is doing and
> > how we're using it on the autobuilder and whether we want to change
> > to use the ptest approach or not.
> 
> I see.
> 
> > 
> > I added Nathan Rossi to cc since he worked on the other code for this
> > and may have more insight.
> 
> I do hope that Nathan will provide some valuable input as well, as
> wrote the glibc-testsuite_%.bb recipe.

If you search the commits, e.g.:

http://git.yoctoproject.org/cgit.cgi/poky/log/?qt=grep&q=Rossi

you'll see he also worked on the gcc/binutils tests I mentioned.

Also, I'm not sure if you found them but these are run on our infrastructure
here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/3877/steps/19/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/3892/steps/20/logs/stdio

(one of the above uses user mode qemu iirc, the other uses system mode).

We then get reports like:

https://autobuilder.yocto.io/pub/non-release/20210825-18/testresults/testresult-report.txt

Cheers,

Richard



