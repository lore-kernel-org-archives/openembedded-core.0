Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E75C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 18:59:18 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.2518.1709060348419873671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 10:59:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TbBPOy41;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-609228c4171so13588397b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 10:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709060347; x=1709665147; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qMG/DgcogfGjzUBVJY1iu3JmigDpYwxactu/Iw1Ic54=;
        b=TbBPOy41guhGGInohX7EYvzVSMuSNe20hXFu0+lrY9OBNuHmUwI3AL2+uPKbQcsEGW
         QmzLJOcYPBfuUDdAO1MJ9DEB+gYShjiuoOO8Dels5nuMllpOev4A4mIa0z6dtJRqZzVd
         yVYS0VuFvh1E4FqkC161YZToegaLfR+08IyfJANx+ew9tkSdjf9PhXtmFqaZpHPXyAoC
         ws7G+z9LFzcOtBoyRvVxA99FbbDxqS2NIVYe1xyZ5MbZ/yrZxuT3ZurroAD3Qz31AL0a
         MBuCEBihH8tgJsxOFUunsH8DQa03N4Hm/yZqgT1iFTvHM5U3dSh8idr37w6wPMhWeyk3
         acKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709060347; x=1709665147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMG/DgcogfGjzUBVJY1iu3JmigDpYwxactu/Iw1Ic54=;
        b=qWCGmU+7hKS441KcLytXmuoBsNdFddqoziaq8gRQHQx1SuG4ajauXCLhXM/iK67FjR
         sXCsvJtaCXhaUXm03FPIrMH6V+wwz9BV8UeXmH72MeIJgnH+rWWnHYDZLfS9giYMyVEq
         5KTR7+xPF/4wJIgEoUrVarY/gHIke5iQKo7dsDg9OtfQYRNU4A7wLGY2U3kWxi8O+YjS
         Nd2YZp+vcauy/QMOzlnZ/TEHcSOcGXh1uJfjTafSoAS0wTFpg4oDz12SPqvCCaOeuC1R
         6s694ZvQJTW2LVGrJZ4HPozwayVzdZ5on6t9WxrlpNx8AM0JFx8rIgMN6ZKa5047vclH
         nwyw==
X-Gm-Message-State: AOJu0YxImGjA6xYMhcNcHgD8m+zVfK2D6uK250nP1o9ctWAkeRPyhH7M
	oejJpRfAkB8T7JuwIGZj8DAG85bZGteK3vMMyLinRHVM1OmoQlIOnZip6c+/2qvofEi/ciVNPU6
	mGiBbyIjGnkp28O7QF/cKjVpB+yUHtmzZWzg=
X-Google-Smtp-Source: AGHT+IGZsv5lqdeeUO0CHiU0SS28glmiiLADisfBOIbbH2MF7vMIUOGrgAuUmy4s86hmkS4FHQ3oN7ecu1z6pn/7vQY=
X-Received: by 2002:a81:4409:0:b0:607:9e4b:f0e9 with SMTP id
 r9-20020a814409000000b006079e4bf0e9mr3021886ywa.31.1709060347328; Tue, 27 Feb
 2024 10:59:07 -0800 (PST)
MIME-Version: 1.0
References: <20240227175138.2843184-1-raj.khem@gmail.com> <20240227175138.2843184-2-raj.khem@gmail.com>
In-Reply-To: <20240227175138.2843184-2-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 27 Feb 2024 10:58:56 -0800
Message-ID: <CANx9H-CNxv1N+ETTxdNS9CvbHeYour_YHqfZ0bdpXEWt_yOveA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] python3-cryptography: Update pyo3 crate
 to 0.20.3
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e6fe670612619e46"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 18:59:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196291

--000000000000e6fe670612619e46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 9:51=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> This gets it building on architectures without 64bit atomics.
>
>
We could also upgrade to python3-cryptography 42.0.5
https://cryptography.io/en/latest/changelog/#v42-0-5
Do we want to do that at this stage?


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../python/python3-cryptography-crates.inc    |  22 ++--
>  ...m-0.20.2-to-0.20.3-in-src-rust-10462.patch | 105 ++++++++++++++++++
>  .../python/python3-cryptography_42.0.2.bb     |   1 +
>  3 files changed, 118 insertions(+), 10 deletions(-)
>  create mode 100644
> meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-from-0.2=
0.2-to-0.20.3-in-src-rust-10462.patch
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> index 4714c76bd2b..b26e22b70c3 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> @@ -25,12 +25,13 @@ SRC_URI +=3D " \
>      crate://crates.io/parking_lot_core/0.9.9 \
>      crate://crates.io/pem/3.0.3 \
>      crate://crates.io/pkg-config/0.3.29 \
> +    crate://crates.io/portable-atomic/1.6.0 \
>      crate://crates.io/proc-macro2/1.0.78 \
> -    crate://crates.io/pyo3/0.20.2 \
> -    crate://crates.io/pyo3-build-config/0.20.2 \
> -    crate://crates.io/pyo3-ffi/0.20.2 \
> -    crate://crates.io/pyo3-macros/0.20.2 \
> -    crate://crates.io/pyo3-macros-backend/0.20.2 \
> +    crate://crates.io/pyo3/0.20.3 \
> +    crate://crates.io/pyo3-build-config/0.20.3 \
> +    crate://crates.io/pyo3-ffi/0.20.3 \
> +    crate://crates.io/pyo3-macros/0.20.3 \
> +    crate://crates.io/pyo3-macros-backend/0.20.3 \
>      crate://crates.io/quote/1.0.35 \
>      crate://crates.io/redox_syscall/0.4.1 \
>      crate://crates.io/scopeguard/1.2.0 \
> @@ -74,12 +75,13 @@ SRC_URI[parking_lot-0.12.1.sha256sum] =3D
> "3742b2c103b9f06bc9fff0a37ff4912935851be
>  SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D
> "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
>  SRC_URI[pem-3.0.3.sha256sum] =3D
> "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
>  SRC_URI[pkg-config-0.3.29.sha256sum] =3D
> "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
> +SRC_URI[portable-atomic-1.6.0.sha256sum] =3D
> "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
>  SRC_URI[proc-macro2-1.0.78.sha256sum] =3D
> "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
> -SRC_URI[pyo3-0.20.2.sha256sum] =3D
> "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
> -SRC_URI[pyo3-build-config-0.20.2.sha256sum] =3D
> "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
> -SRC_URI[pyo3-ffi-0.20.2.sha256sum] =3D
> "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
> -SRC_URI[pyo3-macros-0.20.2.sha256sum] =3D
> "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
> -SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] =3D
> "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
> +SRC_URI[pyo3-0.20.3.sha256sum] =3D
> "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
> +SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D
> "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
> +SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D
> "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
> +SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D
> "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
> +SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D
> "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
>  SRC_URI[quote-1.0.35.sha256sum] =3D
> "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
>  SRC_URI[redox_syscall-0.4.1.sha256sum] =3D
> "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
>  SRC_URI[scopeguard-1.2.0.sha256sum] =3D
> "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
> diff --git
> a/meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-from-0=
.20.2-to-0.20.3-in-src-rust-10462.patch
> b/meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-from-0=
.20.2-to-0.20.3-in-src-rust-10462.patch
> new file mode 100644
> index 00000000000..33dd7ae5d5a
> --- /dev/null
> +++
> b/meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-from-0=
.20.2-to-0.20.3-in-src-rust-10462.patch
> @@ -0,0 +1,105 @@
> +From f6ec5ab18b5beacb08b0157c5193ea626b44b4e1 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 27 Feb 2024 09:30:15 -0800
> +Subject: [PATCH] Bump pyo3 from 0.20.2 to 0.20.3 in /src/rust (#10462)
> +
> +It fixes build on hosts without 64bit atomics
> +
> +Upstream-Status: Backport [
> https://github.com/pyca/cryptography/commit/3598d2ee4b5060dbbe6938b893410=
ed35074567c
> ]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/rust/Cargo.lock | 28 ++++++++++++++++++----------
> + 1 file changed, 18 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/rust/Cargo.lock b/src/rust/Cargo.lock
> +index b2e0ac4..030e38d 100644
> +--- a/src/rust/Cargo.lock
> ++++ b/src/rust/Cargo.lock
> +@@ -263,6 +263,12 @@ version =3D "0.3.29"
> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
> + checksum =3D
> "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
> +
> ++[[package]]
> ++name =3D "portable-atomic"
> ++version =3D "1.6.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D
> "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
> ++
> + [[package]]
> + name =3D "proc-macro2"
> + version =3D "1.0.78"
> +@@ -274,15 +280,16 @@ dependencies =3D [
> +
> + [[package]]
> + name =3D "pyo3"
> +-version =3D "0.20.2"
> ++version =3D "0.20.3"
> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +-checksum =3D
> "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
> ++checksum =3D
> "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
> + dependencies =3D [
> +  "cfg-if",
> +  "indoc",
> +  "libc",
> +  "memoffset",
> +  "parking_lot",
> ++ "portable-atomic",
> +  "pyo3-build-config",
> +  "pyo3-ffi",
> +  "pyo3-macros",
> +@@ -291,9 +298,9 @@ dependencies =3D [
> +
> + [[package]]
> + name =3D "pyo3-build-config"
> +-version =3D "0.20.2"
> ++version =3D "0.20.3"
> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +-checksum =3D
> "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
> ++checksum =3D
> "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
> + dependencies =3D [
> +  "once_cell",
> +  "target-lexicon",
> +@@ -301,9 +308,9 @@ dependencies =3D [
> +
> + [[package]]
> + name =3D "pyo3-ffi"
> +-version =3D "0.20.2"
> ++version =3D "0.20.3"
> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +-checksum =3D
> "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
> ++checksum =3D
> "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
> + dependencies =3D [
> +  "libc",
> +  "pyo3-build-config",
> +@@ -311,9 +318,9 @@ dependencies =3D [
> +
> + [[package]]
> + name =3D "pyo3-macros"
> +-version =3D "0.20.2"
> ++version =3D "0.20.3"
> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +-checksum =3D
> "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
> ++checksum =3D
> "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
> + dependencies =3D [
> +  "proc-macro2",
> +  "pyo3-macros-backend",
> +@@ -323,12 +330,13 @@ dependencies =3D [
> +
> + [[package]]
> + name =3D "pyo3-macros-backend"
> +-version =3D "0.20.2"
> ++version =3D "0.20.3"
> + source =3D "registry+https://github.com/rust-lang/crates.io-index"
> +-checksum =3D
> "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
> ++checksum =3D
> "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
> + dependencies =3D [
> +  "heck",
> +  "proc-macro2",
> ++ "pyo3-build-config",
> +  "quote",
> +  "syn",
> + ]
> +--
> +2.44.0
> +
> diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
> b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
> index c21c4d1a03b..da10e2e60c1 100644
> --- a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
> @@ -11,6 +11,7 @@ LDSHARED +=3D "-pthread"
>  SRC_URI[sha256sum] =3D
> "e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433219dc8c93827c57eab6cf888"
>
>  SRC_URI +=3D
> "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
> +
> file://0001-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch \
>              file://check-memfree.py \
>              file://run-ptest \
>             "
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196287):
> https://lists.openembedded.org/g/openembedded-core/message/196287
> Mute This Topic: https://lists.openembedded.org/mt/104607684/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e6fe670612619e46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 27, 2024 at 9:51=E2=80=AF=
AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Thi=
s gets it building on architectures without 64bit atomics.<br>
<br></blockquote><div><br></div><div>We could also upgrade to python3-crypt=
ography 42.0.5</div><div><a href=3D"https://cryptography.io/en/latest/chang=
elog/#v42-0-5">https://cryptography.io/en/latest/changelog/#v42-0-5</a></di=
v><div>Do we want to do that at this stage?</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/python3-cryptography-crates.inc=C2=A0 =C2=A0 |=C2=A0 22 ++=
--<br>
=C2=A0...m-0.20.2-to-0.20.3-in-src-rust-10462.patch | 105 +++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-cryptography_42.0.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-cryptography_42.0.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A03 files changed, 118 insertions(+), 10 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-cryptography/=
0001-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b=
/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
index 4714c76bd2b..b26e22b70c3 100644<br>
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
@@ -25,12 +25,13 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/parking_lot_core/0.=
9.9" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot_core/0.9.9<=
/a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pem/3.0.3" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/pem/3.0.3</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/pkg-config/0.3.29" =
rel=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.29</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic/1.6.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic/1.6.0</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/proc-macro2/1.0.78"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.78</a> \<br=
>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.20.2" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/pyo3/0.20.2</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0.20.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.20.2</=
a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.20.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.20.2</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.20.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.20.2</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend/0.20=
.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend/0.20=
.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.20.3" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/pyo3/0.20.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0.20.3=
" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.20.3</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.20.3" rel=3D"=
noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.20.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.20.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.20.3</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend/0.20=
.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend/0.20=
.3</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/quote/1.0.35" rel=
=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.35</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/redox_syscall/0.4.1=
" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.4.1</a> \<=
br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/scopeguard/1.2.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/1.2.0</a> \<br>
@@ -74,12 +75,13 @@ SRC_URI[parking_lot-0.12.1.sha256sum] =3D &quot;3742b2c=
103b9f06bc9fff0a37ff4912935851be<br>
=C2=A0SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D &quot;4c42a9226546d68ac=
dd9c0a280d17ce19bfe27a46bf68784e4066115788d008e&quot;<br>
=C2=A0SRC_URI[pem-3.0.3.sha256sum] =3D &quot;1b8fcc794035347fb64beda2d3b462=
595dd2753e3f268d89c5aae77e8cf2c310&quot;<br>
=C2=A0SRC_URI[pkg-config-0.3.29.sha256sum] =3D &quot;2900ede94e305130c13ddd=
391e0ab7cbaeb783945ae07a279c268cb05109c6cb&quot;<br>
+SRC_URI[portable-atomic-1.6.0.sha256sum] =3D &quot;7170ef9988bc169ba16dd36=
a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0&quot;<br>
=C2=A0SRC_URI[proc-macro2-1.0.78.sha256sum] =3D &quot;e2422ad645d89c99f8f3e=
6b88a9fdeca7fabeac836b1002371c4367c8f984aae&quot;<br>
-SRC_URI[pyo3-0.20.2.sha256sum] =3D &quot;9a89dc7a5850d0e983be1ec2a463a171d=
20990487c3cfcd68b5363f1ee3d6fe0&quot;<br>
-SRC_URI[pyo3-build-config-0.20.2.sha256sum] =3D &quot;07426f0d8fe5a601f262=
93f300afd1a7b1ed5e78b2a705870c5f30893c5163be&quot;<br>
-SRC_URI[pyo3-ffi-0.20.2.sha256sum] =3D &quot;dbb7dec17e17766b46bca4f1a4215=
a85006b4c2ecde122076c562dd058da6cf1&quot;<br>
-SRC_URI[pyo3-macros-0.20.2.sha256sum] =3D &quot;05f738b4e40d50b5711957f142=
878cfa0f28e054aa0ebdfc3fd137a843f74ed3&quot;<br>
-SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] =3D &quot;0fc910d4851847827d=
af9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f&quot;<br>
+SRC_URI[pyo3-0.20.3.sha256sum] =3D &quot;53bdbb96d49157e65d45cc287af5f32ff=
add5f4761438b527b055fb0d4bb8233&quot;<br>
+SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D &quot;deaa5745de3f5231ce10=
517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7&quot;<br>
+SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D &quot;62b42531d03e08d4ef1f6e85a2ed4=
22eb678b8cd62b762e53891c05faf0d4afa&quot;<br>
+SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D &quot;7305c720fa01b8055ec95e484a=
6eca7a83c841267f0dd5280f0c8b8551d2c158&quot;<br>
+SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D &quot;7c7e9b68bb9c3149c5=
b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185&quot;<br>
=C2=A0SRC_URI[quote-1.0.35.sha256sum] =3D &quot;291ec9ab5efd934aaf503a6466c=
5d5251535d108ee747472c3977cc5acc868ef&quot;<br>
=C2=A0SRC_URI[redox_syscall-0.4.1.sha256sum] =3D &quot;4722d768eff46b75989d=
d134e5c353f0d6296e5aaa3132e776cbdb56be7731aa&quot;<br>
=C2=A0SRC_URI[scopeguard-1.2.0.sha256sum] =3D &quot;94143f37725109f92c262ed=
2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49&quot;<br>
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-Bump-py=
o3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch b/meta/recipes-devtools/py=
thon/python3-cryptography/0001-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-rust-=
10462.patch<br>
new file mode 100644<br>
index 00000000000..33dd7ae5d5a<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-from=
-0.20.2-to-0.20.3-in-src-rust-10462.patch<br>
@@ -0,0 +1,105 @@<br>
+From f6ec5ab18b5beacb08b0157c5193ea626b44b4e1 Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Tue, 27 Feb 2024 09:30:15 -0800<br>
+Subject: [PATCH] Bump pyo3 from 0.20.2 to 0.20.3 in /src/rust (#10462)<br>
+<br>
+It fixes build on hosts without 64bit atomics<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/pyca/cryptography=
/commit/3598d2ee4b5060dbbe6938b893410ed35074567c" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/pyca/cryptography/commit/3598d2ee4b5060dbbe6=
938b893410ed35074567c</a>]<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ src/rust/Cargo.lock | 28 ++++++++++++++++++----------<br>
+ 1 file changed, 18 insertions(+), 10 deletions(-)<br>
+<br>
+diff --git a/src/rust/Cargo.lock b/src/rust/Cargo.lock<br>
+index b2e0ac4..030e38d 100644<br>
+--- a/src/rust/Cargo.lock<br>
++++ b/src/rust/Cargo.lock<br>
+@@ -263,6 +263,12 @@ version =3D &quot;0.3.29&quot;<br>
+ source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.=
io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang=
/crates.io-index</a>&quot;<br>
+ checksum =3D &quot;2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268c=
b05109c6cb&quot;<br>
+ <br>
++[[package]]<br>
++name =3D &quot;portable-atomic&quot;<br>
++version =3D &quot;1.6.0&quot;<br>
++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.=
io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang=
/crates.io-index</a>&quot;<br>
++checksum =3D &quot;7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03dade=
d371eae7c0&quot;<br>
++<br>
+ [[package]]<br>
+ name =3D &quot;proc-macro2&quot;<br>
+ version =3D &quot;1.0.78&quot;<br>
+@@ -274,15 +280,16 @@ dependencies =3D [<br>
+ <br>
+ [[package]]<br>
+ name =3D &quot;pyo3&quot;<br>
+-version =3D &quot;0.20.2&quot;<br>
++version =3D &quot;0.20.3&quot;<br>
+ source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.=
io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang=
/crates.io-index</a>&quot;<br>
+-checksum =3D &quot;9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363=
f1ee3d6fe0&quot;<br>
++checksum =3D &quot;53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055f=
b0d4bb8233&quot;<br>
+ dependencies =3D [<br>
+=C2=A0 &quot;cfg-if&quot;,<br>
+=C2=A0 &quot;indoc&quot;,<br>
+=C2=A0 &quot;libc&quot;,<br>
+=C2=A0 &quot;memoffset&quot;,<br>
+=C2=A0 &quot;parking_lot&quot;,<br>
++ &quot;portable-atomic&quot;,<br>
+=C2=A0 &quot;pyo3-build-config&quot;,<br>
+=C2=A0 &quot;pyo3-ffi&quot;,<br>
+=C2=A0 &quot;pyo3-macros&quot;,<br>
+@@ -291,9 +298,9 @@ dependencies =3D [<br>
+ <br>
+ [[package]]<br>
+ name =3D &quot;pyo3-build-config&quot;<br>
+-version =3D &quot;0.20.2&quot;<br>
++version =3D &quot;0.20.3&quot;<br>
+ source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.=
io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang=
/crates.io-index</a>&quot;<br>
+-checksum =3D &quot;07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30=
893c5163be&quot;<br>
++checksum =3D &quot;deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b58422920=
85831d48d7&quot;<br>
+ dependencies =3D [<br>
+=C2=A0 &quot;once_cell&quot;,<br>
+=C2=A0 &quot;target-lexicon&quot;,<br>
+@@ -301,9 +308,9 @@ dependencies =3D [<br>
+ <br>
+ [[package]]<br>
+ name =3D &quot;pyo3-ffi&quot;<br>
+-version =3D &quot;0.20.2&quot;<br>
++version =3D &quot;0.20.3&quot;<br>
+ source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.=
io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang=
/crates.io-index</a>&quot;<br>
+-checksum =3D &quot;dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562d=
d058da6cf1&quot;<br>
++checksum =3D &quot;62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c0=
5faf0d4afa&quot;<br>
+ dependencies =3D [<br>
+=C2=A0 &quot;libc&quot;,<br>
+=C2=A0 &quot;pyo3-build-config&quot;,<br>
+@@ -311,9 +318,9 @@ dependencies =3D [<br>
+ <br>
+ [[package]]<br>
+ name =3D &quot;pyo3-macros&quot;<br>
+-version =3D &quot;0.20.2&quot;<br>
++version =3D &quot;0.20.3&quot;<br>
+ source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.=
io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang=
/crates.io-index</a>&quot;<br>
+-checksum =3D &quot;05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137=
a843f74ed3&quot;<br>
++checksum =3D &quot;7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b=
8551d2c158&quot;<br>
+ dependencies =3D [<br>
+=C2=A0 &quot;proc-macro2&quot;,<br>
+=C2=A0 &quot;pyo3-macros-backend&quot;,<br>
+@@ -323,12 +330,13 @@ dependencies =3D [<br>
+ <br>
+ [[package]]<br>
+ name =3D &quot;pyo3-macros-backend&quot;<br>
+-version =3D &quot;0.20.2&quot;<br>
++version =3D &quot;0.20.3&quot;<br>
+ source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/crates.=
io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang=
/crates.io-index</a>&quot;<br>
+-checksum =3D &quot;0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86=
da79e8881f&quot;<br>
++checksum =3D &quot;7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb6=
65f1f96185&quot;<br>
+ dependencies =3D [<br>
+=C2=A0 &quot;heck&quot;,<br>
+=C2=A0 &quot;proc-macro2&quot;,<br>
++ &quot;pyo3-build-config&quot;,<br>
+=C2=A0 &quot;quote&quot;,<br>
+=C2=A0 &quot;syn&quot;,<br>
+ ]<br>
+-- <br>
+2.44.0<br>
+<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptog=
raphy_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_=
42.0.2.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-cryp=
tography_42.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptograp=
hy_42.0.2.bb</a><br>
index c21c4d1a03b..da10e2e60c1 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_4=
2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_42.0.2.=
bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_4=
2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_42.0.2.=
bb</a><br>
@@ -11,6 +11,7 @@ LDSHARED +=3D &quot;-pthread&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433=
219dc8c93827c57eab6cf888&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-pyproject.toml-remove-benchmark-disabl=
e-option.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Bump-pyo3-from-0.20.=
2-to-0.20.3-in-src-rust-10462.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://check-memfree.py \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-- <br>
2.44.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196287): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196287" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196287</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104607684/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104607684/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e6fe670612619e46--

