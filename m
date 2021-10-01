Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B55C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 21:22:19 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.3410.1633123337954122946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 14:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dwM0Gp5o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 b192-20020a1c1bc9000000b0030cfaf18864so7602606wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 14:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xuqyUhuzF/kIjkXWFN3m2OdUWZ2vv65XSSNwSKFGZDo=;
        b=dwM0Gp5odkvQMS4NrFWkjEoOC642IUKlXTKAzN9QkpNbPmRtQWqfZ264X8UkPUXWp/
         95FgBvJafMSVQqy4/qu/lHdjTYegKltMskEGzvUg9nPIKBV56/Hi+tFPJ13t/lIycfOw
         7e90bNCfGXVhzSYd6Ob9rSYimChgiNERWJm0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xuqyUhuzF/kIjkXWFN3m2OdUWZ2vv65XSSNwSKFGZDo=;
        b=xue5ZoBXGEzCS/qlM8m7Ru44GOCIR5dKEIFTnEuybnJ3UqE5XMTqP5pWlMt/2faNbG
         nFA7JvKUzHl1GoC+wPjsXEbuV3Y55xhVwTHUpmzLeDaQTqs5fV/U8gQD6CJDjb/IVw4V
         ZNuq6mK05ttenf4xBHgekOjoXnKnoUyr2g4s1azUYM6QftJ4o9t4GSdzipxA+UR5gU+z
         /8dPD/EzLokWI8KDrn7IkJWbRU7JYhpMB37pGQyxoFp1LfCF0SiiRtL1g7JXlZTwbF7O
         ExCd7rJQI/r7Pe6a4d6uLeMvOqQi7sUBDvQZkSaHkzNoJeyoVTd0tT15PuX9MwKwFjLR
         H3wA==
X-Gm-Message-State: AOAM5314Ib5uK7bAgRCslnsU4hExgVfcmU9ym1ktXDd2kd61sB4I6fhq
	FhBJYQ5TnbAyGLW74LOB/I9rqGrv4ARZ3feH
X-Google-Smtp-Source: 
 ABdhPJzC5pPQKpf9F5xgxchqV9wIUED6rD02X3ygHH2zf+xI2o7h9SR9YFof96QYJsfSqdmKH2TMdw==
X-Received: by 2002:a05:600c:2304:: with SMTP id
 4mr6986691wmo.57.1633123336382;
        Fri, 01 Oct 2021 14:22:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bdad:e899:5209:16be?
 ([2001:8b0:aba:5f3c:bdad:e899:5209:16be])
        by smtp.gmail.com with ESMTPSA id
 k17sm6885109wrq.7.2021.10.01.14.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 14:22:16 -0700 (PDT)
Message-ID: 
 <36d941eba37cb262bc5e6463c1fedc8464aa7585.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/1] fix pod2man errors in binutils-cross
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Guillaume Champagne <champagne.guillaume.c@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 01 Oct 2021 22:22:15 +0100
In-Reply-To: <20211001180429.6069-1-champagne.guillaume.c@gmail.com>
References: <20211001180429.6069-1-champagne.guillaume.c@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 21:22:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156533

On Fri, 2021-10-01 at 14:04 -0400, Guillaume Champagne wrote:
> Hi,
> 
> when building binutils-cross-x86_64 on hardknott, do_compile fails with:
> make[4]: Entering directory
> '/builds/project/tmp/work/x86_64-linux/binutils-cross-x86_64/2.36.1-r0/git/build.x86_64-linux.x86_64-dist-linux/ld/po'
> make[4]: *** No rule to make target 'all'.  Stop.
> 
> Seems like it's caused by error:
> /bin/bash: pod2man: command not found
> 
> which appears multiple time in the log. The following patch inherits
> perlnative in binutils to make pod2man available.

The question is why/how is this working for everyone else?

Cheers,

Richard


