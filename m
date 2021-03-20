Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.7573.1616265998785970638
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 11:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C9YJbSL4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so6952621wmi.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 11:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zisOz/ii7QS44yH6vp0JAsO3vdxn2y/9SAcRYBSO7Bk=;
        b=C9YJbSL4E8wEhBQRT02uXmsbafvsYGq7jc3UbEH/fpD7lD/hblVeU4tfp9g3n+8T7t
         BJSencbdOqVS3MHJw6jF5e5Zn/do3u8gjTf5pfJCLEuctmFkEO3ZsuXP+yxnlWIBfTFt
         0+tUjUr7D+CV3oho3jQFWJ7V884khett5rul0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zisOz/ii7QS44yH6vp0JAsO3vdxn2y/9SAcRYBSO7Bk=;
        b=CBOVJt/7HK4oQf7FaRO6F3GJ7xKNm4DEGA0pNISAtu8cMaMvAkgOk5LA0kCBb8revj
         my9v9wa/Ql2weEO9zCwhHdwwIfHE85mBzF7ru95FxU8trJByr0KPut0fwrFQ5glGPtpm
         LUcmx4y1Hij05X2VeWLEnQft27ByyqUossHfev0R4CCNfb6jVC3TybzWcHlfwvC6zY2k
         99H6LKhwg/V+Dadbc6FmtRdOjiWGT78fGmkyp6hPRuxlDhZTH9wDSYuK48vHibENUJqe
         ZL1Ku4pWXbudwLQpkrDbI/0xITFr8wL1BJe4o2XTvRSZQWH4BhvkREqN/QvY7YDThLGa
         sRvw==
X-Gm-Message-State: AOAM530V/2GgIWSPpluhwRPHhqkDYlpm7Lbq24qiPuqLV6AAnqxOQ1sr
	vgKZ7UoE/5A3VnsTocwiMEm4wQ==
X-Google-Smtp-Source: ABdhPJzoUh1D+ewVmr2MO4UDPt/k490quwFZTPrEIbIu4t/jWmPavzDGfSVA3/o6dJmz8KuOMGxqhg==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr8845451wmc.51.1616265997271;
        Sat, 20 Mar 2021 11:46:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
        by smtp.gmail.com with ESMTPSA id l9sm10680158wmq.2.2021.03.20.11.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 11:46:37 -0700 (PDT)
Message-ID: <4b2e982aebea49636f7f6db4381c17d4c7eb2a63.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/8] kernel: consolidated pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 20 Mar 2021 18:46:35 +0000
In-Reply-To: <cover.1616180065.git.bruce.ashfield@gmail.com>
References: <cover.1616180065.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Bruce,

On Fri, 2021-03-19 at 14:58 -0400, bruce.ashfield@gmail.com wrote:
> Here's my latest batch of bugfix and prep for release changes.
> 
> We have one configuration fix, as well as a fix to the tools that was
> hiding some warnings that we used to get.
> 
>   ** There's a chance that this kern-tools change will pop out some
>      warnings. I can fix the warnings easily, but if it does, I'd suggest
>      just dropping it from the queue, since nothing depends on it.
>   **

There is a warning so I'll defer that piece for now:

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/3227

(maybe needs a yocto-bsp bump?)

Do we know the cause of the beaglebone regression btw? We don't
really know what to do with M3 due to that...

Cheers,

Richard

