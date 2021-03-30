Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.2924.1617102643479793402
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 04:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EsXzGJBc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo8164410wmq.4
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 04:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=F1l+FsABhG2+8BRO0Tvpt6/ejjogBBQX+/VNMPOXsAw=;
        b=EsXzGJBc+ANAAVpDuvz685YqKAcW856Ny7YbWR2FdpIg600lU+wOYWuH4TZtc0s7E7
         6aCQTMxLVfwtySuWpOy833/2q8IKFtRvtqdFUzagLEPP50kvEs0wWMeiz84/kOnz1Swp
         wQFg33wl1Qq2C+rLpFBVkSwIk5ftnxThGDiwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=F1l+FsABhG2+8BRO0Tvpt6/ejjogBBQX+/VNMPOXsAw=;
        b=LeigDgithV9PtaMD4WaZRuyCbi4H2NhmhiUtZotv3NOOV7KKXSGczkhBsbeKIFmSbq
         el6PlMSZURnCkevPzkJdapuT03rpuDnDX8JBmlxE6dktP8VXkSqK98TeD+Dv3i24BXA0
         4+NB7vRGJ1arrbMD+PCJg+UKeq7st7y/hE+038FYaNW6+00Z2PwOr5n8IWTRidx17xN6
         Nl5I3i9/DDFyRIC4ZWu0rq59Ky7Z/dIAa0xmc3mM/kGnv1wLkA5u/4hdhKRb2vY8kn3y
         1dk7wa+n2pR5Iau5r5FXjZMo4CmeASGdMKnae+gK/V8OIv9SSS1zA3gMB3pEZAGRxQlL
         WLmg==
X-Gm-Message-State: AOAM531b29Xg655uvrVNGZZSG3LIOZpESwFEzrshm8BtnHpHHYg/vZF4
	+STfQUOxeKC3n8gbsK6N0wwTCQ==
X-Google-Smtp-Source: ABdhPJy14UhMKM9KdDEDy/zutvKmwgKSnrz7nkoHDoYp33uBonHDSZwDT4pLJlduWAkeG7tXiPV01Q==
X-Received: by 2002:a05:600c:4292:: with SMTP id v18mr3487606wmc.23.1617102641911;
        Tue, 30 Mar 2021 04:10:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:cb9f:edc4:48b9:f731? ([2001:8b0:aba:5f3c:cb9f:edc4:48b9:f731])
        by smtp.gmail.com with ESMTPSA id k11sm3009758wmj.1.2021.03.30.04.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 04:10:41 -0700 (PDT)
Message-ID: <5d0a0ca838cba8fd43d3e2b5a3288f03f6ff8c96.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Devendra Tewari
	 <devendra.tewari@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Mar 2021 12:10:40 +0100
In-Reply-To: <CAJ86T=Xn9tLHWrqqr1ZV9rAwZD7sG6x0QsyVRkUSKLwiGQKL8g@mail.gmail.com>
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
	 <9e81b71466b771c55d8859e7d156b662e1c3d4f7.camel@linuxfoundation.org>
	 <CBEFAFBB-3A73-41E2-A177-BBE047E615D1@gmail.com>
	 <CAJ86T=Xn9tLHWrqqr1ZV9rAwZD7sG6x0QsyVRkUSKLwiGQKL8g@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-29 at 16:00 -0700, Andre McCurdy wrote:
> On Mon, Mar 29, 2021 at 3:45 PM Devendra Tewari
> <devendra.tewari@gmail.com> wrote:
> > 
> > Thanks! My bad. The example I looked up in Python docs had a break and I just realized it was a looping example.
> > 
> > Here’s the updated patch (or should I submit it again via git send-email?)
> 
> It would be better to use shutil.move unconditionally in all cases,
> rather than have a separate shutil.move code path which only gets
> tested by people doing incremental builds in docker.

This is a speed sensitive section of code and shutil has traditionally proved 
to be slow so I disagree with that, rename is very much preferred here where
we can.

Cheers,

Richard


