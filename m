Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.1984.1610705689361920598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 02:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gxic5rBt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id k10so6826970wmi.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 02:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8aPK7VCd9o4sUfBWo1hOnuzDM6Qi7AI55UAPMm/oLKU=;
        b=gxic5rBtqWTXS+AlFDhmqABgr/TpOs3U1i2b3gx6elHLiD42sPVSfF4LMCGA79eN/1
         ULijUJHJ3cA8YK5p4/J19XP7n3OAdjWWcTVx+I3eQ/ticVABQkF8X3rw8j+dGDY8ppDw
         +Cb2B0ELHBPbR+oAu6/+nCDs/mRnWcXhWRYWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8aPK7VCd9o4sUfBWo1hOnuzDM6Qi7AI55UAPMm/oLKU=;
        b=ZYX5GzmVe98nujpMN+bEn92kY46GcwmM1i/Bcu6ZxyM0d9vhKDQIqaNHgdEfbn3mf0
         +8yKjzh2YxdSCTNBiopKVr9yEBE597PPgEjEh/bjx6Q24G3taGtP6KHc3AL2EW9+pVuq
         ZycmoMqcNeMXy/PLTXPkXdbU81TEUDu97C4bk1fF/RSSRR6JlXYSafuAvqj3/JRxn3eg
         PtRmIhiJlfPF4YORT+MLnnzuBimKzi/hIkjWNaNAxyzadLp45txJfgXA9sdzrRajIFKS
         tmuMJsaF8FJhNUi+adxAKuq4CVbkGnT4Uni4jZ6E0UfOBep/p0IgyFpEIK77a5mUQY/O
         Pt4A==
X-Gm-Message-State: AOAM532Mqb3K241+39r7Z+G8u9nQsYQkHgb7BOWTg10CcR1pzU6zPt40
	mrxqFqdu4arSRq7J25XIwcfEtw==
X-Google-Smtp-Source: ABdhPJyxnWoXrIn0F3wOEXqdVuZLqTLB/orgFCFXQRK4ggQYW1WAVt1iOxlFPSU2gBlutRNkKvZM2w==
X-Received: by 2002:a05:600c:350c:: with SMTP id h12mr8010533wmq.79.1610705687780;
        Fri, 15 Jan 2021 02:14:47 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:974a:2423:c71:b423? ([2001:8b0:aba:5f3c:974a:2423:c71:b423])
        by smtp.gmail.com with ESMTPSA id b14sm14149970wrx.77.2021.01.15.02.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 02:14:46 -0800 (PST)
Message-ID: <45a86d715c0f75f28f38cf8883204d819c3a9d0f.camel@linuxfoundation.org>
Subject: Re: [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <Luca.Boccassi@microsoft.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "paul.gortmaker@windriver.com"
	 <paul.gortmaker@windriver.com>
Date: Fri, 15 Jan 2021 10:14:44 +0000
In-Reply-To: <a81ea7e632a26636d966540a86ec1978f557e63c.camel@microsoft.com>
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
	 <12145df57b9fdec6933497849a2d8b40fcb8a023.camel@linuxfoundation.org>
	 <a81ea7e632a26636d966540a86ec1978f557e63c.camel@microsoft.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-15 at 09:57 +0000, Luca Boccassi wrote:
> > https://wiki.yoctoproject.org/wiki/Best_Known_Methods#Patch_Comments
> 
> Richard, FYI this appears to be an empty page.

That wasn't the link in my email, the link was:

https://wiki.yoctoproject.org/wiki/Best_Known_Methods_(BKMs)_for_Package_Updating#Patch_Comments

The brackets in there may be causing some kind of issue?

In case it doesn't work, the page in question is titled 
"Best Known Methods (BKMs) for Package Updating"

Cheers,

Richard


