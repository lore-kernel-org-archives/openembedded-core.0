Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5A4C433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 12:39:04 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.20138.1644755942923538630
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 04:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NRDsFqBQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id d27so22679521wrc.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 04:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=C2SPKas6glullyBfqbyMIxB6ipvd+SldUJyl3s05Y9s=;
        b=NRDsFqBQgjL8SwJ+OgVz3bp+TODHnVfr8fZnoRbJWkcnKWBDa7X9t+QyHIUk6qtdUG
         ENTL3BpUhIDmOK7msmLGF2F61xVjxOVmGBwg+n/QwK0mhSXnrVYaq48n4GrlQuNCdS0R
         Mkfyfn2zKjdTHBIjYJwvFbfLstPvihAXdoFxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=C2SPKas6glullyBfqbyMIxB6ipvd+SldUJyl3s05Y9s=;
        b=EBPOaQJXbdET8s5Vs3bINz6sxbgo8k1Be4NR9EypFFOetSULAn9uZXA25g7doJRQNs
         4Jppq2cyn2XfbXtsFSrSxpa6qaiUnXlewnxk9jXE5t3ChFhDlJMVFAqO8Mu2mx3o5IJm
         pCvRuMbuxd1GW5RAexSJPZv7HMwpYNGyRRyVVABrkwWNF0WynmvBYauRCwxawR8JCGv4
         w/xv9uZJz+pynayAhHuLUiUiAnkizxccS4v+V7aBUcmIojQRqRDnWmx2J0Yq/dAj5Tp8
         hIUDjd4pn6fYJY9Bq+E20W7K9jjGSjuzoK2hgsIzmRvkcdqfXQCFnYUvvrncT8m/GdJn
         Ocyg==
X-Gm-Message-State: AOAM532033hokoGPxyXMqRZX5ol78udQDB9ijhdVMXEpl5+ewf6gD2Wy
	xRL8ib1yFeaYMtcEqiYZ/upx5Q==
X-Google-Smtp-Source: 
 ABdhPJyWjD233lCE3WadSJw876Paa0uozfqEBTuRKfoIAmJuspvvNA1lFQ/wbfrFN3dodVTFgFujLw==
X-Received: by 2002:a5d:6e81:: with SMTP id k1mr7651364wrz.678.1644755941402;
        Sun, 13 Feb 2022 04:39:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:385:df26:3e57:9893?
 ([2001:8b0:aba:5f3c:385:df26:3e57:9893])
        by smtp.gmail.com with ESMTPSA id
 e7sm3768588wrg.44.2022.02.13.04.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 04:39:00 -0800 (PST)
Message-ID: 
 <f6f5877ea514546fe35afacf51cee987b8895c78.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] weston-init: disable systemd watchdog
 option
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Sun, 13 Feb 2022 12:38:56 +0000
In-Reply-To: <20220212104022.842655-3-alex@linutronix.de>
References: <20220212104022.842655-1-alex@linutronix.de>
	 <20220212104022.842655-3-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 12:39:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161681

On Sat, 2022-02-12 at 11:40 +0100, Alexander Kanavin wrote:
> This starts to behave weirdly when test_date is adjusting the clock,
> which means weston is restarted without need so disable for weston
> test stability.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-graphics/wayland/weston-init/weston.service | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
> index e09625b31c..80745998ed 100644
> --- a/meta/recipes-graphics/wayland/weston-init/weston.service
> +++ b/meta/recipes-graphics/wayland/weston-init/weston.service
> @@ -37,8 +37,8 @@ EnvironmentFile=/etc/default/weston
>  ExecStart=/usr/bin/weston --modules=systemd-notify.so
>  
>  # Optional watchdog setup
> -TimeoutStartSec=60
> -WatchdogSec=20
> +#TimeoutStartSec=60
> +#WatchdogSec=20
>  
>  # The user to run Weston as.
>  User=weston

Whilst that fixes the tests, should we be doing that for production systems?

Cheers,

Richard


