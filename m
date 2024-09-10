Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6417CEDE9A3
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 16:33:37 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.826.1725986010432742047
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 09:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j8wmy29S;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3df02c407c4so3412954b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725986010; x=1726590810; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFfMkDYXZPLJdUTgIYew6jPC6YGMQaOmTQEFFB//QM4=;
        b=j8wmy29SiAf9dtIgozLnGzO9B9N5dpM9nKZyS5Z1xW1MCoY5Ek3t1m4aeRKzMn0FRx
         BzEPzOgFR/74iuq9Gp+ldG44s2EWmi/Pf1myLP5HIIqbXmZ0tVJnG0v2ivZF1szLciCk
         r3x6hLXbFY6BI5fb5npEiRFuKBIH1CyfRn1/2t6qkQ9BWuNn7BEH+Mx8SJeQIYkd3wh0
         8Gn36s4poNBnLzb5f8P3JJ9/eCAlSE2UnVK0nzMJq/9Pka1UL8dJw4OF95+4XlVFseCc
         YGLYz6ze2NW22wYahi79el8MQ9WkXhbaV4WmxX0ApeADM0m/gUIkzM8yycXvRgKPf1nG
         90Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725986010; x=1726590810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFfMkDYXZPLJdUTgIYew6jPC6YGMQaOmTQEFFB//QM4=;
        b=CoOt3WUabYdLiyWGjh1b0ZTQOhUngLOAVe0OLooOUFHFM3vN49iYwYqf4AEPZ6ync6
         cSK9dJ4oSDO63tqdos1hTXC+lep+8ch/5WU+uBoGl377VTNAz8FQW0MRc0QMIzW/72tf
         3/m77d8KRcltuSDXCs9G/a/elug+UexxmW7bb8+IW5JFFM7jpxoJ9qrcenswDQisLJZU
         4TdYS3ix6XjL2J4dmyN/hFSIhWRWhbiKBbf2xESN2p7NIAo/Y8Y4X4qDaQLyLeqTxzP2
         mwYoPbe4gzpnGZBOSDtJ+MbNBUcyaAJm6s/NfIxYaJ8FDlwdpPj4T1pTYqy2UBMME3Sw
         /Jtw==
X-Gm-Message-State: AOJu0Yww9binZ7ghkgyRxu7SPPWyMKOQcF2vq2f6aGlQgm3yqLnq3sLx
	UbPqyPHNqMgnr2IONaF/FgLP1AEEq31A9Y70MoVoY3pH/MMaV/dIN7UOukzoXXncmrs1+arPNGB
	VC21W1jaIxDPhXWaxg8ZE/KHawV4KArN1
X-Google-Smtp-Source: AGHT+IEE/7hv0qEyR5P+76h9gyE4ojW+HUGtvQua0S0Z/seRPRDfucBBUdIV7jfkK9S+KN2iADnCjlPVoELVkQW9bG0=
X-Received: by 2002:a05:6808:11c7:b0:3db:2afc:ad6 with SMTP id
 5614622812f47-3e02a02daefmr17042409b6e.38.1725986009638; Tue, 10 Sep 2024
 09:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240910163139.2913214-1-ross.burton@arm.com>
In-Reply-To: <20240910163139.2913214-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Sep 2024 09:33:03 -0700
Message-ID: <CAMKF1srvjgfw73gc+PxEF4-bbrERXuUv0gd9NFP9QUSwLwP0UQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-samples: limit to aarch64/x86-64
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 16:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204359

On Tue, Sep 10, 2024 at 9:31=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> This package is only tested upstream for aarch64 and x86-64 targets,
> for example there are int/long cast issues on 32-bit platforms and ATSC
> is only ported to aarch64/x86-64.
>
> Instead of listing the machines where we know it doesn't work, limit the
> recipe to machines where it is known to work.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/re=
cipes-graphics/vulkan/vulkan-samples_git.bb
> index 93d4cdfdd9e..06e996d2435 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> @@ -36,4 +36,4 @@ EXTRA_OECMAKE +=3D "-DCMAKE_DISABLE_PRECOMPILE_HEADERS=
=3DON"
>  # This needs to be specified explicitly to avoid xcb/xlib dependencies
>  EXTRA_OECMAKE +=3D "-DVKB_WSI_SELECTION=3DD2D"
>
> -COMPATIBLE_HOST:x86 =3D "null"
> +COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"

LGTM.
Reviewed-by: Khem Raj <raj.khem@gmail.com>

> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204358): https://lists.openembedded.org/g/openembedde=
d-core/message/204358
> Mute This Topic: https://lists.openembedded.org/mt/108378166/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

