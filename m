Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91ED0CE79A3
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 20:42:32 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.3086.1695674546975815876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 13:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NbusauIy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40594697600so21583595e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695674545; x=1696279345; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eVLsEQmGE5cSFJuxWTANUqKjr5gKijb/tUyqKO9xDYs=;
        b=NbusauIyfNXChXectnThVerLAdXOQZShtnP2dH4E1jpo8c4CUgFXNa6aJ2OJPG/+m5
         7KxVaf+pWdbezvuzLvBqLlmlJaMIxwMzoTrVbtf2e7R+BEuNQCKuUT/H6qY9srAl+bHP
         pri42srEw+1xiPgPP6/UziW6yHJCBmI/i0gSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695674545; x=1696279345;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eVLsEQmGE5cSFJuxWTANUqKjr5gKijb/tUyqKO9xDYs=;
        b=FJabwzykyGdNsLkSmOfBP3+/bswEPiebcHbUcC7u7GQdoCDWHwZSRPB1c8DF2Tg3xQ
         MVCl/i/hUoLLJR3s8yVxH7DJt90MZyiUf39dRlQw7oHIgN3K5Xjr3LYfI0wHo6FkCLHa
         0pOoviJzIcWQbc0FHRzV1+q++yrLnysHq+8mkIWv7to1+rODDFGLUau8VqhQhMyZwHta
         23nulC7wNN7KgaO+xVuQ0A7oTDVi7/bBiOYz0fHnDl7d0dUZ2b3hGdIdTi6h9q8gz622
         fOSbTe94bGy8UUZNGV7kdyNalN7vnCl8D7/Z3nL9pmcgqG+fGB6vTqYFVgk5rJCTn4Y3
         kgXw==
X-Gm-Message-State: AOJu0YyfrVy93N0KhTBEtfSe+Ft4TOLXMLzHQgO4rkN/xrwcMotrfR6S
	IrUI1aweEV20LW8Qx48GT52/Ew==
X-Google-Smtp-Source: AGHT+IHGNaHFHHtRH/gpFEo2IOjqbK6z9QWbXaB2Fqj4i9cEXgrsHnh/WZy8PRB7xoWMs4DQSayK7g==
X-Received: by 2002:adf:f34b:0:b0:319:6001:978c with SMTP id e11-20020adff34b000000b003196001978cmr7933510wrp.53.1695674545471;
        Mon, 25 Sep 2023 13:42:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:25bd:4a27:c3da:a228? ([2001:8b0:aba:5f3c:25bd:4a27:c3da:a228])
        by smtp.gmail.com with ESMTPSA id c10-20020a5d4f0a000000b0031f3ad17b2csm12761498wru.52.2023.09.25.13.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 13:42:25 -0700 (PDT)
Message-ID: <56294c29e5dc37e6e46805279d7da0e0f8d2cdd8.camel@linuxfoundation.org>
Subject: Re: [OE-core] beaglebone-yocto testimage ping timeout issue
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, sandeep.gundlupet-raju@amd.com
Cc: Openembedded Core <openembedded-core@lists.openembedded.org>, 
 "steve@sakoman.com" <steve@sakoman.com>, mikko.rapeli@linaro.org,
 "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>, Trevor
 Woerner <twoerner@gmail.com>
Date: Mon, 25 Sep 2023 21:42:23 +0100
In-Reply-To: <CAMKF1spNh0=tz4rQVGfb_E8Eh3kR01KeDxYbrsM-QoYdDjzy9w@mail.gmail.com>
References: <ab29cb4d-eb1f-d132-6818-9a09bea0d98b@amd.com>
	 <CAMKF1spNh0=tz4rQVGfb_E8Eh3kR01KeDxYbrsM-QoYdDjzy9w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 20:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188211

On Mon, 2023-09-25 at 11:17 -0700, Khem Raj wrote:
> core-image-minimal does not have ssh server in image so maybe start
> with core-image-base or something or add
> IMAGE_FEATURES +=3D "ssh-server-openssh package-management hwcodecs" to l=
ocal.conf

Whilst in general that is good advice to make minimal more testable,
you don't need an ssh server for ping to work so it won't be that for
the ping issue.

> you might need to prepare the target testing setup
>=20
> especially TEST_TARGET_IP and TEST_SERVER_IP and TEST_TARGET
> see - https://github.com/YoeDistro/yoe-distro/blob/master/conf/projects/v=
isionfive2/config.conf#L18-L20

Can you share the full testimage log somewhere? The first thing to
check is whether anything booted or not. If it hasn't booted, it won't
ping. Start with that and work forward - are the network devices
configured in the kernel log?

That does raise the question - how are you provisioning the beaglebone
and the other hardware with the image/kernel? I'm not sure that is
setup to work under qemu?

Cheers,

Richard



