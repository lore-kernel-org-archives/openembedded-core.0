Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC326C44515
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 18:27:50 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1874.1784226461658979919
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 11:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fbqN/aje;
 spf=pass (domain: konsulko.com, ip: 209.85.167.177, mailfrom: trini@konsulko.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-492046a3313so2408171b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784226461; x=1784831261; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DxOwhCmeBfgsEczUl42pN/BLpJM5zWMxISQdqN5TOsM=;
        b=fbqN/ajeDFZYC/Yxd/tjiChBxD9mNefhq+ekh39fDRQSPxkiVPBOFXXIzRs7oybP5W
         dxYRzChEemS4UodvQGAUedNhL5nh5AmvuY0ZMWaidwP9lkzm5yPlkfFTbOclbY7AFNx0
         1fPmPrIBCHoD4htI7MsHLZdkK34UMFNR1k9r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226461; x=1784831261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxOwhCmeBfgsEczUl42pN/BLpJM5zWMxISQdqN5TOsM=;
        b=VBA4z0IdEiDd+EbqAiyEQITw9PP8pi32ePRIYRf070zMDhpVfB2F/TZ+1kd08caBJt
         duGRX4dqOMxViWdm3AkK8rfZnW6sOnjL9/t9ED+qd1mTcGNBQA0gMmV6Ak2n238/QwAw
         4ISbLIuGTQfZblxXUvmwbXqc1rVid5j8TqA59Uw9pmSRFPWagtN1XkYxCBw6U/ffp5im
         cFFtnUvtg+L3AFDnTxDcJWwhU9klDFt1dBzFX5KrRBUxRhcfVf6z8SfV3++KQO4C4s+8
         wAS+7gA0SpIiczlhwBwHUeFLACdzCQg4SEX4+GfBjVNRBYf+lcpctOvjwdz7bJZhphtU
         Syrw==
X-Forwarded-Encrypted: i=1; AHgh+RpkUPbUDI9QiU13LHsCCcu9oBKqpwKqnem83xltKF54pSCljKSj4S1ANWjeQkmg+9IO/8H78VgzOCqnzskxdGWXHg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwTsWSyeUpIkADPbUaghrypXR1e6LGXjVDcCK77Fs9ac2ZZyMd7
	f1XH17tF+iShfXE9eTetyuwDE3sWDNKBI4jlPmXiw3tPsMyAgL8+VhjJNzdaUUs1h/E=
X-Gm-Gg: AfdE7cmU9XmBSfTJwDRjdXSzQVX6VMuEUp8d95vZEhrekfZDAMMf6b8XqTuOVkJqeIN
	xEzFfwmCAlOUY9RZdPAvrwr4StkfxYMtR30YlocggrScVcJtBsLvDvq3cB9pq9KFglqb4+Wq4rb
	OYDia3KLcECMUpF8gdMpoCfX01ASKdq4Okst3imoNQRnQMFz6l8+YLwfn/W+kPxrIRu0hu5KWTz
	kRMOA1vEBFXYVL9Vx0ajDttRzs6M6fAuhL5tKoWw0s/Vlo1i9nUzMmY1PcXMZBYz6n8j3mfo/c6
	PI8RChUE29Hp8AqQLXSut1xL8oVIoG0u+AK/QLD5JDIUKJGMtsP4oSqQod1P+VqsCMLzXmlRQ3I
	TycIBwgzMnLNJ2jIrPGMoV/HYhyeCNxBy9gGrwqs88twZfZukQpFkGcFKDOCE0rLW3CU5btc/3k
	85VFDkRKchbhe2Sp/9ps3eaF3syQXHsgj3xhDqaSpcaFUvucPSWklYo89rviCfOxO4aDhiAttY6
	rRZycVEJzgMTCt5pLO4Hx9MVAI=
X-Received: by 2002:a05:6808:2389:b0:495:ff85:d33d with SMTP id 5614622812f47-4a4c86669e1mr569879b6e.12.1784226460841;
        Thu, 16 Jul 2026 11:27:40 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-56.totalplay.net. [189.203.100.56])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4099ace01sm15231436b6e.18.2026.07.16.11.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:27:40 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:27:37 -0600
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: leon.anavi@konsulko.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [[PATCHv3] meta: Add pam to the defaults if using
 systemd
Message-ID: <20260716182737.GP749385@bill-the-cat>
References: <20260708143704.2643050-1-leon.anavi@konsulko.com>
 <7e6827804a7b8da37204e54171d8fb9f7b490b35.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e6827804a7b8da37204e54171d8fb9f7b490b35.camel@linuxfoundation.org>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 18:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241101

On Thu, Jul 16, 2026 at 12:25:00PM +0100, Richard Purdie wrote:
> On Wed, 2026-07-08 at 17:37 +0300, Leon Anavi via lists.openembedded.org wrote:
> > This fixes issues with test_machine_world when running the
> > yocto-check-layer script for BSP layers that include weston in the
> > dependency chain, for example meta-tegra:
> > 
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable
> > providers.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> > 'l4t-graphics-demos', 'weston']
> 
> Why wouldn't l4t-graphics-demos just list pam as a required distro
> feature for that recipe?

Because it doesn't come from l4t-graphics-demos it comes from weston?
And l4t-graphics-demos supports wayland or x11. Doing something here
would be the not satisfying approach Paul mentioned on v1 or so of this
thread. It shuts yocto-check-layer up while doing nothing of value.

-- 
Tom

