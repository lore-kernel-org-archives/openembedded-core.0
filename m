Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B59AC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 11:35:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.26957.1702035302174702038
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 03:35:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g4Bi+UIp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c09dfd82aso26543975e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 03:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702035300; x=1702640100; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0toVOAM5aisYgc6/hPOvQP5Z2P59Kx/B6/fgAY/GuwY=;
        b=g4Bi+UIpBt1TqYQXOz7SIDDjRa8v0XdaRaIS66dUvsmuF4iTQhmTYXN6a5Pm68E5os
         Us2HgB6Z7CawNsG+exeft4qv3yKXTTOvmfwWp4UFBQeKBkxgBBYCotG90XBvCr2ko97p
         ms2ZXtBfqC37MWgXtN++EpBHVymNO6FLP8pR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702035300; x=1702640100;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0toVOAM5aisYgc6/hPOvQP5Z2P59Kx/B6/fgAY/GuwY=;
        b=w5w3M9TqO4CUC417uFwvO6hfsrKXK8e0z1qK2BlYHix/dTuyOSD26qSqHlZtJMoWGi
         nQgE3Pr4M7uQjoCJjyNiuj9r1DOinBWzg6LM/9AuP7BN+iuyBmm1lAI/dISqSqIPpF25
         vuaAVKJgNnMZ5nsswufnbqJChmbKMRVPrC5G6NbRmNT4gxd+J3EzWvgRSDpvX9U+wIqb
         EgPif/IvBvpYE7qm9koThQ6xCS8f9gANS70ShqPCYIupPp/2GVuaBFvX0iTrXJ0QRZpX
         VGVE1Qvudi5RbJncP6VlO+YjGghAWa+lPC0UG3RRMIgYNlX46GHBmqky1IS0YXfBxaWL
         g7Ew==
X-Gm-Message-State: AOJu0YywpTXU8CpC63fca54OTG40bu4/0qS3+eDFphAgSSZbXD8lZK0E
	8WzF2LCEFL6X0ZPjeRHc96bZhw==
X-Google-Smtp-Source: AGHT+IHzGEf90uFU7iUb7K3SzrmJS4XE42m/ITmqqVlCBLOUZ75XnRD6THVxosZwTKasdbrPewh2Ug==
X-Received: by 2002:a05:600c:246:b0:40b:5e59:ccb7 with SMTP id 6-20020a05600c024600b0040b5e59ccb7mr2872315wmj.152.1702035300397;
        Fri, 08 Dec 2023 03:35:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b? ([2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c3b9500b0040b2a52ecaasm4870976wms.2.2023.12.08.03.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 03:35:00 -0800 (PST)
Message-ID: <e66b4cebf577218dfffb4dcfa812b69597c8650c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/6] gnu-config: add a do_compile task
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 08 Dec 2023 11:34:59 +0000
In-Reply-To: <20231208101522.198832-4-alex@linutronix.de>
References: <20231208101522.198832-1-alex@linutronix.de>
	 <20231208101522.198832-4-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 11:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192043

On Fri, 2023-12-08 at 11:15 +0100, Alexander Kanavin wrote:
> noexec flag has an unfortunate side effect of not writing out the .siginf=
o
> file into sstate (because that is done in sstate bbclass
> from a task-completed event handler).
>=20
> In the absence of the siginfo file, diffsigs code is unable to trace back
> the change in task signatures if the change is really basic and
> affects tasks coming ahead of gnu-config-native:do_compile.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/gnu-config/gnu-config_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/re=
cipes-devtools/gnu-config/gnu-config_git.bb
> index 718f798a00e..c72de159ce2 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> +++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> @@ -19,7 +19,8 @@ UPSTREAM_CHECK_COMMITS =3D "1"
> =20
>  CLEANBROKEN =3D "1"
> =20
> -do_compile[noexec] =3D "1"
> +do_compile () {
> +}
> =20
>  do_install () {
>  	install -d ${D}${datadir}/gnu-config \
>=20

You have a good point here but by this logic, we need to remove *all*
noexec tasks. We don't really want to do that and I'm not sure we want
to set this precedent.

I wonder if we could just remove the compile task entirely and what
that would break...

Cheers,

Richard







