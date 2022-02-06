Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6B2C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 08:13:17 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.6646.1644135188028299786
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 00:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I+WwaYYy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so6582388wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 00:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=wWwyyKJDwv/70WlMAnORj1aQJM9fJrxR8+7E2Znyipo=;
        b=I+WwaYYym/tpVeuX0loe6B2J9/Sz8C1+mtb+1nw7yNDUzMtuzQrclcnFD8Pqm/eN9J
         Lq7qp0v2Tg1zB+7cd9J5IDcZh+DI5p4JbIOJk2FO6VS9AXedz4InTE8O7pc57CtRwicg
         LzMtKPBYgmAT9NlgS2+Uw6nsjwkAF/EPw/ESY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wWwyyKJDwv/70WlMAnORj1aQJM9fJrxR8+7E2Znyipo=;
        b=ARMPugz6N/Bd7n3VhXA/f4cg2OM2X6/UIcDVs2Pwo9WqreKRIWv/2XWPywdtqU0fSQ
         68O2xUuC9NmpF2tdMppqCfvyFSiwsQ+SpsOjbpvw8lqeZCZuh+yslPHXIvD55EH/dgWo
         r6FwlpuwmBITR5f/fty0/xfrZw74N3PevnUuMZdz/SCBVzW5l31Wqv5IYd5beSLljjXJ
         YnaDRBvHZ9SKZ9An0iUJw8waTFiJ5ct9FQgzfTHlM8ScjciViqBXUrrB9u3t5E7Yvxp0
         9hlmU4UIf1AtWiXAHTfow0Zu0OzypY5Guz1X/8ORy4EaUdu82HHfjrE1x0cCDuhMFwKH
         1B3Q==
X-Gm-Message-State: AOAM531aSVtg/cZ23TwX245VRYSgiFB6xUYh3l2lkbjxcFi+S1skcOVv
	zY09Ykzj/opwo+AnBhZxp+WPvw==
X-Google-Smtp-Source: 
 ABdhPJyPGPfhlbHjStH740SVCGBnxetE71JfKAW4KoFAfgVmM8LmGBqnhsu9wgRnk2wPWKus7DXdyg==
X-Received: by 2002:a05:600c:35c8:: with SMTP id
 r8mr9437310wmq.142.1644135186687;
        Sun, 06 Feb 2022 00:13:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aabf:a020:d9fb:13aa?
 ([2001:8b0:aba:5f3c:aabf:a020:d9fb:13aa])
        by smtp.gmail.com with ESMTPSA id g7sm6717324wmq.3.2022.02.06.00.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 00:13:06 -0800 (PST)
Message-ID: 
 <d94531cb509781ddb13745462054f2c9a6f52203.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] glibc: Upgrade to 2.35 (RFC)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 06 Feb 2022 08:13:05 +0000
In-Reply-To: <20220203200203.3703888-1-raj.khem@gmail.com>
References: <20220203200203.3703888-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 08:13:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161393

On Thu, 2022-02-03 at 12:02 -0800, Khem Raj wrote:
> package up /usr/bin/ld.so
> 
> ld.so is a new tool which is added as a symlink to original dynamic
> linker so make it available with same name across architectures which is
> useful to leveral features like  --preload, --audit, and --list-diagnostics
> more accessible to end users
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

We have a couple of test failures with this change:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/4720

mulitlib due to overlapping ld.so

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5027

and some issue build building openssl-native with a buildtools using this
upgraded libc. I do read that the WNOHANG from perl like that is causing by
exception handling so we'd need to see what the real error was.


Cheers,

Richard




