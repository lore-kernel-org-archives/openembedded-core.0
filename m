Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68CDC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 10:54:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.8732.1644490447528647437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 02:54:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RnkP+BdE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id v129so3191534wme.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 02:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+zG0xR/p4//JF+H3OqB6mJgCpj7GTuMmNFz9zhR2vk0=;
        b=RnkP+BdE2SgUpx6Ky0hTRKP/ThxV9/UVxRaVKDjdGfYxch/DPPPo1hLBBifYlnkW9G
         P1iFZps9GqyWFQfZWsB54Y+Y32DIsDoOeVIZ4GXzoijEceu2xNwu9dPGl128LYCK81Yt
         KQU2GwaFwVP7QAX3hfTn97IRcD3t+3Xi6Pz7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+zG0xR/p4//JF+H3OqB6mJgCpj7GTuMmNFz9zhR2vk0=;
        b=b9DNvPOBvcBK0QgkuhBOzFZ2A8+khW0RL+cZ341f+fD6A7mXiGAqM9h3NuMciqq9ZZ
         WpN2H8kw1QQZeIoPowDISDKepFp05VhNLt2AgUPRypw2lvh74DzU5/nC7OLfiHra9CeF
         9vRDauSou1GasV/5PgJ6dw+S/tXZ9CWom/eR+mKoC5mA89RVjMfmkxLOY+FTS/qEH/V/
         NhpRSUb/B4W81hO144Rg0220eZk9l29lklH2kgN7yGG3uI3870FlufmkwL72MpkSU55k
         FILHFM6xRQu0JTNLLSt0CXulP7RkmFTVghPeQNgGBx73AK/FPAVtrdvNCiUdImywW6DD
         8Qxg==
X-Gm-Message-State: AOAM531Sk8R3fcAaZol738OPC47yha+tdfZyou9Q09SkEnoVmP2OWVU8
	Y8CRBs3Oh2Af6FwWoGJdqQs3IQ==
X-Google-Smtp-Source: 
 ABdhPJwA/ShgxO7aHYctBbFDjfdnjPzDc/F/4A/HoYVihH/5YXAD0uPraNTRUq/InNJs8rfYG9XnlA==
X-Received: by 2002:a7b:c184:: with SMTP id y4mr1653627wmi.117.1644490446092;
        Thu, 10 Feb 2022 02:54:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7dcb:9837:5409:449e?
 ([2001:8b0:aba:5f3c:7dcb:9837:5409:449e])
        by smtp.gmail.com with ESMTPSA id
 z3sm1383058wmp.42.2022.02.10.02.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 02:54:05 -0800 (PST)
Message-ID: 
 <c54b8a5fbe59b21a862d5b6519e4f8872458f694.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] kernel-module-split: modules should
 recommend the kernel image
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, Bruce Ashfield
 <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Feb 2022 10:54:04 +0000
In-Reply-To: 
 <CAAnfSTvsN7DSuiGvSfLF2OgJXNW7QEZK+LZdNuvTcrYk3eUMvA@mail.gmail.com>
References: <20220209173036.3823144-1-ross.burton@arm.com>
	 <20220209173036.3823144-2-ross.burton@arm.com>
	 <CADkTA4NG8wAoMQtpwbvf2hia23JnGsbboERY4H61GxMpyms5JQ@mail.gmail.com>
	 <43fe0dbf3548f549d1c0161d2a55f633a9c27122.camel@linuxfoundation.org>
	 <CADkTA4Ms8yb5Jn3K8N2BZktLYHtfDwp0ym_OVke16G4ER_739w@mail.gmail.com>
	 <CAAnfSTvsN7DSuiGvSfLF2OgJXNW7QEZK+LZdNuvTcrYk3eUMvA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 10:54:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161606

On Thu, 2022-02-10 at 10:52 +0000, Ross Burton wrote:
> On Wed, 9 Feb 2022 at 20:10, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > I've always just used this (from kernel.bbclass):
> > 
> > # Allow machines to override this dependency if kernel image files are
> > # not wanted in images as standard
> > RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image
> > (= ${EXTENDPKGV})"
> > 
> > Maybe that's the one you are remembering ?
> 
> Obviously this won't work in the situations where you want a normal
> image with a kernel but also a initramfs with a kernel module in it,
> as that behaviour isn't machine specific but image specific.
> 
> If this was a recommends then it could be removed via PACKAGE_EXCLUDE,
> but we'd need to be sure that nothing from the kernel ended up getting
> pulled in via a single module.

I think making this a RRECOMMENDS and doing that may enable more workflows and
make things easier all around. Can you check and see if it does pull other
unwanted stuff in? I'm hoping it doesn't.

Cheers,

Richard


