Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EE3C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 17:21:51 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.51675.1681147303284145200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 10:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N+18nvPU;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id f10-20020a9d2c0a000000b006a13f728172so478878otb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681147302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7uilkk9hLKqC0tqhDxJlLHRzWGuRzyWlfcj+2Z8hQk=;
        b=N+18nvPUiaHN5FybOK+3djirElfHSkZa5iHQYctNpAgXbseccJH2D/QXUbd1Ny+ols
         dyJNzMbOw5URDddY687kFis+VVsROtI1ZXbMYCU4acdsVN/ta2IY9P70L/BnKz+i/Yq2
         uPBroT75IbSr4EqoJu2lFoIJni/hGmmxRqAnGQoxiWxqKyFIef6L/fzHlsI5TaQTdUNM
         dEqrMTxgZM+8J7zjTScS9nHsAALRczbJ40HwFMg2ugDyqK8P4JNoXn7nD8ErBT5MG3QA
         MOpi0AJIUkS4wvsnBUefEVeE2Jm4Ia/PA1V64vShsS1bzh77J2lUeq1oLnBmGcH3un1U
         VArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681147302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7uilkk9hLKqC0tqhDxJlLHRzWGuRzyWlfcj+2Z8hQk=;
        b=8JemNvDcQ52KI6UtXuRN2vGurCUZYwe7gYOEm9PAqKffAmpONkzVCW6XUZJKxNlNSX
         rYI0i58eOuZilGuJWahSNG0wOfL0ur9UmQjhc/1ohSGoAqNjGyrEXEQDe48HNjgHYjon
         Ris14N2JukGAeeHwPHKayrWCtFj/4bft3zzcYLToWPDCUQKtHKiWCFAMQV5w1d934TH8
         7w2uJc9km2TYlXovvpKN3nYOwMcVi8QEosngMkqbwpKbKRLHCEcwnNy/359YACRzJtG8
         GYFoVZMCbWnNnzroBxOjrG+NuLiHpqz35IlIr8vXO3rgXEVpTIi/AOgCiUu0OwAf/clQ
         49Xw==
X-Gm-Message-State: AAQBX9dy1V1uvyl+FtoCJxONirWBO+hv8eLl1m5XJn9H0SnV/dqFhOAS
	pUeSjTVaTdGl3LG5b/b4MyIFr/5klQFbX6vjQc4=
X-Google-Smtp-Source: AKy350ZOZv55rtyd77QMIhDLKCKEM2HVmEMiIUtUNnZvkSMwNESESyen4w3JhAk13O5VyfVvLVhbEQ8v7+RHcrPdJ/4=
X-Received: by 2002:a05:6830:12d0:b0:69f:a43d:f6c5 with SMTP id
 a16-20020a05683012d000b0069fa43df6c5mr56278otq.2.1681147302468; Mon, 10 Apr
 2023 10:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230410094122.5865-1-alex.kiernan@gmail.com>
In-Reply-To: <20230410094122.5865-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Apr 2023 10:21:16 -0700
Message-ID: <CAMKF1sq_jvEn5VYmAnRj8HKrXtGAWj8cmD+O6eRHiBqdsLf_EQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.68.1 -> 1.68.2
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 17:21:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179897

If possible, Can you test this on top of contrib/abelloni/master-next
for musl target ?

On Mon, Apr 10, 2023 at 2:42=E2=80=AFAM Alex Kiernan <alex.kiernan@gmail.co=
m> wrote:
>
> Changes:
>
> * Update the GitHub RSA host key bundled within Cargo. The key was
>   rotated by GitHub on 2023-03-24 after the old one leaked.
> * Mark the old GitHub RSA host key as revoked. This will prevent Cargo
>   from accepting the leaked key even when trusted by the system.
> * Add support for @revoked and a better error message for
>   @cert-authority in Cargo=E2=80=99s SSH host key verification
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  meta/recipes-devtools/rust/{cargo_1.68.1.bb =3D> cargo_1.68.2.bb} | 0
>  .../rust/{libstd-rs_1.68.1.bb =3D> libstd-rs_1.68.2.bb}           | 0
>  ...t-cross-canadian_1.68.1.bb =3D> rust-cross-canadian_1.68.2.bb} | 0
>  .../rust/{rust-llvm_1.68.1.bb =3D> rust-llvm_1.68.2.bb}           | 0
>  meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
>  meta/recipes-devtools/rust/{rust_1.68.1.bb =3D> rust_1.68.2.bb}   | 0
>  6 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/rust/{cargo_1.68.1.bb =3D> cargo_1.68.2.bb}=
 (100%)
>  rename meta/recipes-devtools/rust/{libstd-rs_1.68.1.bb =3D> libstd-rs_1.=
68.2.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.68.1.bb =3D> ru=
st-cross-canadian_1.68.2.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-llvm_1.68.1.bb =3D> rust-llvm_1.=
68.2.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust_1.68.1.bb =3D> rust_1.68.2.bb} (=
100%)
>
> diff --git a/meta/recipes-devtools/rust/cargo_1.68.1.bb b/meta/recipes-de=
vtools/rust/cargo_1.68.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/cargo_1.68.1.bb
> rename to meta/recipes-devtools/rust/cargo_1.68.2.bb
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.68.1.bb b/meta/recipe=
s-devtools/rust/libstd-rs_1.68.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/libstd-rs_1.68.1.bb
> rename to meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.68.1.bb b/m=
eta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.68.1.bb
> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.68.1.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.68.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-llvm_1.68.1.bb
> rename to meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index c8f5a5a9c4c4..6d3a4b131e26 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -7,7 +7,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${R=
UST_VERSION}-src.tar.xz;n
>              file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchd=
ir=3D${RUSTSRC} \
>              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
>  "
> -SRC_URI[rust.sha256sum] =3D "5b8ea94085b65e75c1fa6310e2f90bd706fa80bfcb3=
544fe26f4037b911d9fb2"
> +SRC_URI[rust.sha256sum] =3D "ce1a115f6aafa912b4622906a92b626354973afa928=
8e2c7750df4dcf3390fc0"
>
>  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
>
> diff --git a/meta/recipes-devtools/rust/rust_1.68.1.bb b/meta/recipes-dev=
tools/rust/rust_1.68.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust_1.68.1.bb
> rename to meta/recipes-devtools/rust/rust_1.68.2.bb
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179885): https://lists.openembedded.org/g/openembedde=
d-core/message/179885
> Mute This Topic: https://lists.openembedded.org/mt/98172309/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

