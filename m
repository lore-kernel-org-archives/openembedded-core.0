Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.276.1588165271092949605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 06:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D5ORdA8a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id b11so2412763wrs.6
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 06:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=AoHEikErWLcGsSuo8nDs6U8OyWufpM9U6XxBGPofv0c=;
        b=D5ORdA8a3mtYsQiAmTZnf4l2Uz6+NV9clfrQvGlfHdcMH1AGHzDHP7O8U8kStTzOAe
         q8iPP9KNz8Abqoa6iakJrZuTnXVlumtGQ02XtTLhs1MlzvFe8aPN6ljRG+3mU6nW/itY
         b+ISPVXBjYJgz/8VJnwce4D3we8FLBWq8gDko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AoHEikErWLcGsSuo8nDs6U8OyWufpM9U6XxBGPofv0c=;
        b=eNQKU8ds1bq+XeSmY4T1G29j5f2LqsLw4oSG6tcpNYTZqt8i6/q9pTvoGCwACsWria
         RFAYu7aLZn6Gx5CBkf6OG1N5EjwKPmEsUfEouuRy1oyWtKtEW6S4xY9vJhJvBFtArbI2
         DA+lD4CIS1gnXuiZLSgQuknWWKo/2Bjnm/pwvGtju1e89xbktSYGP42z+FQITLMwWJcr
         5CJCZ3FmkLDp18SawCR5Elf60eG8maQGRbPzr1j6G5ZuD//8Xl0tbHgwiaHS5PZ6LJCY
         cEme1m8ox8pRaUXPhCsIC90tLb17UnVTT7LVicu0a00UhNPGz4D8s3qr2EajkXkLXREJ
         9vSQ==
X-Gm-Message-State: AGi0PubjcLMjp6sZ4Woi22e6Fd6Ik/3SBXZUqLi1/+v8uUnimYdPrSa1
	zbCaGS8kfBrm9lAqvKtSmBxN5kJHPcA=
X-Google-Smtp-Source: APiQypJSFPD6sd8VYv5RbjBwsPDwaXjgVdzdk/NpLGKKhS2gO6QOvSttWwieq2bRLD60VrfRWUNgJg==
X-Received: by 2002:a5d:498b:: with SMTP id r11mr38921215wrq.368.1588165269047;
        Wed, 29 Apr 2020 06:01:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l16sm29720320wrp.91.2020.04.29.06.01.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 06:01:08 -0700 (PDT)
Message-ID: <73d18db72183f0654ff8f8849590f1539b641cf6.camel@linuxfoundation.org>
Subject: Re: [OE-core] coding style question about obsoleted packages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Apr 2020 14:01:07 +0100
In-Reply-To: <alpine.LFD.2.21.2004290518370.6773@localhost.localdomain>
References: <alpine.LFD.2.21.2004290518370.6773@localhost.localdomain>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-04-29 at 05:28 -0400, Robert P. J. Day wrote:
>   just noticed that, in master branch, kbd recipe quite reasonably
> distinguishes itself from the much, much older console-tools package
> thusly:
> 
>   RREPLACES_${PN} = "console-tools"
>   RPROVIDES_${PN} = "console-tools"
>   RCONFLICTS_${PN} = "console-tools"
> 
> all perfectly reasonable as long as console-tools actually existed as
> a recipe, but it was deleted some months ago:
> 
>   commit 320319f24dd1be300bc89c52b97d1703eab83029
>   Author: Alexander Kanavin <alex.kanavin@gmail.com>
>   Date:   Wed Nov 20 14:44:51 2019 +0100
> 
>     console-tools: remove the recipe
> 
>     The last release of this was in 2002(!), kbd is the modern,
>     supported alternative.
> 
> and as best i can tell, there are no references to console-tools in
> the numerous layers i have checked out. under the circumstances,
> then,
> while it doesn't hurt to have that info above in the kbd recipe, is
> there any value?
> 
>   more generally, when a recipe is truly removed and obsoleted,
> should
> it be part of the removal process to get rid of such references to it
> to avoid slowly-accumulating cruft in the code base?

It in theory has implications for anyone doing on device upgrades so is
needed for that. We need to let this sit for at least a release or two
so people can transition, then it can be removed.

Cheers,

Richard

