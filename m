Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D14CC4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 21:07:44 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.25657.1706994461955223763
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 13:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qb9wJq9K;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-219108b8e9cso1253939fac.2
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 13:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706994461; x=1707599261; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMk+sqrqlVFbmKPg8UOMSm8gqLFaWIu2ZtDbSSAq1eo=;
        b=Qb9wJq9KlRx0kDoe00Wif8rayWh32LlSCKzjIPRsI5qK8Vgcr5ogHFwk9SFoVc46hu
         CCs8R89OagTDTlsouzvGMBIxOlyfNaw9xp1EEn8jpC09doZGJ9584Jfn/zyHOE62BQ9V
         lE6A95dJtBy501B1MxKlLH75wSnzhiHHyY1mzaxpXNnXo/GQiHbRx2QyUkv4UDP8loBj
         WAmFVO0pQ61F4BkYv74jJ1IEbCHJDZslOzrWufBLdapTvsUuwDiaunqBJwLYDOi3+Y+g
         YELUTFH2W4JT8P/KCkqq5bJU8jhw7d+wZAXSFjcTysNC8yfUDkTecQCsduqMTyKX+x7r
         oLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706994461; x=1707599261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMk+sqrqlVFbmKPg8UOMSm8gqLFaWIu2ZtDbSSAq1eo=;
        b=JcqpnKqusFOkUpUV9RoHqs94m5B2XaDqiu5H7hKlnLbGIZ3Yifv9mXIdDhswucvlBY
         FaFYf5LU01yHtvWpCW96omSYhZCgTk3nCW/PMk7FOBn3pegptxb5hSO6p2VdodYvQcAG
         5Bq0qEx6jZwi8wa4LxK+frUPxQNrK6P9E6+KUaP6mPn5lDG4o2O6sH6Nuk6UNZUznggq
         73XnmclnEPCHGcPAXECTWhTaecK5k7rIoQGkWAyKAdRzrabLEm454ZNnSLFsAWalNx1g
         +5nV5U4xuLLwnoKHdTqoiXj21DO/MhavEhW1hO9yzOpeYhGXup1FzzN2eMfOYxa/WSxA
         /2Pg==
X-Gm-Message-State: AOJu0YynQuZ7BPs0ohUXXhipVagn0DMLNlcSZSRleMS97A/sWvmK4+Bu
	Hqkh1EnL2VULsv9g22GfOXSxrTQZj5wIHaHnm0+/e9JB8ZC9TRrcBqkuVTD8lG2g2S38ANW0jL2
	g3ZokgNzpzXgamW7r/ogVnjGzBcw=
X-Google-Smtp-Source: AGHT+IGRCobLtRy5nofquPbtjiLwFWtmWnYpvzAcs8lZ48pBlgW2ChzHJQJ2mSmJs7Am6gR6hAcvuT4p3YAmB+uz0k4=
X-Received: by 2002:a05:6870:b48a:b0:210:9e85:edc3 with SMTP id
 y10-20020a056870b48a00b002109e85edc3mr4485191oap.18.1706994460933; Sat, 03
 Feb 2024 13:07:40 -0800 (PST)
MIME-Version: 1.0
References: <20240202045933.3427847-1-tim.orling@konsulko.com>
In-Reply-To: <20240202045933.3427847-1-tim.orling@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Feb 2024 13:07:14 -0800
Message-ID: <CAMKF1srGgwi-SHJq3vsOXCJPn_qBSZBidCdTM0VTJNVWsgNsSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: upgrade 41.0.7 to 42.0.2
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 21:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194860

This is failing ptests on musl/qemux86-64

    Failed ptests:
    {'python3-cryptography': 'START: ptest-runner\n'
                             '2024-02-03T18:58\n'
                             'Free memory: 3.899 GB\n'

'=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n'
                             'Testsuite summary\n'
                             '# TOTAL: 0\n'
                             '# PASS: 0\n'
                             '# SKIP: 0\n'
                             '# XFAIL: 0\n'
                             '# FAIL: 0\n'
                             '# XPASS: 0\n'
                             '# ERROR: 0\n'
                             '\n'
                             'ERROR: Exit status is 2\n'
                             'DURATION: 6\n'}

    ptests which had no test results:
    ['python3-cryptography']


On Thu, Feb 1, 2024 at 9:03=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wrot=
e:
>
> * Also upgrade python3-cryptography-vectors
> * Drop patch for 9129, fixed upstream
> * Refresh pyproject.toml --benchmark-disable patch
> * Refresh -crates.inc
>
> Changes:
> https://cryptography.io/en/latest/changelog/#v42-0-2
> https://cryptography.io/en/latest/changelog/#v42-0-1
> https://cryptography.io/en/latest/changelog/#v42-0-0
> https://github.com/pyca/cryptography/compare/41.0.7...42.0.2
>
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> All ptests pass for core-image-ptest-python3-cryptography on qemux86-64
> with runqemu nographic kvm qemuparams=3D"-smp 4 -m 8192"
> (one test failed with standard memory allocation)
>
>  .../python/python3-cryptography-crates.inc    | 170 ++++++++----------
>  ...=3D> python3-cryptography-vectors_42.0.2.bb} |   2 +-
>  ...-directory-when-cross-compiling-9129.patch |  52 ------
>  ...toml-remove-benchmark-disable-option.patch |  22 ++-
>  ....0.7.bb =3D> python3-cryptography_42.0.2.bb} |   3 +-
>  5 files changed, 90 insertions(+), 159 deletions(-)
>  rename meta/recipes-devtools/python/{python3-cryptography-vectors_41.0.7=
.bb =3D> python3-cryptography-vectors_42.0.2.bb} (91%)
>  delete mode 100644 meta/recipes-devtools/python/python3-cryptography/000=
1-Fix-include-directory-when-cross-compiling-9129.patch
>  rename meta/recipes-devtools/python/{python3-cryptography_41.0.7.bb =3D>=
 python3-cryptography_42.0.2.bb} (92%)
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc=
 b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> index 3a5edaa3494..4714c76bd2b 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
> +++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
> @@ -2,113 +2,99 @@
>
>  # from src/rust/Cargo.lock
>  SRC_URI +=3D " \
> -    crate://crates.io/Inflector/0.11.4 \
> -    crate://crates.io/aliasable/0.1.3 \
> -    crate://crates.io/asn1/0.15.2 \
> -    crate://crates.io/asn1_derive/0.15.2 \
> +    crate://crates.io/asn1/0.15.5 \
> +    crate://crates.io/asn1_derive/0.15.5 \
>      crate://crates.io/autocfg/1.1.0 \
> -    crate://crates.io/base64/0.13.1 \
> +    crate://crates.io/base64/0.21.7 \
>      crate://crates.io/bitflags/1.3.2 \
> -    crate://crates.io/bitflags/2.4.1 \
> -    crate://crates.io/cc/1.0.79 \
> +    crate://crates.io/bitflags/2.4.2 \
> +    crate://crates.io/cc/1.0.83 \
>      crate://crates.io/cfg-if/1.0.0 \
>      crate://crates.io/foreign-types/0.3.2 \
>      crate://crates.io/foreign-types-shared/0.1.1 \
> -    crate://crates.io/indoc/1.0.9 \
> -    crate://crates.io/libc/0.2.144 \
> -    crate://crates.io/lock_api/0.4.9 \
> -    crate://crates.io/memoffset/0.8.0 \
> -    crate://crates.io/once_cell/1.17.2 \
> -    crate://crates.io/openssl/0.10.60 \
> +    crate://crates.io/heck/0.4.1 \
> +    crate://crates.io/indoc/2.0.4 \
> +    crate://crates.io/libc/0.2.152 \
> +    crate://crates.io/lock_api/0.4.11 \
> +    crate://crates.io/memoffset/0.9.0 \
> +    crate://crates.io/once_cell/1.19.0 \
> +    crate://crates.io/openssl/0.10.63 \
>      crate://crates.io/openssl-macros/0.1.1 \
> -    crate://crates.io/openssl-sys/0.9.96 \
> -    crate://crates.io/ouroboros/0.15.6 \
> -    crate://crates.io/ouroboros_macro/0.15.6 \
> +    crate://crates.io/openssl-sys/0.9.99 \
>      crate://crates.io/parking_lot/0.12.1 \
> -    crate://crates.io/parking_lot_core/0.9.7 \
> -    crate://crates.io/pem/1.1.1 \
> -    crate://crates.io/pkg-config/0.3.27 \
> -    crate://crates.io/proc-macro-error/1.0.4 \
> -    crate://crates.io/proc-macro-error-attr/1.0.4 \
> -    crate://crates.io/proc-macro2/1.0.64 \
> -    crate://crates.io/pyo3/0.18.3 \
> -    crate://crates.io/pyo3-build-config/0.18.3 \
> -    crate://crates.io/pyo3-ffi/0.18.3 \
> -    crate://crates.io/pyo3-macros/0.18.3 \
> -    crate://crates.io/pyo3-macros-backend/0.18.3 \
> -    crate://crates.io/quote/1.0.28 \
> -    crate://crates.io/redox_syscall/0.2.16 \
> -    crate://crates.io/scopeguard/1.1.0 \
> -    crate://crates.io/smallvec/1.10.0 \
> -    crate://crates.io/syn/1.0.109 \
> -    crate://crates.io/syn/2.0.18 \
> -    crate://crates.io/target-lexicon/0.12.7 \
> -    crate://crates.io/unicode-ident/1.0.9 \
> -    crate://crates.io/unindent/0.1.11 \
> +    crate://crates.io/parking_lot_core/0.9.9 \
> +    crate://crates.io/pem/3.0.3 \
> +    crate://crates.io/pkg-config/0.3.29 \
> +    crate://crates.io/proc-macro2/1.0.78 \
> +    crate://crates.io/pyo3/0.20.2 \
> +    crate://crates.io/pyo3-build-config/0.20.2 \
> +    crate://crates.io/pyo3-ffi/0.20.2 \
> +    crate://crates.io/pyo3-macros/0.20.2 \
> +    crate://crates.io/pyo3-macros-backend/0.20.2 \
> +    crate://crates.io/quote/1.0.35 \
> +    crate://crates.io/redox_syscall/0.4.1 \
> +    crate://crates.io/scopeguard/1.2.0 \
> +    crate://crates.io/self_cell/1.0.3 \
> +    crate://crates.io/smallvec/1.13.1 \
> +    crate://crates.io/syn/2.0.48 \
> +    crate://crates.io/target-lexicon/0.12.13 \
> +    crate://crates.io/unicode-ident/1.0.12 \
> +    crate://crates.io/unindent/0.2.3 \
>      crate://crates.io/vcpkg/0.2.15 \
> -    crate://crates.io/version_check/0.9.4 \
> -    crate://crates.io/windows-sys/0.45.0 \
> -    crate://crates.io/windows-targets/0.42.2 \
> -    crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
> -    crate://crates.io/windows_aarch64_msvc/0.42.2 \
> -    crate://crates.io/windows_i686_gnu/0.42.2 \
> -    crate://crates.io/windows_i686_msvc/0.42.2 \
> -    crate://crates.io/windows_x86_64_gnu/0.42.2 \
> -    crate://crates.io/windows_x86_64_gnullvm/0.42.2 \
> -    crate://crates.io/windows_x86_64_msvc/0.42.2 \
> +    crate://crates.io/windows-targets/0.48.5 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
> +    crate://crates.io/windows_aarch64_msvc/0.48.5 \
> +    crate://crates.io/windows_i686_gnu/0.48.5 \
> +    crate://crates.io/windows_i686_msvc/0.48.5 \
> +    crate://crates.io/windows_x86_64_gnu/0.48.5 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
> +    crate://crates.io/windows_x86_64_msvc/0.48.5 \
>  "
>
> -SRC_URI[Inflector-0.11.4.sha256sum] =3D "fe438c63458706e03479442743baae6=
c88256498e6431708f6dfc520a26515d3"
> -SRC_URI[aliasable-0.1.3.sha256sum] =3D "250f629c0161ad8107cf89319e990051=
fae62832fd343083bea452d93e2205fd"
> -SRC_URI[asn1-0.15.2.sha256sum] =3D "28c19b9324de5b815b6487e0f8098312791b=
09de0dbf3d5c2db1fe2d95bab973"
> -SRC_URI[asn1_derive-0.15.2.sha256sum] =3D "a045c3ccad89f244a86bd1e6cf1a7=
bf645296e7692698b056399b6efd4639407"
> +SRC_URI[asn1-0.15.5.sha256sum] =3D "ae3ecbce89a22627b5e8e6e11d6971561713=
8290289e385cde773b1fe50befdb"
> +SRC_URI[asn1_derive-0.15.5.sha256sum] =3D "861af988fac460ac69a09f41e6217=
a8fb9178797b76fcc9478444be6a59be19c"
>  SRC_URI[autocfg-1.1.0.sha256sum] =3D "d468802bab17cbc0cc575e9b053f41e72a=
a36bfa6b7f55e3529ffa43161b97fa"
> -SRC_URI[base64-0.13.1.sha256sum] =3D "9e1b586273c5702936fe7b7d6896644d8b=
e71e6314cfe09d3167c95f712589e8"
> +SRC_URI[base64-0.21.7.sha256sum] =3D "9d297deb1925b89f2ccc13d7635fa0714f=
12c87adce1c75356b39ca9b7178567"
>  SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
> -SRC_URI[bitflags-2.4.1.sha256sum] =3D "327762f6e5a765692301e5bb513e0d9fe=
f63be86bbc14528052b1cd3e6f03e07"
> -SRC_URI[cc-1.0.79.sha256sum] =3D "50d30906286121d95be3d479533b458f87493b=
30a4b5f79a607db8f5d11aa91f"
> +SRC_URI[bitflags-2.4.2.sha256sum] =3D "ed570934406eb16438a4e976b1b450077=
4099c13b8cb96eec99f620f05090ddf"
> +SRC_URI[cc-1.0.83.sha256sum] =3D "f1174fb0b6ec23863f8b971027804a42614e34=
7eafb0a95bf0b12cdae21fc4d0"
>  SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
>  SRC_URI[foreign-types-0.3.2.sha256sum] =3D "f6f339eb8adc052cd2ca78910fda=
869aefa38d22d5cb648e6485e4d3fc06f3b1"
>  SRC_URI[foreign-types-shared-0.1.1.sha256sum] =3D "00b0228411908ca8685db=
a7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
> -SRC_URI[indoc-1.0.9.sha256sum] =3D "bfa799dd5ed20a7e349f3b4639aa80d74549=
c81716d9ec4f994c9b5815598306"
> -SRC_URI[libc-0.2.144.sha256sum] =3D "2b00cc1c228a6782d0f076e7b232802e0c5=
689d41bb5df366f2a6b6621cfdfe1"
> -SRC_URI[lock_api-0.4.9.sha256sum] =3D "435011366fe56583b16cf956f9df0095b=
405b82d76425bc8981c0e22e60ec4df"
> -SRC_URI[memoffset-0.8.0.sha256sum] =3D "d61c719bcfbcf5d62b3a09efa6088de8=
c54bc0bfcd3ea7ae39fcc186108b8de1"
> -SRC_URI[once_cell-1.17.2.sha256sum] =3D "9670a07f94779e00908f3e686eab508=
878ebb390ba6e604d3a284c00e8d0487b"
> -SRC_URI[openssl-0.10.60.sha256sum] =3D "79a4c6c3a2b158f7f8f2a2fc5a969fa3=
a068df6fc9dbb4a43845436e3af7c800"
> +SRC_URI[heck-0.4.1.sha256sum] =3D "95505c38b4572b2d910cecb0281560f54b440=
a19336cbbcb27bf6ce6adc6f5a8"
> +SRC_URI[indoc-2.0.4.sha256sum] =3D "1e186cfbae8084e513daff4240b4797e342f=
988cecda4fb6c939150f96315fd8"
> +SRC_URI[libc-0.2.152.sha256sum] =3D "13e3bf6590cbc649f4d1a3eefc9d5d6eb74=
6f5200ffb04e5e142700b8faa56e7"
> +SRC_URI[lock_api-0.4.11.sha256sum] =3D "3c168f8615b12bc01f9c17e2eb0cc07d=
cae1940121185446edc3744920e8ef45"
> +SRC_URI[memoffset-0.9.0.sha256sum] =3D "5a634b1c61a95585bd15607c6ab0c4e5=
b226e695ff2800ba0cdccddf208c406c"
> +SRC_URI[once_cell-1.19.0.sha256sum] =3D "3fdb12b2476b595f9358c5161aa467c=
2438859caa136dec86c26fdd2efe17b92"
> +SRC_URI[openssl-0.10.63.sha256sum] =3D "15c9d69dd87a29568d4d017cfe8ec518=
706046a05184e5aea92d0af890b803c8"
>  SRC_URI[openssl-macros-0.1.1.sha256sum] =3D "a948666b637a0f465e8564c73e8=
9d4dde00d72d4d473cc972f390fc3dcee7d9c"
> -SRC_URI[openssl-sys-0.9.96.sha256sum] =3D "3812c071ba60da8b5677cc12bcb1d=
42989a65553772897a7e0355545a819838f"
> -SRC_URI[ouroboros-0.15.6.sha256sum] =3D "e1358bd1558bd2a083fed428ffeda48=
6fbfb323e698cdda7794259d592ca72db"
> -SRC_URI[ouroboros_macro-0.15.6.sha256sum] =3D "5f7d21ccd03305a674437ee12=
48f3ab5d4b1db095cf1caf49f1713ddf61956b7"
> +SRC_URI[openssl-sys-0.9.99.sha256sum] =3D "22e1bf214306098e4832460f79782=
4c05d25aacdf896f64a985fb0fd992454ae"
>  SRC_URI[parking_lot-0.12.1.sha256sum] =3D "3742b2c103b9f06bc9fff0a37ff49=
12935851bee6d36f3c02bcc755bcfec228f"
> -SRC_URI[parking_lot_core-0.9.7.sha256sum] =3D "9069cbb9f99e3a5083476ccb2=
9ceb1de18b9118cafa53e90c9551235de2b9521"
> -SRC_URI[pem-1.1.1.sha256sum] =3D "a8835c273a76a90455d7344889b0964598e331=
6e2a79ede8e36f16bdcf2228b8"
> -SRC_URI[pkg-config-0.3.27.sha256sum] =3D "26072860ba924cbfa98ea39c8c19b4=
dd6a4a25423dbdf219c1eca91aa0cf6964"
> -SRC_URI[proc-macro-error-1.0.4.sha256sum] =3D "da25490ff9892aab3fcf7c36f=
08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
> -SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] =3D "a1be40180e52ecc98ad8=
0b184934baf3d0d29f979574e439af5a55274b35f869"
> -SRC_URI[proc-macro2-1.0.64.sha256sum] =3D "78803b62cbf1f46fde80d7c0e8031=
11524b9877184cfe7c3033659490ac7a7da"
> -SRC_URI[pyo3-0.18.3.sha256sum] =3D "e3b1ac5b3731ba34fdaa9785f8d74d17448c=
d18f30cf19e0c7e7b1fdb5272109"
> -SRC_URI[pyo3-build-config-0.18.3.sha256sum] =3D "9cb946f5ac61bb61a501492=
4910d936ebd2b23b705f7a4a3c40b05c720b079a3"
> -SRC_URI[pyo3-ffi-0.18.3.sha256sum] =3D "fd4d7c5337821916ea2a1d21d1092e84=
43cf34879e53a0ac653fbb98f44ff65c"
> -SRC_URI[pyo3-macros-0.18.3.sha256sum] =3D "a9d39c55dab3fc5a4b25bbd1ac10a=
2da452c4aca13bb450f22818a002e29648d"
> -SRC_URI[pyo3-macros-backend-0.18.3.sha256sum] =3D "97daff08a4c48320587b5=
224cc98d609e3c27b6d437315bd40b605c98eeb5918"
> -SRC_URI[quote-1.0.28.sha256sum] =3D "1b9ab9c7eadfd8df19006f1cf1a4aed1354=
0ed5cbc047010ece5826e10825488"
> -SRC_URI[redox_syscall-0.2.16.sha256sum] =3D "fb5a58c1855b4b6819d59012155=
603f0b22ad30cad752600aadfcb695265519a"
> -SRC_URI[scopeguard-1.1.0.sha256sum] =3D "d29ab0c6d3fc0ee92fe66e2d99f700e=
ab17a8d57d1c1d3b748380fb20baa78cd"
> -SRC_URI[smallvec-1.10.0.sha256sum] =3D "a507befe795404456341dfab10cef66e=
ad4c041f62b8b11bbb92bffe5d0953e0"
> -SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3baf=
a67b529ead792a6d0160888b4237"
> -SRC_URI[syn-2.0.18.sha256sum] =3D "32d41677bcbe24c20c52e7c70b0d8db04134c=
5d1066bf98662e2871ad200ea3e"
> -SRC_URI[target-lexicon-0.12.7.sha256sum] =3D "fd1ba337640d60c3e96bc6f063=
8a939b9c9a7f2c316a1598c279828b3d1dc8c5"
> -SRC_URI[unicode-ident-1.0.9.sha256sum] =3D "b15811caf2415fb889178633e772=
4bad2509101cde276048e013b9def5e51fa0"
> -SRC_URI[unindent-0.1.11.sha256sum] =3D "e1766d682d402817b5ac4490b3c3002d=
91dfa0d22812f341609f97b08757359c"
> +SRC_URI[parking_lot_core-0.9.9.sha256sum] =3D "4c42a9226546d68acdd9c0a28=
0d17ce19bfe27a46bf68784e4066115788d008e"
> +SRC_URI[pem-3.0.3.sha256sum] =3D "1b8fcc794035347fb64beda2d3b462595dd275=
3e3f268d89c5aae77e8cf2c310"
> +SRC_URI[pkg-config-0.3.29.sha256sum] =3D "2900ede94e305130c13ddd391e0ab7=
cbaeb783945ae07a279c268cb05109c6cb"
> +SRC_URI[proc-macro2-1.0.78.sha256sum] =3D "e2422ad645d89c99f8f3e6b88a9fd=
eca7fabeac836b1002371c4367c8f984aae"
> +SRC_URI[pyo3-0.20.2.sha256sum] =3D "9a89dc7a5850d0e983be1ec2a463a171d209=
90487c3cfcd68b5363f1ee3d6fe0"
> +SRC_URI[pyo3-build-config-0.20.2.sha256sum] =3D "07426f0d8fe5a601f26293f=
300afd1a7b1ed5e78b2a705870c5f30893c5163be"
> +SRC_URI[pyo3-ffi-0.20.2.sha256sum] =3D "dbb7dec17e17766b46bca4f1a4215a85=
006b4c2ecde122076c562dd058da6cf1"
> +SRC_URI[pyo3-macros-0.20.2.sha256sum] =3D "05f738b4e40d50b5711957f142878=
cfa0f28e054aa0ebdfc3fd137a843f74ed3"
> +SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] =3D "0fc910d4851847827daf9=
d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
> +SRC_URI[quote-1.0.35.sha256sum] =3D "291ec9ab5efd934aaf503a6466c5d525153=
5d108ee747472c3977cc5acc868ef"
> +SRC_URI[redox_syscall-0.4.1.sha256sum] =3D "4722d768eff46b75989dd134e5c3=
53f0d6296e5aaa3132e776cbdb56be7731aa"
> +SRC_URI[scopeguard-1.2.0.sha256sum] =3D "94143f37725109f92c262ed2cf5e59b=
ce7498c01bcc1502d7b9afe439a4e9f49"
> +SRC_URI[self_cell-1.0.3.sha256sum] =3D "58bf37232d3bb9a2c4e641ca2a11d83b=
5062066f88df7fed36c28772046d65ba"
> +SRC_URI[smallvec-1.13.1.sha256sum] =3D "e6ecd384b10a64542d77071bd64bd7b2=
31f4ed5940fba55e98c3de13824cf3d7"
> +SRC_URI[syn-2.0.48.sha256sum] =3D "0f3531638e407dfc0814761abb7c00a5b5499=
2b849452a0646b7f65c9f770f3f"
> +SRC_URI[target-lexicon-0.12.13.sha256sum] =3D "69758bda2e78f098e4ccb3930=
21a0963bb3442eac05f135c30f61b7370bbafae"
> +SRC_URI[unicode-ident-1.0.12.sha256sum] =3D "3354b9ac3fae1ff6755cb6db536=
83adb661634f67557942dea4facebec0fee4b"
> +SRC_URI[unindent-0.2.3.sha256sum] =3D "c7de7d73e1754487cb58364ee906a4999=
37a0dfabd86bcb980fa99ec8c8fa2ce"
>  SRC_URI[vcpkg-0.2.15.sha256sum] =3D "accd4ea62f7bb7a82fe23066fb0957d48ef=
677f6eeb8215f372f52e48bb32426"
> -SRC_URI[version_check-0.9.4.sha256sum] =3D "49874b5167b65d7193b8aba1567f=
5c7d93d001cafc34600cee003eda787e483f"
> -SRC_URI[windows-sys-0.45.0.sha256sum] =3D "75283be5efb2831d37ea142365f00=
9c02ec203cd29a3ebecbc093d52315b66d0"
> -SRC_URI[windows-targets-0.42.2.sha256sum] =3D "8e5180c00cd44c9b1c88adb36=
93291f1cd93605ded80c250a75d472756b4d071"
> -SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] =3D "597a5118570b68bc0=
8d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
> -SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] =3D "e08e8864a60f06ef0d0f=
f4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
> -SRC_URI[windows_i686_gnu-0.42.2.sha256sum] =3D "c61d927d8da41da96a81f029=
489353e68739737d3beca43145c8afec9a31a84f"
> -SRC_URI[windows_i686_msvc-0.42.2.sha256sum] =3D "44d840b6ec649f480a41c8d=
80f9c65108b92d89345dd94027bfe06ac444d1060"
> -SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] =3D "8de912b8b8feb55c064867=
cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
> -SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] =3D "26d41b46a36d453748=
aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
> -SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] =3D "9aec5da331524158c6d1a=
4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
> +SRC_URI[windows-targets-0.48.5.sha256sum] =3D "9a2fa6e2155d7247be68c0964=
56083145c183cbbbc2764150dda45a87197940c"
> +SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D "2b38e32f0abccf998=
7a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
> +SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D "dc35310971f3b2dbbf3f=
0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
> +SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D "a75915e7def60c94dcef7220=
0b9a8e58e5091744960da64ec734a6c6e9b3743e"
> +SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D "8f55c233f70c4b27f66c523=
580f78f1004e8b5a8b659e05a4eb49d4166cca406"
> +SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D "53d40abd2583d23e4718fd=
df1ebec84dbff8381c07cae67ff7768bbf19c6718e"
> +SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D "0b7b52767868a23d5b=
ab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
> +SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D "ed94fce61571a4006852b=
7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
> diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_41=
.0.7.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.=
bb
> similarity index 91%
> rename from meta/recipes-devtools/python/python3-cryptography-vectors_41.=
0.7.bb
> rename to meta/recipes-devtools/python/python3-cryptography-vectors_42.0.=
2.bb
> index eda492d312a..46778e426f5 100644
> --- a/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.2.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c3617db4fb6fa=
e01f1d253ab91511e4 \
>  # NOTE: Make sure to keep this recipe at the same version as python3-cry=
ptography
>  #       Upgrade both recipes at the same time
>
> -SRC_URI[sha256sum] =3D "7b36f976b6e58cc1801310e1c93c584c6539d371da7f8538=
edd8fc463dc80d5b"
> +SRC_URI[sha256sum] =3D "adcdccf5d9ee661a9602ad21d2525f678ba07a6e768ce798=
35994e208bab0e16"
>
>  PYPI_PACKAGE =3D "cryptography_vectors"
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-Fix-i=
nclude-directory-when-cross-compiling-9129.patch b/meta/recipes-devtools/py=
thon/python3-cryptography/0001-Fix-include-directory-when-cross-compiling-9=
129.patch
> deleted file mode 100644
> index d720359ded7..00000000000
> --- a/meta/recipes-devtools/python/python3-cryptography/0001-Fix-include-=
directory-when-cross-compiling-9129.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 2f9cd402d3293f6efe0f3ac06f17c6c14edbed86 Mon Sep 17 00:00:00 2001
> -From: James Hilliard <james.hilliard1@gmail.com>
> -Date: Sun, 25 Jun 2023 17:39:19 -0600
> -Subject: [PATCH] Fix include directory when cross compiling (#9129)
> -
> -Upstream-Status: Backport [https://github.com/pyca/cryptography/pull/912=
9]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - src/rust/cryptography-cffi/build.rs | 14 +++++++++++---
> - 1 file changed, 11 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/rust/cryptography-cffi/build.rs b/src/rust/cryptography=
-cffi/build.rs
> -index 07590ad2e..384af1ddb 100644
> ---- a/src/rust/cryptography-cffi/build.rs
> -+++ b/src/rust/cryptography-cffi/build.rs
> -@@ -47,9 +47,14 @@ fn main() {
> -     )
> -     .unwrap();
> -     println!("cargo:rustc-cfg=3Dpython_implementation=3D\"{}\"", python=
_impl);
> --    let python_include =3D run_python_script(
> -+    let python_includes =3D run_python_script(
> -         &python,
> --        "import sysconfig; print(sysconfig.get_path('include'), end=3D'=
')",
> -+        "import os; \
> -+         import setuptools.dist; \
> -+         import setuptools.command.build_ext; \
> -+         b =3D setuptools.command.build_ext.build_ext(setuptools.dist.D=
istribution()); \
> -+         b.finalize_options(); \
> -+         print(os.pathsep.join(b.include_dirs), end=3D'')",
> -     )
> -     .unwrap();
> -     let openssl_include =3D
> -@@ -59,12 +64,15 @@ fn main() {
> -     let mut build =3D cc::Build::new();
> -     build
> -         .file(openssl_c)
> --        .include(python_include)
> -         .include(openssl_include)
> -         .flag_if_supported("-Wconversion")
> -         .flag_if_supported("-Wno-error=3Dsign-conversion")
> -         .flag_if_supported("-Wno-unused-parameter");
> -
> -+    for python_include in env::split_paths(&python_includes) {
> -+        build.include(python_include);
> -+    }
> -+
> -     // Enable abi3 mode if we're not using PyPy.
> -     if python_impl !=3D "PyPy" {
> -         // cp37 (Python 3.7 to help our grep when we some day drop 3.7 =
support)
> ---
> -2.30.2
> -
> diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pypro=
ject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/pyt=
hon/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-optio=
n.patch
> index 69cf451d576..f9c8d1393d2 100644
> --- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.to=
ml-remove-benchmark-disable-option.patch
> +++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.to=
ml-remove-benchmark-disable-option.patch
> @@ -19,16 +19,18 @@ Upstream-Status: Inappropriate [OE specific]
>
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>
> +Refresh for 42.02
> +Signed-off-by: Tim Orling <tim.orling@konsulko.com>
>  ---
> - pyproject.toml | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> + pyproject.toml | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/pyproject.toml b/pyproject.toml
> -index b2e511f..4a285af 100644
> +index c9a7979bd..dec4b7157 100644
>  --- a/pyproject.toml
>  +++ b/pyproject.toml
> -@@ -85,7 +85,7 @@ line-length =3D 79
> - target-version =3D ["py37"]
> +@@ -92,7 +92,7 @@ rust-version =3D ">=3D1.63.0"
> +
>
>   [tool.pytest.ini_options]
>  -addopts =3D "-r s --capture=3Dno --strict-markers --benchmark-disable"
> @@ -36,10 +38,6 @@ index b2e511f..4a285af 100644
>   console_output_style =3D "progress-even-when-capture-no"
>   markers =3D [
>       "skip_fips: this test is not executed in FIPS mode",
> -@@ -151,4 +151,4 @@ git-only =3D [
> -     "ci-constraints-requirements.txt",
> -     ".gitattributes",
> -     ".gitignore",
> --]
> -\ No newline at end of file
> -+]
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb =
b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
> similarity index 92%
> rename from meta/recipes-devtools/python/python3-cryptography_41.0.7.bb
> rename to meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
> index 45856774403..674130a9797 100644
> --- a/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
> @@ -8,10 +8,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c3617db4fb6f=
ae01f1d253ab91511e4 \
>                     "
>  LDSHARED +=3D "-pthread"
>
> -SRC_URI[sha256sum] =3D "13f93ce9bea8016c253b34afc6bd6a75993e5c40672ed540=
5a9c832f0d4a00bc"
> +SRC_URI[sha256sum] =3D "e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433219dc8c9=
3827c57eab6cf888"
>
>  SRC_URI +=3D "file://0001-pyproject.toml-remove-benchmark-disable-option=
.patch \
> -            file://0001-Fix-include-directory-when-cross-compiling-9129.=
patch \
>              file://check-memfree.py \
>              file://run-ptest \
>             "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194783): https://lists.openembedded.org/g/openembedde=
d-core/message/194783
> Mute This Topic: https://lists.openembedded.org/mt/104113998/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

