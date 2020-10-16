Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.12896.1602846231756894328
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 04:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HvqxCk3j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id k18so2366301wmj.5
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 04:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NVIULpyuighXvnStET7sEyDqN1dv5RDIL3giFpdit8A=;
        b=HvqxCk3j8O1AQKFCKZlYT7YHEY3pYf+8875cpXsAgJugGqmSIxBljtz2QSoKvKfzUu
         mPD4BxG7qihBQVlk3FKVACUakTPlb2CTPZFY7fTpLWBNmYGD09e7O3fJYICJPqH66P/N
         RnroS+tnNkLgQSghD+z7EKLN0zoBKWjLAmZLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NVIULpyuighXvnStET7sEyDqN1dv5RDIL3giFpdit8A=;
        b=S0dP8qNteBABNX+PcdlSgSJUKN7ONww9jFUipwN+Rr4We8T5K48rCLTHtqxnUeoKF2
         rsyWxB22DBT9j4HozayER75wXz5GCjqsztT4Qsiohq+9cUHH2T5cgdizqKhq4ipaRt/b
         6RrXzP5xV+Ql66GxWmcTh2y/4yU2GSJiKWLE3c/96o3w74b1x1KHAwbgw+NZKc4shhhK
         p/cWsNLwg5PrYDbeFXXv6JACENiu3hLpfGH9DwQ6IoXpDqvaHkIL+/rJlRG/pBmSbNiM
         kk97A2JLUmiqYRz+rLTKN/bDUgJcklamyHjKyKY7pRFabtm9l5RLGe9GOWDS4HWm4te3
         TKcA==
X-Gm-Message-State: AOAM530VIKXzmEwWO+2trJ4gZ33BzxdWUqdtUnb2zMId/Dqt+gwolhPM
	5PWJHaUdFrv8RYwZFBSA61Mp/Q==
X-Google-Smtp-Source: ABdhPJzEJj7pTG5oraOd5y79jqDDVJolIav9RSgaPmwig4vPJG+NGo5YmDOfMfZK3N9BjKDtuKQMXA==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr3056336wml.99.1602846230163;
        Fri, 16 Oct 2020 04:03:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id i10sm3203656wrq.27.2020.10.16.04.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 04:03:49 -0700 (PDT)
Message-ID: <88934dd5a81f6580d484df7f23a9d6264be6fcc8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] valgrind: drd: fix pthread intercept test failures
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Stacy Gaikovaia
	 <Stacy.Gaikovaia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Oct 2020 12:03:48 +0100
In-Reply-To: <CAMKF1spc2tkSxzj1DKwZne8_Q0_2Sef9gqfAToahYLq-ow8P5Q@mail.gmail.com>
References: <20201013144426.888835-1-stacy.gaikovaia@windriver.com>
	 <CAMKF1spc2tkSxzj1DKwZne8_Q0_2Sef9gqfAToahYLq-ow8P5Q@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-15 at 23:15 -0700, Khem Raj wrote:
> I think this is failing builds on musl see [1]
> perhaps you also need to check for __GLIBC__
> 
> http://errors.yoctoproject.org/Errors/Details/509767/

Khem beat me to it!

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2587
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/2588

Cheers,

Richard

