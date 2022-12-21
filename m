Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3439C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 16:39:44 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.23301.1671640783120138098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 08:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UqoF6AFO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso1866955wmb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 08:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dg0bMFh10qVJMnZPycCMFStWljJmMskvHHn36bfCgwc=;
        b=UqoF6AFOKACozvtvxyyXY1i0aLBryKrncQNNZ7j5ka5aT7h2OvHQ+wBzTnFv7GIWkG
         8XXkj+joMz6DqHw38VtDCAYESlNwCu9svD0Q1eZFL4VVFfKRL+4yDgZ0Pbzzqm2+Nl81
         thuP5Lg15GHDqYyxwKxU1E3dUP9mFyLIBKsaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dg0bMFh10qVJMnZPycCMFStWljJmMskvHHn36bfCgwc=;
        b=FF8gkUokASeue4EyYXG4+gsVlzBDbq0oThsPUkV4Ko20eF83ms4/6nCMNcj/rKP/PW
         uY0rmfZwGKs8EJ9icd39/Grvbktso06Kjjlc+q/O4E1RXTZ48UeEKH5DqMXBwdcgTFSH
         DndLCvFeIUUZHmuEBFKkgUHCl9qjkTmpRRtESMoc/KmFihabfZQJjEgRyb56lt13Zac6
         yJWA9N4kqao77NpYh3P/NwAHUHW0K50Ee3KgpoggjYc6/PdJpEp/by28yn+h2ot0ivIm
         a3LKBaD/Yhv4jtxac1sln9rAiB2+Np1sFNq53fkUGinJ5ctoWs7z0Zg33L1NyShyV4nW
         VXEg==
X-Gm-Message-State: AFqh2kpFu1viAx3Zn5+q1i7cBYYE03z/L7EkG/XGc8Afse54TT+7Sjrj
	1iKdC/EAEGtvWzTlgtWMBQcQVQ==
X-Google-Smtp-Source: AMrXdXt0YDxfWlgx8bPJ7+rKRjknLvBZ6gbzh1cKSy38JNJhu5WedHS/zgTHMDrZ8yoORauU9oR6NA==
X-Received: by 2002:a05:600c:17c5:b0:3d1:ebdf:d591 with SMTP id y5-20020a05600c17c500b003d1ebdfd591mr2084637wmo.15.1671640781241;
        Wed, 21 Dec 2022 08:39:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e749:b020:2cdb:af31? ([2001:8b0:aba:5f3c:e749:b020:2cdb:af31])
        by smtp.gmail.com with ESMTPSA id p19-20020a1c5453000000b003d2157627a8sm2762105wmi.47.2022.12.21.08.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 08:39:40 -0800 (PST)
Message-ID: <abe8931d3e41dae57f13ab07a8e016c2ded2827f.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2 09/10] packagegroup-core-sdk: Add SDK
 toolchain language selection support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2022 16:39:40 +0000
In-Reply-To: <20221221125306.13779-10-alex.kiernan@gmail.com>
References: <20221221125306.13779-1-alex.kiernan@gmail.com>
	 <20221221125306.13779-10-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 16:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174922

On Wed, 2022-12-21 at 12:53 +0000, Alex Kiernan wrote:
> Use SDK_TOOLCHAIN_LANGS to allow different language support to be
> selected within SDKs. Initially supported options are rust and go.
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>=20
> (no changes since v1)
>=20
>  .../packagegroups/packagegroup-core-sdk.bb             | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/m=
eta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> index d70aff22c725..0e480e6ac756 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> @@ -11,6 +11,11 @@ inherit packagegroup
> =20
>  #PACKAGEFUNCS =3D+ 'generate_sdk_pkgs'
> =20
> +SDK_TOOLCHAIN_LANGS ??=3D ""
> +SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 =3D "rust"
> +# libstd-rs doesn't build for mips n32 with compiler constraint errors
> +SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 =3D "rust"
> +
>  RDEPENDS:packagegroup-core-sdk =3D "\
>      packagegroup-core-buildessential \
>      coreutils \
> @@ -23,7 +28,10 @@ RDEPENDS:packagegroup-core-sdk =3D "\
>      less \
>      ldd \
>      file \
> -    tcl"
> +    tcl \
> +    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-s=
dk-target', '', d)} \
> +    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust', 'packagegroup-ru=
st-sdk-target', '', d)} \
> +"

I'm a little torn on this. I created SDK_TOOLCHAIN_LANGS as a control
for the SDKs from populate_sdk. Whether the target SDK images should
follow that as well, I'm less sure.

It is probably fine and I nearly didn't send a comment but I just
wanted to see what others think.

We could perhaps do something like:

TARGET_TOOLCHAIN_LANGS ??=3D "${SDK_TOOLCHAIN_LANGS}"

in the recipe to cover the ability to separate the two if we wanted...

Cheers,

Richard




