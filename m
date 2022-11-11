Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AA8C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 13:42:23 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.5473.1668174138927080658
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 05:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hxqu8cU8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 187-20020a1c02c4000000b003cf9c3f3b80so5630214wmc.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 05:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/XE3+YZfAeg6a8Yt3tbLGpDxL/VDl1z+H5Q9P2LMpOI=;
        b=Hxqu8cU8nomnJmoJX9VqTEPCuXl50akKq6LhJ/6nHcEgxitUX1GBkSxQnaizNVZHfo
         AYsQYWwa6cc05uLMQCiXCulOCnxIbcEoe1NSlhp3wJNTcdeArpq4iFGSF6nZ+ryX9Nku
         3C4LI67SJnZ2lFOTnFpFZJh4o0jTJam63TXUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/XE3+YZfAeg6a8Yt3tbLGpDxL/VDl1z+H5Q9P2LMpOI=;
        b=oBpKHtqyCxsjUL8Wk03zax2DIEECmWZUSPiOSlr/K4a25Q7q3HN6tNfkkTSLj0Wewm
         dbCL0z2re87ub34EdOQfQ8Nj54Sd8zb8+ZfnoNP2xNf7t1lsh1Nj6DFb/skPrDC8kV41
         ju8sP7aS9JznDchWQSppg4UomMuY0JoltSN2DJnQS+OeVOWqrFRNfTmMk5v60gN6tvKG
         /oSZjAgt4iB9ZEFmGefl3bngn/qF81Zpisy57zzDW7haQ+C1CFcFsgdFm0tVQeeG1HTT
         HVGA5Twyn8svhi+B8CmX4vPr1GRMiZd1EiFe6ljZ4cpBcsm9MvO9G3sCICgDfH/XYLpg
         csqw==
X-Gm-Message-State: ANoB5pksLRUnk0ap1Lko4VWpiW6wI99iA5T/8W403UiTDmW3k1zenAfj
	wyzJVkN9YZgjk639+vwzTnKuSA==
X-Google-Smtp-Source: AA0mqf61ZoBdW/aoBQiiLjmMF73gOEjpZ7eFHWlPxaZlKiaRoD/p03uZ5AWLvxm1fXVCk6okkbci+g==
X-Received: by 2002:a05:600c:3d89:b0:3cf:760a:fbaf with SMTP id bi9-20020a05600c3d8900b003cf760afbafmr1319044wmb.110.1668174137334;
        Fri, 11 Nov 2022 05:42:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2115:4271:c44b:61ee? ([2001:8b0:aba:5f3c:2115:4271:c44b:61ee])
        by smtp.gmail.com with ESMTPSA id z13-20020adff1cd000000b0024166413a4fsm1938356wro.37.2022.11.11.05.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 05:42:16 -0800 (PST)
Message-ID: <dc30d84efdfb5a2ae0802d247729d32bfe106234.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 10/19] libxext: update 1.3.4 -> 1.3.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Fri, 11 Nov 2022 13:42:15 +0000
In-Reply-To: <20221110181249.1240200-10-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
	 <20221110181249.1240200-10-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 13:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173130

On Thu, 2022-11-10 at 19:12 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-graphics/xorg-lib/a              | 33 +++++++++++++++++++
>  .../{libxext_1.3.4.bb =3D> libxext_1.3.5.bb}    |  7 ++--
>  2 files changed, 36 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-graphics/xorg-lib/a
>  rename meta/recipes-graphics/xorg-lib/{libxext_1.3.4.bb =3D> libxext_1.3=
.5.bb} (75%)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/a b/meta/recipes-graphics/xor=
g-lib/a
> new file mode 100644
> index 0000000000..a5a08000df
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/a
> @@ -0,0 +1,33 @@
> +libdmx_1.1.4.bb
> +libfontenc_1.1.6.bb
> +libice_1.0.10.bb
> +libpciaccess_0.17.bb
> +libsm_1.2.3.bb
> +libx11_1.8.1.bb
> +libx11-compose-data_1.6.8.bb
> +libxau_1.0.10.bb
> +libxcomposite_0.4.5.bb
> +libxcursor_1.2.1.bb
> +libxdamage_1.1.5.bb
> +libxdmcp_1.1.3.bb
> +libxext_1.3.4.bb
> +libxfixes_6.0.0.bb
> +libxfont_1.5.4.bb
> +libxfont2_2.0.6.bb
> +libxft_2.3.6.bb
> +libxi_1.8.bb
> +libxinerama_1.1.5.bb
> +libxkbfile_1.1.1.bb
> +libxmu_1.1.4.bb
> +libxpm_3.5.13.bb
> +libxrandr_1.5.2.bb
> +libxrender_0.9.11.bb
> +libxres_1.2.1.bb
> +libxscrnsaver_1.2.3.bb
> +libxshmfence_1.3.1.bb
> +libxt_1.2.1.bb
> +libxtst_1.2.4.bb
> +libxv_1.0.11.bb
> +libxvmc_1.0.13.bb
> +libxxf86vm_1.1.5.bb
> +xtrans_1.4.0.bb

What does this do? ;-)

> diff --git a/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb b/meta/recip=
es-graphics/xorg-lib/libxext_1.3.5.bb
> similarity index 75%
> rename from meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb
> rename to meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
> index a0ba54d184..d4d4119485 100644
> --- a/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb
> @@ -11,7 +11,7 @@ extensions."
>  require xorg-lib-common.inc
> =20
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D879ce266785414bd1cbc3bc2f4d9d=
7c8"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4234bb3b2f1521ea101e4e9db7c33=
c69"

License change not mentioned in the commit.

Cheers,

Richard


