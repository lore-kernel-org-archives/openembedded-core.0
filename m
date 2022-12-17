Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5111AC4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 08:57:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.4120.1671267414230739656
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 00:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G5RjxY/h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id o5so4571487wrm.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 00:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxstt/pypizPGQ8+UgDZsCyMGCsZp2Qf9DGvUGEF4go=;
        b=G5RjxY/hPM6QVaVzR7tj8k5VynNLcpXBms0hAHFPWWcQ2ahbGaeTPIJ3d+eKS1SAc6
         HZUaj9161Q4I2yw5dpk9rm2Ey6wNrrMK5HH3QfnrzbaJ46Kab9P/fdVHTFlLmIXlXm7h
         DMtel/ZHkwWa3cxFJE5AGUNzdBcWFR0ZntiUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pxstt/pypizPGQ8+UgDZsCyMGCsZp2Qf9DGvUGEF4go=;
        b=Ff/gAB0oxedSpwWoek9mL1JlQ24MeUeYKJ7R+FYfLs/8oM6CzeeyiNl/mQvKo8SuKh
         PafAZo4SmeU69JTl5aMuICJo6TaakWEfzFdiF9Ml1SK6YciOx1XFGJZ9xbiImdU/uxpU
         kIyTOoau7UM4uxsP8LI3dVuF1zIfJMuzbBAYcHBMba7RSFOFfXnbmGRkULADc3mwgz0U
         kEQllZDU5eGqAGiTMvzKNairCaMyzDPo17CtxYAdr0XDne954jpRacunkBz3ftRfKMQ3
         k+jEQctYsAXkRnHOBZidl7459XqelXn2RJMkXvwa8SwUJoAdz5pGHpt4DXzHVUJR37GT
         rxKg==
X-Gm-Message-State: ANoB5pkThwwjcsK0DJb62mDlV+nDgd67ZXMLY5XYm7cXoOPWcolhI9Zz
	iI5VcItZysIeEumSD8rjX+xXpOyYigLhh6hD
X-Google-Smtp-Source: AA0mqf6aLUiCVlZ99RZbAqAHXOsTyD/Zn9DFuYMTXkQJ0x/IDI8rssXNEYuHt7jxEqNnUQgLuEHrHA==
X-Received: by 2002:a5d:678d:0:b0:242:241c:1f97 with SMTP id v13-20020a5d678d000000b00242241c1f97mr22584605wru.52.1671267412501;
        Sat, 17 Dec 2022 00:56:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6? ([2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6])
        by smtp.gmail.com with ESMTPSA id cy4-20020a056000400400b002421ed1d8c8sm4464267wrb.103.2022.12.17.00.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 00:56:52 -0800 (PST)
Message-ID: <2819d42c2b62ba3e815f21adbe07b27cd1d72868.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] rust: Enable building rust from stable,
 beta and nightly channels
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 17 Dec 2022 08:56:51 +0000
In-Reply-To: <20221217012158.923251-1-alejandro@enedino.org>
References: <20221217012158.923251-1-alejandro@enedino.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 08:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174769

On Fri, 2022-12-16 at 18:21 -0700, Alejandro Hernandez Samaniego wrote:
> From: Alejandro Hernandez Samaniego <alejandro@enedino.org>
>=20
> Rust follows the train release model via the stable, beta and nightly cha=
nnels,
> by default we build rust from the stable channel, however there are certa=
in
> features which are only available in the beta or nightly channels.
>=20
> Make these channels available by setting a RUST_CHANNEL variable which de=
faults
> to stable making this change transparent to the user.
>=20
> The snapshot version used by rust during its compilation wont necessarily=
 match
> the version being built, specially if were building from an unstable chan=
nel,
> to avoid confusion rename this to SNAPSHOT_VERSION and use RUST_VERSION f=
or the
> version to be built, which is automatically defined to PV.
>=20
> Append -beta or -nightly to rusts PV for signature awareness.
>=20
> It is important to note that this does not build rust from the beta/night=
ly
> published tarball (which today build rust v1.67.0 and v1.68.0 respectivel=
y),
> instead this builds rust from the current selected version (1.66.0) and e=
nables
> the beta/nightly features for that version.
>=20
> Setting the variable RUST_CHANNEL=3Dnightly results in the following:
>=20
> $ rustc -Vv
> rustc 1.66.0-nightly
>=20
> Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
> ---
>  meta/recipes-devtools/rust/rust-snapshot.inc | 7 ++++---
>  meta/recipes-devtools/rust/rust-source.inc   | 5 +++--
>  meta/recipes-devtools/rust/rust.inc          | 6 +++++-
>  3 files changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-=
devtools/rust/rust-snapshot.inc
> index 222f34f9a8..6420bcff55 100644
> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> @@ -5,7 +5,8 @@
>  ## The version is replicated here.
>  ## TODO: find a way to add additional SRC_URIs based on the contents of =
an
>  ##       earlier SRC_URI.
> -RS_VERSION =3D "1.65.0"
> +
> +SNAPSHOT_VERSION =3D "1.65.0"
>  CARGO_VERSION =3D "1.65.0"
> =20
>  # TODO: Add hashes for other architecture toolchains as well. Make a scr=
ipt?
> @@ -27,6 +28,6 @@ SRC_URI +=3D " \
>      https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=3Dca=
rgo-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
>  "
> =20
> -RUST_STD_SNAPSHOT =3D "rust-std-${RS_VERSION}-${RUST_BUILD_ARCH}-unknown=
-linux-gnu"
> -RUSTC_SNAPSHOT =3D "rustc-${RS_VERSION}-${RUST_BUILD_ARCH}-unknown-linux=
-gnu"
> +RUST_STD_SNAPSHOT =3D "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-u=
nknown-linux-gnu"
> +RUSTC_SNAPSHOT =3D "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown=
-linux-gnu"
>  CARGO_SNAPSHOT =3D "cargo-${CARGO_VERSION}-${RUST_BUILD_ARCH}-unknown-li=
nux-gnu"
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index 1c511917e2..91a6c5a942 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -1,4 +1,5 @@
> -SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;n=
ame=3Drust"
> +RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
> +SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-sr=
c.tar.xz;name=3Drust"
>  SRC_URI[rust.sha256sum] =3D "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428=
d29281a07419c4950715c"
> =20
>  SRC_URI:append:class-target:pn-rust =3D " \
> @@ -6,7 +7,7 @@ SRC_URI:append:class-target:pn-rust =3D " \
>      file://crossbeam_atomic.patch"
>  SRC_URI:append:class-nativesdk:pn-nativesdk-rust =3D " file://hardcodepa=
ths.patch"
> =20
> -RUSTSRC =3D "${WORKDIR}/rustc-${PV}-src"
> +RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> =20
>  UPSTREAM_CHECK_URI =3D "https://forge.rust-lang.org/infra/other-installa=
tion-methods.html"
>  UPSTREAM_CHECK_REGEX =3D "rustc-(?P<pver>\d+(\.\d+)+)-src"
> diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/=
rust/rust.inc
> index 8d25e7993a..37a04e1204 100644
> --- a/meta/recipes-devtools/rust/rust.inc
> +++ b/meta/recipes-devtools/rust/rust.inc
> @@ -13,6 +13,10 @@ DEPENDS:append:class-nativesdk =3D " nativesdk-rust-ll=
vm"
> =20
>  S =3D "${RUSTSRC}"
> =20
> +# Use at your own risk, accepted values are stable, beta and nightly
> +RUST_CHANNEL ?=3D "stable"
> +PV:append =3D "${@bb.utils.contains('RUST_CHANNEL', 'stable', '', '-${RU=
ST_CHANNEL}', d)}"
> +
>  export FORCE_CRATE_HASH=3D"${BB_TASKHASH}"

Did you try it with .=3D instead of append? I'd really prefer not to use
append unless we have to, mainly so we lead by example...

Cheers,

Richard



