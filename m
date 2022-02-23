Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E0FC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 00:43:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.1675.1645577006888039656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 16:43:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jkg5iCsF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 3-20020a05600c228300b003808a3380faso452043wmf.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 16:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9guMcg/uMOO0UCE1WZSxAbLxwSBAGX2GG9sjpRgauzU=;
        b=Jkg5iCsF+24Qm48pm+ojxTktojbsmylrxPW3s7dCcAa4hAefntrE4LiyEpn6KkcjaB
         HL5RdGryddpFlCTUVA4XNTye6A+nJPzAlz1jssMwfXYGZ9n/8nAqxkIjQzzfrlDTRwW/
         ROjtLC+7MHalUUzzkqC67mOxE5mXfPLO7+F4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9guMcg/uMOO0UCE1WZSxAbLxwSBAGX2GG9sjpRgauzU=;
        b=fZ4Umty8FnwdLcfCW9yGj2V1U7fHd7ZR/PeTA4ekNUVq9J48F7TD8jNwDM/j+aa78v
         k/3teULJADk6L9yV28rQUgePymFfT3lPtGfz9wwcWYV5y+1jNo9U9Yd99CovupG3B4xz
         QbfSK8gJLQVDtXN0igvcCJt6tOatygiwgdEYzg3S+CpzIsKTqncZoBOV9QuS74Trim/P
         4s4zF6Hc3gNbXaWk6eGRLGXCNwjZxAzYCmWTNJvH/ED74mKxzY7ZyzPqKbYBXs8G+cHZ
         rrph/LS0vVvHZZtyH0xQ+vFF7q0THLsVwZLGfFoblLpmAzGgwfGBZkxnwWBFbhwQUJVs
         SFkA==
X-Gm-Message-State: AOAM532LPQ+s34hLwLiVeSdfBaYleVgN9EUwBDOov3eARY2SDzUeoZ4r
	aHlqXNsti217B/S0wZnma4twmg==
X-Google-Smtp-Source: 
 ABdhPJzNWZA57zq9984WRVmZA6CYaNQWj4lCM3F4VudgtRrY2KkV1c8y7XOfx4r5EaypeQdbIEVwMg==
X-Received: by 2002:a05:600c:601b:b0:380:d0e9:53c0 with SMTP id
 az27-20020a05600c601b00b00380d0e953c0mr4811550wmb.102.1645577005356;
        Tue, 22 Feb 2022 16:43:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4709:85d1:7b5:8346?
 ([2001:8b0:aba:5f3c:4709:85d1:7b5:8346])
        by smtp.gmail.com with ESMTPSA id
 r11sm3679284wmb.19.2022.02.22.16.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 16:43:24 -0800 (PST)
Message-ID: 
 <8b452f8a5cc4bb01f5247b9d63c51a4b7fc9121a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 7/8] rust: Add snapshot checksums for
 powerpc64le
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrew Jeffery <andrew@aj.id.au>, Alexander Kanavin
 <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Feb 2022 00:43:23 +0000
In-Reply-To: <dab378ba-9d56-4577-87da-fe8152d66a68@www.fastmail.com>
References: <20220222035234.463162-1-andrew@aj.id.au>
	 <20220222035234.463162-8-andrew@aj.id.au>
	 <CANNYZj_3sRMqa-F_GvR2fCi2vNtafyNOvyHB_WhS99EhpoVK_w@mail.gmail.com>
	 <48dc371d839b004db347823b5867f4c338e94443.camel@linuxfoundation.org>
	 <41b02f27-15e6-4250-83f9-a595fe26b84c@www.fastmail.com>
	 <d9c4d14acb3e5ce1436d8b0f8992217cd3034511.camel@linuxfoundation.org>
	 <dab378ba-9d56-4577-87da-fe8152d66a68@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 00:43:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162238

On Wed, 2022-02-23 at 10:57 +1030, Andrew Jeffery wrote:
> 
> On Wed, 23 Feb 2022, at 10:33, Richard Purdie wrote:
> > On Wed, 2022-02-23 at 10:19 +1030, Andrew Jeffery wrote:
> > > 
> > > On Tue, 22 Feb 2022, at 22:58, Richard Purdie wrote:
> > > > On Tue, 2022-02-22 at 10:59 +0100, Alexander Kanavin wrote:
> > > > > I have to note that YP does not support ppc systems as build hosts;
> > > > > can this be kept in a bbappend?
> > > > 
> > > > It isn't official but there are obviously people using it. I think we should try
> > > > and do something in core but there is a question of how we maintain this given
> > > > our infrastructure/tests don't cover it :(
> > > 
> > > That's fair. Is it acceptable that it's tested by proxy in OpenBMC if 
> > > we can't work out anything else for YP CI? I don't expect anyone 
> > > maintaining the rust support to test ppc64le explicitly if they don't 
> > > have access. I'd be happy if the ppc64le checksums were just updated 
> > > along with the rest whenever the snapshots are bumped.
> > 
> > The challenge is we have no tooling or support for "bumping" those values. 
> 
> Yeah, that's familiar, when I sent the initial patch fixing the URLs I 
> hacked some stuff to force the BUILD_ARCH value to ppc64le on my x86-64 
> laptop. That's not a scalable approach.

Funnily enough, tweaking BUILD_ARCH was something I was wondering about in some
of our automated tests since that might reduce the changes of some things
breaking.

> Not having the tooling seems reasonable, as having it does kinda 
> suggest you'll try to maintain things you can't test. Even though I'm 
> trying to argue for that, again, it's not scalable and I understand the 
> push-back :)

That is the big worry as we can't really test it.

Cheers,

Richard



