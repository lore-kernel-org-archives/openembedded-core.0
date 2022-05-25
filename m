Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E582EC433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 11:38:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.5623.1653478720101000971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 04:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GxFmNdxM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 c9-20020a7bc009000000b0039750ec5774so3158837wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 04:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=zj8uYtRIZMBaFDIgw0mr25D6Gs4aMlnFXN5uJt1BzFo=;
        b=GxFmNdxMeRQ9GLtUtjlcO97B67KjWM/4/gb3ErYdpV6TfBfhRw2SzA3l6OteaBW7SM
         4QNWTGB1pWegFFBtioR7dATVA1oE84ln38H42lx+cc06u1GMCBfGg/j9J2+hvxlKZhls
         HTlwZIM5Z9PPJ746jHw/hdGYtOhHhyJgVejhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=zj8uYtRIZMBaFDIgw0mr25D6Gs4aMlnFXN5uJt1BzFo=;
        b=tDIDrDmXozotbHt0rE+DYvBofRp2VUd5VwGg/b+DS+fa4Vuhjc+/oFo38k5SahaYq1
         TInJhDxwSuDlCA24QzlfBW5f/SxaM8yN9DQY5akNNuxFt/DDnfM8ld9nuIL4bEeLIUk1
         zzlcQkZC3lchqBaEg0p4zhOZu5Bu8Xha29yJds4yuLDcmgi7MGFhHTGc3eEmb+kUV3Va
         lOZgZmL2lMhoKddZFFcBd5zGIorAqGym5SLKHo2xrGY2FVjtqYmccZyM6iR9Wd2jk/c5
         YesSxvGBiSBwVOxeccDybtEyZo5fCQ9pUxrmZ2tUP8FSKnsNHMYJC0JtMVYlM1XVeSYt
         jwqA==
X-Gm-Message-State: AOAM532bFKjl0w3PA2zCqnq4cuSZlM+aJDV3zpiUKFFBH+3T9gGSR+HA
	HYCqFX/BL/y2jbYWf0m2JwOosg==
X-Google-Smtp-Source: 
 ABdhPJzpwBXxBt0CGZs7awr2YP32DxnN2otwNCgaImfTF8/lo1QbQ5+RA3TGOSMcW+dBPH8247D8WA==
X-Received: by 2002:a05:600c:288:b0:394:31f9:68f with SMTP id
 8-20020a05600c028800b0039431f9068fmr7738213wmk.57.1653478718486;
        Wed, 25 May 2022 04:38:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5808:e02b:90d6:3f52?
 ([2001:8b0:aba:5f3c:5808:e02b:90d6:3f52])
        by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c500700b00395f15d993fsm1926512wmr.5.2022.05.25.04.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 04:38:37 -0700 (PDT)
Message-ID: 
 <9743d278bf2ccbff92436ccd30335a5f59a47b2b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/9] mtd-utils: disable LZO by default
From: richard.purdie@linuxfoundation.org
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, nd
	 <nd@arm.com>
Date: Wed, 25 May 2022 12:38:37 +0100
In-Reply-To: <D6B1AC00-90EC-49C2-B66F-3849A46B010C@arm.com>
References: <20220524152401.1663317-1-ross.burton@arm.com>
	 <20220524152401.1663317-3-ross.burton@arm.com>
	 <6585ba44a9ef9dd9ef8c0d70ac570f97d8e24bb2.camel@linuxfoundation.org>
	 <D6B1AC00-90EC-49C2-B66F-3849A46B010C@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 11:38:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166118

On Wed, 2022-05-25 at 10:34 +0000, Ross Burton wrote:
> > This and kernel compression are the two pieces that worry me a
> > little.
> > LZO is still probably one of the best speed/size compromises and
> > was
> > the reason it was added to jffs2. I'm not sure there are many
> > devices
> > that still use flash directly via jffs2 but this probably still
> > does
> > have a use there. Obviously it would still be in meta-oe but I'm
> > worried the "off by default" will catch out a few old BSPs and be a
> > pain to enable. At lot of this history was paged out in long term
> > storage!
>=20
> Enabling should just be a matter of pulling in meta-oe and flipping
> the packageconfigs, so I don=E2=80=99t see this as a huge problem.

My worry is that it changes the task checksums for the native tools and
means the BSP can never be YP Compat.

> Looking in the time machine that is meta-handheld, I see the zaurus
> machines turn on LZO in the JFFS2 kernel module, but they also build
> UBIFS images which explicitly use zlib instead of lzo.  UBIFS also
> support Zstd now, so that=E2=80=99s probably a better option all around: =
it
> compresses almost as well as zlib but almost as fast as lzo[1].

If the zaurus moved to ubifs, there is probably less of an issue and
just the kernel boot time remains but I'd hope zstd is being used there
too now (or will be).

Cheers,

Richard


