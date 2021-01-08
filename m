Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.1313.1610095936565541788
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 00:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IKsftvNp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id c133so7164168wme.4
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Jan 2021 00:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=6X+qDgpn6TIAZSAdzRDAs0n48aaRP8nAnSNGZ654tQM=;
        b=IKsftvNpTdVPQDJhZj53pRyoNywStxSDf40EJEWmPzT/uRtZ9PihjOS3DLbH2yDU+e
         uYkwOgcZISKMlFJwu56Hl6HYXaRocwAe3PAJdtxG3Wx+5Mp/OpLvyLFQGJU++mDcbrzm
         7hF04ZVL+F0YOzgWTnyXmLTcrBiwdQ4pODoRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6X+qDgpn6TIAZSAdzRDAs0n48aaRP8nAnSNGZ654tQM=;
        b=p/1NqINShw5fqtk2m/zfwhF9Lo+06DYxq81hjk9EtkNVDjeRcScgHVjFCbYULQNUJ5
         GnND+SMVaQVrcO5SlnkKjNSz/1LYdTplPkgBxewsJK+q/SwwQBZDdougceocFm4KYGAK
         oXbS5W6xTi3Tw7xiUQwE51oHtncktIndhtgntysnV6sFd7JRckknsnkCPy+CyiTP63fO
         dyZEJZKGAE6ptAewP0ZyL1olAnHmHPargn+OoTn1z4HM0X1Lzh0YN9mmgq1pquNGBkbo
         2D/qjkWzOI5109TUWrS+zRl9nrdyB3t0WqpiNjvpvb4ncisUPJIt55JMX1OXpRr06T2q
         Zi1w==
X-Gm-Message-State: AOAM530vXYclbT5U/cU1IKRd6fdI6oGClC3skb8X6lWGUQSAc1uGKplh
	HCvICB9ICiHpRKoqjub8zerBng==
X-Google-Smtp-Source: ABdhPJyyvmRPQ0R1d+XSUKC6GRGZIkQbcLeTi1bC2e1V7O4DvfThf81M0VFoEjehfectUTrso25nUQ==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr2135237wmb.124.1610095935097;
        Fri, 08 Jan 2021 00:52:15 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8262:2156:a38b:824c? ([2001:8b0:aba:5f3c:8262:2156:a38b:824c])
        by smtp.gmail.com with ESMTPSA id 138sm12435680wma.41.2021.01.08.00.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 00:52:14 -0800 (PST)
Message-ID: <56862538e3b73683149fcba749ea5dfcedd26012.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: use the absolute path in service file
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <Mingli.Yu@windriver.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jan 2021 08:52:13 +0000
In-Reply-To: <CO1PR11MB5009BC95B4E3E7547D01CFF1F1AE0@CO1PR11MB5009.namprd11.prod.outlook.com>
References: <20210107095630.32609-1-mingli.yu@windriver.com>
	,<b4307af4a02b5d302e06ed776cab0cf84d5ced30.camel@linuxfoundation.org>
	 <CO1PR11MB5009BC95B4E3E7547D01CFF1F1AE0@CO1PR11MB5009.namprd11.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-01-08 at 08:40 +0000, Yu, Mingli wrote:
> This is just configuration change which defines the absolute path for
> the command to silence the warning when systemd-analyze verify the
> unit files and the command may be installed in different place
> between OE and non-OE, so it should be OE specific, will resend v2 to
> mark it is configuration specific.

Why wouldn't systemd-analyze show warnings for upstream too though?

Cheers,

Richard

