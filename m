Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274E6C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 10:39:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.163544.1673865584468474536
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 02:39:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hIy7atTy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso3570453wmb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 02:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5Ttz+oEr5T406+eTjR8T0/W4lSp3zmJumtKMP06ncs=;
        b=hIy7atTyVwrYox2alGC8WnUBrsTQLutGQpKm78/CuE0zek6FI74x9c2KeGMqMekqM8
         krFbRiP4IK/LIH5ModhncdZMaUzL3kMCtL1NsPKMttAtM0CKYbkm1tbhkAEuou2jAtuy
         UBFR0+2UTbhgxUj0dIziuWachzBD+/v2kMmKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O5Ttz+oEr5T406+eTjR8T0/W4lSp3zmJumtKMP06ncs=;
        b=xi6K0exLUjOQe0XaXTY1TRkibWo/3V/I4e8E6b84caB+L9jbruz38O5Z4c6dV+1MGt
         lh5QvFkcgIPux4dxE6XIJLqg5fgluhAHDLsX3V433331R5sShU8jpGdgYSxp66mygT96
         3TdgzjUXZbG/8riCcuzR1KLWfAoQ81Ex8OhpZX9/aoU4V3IahPtgsmDxKpZdlBZfCQ/f
         mH69qdRUsfZIQWgS5OynwjM44arE3gfXZ35gwJuvnv9oM+rug+QAefBaM071URWxHE3b
         ZgYvUkNZuRIgkT5d5om8EnF3p1/I+soK3qOWYcKOzKspwPNmoo6Lqx81z3js7dlm1gOm
         mz9g==
X-Gm-Message-State: AFqh2kr4Y26WaF4nR6pNxhtXR0mRPE3qa8zm/IwPlPKDukCqEHqc0LGE
	DMCfW68sVMdIU8+d2SBAAMsUfxkp3IocY5qh
X-Google-Smtp-Source: AMrXdXvNMWov3swPtGSjK+XhV9/vh7ef4tE7h4fcF/kFzRmhhBoqdwihS+jnutwk9CpSqAfmLzOJ4g==
X-Received: by 2002:a05:600c:4998:b0:3cf:68d3:3047 with SMTP id h24-20020a05600c499800b003cf68d33047mr65433897wmp.41.1673865582806;
        Mon, 16 Jan 2023 02:39:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2a31:564c:3393:642? ([2001:8b0:aba:5f3c:2a31:564c:3393:642])
        by smtp.gmail.com with ESMTPSA id ay15-20020a05600c1e0f00b003dab77aa911sm6605032wmb.23.2023.01.16.02.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 02:39:42 -0800 (PST)
Message-ID: <f0fbf1beeaf8cafeabf1258f447d16c0484d8d1b.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on
 nativesdk-file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2023 10:39:41 +0000
In-Reply-To: <20230116084809.16470-1-Qi.Chen@windriver.com>
References: <20230116084809.16470-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 10:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175970

On Mon, 2023-01-16 at 16:48 +0800, Chen Qi wrote:
> For now, running `file' inside SDK errors out.
>   file: could not find any valid magic files!
>=20
> This is because nativesdk-rpm exports MAGIC. So let's
> make nativesdk-rpm depend on file for better user
> experiences.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-devtools/rpm/rpm_4.18.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb b/meta/recipes-devto=
ols/rpm/rpm_4.18.0.bb
> index 8eb0ab207e..3b7d4d640a 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> @@ -188,6 +188,7 @@ PROVIDES +=3D "python3-rpm"
>  FILES:python3-rpm =3D "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
> =20
>  RDEPENDS:${PN}-build =3D "bash perl python3-core"
> +RDEPENDS:nativesdk-rpm +=3D "nativesdk-file"

Should we be adding file to ${PN}-build instead?  Which rpm command was
this with? Does anywhere else in rpm have/need this dependency?

Cheers,

Richard



