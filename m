Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C1FC433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 23:19:05 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.945.1641597544536833837
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 15:19:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UOp1Ec56;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 f189-20020a1c1fc6000000b00347ac5ccf6cso1662529wmf.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 15:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xhLL15OfIecx4SWny4zbljJZb+5hUo1vt6hRnaS4P64=;
        b=UOp1Ec56Z+cxZZGNbKOGJj4sLIsc34QpDs61WC67aezntw2saGR/9Ra19GV1AaSS7P
         5ex4j0tv/ahg+9r44UCH8ntp8ioeeqoTWZaaqxRd1V1I/dn0M/SCwH+WCKdO0hstPaQi
         OykOw9gKMxlGhqbT6JtT/P0w0bZBqGwvPLfjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xhLL15OfIecx4SWny4zbljJZb+5hUo1vt6hRnaS4P64=;
        b=StBZP5DaU/oRm5ZMlBAfBJAoz1kVLTwudJ5TmuKQsSqnISqK1kZepV2Pw/5ebO6mzU
         EkbDPcSUUs40a2JQMgQ/l85hfCWdpzUdcrsglpRHrUZCacRpEa9TPdTvv8URnewrXD8D
         uQvypqp/VvE34m75LWK9x4m54UBRmVqXE1Q8xDckgv10yLUe4H3gQzXhLSV5OnvZqkYq
         l5hzczgCPjYKjrOmv2eQ1tNB/ShIjKIJBdiYLCBg55c3wIciZxgpP/hIRTo3FFZAQkFL
         t5DpOuj/EjnPB17QKL0Tjn0Qpqin310/cVjVMII5kjpzSDSsMdNqsbllqBLLCNVwnHoy
         xIzQ==
X-Gm-Message-State: AOAM532G0LcrSvsiZAYmFe4MDtjMtuy9DY6fLZiz7WYyDrKz2fhP1LO7
	9DWqUiVG8okWiR+ro27XJg/0kQc7qYUxMA==
X-Google-Smtp-Source: 
 ABdhPJw/f3meOsvHczWxvvl/tnhjwm/1uBVMClnw82CIKkI5FovaqXO6utQsU7SYONtQ3swpnY+SFw==
X-Received: by 2002:a05:600c:3514:: with SMTP id
 h20mr12707801wmq.62.1641597543165;
        Fri, 07 Jan 2022 15:19:03 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9055:f73b:1aa9:bf82?
 ([2001:8b0:aba:5f3c:9055:f73b:1aa9:bf82])
        by smtp.gmail.com with ESMTPSA id n12sm73928wrf.29.2022.01.07.15.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 15:19:02 -0800 (PST)
Message-ID: 
 <838c638d90097e11725f01f525178c70a15dfcd9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 2/3] kernel.bbclass: remove do_strip()
 method
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>,
	openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com,
	bruce.ashfield@gmail.com
Date: Fri, 07 Jan 2022 23:19:00 +0000
In-Reply-To: <20220107212446.132386-3-saul.wold@windriver.com>
References: <20220107212446.132386-1-saul.wold@windriver.com>
	 <20220107212446.132386-3-saul.wold@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 23:19:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160273

On Fri, 2022-01-07 at 13:24 -0800, Saul Wold wrote:
> Move the do_strip() functionality to a more common location in the
> package split_and_strip_files() flow. This makes it possible for the
> extended packaging data to be generated correctly for the kernel and
> kernel modules. The KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is reused in 
> the runstrip() part of package stripping.
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 35 +++--------------------------------
>  1 file changed, 3 insertions(+), 32 deletions(-)

As I mentioned in previous mails, I think this will mean the do_deploy output
will change and become unstripped which may cause a problem for some platforms.

We likely need to keep a strip task but call the new strip function from it?

I personally think this is a reasonable direction apart from that though, at
least in principle.

Cheers,

Richard


