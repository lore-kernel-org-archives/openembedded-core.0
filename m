Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D38C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 21:39:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.3381.1638394780881377128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 13:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LtGgPvAq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id d24so55393151wra.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 13:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DWu/EYwOWs+KHnBXJ/r+qEsydh2CxCPv4r8jFBBv9E4=;
        b=LtGgPvAqaG1xIpylmin7RY+dMliT8oTVIlk+nddcG8Y7HNTyK7Zckcq+yZre9y3HpU
         oGS3d7JXBqs5pDmqh82qVKzjTTKc+Rf2u5U6pOzVJlXP6DaFcc98w4lX9LmvtixDU5p2
         65yusbmqRPL325TervOjy0wqp+/m5O4DJUEfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DWu/EYwOWs+KHnBXJ/r+qEsydh2CxCPv4r8jFBBv9E4=;
        b=HjNbf3muMbvciHT+NtJ73VRz9/eg8R6eYZpr0wWJGQVb7DShelPiS14dULuYHRpSnD
         TeT72/g/gDL1D32tjmkXGfmMzfTl0DintoYWmbJxeWGZaeftVqUGypYD+gf0tAe58eu3
         RuF2hIWh+31ACRTocVbCc134+F04mFWDHOiwJb/jvzE2cgG43GqQGjS1P1A1os+gnM/r
         ASDXTbLrP+3VpUDEK65+BgsmEytcx1u58P2rI/7mglGfE6A3Z46XdLr/fhEBT53x8pkn
         U1SX8xvQt5LglkmOfpOZ8XEjn86EOtx+FB2LQw2Nww8/+/ygnNUS7QjXS8+xe5WnD5//
         DfcA==
X-Gm-Message-State: AOAM531VX0D8ytjn0+9AS8P036QGeBdVMUgEtXL7ZvnvGPiJ0UqF1zEH
	02tT15nrZgpAIaKj044D99TW1Q==
X-Google-Smtp-Source: 
 ABdhPJw7FujdUWteGWLe/k4h8C8Ft+38z13WiJEcacOT3pgvgtHS7CI/zzoQbCb4iOxpfylYlbGtTA==
X-Received: by 2002:a5d:4d8b:: with SMTP id b11mr9479567wru.393.1638394779080;
        Wed, 01 Dec 2021 13:39:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d27a:3e0:de4a:4b51?
 ([2001:8b0:aba:5f3c:d27a:3e0:de4a:4b51])
        by smtp.gmail.com with ESMTPSA id
 g16sm539128wmq.20.2021.12.01.13.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 13:39:38 -0800 (PST)
Message-ID: 
 <d1a94fdcacca208555f96846beecb853c14dbc24.camel@linuxfoundation.org>
Subject: Re: [OE-core] [dunfell][PATCH 00/14] Backport mandatory dtschema
 handling for device trees built through the kernel.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Bhupesh Sharma
	 <bhupesh.sharma@linaro.org>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, bhupesh.linux@gmail.com
Date: Wed, 01 Dec 2021 21:39:35 +0000
In-Reply-To: 
 <CADkTA4NV0ix0S4rc8HqJuJJr=Os299bx5UZrQEBnx9MBW-DCzw@mail.gmail.com>
References: <20211201203407.218692-1-bhupesh.sharma@linaro.org>
	 <CADkTA4NV0ix0S4rc8HqJuJJr=Os299bx5UZrQEBnx9MBW-DCzw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 21:39:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159062

On Wed, 2021-12-01 at 16:33 -0500, Bruce Ashfield wrote:
> On Wed, Dec 1, 2021 at 3:34 PM Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
> > 
> > This is a backport request for dunfell, while picking up only the
> > skeletal support for allowing mandatory dtschema handling for
> > device trees built through the kernel, introduced from kernel
> > version 5.16 onwards.
> 
> The problem with adding this support to dunfell, is obvious in the
> number of patches involved.  We've also said/known that at some point
> that we won't be able to support all new kernel versions with the LTS
> release. This may be the start of drawing that line.
> 
> Also, we've had to do some license tweaks in master just today for one
> of the added packages (idna), so that would be needed as well.
> 
> The validation isn't absolutely critical, I'd suggest that just the
> wrappers and pkg-config fixes would be a smaller footprint to allow
> the kernel to build, without the new package/feature additions to the
> dunfell release. The new packages (and full validation) could still
> possibly be done through a secondary or mixin layer.
> 
> I'm not sure which way to go on this, but I thought I'd offer those
> points for discussion.

I think this needs to be done in a mixin layer for dunfell.

Cheers,

Richard


