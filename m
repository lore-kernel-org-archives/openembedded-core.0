Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.36798.1585515721114144441
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2020 14:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cJB6TXk4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id f6so12588293wmj.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2020 14:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3cnGqtKj/lD5N9HoCBjB6XNewG0iHzFyU78AE1iMwpI=;
        b=cJB6TXk4qWw1jG/HqvRSXm9b1rFn+sfGFdUzqh7avuVqhG9ksvdc07Zclm0gI+Y36S
         3BiaTGlmVwWBquJmyFIjYzfa54+twTViAdC8H9lgkFG9ywTDL8+sPlEkBsCw1fpHcidh
         94WUA2ucQDxW0YVAVz+aq5SLPWlEA4yvPCUzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3cnGqtKj/lD5N9HoCBjB6XNewG0iHzFyU78AE1iMwpI=;
        b=AxL3NzEDrMUeey8fWJWTjeN+eq5Mf5sxNqG5q7Mi8/bMUT8q+SQS+7+Av5KcE+RjxJ
         caPwt6TT5CP33g+WwLnnBcmB9xJYFmn1rhrZ/n1+ev0+rAS1tVvPJCdiqa04ptQkB/oI
         d7Y4KqLzh1GUw8RL1SdYwrNdeg3wKg99Gsbd3qmp22s4y7zfTlRJKlj5GdugO25XXiXn
         tZJb5RFtF+jqsQ6DIW/GSQf6wSo45aPfsbugmN8fRobvZ0PSC9aQ3IUmxHpf32cpPJfn
         QhvRVLritMCCAkCnd3qB8Vo0lrnKX1L2g1Il2wnrPAy2L8irsvuPB0XOTy8JfETqEa57
         mqEA==
X-Gm-Message-State: ANhLgQ1Dzlxk55UzdT2wVv56g71WpxiFENaeDf2pY5E953hasYd+g8Q0
	L7PU797bm4/flItN6Nb5qVR0zA==
X-Google-Smtp-Source: ADFU+vt1OjKmvWeAxAGdsMYPnzdeoB1u1XSH9t52WDgCW5ox8uOLJu8WtkzskOEfQ+X8QE3rL9MQIw==
X-Received: by 2002:a1c:9ecb:: with SMTP id h194mr10399636wme.49.1585515719764;
        Sun, 29 Mar 2020 14:01:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 189sm14507624wme.31.2020.03.29.14.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 14:01:58 -0700 (PDT)
Message-ID: <46a100482595248f95182aad012fecfecbb4535c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3: fixing bpo-36852 patch for builds on i686 architecture
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: matthias.schoepfer@googlemail.com, 
	openembedded-core@lists.openembedded.org
Date: Sun, 29 Mar 2020 22:01:58 +0100
In-Reply-To: <20200327183701.119401-1-matthias.schoepfer@googlemail.com>
References: <20200327183701.119401-1-matthias.schoepfer@googlemail.com>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-03-27 at 19:37 +0100, Matthias Schoepfer via
Lists.Openembedded.Org wrote:
> From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> 
> The original patch "bpo-36852: proper detection of mips architecture
> for soft float" uses AC_CANONICAL_TARGET to determine the platform
> triplet. While AC_CANONICAL_TARGET exports i686 as target_cpu, gcc
> is using i386 instead. We fall back here to i386, as it is conform
> to the previous behavior.
> 
> Upstream Status: Submitted [
> https://github.com/python/cpython/pull/13196]
> 
> Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>

Doesn't see to apply:

https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1739

Cheers,

Richard

