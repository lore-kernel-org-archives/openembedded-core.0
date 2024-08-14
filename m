Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D56C52D7D
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 23:39:24 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.111925.1723678758397807953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 16:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=g4DS2q2n;
 spf=pass (domain: konsulko.com, ip: 209.85.208.180, mailfrom: tim.orling@konsulko.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ef248ab2aeso6219321fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 16:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723678756; x=1724283556; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H2GnZehnkFMK8L06qYRdlPPIoSwBiGK6vQ9IHwZ+124=;
        b=g4DS2q2n3lsG4U+o2sK7V6giSjTC8MHfrXyDqMBv1k3IyF54jyOaf207xku4j5fUfx
         /MvYL2qj3dB2RxKnccQn54GOXx653fvpKrEEmTCW9R9xLKmBjZ/Zuo3oSxF51rnJgdTG
         BHgR1R0hdERIYDcr01l4O4+4LOLn19VHAurEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723678756; x=1724283556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2GnZehnkFMK8L06qYRdlPPIoSwBiGK6vQ9IHwZ+124=;
        b=fCCHZDpaSwM/GncCgfcTN1f2Mh05/fU7ftA2iZ+m0xdR1fKwWdeUWnc7KErq63hls8
         4/ts94KyGm8kbMmtvnbWIdVpUp4nOZjYjv5+o874SoGBw38Cxhp7HEEI11ELdIZfNpsy
         7VTJt261XHHPyPavq3xjRNTxYPdDgl6rp/czmRbLYMMu8zVDjYq1/B7w1tYkvQOgTzee
         WSJkqXrcJKle1YazhRnIOpYiStpjtDo5hIAk4tSM5aYfjOQ9jopcnC2Hz0/Z1Mx+7XRL
         Gcrf8OHZViZuXWww1glW1aWOuPVZgVnsgC9FFNHGIR43i0zUIjLTWj5bpjtBwJk7nrqv
         D5ug==
X-Gm-Message-State: AOJu0Yx1XvFYxbxsGTaDcj1qVVpgld775VcGlb56fpckjfJ10ZH44W7b
	5gWi2aEiR3AenMrBZGeJexmBx5MfsLEfK5bAaWSqedH1h3OwUJPy4+lMJihhNkVR9LI61d436Sg
	hXJHPSW+iGpBIs8q+FsMOeEUCNxhiECS+55ePjQ==
X-Google-Smtp-Source: AGHT+IFlJ/+9wcg3HXrFUvgOHtNjIK4bQAJZ86fs45ygQ+afO/5QnOJQtoWUopKjVGlb/Cz92VsBu00Y9Da9RHUaOik=
X-Received: by 2002:a2e:9b09:0:b0:2ef:22a6:d90d with SMTP id
 38308e7fff4ca-2f3aa3013e0mr32333301fa.47.1723678755799; Wed, 14 Aug 2024
 16:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240813031628.1123492-1-tim.orling@konsulko.com> <20240814225104ed116094@mail.local>
In-Reply-To: <20240814225104ed116094@mail.local>
From: Tim Orling <tim.orling@konsulko.com>
Date: Wed, 14 Aug 2024 16:39:04 -0700
Message-ID: <CAOyo-85dM7t_uByZ12qPh9haZmOHiKFTRnyfhMmp2u9oCzYoHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography{-vectors}: upgrade 42.0.8
 -> 43.0.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f26b5d061fad3b33"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 23:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203333

--000000000000f26b5d061fad3b33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 3:51=E2=80=AFPM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> This causes reproducibility issues:
>

lol. This was supposed to fix reproducibility issues!


>
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240813-qgfy=
yhkg/packages/diff-html/
>
>
Those data.tar.xz differences look entirely different. I'm going to have to
dig over the next couple days and perhaps ask upstream, unless someone else
recognizes a pattern. Although I wonder if this is just "this rust package
was not populated in Repro A because the task was already in state and it
was populated in Repro B because it was built from scratch". If that is the
case, we have something elsewhere causing problems with state (rust, cargo,
python3-py03 or python3-maturin for instance).


>
> On 12/08/2024 20:16:28-0700, Tim Orling wrote:
> > From: Tim Orling <tim.orling@konsulko.com>
> >
> > * PEP-517 has changed to maturin
> >
> https://github.com/pyca/cryptography/commit/5b23baae7e1a59ab16630e6f8eae1=
3e2b8822ded
> >
> > https://github.com/pyca/cryptography/compare/42.0.8...43.0.0
> >
> > 43.0.0 - 2024-07-20=EF=83=81
> > * BACKWARDS INCOMPATIBLE: Support for OpenSSL less than 1.1.1e has been
> >   removed. Users on older version of OpenSSL will need to upgrade.
> > * BACKWARDS INCOMPATIBLE: Dropped support for LibreSSL < 3.8.
> > * Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL
> 3.3.1.
> > * Updated the minimum supported Rust version (MSRV) to 1.65.0, from
> 1.63.0.
> > * generate_private_key() now enforces a minimum RSA key size of 1024-bi=
t.
> >   Note that 1024-bit is still considered insecure, users should
> generally use
> >   a key size of 2048-bits.
> > * serialize_certificates() now emits ASN.1 that more closely follows th=
e
> >   recommendations in RFC 2315.
> > * Added new Decrepit cryptography module which contains outdated and
> insecure
> >   cryptographic primitives. CAST5, SEED, IDEA, and Blowfish, which were
> >   deprecated in 37.0.0, have been added to this module. They will be
> removed
> >   from the cipher module in 45.0.0.
> > * Moved TripleDES and ARC4 into Decrepit cryptography and deprecated
> them in
> >   the cipher module. They will be removed from the cipher module in
> 48.0.0.
> > * Added support for deterministic ECDSA (RFC 6979)
> > * Added support for client certificate verification to the X.509 path
> >   validation APIs in the form of ClientVerifier, VerifiedClient, and
> >   PolicyBuilder build_client_verifier().
> > * Added Certificate public_key_algorithm_oid and Certificate Signing
> Request
> >   public_key_algorithm_oid to determine the PublicKeyAlgorithmOID Objec=
t
> >   Identifier of the public key found inside the certificate.
> > * Added invalidity_date_utc, a timezone-aware alternative to the na=C3=
=AFve
> >   datetime attribute invalidity_date.
> > * Added support for parsing empty DN string in from_rfc4514_string().
> > * Added the following properties that return timezone-aware datetime
> objects:
> >   produced_at_utc(), revocation_time_utc(), this_update_utc(),
> >   next_update_utc(), revocation_time_utc(), this_update_utc(),
> >   next_update_utc(), These are timezone-aware variants of existing
> properties
> >   that return na=C3=AFve datetime objects.
> > * Added rsa_recover_private_exponent()
> > * Added reset_nonce() for altering the nonce of a cipher context withou=
t
> >   initializing a new instance. See the docs for additional restrictions=
.
> > * NameAttribute now raises an exception when attempting to create a
> common
> >   name whose length is shorter or longer than RFC 5280 permits.
> > * Added basic support for PKCS7 encryption (including SMIME) via
> >   PKCS7EnvelopeBuilder.
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  .../python/python3-cryptography-crates.inc    | 130 +++++++-----------
> >  ...=3D> python3-cryptography-vectors_43.0.0.bb} |   2 +-
> >  ...toml-remove-benchmark-disable-option.patch |   8 +-
> >  ....0.8.bb =3D> python3-cryptography_43.0.0.bb} |   4 +-
> >  4 files changed, 57 insertions(+), 87 deletions(-)
> >  rename meta/recipes-devtools/python/{
> python3-cryptography-vectors_42.0.8.bb =3D>
> python3-cryptography-vectors_43.0.0.bb} (91%)
> >  rename meta/recipes-devtools/python/{python3-cryptography_42.0.8.bb =
=3D>
> python3-cryptography_43.0.0.bb} (91%)
> >
> > diff --git
> a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> > index dbeda05dc45..a0f606cb46e 100644
> > --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> > +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> > @@ -2,101 +2,71 @@
> >
> >  # from src/rust/Cargo.lock
> >  SRC_URI +=3D " \
> > -    crate://crates.io/asn1/0.15.5 \
> > -    crate://crates.io/asn1_derive/0.15.5 \
> > -    crate://crates.io/autocfg/1.1.0 \
> > -    crate://crates.io/base64/0.21.7 \
> > -    crate://crates.io/bitflags/1.3.2 \
> > -    crate://crates.io/bitflags/2.4.2 \
> > -    crate://crates.io/cc/1.0.83 \
> > +    crate://crates.io/asn1/0.16.2 \
> > +    crate://crates.io/asn1_derive/0.16.2 \
> > +    crate://crates.io/autocfg/1.3.0 \
> > +    crate://crates.io/base64/0.22.1 \
> > +    crate://crates.io/bitflags/2.6.0 \
> > +    crate://crates.io/cc/1.1.6 \
> >      crate://crates.io/cfg-if/1.0.0 \
> >      crate://crates.io/foreign-types/0.3.2 \
> >      crate://crates.io/foreign-types-shared/0.1.1 \
> > -    crate://crates.io/heck/0.4.1 \
> > -    crate://crates.io/indoc/2.0.4 \
> > -    crate://crates.io/libc/0.2.152 \
> > -    crate://crates.io/lock_api/0.4.11 \
> > -    crate://crates.io/memoffset/0.9.0 \
> > +    crate://crates.io/heck/0.5.0 \
> > +    crate://crates.io/indoc/2.0.5 \
> > +    crate://crates.io/libc/0.2.155 \
> > +    crate://crates.io/memoffset/0.9.1 \
> >      crate://crates.io/once_cell/1.19.0 \
> > -    crate://crates.io/openssl/0.10.64 \
> > +    crate://crates.io/openssl/0.10.65 \
> >      crate://crates.io/openssl-macros/0.1.1 \
> > -    crate://crates.io/openssl-sys/0.9.102 \
> > -    crate://crates.io/parking_lot/0.12.1 \
> > -    crate://crates.io/parking_lot_core/0.9.9 \
> > -    crate://crates.io/pem/3.0.3 \
> > -    crate://crates.io/pkg-config/0.3.29 \
> > -    crate://crates.io/portable-atomic/1.6.0 \
> > -    crate://crates.io/proc-macro2/1.0.78 \
> > -    crate://crates.io/pyo3/0.20.3 \
> > -    crate://crates.io/pyo3-build-config/0.20.3 \
> > -    crate://crates.io/pyo3-ffi/0.20.3 \
> > -    crate://crates.io/pyo3-macros/0.20.3 \
> > -    crate://crates.io/pyo3-macros-backend/0.20.3 \
> > -    crate://crates.io/quote/1.0.35 \
> > -    crate://crates.io/redox_syscall/0.4.1 \
> > -    crate://crates.io/scopeguard/1.2.0 \
> > -    crate://crates.io/self_cell/1.0.3 \
> > -    crate://crates.io/smallvec/1.13.1 \
> > -    crate://crates.io/syn/2.0.48 \
> > -    crate://crates.io/target-lexicon/0.12.13 \
> > +    crate://crates.io/openssl-sys/0.9.103 \
> > +    crate://crates.io/pem/3.0.4 \
> > +    crate://crates.io/pkg-config/0.3.30 \
> > +    crate://crates.io/portable-atomic/1.7.0 \
> > +    crate://crates.io/proc-macro2/1.0.86 \
> > +    crate://crates.io/pyo3/0.22.2 \
> > +    crate://crates.io/pyo3-build-config/0.22.2 \
> > +    crate://crates.io/pyo3-ffi/0.22.2 \
> > +    crate://crates.io/pyo3-macros/0.22.2 \
> > +    crate://crates.io/pyo3-macros-backend/0.22.2 \
> > +    crate://crates.io/quote/1.0.36 \
> > +    crate://crates.io/self_cell/1.0.4 \
> > +    crate://crates.io/syn/2.0.71 \
> > +    crate://crates.io/target-lexicon/0.12.15 \
> >      crate://crates.io/unicode-ident/1.0.12 \
> >      crate://crates.io/unindent/0.2.3 \
> >      crate://crates.io/vcpkg/0.2.15 \
> > -    crate://crates.io/windows-targets/0.48.5 \
> > -    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
> > -    crate://crates.io/windows_aarch64_msvc/0.48.5 \
> > -    crate://crates.io/windows_i686_gnu/0.48.5 \
> > -    crate://crates.io/windows_i686_msvc/0.48.5 \
> > -    crate://crates.io/windows_x86_64_gnu/0.48.5 \
> > -    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
> > -    crate://crates.io/windows_x86_64_msvc/0.48.5 \
> >  "
> >
> > -SRC_URI[asn1-0.15.5.sha256sum] =3D
> "ae3ecbce89a22627b5e8e6e11d69715617138290289e385cde773b1fe50befdb"
> > -SRC_URI[asn1_derive-0.15.5.sha256sum] =3D
> "861af988fac460ac69a09f41e6217a8fb9178797b76fcc9478444be6a59be19c"
> > -SRC_URI[autocfg-1.1.0.sha256sum] =3D
> "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> > -SRC_URI[base64-0.21.7.sha256sum] =3D
> "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
> > -SRC_URI[bitflags-1.3.2.sha256sum] =3D
> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> > -SRC_URI[bitflags-2.4.2.sha256sum] =3D
> "ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf"
> > -SRC_URI[cc-1.0.83.sha256sum] =3D
> "f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0"
> > +SRC_URI[asn1-0.16.2.sha256sum] =3D
> "532ceda058281b62096b2add4ab00ab3a453d30dee28b8890f62461a0109ebbd"
> > +SRC_URI[asn1_derive-0.16.2.sha256sum] =3D
> "56e6076d38cc17cc22b0f65f31170a2ee1975e6b07f0012893aefd86ce19c987"
> > +SRC_URI[autocfg-1.3.0.sha256sum] =3D
> "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
> > +SRC_URI[base64-0.22.1.sha256sum] =3D
> "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
> > +SRC_URI[bitflags-2.6.0.sha256sum] =3D
> "b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de"
> > +SRC_URI[cc-1.1.6.sha256sum] =3D
> "2aba8f4e9906c7ce3c73463f62a7f0c65183ada1a2d47e397cc8810827f9694f"
> >  SRC_URI[cfg-if-1.0.0.sha256sum] =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> >  SRC_URI[foreign-types-0.3.2.sha256sum] =3D
> "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
> >  SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D
> "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
> > -SRC_URI[heck-0.4.1.sha256sum] =3D
> "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
> > -SRC_URI[indoc-2.0.4.sha256sum] =3D
> "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
> > -SRC_URI[libc-0.2.152.sha256sum] =3D
> "13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7"
> > -SRC_URI[lock_api-0.4.11.sha256sum] =3D
> "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
> > -SRC_URI[memoffset-0.9.0.sha256sum] =3D
> "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
> > +SRC_URI[heck-0.5.0.sha256sum] =3D
> "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
> > +SRC_URI[indoc-2.0.5.sha256sum] =3D
> "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
> > +SRC_URI[libc-0.2.155.sha256sum] =3D
> "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
> > +SRC_URI[memoffset-0.9.1.sha256sum] =3D
> "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
> >  SRC_URI[once_cell-1.19.0.sha256sum] =3D
> "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
> > -SRC_URI[openssl-0.10.64.sha256sum] =3D
> "95a0481286a310808298130d22dd1fef0fa571e05a8f44ec801801e84b216b1f"
> > +SRC_URI[openssl-0.10.65.sha256sum] =3D
> "c2823eb4c6453ed64055057ea8bd416eda38c71018723869dd043a3b1186115e"
> >  SRC_URI[openssl-macros-0.1.1.sha256sum] =3D
> "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
> > -SRC_URI[openssl-sys-0.9.102.sha256sum] =3D
> "c597637d56fbc83893a35eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2"
> > -SRC_URI[parking_lot-0.12.1.sha256sum] =3D
> "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
> > -SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D
> "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
> > -SRC_URI[pem-3.0.3.sha256sum] =3D
> "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
> > -SRC_URI[pkg-config-0.3.29.sha256sum] =3D
> "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
> > -SRC_URI[portable-atomic-1.6.0.sha256sum] =3D
> "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
> > -SRC_URI[proc-macro2-1.0.78.sha256sum] =3D
> "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
> > -SRC_URI[pyo3-0.20.3.sha256sum] =3D
> "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
> > -SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D
> "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
> > -SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D
> "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
> > -SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D
> "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
> > -SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D
> "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
> > -SRC_URI[quote-1.0.35.sha256sum] =3D
> "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
> > -SRC_URI[redox_syscall-0.4.1.sha256sum] =3D
> "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
> > -SRC_URI[scopeguard-1.2.0.sha256sum] =3D
> "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
> > -SRC_URI[self_cell-1.0.3.sha256sum] =3D
> "58bf37232d3bb9a2c4e641ca2a11d83b5062066f88df7fed36c28772046d65ba"
> > -SRC_URI[smallvec-1.13.1.sha256sum] =3D
> "e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7"
> > -SRC_URI[syn-2.0.48.sha256sum] =3D
> "0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f"
> > -SRC_URI[target-lexicon-0.12.13.sha256sum] =3D
> "69758bda2e78f098e4ccb393021a0963bb3442eac05f135c30f61b7370bbafae"
> > +SRC_URI[openssl-sys-0.9.103.sha256sum] =3D
> "7f9e8deee91df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6"
> > +SRC_URI[pem-3.0.4.sha256sum] =3D
> "8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae"
> > +SRC_URI[pkg-config-0.3.30.sha256sum] =3D
> "d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec"
> > +SRC_URI[portable-atomic-1.7.0.sha256sum] =3D
> "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265"
> > +SRC_URI[proc-macro2-1.0.86.sha256sum] =3D
> "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
> > +SRC_URI[pyo3-0.22.2.sha256sum] =3D
> "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
> > +SRC_URI[pyo3-build-config-0.22.2.sha256sum] =3D
> "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
> > +SRC_URI[pyo3-ffi-0.22.2.sha256sum] =3D
> "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
> > +SRC_URI[pyo3-macros-0.22.2.sha256sum] =3D
> "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
> > +SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] =3D
> "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
> > +SRC_URI[quote-1.0.36.sha256sum] =3D
> "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
> > +SRC_URI[self_cell-1.0.4.sha256sum] =3D
> "d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a"
> > +SRC_URI[syn-2.0.71.sha256sum] =3D
> "b146dcf730474b4bcd16c311627b31ede9ab149045db4d6088b3becaea046462"
> > +SRC_URI[target-lexicon-0.12.15.sha256sum] =3D
> "4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2"
> >  SRC_URI[unicode-ident-1.0.12.sha256sum] =3D
> "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
> >  SRC_URI[unindent-0.2.3.sha256sum] =3D
> "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
> >  SRC_URI[vcpkg-0.2.15.sha256sum] =3D
> "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
> > -SRC_URI[windows-targets-0.48.5.sha256sum] =3D
> "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
> > -SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D
> "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
> > -SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D
> "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
> > -SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D
> "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
> > -SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D
> "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
> > -SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D
> "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
> > -SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D
> "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
> > -SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D
> "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
> > diff --git a/meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.8.bb b/meta/recipes-devtools/python/
> python3-cryptography-vectors_43.0.0.bb
> > similarity index 91%
> > rename from meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.8.bb
> > rename to meta/recipes-devtools/python/
> python3-cryptography-vectors_43.0.0.bb
> > index 1256e75c474..1f766140748 100644
> > --- a/meta/recipes-devtools/python/
> python3-cryptography-vectors_42.0.8.bb
> > +++ b/meta/recipes-devtools/python/
> python3-cryptography-vectors_43.0.0.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
> >  # NOTE: Make sure to keep this recipe at the same version as
> python3-cryptography
> >  #       Upgrade both recipes at the same time
> >
> > -SRC_URI[sha256sum] =3D
> "df5657367bc0a90c374309cb261009a2c53cae91a458781339a0f724f819a46a"
> > +SRC_URI[sha256sum] =3D
> "5c9d09a732d5433cede1542a96ecd70a80e122af047ee7404bcdf1f3ccb8e702"
> >
> >  PYPI_PACKAGE =3D "cryptography_vectors"
> >
> > diff --git
> a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> > index 3eed171ffee..b0c5098961d 100644
> > ---
> a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> > +++
> b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-r=
emove-benchmark-disable-option.patch
> > @@ -1,4 +1,4 @@
> > -From e4d7856fe842f3df7c614554d006d81253a5edf2 Mon Sep 17 00:00:00 2001
> > +From 82e71e7122d9131ffcd786a0bffeaf846967a37e Mon Sep 17 00:00:00 2001
> >  From: Mingli Yu <mingli.yu@windriver.com>
> >  Date: Tue, 17 May 2022 17:22:48 +0800
> >  Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
> > @@ -26,11 +26,11 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/pyproject.toml b/pyproject.toml
> > -index d2e304f..10aabcf 100644
> > +index 5f1bcc7..ba02540 100644
> >  --- a/pyproject.toml
> >  +++ b/pyproject.toml
> > -@@ -92,7 +92,7 @@ rust-version =3D ">=3D1.63.0"
> > -
> > +@@ -117,7 +117,7 @@ exclude =3D [
> > + ]
> >
> >   [tool.pytest.ini_options]
> >  -addopts =3D "-r s --capture=3Dno --strict-markers --benchmark-disable=
"
> > diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.8.b=
b
> b/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb
> > similarity index 91%
> > rename from meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
> > rename to meta/recipes-devtools/python/python3-cryptography_43.0.0.bb
> > index 3f70f910d4d..778471b4ff5 100644
> > --- a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
> > +++ b/meta/recipes-devtools/python/python3-cryptography_43.0.0.bb
> > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab91511e4 \
> >                     "
> >  LDSHARED +=3D "-pthread"
> >
> > -SRC_URI[sha256sum] =3D
> "8d09d05439ce7baa8e9e95b07ec5b6c886f548deb7e0f69ef25f64b3bce842f2"
> > +SRC_URI[sha256sum] =3D
> "b88075ada2d51aa9f18283532c9f60e72170041bba88d7f37e49cbb10275299e"
> >
> >  SRC_URI +=3D
> "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
> >              file://check-memfree.py \
> > @@ -17,7 +17,7 @@ SRC_URI +=3D
> "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
> >
> >  require ${BPN}-crates.inc
> >
> > -inherit pypi python_setuptools3_rust cargo-update-recipe-crates
> pkgconfig
> > +inherit pypi python_maturin cargo-update-recipe-crates pkgconfig
> >
> >  DEPENDS +=3D " \
> >      python3-cffi-native \
> > --
> > 2.46.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#203242):
> https://lists.openembedded.org/g/openembedded-core/message/203242
> > Mute This Topic: https://lists.openembedded.org/mt/107870272/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000f26b5d061fad3b33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 14, 2024 at 3:51=E2=80=AF=
PM Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">a=
lexandre.belloni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">This causes reproducibility issues:<br></blockq=
uote><div><br></div><div>lol. This was supposed to fix reproducibility issu=
es!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
<a href=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2024=
0813-qgfyyhkg/packages/diff-html/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240813-qgfyyhkg/=
packages/diff-html/</a><br>
<br></blockquote><div><br></div><div>Those data.tar.xz differences look ent=
irely different. I&#39;m going to have to dig over the next couple days and=
 perhaps ask upstream, unless someone else recognizes a pattern. Although I=
 wonder if this is just &quot;this rust package was not populated in Repro =
A because the task was already in state=C2=A0and it was populated in Repro =
B because it was built from scratch&quot;. If that is the case, we have som=
ething elsewhere causing problems with state=C2=A0(rust, cargo, python3-py0=
3 or python3-maturin for instance).</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
On 12/08/2024 20:16:28-0700, Tim Orling wrote:<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=
=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; <br>
&gt; * PEP-517 has changed to maturin<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/pyca/cryptography/commit/5b2=
3baae7e1a59ab16630e6f8eae13e2b8822ded" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/pyca/cryptography/commit/5b23baae7e1a59ab16630e6f8eae13=
e2b8822ded</a><br>
&gt; <br>
&gt; <a href=3D"https://github.com/pyca/cryptography/compare/42.0.8...43.0.=
0" rel=3D"noreferrer" target=3D"_blank">https://github.com/pyca/cryptograph=
y/compare/42.0.8...43.0.0</a><br>
&gt; <br>
&gt; 43.0.0 - 2024-07-20=EF=83=81<br>
&gt; * BACKWARDS INCOMPATIBLE: Support for OpenSSL less than 1.1.1e has bee=
n<br>
&gt;=C2=A0 =C2=A0removed. Users on older version of OpenSSL will need to up=
grade.<br>
&gt; * BACKWARDS INCOMPATIBLE: Dropped support for LibreSSL &lt; 3.8.<br>
&gt; * Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL=
 3.3.1.<br>
&gt; * Updated the minimum supported Rust version (MSRV) to 1.65.0, from 1.=
63.0.<br>
&gt; * generate_private_key() now enforces a minimum RSA key size of 1024-b=
it.<br>
&gt;=C2=A0 =C2=A0Note that 1024-bit is still considered insecure, users sho=
uld generally use<br>
&gt;=C2=A0 =C2=A0a key size of 2048-bits.<br>
&gt; * serialize_certificates() now emits ASN.1 that more closely follows t=
he<br>
&gt;=C2=A0 =C2=A0recommendations in RFC 2315.<br>
&gt; * Added new Decrepit cryptography module which contains outdated and i=
nsecure<br>
&gt;=C2=A0 =C2=A0cryptographic primitives. CAST5, SEED, IDEA, and Blowfish,=
 which were<br>
&gt;=C2=A0 =C2=A0deprecated in 37.0.0, have been added to this module. They=
 will be removed<br>
&gt;=C2=A0 =C2=A0from the cipher module in 45.0.0.<br>
&gt; * Moved TripleDES and ARC4 into Decrepit cryptography and deprecated t=
hem in<br>
&gt;=C2=A0 =C2=A0the cipher module. They will be removed from the cipher mo=
dule in 48.0.0.<br>
&gt; * Added support for deterministic ECDSA (RFC 6979)<br>
&gt; * Added support for client certificate verification to the X.509 path<=
br>
&gt;=C2=A0 =C2=A0validation APIs in the form of ClientVerifier, VerifiedCli=
ent, and<br>
&gt;=C2=A0 =C2=A0PolicyBuilder build_client_verifier().<br>
&gt; * Added Certificate public_key_algorithm_oid and Certificate Signing R=
equest<br>
&gt;=C2=A0 =C2=A0public_key_algorithm_oid to determine the PublicKeyAlgorit=
hmOID Object<br>
&gt;=C2=A0 =C2=A0Identifier of the public key found inside the certificate.=
<br>
&gt; * Added invalidity_date_utc, a timezone-aware alternative to the na=C3=
=AFve<br>
&gt;=C2=A0 =C2=A0datetime attribute invalidity_date.<br>
&gt; * Added support for parsing empty DN string in from_rfc4514_string().<=
br>
&gt; * Added the following properties that return timezone-aware datetime o=
bjects:<br>
&gt;=C2=A0 =C2=A0produced_at_utc(), revocation_time_utc(), this_update_utc(=
),<br>
&gt;=C2=A0 =C2=A0next_update_utc(), revocation_time_utc(), this_update_utc(=
),<br>
&gt;=C2=A0 =C2=A0next_update_utc(), These are timezone-aware variants of ex=
isting properties<br>
&gt;=C2=A0 =C2=A0that return na=C3=AFve datetime objects.<br>
&gt; * Added rsa_recover_private_exponent()<br>
&gt; * Added reset_nonce() for altering the nonce of a cipher context witho=
ut<br>
&gt;=C2=A0 =C2=A0initializing a new instance. See the docs for additional r=
estrictions.<br>
&gt; * NameAttribute now raises an exception when attempting to create a co=
mmon<br>
&gt;=C2=A0 =C2=A0name whose length is shorter or longer than RFC 5280 permi=
ts.<br>
&gt; * Added basic support for PKCS7 encryption (including SMIME) via<br>
&gt;=C2=A0 =C2=A0PKCS7EnvelopeBuilder.<br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/python3-cryptography-crates.inc=C2=A0 =C2=A0 | 130 ++=
+++++-----------<br>
&gt;=C2=A0 ...=3D&gt; <a href=3D"http://python3-cryptography-vectors_43.0.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography-vectors_43.0=
.0.bb</a>} |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 ...toml-remove-benchmark-disable-option.patch |=C2=A0 =C2=A08 +-=
<br>
&gt;=C2=A0 ....<a href=3D"http://0.8.bb" rel=3D"noreferrer" target=3D"_blan=
k">0.8.bb</a> =3D&gt; <a href=3D"http://python3-cryptography_43.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-cryptography_43.0.0.bb</a>} |=C2=
=A0 =C2=A04 +-<br>
&gt;=C2=A0 4 files changed, 57 insertions(+), 87 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python3-c=
ryptography-vectors_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-cryptography-vectors_42.0.8.bb</a> =3D&gt; <a href=3D"http://python3-crypt=
ography-vectors_43.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cry=
ptography-vectors_43.0.0.bb</a>} (91%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python3-c=
ryptography_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptog=
raphy_42.0.8.bb</a> =3D&gt; <a href=3D"http://python3-cryptography_43.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_43.0.0.bb</a>}=
 (91%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.=
inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
&gt; index dbeda05dc45..a0f606cb46e 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
&gt; +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc<br>
&gt; @@ -2,101 +2,71 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # from src/rust/Cargo.lock<br>
&gt;=C2=A0 SRC_URI +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1/0.15.5" rel=3D=
"noreferrer" target=3D"_blank">crates.io/asn1/0.15.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1_derive/0.15.5"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/asn1_derive/0.15.5</a> \<br=
>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.1.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/autocfg/1.1.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.21.7" rel=
=3D"noreferrer" target=3D"_blank">crates.io/base64/0.21.7</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.3.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.4.2" rel=
=3D"noreferrer" target=3D"_blank">crates.io/bitflags/2.4.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.0.83" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/cc/1.0.83</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1/0.16.2" rel=3D=
"noreferrer" target=3D"_blank">crates.io/asn1/0.16.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/asn1_derive/0.16.2"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/asn1_derive/0.16.2</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.3.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/autocfg/1.3.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base64/0.22.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/base64/0.22.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.6.0" rel=
=3D"noreferrer" target=3D"_blank">crates.io/bitflags/2.6.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.1.6" rel=3D"no=
referrer" target=3D"_blank">crates.io/cc/1.1.6</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/foreign-types/=
0.3.2" rel=3D"noreferrer" target=3D"_blank">crates.io/foreign-types/0.3.2</=
a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/foreign-types-=
shared/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/foreign-types-=
shared/0.1.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.4.1" rel=3D"=
noreferrer" target=3D"_blank">crates.io/heck/0.4.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/2.0.4" rel=3D=
"noreferrer" target=3D"_blank">crates.io/indoc/2.0.4</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.152" rel=
=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.152</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lock_api/0.4.11" re=
l=3D"noreferrer" target=3D"_blank">crates.io/lock_api/0.4.11</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.9.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/memoffset/0.9.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.5.0" rel=3D"=
noreferrer" target=3D"_blank">crates.io/heck/0.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc/2.0.5" rel=3D=
"noreferrer" target=3D"_blank">crates.io/indoc/2.0.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.155" rel=
=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.155</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.9.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/memoffset/0.9.1</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.19=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.19.0</a> \<b=
r>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.10.64" re=
l=3D"noreferrer" target=3D"_blank">crates.io/openssl/0.10.64</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.10.65" re=
l=3D"noreferrer" target=3D"_blank">crates.io/openssl/0.10.65</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-macros=
/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-macros/0.1.1=
</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sys/0.9.102=
" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-sys/0.9.102</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot/0.12.1"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot/0.12.1</a> \<br=
>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parking_lot_core/0.=
9.9" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot_core/0.9.9<=
/a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/3.0.3" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/pem/3.0.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.29" =
rel=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.29</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic/1.6=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic/1.6.0</a=
> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.78"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.78</a> \<br=
>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.20.3" rel=3D=
"noreferrer" target=3D"_blank">crates.io/pyo3/0.20.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0=
.20.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.2=
0.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.20.3" re=
l=3D"noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.20.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.20.3"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.20.3</a> \<br=
>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend=
/0.20.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend=
/0.20.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.35" rel=
=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.35</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox_syscall/0.4.1=
" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_syscall/0.4.1</a> \<=
br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.2.0" r=
el=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/1.2.0</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/self_cell/1.0.3" re=
l=3D"noreferrer" target=3D"_blank">crates.io/self_cell/1.0.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/smallvec/1.13.1" re=
l=3D"noreferrer" target=3D"_blank">crates.io/smallvec/1.13.1</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.48" rel=3D"=
noreferrer" target=3D"_blank">crates.io/syn/2.0.48</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.12=
.13" rel=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon/0.12.13<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sys/0.9.103=
" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-sys/0.9.103</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pem/3.0.4" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/pem/3.0.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.30" =
rel=3D"noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.30</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/portable-atomic/1.7=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/portable-atomic/1.7.0</a=
> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.86"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.86</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/0.22.2" rel=3D=
"noreferrer" target=3D"_blank">crates.io/pyo3/0.22.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-build-config/0=
.22.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-build-config/0.2=
2.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-ffi/0.22.2" re=
l=3D"noreferrer" target=3D"_blank">crates.io/pyo3-ffi/0.22.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros/0.22.2"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0.22.2</a> \<br=
>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-macros-backend=
/0.22.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros-backend=
/0.22.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.36" rel=
=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.36</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/self_cell/1.0.4" re=
l=3D"noreferrer" target=3D"_blank">crates.io/self_cell/1.0.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.71" rel=3D"=
noreferrer" target=3D"_blank">crates.io/syn/2.0.71</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/target-lexicon/0.12=
.15" rel=3D"noreferrer" target=3D"_blank">crates.io/target-lexicon/0.12.15<=
/a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/=
1.0.12" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.12=
</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unindent/0.2.3=
" rel=3D"noreferrer" target=3D"_blank">crates.io/unindent/0.2.3</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/vcpkg/0.2.15" =
rel=3D"noreferrer" target=3D"_blank">crates.io/vcpkg/0.2.15</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows-targets/0.4=
8.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows-targets/0.48.5<=
/a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_gnu=
llvm/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64=
_gnullvm/0.48.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_aarch64_msv=
c/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_aarch64_ms=
vc/0.48.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_gnu/0.=
48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_gnu/0.48.=
5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_i686_msvc/0=
.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_i686_msvc/0.4=
8.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnu/=
0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_gnu/0=
.48.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_gnul=
lvm/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_g=
nullvm/0.48.5</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/windows_x86_64_msvc=
/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates.io/windows_x86_64_msvc=
/0.48.5</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[asn1-0.15.5.sha256sum] =3D &quot;ae3ecbce89a22627b5e8e6e11d69=
715617138290289e385cde773b1fe50befdb&quot;<br>
&gt; -SRC_URI[asn1_derive-0.15.5.sha256sum] =3D &quot;861af988fac460ac69a09=
f41e6217a8fb9178797b76fcc9478444be6a59be19c&quot;<br>
&gt; -SRC_URI[autocfg-1.1.0.sha256sum] =3D &quot;d468802bab17cbc0cc575e9b05=
3f41e72aa36bfa6b7f55e3529ffa43161b97fa&quot;<br>
&gt; -SRC_URI[base64-0.21.7.sha256sum] =3D &quot;9d297deb1925b89f2ccc13d763=
5fa0714f12c87adce1c75356b39ca9b7178567&quot;<br>
&gt; -SRC_URI[bitflags-1.3.2.sha256sum] =3D &quot;bef38d45163c2f1dde094a7df=
d33ccf595c92905c8f8f4fdc18d06fb1037718a&quot;<br>
&gt; -SRC_URI[bitflags-2.4.2.sha256sum] =3D &quot;ed570934406eb16438a4e976b=
1b4500774099c13b8cb96eec99f620f05090ddf&quot;<br>
&gt; -SRC_URI[cc-1.0.83.sha256sum] =3D &quot;f1174fb0b6ec23863f8b971027804a=
42614e347eafb0a95bf0b12cdae21fc4d0&quot;<br>
&gt; +SRC_URI[asn1-0.16.2.sha256sum] =3D &quot;532ceda058281b62096b2add4ab0=
0ab3a453d30dee28b8890f62461a0109ebbd&quot;<br>
&gt; +SRC_URI[asn1_derive-0.16.2.sha256sum] =3D &quot;56e6076d38cc17cc22b0f=
65f31170a2ee1975e6b07f0012893aefd86ce19c987&quot;<br>
&gt; +SRC_URI[autocfg-1.3.0.sha256sum] =3D &quot;0c4b4d0bd25bd0b74681c0ad21=
497610ce1b7c91b1022cd21c80c6fbdd9476b0&quot;<br>
&gt; +SRC_URI[base64-0.22.1.sha256sum] =3D &quot;72b3254f16251a8381aa12e40e=
3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6&quot;<br>
&gt; +SRC_URI[bitflags-2.6.0.sha256sum] =3D &quot;b048fb63fd8b5923fc5aa7b34=
0d8e156aec7ec02f0c78fa8a6ddc2613f6f71de&quot;<br>
&gt; +SRC_URI[cc-1.1.6.sha256sum] =3D &quot;2aba8f4e9906c7ce3c73463f62a7f0c=
65183ada1a2d47e397cc8810827f9694f&quot;<br>
&gt;=C2=A0 SRC_URI[cfg-if-1.0.0.sha256sum] =3D &quot;baf1de4339761588bc0619=
e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd&quot;<br>
&gt;=C2=A0 SRC_URI[foreign-types-0.3.2.sha256sum] =3D &quot;f6f339eb8adc052=
cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1&quot;<br>
&gt;=C2=A0 SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D &quot;00b02284=
11908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b&quot;<br>
&gt; -SRC_URI[heck-0.4.1.sha256sum] =3D &quot;95505c38b4572b2d910cecb028156=
0f54b440a19336cbbcb27bf6ce6adc6f5a8&quot;<br>
&gt; -SRC_URI[indoc-2.0.4.sha256sum] =3D &quot;1e186cfbae8084e513daff4240b4=
797e342f988cecda4fb6c939150f96315fd8&quot;<br>
&gt; -SRC_URI[libc-0.2.152.sha256sum] =3D &quot;13e3bf6590cbc649f4d1a3eefc9=
d5d6eb746f5200ffb04e5e142700b8faa56e7&quot;<br>
&gt; -SRC_URI[lock_api-0.4.11.sha256sum] =3D &quot;3c168f8615b12bc01f9c17e2=
eb0cc07dcae1940121185446edc3744920e8ef45&quot;<br>
&gt; -SRC_URI[memoffset-0.9.0.sha256sum] =3D &quot;5a634b1c61a95585bd15607c=
6ab0c4e5b226e695ff2800ba0cdccddf208c406c&quot;<br>
&gt; +SRC_URI[heck-0.5.0.sha256sum] =3D &quot;2304e00983f87ffb38b55b444b5e3=
b60a884b5d30c0fca7d82fe33449bbe55ea&quot;<br>
&gt; +SRC_URI[indoc-2.0.5.sha256sum] =3D &quot;b248f5224d1d606005e02c97f5aa=
4e88eeb230488bcc03bc9ca4d7991399f2b5&quot;<br>
&gt; +SRC_URI[libc-0.2.155.sha256sum] =3D &quot;97b3888a4aecf77e811145cadf6=
eef5901f4782c53886191b2f693f24761847c&quot;<br>
&gt; +SRC_URI[memoffset-0.9.1.sha256sum] =3D &quot;488016bfae457b036d996092=
f6cb448677611ce4449e970ceaf42695203f218a&quot;<br>
&gt;=C2=A0 SRC_URI[once_cell-1.19.0.sha256sum] =3D &quot;3fdb12b2476b595f93=
58c5161aa467c2438859caa136dec86c26fdd2efe17b92&quot;<br>
&gt; -SRC_URI[openssl-0.10.64.sha256sum] =3D &quot;95a0481286a310808298130d=
22dd1fef0fa571e05a8f44ec801801e84b216b1f&quot;<br>
&gt; +SRC_URI[openssl-0.10.65.sha256sum] =3D &quot;c2823eb4c6453ed64055057e=
a8bd416eda38c71018723869dd043a3b1186115e&quot;<br>
&gt;=C2=A0 SRC_URI[openssl-macros-0.1.1.sha256sum] =3D &quot;a948666b637a0f=
465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c&quot;<br>
&gt; -SRC_URI[openssl-sys-0.9.102.sha256sum] =3D &quot;c597637d56fbc83893a3=
5eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2&quot;<br>
&gt; -SRC_URI[parking_lot-0.12.1.sha256sum] =3D &quot;3742b2c103b9f06bc9fff=
0a37ff4912935851bee6d36f3c02bcc755bcfec228f&quot;<br>
&gt; -SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D &quot;4c42a9226546d68ac=
dd9c0a280d17ce19bfe27a46bf68784e4066115788d008e&quot;<br>
&gt; -SRC_URI[pem-3.0.3.sha256sum] =3D &quot;1b8fcc794035347fb64beda2d3b462=
595dd2753e3f268d89c5aae77e8cf2c310&quot;<br>
&gt; -SRC_URI[pkg-config-0.3.29.sha256sum] =3D &quot;2900ede94e305130c13ddd=
391e0ab7cbaeb783945ae07a279c268cb05109c6cb&quot;<br>
&gt; -SRC_URI[portable-atomic-1.6.0.sha256sum] =3D &quot;7170ef9988bc169ba1=
6dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0&quot;<br>
&gt; -SRC_URI[proc-macro2-1.0.78.sha256sum] =3D &quot;e2422ad645d89c99f8f3e=
6b88a9fdeca7fabeac836b1002371c4367c8f984aae&quot;<br>
&gt; -SRC_URI[pyo3-0.20.3.sha256sum] =3D &quot;53bdbb96d49157e65d45cc287af5=
f32ffadd5f4761438b527b055fb0d4bb8233&quot;<br>
&gt; -SRC_URI[pyo3-build-config-0.20.3.sha256sum] =3D &quot;deaa5745de3f523=
1ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7&quot;<br>
&gt; -SRC_URI[pyo3-ffi-0.20.3.sha256sum] =3D &quot;62b42531d03e08d4ef1f6e85=
a2ed422eb678b8cd62b762e53891c05faf0d4afa&quot;<br>
&gt; -SRC_URI[pyo3-macros-0.20.3.sha256sum] =3D &quot;7305c720fa01b8055ec95=
e484a6eca7a83c841267f0dd5280f0c8b8551d2c158&quot;<br>
&gt; -SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] =3D &quot;7c7e9b68bb9c3=
149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185&quot;<br>
&gt; -SRC_URI[quote-1.0.35.sha256sum] =3D &quot;291ec9ab5efd934aaf503a6466c=
5d5251535d108ee747472c3977cc5acc868ef&quot;<br>
&gt; -SRC_URI[redox_syscall-0.4.1.sha256sum] =3D &quot;4722d768eff46b75989d=
d134e5c353f0d6296e5aaa3132e776cbdb56be7731aa&quot;<br>
&gt; -SRC_URI[scopeguard-1.2.0.sha256sum] =3D &quot;94143f37725109f92c262ed=
2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49&quot;<br>
&gt; -SRC_URI[self_cell-1.0.3.sha256sum] =3D &quot;58bf37232d3bb9a2c4e641ca=
2a11d83b5062066f88df7fed36c28772046d65ba&quot;<br>
&gt; -SRC_URI[smallvec-1.13.1.sha256sum] =3D &quot;e6ecd384b10a64542d77071b=
d64bd7b231f4ed5940fba55e98c3de13824cf3d7&quot;<br>
&gt; -SRC_URI[syn-2.0.48.sha256sum] =3D &quot;0f3531638e407dfc0814761abb7c0=
0a5b54992b849452a0646b7f65c9f770f3f&quot;<br>
&gt; -SRC_URI[target-lexicon-0.12.13.sha256sum] =3D &quot;69758bda2e78f098e=
4ccb393021a0963bb3442eac05f135c30f61b7370bbafae&quot;<br>
&gt; +SRC_URI[openssl-sys-0.9.103.sha256sum] =3D &quot;7f9e8deee91df40a943c=
71b917e5874b951d32a802526c85721ce3b776c929d6&quot;<br>
&gt; +SRC_URI[pem-3.0.4.sha256sum] =3D &quot;8e459365e590736a54c3fa561947c8=
4837534b8e9af6fc5bf781307e82658fae&quot;<br>
&gt; +SRC_URI[pkg-config-0.3.30.sha256sum] =3D &quot;d231b230927b5e4ad203db=
57bbcbee2802f6bce620b1e4a9024a07d94e2907ec&quot;<br>
&gt; +SRC_URI[portable-atomic-1.7.0.sha256sum] =3D &quot;da544ee218f0d287a9=
11e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265&quot;<br>
&gt; +SRC_URI[proc-macro2-1.0.86.sha256sum] =3D &quot;5e719e8df665df0d1c8fb=
fd238015744736151d4445ec0836b8e628aae103b77&quot;<br>
&gt; +SRC_URI[pyo3-0.22.2.sha256sum] =3D &quot;831e8e819a138c36e212f3af3fd9=
eeffed6bf1510a805af35b0edee5ffa59433&quot;<br>
&gt; +SRC_URI[pyo3-build-config-0.22.2.sha256sum] =3D &quot;1e8730e591b1449=
2a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8&quot;<br>
&gt; +SRC_URI[pyo3-ffi-0.22.2.sha256sum] =3D &quot;5e97e919d2df92eb88ca80a0=
37969f44e5e70356559654962cbb3316d00300c6&quot;<br>
&gt; +SRC_URI[pyo3-macros-0.22.2.sha256sum] =3D &quot;eb57983022ad41f9e683a=
599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206&quot;<br>
&gt; +SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] =3D &quot;ec480c0c51dde=
c81019531705acac51bcdbeae563557c982aa8263bb96880372&quot;<br>
&gt; +SRC_URI[quote-1.0.36.sha256sum] =3D &quot;0fa76aaf39101c457836aec0ce2=
316dbdc3ab723cdda1c6bd4e6ad4208acaca7&quot;<br>
&gt; +SRC_URI[self_cell-1.0.4.sha256sum] =3D &quot;d369a96f978623eb3dc28807=
c4852d6cc617fed53da5d3c400feff1ef34a714a&quot;<br>
&gt; +SRC_URI[syn-2.0.71.sha256sum] =3D &quot;b146dcf730474b4bcd16c311627b3=
1ede9ab149045db4d6088b3becaea046462&quot;<br>
&gt; +SRC_URI[target-lexicon-0.12.15.sha256sum] =3D &quot;4873307b7c257eddc=
b50c9bedf158eb669578359fb28428bef438fec8e6ba7c2&quot;<br>
&gt;=C2=A0 SRC_URI[unicode-ident-1.0.12.sha256sum] =3D &quot;3354b9ac3fae1f=
f6755cb6db53683adb661634f67557942dea4facebec0fee4b&quot;<br>
&gt;=C2=A0 SRC_URI[unindent-0.2.3.sha256sum] =3D &quot;c7de7d73e1754487cb58=
364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce&quot;<br>
&gt;=C2=A0 SRC_URI[vcpkg-0.2.15.sha256sum] =3D &quot;accd4ea62f7bb7a82fe230=
66fb0957d48ef677f6eeb8215f372f52e48bb32426&quot;<br>
&gt; -SRC_URI[windows-targets-0.48.5.sha256sum] =3D &quot;9a2fa6e2155d7247b=
e68c096456083145c183cbbbc2764150dda45a87197940c&quot;<br>
&gt; -SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D &quot;2b38e32f0=
abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8&quot;<br>
&gt; -SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D &quot;dc35310971f3=
b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc&quot;<br>
&gt; -SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D &quot;a75915e7def60c94=
dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e&quot;<br>
&gt; -SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D &quot;8f55c233f70c4b2=
7f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406&quot;<br>
&gt; -SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D &quot;53d40abd2583d2=
3e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e&quot;<br>
&gt; -SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D &quot;0b7b527678=
68a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc&quot;<br>
&gt; -SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D &quot;ed94fce61571a=
4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cr=
yptography-vectors_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
cryptography-vectors_42.0.8.bb</a> b/meta/recipes-devtools/python/<a href=
=3D"http://python3-cryptography-vectors_43.0.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-cryptography-vectors_43.0.0.bb</a><br>
&gt; similarity index 91%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python3-cry=
ptography-vectors_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-c=
ryptography-vectors_42.0.8.bb</a><br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python3-crypt=
ography-vectors_43.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cry=
ptography-vectors_43.0.0.bb</a><br>
&gt; index 1256e75c474..1f766140748 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptogra=
phy-vectors_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptog=
raphy-vectors_42.0.8.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptogra=
phy-vectors_43.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptog=
raphy-vectors_43.0.0.bb</a><br>
&gt; @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c3617=
db4fb6fae01f1d253ab91511e4 \<br>
&gt;=C2=A0 # NOTE: Make sure to keep this recipe at the same version as pyt=
hon3-cryptography<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0Upgrade both recipes at the same tim=
e<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[sha256sum] =3D &quot;df5657367bc0a90c374309cb261009a2c53cae91=
a458781339a0f724f819a46a&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;5c9d09a732d5433cede1542a96ecd70a80e122af=
047ee7404bcdf1f3ccb8e702&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PYPI_PACKAGE =3D &quot;cryptography_vectors&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-py=
project.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/=
python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-op=
tion.patch<br>
&gt; index 3eed171ffee..b0c5098961d 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject=
.toml-remove-benchmark-disable-option.patch<br>
&gt; +++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject=
.toml-remove-benchmark-disable-option.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From e4d7856fe842f3df7c614554d006d81253a5edf2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 82e71e7122d9131ffcd786a0bffeaf846967a37e Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" t=
arget=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 17 May 2022 17:22:48 +0800<br>
&gt;=C2=A0 Subject: [PATCH] pyproject.toml: remove --benchmark-disable opti=
on<br>
&gt; @@ -26,11 +26,11 @@ Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ti=
m.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br=
>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/pyproject.toml b/pyproject.toml<br>
&gt; -index d2e304f..10aabcf 100644<br>
&gt; +index 5f1bcc7..ba02540 100644<br>
&gt;=C2=A0 --- a/pyproject.toml<br>
&gt;=C2=A0 +++ b/pyproject.toml<br>
&gt; -@@ -92,7 +92,7 @@ rust-version =3D &quot;&gt;=3D1.63.0&quot;<br>
&gt; - <br>
&gt; +@@ -117,7 +117,7 @@ exclude =3D [<br>
&gt; + ]<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0[tool.pytest.ini_options]<br>
&gt;=C2=A0 -addopts =3D &quot;-r s --capture=3Dno --strict-markers --benchm=
ark-disable&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cr=
yptography_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogr=
aphy_42.0.8.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3=
-cryptography_43.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-crypt=
ography_43.0.0.bb</a><br>
&gt; similarity index 91%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python3-cry=
ptography_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptogra=
phy_42.0.8.bb</a><br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python3-crypt=
ography_43.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptograph=
y_43.0.0.bb</a><br>
&gt; index 3f70f910d4d..778471b4ff5 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptogra=
phy_42.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_42=
.0.8.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptogra=
phy_43.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_43=
.0.0.bb</a><br>
&gt; @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D8c3617=
db4fb6fae01f1d253ab91511e4 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;<br>
&gt;=C2=A0 LDSHARED +=3D &quot;-pthread&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[sha256sum] =3D &quot;8d09d05439ce7baa8e9e95b07ec5b6c886f548de=
b7e0f69ef25f64b3bce842f2&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;b88075ada2d51aa9f18283532c9f60e72170041b=
ba88d7f37e49cbb10275299e&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI +=3D &quot;file://0001-pyproject.toml-remove-benchmark-d=
isable-option.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://check-memfree.p=
y \<br>
&gt; @@ -17,7 +17,7 @@ SRC_URI +=3D &quot;file://0001-pyproject.toml-remove=
-benchmark-disable-option.patch \<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 require ${BPN}-crates.inc<br>
&gt;=C2=A0 <br>
&gt; -inherit pypi python_setuptools3_rust cargo-update-recipe-crates pkgco=
nfig<br>
&gt; +inherit pypi python_maturin cargo-update-recipe-crates pkgconfig<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEPENDS +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 python3-cffi-native \<br>
&gt; -- <br>
&gt; 2.46.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#203242): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/203242" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/203242</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10787027=
2/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107870272/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000f26b5d061fad3b33--

