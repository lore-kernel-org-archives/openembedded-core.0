Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.5573.1617634147215471454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iKUU4giC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so7705806wml.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 07:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=d5uNZxsDGPjLPKVCLkqTwAd0ByiXVtejioa2KczKtrs=;
        b=iKUU4giChQkFlcILInCXQvoeq7qoRNcuRLVXymGiQ4S+lriil99FO34rFlh7Wdiewe
         8UZXYgQqZ5f+coyiSt2sPlsNtj17iVHyBwflx+9azv8y0pBR5vyurc11ax9A9eQY9TtF
         SZf2l7/LVtPqJRzM0uc1CE5UeAaKTIvFdlaFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=d5uNZxsDGPjLPKVCLkqTwAd0ByiXVtejioa2KczKtrs=;
        b=OFwTsrRHLNY20ZzTUbQWsL0huuMgh17L+xiTdifv6MlE9UAt5B7+8f5OWUeklJtlO4
         fYPhXfqLkqkr1hqo++YKyCCn9NXnHz5KI4hR1S5KRyCj6PYEdsRYvv0DwTglyuBRReCt
         IJMUGFWTj5BH1VU1lQGILX+UaXpQ6/UTfngoG+Qok4d9pp3NbxzCpkNZBoOAw4hhbHpo
         pcSumH+hO6SOCR1ZozIEjsY1rASR0L5FUGzUF7pVtls516yiI5EV+gCHkUEsE9OeZOzn
         pByhOpyiReNOADGsZ57ChLRgoMyR01yEVuJMwHPcROn2unYCunVOmR7wrwnIAkeztnVQ
         7tGA==
X-Gm-Message-State: AOAM530WYv4v7Lw8kqLOx9PskYX1u/4IqGev2xof4LYvmAlDWDHEYasj
	MtrrbjNt6pGjZQctbD6BF0fqcQ==
X-Google-Smtp-Source: ABdhPJwgo7zyHKjMrUqCruSjpM+nCVhpyiwKbID9ZHrk+9d2H6ol+jY8z9/YEQFD7GgmgbljISS+Eg==
X-Received: by 2002:a05:600c:44c3:: with SMTP id f3mr11701725wmo.133.1617634145850;
        Mon, 05 Apr 2021 07:49:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1d45:30a1:7018:4816? ([2001:8b0:aba:5f3c:1d45:30a1:7018:4816])
        by smtp.gmail.com with ESMTPSA id c6sm28052683wri.32.2021.04.05.07.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:49:05 -0700 (PDT)
Message-ID: <e2274153af85315f9a45eea15a75e758a21029a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] Autobuilder data collection for intermittent bugs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Sakib Sajal
	 <sakib.sajal@windriver.com>
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>, Steve Sakoman
	 <steve@sakoman.com>, OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 05 Apr 2021 15:49:02 +0100
In-Reply-To: <e3306564-a457-4735-1ad2-0d06a484c8f9@windriver.com>
References: <768fd8d6-09bb-3e87-fd37-267ac9352866@windriver.com>
	 <e2a237d0cc34d56882de9d064287b81858a48a56.camel@linuxfoundation.org>
	 <afde9c35-3113-3663-75e1-791b73eeac65@windriver.com>
	 <9cea6a57043657d69ed020b6d6f773a9b8b69ffb.camel@linuxfoundation.org>
	 <5bf201ae-4bd9-3a80-5917-a09f17521b2f@windriver.com>
	 <f1a4b9050c271bc21e0fb68fe5701efbddcb56f4.camel@linuxfoundation.org>
	 <e3306564-a457-4735-1ad2-0d06a484c8f9@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-04-04 at 15:56 -0400, Randy MacLeod wrote:
> > 
> > 
> > Rather than messing with the main index which is "production", could you just create
> > your own for now for testing? :)
> 
> Yes, we've figured all that out, thanks.
> We'll send you a patch once we've completed testing on our instance of
> the YP AB, early this week.
> 
> > 
> > FWIW I added tmpfs testing for qemu images into master-next (needs ab-helper
> > master-next too) so it will be interesting to compare builds running with that
> > with the previous build bug trends.
> 
> Any conclusions so far?

I think it helps make the runtime testing more consistent but we are seeing 
a number of "qemu didn't start in 120s" messages instead. That is probably
more desirable than random runtime failures in qemu.

We have still seen one valgrind ptest failure with the tmpfs patch too so it
doesn't remove all of them.

It also won't fix the bitbake server starting timeout problem.

I'm leaning to merging it.

I did note that in the 120s qemu timeout, we did get a list of other
processes that were running:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1973

and it shows webkit being built. Would be interesting to correlate against
other failures, see what the pattern of running tasks is.

Cheers,

Richard




