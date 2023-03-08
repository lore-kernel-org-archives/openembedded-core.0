Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999F5C64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 18:27:38 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.737.1678300050144896337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 10:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZnaHWU0l;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id m22so7135414ioy.4
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 10:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678300049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdyiSLWGpyS5MhwrSpnVXZh7y2kP1OrGF0q/v4gXuGU=;
        b=ZnaHWU0l520nt5FwODbPkG3Jmo00K5Vyn0QJqSfc/DbEjVNAWqbLOcABnMWO/EQMAj
         uFp34TTaXXV78QiYOtq4fvoIRUVjyTFX8/g1KBSlD/Xi4Nnxc088+71pdGbEPkcIR+M6
         P+3S6nxb46Q/xRZuVb7kgQ4lAll81GgPtrDUuB2RRnSuniUieoijhxBUmdvMi8wpwsWU
         w/0oE1RIFzccblofkU2Ij4o6GF4ezDBv5QccHnVFUCOzktIcVQHugbK+iwd3IiYPs61i
         YeChtdnYeXKvK+HYdKKYhCROYcw/AErxS0QyqVKGkd3LicbQVGRJltkT2g8GAoyFBJzX
         QIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678300049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdyiSLWGpyS5MhwrSpnVXZh7y2kP1OrGF0q/v4gXuGU=;
        b=uCjaMGkZtmIhj1YplBjdvegIe2V+uyjmFKB00HX2+mYlTOMqn4PZg0kePPIbGGDal2
         O9QZyFtu73lp2fOgFS4kqSPPdcIZX0xJIv/cp3TkQ47ddT8PhIgKy7sGSARuQSLQZmdF
         jgGjFYFEbNICimU8aadfdrWDfx/c3CWpZuNc3rk3iqxOlD1HLlCtOERE+2nrMNg5upR9
         2tODOaoiEopITyao3CDpOe7aaLZkUyqw/Yc04GXXUQWafRpjrMnou0IUp8K8g8TdVCph
         5/cd6lG4iN1i6gkHwYkHMFpU1uSM6yJjHsyLP1nf40htQAF/cSIwgRFn1eM12QYn8s/A
         sY3g==
X-Gm-Message-State: AO0yUKUUa7U8guABXGkHU8E/zWXgXKhptfokXfCuSF88j6Fc1tYHzsJl
	H3+eqsBwH4z3Gx8uVJl4KhyGLIgOF3iwEKH61RU=
X-Google-Smtp-Source: AK7set8MU6ef2AhRIjhO+b+0CJPQ22+HbdXMUDNKLlaZoRzm1U7jMJ3vfKfjc6lSLtxPFX5174qmiUlMxlr4T0YNXm0=
X-Received: by 2002:a02:952e:0:b0:3c4:e84b:2a3a with SMTP id
 y43-20020a02952e000000b003c4e84b2a3amr9259593jah.4.1678300049229; Wed, 08 Mar
 2023 10:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20230308172909.2052236-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20230308172909.2052236-1-sundeep.kokkonda@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 8 Mar 2023 18:27:16 +0000
Message-ID: <CAO5Uq5Q4WoOr_o5k=mVJ+gNn=7JO+WLmfjp2V4HxEj7sShXjxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: added missing runtime dependencies to run
 rust on target
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: openembedded-core@lists.openembedded.org, rwmacleod@gmail.com, 
	umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, shivams@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 18:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178188

On Wed, Mar 8, 2023 at 5:30=E2=80=AFPM Sundeep KOKKONDA
<sundeep.kokkonda@gmail.com> wrote:
>
> [YOCTO #14975]
> rust files are not linking on target due to missing dependencies and obse=
rved below error.
> error: linker `x86_64-poky-linux-gcc` not found
>
> Added the required dependencies to run rust on target machine.
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
>  meta/recipes-devtools/rust/rust_1.67.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.67.1.bb b/meta/recipes-dev=
tools/rust/rust_1.67.1.bb
> index 2118faec8f..f4c6d9511d 100644
> --- a/meta/recipes-devtools/rust/rust_1.67.1.bb
> +++ b/meta/recipes-devtools/rust/rust_1.67.1.bb
> @@ -13,6 +13,8 @@ DEPENDS:append:class-nativesdk =3D " nativesdk-rust-llv=
m"
>
>  DEPENDS +=3D "rust-llvm (=3D${PV})"
>
> +RDEPENDS:${PN}:append:class-target =3D " gcc g++ binutils"
> +

I did some digging a while ago (so it may have drifted) - I got to
this list, which avoided g++

gcc gcc-symlinks binutils ${LIBC_DEPENDENCIES} libgcc-dev

What I don't understand is why doesn't gcc have a dependency on binutils?

>  # Otherwise we'll depend on what we provide
>  INHIBIT_DEFAULT_RUST_DEPS:class-native =3D "1"
>  # We don't need to depend on gcc-native because yocto assumes it exists
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178186): https://lists.openembedded.org/g/openembedde=
d-core/message/178186
> Mute This Topic: https://lists.openembedded.org/mt/97477865/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

