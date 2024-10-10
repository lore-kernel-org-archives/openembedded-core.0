Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A9BCF0437
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 04:06:46 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.35775.1728533200066617365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 21:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GeFkmzCa;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fad15b3eeeso3132441fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 21:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728533198; x=1729137998; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fgNC1FcaPdCQfDeML11v39IAhtn5pv5kyXeiaIpRBdw=;
        b=GeFkmzCay0VcrCb9Ys6Kzu8y6+CbJvXF4mItUQPYQK/vrvgAsS3MfAqb+3+hmK4RSO
         yGDwignwVUa6hq0wjmcvgp4m1sZUCUxkiJmP1ZRIhQ7Z1OiXr0VMVTT/tzCCLZbvvjwA
         5va74Vh9l/W/kvhLdKj+9Lv1OtuD7f7VLffeMGlQKtz9iBBQMZ5w9SIU53zuctiwla50
         otzqedji28ezyhsJKXo4dsdSyQrqYJ4A2nhwkABMLGbtzu+D1HW5NeDuOna2wLwf7sES
         hZzyFsFpTuCzkdwmGZIub2gUmYh5dn0Mhb/FVIRSgRYofz9EFkiG5QPL5GJoumW+EYtY
         1byw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728533198; x=1729137998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgNC1FcaPdCQfDeML11v39IAhtn5pv5kyXeiaIpRBdw=;
        b=ncOfz8cam4ALcF7Tyv7mZit1yCWG66Z9nr7hTA6zJXGBw5WL+V+xVVak8woCILzYkJ
         oLqVtx600QO3xAXXska47mxBAr0k1IZyktLIGf3RL7yPqJZvo8nAe9kJQ0OR8zZg+Goz
         tOu1eZBaQ9aa4TpBvgEGrny1rzrCqcDpMldFJpabiu0Ohgfakg+uqcfwoM8nKM/fMvAh
         jyPaMXGLvzmj1ItxY+hFgUrciXINY3cAQmV7tdh640F+quOu1oTo8me2e2qqzkRv9IV1
         VcW/IsbKoRxrY6LgxquFwUTnEFRVV1w6icoM3cVoQhFBrXy3Q6NaZCna+841A1HX4vrR
         knqA==
X-Gm-Message-State: AOJu0YwPgGS+xHDtkvK2qqmyqDu7/rRD2skTK6/0ZM3b/GS3Wk9zhk3e
	LOV7JX8mhyL1YQm3hgwI0VbKWIOFmTfbAfekzB4V6wjQwAy6lfEWj7A17FVGWUkVv4Tkg6Ux87H
	CukiCuhiBO0SIQFjTMV7LF7KtCDs=
X-Google-Smtp-Source: AGHT+IH3ItpLPrdMa8ttqWnprqP5eG3Z1jPnxPbThI3r1D+E4sWELG0YgAcRkK1FoxrAapopeR5fu/n89/VEkvxLuzQ=
X-Received: by 2002:a2e:beab:0:b0:2ee:8453:5164 with SMTP id
 38308e7fff4ca-2fb1f47c8a2mr13491751fa.0.1728533197325; Wed, 09 Oct 2024
 21:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241009214529.3094681-2-t.f.g.geelen@gmail.com>
In-Reply-To: <20241009214529.3094681-2-t.f.g.geelen@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 9 Oct 2024 21:06:25 -0700
Message-ID: <CANx9H-BLVrn2fm=qhdtaP7dsrS6nw2SF8NRs-i6BrNt+R2-wdQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH] python3-cryptography 42.0.8 -> 43.0.1
To: t.f.g.geelen@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000358bd30624177f59"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 04:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205375

--000000000000358bd30624177f59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the update.

We had reproducibility issues with 43.0.0
https://lore.kernel.org/openembedded-core/20240813031628.1123492-1-tim.orli=
ng@konsulko.com/

Also, you didn=E2=80=99t report that ptests pass. This package is critical =
path for
many other recipes, so we must take extra care. Linting is not sufficient,
we must run-time test.

On Wed, Oct 9, 2024 at 2:46=E2=80=AFPM Tom Geelen via lists.openembedded.or=
g
<t.f.g.geelen=3Dgmail.com@lists.openembedded.org> wrote:

> python3-cryptography-vectors 42.0.8 -> 43.0.1
>
> Changelog:
> - https://cryptography.io/en/latest/changelog/#v43-0-0
> - https://cryptography.io/en/latest/changelog/#v43-0-1
>
> Change build tool to use python3-maturin-native as specified in
> pyproject.toml file.
> Performed linting on the recipe and removed packages from the ptest which
> are not required according to the included pyproject.toml.
> ---
>  .../python/python3-cryptography-crates.inc    | 130 +++++++-----------
>  ...=3D> python3-cryptography-vectors_43.0.1.bb} |   8 +-
>  ...toml-remove-benchmark-disable-option.patch |   8 +-
>  ....0.8.bb =3D> python3-cryptography_43.0.1.bb} |  72 +++++-----
>  4 files changed, 94 insertions(+), 124 deletions(-)
>  rename meta/recipes-devtools/python/{
> python3-cryptography-vectors_42.0.8.bb =3D>
> python3-cryptography-vectors_43.0.1.bb} (75%)
>  rename meta/recipes-devtools/python/{python3-cryptography_42.0.8.bb =3D>
> python3-cryptography_43.0.1.bb} (59%)
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> index dbeda05dc4..319a47dabd 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> @@ -2,101 +2,71 @@
>
>  # from src/rust/Cargo.lock
>  SRC_URI +=3D " \
> -    crate://crates.io/asn1/0.15.5 \
> -    crate://crates.io/asn1_derive/0.15.5 \
> -    crate://crates.io/autocfg/1.1.0 \
> -    crate://crates.io/base64/0.21.7 \
> -    crate://crates.io/bitflags/1.3.2 \
> -    crate://crates.io/bitflags/2.4.2 \
> -    crate://crates.io/cc/1.0.83 \
> +    crate://crates.io/asn1/0.16.2 \
> +    crate://crates.io/asn1_derive/0.16.2 \
> +    crate://crates.io/autocfg/1.3.0 \
> +    crate://crates.io/base64/0.22.1 \
> +    crate://crates.io/bitflags/2.6.0 \
> +    crate://crates.io/cc/1.1.6 \
>      crate://crates.io/cfg-if/1.0.0 \
>      crate://crates.io/foreign-types/0.3.2 \
>      crate://crates.io/foreign-types-shared/0.1.1 \
> -    crate://crates.io/heck/0.4.1 \
> -    crate://crates.io/indoc/2.0.4 \
> -    crate://crates.io/libc/0.2.152 \
> -    crate://crates.io/lock_api/0.4.11 \
> -    crate://crates.io/memoffset/0.9.0 \
> +    crate://crates.io/heck/0.5.0 \
> +    crate://crates.io/indoc/2.0.5 \
> +    crate://crates.io/libc/0.2.155 \
> +    crate://crates.io/memoffset/0.9.1 \
>      crate://crates.io/once_cell/1.19.0 \
> -    crate://crates.io/openssl/0.10.64 \
> +    crate://crates.io/openssl/0.10.66 \
>      crate://crates.io/openssl-macros/0.1.1 \
> -    crate://crates.io/openssl-sys/0.9.102 \
> -    crate://crates.io/parking_lot/0.12.1 \
> -    crate://crates.io/parking_lot_core/0.9.9 \
> -    crate://crates.io/pem/3.0.3 \
> -    crate://crates.io/pkg-config/0.3.29 \
> -    crate://crates.io/portable-atomic/1.6.0 \
> -    crate://crates.io/proc-macro2/1.0.78 \
> -    crate://crates.io/pyo3/0.20.3 \
> -    crate://crates.io/pyo3-build-config/0.20.3 \
> -    crate://crates.io/pyo3-ffi/0.20.3 \
> -    crate://crates.io/pyo3-macros/0.20.3 \
> -    crate://crates.io/pyo3-macros-backend/0.20.3 \
> -    crate://crates.io/quote/1.0.35 \
> -    crate://crates.io/redox_syscall/0.4.1 \
> -    crate://crates.io/scopeguard/1.2.0 \
> -    crate://crates.io/self_cell/1.0.3 \
> -    crate://crates.io/smallvec/1.13.1 \
> -    crate://crates.io/syn/2.0.48 \
> -    crate://crates.io/target-lexicon/0.12.13 \
> +    crate://crates.io/openssl-sys/0.9.103 \
> +    crate://crates.io/pem/3.0.4 \
> +    crate://crates.io/pkg-config/0.3.30 \
> +    crate://crates.io/portable-atomic/1.7.0 \
> +    crate://crates.io/proc-macro2/1.0.86 \
> +    crate://crates.io/pyo3/0.22.2 \
> +    crate://crates.io/pyo3-build-config/0.22.2 \
> +    crate://crates.io/pyo3-ffi/0.22.2 \
> +    crate://crates.io/pyo3-macros/0.22.2 \
> +    crate://crates.io/pyo3-macros-backend/0.22.2 \
> +    crate://crates.io/quote/1.0.36 \
> +    crate://crates.io/self_cell/1.0.4 \
> +    crate://crates.io/syn/2.0.71 \
> +    crate://crates.io/target-lexicon/0.12.15 \
>      crate://crates.io/unicode-ident/1.0.12 \
>      crate://crates.io/unindent/0.2.3 \
>      crate://crates.io/vcpkg/0.2.15 \
> -    crate://crates.io/windows-targets/0.48.5 \
> -    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
> -    crate://crates.io/windows_aarch64_msvc/0.48.5 \
> -    crate://crates.io/windows_i686_gnu/0.48.5 \
> -    crate://crates.io/windows_i686_msvc/0.48.5 \
> -    crate://crates.io/windows_x86_64_gnu/0.48.5 \
> -    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
> -    crate://crates.io/windows_x86_64_msvc/0.48.5 \
>  "
>
> -SRC_URI[asn1-0.15.5.sha256sum] =3D
> "ae3ecbce89a22627b5e8e6e11d69715617138290289e385cde773b1fe50befdb"
> -SRC_URI[asn1_derive-0.15.5.sha256sum] =3D
> "861af988fac460ac69a09f41e6217a8fb9178797b76fcc9478444be6a59be19c"
> -SRC_URI[autocfg-1.1.0.sha256sum] =3D
> "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> -SRC_URI[base64-0.21.7.sha256sum] =3D
> "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
> -SRC_URI[bitflags-1.3.2.sha256sum] =3D
> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> -SRC_URI[bitflags-2.4.2.sha256sum] =3D
> "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
> -SRC_URI[cc-1.0.83.sha256sum] =3D
> "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
> +SRC_URI[asn1-0.16.2.sha256sum] =3D
> "532ceda058281b62096b2add4ab00ab3a453d30dee28b8890f62461a0109ebbd"
> +SRC_URI[asn1_derive-0.16.2.sha256sum] =3D
> "56e6076d38cc17cc22b0f65f31170a2ee1975e6b07f0012893aefd86ce19c987"
> +SRC_URI[autocfg-1.3.0.sha256sum] =3D
> "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
> +SRC_URI[base64-0.22.1.sha256sum] =3D
> "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
> +SRC_URI[bitflags-2.6.0.sha256sum] =3D
> "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
> +SRC_URI[cc-1.1.6.sha256sum] =3D
> "2aba8f4e9906c7ce3c73463f62a7f0c65183ada1a2d47e397cc8810827f9694f"
>  SRC_URI[cfg-if-1.0.0.sha256sum] =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
>  SRC_URI[foreign-types-0.3.2.sha256sum] =3D
> "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
>  SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D
> "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
> -SRC_URI[heck-0.4.1.sha256sum] =3D
> "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
> -SRC_URI[indoc-2.0.4.sha256sum] =3D
> "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
> -SRC_URI[libc-0.2.152.sha256sum] =3D
> "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"
> -SRC_URI[lock_api-0.4.11.sha256sum] =3D
> "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
> -SRC_URI[memoffset-0.9.0.sha256sum] =3D
> "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
> +SRC_URI[heck-0.5.0.sha256sum] =3D
> "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
> +SRC_URI[indoc-2.0.5.sha256sum] =3D
> "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
> +SRC_URI[libc-0.2.155.sha256sum] =3D
> "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
> +SRC_URI[memoffset-0.9.1.sha256sum] =3D
> "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
>  SRC_URI[once_cell-1.19.0.sha256sum] =3D
> "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
> -SRC_URI[openssl-0.10.64.sha256sum] =3D
> "95a0481286a310808298130d22dd1fef0fa571e05a8f44ec801801e84b216b1f"
> +SRC_URI[openssl-0.10.66.sha256sum] =3D
> "9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1"
>  SRC_URI[openssl-macros-0.1.1.sha256sum] =3D
> "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
> -SRC_URI[openssl-sys-0.9.102.sha256sum] =3D
> "c597637d56fbc83893a35eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2"
> -SRC_URI[parking_lot-0.12.1.sha256sum] =3D
> "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
> -SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D
> "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
> -SRC_URI[pem-3.0.3.sha256sum] =3D
> "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
> -SRC_URI[pkg-config-0.3.29.sha256sum] =3D
> "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
> -SRC_URI[portable-atomic-1.6.0.sha256sum] =3D
> "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
> -SRC_URI[proc-macro2-1.0.78.sha256sum] =3D
> "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
> -SRC_URI[pyo3-0.20.3.sha256sum] =3D
> "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
> -SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D
> "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
> -SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D
> "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
> -SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D
> "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
> -SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D
> "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
> -SRC_URI[quote-1.0.35.sha256sum] =3D
> "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
> -SRC_URI[redox_syscall-0.4.1.sha256sum] =3D
> "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
> -SRC_URI[scopeguard-1.2.0.sha256sum] =3D
> "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
> -SRC_URI[self_cell-1.0.3.sha256sum] =3D
> "58bf37232d3bb9a2c4e641ca2a11d83b5062066f88df7fed36c28772046d65ba"
> -SRC_URI[smallvec-1.13.1.sha256sum] =3D
> "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
> -SRC_URI[syn-2.0.48.sha256sum] =3D
> "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
> -SRC_URI[target-lexicon-0.12.13.sha256sum] =3D
> "69758bda2e78f098e4ccb393021a0963bb3442eac05f135c30f61b7370bbafae"
> +SRC_URI[openssl-sys-0.9.103.sha256sum] =3D
> "7f9e8deee91df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6"
> +SRC_URI[pem-3.0.4.sha256sum] =3D
> "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
> +SRC_URI[pkg-config-0.3.30.sha256sum] =3D
> "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
> +SRC_URI[portable-atomic-1.7.0.sha256sum] =3D
> "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
> +SRC_URI[proc-macro2-1.0.86.sha256sum] =3D
> "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
> +SRC_URI[pyo3-0.22.2.sha256sum] =3D
> "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
> +SRC_URI[pyo3-build-config-0.22.2.sha256sum] =3D
> "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
> +SRC_URI[pyo3-ffi-0.22.2.sha256sum] =3D
> "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
> +SRC_URI[pyo3-macros-0.22.2.sha256sum] =3D
> "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
> +SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] =3D
> "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
> +SRC_URI[quote-1.0.36.sha256sum] =3D
> "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
> +SRC_URI[self_cell-1.0.4.sha256sum] =3D
> "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
> +SRC_URI[syn-2.0.71.sha256sum] =3D
> "b146dcf730474b4bcd16c311627b31ede9ab149045db4d6088b3becaea046462"
> +SRC_URI[target-lexicon-0.12.15.sha256sum] =3D
> "4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2"
>  SRC_URI[unicode-ident-1.0.12.sha256sum] =3D
> "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
>  SRC_URI[unindent-0.2.3.sha256sum] =3D
> "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
>  SRC_URI[vcpkg-0.2.15.sha256sum] =3D
> "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
> -SRC_URI[windows-targets-0.48.5.sha256sum] =3D
> "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
> -SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D
> "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
> -SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D
> "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
> -SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D
> "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
> -SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D
> "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
> -SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D
> "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
> -SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D
> "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
> -SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D
> "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
> diff --git a/meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.8.bb b/meta/recipes-devtools/python/
> python3-cryptography-vectors_43.0.1.bb
> similarity index 75%
> rename from meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.8.bb
> rename to meta/recipes-devtools/python/
> python3-cryptography-vectors_43.0.1.bb
> index 1256e75c47..7b8216b05e 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.8.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography-vectors_43.0.1.bb
> @@ -9,19 +9,19 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
>  # NOTE: Make sure to keep this recipe at the same version as
> python3-cryptography
>  #       Upgrade both recipes at the same time
>
> -SRC_URI[sha256sum] =3D
> "df5657367bc0a90c374309cb261009a2c53cae91a458781339a0f724f819a46a"
> +SRC_URI[sha256sum] =3D
> "68a0fc18fe27b309e933a293a54f3356b78a14c15207e96c9ff85681af0509de"
>
>  PYPI_PACKAGE =3D "cryptography_vectors"
>
>  inherit pypi python_setuptools_build_meta
>
> -DEPENDS +=3D " \
> +DEPENDS +=3D "\
>      python3-cryptography \
>  "
>
>  do_install:append () {
> -       # Remove the sha256 checksum lines for pycache files
> -       sed
> ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors-${PV}.dist-info/RECOR=
D
> -e '/__pycache__/d' -i
> +    # Remove the sha256 checksum lines for pycache files
> +    sed
> ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors-${PV}.dist-info/RECOR=
D
> -e '/__pycache__/d' -i
>  }
>
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git
> a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> index 3eed171ffe..907e462653 100644
> ---
> a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> +++
> b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> @@ -1,4 +1,4 @@
> -From e4d7856fe842f3df7c614554d006d81253a5edf2 Mon Sep 17 00:00:00 2001
> +From 31b9e612eae62452c786a5aecdcf89b131afc8fa Mon Sep 17 00:00:00 2001
>  From: Mingli Yu <mingli.yu@windriver.com>
>  Date: Tue, 17 May 2022 17:22:48 +0800
>  Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
> @@ -26,11 +26,11 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/pyproject.toml b/pyproject.toml
> -index d2e304f..10aabcf 100644
> +index e5b801d..985fc8c 100644
>  --- a/pyproject.toml
>  +++ b/pyproject.toml
> -@@ -92,7 +92,7 @@ rust-version =3D ">=3D1.63.0"
> -
> +@@ -117,7 +117,7 @@ exclude =3D [
> + ]
>
>   [tool.pytest.ini_options]
>  -addopts =3D "-r s --capture=3Dno --strict-markers --benchmark-disable"
> diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
> b/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
> similarity index 59%
> rename from meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
> rename to meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
> index 3f70f910d4..dfa662d128 100644
> --- a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
> @@ -2,49 +2,28 @@ SUMMARY =3D "Provides cryptographic recipes and primiti=
ves
> to python developers"
>  HOMEPAGE =3D "https://cryptography.io/"
>  SECTION =3D "devel/python"
>  LICENSE =3D "Apache-2.0 | BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab9151=
1e4 \
> -
> file://LICENSE.APACHE;md5=3D4e168cce331e5c827d4c2b68a6200e1b \
> -
> file://LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49aa0b0dce887b \
> -                   "
> +LIC_FILES_CHKSUM =3D "\
> +    file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
> +    file://LICENSE.APACHE;md5=3D4e168cce331e5c827d4c2b68a6200e1b \
> +    file://LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49aa0b0dce887b \
> +"
>  LDSHARED +=3D "-pthread"
>
> -SRC_URI[sha256sum] =3D
> "8d09d05439ce7baa8e9e95b07ec5b6c886f548deb7e0f69ef25f64b3bce842f2"
> -
> -SRC_URI +=3D
> "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
> -            file://check-memfree.py \
> -            file://run-ptest \
> -           "
> -
> -require ${BPN}-crates.inc
> -
> -inherit pypi python_setuptools3_rust cargo-update-recipe-crates pkgconfi=
g
> -
> -DEPENDS +=3D " \
> +DEPENDS +=3D "\
>      python3-cffi-native \
>  "
>
> -RDEPENDS:${PN} +=3D " \
> -    python3-cffi \
> -"
> +SRC_URI[sha256sum] =3D
> "203e92a75716d8cfb491dc47c79e17d0d9207ccffcbcb35f598fbe463ae3444d"
>
> -RDEPENDS:${PN}:append:class-target =3D " \
> -    python3-numbers \
> -    python3-threading \
> +SRC_URI:append =3D " \
> +    file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
> +    file://check-memfree.py \
> +    file://run-ptest \
>  "
>
> -RDEPENDS:${PN}-ptest +=3D " \
> -    python3-bcrypt \
> -    python3-cryptography-vectors (=3D ${PV}) \
> -    python3-hypothesis \
> -    python3-iso8601 \
> -    python3-mmap \
> -    python3-pretend \
> -    python3-psutil \
> -    python3-pytest \
> -    python3-unittest-automake-output \
> -    python3-pytest-subtests \
> -    python3-pytz \
> -"
> +require ${BPN}-crates.inc
> +
> +inherit pypi python_maturin cargo-update-recipe-crates pkgconfig
>
>  inherit ptest
>
> @@ -60,8 +39,29 @@ do_install_ptest() {
>      cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
>  }
>
> -FILES:${PN}-dbg +=3D " \
> +FILES:${PN}-dbg +=3D "\
>      ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
>  "
>
> +RDEPENDS:${PN} +=3D "\
> +    python3-cffi \
> +"
> +
> +RDEPENDS:${PN}:append:class-target =3D " \
> +    python3-numbers \
> +    python3-threading \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D "\
> +    python3-certifi \
> +    python3-cryptography-vectors (=3D ${PV}) \
> +    python3-pretend \
> +    python3-pytest \
> +    python3-pytest-benchmark \
> +    python3-pytest-cov \
> +    python3-pytest-subtests \
> +    python3-pytest-xdist \
> +    python3-unittest-automake-output \
> +"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205369):
> https://lists.openembedded.org/g/openembedded-core/message/205369
> Mute This Topic: https://lists.openembedded.org/mt/108918442/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000358bd30624177f59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div dir=3D"auto">Thank you for the update.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">We had reproducibility issu=
es with 43.0.0</div><div dir=3D"auto"><div><a href=3D"https://lore.kernel.o=
rg/openembedded-core/20240813031628.1123492-1-tim.orling@konsulko.com/">htt=
ps://lore.kernel.org/openembedded-core/20240813031628.1123492-1-tim.orling@=
konsulko.com/</a></div><br></div><div dir=3D"auto">Also, you didn=E2=80=99t=
 report that ptests pass. This package is critical path for many other reci=
pes, so we must take extra care. Linting is not sufficient, we must run-tim=
e test.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Oct 9, 2024 at 2:46=E2=80=AFPM Tom Geelen via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;t.f.g.gee=
len=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;padding-left:1ex;border-left-color:rgb(204,204,204)">python3-cryptograp=
hy-vectors 42.0.8 -&gt; 43.0.1<br>
<br>
Changelog:<br>
- <a href=3D"https://cryptography.io/en/latest/changelog/#v43-0-0" rel=3D"n=
oreferrer" target=3D"_blank">https://cryptography.io/en/latest/changelog/#v=
43-0-0</a><br>
- <a href=3D"https://cryptography.io/en/latest/changelog/#v43-0-1" rel=3D"n=
oreferrer" target=3D"_blank">https://cryptography.io/en/latest/changelog/#v=
43-0-1</a><br>
<br>
Change build tool to use python3-maturin-native as specified in pyproject.t=
oml file.<br>
Performed linting on the recipe and removed packages from the ptest which a=
re not required according to the included pyproject.toml.<br>
---<br>
=C2=A0.../python/python3-cryptography-crates.inc=C2=A0 =C2=A0 | 130 +++++++=
-----------<br>
=C2=A0...=3D&gt; <a href=3D"http://python3-cryptography-vectors_43.0.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-cryptography-vectors_43.0.1.bb=
</a>} |=C2=A0 =C2=A08 +-<br>
=C2=A0...toml-remove-benchmark-disable-option.patch |=C2=A0 =C2=A08 +-<br>
=C2=A0....<a href=3D"http://0.8.bb" rel=3D"noreferrer" target=3D"_blank">0.=
8.bb</a> =3D&gt; <a href=3D"http://python3-cryptography_43.0.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-cryptography_43.0.1.bb</a>} |=C2=A0 72=
 +++++-----<br>
=C2=A04 files changed, 94 insertions(+), 124 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-crypto=
graphy-vectors_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryp=
tography-vectors_42.0.8.bb</a> =3D&gt; <a href=3D"http://python3-cryptograp=
hy-vectors_43.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy-vectors_43.0.1.bb</a>} (75%)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-crypto=
graphy_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography=
_42.0.8.bb</a> =3D&gt; <a href=3D"http://python3-cryptography_43.0.1.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-cryptography_43.0.1.bb</a>} (59%=
)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b=
/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
index dbeda05dc4..319a47dabd 100644<br>
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
@@ -2,101 +2,71 @@<br>
<br>
=C2=A0# from src/rust/Cargo.lock<br>
=C2=A0SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1/0.15.5" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/asn1/0.15.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1_derive/0.15.5" rel=
=3D"noreferrer" target=3D"_blank">crates.io/asn1_derive/0.15.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.1.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/autocfg/1.1.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.21.7" rel=3D"no=
referrer" target=3D"_blank">crates.io/base64/0.21.7</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.3.2" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.4.2" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bitflags/2.4.2</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.83" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/cc/1.0.83</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1/0.16.2" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/asn1/0.16.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1_derive/0.16.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/asn1_derive/0.16.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.3.0" rel=3D"no=
referrer" target=3D"_blank">crates.io/autocfg/1.3.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.22.1" rel=3D"no=
referrer" target=3D"_blank">crates.io/base64/0.22.1</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.6.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/bitflags/2.6.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.1.6" rel=3D"norefer=
rer" target=3D"_blank">crates.io/cc/1.1.6</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/cfg-if/1.0.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/foreign-types/0.3.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/foreign-types/0.3.2</a> \<=
br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/foreign-types-share=
d/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/foreign-types-share=
d/0.1.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.4.1" rel=3D"noref=
errer" target=3D"_blank">crates.io/heck/0.4.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/2.0.4" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/indoc/2.0.4</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.152" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/libc/0.2.152</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lock_api/0.4.11" rel=3D"=
noreferrer" target=3D"_blank">crates.io/lock_api/0.4.11</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.9.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/memoffset/0.9.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.5.0" rel=3D"noref=
errer" target=3D"_blank">crates.io/heck/0.5.0</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/2.0.5" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/indoc/2.0.5</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.155" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/libc/0.2.155</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.9.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/memoffset/0.9.1</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/once_cell/1.19.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.19.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.10.64" rel=3D"=
noreferrer" target=3D"_blank">crates.io/openssl/0.10.64</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.10.66" rel=3D"=
noreferrer" target=3D"_blank">crates.io/openssl/0.10.66</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/openssl-macros/0.1.=
1" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-macros/0.1.1</a> =
\<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sys/0.9.102" rel=
=3D"noreferrer" target=3D"_blank">crates.io/openssl-sys/0.9.102</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot/0.12.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/parking_lot/0.12.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot_core/0.9.9" =
rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot_core/0.9.9</a> \=
<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/3.0.3" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/pem/3.0.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.29" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.29</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic/1.6.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic/1.6.0</a> \<b=
r>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.78" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.78</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.20.3" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/pyo3/0.20.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0.20.3=
" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.20.3</=
a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.20.3" rel=3D"=
noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.20.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.20.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.20.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend/0.20=
.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend/0.20=
.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.35" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.35</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.4.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.4.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.2.0" rel=3D=
"noreferrer" target=3D"_blank">crates.io/scopeguard/1.2.0</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/self_cell/1.0.3" rel=3D"=
noreferrer" target=3D"_blank">crates.io/self_cell/1.0.3</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1.13.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/smallvec/1.13.1</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.48" rel=3D"noref=
errer" target=3D"_blank">crates.io/syn/2.0.48</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.12.13" =
rel=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon/0.12.13</a> \=
<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sys/0.9.103" rel=
=3D"noreferrer" target=3D"_blank">crates.io/openssl-sys/0.9.103</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/3.0.4" rel=3D"norefe=
rrer" target=3D"_blank">crates.io/pem/3.0.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.30" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.30</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic/1.7.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic/1.7.0</a> \<b=
r>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.86" rel=
=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.86</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.22.2" rel=3D"nore=
ferrer" target=3D"_blank">crates.io/pyo3/0.22.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0.22.2=
" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.22.2</=
a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.22.2" rel=3D"=
noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.22.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.22.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.22.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend/0.22=
.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend/0.22=
.2</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.36" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/quote/1.0.36</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/self_cell/1.0.4" rel=3D"=
noreferrer" target=3D"_blank">crates.io/self_cell/1.0.4</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.71" rel=3D"noref=
errer" target=3D"_blank">crates.io/syn/2.0.71</a> \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.12.15" =
rel=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon/0.12.15</a> \=
<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/unicode-ident/1.0.1=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.12</a> =
\<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/unindent/0.2.3" rel=
=3D"noreferrer" target=3D"_blank">crates.io/unindent/0.2.3</a> \<br>
=C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://crates.io/vcpkg/0.2.15" rel=
=3D"noreferrer" target=3D"_blank">crates.io/vcpkg/0.2.15</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-targets/0.48.5" =
rel=3D"noreferrer" target=3D"_blank">crates.io/windows-targets/0.48.5</a> \=
<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_gnullvm/=
0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_gnul=
lvm/0.48.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_msvc/0.4=
8.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_msvc/0.=
48.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnu/0.48.5"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnu/0.48.5</a>=
 \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_msvc/0.48.5=
" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_msvc/0.48.5</=
a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnu/0.48.=
5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnu/0.48.5=
</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnullvm/0=
.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnullv=
m/0.48.5</a> \<br>
-=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_msvc/0.48=
.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_msvc/0.48=
.5</a> \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[asn1-0.15.5.sha256sum] =3D &quot;ae3ecbce89a22627b5e8e6e11d6971561=
7138290289e385cde773b1fe50befdb&quot;<br>
-SRC_URI[asn1_derive-0.15.5.sha256sum] =3D &quot;861af988fac460ac69a09f41e6=
217a8fb9178797b76fcc9478444be6a59be19c&quot;<br>
-SRC_URI[autocfg-1.1.0.sha256sum] =3D &quot;d468802bab17cbc0cc575e9b053f41e=
72aa36bfa6b7f55e3529ffa43161b97fa&quot;<br>
-SRC_URI[base64-0.21.7.sha256sum] =3D &quot;9d297deb1925b89f2ccc13d7635fa07=
14f12c87adce1c75356b39ca9b7178567&quot;<br>
-SRC_URI[bitflags-1.3.2.sha256sum] =3D &quot;bef38d45163c2f1dde094a7dfd33cc=
f595c92905c8f8f4fdc18d06fb1037718a&quot;<br>
-SRC_URI[bitflags-2.4.2.sha256sum] =3D &quot;ed570934406eb16438a4e976b1b450=
0774099c13b8cb96eec99f620f05090ddf&quot;<br>
-SRC_URI[cc-1.0.83.sha256sum] =3D &quot;f1174fb0b6ec23863f8b971027804a42614=
e347eafb0a95bf0b12cdae21fc4d0&quot;<br>
+SRC_URI[asn1-0.16.2.sha256sum] =3D &quot;532ceda058281b62096b2add4ab00ab3a=
453d30dee28b8890f62461a0109ebbd&quot;<br>
+SRC_URI[asn1_derive-0.16.2.sha256sum] =3D &quot;56e6076d38cc17cc22b0f65f31=
170a2ee1975e6b07f0012893aefd86ce19c987&quot;<br>
+SRC_URI[autocfg-1.3.0.sha256sum] =3D &quot;0c4b4d0bd25bd0b74681c0ad2149761=
0ce1b7c91b1022cd21c80c6fbdd9476b0&quot;<br>
+SRC_URI[base64-0.22.1.sha256sum] =3D &quot;72b3254f16251a8381aa12e40e3c4d2=
f0199f8c6508fbecb9d91f575e0fbb8c6&quot;<br>
+SRC_URI[bitflags-2.6.0.sha256sum] =3D &quot;b048fb63fd8b5923fc5aa7b340d8e1=
56aec7ec02f0c78fa8a6ddc2613f6f71de&quot;<br>
+SRC_URI[cc-1.1.6.sha256sum] =3D &quot;2aba8f4e9906c7ce3c73463f62a7f0c65183=
ada1a2d47e397cc8810827f9694f&quot;<br>
=C2=A0SRC_URI[cfg-if-1.0.0.sha256sum] =3D &quot;baf1de4339761588bc0619e3cbc=
0120ee582ebb74b53b4efbf79117bd2da40fd&quot;<br>
=C2=A0SRC_URI[foreign-types-0.3.2.sha256sum] =3D &quot;f6f339eb8adc052cd2ca=
78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1&quot;<br>
=C2=A0SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D &quot;00b0228411908=
ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b&quot;<br>
-SRC_URI[heck-0.4.1.sha256sum] =3D &quot;95505c38b4572b2d910cecb0281560f54b=
440a19336cbbcb27bf6ce6adc6f5a8&quot;<br>
-SRC_URI[indoc-2.0.4.sha256sum] =3D &quot;1e186cfbae8084e513daff4240b4797e3=
42f988cecda4fb6c939150f96315fd8&quot;<br>
-SRC_URI[libc-0.2.152.sha256sum] =3D &quot;13e3bf6590cbc649f4d1a3eefc9d5d6e=
b746f5200ffb04e5e142700b8faa56e7&quot;<br>
-SRC_URI[lock_api-0.4.11.sha256sum] =3D &quot;3c168f8615b12bc01f9c17e2eb0cc=
07dcae1940121185446edc3744920e8ef45&quot;<br>
-SRC_URI[memoffset-0.9.0.sha256sum] =3D &quot;5a634b1c61a95585bd15607c6ab0c=
4e5b226e695ff2800ba0cdccddf208c406c&quot;<br>
+SRC_URI[heck-0.5.0.sha256sum] =3D &quot;2304e00983f87ffb38b55b444b5e3b60a8=
84b5d30c0fca7d82fe33449bbe55ea&quot;<br>
+SRC_URI[indoc-2.0.5.sha256sum] =3D &quot;b248f5224d1d606005e02c97f5aa4e88e=
eb230488bcc03bc9ca4d7991399f2b5&quot;<br>
+SRC_URI[libc-0.2.155.sha256sum] =3D &quot;97b3888a4aecf77e811145cadf6eef59=
01f4782c53886191b2f693f24761847c&quot;<br>
+SRC_URI[memoffset-0.9.1.sha256sum] =3D &quot;488016bfae457b036d996092f6cb4=
48677611ce4449e970ceaf42695203f218a&quot;<br>
=C2=A0SRC_URI[once_cell-1.19.0.sha256sum] =3D &quot;3fdb12b2476b595f9358c51=
61aa467c2438859caa136dec86c26fdd2efe17b92&quot;<br>
-SRC_URI[openssl-0.10.64.sha256sum] =3D &quot;95a0481286a310808298130d22dd1=
fef0fa571e05a8f44ec801801e84b216b1f&quot;<br>
+SRC_URI[openssl-0.10.66.sha256sum] =3D &quot;9529f4786b70a3e8c61e11179af17=
ab6188ad8d0ded78c5529441ed39d4bd9c1&quot;<br>
=C2=A0SRC_URI[openssl-macros-0.1.1.sha256sum] =3D &quot;a948666b637a0f465e8=
564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c&quot;<br>
-SRC_URI[openssl-sys-0.9.102.sha256sum] =3D &quot;c597637d56fbc83893a35eb0d=
d04b2b8e7a50c91e64e9493e398b5df4fb45fa2&quot;<br>
-SRC_URI[parking_lot-0.12.1.sha256sum] =3D &quot;3742b2c103b9f06bc9fff0a37f=
f4912935851bee6d36f3c02bcc755bcfec228f&quot;<br>
-SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D &quot;4c42a9226546d68acdd9c0=
a280d17ce19bfe27a46bf68784e4066115788d008e&quot;<br>
-SRC_URI[pem-3.0.3.sha256sum] =3D &quot;1b8fcc794035347fb64beda2d3b462595dd=
2753e3f268d89c5aae77e8cf2c310&quot;<br>
-SRC_URI[pkg-config-0.3.29.sha256sum] =3D &quot;2900ede94e305130c13ddd391e0=
ab7cbaeb783945ae07a279c268cb05109c6cb&quot;<br>
-SRC_URI[portable-atomic-1.6.0.sha256sum] =3D &quot;7170ef9988bc169ba16dd36=
a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0&quot;<br>
-SRC_URI[proc-macro2-1.0.78.sha256sum] =3D &quot;e2422ad645d89c99f8f3e6b88a=
9fdeca7fabeac836b1002371c4367c8f984aae&quot;<br>
-SRC_URI[pyo3-0.20.3.sha256sum] =3D &quot;53bdbb96d49157e65d45cc287af5f32ff=
add5f4761438b527b055fb0d4bb8233&quot;<br>
-SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D &quot;deaa5745de3f5231ce10=
517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7&quot;<br>
-SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D &quot;62b42531d03e08d4ef1f6e85a2ed4=
22eb678b8cd62b762e53891c05faf0d4afa&quot;<br>
-SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D &quot;7305c720fa01b8055ec95e484a=
6eca7a83c841267f0dd5280f0c8b8551d2c158&quot;<br>
-SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D &quot;7c7e9b68bb9c3149c5=
b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185&quot;<br>
-SRC_URI[quote-1.0.35.sha256sum] =3D &quot;291ec9ab5efd934aaf503a6466c5d525=
1535d108ee747472c3977cc5acc868ef&quot;<br>
-SRC_URI[redox_syscall-0.4.1.sha256sum] =3D &quot;4722d768eff46b75989dd134e=
5c353f0d6296e5aaa3132e776cbdb56be7731aa&quot;<br>
-SRC_URI[scopeguard-1.2.0.sha256sum] =3D &quot;94143f37725109f92c262ed2cf5e=
59bce7498c01bcc1502d7b9afe439a4e9f49&quot;<br>
-SRC_URI[self_cell-1.0.3.sha256sum] =3D &quot;58bf37232d3bb9a2c4e641ca2a11d=
83b5062066f88df7fed36c28772046d65ba&quot;<br>
-SRC_URI[smallvec-1.13.1.sha256sum] =3D &quot;e6ecd384b10a64542d77071bd64bd=
7b231f4ed5940fba55e98c3de13824cf3d7&quot;<br>
-SRC_URI[syn-2.0.48.sha256sum] =3D &quot;0f3531638e407dfc0814761abb7c00a5b5=
4992b849452a0646b7f65c9f770f3f&quot;<br>
-SRC_URI[target-lexicon-0.12.13.sha256sum] =3D &quot;69758bda2e78f098e4ccb3=
93021a0963bb3442eac05f135c30f61b7370bbafae&quot;<br>
+SRC_URI[openssl-sys-0.9.103.sha256sum] =3D &quot;7f9e8deee91df40a943c71b91=
7e5874b951d32a802526c85721ce3b776c929d6&quot;<br>
+SRC_URI[pem-3.0.4.sha256sum] =3D &quot;8e459365e590736a54c3fa561947c848375=
34b8e9af6fc5bf781307e82658fae&quot;<br>
+SRC_URI[pkg-config-0.3.30.sha256sum] =3D &quot;d231b230927b5e4ad203db57bbc=
bee2802f6bce620b1e4a9024a07d94e2907ec&quot;<br>
+SRC_URI[portable-atomic-1.7.0.sha256sum] =3D &quot;da544ee218f0d287a911e9c=
99a39a8c9bc8fcad3cb8db5959940044ecfc67265&quot;<br>
+SRC_URI[proc-macro2-1.0.86.sha256sum] =3D &quot;5e719e8df665df0d1c8fbfd238=
015744736151d4445ec0836b8e628aae103b77&quot;<br>
+SRC_URI[pyo3-0.22.2.sha256sum] =3D &quot;831e8e819a138c36e212f3af3fd9eeffe=
d6bf1510a805af35b0edee5ffa59433&quot;<br>
+SRC_URI[pyo3-build-config-0.22.2.sha256sum] =3D &quot;1e8730e591b14492a894=
5cdff32f089250b05f5accecf74aeddf9e8272ce1fa8&quot;<br>
+SRC_URI[pyo3-ffi-0.22.2.sha256sum] =3D &quot;5e97e919d2df92eb88ca80a037969=
f44e5e70356559654962cbb3316d00300c6&quot;<br>
+SRC_URI[pyo3-macros-0.22.2.sha256sum] =3D &quot;eb57983022ad41f9e683a599f2=
fd13c3664d7063a3ac5714cae4b7bee7d3f206&quot;<br>
+SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] =3D &quot;ec480c0c51ddec8101=
9531705acac51bcdbeae563557c982aa8263bb96880372&quot;<br>
+SRC_URI[quote-1.0.36.sha256sum] =3D &quot;0fa76aaf39101c457836aec0ce2316db=
dc3ab723cdda1c6bd4e6ad4208acaca7&quot;<br>
+SRC_URI[self_cell-1.0.4.sha256sum] =3D &quot;d369a96f978623eb3dc28807c4852=
d6cc617fed53da5d3c400feff1ef34a714a&quot;<br>
+SRC_URI[syn-2.0.71.sha256sum] =3D &quot;b146dcf730474b4bcd16c311627b31ede9=
ab149045db4d6088b3becaea046462&quot;<br>
+SRC_URI[target-lexicon-0.12.15.sha256sum] =3D &quot;4873307b7c257eddcb50c9=
bedf158eb669578359fb28428bef438fec8e6ba7c2&quot;<br>
=C2=A0SRC_URI[unicode-ident-1.0.12.sha256sum] =3D &quot;3354b9ac3fae1ff6755=
cb6db53683adb661634f67557942dea4facebec0fee4b&quot;<br>
=C2=A0SRC_URI[unindent-0.2.3.sha256sum] =3D &quot;c7de7d73e1754487cb58364ee=
906a499937a0dfabd86bcb980fa99ec8c8fa2ce&quot;<br>
=C2=A0SRC_URI[vcpkg-0.2.15.sha256sum] =3D &quot;accd4ea62f7bb7a82fe23066fb0=
957d48ef677f6eeb8215f372f52e48bb32426&quot;<br>
-SRC_URI[windows-targets-0.48.5.sha256sum] =3D &quot;9a2fa6e2155d7247be68c0=
96456083145c183cbbbc2764150dda45a87197940c&quot;<br>
-SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D &quot;2b38e32f0abccf=
9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8&quot;<br>
-SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D &quot;dc35310971f3b2dbb=
f3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc&quot;<br>
-SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D &quot;a75915e7def60c94dcef7=
2200b9a8e58e5091744960da64ec734a6c6e9b3743e&quot;<br>
-SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D &quot;8f55c233f70c4b27f66c=
523580f78f1004e8b5a8b659e05a4eb49d4166cca406&quot;<br>
-SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D &quot;53d40abd2583d23e471=
8fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e&quot;<br>
-SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D &quot;0b7b52767868a23=
d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc&quot;<br>
-SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D &quot;ed94fce61571a40068=
52b7389a063ab983c02eb1bb37b47f8272ce92d06d9538&quot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptog=
raphy-vectors_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypt=
ography-vectors_42.0.8.bb</a> b/meta/recipes-devtools/python/<a href=3D"htt=
p://python3-cryptography-vectors_43.0.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-cryptography-vectors_43.0.1.bb</a><br>
similarity index 75%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-cryptogr=
aphy-vectors_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypto=
graphy-vectors_42.0.8.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-cryptograp=
hy-vectors_43.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy-vectors_43.0.1.bb</a><br>
index 1256e75c47..7b8216b05e 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography-v=
ectors_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography=
-vectors_42.0.8.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography-v=
ectors_43.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography=
-vectors_43.0.1.bb</a><br>
@@ -9,19 +9,19 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c3617db4=
fb6fae01f1d253ab91511e4 \<br>
=C2=A0# NOTE: Make sure to keep this recipe at the same version as python3-=
cryptography<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0Upgrade both recipes at the same time<br>
<br>
-SRC_URI[sha256sum] =3D &quot;df5657367bc0a90c374309cb261009a2c53cae91a4587=
81339a0f724f819a46a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;68a0fc18fe27b309e933a293a54f3356b78a14c15207e=
96c9ff85681af0509de&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;cryptography_vectors&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
-DEPENDS +=3D &quot; \<br>
+DEPENDS +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-cryptography \<br>
=C2=A0&quot;<br>
<br>
=C2=A0do_install:append () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Remove the sha256 checksum lines for pycache =
files<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography=
_vectors-${PV}.dist-info/RECORD -e &#39;/__pycache__/d&#39; -i<br>
+=C2=A0 =C2=A0 # Remove the sha256 checksum lines for pycache files<br>
+=C2=A0 =C2=A0 sed ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors-${PV=
}.dist-info/RECORD -e &#39;/__pycache__/d&#39; -i<br>
=C2=A0}<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproje=
ct.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/pytho=
n/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.=
patch<br>
index 3eed171ffe..907e462653 100644<br>
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml=
-remove-benchmark-disable-option.patch<br>
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml=
-remove-benchmark-disable-option.patch<br>
@@ -1,4 +1,4 @@<br>
-From e4d7856fe842f3df7c614554d006d81253a5edf2 Mon Sep 17 00:00:00 2001<br>
+From 31b9e612eae62452c786a5aecdcf89b131afc8fa Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=
=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
=C2=A0Date: Tue, 17 May 2022 17:22:48 +0800<br>
=C2=A0Subject: [PATCH] pyproject.toml: remove --benchmark-disable option<br=
>
@@ -26,11 +26,11 @@ Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orl=
ing@konsulko.com" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/pyproject.toml b/pyproject.toml<br>
-index d2e304f..10aabcf 100644<br>
+index e5b801d..985fc8c 100644<br>
=C2=A0--- a/pyproject.toml<br>
=C2=A0+++ b/pyproject.toml<br>
-@@ -92,7 +92,7 @@ rust-version =3D &quot;&gt;=3D1.63.0&quot;<br>
- <br>
+@@ -117,7 +117,7 @@ exclude =3D [<br>
+ ]<br>
<br>
=C2=A0 [tool.pytest.ini_options]<br>
=C2=A0-addopts =3D &quot;-r s --capture=3Dno --strict-markers --benchmark-d=
isable&quot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptog=
raphy_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_=
42.0.8.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-cryp=
tography_43.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptograp=
hy_43.0.1.bb</a><br>
similarity index 59%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-cryptogr=
aphy_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_4=
2.0.8.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-cryptograp=
hy_43.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_43.=
0.1.bb</a><br>
index 3f70f910d4..dfa662d128 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_4=
2.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_42.0.8.=
bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_4=
3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_43.0.1.=
bb</a><br>
@@ -2,49 +2,28 @@ SUMMARY =3D &quot;Provides cryptographic recipes and prim=
itives to python developers&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://cryptography.io/" rel=3D"norefe=
rrer" target=3D"_blank">https://cryptography.io/</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0 | BSD-3-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab9=
1511e4 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE.APACHE;md5=3D4e168cce331e5c827d4c2b68a6200e1b \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49aa0b0dce887b \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;<br>
+LIC_FILES_CHKSUM =3D &quot;\<br>
+=C2=A0 =C2=A0 file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \<br>
+=C2=A0 =C2=A0 file://LICENSE.APACHE;md5=3D4e168cce331e5c827d4c2b68a6200e1b=
 \<br>
+=C2=A0 =C2=A0 file://LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49aa0b0dce887b \<=
br>
+&quot;<br>
=C2=A0LDSHARED +=3D &quot;-pthread&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;8d09d05439ce7baa8e9e95b07ec5b6c886f548deb7e0f=
69ef25f64b3bce842f2&quot;<br>
-<br>
-SRC_URI +=3D &quot;file://0001-pyproject.toml-remove-benchmark-disable-opt=
ion.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://check-memfree.py \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-require ${BPN}-crates.inc<br>
-<br>
-inherit pypi python_setuptools3_rust cargo-update-recipe-crates pkgconfig<=
br>
-<br>
-DEPENDS +=3D &quot; \<br>
+DEPENDS +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-cffi-native \<br>
=C2=A0&quot;<br>
<br>
-RDEPENDS:${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 python3-cffi \<br>
-&quot;<br>
+SRC_URI[sha256sum] =3D &quot;203e92a75716d8cfb491dc47c79e17d0d9207ccffcbcb=
35f598fbe463ae3444d&quot;<br>
<br>
-RDEPENDS:${PN}:append:class-target =3D &quot; \<br>
-=C2=A0 =C2=A0 python3-numbers \<br>
-=C2=A0 =C2=A0 python3-threading \<br>
+SRC_URI:append =3D &quot; \<br>
+=C2=A0 =C2=A0 file://0001-pyproject.toml-remove-benchmark-disable-option.p=
atch \<br>
+=C2=A0 =C2=A0 file://check-memfree.py \<br>
+=C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
-RDEPENDS:${PN}-ptest +=3D &quot; \<br>
-=C2=A0 =C2=A0 python3-bcrypt \<br>
-=C2=A0 =C2=A0 python3-cryptography-vectors (=3D ${PV}) \<br>
-=C2=A0 =C2=A0 python3-hypothesis \<br>
-=C2=A0 =C2=A0 python3-iso8601 \<br>
-=C2=A0 =C2=A0 python3-mmap \<br>
-=C2=A0 =C2=A0 python3-pretend \<br>
-=C2=A0 =C2=A0 python3-psutil \<br>
-=C2=A0 =C2=A0 python3-pytest \<br>
-=C2=A0 =C2=A0 python3-unittest-automake-output \<br>
-=C2=A0 =C2=A0 python3-pytest-subtests \<br>
-=C2=A0 =C2=A0 python3-pytz \<br>
-&quot;<br>
+require ${BPN}-crates.inc<br>
+<br>
+inherit pypi python_maturin cargo-update-recipe-crates pkgconfig<br>
<br>
=C2=A0inherit ptest<br>
<br>
@@ -60,8 +39,29 @@ do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/<br>
=C2=A0}<br>
<br>
-FILES:${PN}-dbg +=3D &quot; \<br>
+FILES:${PN}-dbg +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.=
debug \<br>
=C2=A0&quot;<br>
<br>
+RDEPENDS:${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 python3-cffi \<br>
+&quot;<br>
+<br>
+RDEPENDS:${PN}:append:class-target =3D &quot; \<br>
+=C2=A0 =C2=A0 python3-numbers \<br>
+=C2=A0 =C2=A0 python3-threading \<br>
+&quot;<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot;\<br>
+=C2=A0 =C2=A0 python3-certifi \<br>
+=C2=A0 =C2=A0 python3-cryptography-vectors (=3D ${PV}) \<br>
+=C2=A0 =C2=A0 python3-pretend \<br>
+=C2=A0 =C2=A0 python3-pytest \<br>
+=C2=A0 =C2=A0 python3-pytest-benchmark \<br>
+=C2=A0 =C2=A0 python3-pytest-cov \<br>
+=C2=A0 =C2=A0 python3-pytest-subtests \<br>
+=C2=A0 =C2=A0 python3-pytest-xdist \<br>
+=C2=A0 =C2=A0 python3-unittest-automake-output \<br>
+&quot;<br>
+<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#205369): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/205369" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/205369</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108918442/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/108918442/924729</a><br>
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

--000000000000358bd30624177f59--

