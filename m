Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.10987.1585920976939339890
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 06:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RnkbVyw9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id c81so7183472wmd.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0//ZjYKPvX2/mBIP1ySGrcLV6ouNrf//zfR2v8Aak+Q=;
        b=RnkbVyw93F3HRZVGr3mwUqzQD/uqRUh+7TYEC8tc9dg1fQmzgKJvs3pjdyurBqsemB
         qwF0tDqTjDd6An2Ae7Yd4vaAMSDlhL7dP81Mwt/hRB+zsId5uGxQi/8vpoETCQgp3hWX
         V64uzfXnPYlEiFtU0CXsA4aPbeHb0CSotwVdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0//ZjYKPvX2/mBIP1ySGrcLV6ouNrf//zfR2v8Aak+Q=;
        b=gQsT29jB5ielDCV3L0/yN/2rJnTzmGu/6179BZ6ejiO8gMm3l8zK0W+EQXhaprbU0s
         rjA9lkOglNPbBfeHPfCrum32XLLvWdfBD9/2khiGDBG6Ihp0G7C+6P+lIpMR0Ff28sWN
         k1Vi202odVm5aTIr4MXKxE1GVdKKff/MzANRU46qAPsfH8MpRB18YbrjlqWEIt73fm50
         qxuU13P1EaQ+NMJ+VzFrv6PFnV2jnI53D/wxA96785mxcfBKa5OCtF8JWqBfqkFjTCwU
         JMpBh89ubHMRLo/cpnSOi8Pc59gnpEI01LtfDMVhYjVokF1eYOnUgN4Dnl3NNJ+nx6LE
         HK/g==
X-Gm-Message-State: AGi0PubtIAY9wlwcvC7OgbgrdgdJZiV2VyV+xKM8eSelv6JVqdiUXUms
	cbpNdVki0Uy+SnKspvHPJKCOrg==
X-Google-Smtp-Source: APiQypKB27zqaO3ie2HzKnOVwrSh/w1NFpzBZyC+IHs5vsp+YPjmT/eOedS26tnQl3rEGCR1pdMfTA==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr8254447wmi.29.1585920975464;
        Fri, 03 Apr 2020 06:36:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 19sm11490385wmi.32.2020.04.03.06.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 06:36:14 -0700 (PDT)
Message-ID: <b409429b4afa97ddeeeec6313fb7315110775f9f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] file: explicitly disable seccomp
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jan Luebbe <jlu@pengutronix.de>, Ross Burton <ross.burton@intel.com>, 
 Khem Raj <raj.khem@gmail.com>, Martin =?ISO-8859-1?Q?Hundeb=F8ll?=
 <martin@geanix.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Enrico Jorns
 <ejo@pengutronix.de>
Date: Fri, 03 Apr 2020 14:36:13 +0100
In-Reply-To: <9464fbdc93aa48aac796a3ea44e04efcd9564963.camel@pengutronix.de>
References: <20191018112819.16210-1-ross.burton@intel.com>
	 <CAMKF1soy5adOpd49H0dTqtwu=vSRc0EPMnXFvD5uQTaJd+JCig@mail.gmail.com>
	 <1615697b554b612f329820f2b3f692011b7722ba.camel@linuxfoundation.org>
	 <9bac0b45-777c-faba-f448-d2d03c7e6fac@geanix.com>
	 <CAMKF1soa5bEfN23uPAhDCk4rfD_OGjaf2xR+m5ET9cLt+kOn0Q@mail.gmail.com>
	 <f6cb669c-d302-c1fa-e2ed-5995b82677ed@intel.com>
	 <9464fbdc93aa48aac796a3ea44e04efcd9564963.camel@pengutronix.de>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-31 at 12:57 +0200, Jan Luebbe wrote:
> Hi,
> 
> On Mon, 2020-01-20 at 17:10 +0000, Ross Burton wrote:
> > On 20/01/2020 15:45, Khem Raj wrote:
> > > pseudo needs some love since it alters syscalls which go out of
> > > bounds
> > > what is allowed by libseccomp until then pin your file version to
> > > 5.37
> > > in arch till a supported distro is affected by same problem. It
> > > wont
> > > be long better option is to fix pseudo
> > 
> > That's not quite right.  pseudo LD_PRELOADs itself into file, and
> > makes 
> > syscalls which are not whitelisted in file's seccomp configuration.
> > 
> > There's nothing pseudo can do to solve this.
> 
> I stumbled across this thread when checking why libseccomp is not in
> oe-core or meta-oe. It seems to me that pseudo could intercept the
> seccomp(2) or libseccomps seccomp_* function calls and report them as
> unsupported to simulate running on a kernel without seccomp support.
> 
> What am I missing? :)

I made a guess at a patch:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=d675ff53d3ccbc6bd7db5f067d331bf3f94de5cd

Just need someone with a system that can test it now!

Cheers,

Richard

