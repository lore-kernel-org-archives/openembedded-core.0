Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F80C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 14:07:39 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.11311.1647353256670493858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 07:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sc3+G86F;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id u10so29182207wra.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 07:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jk/YUeAgpKmMU8WlfjFVbECRpH1e3AW+Jw8q4WFSORQ=;
        b=Sc3+G86FAQ40szommVfbizmT+VJS9657JFzILmjbs59jAMfyMuC1/XVZsiy59q16Wb
         Hn7JbUCSgFArsSuyhYMtgUR4x9nmRIXW+OGHVld/dQFo6aMLNtl4h/8+fNzLSIR7J4eG
         1zta3s8eMXn+sX/oYDwRs4TwandLWO0am7qiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jk/YUeAgpKmMU8WlfjFVbECRpH1e3AW+Jw8q4WFSORQ=;
        b=Sg5MM0WYiIzSc2ekJw6DFf7teBBbkcXNVk/UvXqwMjjLy1od/HAcEymEsHfUVY4ebI
         Rp4Uzzkd2GOFm8eAj18t5dDrZfETpZ1V+eq2fmndfYi+XwMWNDV9SkDhaAjlCFGW9Zf8
         mJL4v/9XadhitHKU3MU4tDWHEHjgkHrspELzMiSK2oDOeCyzZEFNfGX77I57rWwhjprK
         Q4lD3PcePxJF1+yZQ9BCZzyyNd5te3ebNWfjuyKidUbDEPRH8HZhgeOs68S0AXbolWqx
         XmrRl8rptSB6ixjwo/yXOGBZxofDIPftAdB+vCIqo+B5mMPepHgJQvkKeKvhkjdB6+rc
         3WSA==
X-Gm-Message-State: AOAM532sriTcPRO9Z7FVL3dFsHhSXXKXgycq7pI8AZNpcxSunMXZrA1w
	CxfuBze5uVqunTVZbdyk0N7xqw==
X-Google-Smtp-Source: 
 ABdhPJwpXBj5CTFOnNeGZH6NrixTxoxy207XP/lCDxykRih6QgZbZA/4REyNWpmSHTsuqHZoOQ/B7A==
X-Received: by 2002:a5d:6b0b:0:b0:1ef:d826:723a with SMTP id
 v11-20020a5d6b0b000000b001efd826723amr19957386wrw.420.1647353254913;
        Tue, 15 Mar 2022 07:07:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58?
 ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 p26-20020a1c741a000000b00389ab9a53c8sm2287730wmc.36.2022.03.15.07.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 07:07:34 -0700 (PDT)
Message-ID: 
 <302bf585847f2f9c9e10300d3be291179c90e465.camel@linuxfoundation.org>
Subject: Re: [PATCH] sdk: support uppercase characters in MACHINE
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
	openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2022 14:07:31 +0000
In-Reply-To: <20220315135646.3687446-1-arnout@mind.be>
References: <20220315135646.3687446-1-arnout@mind.be>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 14:07:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163288

On Tue, 2022-03-15 at 14:56 +0100, Arnout Vandecappelle (Essensium/Mind) wrote:
> There are no real constraints on the values that MACHINE can take, it's
> perfectly possible to define a machine with uppercase letters, and
> building for that machine works fine.
> 
> However, the (extensible) SDK targets include packages and packagegroups
> that have MACHINE in their name, and uppercase letters are not allowed
> in package names.
> 
> Therefore, convert the machine name to lowercase when it's used as a
> package name: for meta-environment, meta-environment-extsdk,
> packagegroup-cross-canadian, packagegroup-go-cross-canadian and
> packagegroup-rust-cross-canadian. Propagate this change to other places
> where those packages are referred to.
> 
> Alternatively, it would be possible to outright disallow uppercase
> letters in MACHINE. However, this would affect any existing
> configuration that currently works fine except for building the SDK.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I have only tested this with the base SDK, not with the extensible SDK.
> I also haven't tested the changes to tclibc-baremetal, tclibc-newlib,
> packagegroup-go-cross-canadian, packagegroup-rust-cross-canadian and
> maintainers.inc. packagegroup-rust-cross-canadian doesn't even seem to
> be used anywhere, so I guess this change would need to be propagated
> somewhere externally.
> 
> Ideally in addition to lowercasing, any other illegal package name
> variables should also be removed or converted. It's less likely though
> that other invalid characters would be used, since that will easily
> break existing recipes. Also I couldn't find a conventient function to
> make such a conversion.

MACHINE is used in OVERRIDES and we only allow lower case overrides. The reasons
for that are becoming more historical however the code still does require that
and I'm not sure I see a pressing need to support mixed case or uppercase
letters in MACHINE and complicate the code like this.

Which version of the project allows MACHINE to have uppercase characters? Are
you on a very old release?

Cheers,

Richard





