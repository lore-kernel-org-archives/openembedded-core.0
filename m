Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FEFC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 06:10:54 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.15171.1671430251549314453
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 22:10:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zc6pWT58;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id q6so12133455lfm.10
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 22:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ied1hIYFCSKUT0iqWIo//CTjnWBCEbAxFQYM5g/lg4=;
        b=zc6pWT58p3JdZcOLLtg6hmDSxqS6lqP/fO0oNyhT8EA0d9IT47OVypU0fBVP1R+cuk
         ERCZXn10IyYy8CVQ3kznUbELzoBO9kr7DlvD8x3f0chv+o5br3eOtCGiCwojOdbpsxZf
         LQhaljZzQI94zrMCa24gfnyPjn/Jc4Hqc6bOTyzCgAaqUJDKy7jjaK7FbDEQOru3XqXF
         gUrAMpA9DyKAsMHi/lVIdbFwiNwn+c8VwiUUSjNVVqnKM6Ve5LtgiFM0lbKpRYXLw9JC
         59ytZk2ZRtTgtv5V0mTCFpNRGoLRDCRcxoe3MhYiG73y+DB3PzqqPsrSzsHixmGaQMDA
         EQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ied1hIYFCSKUT0iqWIo//CTjnWBCEbAxFQYM5g/lg4=;
        b=rsa0HmbEZ0X30n8JWajUFylFK/q4b2l4tw53gOYbFOP2ONaE5Ro/HjLhdAi6eMYT5i
         s2CqWuKMmeNXwlwSWyuhLZ4l/LtAp8ReZrQAZhvgH9DXUFPs2rP9X8TD7CXlx4I3p7f4
         T8Gr8b2MH2AmD7awZAKmAzIObnZ70yaw4MxwBMOT5mHQ02neRQ06Zd5LhXl0Qs45tfqs
         NDDABEGPBi0idPwZYXgdH92WzGspfNhYq714DZvDC06ESCAWgeP6GveRuKpKezIYQDw6
         J9bUtt81IQXL763whsQRr4tZnLeMG4GcgmWLnX6vDKKGNRSRJafO81TT1J5kmRLNtzHu
         QrPg==
X-Gm-Message-State: ANoB5pnriGdbA4HgVzIcL2FOdgDgVug6g6EL6Msf5rJBLxXYEm8vpyq8
	/hYTJb7qCFH0+92Rz/JNEQi3wA==
X-Google-Smtp-Source: AA0mqf4stWbU4+qdH7+XHLw0O2Y6leRxIA44DPpVwsIvbtXJ3p06/LPLxvE9x5LQFXcNkQzX/DwuEg==
X-Received: by 2002:a05:6512:31d2:b0:4b6:e64c:aebf with SMTP id j18-20020a05651231d200b004b6e64caebfmr11480350lfe.51.1671430249744;
        Sun, 18 Dec 2022 22:10:49 -0800 (PST)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id c16-20020ac25f70000000b004b5812207dbsm1009852lfc.201.2022.12.18.22.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 22:10:49 -0800 (PST)
Date: Mon, 19 Dec 2022 08:10:35 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kmod: enable openssl support by default
Message-ID: <Y6AAW42hoFqnr9Ah@nuoska>
References: <20221125150721.1702791-1-mikko.rapeli@linaro.org>
 <67a981b00c4913627f6f6f30f79a58ff4b7dcaac.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67a981b00c4913627f6f6f30f79a58ff4b7dcaac.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 06:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174810

Hi,

On Sat, Dec 17, 2022 at 11:27:50AM +0000, Richard Purdie wrote:
> On Fri, 2022-11-25 at 17:07 +0200, Mikko Rapeli wrote:
> > linux-yocto kernel adds openssl-native dependency by default even
> > when module signing is still optional. kmod should enable
> > openssl support too. This helps see details of signed kernel
> > modules and debug issues with module signing. For small systems
> > this can still be disabled.
> 
> This seems like an easy enough change at first glance, my concern is
> dependency chain creep. openssl is slower to build and for example may
> depend on perl-native so adding this here can cause builds to slow down
> quite a bit more than you'd expect.

But even default kernel, linux-yocto, already depends on openssl-native. The
dependency is everywhere. Tiny distros with minimal features are another
thing.

> I've been holding off merging until I could look at the dependency
> chain and see how much difference it actually makes. I've not managed
> that yet though.
> 
> One option may be to add a "signed-kernel-modules" level distro feature
> or perhaps a distro include file, since I suspect this functionality is
> going to need other changes to enable and work properly?

Signed kernel modules is purely a kernel internal thing. Since kernel
already depends on openssl for other reasons signing modules doesn't
introduce much new, and all the checks for signatures are done inside
the kernel. kmod support for signed modules is just a convenience thing.

And signing kernels with default built-time generated keys breaks build
reproducibility and sstate caching but that's a separate matter which
maybe can't be resolved in side bitbake.. only static keys build outside
of bitbake seem to help..

Cheers,

-Mikko

