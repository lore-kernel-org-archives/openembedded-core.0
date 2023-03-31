Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D867FC76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 12:27:58 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.53317.1680265675909071610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 05:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XzTNaNC2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id v1so22213876wrv.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680265674;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oKDfwPcGRgT5klApyX8ygIo33xIktjTeFum3OKnagdU=;
        b=XzTNaNC2lvG5yqUtnJoCtetux8lYIccqbGh/HKHRz3BJTdQJokHlqzCbEMKcGTdsHZ
         3g+/yZN83pGKfZiFX2ocQThKdLJnzK3v3XIgtD/t4Xuzq8pXI3EyVgosGyILKHYip7b2
         AfbIZawXPDDJJCcC/9Otz8wSEmxTatIfMT8oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680265674;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oKDfwPcGRgT5klApyX8ygIo33xIktjTeFum3OKnagdU=;
        b=4fZ9og9N9+eyGOI0HpNifxJ7dubTUdX+h1O3G3OaGlAgI6akPlyJDW10xEgrmOZHK/
         yv/bJL+cV3Cn8N1EmH7l6WPI1RBLClJclYaCKASJKuOPShRBi9MkpKCO0y2Ghvmv3FlB
         bzIUx60h11UTN/DSHk19sTq0JWGbjj8u7NRqdDTM4cuPVedzdEDUclauQyK+UW5CRwhR
         6KCyL/r2QTyxE/w7Hy8Ut5F415KjPqu+o3QrHQWefFbRt8t5t09raeO+Tp404GNJlAq0
         yK4pp/siN6uzBEfZLmpqgNGG9mRwMZphm0RJjHlG8+3tP3aLmIA9WJOatNlQGnqBJAia
         0wwg==
X-Gm-Message-State: AAQBX9ckj3AUjMBn7M/9mqs60ucJ3454Kjd0MDSxXOBGXgrdQezkF7mE
	4x+d7Y1xRF3aRx6MCGNN6o8C9g==
X-Google-Smtp-Source: AKy350aRfvO1HEFonLl4kFImjE6vlDxtTwBfut4vI7hVukujSWh+RsG/MS/ogBqfJyeVGd+Kh8cc0A==
X-Received: by 2002:a5d:5343:0:b0:2ce:ada5:325d with SMTP id t3-20020a5d5343000000b002ceada5325dmr21728060wrv.37.1680265673887;
        Fri, 31 Mar 2023 05:27:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:18b7:bfe:d74b:7341? ([2001:8b0:aba:5f3c:18b7:bfe:d74b:7341])
        by smtp.gmail.com with ESMTPSA id a12-20020a056000100c00b002cea8664304sm2049678wrx.91.2023.03.31.05.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 05:27:53 -0700 (PDT)
Message-ID: <73108638b9d165f203117b4f6a9e63ef94a0f2a5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V6 5/6] meta-selftest: provide a recipe for
 zvariant
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Date: Fri, 31 Mar 2023 13:27:52 +0100
In-Reply-To: <d0b6aff677d7e7a268b4c16a83ff3162e9c60dd1.1680238655.git.frederic.martinsons@gmail.com>
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
	 <d0b6aff677d7e7a268b4c16a83ff3162e9c60dd1.1680238655.git.frederic.martinsons@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 12:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179440

On Fri, 2023-03-31 at 07:45 +0200, Frederic Martinsons wrote:
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>=20
> This recipe is for showing a "real world" example of
> a crate that depends on some git repositories.
>=20
> Usually, this kind of crate is built within a global
> workspace (here it is the zbus project) and so
> doesn't need a Cargo.lock on its own.
>=20
> For the sake of the demonstration, I had to tweak things
> a little to be able to compile zvariant in standalone
> (no relative path in dependency, no symlink to LICENSE
> provide a Cargo.lock)
>=20
> The use case where the crate had some git repository
> in dependency is very common for "private" crate that
> are not aimed to be published on crates.io.
> When the project grow bigger, it is common to have
> a bin and multiple lib developped in parallel, and these
> libs are surely on a git repostitory.
>=20
> A test case have been also added to check for:
>   - the previous patch about git subpath parameter and devtool
>   - the correctness of overriding dependencies (first patch of the
> series)
>=20
> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> ---
>  .../zvariant/zvariant-crates.inc              |  258 ++++
>  .../zvariant/zvariant-git-crates.inc          |   14 +
>  .../0001-Tweak-zvariant-crate-config.patch    | 1292 +++++++++++++++++
>  .../zvariant/zvariant_3.12.0.bb               |   27 +
>  meta/lib/oeqa/selftest/cases/devtool.py       |   93 ++
>  5 files changed, 1684 insertions(+)
>  create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-crat=
es.inc
>  create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant-git-=
crates.inc
>  create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant/0001=
-Tweak-zvariant-crate-config.patch
>  create mode 100644 meta-selftest/recipes-extended/zvariant/zvariant_3.12=
.0.bb
>=20
> diff --git a/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc =
b/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
> new file mode 100644
> index 0000000000..3a9759c4a5
> --- /dev/null
> +++ b/meta-selftest/recipes-extended/zvariant/zvariant-crates.inc
> @@ -0,0 +1,258 @@
> +# Autogenerated with 'bitbake -c update_crates zvariant'
> +
> +# from Cargo.lock
> +SRC_URI +=3D " \
> +    crate://crates.io/anes/0.1.6;name=3Danes-0.1.6 \
> +    crate://crates.io/anyhow/1.0.70;name=3Danyhow-1.0.70 \
> +    crate://crates.io/arrayvec/0.7.2;name=3Darrayvec-0.7.2 \
> +    crate://crates.io/atty/0.2.14;name=3Datty-0.2.14 \
> +    crate://crates.io/autocfg/1.1.0;name=3Dautocfg-1.1.0 \
> +    crate://crates.io/bitflags/1.3.2;name=3Dbitflags-1.3.2 \
> +    crate://crates.io/bumpalo/3.12.0;name=3Dbumpalo-3.12.0 \
> +    crate://crates.io/byteorder/1.4.3;name=3Dbyteorder-1.4.3 \
> +    crate://crates.io/cast/0.3.0;name=3Dcast-0.3.0 \
> +    crate://crates.io/cfg-if/1.0.0;name=3Dcfg-if-1.0.0 \
> +    crate://crates.io/chrono/0.4.24;name=3Dchrono-0.4.24 \
> +    crate://crates.io/ciborium/0.2.0;name=3Dciborium-0.2.0 \
> +    crate://crates.io/ciborium-io/0.2.0;name=3Dciborium-io-0.2.0 \
> +    crate://crates.io/ciborium-ll/0.2.0;name=3Dciborium-ll-0.2.0 \
> +    crate://crates.io/clap/3.2.23;name=3Dclap-3.2.23 \
> +    crate://crates.io/clap_lex/0.2.4;name=3Dclap_lex-0.2.4 \
> +    crate://crates.io/criterion/0.4.0;name=3Dcriterion-0.4.0 \
> +    crate://crates.io/criterion-plot/0.5.0;name=3Dcriterion-plot-0.5.0 \
> +    crate://crates.io/crossbeam-channel/0.5.7;name=3Dcrossbeam-channel-0=
.5.7 \
> +    crate://crates.io/crossbeam-deque/0.8.3;name=3Dcrossbeam-deque-0.8.3=
 \
> +    crate://crates.io/crossbeam-epoch/0.9.14;name=3Dcrossbeam-epoch-0.9.=
14 \
> +    crate://crates.io/crossbeam-utils/0.8.15;name=3Dcrossbeam-utils-0.8.=
15 \
> +    crate://crates.io/either/1.8.1;name=3Deither-1.8.1 \
> +    crate://crates.io/enumflags2/0.7.5;name=3Denumflags2-0.7.5 \
> +    crate://crates.io/enumflags2_derive/0.7.4;name=3Denumflags2_derive-0=
.7.4 \
> +    crate://crates.io/form_urlencoded/1.1.0;name=3Dform_urlencoded-1.1.0=
 \
> +    crate://crates.io/futures-channel/0.3.27;name=3Dfutures-channel-0.3.=
27 \
> +    crate://crates.io/futures-core/0.3.27;name=3Dfutures-core-0.3.27 \
> +    crate://crates.io/futures-executor/0.3.27;name=3Dfutures-executor-0.=
3.27 \
> +    crate://crates.io/futures-macro/0.3.27;name=3Dfutures-macro-0.3.27 \
> +    crate://crates.io/futures-task/0.3.27;name=3Dfutures-task-0.3.27 \
> +    crate://crates.io/futures-util/0.3.27;name=3Dfutures-util-0.3.27 \
> +    crate://crates.io/getrandom/0.2.8;name=3Dgetrandom-0.2.8 \
> +    crate://crates.io/half/1.8.2;name=3Dhalf-1.8.2 \
> +    crate://crates.io/hashbrown/0.12.3;name=3Dhashbrown-0.12.3 \
> +    crate://crates.io/heck/0.3.3;name=3Dheck-0.3.3 \
> +    crate://crates.io/hermit-abi/0.1.19;name=3Dhermit-abi-0.1.19 \
> +    crate://crates.io/hermit-abi/0.2.6;name=3Dhermit-abi-0.2.6 \
> +    crate://crates.io/idna/0.3.0;name=3Didna-0.3.0 \
> +    crate://crates.io/indexmap/1.9.2;name=3Dindexmap-1.9.2 \
> +    crate://crates.io/itertools/0.9.0;name=3Ditertools-0.9.0 \
> +    crate://crates.io/itertools/0.10.5;name=3Ditertools-0.10.5 \
> +    crate://crates.io/itoa/1.0.6;name=3Ditoa-1.0.6 \
> +    crate://crates.io/js-sys/0.3.61;name=3Djs-sys-0.3.61 \
> +    crate://crates.io/lazy_static/1.4.0;name=3Dlazy_static-1.4.0 \
> +    crate://crates.io/libc/0.2.140;name=3Dlibc-0.2.140 \
> +    crate://crates.io/log/0.4.17;name=3Dlog-0.4.17 \
> +    crate://crates.io/memchr/2.5.0;name=3Dmemchr-2.5.0 \
> +    crate://crates.io/memoffset/0.8.0;name=3Dmemoffset-0.8.0 \
> +    crate://crates.io/num-integer/0.1.45;name=3Dnum-integer-0.1.45 \
> +    crate://crates.io/num-traits/0.2.15;name=3Dnum-traits-0.2.15 \
> +    crate://crates.io/num_cpus/1.15.0;name=3Dnum_cpus-1.15.0 \
> +    crate://crates.io/once_cell/1.17.1;name=3Donce_cell-1.17.1 \
> +    crate://crates.io/oorandom/11.1.3;name=3Doorandom-11.1.3 \
> +    crate://crates.io/os_str_bytes/6.5.0;name=3Dos_str_bytes-6.5.0 \
> +    crate://crates.io/percent-encoding/2.2.0;name=3Dpercent-encoding-2.2=
.0 \
> +    crate://crates.io/pin-project-lite/0.2.9;name=3Dpin-project-lite-0.2=
.9 \
> +    crate://crates.io/pin-utils/0.1.0;name=3Dpin-utils-0.1.0 \
> +    crate://crates.io/pkg-config/0.3.26;name=3Dpkg-config-0.3.26 \
> +    crate://crates.io/plotters/0.3.4;name=3Dplotters-0.3.4 \
> +    crate://crates.io/plotters-backend/0.3.4;name=3Dplotters-backend-0.3=
.4 \
> +    crate://crates.io/plotters-svg/0.3.3;name=3Dplotters-svg-0.3.3 \
> +    crate://crates.io/ppv-lite86/0.2.17;name=3Dppv-lite86-0.2.17 \
> +    crate://crates.io/proc-macro-crate/0.1.5;name=3Dproc-macro-crate-0.1=
.5 \
> +    crate://crates.io/proc-macro-crate/1.3.1;name=3Dproc-macro-crate-1.3=
.1 \
> +    crate://crates.io/proc-macro-error/1.0.4;name=3Dproc-macro-error-1.0=
.4 \
> +    crate://crates.io/proc-macro-error-attr/1.0.4;name=3Dproc-macro-erro=
r-attr-1.0.4 \
> +    crate://crates.io/proc-macro2/1.0.53;name=3Dproc-macro2-1.0.53 \
> +    crate://crates.io/quote/1.0.26;name=3Dquote-1.0.26 \
> +    crate://crates.io/rand/0.8.5;name=3Drand-0.8.5 \
> +    crate://crates.io/rand_chacha/0.3.1;name=3Drand_chacha-0.3.1 \
> +    crate://crates.io/rand_core/0.6.4;name=3Drand_core-0.6.4 \
> +    crate://crates.io/rayon/1.7.0;name=3Drayon-1.7.0 \
> +    crate://crates.io/rayon-core/1.11.0;name=3Drayon-core-1.11.0 \
> +    crate://crates.io/regex/1.7.2;name=3Dregex-1.7.2 \
> +    crate://crates.io/regex-syntax/0.6.29;name=3Dregex-syntax-0.6.29 \
> +    crate://crates.io/ryu/1.0.13;name=3Dryu-1.0.13 \
> +    crate://crates.io/same-file/1.0.6;name=3Dsame-file-1.0.6 \
> +    crate://crates.io/scopeguard/1.1.0;name=3Dscopeguard-1.1.0 \
> +    crate://crates.io/serde/1.0.158;name=3Dserde-1.0.158 \
> +    crate://crates.io/serde_bytes/0.11.9;name=3Dserde_bytes-0.11.9 \
> +    crate://crates.io/serde_derive/1.0.158;name=3Dserde_derive-1.0.158 \
> +    crate://crates.io/serde_json/1.0.94;name=3Dserde_json-1.0.94 \
> +    crate://crates.io/serde_repr/0.1.12;name=3Dserde_repr-0.1.12 \
> +    crate://crates.io/slab/0.4.8;name=3Dslab-0.4.8 \
> +    crate://crates.io/static_assertions/1.1.0;name=3Dstatic_assertions-1=
.1.0 \
> +    crate://crates.io/strum/0.18.0;name=3Dstrum-0.18.0 \
> +    crate://crates.io/strum_macros/0.18.0;name=3Dstrum_macros-0.18.0 \
> +    crate://crates.io/syn/1.0.109;name=3Dsyn-1.0.109 \
> +    crate://crates.io/syn/2.0.8;name=3Dsyn-2.0.8 \
> +    crate://crates.io/system-deps/1.3.2;name=3Dsystem-deps-1.3.2 \
> +    crate://crates.io/textwrap/0.16.0;name=3Dtextwrap-0.16.0 \
> +    crate://crates.io/thiserror/1.0.40;name=3Dthiserror-1.0.40 \
> +    crate://crates.io/thiserror-impl/1.0.40;name=3Dthiserror-impl-1.0.40=
 \
> +    crate://crates.io/time/0.3.20;name=3Dtime-0.3.20 \
> +    crate://crates.io/time-core/0.1.0;name=3Dtime-core-0.1.0 \
> +    crate://crates.io/time-macros/0.2.8;name=3Dtime-macros-0.2.8 \
> +    crate://crates.io/tinytemplate/1.2.1;name=3Dtinytemplate-1.2.1 \
> +    crate://crates.io/tinyvec/1.6.0;name=3Dtinyvec-1.6.0 \
> +    crate://crates.io/tinyvec_macros/0.1.1;name=3Dtinyvec_macros-0.1.1 \
> +    crate://crates.io/toml/0.5.11;name=3Dtoml-0.5.11 \
> +    crate://crates.io/toml_datetime/0.6.1;name=3Dtoml_datetime-0.6.1 \
> +    crate://crates.io/toml_edit/0.19.8;name=3Dtoml_edit-0.19.8 \
> +    crate://crates.io/unicode-bidi/0.3.13;name=3Dunicode-bidi-0.3.13 \
> +    crate://crates.io/unicode-ident/1.0.8;name=3Dunicode-ident-1.0.8 \
> +    crate://crates.io/unicode-normalization/0.1.22;name=3Dunicode-normal=
ization-0.1.22 \
> +    crate://crates.io/unicode-segmentation/1.10.1;name=3Dunicode-segment=
ation-1.10.1 \
> +    crate://crates.io/url/2.3.1;name=3Durl-2.3.1 \
> +    crate://crates.io/uuid/1.3.0;name=3Duuid-1.3.0 \
> +    crate://crates.io/version-compare/0.0.10;name=3Dversion-compare-0.0.=
10 \
> +    crate://crates.io/version_check/0.9.4;name=3Dversion_check-0.9.4 \
> +    crate://crates.io/walkdir/2.3.3;name=3Dwalkdir-2.3.3 \
> +    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1;name=3Dwasi-0.1=
1.0+wasi-snapshot-preview1 \
> +    crate://crates.io/wasm-bindgen/0.2.84;name=3Dwasm-bindgen-0.2.84 \
> +    crate://crates.io/wasm-bindgen-backend/0.2.84;name=3Dwasm-bindgen-ba=
ckend-0.2.84 \
> +    crate://crates.io/wasm-bindgen-macro/0.2.84;name=3Dwasm-bindgen-macr=
o-0.2.84 \
> +    crate://crates.io/wasm-bindgen-macro-support/0.2.84;name=3Dwasm-bind=
gen-macro-support-0.2.84 \
> +    crate://crates.io/wasm-bindgen-shared/0.2.84;name=3Dwasm-bindgen-sha=
red-0.2.84 \
> +    crate://crates.io/web-sys/0.3.61;name=3Dweb-sys-0.3.61 \
> +    crate://crates.io/winapi/0.3.9;name=3Dwinapi-0.3.9 \
> +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0;name=3Dwinapi-i68=
6-pc-windows-gnu-0.4.0 \
> +    crate://crates.io/winapi-util/0.1.5;name=3Dwinapi-util-0.1.5 \
> +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0;name=3Dwinapi-x=
86_64-pc-windows-gnu-0.4.0 \
> +    crate://crates.io/winnow/0.4.0;name=3Dwinnow-0.4.0 \
> +    crate://crates.io/zvariant_derive/3.12.0;name=3Dzvariant_derive-3.12=
.0 \
> +    crate://crates.io/zvariant_utils/1.0.0;name=3Dzvariant_utils-1.0.0 \
> +"
> +
> +SRC_URI[anes-0.1.6.sha256sum] =3D "4b46cbb362ab8752921c97e041f5e366ee629=
7bd428a31275b9fcf1e380f7299"
> +SRC_URI[anyhow-1.0.70.sha256sum] =3D "7de8ce5e0f9f8d88245311066a578d72b7=
af3e7088f32783804676302df237e4"
> +SRC_URI[arrayvec-0.7.2.sha256sum] =3D "8da52d66c7071e2e3fa2a1e5c6d088fec=
47b593032b254f5e980de8ea54454d6"
> +SRC_URI[atty-0.2.14.sha256sum] =3D "d9b39be18770d11421cdb1b9947a45dd3f37=
e93092cbf377614828a319d5fee8"
> +SRC_URI[autocfg-1.1.0.sha256sum] =3D "d468802bab17cbc0cc575e9b053f41e72a=
a36bfa6b7f55e3529ffa43161b97fa"
> +SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf59=
5c92905c8f8f4fdc18d06fb1037718a"
> +SRC_URI[bumpalo-3.12.0.sha256sum] =3D "0d261e256854913907f67ed06efbc3338=
dfe6179796deefc1ff763fc1aee5535"
> +SRC_URI[byteorder-1.4.3.sha256sum] =3D "14c189c53d098945499cdfa7ecc63567=
cf3886b3332b312a5b4585d8d3a6a610"
> +SRC_URI[cast-0.3.0.sha256sum] =3D "37b2a672a2cb129a2e41c10b1224bb368f9f3=
7a2b16b612598138befd7b37eb5"
> +SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
> +SRC_URI[chrono-0.4.24.sha256sum] =3D "4e3c5919066adf22df73762e50cffcde3a=
758f2a848b113b586d1f86728b673b"
> +SRC_URI[ciborium-0.2.0.sha256sum] =3D "b0c137568cc60b904a7724001b35ce263=
0fd00d5d84805fbb608ab89509d788f"
> +SRC_URI[ciborium-io-0.2.0.sha256sum] =3D "346de753af073cc87b52b2083a506b=
38ac176a44cfb05497b622e27be899b369"
> +SRC_URI[ciborium-ll-0.2.0.sha256sum] =3D "213030a2b5a4e0c0892b6652260cf6=
ccac84827b83a85a534e178e3906c4cf1b"
> +SRC_URI[clap-3.2.23.sha256sum] =3D "71655c45cb9845d3270c9d6df84ebe72b4da=
d3c2ba3f7023ad47c144e4e473a5"
> +SRC_URI[clap_lex-0.2.4.sha256sum] =3D "2850f2f5a82cbf437dd5af4d49848fbdf=
c27c157c3d010345776f952765261c5"
> +SRC_URI[criterion-0.4.0.sha256sum] =3D "e7c76e09c1aae2bc52b3d2f29e13c657=
2553b30c4aa1b8a49fd70de6412654cb"
> +SRC_URI[criterion-plot-0.5.0.sha256sum] =3D "6b50826342786a51a89e2da3a28=
f1c32b06e387201bc2d19791f622c673706b1"
> +SRC_URI[crossbeam-channel-0.5.7.sha256sum] =3D "cf2b3e8478797446514c91ef=
04bafcb59faba183e621ad488df88983cc14128c"
> +SRC_URI[crossbeam-deque-0.8.3.sha256sum] =3D "ce6fd6f855243022dcecf8702f=
ef0c297d4338e226845fe067f6341ad9fa0cef"
> +SRC_URI[crossbeam-epoch-0.9.14.sha256sum] =3D "46bd5f3f85273295a9d14aedf=
b86f6aadbff6d8f5295c4a9edb08e819dcf5695"
> +SRC_URI[crossbeam-utils-0.8.15.sha256sum] =3D "3c063cd8cc95f5c377ed0d4b4=
9a4b21f632396ff690e8470c29b3359b346984b"
> +SRC_URI[either-1.8.1.sha256sum] =3D "7fcaabb2fef8c910e7f4c7ce9f67a1283a1=
715879a7c230ca9d6d1ae31f16d91"
> +SRC_URI[enumflags2-0.7.5.sha256sum] =3D "e75d4cd21b95383444831539909fbb1=
4b9dc3fdceb2a6f5d36577329a1f55ccb"
> +SRC_URI[enumflags2_derive-0.7.4.sha256sum] =3D "f58dc3c5e468259f19f2d463=
04a6b28f1c3d034442e14b322d2b850e36f6d5ae"
> +SRC_URI[form_urlencoded-1.1.0.sha256sum] =3D "a9c384f161156f5260c24a097c=
56119f9be8c798586aecc13afbcbe7b7e26bf8"
> +SRC_URI[futures-channel-0.3.27.sha256sum] =3D "164713a5a0dcc3e7b4b1ed7d3=
b433cabc18025386f9339346e8daf15963cf7ac"
> +SRC_URI[futures-core-0.3.27.sha256sum] =3D "86d7a0c1aa76363dac491de0ee99=
faf6941128376f1cf96f07db7603b7de69dd"
> +SRC_URI[futures-executor-0.3.27.sha256sum] =3D "1997dd9df74cdac935c76252=
744c1ed5794fac083242ea4fe77ef3ed60ba0f83"
> +SRC_URI[futures-macro-0.3.27.sha256sum] =3D "3eb14ed937631bd8b8b8977f2c1=
98443447a8355b6e3ca599f38c975e5a963b6"
> +SRC_URI[futures-task-0.3.27.sha256sum] =3D "fd65540d33b37b16542a0438c12e=
6aeead10d4ac5d05bd3f805b8f35ab592879"
> +SRC_URI[futures-util-0.3.27.sha256sum] =3D "3ef6b17e481503ec85211fed8f39=
d1970f128935ca1f814cd32ac4a6842e84ab"
> +SRC_URI[getrandom-0.2.8.sha256sum] =3D "c05aeb6a22b8f62540c194aac980f211=
5af067bfe15a0734d7277a768d396b31"
> +SRC_URI[half-1.8.2.sha256sum] =3D "eabb4a44450da02c90444cf74558da904edde=
8fb4e9035a9a6a4e15445af0bd7"
> +SRC_URI[hashbrown-0.12.3.sha256sum] =3D "8a9ee70c43aaf417c914396645a0fa8=
52624801b24ebb7ae78fe8272889ac888"
> +SRC_URI[heck-0.3.3.sha256sum] =3D "6d621efb26863f0e9924c6ac577e8275e5e6b=
77455db64ffa6c65c904e9e132c"
> +SRC_URI[hermit-abi-0.1.19.sha256sum] =3D "62b467343b94ba476dcb2500d242da=
dbb39557df889310ac77c5d99100aaac33"
> +SRC_URI[hermit-abi-0.2.6.sha256sum] =3D "ee512640fe35acbfb4bb779db6f0d80=
704c2cacfa2e39b601ef3e3f47d1ae4c7"
> +SRC_URI[idna-0.3.0.sha256sum] =3D "e14ddfc70884202db2244c223200c204c2bda=
1bc6e0998d11b5e024d657209e6"
> +SRC_URI[indexmap-1.9.2.sha256sum] =3D "1885e79c1fc4b10f0e172c475f458b7f7=
b93061064d98c3293e98c5ba0c8b399"
> +SRC_URI[itertools-0.9.0.sha256sum] =3D "284f18f85651fe11e8a991b2adb42cb0=
78325c996ed026d994719efcfca1d54b"
> +SRC_URI[itertools-0.10.5.sha256sum] =3D "b0fd2260e829bddf4cb6ea802289de2=
f86d6a7a690192fbe91b3f46e0f2c8473"
> +SRC_URI[itoa-1.0.6.sha256sum] =3D "453ad9f582a441959e5f0d088b02ce04cfe8d=
51a8eaf077f12ac6d3e94164ca6"
> +SRC_URI[js-sys-0.3.61.sha256sum] =3D "445dde2150c55e483f3d8416706b97ec8e=
8237c307e5b7b4b8dd15e6af2a0730"
> +SRC_URI[lazy_static-1.4.0.sha256sum] =3D "e2abad23fbc42b3700f2f279844dc8=
32adb2b2eb069b2df918f455c4e18cc646"
> +SRC_URI[libc-0.2.140.sha256sum] =3D "99227334921fae1a979cf0bfdfcc6b3e5ce=
376ef57e16fb6fb3ea2ed6095f80c"
> +SRC_URI[log-0.4.17.sha256sum] =3D "abb12e687cfb44aa40f41fc3978ef76448f9b=
6038cad6aef4259d3c095a2382e"
> +SRC_URI[memchr-2.5.0.sha256sum] =3D "2dffe52ecf27772e601905b7522cb4ef790=
d2cc203488bbd0e2fe85fcb74566d"
> +SRC_URI[memoffset-0.8.0.sha256sum] =3D "d61c719bcfbcf5d62b3a09efa6088de8=
c54bc0bfcd3ea7ae39fcc186108b8de1"
> +SRC_URI[num-integer-0.1.45.sha256sum] =3D "225d3389fb3509a24c93f5c29eb6b=
de2586b98d9f016636dff58d7c6f7569cd9"
> +SRC_URI[num-traits-0.2.15.sha256sum] =3D "578ede34cf02f8924ab9447f50c280=
75b4d3e5b269972345e7e0372b38c6cdcd"
> +SRC_URI[num_cpus-1.15.0.sha256sum] =3D "0fac9e2da13b5eb447a6ce3d392f23a2=
9d8694bff781bf03a16cd9ac8697593b"
> +SRC_URI[once_cell-1.17.1.sha256sum] =3D "b7e5500299e16ebb147ae15a00a942a=
f264cf3688f47923b8fc2cd5858f23ad3"
> +SRC_URI[oorandom-11.1.3.sha256sum] =3D "0ab1bc2a289d34bd04a330323ac98a1b=
4bc82c9d9fcb1e66b63caa84da26b575"
> +SRC_URI[os_str_bytes-6.5.0.sha256sum] =3D "ceedf44fb00f2d1984b0bc9810262=
7ce622e083e49a5bacdb3e514fa4238e267"
> +SRC_URI[percent-encoding-2.2.0.sha256sum] =3D "478c572c3d73181ff3c253904=
5f6eb99e5491218eae919370993b890cdbdd98e"
> +SRC_URI[pin-project-lite-0.2.9.sha256sum] =3D "e0a7ae3ac2f1173085d398531=
c705756c94a4c56843785df85a60c1a0afac116"
> +SRC_URI[pin-utils-0.1.0.sha256sum] =3D "8b870d8c151b6f2fb93e84a13146138f=
05d02ed11c7e7c54f8826aaaf7c9f184"
> +SRC_URI[pkg-config-0.3.26.sha256sum] =3D "6ac9a59f73473f1b8d852421e59e64=
809f025994837ef743615c6d0c5b305160"
> +SRC_URI[plotters-0.3.4.sha256sum] =3D "2538b639e642295546c50fcd545198c9d=
64ee2a38620a628724a3b266d5fbf97"
> +SRC_URI[plotters-backend-0.3.4.sha256sum] =3D "193228616381fecdc1224c62e=
96946dfbc73ff4384fba576e052ff8c1bea8142"
> +SRC_URI[plotters-svg-0.3.3.sha256sum] =3D "f9a81d2759aae1dae668f783c308b=
c5c8ebd191ff4184aaa1b37f65a6ae5a56f"
> +SRC_URI[ppv-lite86-0.2.17.sha256sum] =3D "5b40af805b3121feab8a3c29f04d8a=
d262fa8e0561883e7653e024ae4479e6de"
> +SRC_URI[proc-macro-crate-0.1.5.sha256sum] =3D "1d6ea3c4595b96363c1394349=
7db34af4460fb474a95c43f4446ad341b8c9785"
> +SRC_URI[proc-macro-crate-1.3.1.sha256sum] =3D "7f4c021e1093a56626774e812=
16a4ce732a735e5bad4868a03f3ed65ca0c3919"
> +SRC_URI[proc-macro-error-1.0.4.sha256sum] =3D "da25490ff9892aab3fcf7c36f=
08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
> +SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] =3D "a1be40180e52ecc98ad8=
0b184934baf3d0d29f979574e439af5a55274b35f869"
> +SRC_URI[proc-macro2-1.0.53.sha256sum] =3D "ba466839c78239c09faf015484e5c=
c04860f88242cff4d03eb038f04b4699b73"
> +SRC_URI[quote-1.0.26.sha256sum] =3D "4424af4bf778aae2051a77b60283332f386=
554255d722233d09fbfc7e30da2fc"
> +SRC_URI[rand-0.8.5.sha256sum] =3D "34af8d1a0e25924bc5b7c43c079c942339d8f=
0a8b57c39049bef581b46327404"
> +SRC_URI[rand_chacha-0.3.1.sha256sum] =3D "e6c10a63a0fa32252be49d21e7709d=
4d4baf8d231c2dbce1eaa8141b9b127d88"
> +SRC_URI[rand_core-0.6.4.sha256sum] =3D "ec0be4795e2f6a28069bec0b5ff3e2ac=
9bafc99e6a9a7dc3547996c5c816922c"
> +SRC_URI[rayon-1.7.0.sha256sum] =3D "1d2df5196e37bcc87abebc0053e20787d738=
47bb33134a69841207dd0a47f03b"
> +SRC_URI[rayon-core-1.11.0.sha256sum] =3D "4b8f95bd6966f5c87776639160a66b=
d8ab9895d9d4ab01ddba9fc60661aebe8d"
> +SRC_URI[regex-1.7.2.sha256sum] =3D "cce168fea28d3e05f158bda4576cf0c844d5=
045bc2cc3620fa0292ed5bb5814c"
> +SRC_URI[regex-syntax-0.6.29.sha256sum] =3D "f162c6dd7b008981e4d40210aca2=
0b4bd0f9b60ca9271061b07f78537722f2e1"
> +SRC_URI[ryu-1.0.13.sha256sum] =3D "f91339c0467de62360649f8d3e185ca8de422=
4ff281f66000de5eb2a77a79041"
> +SRC_URI[same-file-1.0.6.sha256sum] =3D "93fc1dc3aaa9bfed95e02e6eadabb4ba=
f7e3078b0bd1b4d7b6b0b68378900502"
> +SRC_URI[scopeguard-1.1.0.sha256sum] =3D "d29ab0c6d3fc0ee92fe66e2d99f700e=
ab17a8d57d1c1d3b748380fb20baa78cd"
> +SRC_URI[serde-1.0.158.sha256sum] =3D "771d4d9c4163ee138805e12c710dd365e4=
f44be8be0503cb1bb9eb989425d9c9"
> +SRC_URI[serde_bytes-0.11.9.sha256sum] =3D "416bda436f9aab92e02c8e10d49a1=
5ddd339cea90b6e340fe51ed97abb548294"
> +SRC_URI[serde_derive-1.0.158.sha256sum] =3D "e801c1712f48475582b7696ac71=
e0ca34ebb30e09338425384269d9717c62cad"
> +SRC_URI[serde_json-1.0.94.sha256sum] =3D "1c533a59c9d8a93a09c6ab31f0fd5e=
5f4dd1b8fc9434804029839884765d04ea"
> +SRC_URI[serde_repr-0.1.12.sha256sum] =3D "bcec881020c684085e55a25f7fd888=
954d56609ef363479dc5a1305eb0d40cab"
> +SRC_URI[slab-0.4.8.sha256sum] =3D "6528351c9bc8ab22353f9d776db39a20288e8=
d6c37ef8cfe3317cf875eecfc2d"
> +SRC_URI[static_assertions-1.1.0.sha256sum] =3D "a2eb9349b6444b326872e140=
eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
> +SRC_URI[strum-0.18.0.sha256sum] =3D "57bd81eb48f4c437cadc685403cad539345=
bf703d78e63707418431cecd4522b"
> +SRC_URI[strum_macros-0.18.0.sha256sum] =3D "87c85aa3f8ea653bfd3ddf25f7ee=
357ee4d204731f6aa9ad04002306f6e2774c"
> +SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3baf=
a67b529ead792a6d0160888b4237"
> +SRC_URI[syn-2.0.8.sha256sum] =3D "bcc02725fd69ab9f26eab07fad303e2497fad6=
fb9eba4f96c4d1687bdf704ad9"
> +SRC_URI[system-deps-1.3.2.sha256sum] =3D "0f3ecc17269a19353b3558b313bba7=
38b25d82993e30d62a18406a24aba4649b"
> +SRC_URI[textwrap-0.16.0.sha256sum] =3D "222a222a5bfe1bba4a77b45ec488a741=
b3cb8872e5e499451fd7d0129c9c7c3d"
> +SRC_URI[thiserror-1.0.40.sha256sum] =3D "978c9a314bd8dc99be594bc3c175faa=
a9794be04a5a5e153caba6915336cebac"
> +SRC_URI[thiserror-impl-1.0.40.sha256sum] =3D "f9456a42c5b0d803c8cd86e73d=
d7cc9edd429499f37a3550d286d5e86720569f"
> +SRC_URI[time-0.3.20.sha256sum] =3D "cd0cbfecb4d19b5ea75bb31ad904eb5b9fa1=
3f21079c3b92017ebdf4999a5890"
> +SRC_URI[time-core-0.1.0.sha256sum] =3D "2e153e1f1acaef8acc537e68b44906d2=
db6436e2b35ac2c6b42640fff91f00fd"
> +SRC_URI[time-macros-0.2.8.sha256sum] =3D "fd80a657e71da814b8e5d60d3374fc=
6d35045062245d80224748ae522dd76f36"
> +SRC_URI[tinytemplate-1.2.1.sha256sum] =3D "be4d6b5f19ff7664e8c98d03e2139=
cb510db9b0a60b55f8e8709b689d939b6bc"
> +SRC_URI[tinyvec-1.6.0.sha256sum] =3D "87cc5ceb3875bb20c2890005a4e226a465=
1264a5c75edb2421b52861a0a0cb50"
> +SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D "1f3ccbac311fea05f86f61904b4=
62b55fb3df8837a366dfc601a0161d0532f20"
> +SRC_URI[toml-0.5.11.sha256sum] =3D "f4f7f0dd8d50a853a531c426359045b1998f=
04219d88799810762cd4ad314234"
> +SRC_URI[toml_datetime-0.6.1.sha256sum] =3D "3ab8ed2edee10b50132aed5f3313=
33428b011c99402b5a534154ed15746f9622"
> +SRC_URI[toml_edit-0.19.8.sha256sum] =3D "239410c8609e8125456927e6707163a=
3b1fdb40561e4b803bc041f466ccfdc13"
> +SRC_URI[unicode-bidi-0.3.13.sha256sum] =3D "92888ba5573ff080736b3648696b=
70cafad7d250551175acbaa4e0385b3e1460"
> +SRC_URI[unicode-ident-1.0.8.sha256sum] =3D "e5464a87b239f13a63a501f27015=
65754bae92d243d4bb7eb12f6d57d2269bf4"
> +SRC_URI[unicode-normalization-0.1.22.sha256sum] =3D "5c5713f0fc4b5db668a=
2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
> +SRC_URI[unicode-segmentation-1.10.1.sha256sum] =3D "1dd62409856789511888=
6609431a7c3b8f516e41d30e0643f03d94592a147e36"
> +SRC_URI[url-2.3.1.sha256sum] =3D "0d68c799ae75762b8c3fe375feb6600ef5602c=
883c5d21eb51c09f22b83c4643"
> +SRC_URI[uuid-1.3.0.sha256sum] =3D "1674845326ee10d37ca60470760d4288a6f80=
f304007d92e5c53bab78c9cfd79"
> +SRC_URI[version-compare-0.0.10.sha256sum] =3D "d63556a25bae6ea31b52e640d=
7c41d1ab27faba4ccb600013837a3d0b3994ca1"
> +SRC_URI[version_check-0.9.4.sha256sum] =3D "49874b5167b65d7193b8aba1567f=
5c7d93d001cafc34600cee003eda787e483f"
> +SRC_URI[walkdir-2.3.3.sha256sum] =3D "36df944cda56c7d8d8b7496af378e6b16d=
e9284591917d307c9b4d313c44e698"
> +SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b64a=
3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
> +SRC_URI[wasm-bindgen-0.2.84.sha256sum] =3D "31f8dcbc21f30d9b8f2ea926ecb5=
8f6b91192c17e9d33594b3df58b2007ca53b"
> +SRC_URI[wasm-bindgen-backend-0.2.84.sha256sum] =3D "95ce90fd5bcc06af55a6=
41a86428ee4229e44e07033963a2290a8e241607ccb9"
> +SRC_URI[wasm-bindgen-macro-0.2.84.sha256sum] =3D "4c21f77c0bedc37fd5dc21=
f897894a5ca01e7bb159884559461862ae90c0b4c5"
> +SRC_URI[wasm-bindgen-macro-support-0.2.84.sha256sum] =3D "2aff81306fcac3=
c7515ad4e177f521b5c9a15f2b08f4e32d823066102f35a5f6"
> +SRC_URI[wasm-bindgen-shared-0.2.84.sha256sum] =3D "0046fef7e28c3804e5e38=
bfa31ea2a0f73905319b677e57ebe37e49358989b5d"
> +SRC_URI[web-sys-0.3.61.sha256sum] =3D "e33b99f4b23ba3eec1a53ac264e35a755=
f00e966e0065077d6027c0f575b0b97"
> +SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400abe9=
3992746761e38641405d28b00f419"
> +SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c63620426=
dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> +SRC_URI[winapi-util-0.1.5.sha256sum] =3D "70ec6ce85bb158151cae5e5c87f95a=
8e97d2c0c4b001223f33a334e3ce5de178"
> +SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d05=
7c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> +SRC_URI[winnow-0.4.0.sha256sum] =3D "deac0939bd6e4f24ab5919fbf751c97a8cf=
c8543bb083a305ed5c0c10bb241d1"
> +SRC_URI[zvariant_derive-3.12.0.sha256sum] =3D "34c20260af4b28b3275d6676c=
7e2a6be0d4332e8e0aba4616d34007fd84e462a"
> +SRC_URI[zvariant_utils-1.0.0.sha256sum] =3D "53b22993dbc4d128a17a3b6c92f=
1c63872dd67198537ee728d8b5d7c40640a8b"
> diff --git a/meta-selftest/recipes-extended/zvariant/zvariant-git-crates.=
inc b/meta-selftest/recipes-extended/zvariant/zvariant-git-crates.inc
> new file mode 100644
> index 0000000000..f24cfe8e7c
> --- /dev/null
> +++ b/meta-selftest/recipes-extended/zvariant/zvariant-git-crates.inc
> @@ -0,0 +1,14 @@
> +SRC_URI +=3D "\
> +    git://github.com/gtk-rs/glib;protocol=3Dhttps;nobranch=3D1;name=3Dgl=
ib;destsuffix=3Dglib;type=3Dgit-dependency \
> +    git://github.com/gtk-rs/sys;protocol=3Dhttps;nobranch=3D1;name=3Dgli=
b-sys;destsuffix=3Dglib-sys;subpath=3Dglib-sys;type=3Dgit-dependency \
> +    git://github.com/gtk-rs/sys;protocol=3Dhttps;nobranch=3D1;name=3Dgob=
ject-sys;destsuffix=3Dgobject-sys;subpath=3Dgobject-sys;type=3Dgit-dependen=
cy \
> +"
> +
> +SRCREV_FORMAT .=3D "_glib"
> +SRCREV_glib =3D "c9ee583cea07830c099cdcccd33eda9ef705ea93"
> +
> +SRCREV_FORMAT .=3D "_glib-sys"
> +SRCREV_glib-sys =3D "5f35e26c65d24f8f018f643218de0f5807ba5f01"
> +
> +SRCREV_FORMAT .=3D "_gobject-sys"
> +SRCREV_gobject-sys =3D "5f35e26c65d24f8f018f643218de0f5807ba5f01"
> diff --git a/meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-=
zvariant-crate-config.patch b/meta-selftest/recipes-extended/zvariant/zvari=
ant/0001-Tweak-zvariant-crate-config.patch
> new file mode 100644
> index 0000000000..ac6c5117bb
> --- /dev/null
> +++ b/meta-selftest/recipes-extended/zvariant/zvariant/0001-Tweak-zvarian=
t-crate-config.patch
> @@ -0,0 +1,1292 @@
> +From e85ce4136694899f0010d48f47c5e905c3a9d461 Mon Sep 17 00:00:00 2001
> +From: Frederic Martinsons <frederic.martinsons@gmail.com>
> +Date: Thu, 23 Mar 2023 07:12:37 +0100
> +Subject: [PATCH] Tweak zvariant crate config
> +
> +This library crate is a part of zbus project, and is aimed to
> +be published amongst the whole project.
> +
> +Nevertheless, this recipe is for showing example of real
> +code which uses a local registry via git url inside yocto
> +environment.
> +
> +I didn't find a real example of binary crate that uses git
> +dependency but it seems to me a very common use case
> +when we are working on multiple local crates that are not
> +aimed to be published on public registry.
> +
> +Long story short, this patch add a modified Cargo.toml
> +to use the zvariant_derive dependency from crates.io instead
> +of zbus local one and a pre generated Cargo.lock in order
> +to make cargo patch process inside cargo_common.bbclass work
> +
> +It also copied the LICENCE file from zbus project instead
> +of symlink to it.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> +---
> + zvariant/Cargo.lock | 1198 +++++++++++++++++++++++++++++++++++++++++++
> + zvariant/Cargo.toml |    2 +-
> + zvariant/LICENSE    |   24 +-
> + 3 files changed, 1222 insertions(+), 2 deletions(-)
> + create mode 100644 zvariant/Cargo.lock
> + mode change 120000 =3D> 100644 zvariant/LICENSE
> +
> +diff --git a/zvariant/Cargo.lock b/zvariant/Cargo.lock
> +new file mode 100644
> +index 00000000..02a83d42
> +--- /dev/null
> ++++ b/zvariant/Cargo.lock
> +@@ -0,0 +1,1198 @@
> ++# This file is automatically @generated by Cargo.
> ++# It is not intended for manual editing.
> ++version =3D 3
> ++
> ++[[package]]
> ++name =3D "anes"
> ++version =3D "0.1.6"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e3=
80f7299"
> ++
> ++[[package]]
> ++name =3D "anyhow"
> ++version =3D "1.0.70"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "7de8ce5e0f9f8d88245311066a578d72b7af3e7088f32783804676302=
df237e4"
> ++
> ++[[package]]
> ++name =3D "arrayvec"
> ++version =3D "0.7.2"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea=
54454d6"
> ++dependencies =3D [
> ++ "serde",
> ++]
> ++
> ++[[package]]
> ++name =3D "atty"
> ++version =3D "0.2.14"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a31=
9d5fee8"
> ++dependencies =3D [
> ++ "hermit-abi 0.1.19",
> ++ "libc",
> ++ "winapi",
> ++]
> ++
> ++[[package]]
> ++name =3D "autocfg"
> ++version =3D "1.1.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa431=
61b97fa"
> ++
> ++[[package]]
> ++name =3D "bitflags"
> ++version =3D "1.3.2"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1=
037718a"
> ++
> ++[[package]]
> ++name =3D "bumpalo"
> ++version =3D "3.12.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "0d261e256854913907f67ed06efbc3338dfe6179796deefc1ff763fc1=
aee5535"
> ++
> ++[[package]]
> ++name =3D "byteorder"
> ++version =3D "1.4.3"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d=
3a6a610"
> ++
> ++[[package]]
> ++name =3D "cast"
> ++version =3D "0.3.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd=
7b37eb5"
> ++
> ++[[package]]
> ++name =3D "cfg-if"
> ++version =3D "1.0.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd=
2da40fd"
> ++
> ++[[package]]
> ++name =3D "chrono"
> ++version =3D "0.4.24"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "4e3c5919066adf22df73762e50cffcde3a758f2a848b113b586d1f867=
28b673b"
> ++dependencies =3D [
> ++ "num-integer",
> ++ "num-traits",
> ++ "serde",
> ++]
> ++
> ++[[package]]
> ++name =3D "ciborium"
> ++version =3D "0.2.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "b0c137568cc60b904a7724001b35ce2630fd00d5d84805fbb608ab895=
09d788f"
> ++dependencies =3D [
> ++ "ciborium-io",
> ++ "ciborium-ll",
> ++ "serde",
> ++]
> ++
> ++[[package]]
> ++name =3D "ciborium-io"
> ++version =3D "0.2.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "346de753af073cc87b52b2083a506b38ac176a44cfb05497b622e27be=
899b369"
> ++
> ++[[package]]
> ++name =3D "ciborium-ll"
> ++version =3D "0.2.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "213030a2b5a4e0c0892b6652260cf6ccac84827b83a85a534e178e390=
6c4cf1b"
> ++dependencies =3D [
> ++ "ciborium-io",
> ++ "half",
> ++]
> ++
> ++[[package]]
> ++name =3D "clap"
> ++version =3D "3.2.23"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "71655c45cb9845d3270c9d6df84ebe72b4dad3c2ba3f7023ad47c144e=
4e473a5"
> ++dependencies =3D [
> ++ "bitflags",
> ++ "clap_lex",
> ++ "indexmap",
> ++ "textwrap",
> ++]
> ++
> ++[[package]]
> ++name =3D "clap_lex"
> ++version =3D "0.2.4"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d010345776f9527=
65261c5"
> ++dependencies =3D [
> ++ "os_str_bytes",
> ++]
> ++
> ++[[package]]
> ++name =3D "criterion"
> ++version =3D "0.4.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "e7c76e09c1aae2bc52b3d2f29e13c6572553b30c4aa1b8a49fd70de64=
12654cb"
> ++dependencies =3D [
> ++ "anes",
> ++ "atty",
> ++ "cast",
> ++ "ciborium",
> ++ "clap",
> ++ "criterion-plot",
> ++ "itertools 0.10.5",
> ++ "lazy_static",
> ++ "num-traits",
> ++ "oorandom",
> ++ "plotters",
> ++ "rayon",
> ++ "regex",
> ++ "serde",
> ++ "serde_derive",
> ++ "serde_json",
> ++ "tinytemplate",
> ++ "walkdir",
> ++]
> ++
> ++[[package]]
> ++name =3D "criterion-plot"
> ++version =3D "0.5.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "6b50826342786a51a89e2da3a28f1c32b06e387201bc2d19791f622c6=
73706b1"
> ++dependencies =3D [
> ++ "cast",
> ++ "itertools 0.10.5",
> ++]
> ++
> ++[[package]]
> ++name =3D "crossbeam-channel"
> ++version =3D "0.5.7"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "cf2b3e8478797446514c91ef04bafcb59faba183e621ad488df88983c=
c14128c"
> ++dependencies =3D [
> ++ "cfg-if",
> ++ "crossbeam-utils",
> ++]
> ++
> ++[[package]]
> ++name =3D "crossbeam-deque"
> ++version =3D "0.8.3"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "ce6fd6f855243022dcecf8702fef0c297d4338e226845fe067f6341ad=
9fa0cef"
> ++dependencies =3D [
> ++ "cfg-if",
> ++ "crossbeam-epoch",
> ++ "crossbeam-utils",
> ++]
> ++
> ++[[package]]
> ++name =3D "crossbeam-epoch"
> ++version =3D "0.9.14"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "46bd5f3f85273295a9d14aedfb86f6aadbff6d8f5295c4a9edb08e819=
dcf5695"
> ++dependencies =3D [
> ++ "autocfg",
> ++ "cfg-if",
> ++ "crossbeam-utils",
> ++ "memoffset",
> ++ "scopeguard",
> ++]
> ++
> ++[[package]]
> ++name =3D "crossbeam-utils"
> ++version =3D "0.8.15"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "3c063cd8cc95f5c377ed0d4b49a4b21f632396ff690e8470c29b3359b=
346984b"
> ++dependencies =3D [
> ++ "cfg-if",
> ++]
> ++
> ++[[package]]
> ++name =3D "either"
> ++version =3D "1.8.1"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae3=
1f16d91"
> ++
> ++[[package]]
> ++name =3D "enumflags2"
> ++version =3D "0.7.5"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "e75d4cd21b95383444831539909fbb14b9dc3fdceb2a6f5d36577329a=
1f55ccb"
> ++dependencies =3D [
> ++ "enumflags2_derive",
> ++ "serde",
> ++]
> ++
> ++[[package]]
> ++name =3D "enumflags2_derive"
> ++version =3D "0.7.4"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "f58dc3c5e468259f19f2d46304a6b28f1c3d034442e14b322d2b850e3=
6f6d5ae"
> ++dependencies =3D [
> ++ "proc-macro2",
> ++ "quote",
> ++ "syn 1.0.109",
> ++]
> ++
> ++[[package]]
> ++name =3D "form_urlencoded"
> ++version =3D "1.1.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "a9c384f161156f5260c24a097c56119f9be8c798586aecc13afbcbe7b=
7e26bf8"
> ++dependencies =3D [
> ++ "percent-encoding",
> ++]
> ++
> ++[[package]]
> ++name =3D "futures-channel"
> ++version =3D "0.3.27"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "164713a5a0dcc3e7b4b1ed7d3b433cabc18025386f9339346e8daf159=
63cf7ac"
> ++dependencies =3D [
> ++ "futures-core",
> ++]
> ++
> ++[[package]]
> ++name =3D "futures-core"
> ++version =3D "0.3.27"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "86d7a0c1aa76363dac491de0ee99faf6941128376f1cf96f07db7603b=
7de69dd"
> ++
> ++[[package]]
> ++name =3D "futures-executor"
> ++version =3D "0.3.27"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "1997dd9df74cdac935c76252744c1ed5794fac083242ea4fe77ef3ed6=
0ba0f83"
> ++dependencies =3D [
> ++ "futures-core",
> ++ "futures-task",
> ++ "futures-util",
> ++]
> ++
> ++[[package]]
> ++name =3D "futures-macro"
> ++version =3D "0.3.27"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "3eb14ed937631bd8b8b8977f2c198443447a8355b6e3ca599f38c975e=
5a963b6"
> ++dependencies =3D [
> ++ "proc-macro2",
> ++ "quote",
> ++ "syn 1.0.109",
> ++]
> ++
> ++[[package]]
> ++name =3D "futures-task"
> ++version =3D "0.3.27"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "fd65540d33b37b16542a0438c12e6aeead10d4ac5d05bd3f805b8f35a=
b592879"
> ++
> ++[[package]]
> ++name =3D "futures-util"
> ++version =3D "0.3.27"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "3ef6b17e481503ec85211fed8f39d1970f128935ca1f814cd32ac4a68=
42e84ab"
> ++dependencies =3D [
> ++ "futures-core",
> ++ "futures-macro",
> ++ "futures-task",
> ++ "pin-project-lite",
> ++ "pin-utils",
> ++ "slab",
> ++]
> ++
> ++[[package]]
> ++name =3D "getrandom"
> ++version =3D "0.2.8"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768=
d396b31"
> ++dependencies =3D [
> ++ "cfg-if",
> ++ "libc",
> ++ "wasi",
> ++]
> ++
> ++[[package]]
> ++name =3D "glib"
> ++version =3D "0.10.0"
> ++source =3D "git+https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0#c9ee58=
3cea07830c099cdcccd33eda9ef705ea93"
> ++dependencies =3D [
> ++ "bitflags",
> ++ "futures-channel",
> ++ "futures-core",
> ++ "futures-executor",
> ++ "futures-task",
> ++ "futures-util",
> ++ "glib-macros",
> ++ "glib-sys",
> ++ "gobject-sys",
> ++ "libc",
> ++ "once_cell",
> ++]
> ++
> ++[[package]]
> ++name =3D "glib-macros"
> ++version =3D "0.10.0"
> ++source =3D "git+https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0#c9ee58=
3cea07830c099cdcccd33eda9ef705ea93"
> ++dependencies =3D [
> ++ "anyhow",
> ++ "heck",
> ++ "itertools 0.9.0",
> ++ "proc-macro-crate 0.1.5",
> ++ "proc-macro-error",
> ++ "proc-macro2",
> ++ "quote",
> ++ "syn 1.0.109",
> ++]
> ++
> ++[[package]]
> ++name =3D "glib-sys"
> ++version =3D "0.10.0"
> ++source =3D "git+https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f64321=
8de0f5807ba5f01"
> ++dependencies =3D [
> ++ "libc",
> ++ "system-deps",
> ++]
> ++
> ++[[package]]
> ++name =3D "gobject-sys"
> ++version =3D "0.10.0"
> ++source =3D "git+https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f64321=
8de0f5807ba5f01"
> ++dependencies =3D [
> ++ "glib-sys",
> ++ "libc",
> ++ "system-deps",
> ++]
> ++
> ++[[package]]
> ++name =3D "half"
> ++version =3D "1.8.2"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "eabb4a44450da02c90444cf74558da904edde8fb4e9035a9a6a4e1544=
5af0bd7"
> ++
> ++[[package]]
> ++name =3D "hashbrown"
> ++version =3D "0.12.3"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe82728=
89ac888"
> ++
> ++[[package]]
> ++name =3D "heck"
> ++version =3D "0.3.3"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "6d621efb26863f0e9924c6ac577e8275e5e6b77455db64ffa6c65c904=
e9e132c"
> ++dependencies =3D [
> ++ "unicode-segmentation",
> ++]
> ++
> ++[[package]]
> ++name =3D "hermit-abi"
> ++version =3D "0.1.19"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d9910=
0aaac33"
> ++dependencies =3D [
> ++ "libc",
> ++]
> ++
> ++[[package]]
> ++name =3D "hermit-abi"
> ++version =3D "0.2.6"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47=
d1ae4c7"
> ++dependencies =3D [
> ++ "libc",
> ++]
> ++
> ++[[package]]
> ++name =3D "idna"
> ++version =3D "0.3.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "e14ddfc70884202db2244c223200c204c2bda1bc6e0998d11b5e024d6=
57209e6"
> ++dependencies =3D [
> ++ "unicode-bidi",
> ++ "unicode-normalization",
> ++]
> ++
> ++[[package]]
> ++name =3D "indexmap"
> ++version =3D "1.9.2"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "1885e79c1fc4b10f0e172c475f458b7f7b93061064d98c3293e98c5ba=
0c8b399"
> ++dependencies =3D [
> ++ "autocfg",
> ++ "hashbrown",
> ++]
> ++
> ++[[package]]
> ++name =3D "itertools"
> ++version =3D "0.9.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcf=
ca1d54b"
> ++dependencies =3D [
> ++ "either",
> ++]
> ++
> ++[[package]]
> ++name =3D "itertools"
> ++version =3D "0.10.5"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0=
f2c8473"
> ++dependencies =3D [
> ++ "either",
> ++]
> ++
> ++[[package]]
> ++name =3D "itoa"
> ++version =3D "1.0.6"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e9=
4164ca6"
> ++
> ++[[package]]
> ++name =3D "js-sys"
> ++version =3D "0.3.61"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "445dde2150c55e483f3d8416706b97ec8e8237c307e5b7b4b8dd15e6a=
f2a0730"
> ++dependencies =3D [
> ++ "wasm-bindgen",
> ++]
> ++
> ++[[package]]
> ++name =3D "lazy_static"
> ++version =3D "1.4.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e=
18cc646"
> ++
> ++[[package]]
> ++name =3D "libc"
> ++version =3D "0.2.140"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6=
095f80c"
> ++
> ++[[package]]
> ++name =3D "log"
> ++version =3D "0.4.17"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c09=
5a2382e"
> ++dependencies =3D [
> ++ "cfg-if",
> ++]
> ++
> ++[[package]]
> ++name =3D "memchr"
> ++version =3D "2.5.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fc=
b74566d"
> ++
> ++[[package]]
> ++name =3D "memoffset"
> ++version =3D "0.8.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc1861=
08b8de1"
> ++dependencies =3D [
> ++ "autocfg",
> ++]
> ++
> ++[[package]]
> ++name =3D "num-integer"
> ++version =3D "0.1.45"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f=
7569cd9"
> ++dependencies =3D [
> ++ "autocfg",
> ++ "num-traits",
> ++]
> ++
> ++[[package]]
> ++name =3D "num-traits"
> ++version =3D "0.2.15"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b3=
8c6cdcd"
> ++dependencies =3D [
> ++ "autocfg",
> ++]
> ++
> ++[[package]]
> ++name =3D "num_cpus"
> ++version =3D "1.15.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781bf03a16cd9ac8=
697593b"
> ++dependencies =3D [
> ++ "hermit-abi 0.2.6",
> ++ "libc",
> ++]
> ++
> ++[[package]]
> ++name =3D "once_cell"
> ++version =3D "1.17.1"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "b7e5500299e16ebb147ae15a00a942af264cf3688f47923b8fc2cd585=
8f23ad3"
> ++
> ++[[package]]
> ++name =3D "oorandom"
> ++version =3D "11.1.3"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "0ab1bc2a289d34bd04a330323ac98a1b4bc82c9d9fcb1e66b63caa84d=
a26b575"
> ++
> ++[[package]]
> ++name =3D "os_str_bytes"
> ++version =3D "6.5.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "ceedf44fb00f2d1984b0bc98102627ce622e083e49a5bacdb3e514fa4=
238e267"
> ++
> ++[[package]]
> ++name =3D "percent-encoding"
> ++version =3D "2.2.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "478c572c3d73181ff3c2539045f6eb99e5491218eae919370993b890c=
dbdd98e"
> ++
> ++[[package]]
> ++name =3D "pin-project-lite"
> ++version =3D "0.2.9"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0=
afac116"
> ++
> ++[[package]]
> ++name =3D "pin-utils"
> ++version =3D "0.1.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf=
7c9f184"
> ++
> ++[[package]]
> ++name =3D "pkg-config"
> ++version =3D "0.3.26"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5=
b305160"
> ++
> ++[[package]]
> ++name =3D "plotters"
> ++version =3D "0.3.4"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "2538b639e642295546c50fcd545198c9d64ee2a38620a628724a3b266=
d5fbf97"
> ++dependencies =3D [
> ++ "num-traits",
> ++ "plotters-backend",
> ++ "plotters-svg",
> ++ "wasm-bindgen",
> ++ "web-sys",
> ++]
> ++
> ++[[package]]
> ++name =3D "plotters-backend"
> ++version =3D "0.3.4"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "193228616381fecdc1224c62e96946dfbc73ff4384fba576e052ff8c1=
bea8142"
> ++
> ++[[package]]
> ++name =3D "plotters-svg"
> ++version =3D "0.3.3"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "f9a81d2759aae1dae668f783c308bc5c8ebd191ff4184aaa1b37f65a6=
ae5a56f"
> ++dependencies =3D [
> ++ "plotters-backend",
> ++]
> ++
> ++[[package]]
> ++name =3D "ppv-lite86"
> ++version =3D "0.2.17"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4=
479e6de"
> ++
> ++[[package]]
> ++name =3D "proc-macro-crate"
> ++version =3D "0.1.5"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "1d6ea3c4595b96363c13943497db34af4460fb474a95c43f4446ad341=
b8c9785"
> ++dependencies =3D [
> ++ "toml",
> ++]
> ++
> ++[[package]]
> ++name =3D "proc-macro-crate"
> ++version =3D "1.3.1"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65c=
a0c3919"
> ++dependencies =3D [
> ++ "once_cell",
> ++ "toml_edit",
> ++]
> ++
> ++[[package]]
> ++name =3D "proc-macro-error"
> ++version =3D "1.0.4"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73=
a5ce38c"
> ++dependencies =3D [
> ++ "proc-macro-error-attr",
> ++ "proc-macro2",
> ++ "quote",
> ++ "syn 1.0.109",
> ++ "version_check",
> ++]
> ++
> ++[[package]]
> ++name =3D "proc-macro-error-attr"
> ++version =3D "1.0.4"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274=
b35f869"
> ++dependencies =3D [
> ++ "proc-macro2",
> ++ "quote",
> ++ "version_check",
> ++]
> ++
> ++[[package]]
> ++name =3D "proc-macro2"
> ++version =3D "1.0.53"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "ba466839c78239c09faf015484e5cc04860f88242cff4d03eb038f04b=
4699b73"
> ++dependencies =3D [
> ++ "unicode-ident",
> ++]
> ++
> ++[[package]]
> ++name =3D "quote"
> ++version =3D "1.0.26"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "4424af4bf778aae2051a77b60283332f386554255d722233d09fbfc7e=
30da2fc"
> ++dependencies =3D [
> ++ "proc-macro2",
> ++]
> ++
> ++[[package]]
> ++name =3D "rand"
> ++version =3D "0.8.5"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b4=
6327404"
> ++dependencies =3D [
> ++ "libc",
> ++ "rand_chacha",
> ++ "rand_core",
> ++]
> ++
> ++[[package]]
> ++name =3D "rand_chacha"
> ++version =3D "0.3.1"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9=
b127d88"
> ++dependencies =3D [
> ++ "ppv-lite86",
> ++ "rand_core",
> ++]
> ++
> ++[[package]]
> ++name =3D "rand_core"
> ++version =3D "0.6.4"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c=
816922c"
> ++dependencies =3D [
> ++ "getrandom",
> ++]
> ++
> ++[[package]]
> ++name =3D "rayon"
> ++version =3D "1.7.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "1d2df5196e37bcc87abebc0053e20787d73847bb33134a69841207dd0=
a47f03b"
> ++dependencies =3D [
> ++ "either",
> ++ "rayon-core",
> ++]
> ++
> ++[[package]]
> ++name =3D "rayon-core"
> ++version =3D "1.11.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "4b8f95bd6966f5c87776639160a66bd8ab9895d9d4ab01ddba9fc6066=
1aebe8d"
> ++dependencies =3D [
> ++ "crossbeam-channel",
> ++ "crossbeam-deque",
> ++ "crossbeam-utils",
> ++ "num_cpus",
> ++]
> ++
> ++[[package]]
> ++name =3D "regex"
> ++version =3D "1.7.2"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "cce168fea28d3e05f158bda4576cf0c844d5045bc2cc3620fa0292ed5=
bb5814c"
> ++dependencies =3D [
> ++ "regex-syntax",
> ++]
> ++
> ++[[package]]
> ++name =3D "regex-syntax"
> ++version =3D "0.6.29"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537=
722f2e1"
> ++
> ++[[package]]
> ++name =3D "ryu"
> ++version =3D "1.0.13"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "f91339c0467de62360649f8d3e185ca8de4224ff281f66000de5eb2a7=
7a79041"
> ++
> ++[[package]]
> ++name =3D "same-file"
> ++version =3D "1.0.6"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b6837=
8900502"
> ++dependencies =3D [
> ++ "winapi-util",
> ++]
> ++
> ++[[package]]
> ++name =3D "scopeguard"
> ++version =3D "1.1.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20=
baa78cd"
> ++
> ++[[package]]
> ++name =3D "serde"
> ++version =3D "1.0.158"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "771d4d9c4163ee138805e12c710dd365e4f44be8be0503cb1bb9eb989=
425d9c9"
> ++dependencies =3D [
> ++ "serde_derive",
> ++]
> ++
> ++[[package]]
> ++name =3D "serde_bytes"
> ++version =3D "0.11.9"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "416bda436f9aab92e02c8e10d49a15ddd339cea90b6e340fe51ed97ab=
b548294"
> ++dependencies =3D [
> ++ "serde",
> ++]
> ++
> ++[[package]]
> ++name =3D "serde_derive"
> ++version =3D "1.0.158"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "e801c1712f48475582b7696ac71e0ca34ebb30e09338425384269d971=
7c62cad"
> ++dependencies =3D [
> ++ "proc-macro2",
> ++ "quote",
> ++ "syn 2.0.8",
> ++]
> ++
> ++[[package]]
> ++name =3D "serde_json"
> ++version =3D "1.0.94"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "1c533a59c9d8a93a09c6ab31f0fd5e5f4dd1b8fc94348040298398847=
65d04ea"
> ++dependencies =3D [
> ++ "itoa",
> ++ "ryu",
> ++ "serde",
> ++]
> ++
> ++[[package]]
> ++name =3D "serde_repr"
> ++version =3D "0.1.12"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "bcec881020c684085e55a25f7fd888954d56609ef363479dc5a1305eb=
0d40cab"
> ++dependencies =3D [
> ++ "proc-macro2",
> ++ "quote",
> ++ "syn 2.0.8",
> ++]
> ++
> ++[[package]]
> ++name =3D "slab"
> ++version =3D "0.4.8"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "6528351c9bc8ab22353f9d776db39a20288e8d6c37ef8cfe3317cf875=
eecfc2d"
> ++dependencies =3D [
> ++ "autocfg",
> ++]
> ++
> ++[[package]]
> ++name =3D "static_assertions"
> ++version =3D "1.1.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06=
b37543f"
> ++
> ++[[package]]
> ++name =3D "strum"
> ++version =3D "0.18.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "57bd81eb48f4c437cadc685403cad539345bf703d78e63707418431ce=
cd4522b"
> ++
> ++[[package]]
> ++name =3D "strum_macros"
> ++version =3D "0.18.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "87c85aa3f8ea653bfd3ddf25f7ee357ee4d204731f6aa9ad04002306f=
6e2774c"
> ++dependencies =3D [
> ++ "heck",
> ++ "proc-macro2",
> ++ "quote",
> ++ "syn 1.0.109",
> ++]
> ++
> ++[[package]]
> ++name =3D "syn"
> ++version =3D "1.0.109"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d01608=
88b4237"
> ++dependencies =3D [
> ++ "proc-macro2",
> ++ "quote",
> ++ "unicode-ident",
> ++]
> ++
> ++[[package]]
> ++name =3D "syn"
> ++version =3D "2.0.8"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "bcc02725fd69ab9f26eab07fad303e2497fad6fb9eba4f96c4d1687bd=
f704ad9"
> ++dependencies =3D [
> ++ "proc-macro2",
> ++ "quote",
> ++ "unicode-ident",
> ++]
> ++
> ++[[package]]
> ++name =3D "system-deps"
> ++version =3D "1.3.2"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "0f3ecc17269a19353b3558b313bba738b25d82993e30d62a18406a24a=
ba4649b"
> ++dependencies =3D [
> ++ "heck",
> ++ "pkg-config",
> ++ "strum",
> ++ "strum_macros",
> ++ "thiserror",
> ++ "toml",
> ++ "version-compare",
> ++]
> ++
> ++[[package]]
> ++name =3D "textwrap"
> ++version =3D "0.16.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451fd7d0129=
c9c7c3d"
> ++
> ++[[package]]
> ++name =3D "thiserror"
> ++version =3D "1.0.40"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153caba69153=
36cebac"
> ++dependencies =3D [
> ++ "thiserror-impl",
> ++]
> ++
> ++[[package]]
> ++name =3D "thiserror-impl"
> ++version =3D "1.0.40"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d286d5e86=
720569f"
> ++dependencies =3D [
> ++ "proc-macro2",
> ++ "quote",
> ++ "syn 2.0.8",
> ++]
> ++
> ++[[package]]
> ++name =3D "time"
> ++version =3D "0.3.20"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "cd0cbfecb4d19b5ea75bb31ad904eb5b9fa13f21079c3b92017ebdf49=
99a5890"
> ++dependencies =3D [
> ++ "serde",
> ++ "time-core",
> ++ "time-macros",
> ++]
> ++
> ++[[package]]
> ++name =3D "time-core"
> ++version =3D "0.1.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "2e153e1f1acaef8acc537e68b44906d2db6436e2b35ac2c6b42640fff=
91f00fd"
> ++
> ++[[package]]
> ++name =3D "time-macros"
> ++version =3D "0.2.8"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "fd80a657e71da814b8e5d60d3374fc6d35045062245d80224748ae522=
dd76f36"
> ++dependencies =3D [
> ++ "time-core",
> ++]
> ++
> ++[[package]]
> ++name =3D "tinytemplate"
> ++version =3D "1.2.1"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d=
939b6bc"
> ++dependencies =3D [
> ++ "serde",
> ++ "serde_json",
> ++]
> ++
> ++[[package]]
> ++name =3D "tinyvec"
> ++version =3D "1.6.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a=
0a0cb50"
> ++dependencies =3D [
> ++ "tinyvec_macros",
> ++]
> ++
> ++[[package]]
> ++name =3D "tinyvec_macros"
> ++version =3D "0.1.1"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d=
0532f20"
> ++
> ++[[package]]
> ++name =3D "toml"
> ++version =3D "0.5.11"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4a=
d314234"
> ++dependencies =3D [
> ++ "serde",
> ++]
> ++
> ++[[package]]
> ++name =3D "toml_datetime"
> ++version =3D "0.6.1"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "3ab8ed2edee10b50132aed5f331333428b011c99402b5a534154ed157=
46f9622"
> ++
> ++[[package]]
> ++name =3D "toml_edit"
> ++version =3D "0.19.8"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "239410c8609e8125456927e6707163a3b1fdb40561e4b803bc041f466=
ccfdc13"
> ++dependencies =3D [
> ++ "indexmap",
> ++ "toml_datetime",
> ++ "winnow",
> ++]
> ++
> ++[[package]]
> ++name =3D "unicode-bidi"
> ++version =3D "0.3.13"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385=
b3e1460"
> ++
> ++[[package]]
> ++name =3D "unicode-ident"
> ++version =3D "1.0.8"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d=
2269bf4"
> ++
> ++[[package]]
> ++name =3D "unicode-normalization"
> ++version =3D "0.1.22"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0c=
e2ba921"
> ++dependencies =3D [
> ++ "tinyvec",
> ++]
> ++
> ++[[package]]
> ++name =3D "unicode-segmentation"
> ++version =3D "1.10.1"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "1dd624098567895118886609431a7c3b8f516e41d30e0643f03d94592=
a147e36"
> ++
> ++[[package]]
> ++name =3D "url"
> ++version =3D "2.3.1"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "0d68c799ae75762b8c3fe375feb6600ef5602c883c5d21eb51c09f22b=
83c4643"
> ++dependencies =3D [
> ++ "form_urlencoded",
> ++ "idna",
> ++ "percent-encoding",
> ++ "serde",
> ++]
> ++
> ++[[package]]
> ++name =3D "uuid"
> ++version =3D "1.3.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "1674845326ee10d37ca60470760d4288a6f80f304007d92e5c53bab78=
c9cfd79"
> ++dependencies =3D [
> ++ "serde",
> ++]
> ++
> ++[[package]]
> ++name =3D "version-compare"
> ++version =3D "0.0.10"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "d63556a25bae6ea31b52e640d7c41d1ab27faba4ccb600013837a3d0b=
3994ca1"
> ++
> ++[[package]]
> ++name =3D "version_check"
> ++version =3D "0.9.4"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda7=
87e483f"
> ++
> ++[[package]]
> ++name =3D "walkdir"
> ++version =3D "2.3.3"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "36df944cda56c7d8d8b7496af378e6b16de9284591917d307c9b4d313=
c44e698"
> ++dependencies =3D [
> ++ "same-file",
> ++ "winapi-util",
> ++]
> ++
> ++[[package]]
> ++name =3D "wasi"
> ++version =3D "0.11.0+wasi-snapshot-preview1"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7=
987e423"
> ++
> ++[[package]]
> ++name =3D "wasm-bindgen"
> ++version =3D "0.2.84"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "31f8dcbc21f30d9b8f2ea926ecb58f6b91192c17e9d33594b3df58b20=
07ca53b"
> ++dependencies =3D [
> ++ "cfg-if",
> ++ "wasm-bindgen-macro",
> ++]
> ++
> ++[[package]]
> ++name =3D "wasm-bindgen-backend"
> ++version =3D "0.2.84"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "95ce90fd5bcc06af55a641a86428ee4229e44e07033963a2290a8e241=
607ccb9"
> ++dependencies =3D [
> ++ "bumpalo",
> ++ "log",
> ++ "once_cell",
> ++ "proc-macro2",
> ++ "quote",
> ++ "syn 1.0.109",
> ++ "wasm-bindgen-shared",
> ++]
> ++
> ++[[package]]
> ++name =3D "wasm-bindgen-macro"
> ++version =3D "0.2.84"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "4c21f77c0bedc37fd5dc21f897894a5ca01e7bb159884559461862ae9=
0c0b4c5"
> ++dependencies =3D [
> ++ "quote",
> ++ "wasm-bindgen-macro-support",
> ++]
> ++
> ++[[package]]
> ++name =3D "wasm-bindgen-macro-support"
> ++version =3D "0.2.84"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "2aff81306fcac3c7515ad4e177f521b5c9a15f2b08f4e32d823066102=
f35a5f6"
> ++dependencies =3D [
> ++ "proc-macro2",
> ++ "quote",
> ++ "syn 1.0.109",
> ++ "wasm-bindgen-backend",
> ++ "wasm-bindgen-shared",
> ++]
> ++
> ++[[package]]
> ++name =3D "wasm-bindgen-shared"
> ++version =3D "0.2.84"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "0046fef7e28c3804e5e38bfa31ea2a0f73905319b677e57ebe37e4935=
8989b5d"
> ++
> ++[[package]]
> ++name =3D "web-sys"
> ++version =3D "0.3.61"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "e33b99f4b23ba3eec1a53ac264e35a755f00e966e0065077d6027c0f5=
75b0b97"
> ++dependencies =3D [
> ++ "js-sys",
> ++ "wasm-bindgen",
> ++]
> ++
> ++[[package]]
> ++name =3D "winapi"
> ++version =3D "0.3.9"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28=
b00f419"
> ++dependencies =3D [
> ++ "winapi-i686-pc-windows-gnu",
> ++ "winapi-x86_64-pc-windows-gnu",
> ++]
> ++
> ++[[package]]
> ++name =3D "winapi-i686-pc-windows-gnu"
> ++version =3D "0.4.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6a=
b51b7b6"
> ++
> ++[[package]]
> ++name =3D "winapi-util"
> ++version =3D "0.1.5"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3c=
e5de178"
> ++dependencies =3D [
> ++ "winapi",
> ++]
> ++
> ++[[package]]
> ++name =3D "winapi-x86_64-pc-windows-gnu"
> ++version =3D "0.4.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1=
931183f"
> ++
> ++[[package]]
> ++name =3D "winnow"
> ++version =3D "0.4.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "deac0939bd6e4f24ab5919fbf751c97a8cfc8543bb083a305ed5c0c10=
bb241d1"
> ++dependencies =3D [
> ++ "memchr",
> ++]
> ++
> ++[[package]]
> ++name =3D "zvariant"
> ++version =3D "3.12.0"
> ++dependencies =3D [
> ++ "arrayvec",
> ++ "byteorder",
> ++ "chrono",
> ++ "criterion",
> ++ "enumflags2",
> ++ "glib",
> ++ "libc",
> ++ "rand",
> ++ "serde",
> ++ "serde_bytes",
> ++ "serde_json",
> ++ "serde_repr",
> ++ "static_assertions",
> ++ "time",
> ++ "url",
> ++ "uuid",
> ++ "zvariant_derive",
> ++]
> ++
> ++[[package]]
> ++name =3D "zvariant_derive"
> ++version =3D "3.12.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "34c20260af4b28b3275d6676c7e2a6be0d4332e8e0aba4616d34007fd=
84e462a"
> ++dependencies =3D [
> ++ "proc-macro-crate 1.3.1",
> ++ "proc-macro2",
> ++ "quote",
> ++ "syn 1.0.109",
> ++ "zvariant_utils",
> ++]
> ++
> ++[[package]]
> ++name =3D "zvariant_utils"
> ++version =3D "1.0.0"
> ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> ++checksum =3D "53b22993dbc4d128a17a3b6c92f1c63872dd67198537ee728d8b5d7c4=
0640a8b"
> ++dependencies =3D [
> ++ "proc-macro2",
> ++ "quote",
> ++ "syn 1.0.109",
> ++]
> +diff --git a/zvariant/Cargo.toml b/zvariant/Cargo.toml
> +index 45367729..6981862a 100644
> +--- a/zvariant/Cargo.toml
> ++++ b/zvariant/Cargo.toml
> +@@ -27,7 +27,7 @@ byteorder =3D "1.4.3"
> + serde =3D { version =3D "1.0", features =3D ["derive"] }
> + arrayvec =3D { version =3D "0.7.2", features =3D ["serde"], optional =
=3D true }
> + enumflags2 =3D { version =3D "0.7.5", features =3D ["serde"], optional =
=3D true }
> +-zvariant_derive =3D { version =3D "=3D3.12.0", path =3D "../zvariant_de=
rive" }
> ++zvariant_derive =3D "3.12.0"
> + serde_bytes =3D { version =3D "0.11", optional =3D true }
> + static_assertions =3D "1.1.0"
> + libc =3D "0.2.137"
> +diff --git a/zvariant/LICENSE b/zvariant/LICENSE
> +deleted file mode 120000
> +index ea5b6064..00000000
> +--- a/zvariant/LICENSE
> ++++ /dev/null
> +@@ -1 +0,0 @@
> +-../LICENSE
> +\ No newline at end of file
> +diff --git a/zvariant/LICENSE b/zvariant/LICENSE
> +new file mode 100644
> +index 00000000..31aa7938
> +--- /dev/null
> ++++ b/zvariant/LICENSE
> +@@ -0,0 +1,23 @@
> ++Permission is hereby granted, free of charge, to any
> ++person obtaining a copy of this software and associated
> ++documentation files (the "Software"), to deal in the
> ++Software without restriction, including without
> ++limitation the rights to use, copy, modify, merge,
> ++publish, distribute, sublicense, and/or sell copies of
> ++the Software, and to permit persons to whom the Software
> ++is furnished to do so, subject to the following
> ++conditions:
> ++
> ++The above copyright notice and this permission notice
> ++shall be included in all copies or substantial portions
> ++of the Software.
> ++
> ++THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF
> ++ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
> ++TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
> ++PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> ++SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> ++CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> ++OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
> ++IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> ++DEALINGS IN THE SOFTWARE.
> +--=20
> +2.34.1
> +
> diff --git a/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb b=
/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
> new file mode 100644
> index 0000000000..ae66cea390
> --- /dev/null
> +++ b/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "Provides API for encoding/decoding of data to/from D-Bus wi=
re format"
> +DESCRIPTION =3D "This crate provides API for encoding/decoding of data t=
o/from D-Bus wire format.\
> +This binary wire format is simple and very efficient and hence useful ou=
tside of D-Bus context as well.\
> +A modified form of this format, GVariant is very commonly used for effic=
ient storage of arbitrary \
> +data and is also supported by this crate."
> +HOMEPAGE =3D "https://gitlab.freedesktop.org/dbus/zbus/"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db377b220f43d747efdec40d69fcaa=
69d"
> +
> +SRC_URI =3D " \
> +    git://gitlab.freedesktop.org/dbus/zbus;protocol=3Dhttps;branch=3Dmai=
n;subpath=3Dzvariant \
> +    file://0001-Tweak-zvariant-crate-config.patch;striplevel=3D2 \
> +"
> +
> +SRCREV =3D "07506776fab5f58e029760bb4b288f670c7eecd6"
> +S =3D "${WORKDIR}/zvariant"
> +
> +python do_clean_lic_file_symlink() {
> +    bb.utils.remove("LICENCE")
> +}
> +
> +addtask clean_lic_file_symlink after do_unpack before do_patch
> +
> +inherit cargo cargo-update-recipe-crates
> +
> +require ${BPN}-crates.inc
> +require ${BPN}-git-crates.inc
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
> index 81d02017c1..94873fd19f 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -848,6 +848,99 @@ class DevtoolModifyTests(DevtoolBase):
>          # Try building
>          bitbake(testrecipe)
> =20
> +    def test_devtool_modify_git_crates_subpath(self):
> +        # This tests two things in devtool context:
> +        #   - that we support local git dependencies for cargo based rec=
ipe
> +        #   - that we support patches in SRC_URI when git url contains s=
ubpath parameter
> +
> +        # Check preconditions:
> +        #    recipe inherits cargo
> +        #    git:// uri with a subpath as the main package
> +        #    some crate:// in SRC_URI
> +        #    others git:// in SRC_URI
> +        #    cointains a patch
> +        testrecipe =3D 'zvariant'
> +        bb_vars =3D get_bb_vars(['SRC_URI', 'FILE', 'WORKDIR', 'CARGO_HO=
ME'], testrecipe)
> +        recipefile =3D bb_vars['FILE']
> +        workdir =3D bb_vars['WORKDIR']
> +        cargo_home =3D bb_vars['CARGO_HOME']
> +        src_uri =3D bb_vars['SRC_URI'].split()
> +        self.assertTrue(src_uri[0].startswith('git://'),
> +                        'This test expects the %s recipe to have a git r=
epo has its main uri' % testrecipe)
> +        self.assertIn(';subpath=3D', src_uri[0],
> +                      'This test expects the %s recipe to have a git uri=
 with subpath' % testrecipe)
> +        self.assertTrue(any([uri.startswith('crate://') for uri in src_u=
ri]),
> +                        'This test expects the %s recipe to have some cr=
ates in its src uris' % testrecipe)
> +        self.assertGreater(sum(map(lambda x:x.startswith('git://'), src_=
uri)), 2,
> +                           'This test expects the %s recipe to have seve=
ral git:// uris' % testrecipe)
> +        self.assertTrue(any([uri.startswith('file://') and '.patch' in u=
ri for uri in src_uri]),
> +                        'This test expects the %s recipe to have a patch=
 in its src uris' % testrecipe)
> +
> +        self._test_recipe_contents(recipefile, {}, ['cargo'])
> +
> +        # Clean up anything in the workdir/sysroot/sstate cache
> +        bitbake('%s -c cleansstate' % testrecipe)
> +        # Try modifying a recipe
> +        tempdir =3D tempfile.mkdtemp(prefix=3D'devtoolqa')
> +        self.track_for_cleanup(tempdir)
> +        self.track_for_cleanup(self.workspacedir)
> +        self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
> +        self.add_command_to_tearDown('bitbake-layers remove-layer */work=
space')
> +        result =3D runCmd('devtool modify %s -x %s' % (testrecipe, tempd=
ir))
> +        self.assertExists(os.path.join(tempdir, 'Cargo.toml'), 'Extracte=
d source could not be found')
> +        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer=
.conf'), 'Workspace directory not created. devtool output: %s' % result.out=
put)
> +        matches =3D glob.glob(os.path.join(self.workspacedir, 'appends',=
 'zvariant_*.bbappend'))
> +        self.assertTrue(matches, 'bbappend not created')
> +        # Test devtool status
> +        result =3D runCmd('devtool status')
> +        self.assertIn(testrecipe, result.output)
> +        self.assertIn(tempdir, result.output)
> +        # Check git repo
> +        self._check_src_repo(tempdir)
> +        # Check that the patch is correctly applied
> +        # last commit message in the tree must contain
> +        # %% original patch: <patchname>
> +        # ..
> +        patchname =3D None
> +        for uri in src_uri:
> +            if uri.startswith('file://') and '.patch' in uri:
> +                patchname =3D uri.replace("file://", "").partition('.pat=
ch')[0] + '.patch'
> +        self.assertIsNotNone(patchname)
> +        result =3D runCmd('git -C %s log -1' % tempdir)
> +        self.assertIn("%%%% original patch: %s" % patchname, result.outp=
ut)
> +
> +        # Configure the recipe to check that the git dependencies are co=
rrectly patched in cargo config
> +        bitbake('-c configure %s' % testrecipe)
> +
> +        cargo_config_path =3D os.path.join(cargo_home, 'config')
> +        with open(cargo_config_path, "r") as f:
> +            cargo_config_contents =3D [line.strip('\n') for line in f.re=
adlines()]
> +
> +        # Get back git dependencies of the recipe (ignoring the main one=
)
> +        # and check that they are all correctly patched to be fetched lo=
cally
> +        git_deps =3D [uri for uri in src_uri if uri.startswith("git://")=
][1:]
> +        for git_dep in git_deps:
> +            raw_url, _, raw_parms =3D git_dep.partition(";")
> +            parms =3D {}
> +            for parm in raw_parms.split(";"):
> +                name_parm, _, value_parm =3D parm.partition('=3D')
> +                parms[name_parm]=3Dvalue_parm
> +            self.assertIn('protocol', parms, 'git dependencies uri shoul=
d contain the "protocol" parameter')
> +            self.assertIn('name', parms, 'git dependencies uri should co=
ntain the "name" parameter')
> +            self.assertIn('destsuffix', parms, 'git dependencies uri sho=
uld contain the "destsuffix" parameter')
> +            self.assertIn('type', parms, 'git dependencies uri should co=
ntain the "type" parameter')
> +            self.assertEqual(parms['type'], 'git-dependency', 'git depen=
dencies uri should have "type=3Dgit-dependency"')
> +            raw_url =3D raw_url.replace("git://", '%s://' % parms['proto=
col'])
> +            patch_line =3D '[patch."%s"]' % raw_url
> +            path_patched =3D os.path.join(workdir, parms['destsuffix'])
> +            path_override_line =3D '%s =3D { path =3D "%s" }' % (parms['=
name'], path_patched)
> +            # Would have been better to use tomllib to read this file :/
> +            self.assertIn(patch_line, cargo_config_contents)
> +            self.assertIn(path_override_line, cargo_config_contents)
> +
> +        # Try to package the recipe
> +        bitbake('-c package_qa %s' % testrecipe)
> +
>      def test_devtool_modify_localfiles(self):
>          # Check preconditions
>          testrecipe =3D 'lighttpd'

Running this through testing revealed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2643/ste=
ps/12/logs/stdio

which in more detail is:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230331-65jkdy_=
c/packages/diff-html/

i.e. the rmeta section of the libzvariant.rlib file doesn't look to be
reproducible.

We do have other reproducibility issues in rust and had to exclude some
packages from the test because of this. We do want to resolve those
issues though.

Cheers,

Richard




