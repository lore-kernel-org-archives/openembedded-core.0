Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.288.1615917421957705887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 10:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ITXjDzxb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id g8so15239wmd.4
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=gVRUxPZ8tjDfALM+xR5dYXwS6MDGAz0VUr3kiovUH/w=;
        b=ITXjDzxbAoMGq+44tbWdqChftG+T3Rv8BRDfcHal2lwk6x5ykeLZuOgrkzHo8jh0WS
         D9Jbcf2xcfc6J0lXkga5iyy8iTxCHe92pbj2XZ/XT5OvYjcGOkF8KsOVmEqznmEgQEDe
         rJChrEYrGfLSG84HEWIX8r/7WVmlgBxDhSjO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gVRUxPZ8tjDfALM+xR5dYXwS6MDGAz0VUr3kiovUH/w=;
        b=r04oDJEqsLOwqiTzYjhL2pBHW3H73TONglUnlFlke4179g9Ah39z0bYCa8kMADZrRS
         gJOym+ZlmuQLcQ7XUuHysMg0YxOtB1Dkv2+hnLWo8Ix7M3N4vk0oeY7yEAxlaFxKN2/Z
         DBwAUEbt+6102pKYrN7T8UIZ5+qfNjZ3CpmFMfnvzJuwrnt7wX6KxiwzovityjKY0rAE
         uQuHtPeWTNLR7ar78h1uviPeQC/Q6AKfJAtqdhK+MoYHUBdUpYrGMUtxotSTgI0ABiY3
         llLESVZugiSMqm/H/wQGkPperlvQVShFyphkpom3McIzOXmGHAlRpoTDisZ8jmEbHAHr
         8TeQ==
X-Gm-Message-State: AOAM531bBPl0RRJNyQ0B1JPaEQw6AtN2t/Taqn8eXedMNGFtuQPy+Ojc
	Y90hMshTeNe9OnrqkcaVQa0Z1Q==
X-Google-Smtp-Source: ABdhPJyclosGi0XZ92xZcHgbBCgU8Lyvf1ijWjtK1e2MVI5/TgfXh2UAxc0uU6BoABhChttpcUCuVA==
X-Received: by 2002:a05:600c:4844:: with SMTP id j4mr42212wmo.179.1615917420263;
        Tue, 16 Mar 2021 10:57:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6714:d6e6:f8b3:164b? ([2001:8b0:aba:5f3c:6714:d6e6:f8b3:164b])
        by smtp.gmail.com with ESMTPSA id c8sm119414wmb.34.2021.03.16.10.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:56:59 -0700 (PDT)
Message-ID: <5dcf9ff95e74274d5cebcfe34a0c9de4ce9e886e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] linux-firmware: Fix packaging
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Trensch <mtrensch@hilscher.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Mar 2021 17:56:56 +0000
In-Reply-To: <6409e1bf-9400-886e-cd25-76b52456c8ed@hilscher.com>
References: <6409e1bf-9400-886e-cd25-76b52456c8ed@hilscher.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-03-16 at 07:24 +0000, Michael Trensch wrote:
> Upstream directory layout has changed after update in commit 20a983b9c405b483152f1c600d767e04683dfabf,
>  resulting in some package to pull in linux-firmware base package.
> This may cause an image size increase of approximately 700MB.

This patch doesn't seem to apply against master, could you rebase
and resend please?

Thanks,

Richard


