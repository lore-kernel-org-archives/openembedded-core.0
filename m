Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2176C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 14:52:18 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.26206.1647442338213964400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 07:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NXjX/Z0V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id d7so3327013wrb.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 07:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=UG4Z/EdutJqsFNbzt3OO4+9vkSw/FudxNFm/Qmk2LL0=;
        b=NXjX/Z0V/BCWu7b2seZ3qmTVUImZMZxrtvdn0Q2Oz79+ZnMyZ2C/pFT1pJKCFDXYv2
         Vflo9h8pEu2+6n8P3HdWSvsIjEI0jwAh7BIFvgnEBwDo6zbHjeIiLisXuT5szcJwukKh
         lsNwMfAoAOzwRkIgQDVl0aakdPLDZwsdR7LvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UG4Z/EdutJqsFNbzt3OO4+9vkSw/FudxNFm/Qmk2LL0=;
        b=ZoTalhydpaMBsWjSPN74C9kyqSGrbe6GttuIA8wEzNjwa+S7PKAjfr99JncGKDdIb7
         p+5tDo9OkJO+RwfpvlQ45OmMXmyVV/oPS+t7At8+1bQ1gweGkAgHE18rASuFVnZTV8q3
         +Bh2w5kQDPROxfmDHSIabz4HElAc6T1QHX0PoS0uQgIbTBnSxSBdB7dafY0bBkFGy58e
         Snidvm0VFWmlqslFG9cCUfDZRAvdBJryBpdoFzT/X0fxiKfJ70TanHxNpouYoDeeNWhu
         Ib00s/3fPO5qEh7lZrNA33tQaoo6EEMEQk7W7UWhke0+prIPbcvIgDMmZFuzlsDe+aiO
         vkhw==
X-Gm-Message-State: AOAM533wuOpZf8XmzSlwy6DGIQBZFPMDcFIAi3ZRIQHb1wtCQrXLMNqh
	TuQZkV/raAaUBedpOs3Qx1afTw==
X-Google-Smtp-Source: 
 ABdhPJxfPSiwzQ2gu7cMd2CT6LRzn6EOqLoLIWYO9t13U35UXMuJ1CjQ4ClS4mxR7R8S1lvMl/Gk7Q==
X-Received: by 2002:a05:6000:224:b0:1f0:47aa:eb03 with SMTP id
 l4-20020a056000022400b001f047aaeb03mr222385wrz.507.1647442336661;
        Wed, 16 Mar 2022 07:52:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bc44:1420:18a9:e343?
 ([2001:8b0:aba:5f3c:bc44:1420:18a9:e343])
        by smtp.gmail.com with ESMTPSA id
 f15-20020a0560001a8f00b0020397ea11d2sm2106327wry.20.2022.03.16.07.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 07:52:16 -0700 (PDT)
Message-ID: 
 <4fe20726832f2157899ad90cf8350420372ed2c7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] lttng-modules: remove redundant
 devupstream assignments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 16 Mar 2022 14:52:15 +0000
In-Reply-To: 
 <CAAnfSTskU_LSgZmqqjPWKi1ySfEZsM8+=xkrGU5A1CEavJ=-=Q@mail.gmail.com>
References: <20220315162345.613041-1-ross.burton@arm.com>
	 <20220315162345.613041-2-ross.burton@arm.com>
	 <8096196d8428377e5c277ffab8be51dfb138d1b0.camel@linuxfoundation.org>
	 <CAAnfSTskU_LSgZmqqjPWKi1ySfEZsM8+=xkrGU5A1CEavJ=-=Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 14:52:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163337

On Wed, 2022-03-16 at 14:35 +0000, Ross Burton wrote:
> On Wed, 16 Mar 2022 at 10:30, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > >  SRCREV:class-devupstream = "7584cfc04914cb0842a986e9808686858b9c8630"
> > > -PV:class-devupstream = "2.13.1+git${SRCPV}"
> > > -S:class-devupstream = "${WORKDIR}/git"
> > >  SRCREV_FORMAT ?= "lttng_git"
> > 
> > I think you need to leave PV?
> 
> devupstream should be setting PV automatically:
> 
> if proto_marker not in pv and not d.getVar("PV:class-devupstream"):
>   d.setVar("PV", pv + proto_marker + "${SRCPV}")
> 
> I can double check shortly.

Sorry, you're right. I swear I looked at the class and didn't see that!

I think I was looking for "git" instead of url.scheme.

Cheers,

Richard


