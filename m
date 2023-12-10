Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99052C4167B
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 19:39:39 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.62159.1702237169925447444
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 11:39:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cK8izEy/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3333a3a599fso2497966f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 11:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702237168; x=1702841968; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=di0Xsu0Q4ADndVDkSYxoBTjYsQYMf8EOlh4k2O+WoI4=;
        b=cK8izEy/b9Ypro5IFn5rhJV5TrUe3ExavL/g4uluoOLLTuTLP0gXTHsiNnRW4Army4
         6uO+jRyARnXiiZ1HxaAbHVhDxIcvUQiNfINaBd4/A4mTxeluUc+6BIbBUZJwXrY49enG
         zHpjZUin/D+abTGKdIrpwry8QwfJdWA1LdKgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702237168; x=1702841968;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=di0Xsu0Q4ADndVDkSYxoBTjYsQYMf8EOlh4k2O+WoI4=;
        b=sK/DBvBnJjWuPw+j+Xw5QX2aMqUQ3UnnPVs26axm4z05eO7sePoEcLtJDnUcPp5DNP
         LWqIadem6Ac/YpNKOYCA/FgkyYB5uho31n+YWaL/1QFPC9qbx6cx7UXYFjq0BAxg9U4A
         slzDvMzyPfC3bZFpWbFGTPlGeBAUaAJrgARPYlXVfBpSgPcKWaQBX6QYzl4HMrq1fb96
         2VuKLdtA5Z5cxm3o1B8Ofopu/rMmAz24IiO+ZnbVbKaKk2gblzRIxtonB7VCh4ghIAhB
         PwOCFB9LcZ6Kp2XePOS30xw7KT1VXh+bLRP10mRdKKBlOerNeflZi6Msks+Vr6DF4pQ1
         DLaA==
X-Gm-Message-State: AOJu0YwqbNsh0qgn7FACqR14lmWCdx5bnSUzz7rSUOs7eD6r/dD5tOcL
	yEVu/72NrlqJ2vWQIAQ5hSiJNg==
X-Google-Smtp-Source: AGHT+IE98CNga/1QBDl7C+CaSF2wEwfuHwbmatbKjXKQZmJZAsTd2tE5pAuiuvrTSJBslCvF66Q6AQ==
X-Received: by 2002:a5d:6a81:0:b0:32f:7ff9:b731 with SMTP id s1-20020a5d6a81000000b0032f7ff9b731mr1610583wru.1.1702237168389;
        Sun, 10 Dec 2023 11:39:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:659f:462d:68c0:d464? ([2001:8b0:aba:5f3c:659f:462d:68c0:d464])
        by smtp.gmail.com with ESMTPSA id e10-20020adffd0a000000b003334675634bsm6926183wrr.29.2023.12.10.11.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 11:39:28 -0800 (PST)
Message-ID: <a394853b1f2302baab431afe6fd0a1880b8238bd.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 3/7] rust: Upgrade 1.71.0 -> 1.71.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 10 Dec 2023 19:39:24 +0000
In-Reply-To: <20231208140349.3576-3-alex.kiernan@gmail.com>
References: <20231208140349.3576-1-alex.kiernan@gmail.com>
	 <20231208140349.3576-3-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 19:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192118

On Fri, 2023-12-08 at 14:03 +0000, Alex Kiernan wrote:
> https://blog.rust-lang.org/2023/08/03/Rust-1.71.1.html
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>=20
>  meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D> cargo_1.71.1.bb} | 0
>  .../rust/{libstd-rs_1.71.0.bb =3D> libstd-rs_1.71.1.bb}           | 0
>  ...t-cross-canadian_1.71.0.bb =3D> rust-cross-canadian_1.71.1.bb} | 0
>  .../rust/{rust-llvm_1.71.0.bb =3D> rust-llvm_1.71.1.bb}           | 0
>  meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
>  meta/recipes-devtools/rust/{rust_1.71.0.bb =3D> rust_1.71.1.bb}   | 0
>  6 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/rust/{cargo_1.71.0.bb =3D> cargo_1.71.1.bb}=
 (100%)
>  rename meta/recipes-devtools/rust/{libstd-rs_1.71.0.bb =3D> libstd-rs_1.=
71.1.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.71.0.bb =3D> ru=
st-cross-canadian_1.71.1.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-llvm_1.71.0.bb =3D> rust-llvm_1.=
71.1.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust_1.71.0.bb =3D> rust_1.71.1.bb} (=
100%)
>=20
> diff --git a/meta/recipes-devtools/rust/cargo_1.71.0.bb b/meta/recipes-de=
vtools/rust/cargo_1.71.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/cargo_1.71.0.bb
> rename to meta/recipes-devtools/rust/cargo_1.71.1.bb
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.71.0.bb b/meta/recipe=
s-devtools/rust/libstd-rs_1.71.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
> rename to meta/recipes-devtools/rust/libstd-rs_1.71.1.bb
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb b/m=
eta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb
> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.71.0.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.71.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
> rename to meta/recipes-devtools/rust/rust-llvm_1.71.1.bb
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index 3a192e42db7d..0729db6f0b45 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -7,7 +7,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${R=
UST_VERSION}-src.tar.xz;n
>              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
>              file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch=
;patchdir=3D${RUSTSRC} \
>  "
> -SRC_URI[rust.sha256sum] =3D "5814699031aafdcc2e2f71fc9b389678cd7042350d1=
583da061463d8e88681c7"
> +SRC_URI[rust.sha256sum] =3D "371af0fbe04051e20a74dbea6d4e4e548f10f15309c=
49cae2688afb882b6c7f1"
> =20
>  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> =20
> diff --git a/meta/recipes-devtools/rust/rust_1.71.0.bb b/meta/recipes-dev=
tools/rust/rust_1.71.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust_1.71.0.bb
> rename to meta/recipes-devtools/rust/rust_1.71.1.bb

I ran some testing and it looks like we could merge up to 1.71.1
without autobuilder failures in this series. Beyond that we have the
reproducibility and zvariant issues.

Cheers,

Richard



