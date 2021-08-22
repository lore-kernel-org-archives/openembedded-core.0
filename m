Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.9669.1629635898156068959
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XF71UZek;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id u1so8797270wmm.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9D7UGxm12W4gflOsnSu1XLbQ13KDYp9DSKEHS5jjrk4=;
        b=XF71UZeklv8MKXmMleyamvU/wM4BNYhYFVPNcZ5r1SRAeW19gjSs7vTuvJY4gBSsF6
         bF0F1tkk+qWTzXw9sIIBY3S40UrjdtIc/aQJGWEJ1dcGgviLL2gMX6yQ7LVI7aSl9G5R
         2O/l4i4CalZ3N1EhlptzQidXOwo07qdokYjtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9D7UGxm12W4gflOsnSu1XLbQ13KDYp9DSKEHS5jjrk4=;
        b=cOEkyRNiEOg/R4eWZWEJkmut1p6WzaZt8JzCGkHLMpAW+/Q9yGVkGJcTBDhHJBcGwi
         w8M6p3LVTsPgSK3r8EIAY8MYWHKBNj9prh3DowlIY3KRA90o2sy45v55Ah0jSVOhac7x
         sASEhxZKnPsdxMsf5Ftan4Wfz2KHWKsOoyUiHVMzLv1qZqgfXwO247DKL0WN4OQ4F9Zh
         +Edyj1R27w3mAlBsHb0K8lAnE1qsnrwrR93fYYk6Cgn4fD3rkEWGL+8aTmUxNCEyPhix
         bNBNGFcWgotd6pTDnhp8zoRSGAF5YGGKqeDaqtBh++hXhTMeHYnIvmCqbCfMJqaM/QFw
         rMSg==
X-Gm-Message-State: AOAM530lc184TwFZyMrLQNNwF82s1o0Ne6+WUaA6U2vaTmW1Rw3eqpP2
	1LTTECElWjnemXD9Ng9i2G+BJQ==
X-Google-Smtp-Source: ABdhPJwg+ERbG/n1UJA5kdgZl/1n/LrPb6IMmIV21bt6nCwv7iSDD8Pz/CjOo7niv401caNZpti59Q==
X-Received: by 2002:a05:600c:3b08:: with SMTP id m8mr11909270wms.32.1629635896392;
        Sun, 22 Aug 2021 05:38:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9821:d2f9:6401:2f3c? ([2001:8b0:aba:5f3c:9821:d2f9:6401:2f3c])
        by smtp.gmail.com with ESMTPSA id g35sm17623000wmp.9.2021.08.22.05.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:38:16 -0700 (PDT)
Message-ID: <1f03b728ef1cdda6f8b9a9594de7321e7fa74365.camel@linuxfoundation.org>
Subject: Re: [OE-core] [v4] [RFC] Merge meta-rust to oe-core - Aug 19 update
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: steven@stevenwalter.org, johan.anderholm@gmail.com, derek@asterius.io, 
 cardoe@cardoe.com, dev@codyps.com, tylerwhall@gmail.com, Khem Raj
 <raj.khem@gmail.com>, vinay.kumar@blackfigtech.com,
 saul.wold@windriver.com,  martin.jansa@gmail.com, paul@pbarker.dev, Trevor
 Gamblin <trevor.gamblin@windriver.com>, anbelski@linux.microsoft.com, Vinay
 Kumar <vinay.m.engg@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Sun, 22 Aug 2021 13:38:12 +0100
In-Reply-To: <169D9CED4738B0BB.18298@lists.openembedded.org>
References: <aa7653eb-336f-ee08-3126-e6c790a9226f@windriver.com>
	 <20210813151947.55142-1-vinay.m.engg@gmail.com>
	 <CANUMPcXHhkPrtXrfN5rfzctXEy8h-Hi4L+vKmaAmPSgC33udcg@mail.gmail.com>
	 <169C1FA457B99CA0.23238@lists.openembedded.org>
	 <15a0f2e3-dbad-2512-3e5e-f2b84c946964@windriver.com>
	 <169D3274AAECC435.19323@lists.openembedded.org>
	 <fed5f2e5-000c-b7be-1d0e-2dc26afa6bd5@windriver.com>
	 <169D9CED4738B0BB.18298@lists.openembedded.org>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-08-22 at 12:19 +0100, Richard Purdie via lists.openembedded.org
wrote:
> On Sat, 2021-08-21 at 23:12 -0400, Randy MacLeod wrote:
> > On 2021-08-20 10:48 p.m., Randy MacLeod wrote:
> > With a patch from Richard, and the http_proxy check removed,
> > $ git diff | grep "^[+-]"
> >  --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> >  +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> >  -http_proxy = "http://example.com/"
> >  +http_proxy = ""
> >  
> > we have fixed the oe-selftest that was failing.
> >  Any volunteers to stub out the http[s]_proxy code in cargo ?
> > I've written up a commit log that could use some review and pushed an update
> > to:
> >    
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-redo-aug-17-2021-a
> > 
> 
> 
> I'm not sure you need to change cargo, I think if you remove the bit in the
> bbclass that injects http_proxy, the tests are ok. That will perhaps break
> anyone using proxies but for now, I think that is a reasonable step of getting
> this moved forward?
> 
> I think there is one selftest issue left which is a multilib one.

Ignore me on this last bit, its other local stuff corrupting my test, sorry for
the noise.

Cheers.

Richard

