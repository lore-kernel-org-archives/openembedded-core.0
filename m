Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19EEC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 20:55:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.127.1639688136773826111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 12:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ef13f3QK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id p18so260165wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 12:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=WvnFYGk4LRizIet02IhrZhUc0aBh6alCZqp5xglUzAY=;
        b=ef13f3QKAwzCWapu/Hevpt8qWQpstcY9PSFQPewMGwNxIl7cWKCy89nFXk9puQfm5i
         LxSbgExYR0wiOxgOTEoV+Br37UfFpp65gxd/GabCk3o0ACkvUNwzPV3T2NTEmOs/sSxS
         ZknOAX0+Tq53jR0SUytdbI0ilt0bPBtfbSbUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WvnFYGk4LRizIet02IhrZhUc0aBh6alCZqp5xglUzAY=;
        b=L8MFe5JASAYXVPfZkkXikQg66Al5Y1YXMfkGT8ssuFTkpTz6cwY3ZfQBlFYji+AF7a
         cE2+ckh7kgAyNHbpmQj9ZE9CGn15o1IWQgZ258ZukjE6SkfXqPCY4dH0qGHZoRpyc7il
         aR3wZ7K6tCF/olZzMncKMX/msOrgl9h5edYNtyZjoqd2kwTjC6nOsGV24kn4AMfDoSgk
         f85G+o1W9LsnG6UEdCVEqQFvG06R8aHii7mu39aG3T+SIHUunsLd6qE3b1XZaVznR5vd
         fuAri8MANL+bV6NO2TKtEcON48UX2WsH7NWeYSM0USjgOsA7DPaa0qSnJyzp/tZD5fjE
         RXFQ==
X-Gm-Message-State: AOAM532iUGUVCwS1D9GnRgAupMWVTgpaeItIk1u0+k/HPHRt9+li+w3e
	q7DFlJMabwiQwi6nfpqIXyBVXw==
X-Google-Smtp-Source: 
 ABdhPJx0CKgdFYL6IKqeZDcZhxof3TbwpnBdJu8vRexemHRXs1jDYXbw6dvkV05vOM0o/zdrkaWHrg==
X-Received: by 2002:a05:600c:a47:: with SMTP id
 c7mr6815441wmq.23.1639688135072;
        Thu, 16 Dec 2021 12:55:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d2f0:f9e1:f1a6:6c5f?
 ([2001:8b0:aba:5f3c:d2f0:f9e1:f1a6:6c5f])
        by smtp.gmail.com with ESMTPSA id
 p8sm5479070wrx.25.2021.12.16.12.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 12:55:34 -0800 (PST)
Message-ID: 
 <281dec9cd45c550734d3e217e259bf407e125d8e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-idna: Drop from OE-Core
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <foss@0leil.net>, openembedded-core@lists.openembedded.org
Date: Thu, 16 Dec 2021 20:55:33 +0000
In-Reply-To: <1D26D2EC-227C-469A-8051-C4808091ECF0@0leil.net>
References: <20211216132218.857571-1-richard.purdie@linuxfoundation.org>
	 <1D26D2EC-227C-469A-8051-C4808091ECF0@0leil.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 20:55:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159806

On Thu, 2021-12-16 at 18:25 +0100, Quentin Schulz wrote:
> Hi Richard,
> 
> On December 16, 2021 2:22:18 PM GMT+01:00, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > The only recipe mentioning python3-idna in OE-Core is python3-jsonschema.
> > python3-jsonschema only depends on it if the nongpl package config option
> > is set. We don't set this option.
> > 
> 
> That is unfortunately incorrect, it is also part of the format PACKAGECONFIG which is by default included.
> 
> > The idna recipe has license issues with questions around the Unicode license
> > (still in meta-oe) and which version variant it should mean. We see QA warnings
> > in automated testing from this:
> > 
> 
> I still shall open an issue on the GitHub tracker of the project to raise this.

I don't know how I didn't see the line in the format PACKAGECONFIG. I've sent a
patch to update it to Unicode-TOC as I think that matches what the header talks
about.

Cheers,

Richard


