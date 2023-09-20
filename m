Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39413CE79C2
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:41:27 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.34794.1695206480655762113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NTtixsC6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40479f8325fso59587865e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695206479; x=1695811279; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPW0X1mEfZWLziKE0B6i2s812/RdKdfGRk0V0CargKc=;
        b=NTtixsC6s3LPrZOskfWo9vhWm5bT0eafuMbFB+SudyHZF0lyte8rrqQlrvfIwVeVEw
         vbzyYWYb5JcKA94ueDSpt92AC4g2T+nzEOOjbLvqZNvBxqIlVI28ONxcleNHsfzP2h3F
         kCjC9EEt2JNyDVsW9atfiz3rPjHr8F/PJYzlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695206479; x=1695811279;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TPW0X1mEfZWLziKE0B6i2s812/RdKdfGRk0V0CargKc=;
        b=KJng6Nk4FAiD9cXLQ//OiPN310MEmAlpPt6d9LCskqn6NPYXbV9RvUfudBalpaRV14
         ayDOg4LyMMua02UtmWw2kpJ0c9WwiysqmKe6bbxQM5Dsg9g+Wt4LVegwY9t52uRMMqze
         j427mI88hwRk6V+pG+qVLZfXFZO1HNA0niFBhz+l1PY5U/1XdMflAFy9Y2WlWTNHLZAm
         Ij2ulFgFdhNII4oi5Kmi4WWnO2thvTFVE9zh/dKWVf7iiTdvMEJFyTeZobTURuiSAqFI
         upEKVdbUw+M/R4H/16Ydl3HisTQgyevM1EBIR7lDi/FiFJBJN/j0pGIGF/1k2dGegnll
         IVEg==
X-Gm-Message-State: AOJu0Ywnlylee+qszSpONWEbaWP2AVXIliB8RaEYa+bvNiPvrP86a0UX
	ovWfMz5bsJWE/WcMYJrKCmxx8AvqejBkpA+TQzQ=
X-Google-Smtp-Source: AGHT+IGm48C5GI1X2+th7bY6OPVtiQqse16ofFZd5Fjy5wK1w9xDjUoPX3vdy38DKIPaicF2eR6S6g==
X-Received: by 2002:a05:6000:118d:b0:31f:f9fe:e739 with SMTP id g13-20020a056000118d00b0031ff9fee739mr1872740wrx.59.1695206478900;
        Wed, 20 Sep 2023 03:41:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:34a6:a1c2:97a:851d? ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id e1-20020a5d65c1000000b00315af025098sm18133322wrw.46.2023.09.20.03.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:41:18 -0700 (PDT)
Message-ID: <7f68f713e1415261131f0b01a05d7ba8258bb048.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] multilib.conf: Remove the incorrect
 PKG_CONFIG_PATH setting
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2023 11:41:17 +0100
In-Reply-To: <20230920090617.3414561-1-mingli.yu@windriver.com>
References: <20230920090617.3414561-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 10:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187916

On Wed, 2023-09-20 at 17:06 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> The PKG_CONFIG_PATH is set as ${WORKDIR}/recipe-sysroot/${datadir}/pkgcon=
fig
> in multilib.conf. But there is no ${WORKDIR}/recipe-sysroot when multilib
> enabled such as below:
>   $ bitbake lib32-php
>   There is no ${WORKDIR}/recipe-sysroot and only ${WORKDIR}/lib32-recipe-=
sysroot
> exists which already covered in meta/conf/bitbake.conf as below:
> export PKG_CONFIG_PATH =3D "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfi=
g"
>=20
> So remove the incorrect setting in multilib.conf.
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/conf/multilib.conf | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index ef3605a73d..09546315b8 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -22,15 +22,6 @@ MULTILIB_GLOBAL_VARIANTS ?=3D "lib32 lib64 libx32"
> =20
>  OPKG_ARGS:append =3D " --force-maintainer --force-overwrite"
> =20
> -# When multilib is enabled, allarch recipes will be installed into the M=
ACHINE
> -# sysroot, not MLPREFIXMACHINE.  This means that anything using pkg-conf=
ig to
> -# find an allarch pkgconfig file will fail as the PKG_CONFIG_PATH only l=
ooks
> -# inside the multilib sysroot.  Fix this by explicitly adding the MACHIN=
E's
> -# architecture-independent pkgconfig location to PKG_CONFIG_PATH.
> -PKG_CONFIG_PATH .=3D ":${WORKDIR}/recipe-sysroot/${datadir}/pkgconfig"
> -PKG_CONFIG_PATH[vardepsexclude] =3D "datadir WORKDIR"
> -PKG_CONFIG_PATH[vardepvalueexclude] =3D ":${WORKDIR}/recipe-sysroot/${da=
tadir}/pkgconfig"
> -
>  # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDE=
S
>  # ${MLPREFIX}${BPN}
>  NON_MULTILIB_RECIPES =3D "grub grub-efi make-mod-scripts ovmf u-boot"

I'm not sure this is correct, did you check something with a dependency
on an allarch recipe that has a pkgconfig file?

Cheers,

Richard

