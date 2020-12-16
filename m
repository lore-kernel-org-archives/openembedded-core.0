Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.742.1608144516331208610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 10:48:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HRm3AbS/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id r7so24191796wrc.5
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 10:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=pY8zwk2UjSeQDZ1BN+wSbXA2ROGfNOVzDVOXygJcGh4=;
        b=HRm3AbS/M5PjIzDvG3U0RJRKqcNJSnSO/RObzn6u6zGy5c8FzIIDOCdaiJDhOyfkGe
         +wqVvzAiPQe/FH7huwPRIDoaI4TFmXa5807OALlE+FUS1nM1XYRToz0JlfqKWto2N3XT
         /kpDUFAP8Ab16/ytNQ8iUvjNmDD0x7lizvGkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pY8zwk2UjSeQDZ1BN+wSbXA2ROGfNOVzDVOXygJcGh4=;
        b=q/qpyjSbZs74ZIs6b3pEqdi46POYcaZs1scJKwA4lyR0jFL5IRso1ZuUKR8YQQMZQ2
         p/GKKDacjCvHYyVHpdnO3cMWUBZ+7SXgpHK2YAC2R0yoxhLY512rxDDgYGq23kHvK/KQ
         Cq6wABT2dqlOgbyt0ARsX18kLNFaSanoXIDPx1RnCOpWHzZ27f4HBD95KQgFtXy3jACP
         c/uq5ob41t8RIXWL0/FiS3fV0OL03oBIFeSYVnyE4i9JygFu3P2V9BLbktAHMypFdyV1
         S0WsAIYFfS6f90LbBjQcnww4RYz3EbQq8Se7TRrYInw6mdjxMff7QS9yO4BLppXXlRfR
         6Oew==
X-Gm-Message-State: AOAM531QJkM1Ze2cM9UeikNlXUxj5Awy+W226oKt+TAxkPozy2GnTFs3
	ScPhCp6XdF7AbHLlAGqzncg+HA==
X-Google-Smtp-Source: ABdhPJxFOdYrmDCZnEF4usmoDAO/P35VvMy58sUYF4JrC1zh4ImtsW7bAIrdEZRm9bQKJjG4BjTSrA==
X-Received: by 2002:adf:bb89:: with SMTP id q9mr41016683wrg.250.1608144514672;
        Wed, 16 Dec 2020 10:48:34 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id u10sm3780016wmd.43.2020.12.16.10.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 10:48:34 -0800 (PST)
Message-ID: <4b87a0b82519d736251bae6088707629d7f33cf3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/5] systemd: update 246 -> 247
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2020 18:48:33 +0000
In-Reply-To: <165144ABA68FE046.22063@lists.openembedded.org>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <20201214123457.122655-1-luca.boccassi@gmail.com>
	 <165144ABA68FE046.22063@lists.openembedded.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-12-16 at 18:07 +0000, Richard Purdie via
lists.openembedded.org wrote:
> a reproducibility issue in oe-selftest:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1651
> (which did happen last time as well on centos but I don't think was
> reported on the list, sorry)
> 
> These urls may help understand why its not reproducible:
> 
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/packages/diff-html/
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/
> 
> (looks like the uid of messagebus is changing at a really quick
> glance)

I did look a little further, the messagebus thing is not the problem. I
think the issue looks to be that systemd is conditionally adding some
code to a function on centos which changes the size of the .text
section, then that results in the other changes. What its doing on
centos and why, not sure but it sounds like host system contamination
of some sort.

Cheers,

Richard

