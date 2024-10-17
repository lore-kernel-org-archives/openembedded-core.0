Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D384DD2124E
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:45:53 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.44623.1729154751357088826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eXlKoBdS;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso8355371fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729154749; x=1729759549; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=suvXEpXzvlW7mVZES2nig17ooTxhXg1cM9HPIekI4I0=;
        b=eXlKoBdSaV1V6XIDU5OO7xHqnf56PE1PdtWtGYa09E2+jdjuOzKqbkuldi9tm36ABP
         hTlm19NuwSRp7Ah6TzwgT7OV/K5XuXP6nHIjQNMh4YyklAe9j8d1Xzzj5rOJu1sRashf
         +pYpQomaQWnJdCz5GbJ+tMVdB908xRtm0Pj8crGrCiBTZPHEqJE4QNCNS4QHePQcCp/p
         0hNntVosseiTTbc1N5hXFa3vy3Sjhqa/E6hxucmI7PrYFW/8YaRJ8vuTXEAB9gpzoQxF
         +78ri/nMgRHbOtAbRR/F/hnLDMESK5Y7gNRJ/OOSc/+/6moPNA2Ps1j7egfyXf7VQau4
         Jmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154749; x=1729759549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suvXEpXzvlW7mVZES2nig17ooTxhXg1cM9HPIekI4I0=;
        b=OtBrWqeexbJnOjC0HiMGWOEkRex3gvpCDHK9GrQb1Qg/xEmPZamqIYUxBDx02kFkHQ
         W5c7gC4EnWXg2jrIuCVNTaWJfFs8/Ry3laWT4JqzKnT5+22fFMyMT3Wdpkx8wtdRhXao
         BFylT/2OC0JoYtmRYasnzxq5KMxce0Z01kKJ2gI9YbGaQcnz477sJHy2AeuGOeFL+GI3
         DqFxJN0tf8UBvs1IGrzUm91HaE2Na7LqoZugxL+ShbIlMqPU/mmHzdac5L5YsV+tpae1
         OhSmb1f8XK+LODtI5S9Bwsh0WQ6CHGggEvOwIIweh9D9QHp+jWe6iuEBQtDTQurv8VjK
         yC1Q==
X-Gm-Message-State: AOJu0YxUa3QZ3rvs+4OnIsCt6usHA4QVj2je+LyIN3Ch4rgxniUX6QUc
	uSLYmVkEV2GuzD3bp1FXRPtlM9pQhTFV8ZETc1QxJaPfapJhoDgmynr1Azv7FlOirjrSXNmn5ny
	h+3b/8SZJNl+UBhvfpJIEtDaaoE8=
X-Google-Smtp-Source: AGHT+IFJJq3iq7HxoIXIUI+1HNXANjfvq3eLGeVkOU4Y21m1MIkTkEI3Ix0+1F7MepUNJeA9gB/3jwdOEW0jr1yHbhA=
X-Received: by 2002:a2e:bc26:0:b0:2fb:4ff6:eb0d with SMTP id
 38308e7fff4ca-2fb61b5d5bcmr41583561fa.22.1729154749040; Thu, 17 Oct 2024
 01:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241014221636.1276264-2-t.f.g.geelen@gmail.com>
In-Reply-To: <20241014221636.1276264-2-t.f.g.geelen@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Oct 2024 10:45:37 +0200
Message-ID: <CANNYZj_Qe0rLCwh2afnGiqJx=eqp+_bTYLTQLUDFsd8n-+WDrg@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH v3] python3-cryptography: upgrade 42.0.8
 -> 43.0.1
To: t.f.g.geelen@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:45:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205994

On Tue, 15 Oct 2024 at 00:17, Tom Geelen via lists.openembedded.org
<t.f.g.geelen=gmail.com@lists.openembedded.org> wrote:
> --- a/meta/recipes-devtools/python/python3-cryptography_42.0.8.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography_43.0.1.bb
> @@ -8,43 +8,21 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
>                     "
>  LDSHARED += "-pthread"
>
> -SRC_URI[sha256sum] = "8d09d05439ce7baa8e9e95b07ec5b6c886f548deb7e0f69ef25f64b3bce842f2"
> -
> -SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
> -            file://check-memfree.py \
> -            file://run-ptest \
> -           "
> -
> -require ${BPN}-crates.inc
> -
> -inherit pypi python_setuptools3_rust cargo-update-recipe-crates pkgconfig
> -
> -DEPENDS += " \
> +DEPENDS += "\
>      python3-cffi-native \
>  "
>
> -RDEPENDS:${PN} += " \
> -    python3-cffi \
> -"
> +SRC_URI[sha256sum] = "203e92a75716d8cfb491dc47c79e17d0d9207ccffcbcb35f598fbe463ae3444d"
>
> -RDEPENDS:${PN}:append:class-target = " \
> -    python3-numbers \
> -    python3-threading \
> +SRC_URI:append = " \
> +    file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
> +    file://check-memfree.py \
> +    file://run-ptest \
>  "
>
> -RDEPENDS:${PN}-ptest += " \
> -    python3-bcrypt \
> -    python3-cryptography-vectors (= ${PV}) \
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
> @@ -60,8 +38,27 @@ do_install_ptest() {
>      cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
>  }
>
> -FILES:${PN}-dbg += " \
> +FILES:${PN}-dbg += "\
>      ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
>  "
>
> +RDEPENDS:${PN} += "\
> +    python3-cffi \
> +"
> +
> +RDEPENDS:${PN}:append:class-target = " \
> +    python3-numbers \
> +    python3-threading \
> +"
> +
> +RDEPENDS:${PN}-ptest += "\
> +    python3-certifi \
> +    python3-cryptography-vectors (= ${PV}) \
> +    python3-mmap \
> +    python3-pretend \
> +    python3-pytest \
> +    python3-pytest-subtests \
> +    python3-unittest-automake-output \
> +"
> +
>  BBCLASSEXTEND = "native nativesdk"

The patch is rearranging lines in the recipe, changing whitespace, and
replacing SRC_URI += with SRC_URI:append. Those things are both
unnecessary and make actual changes difficult to spot and review. If
you must do them, they should come in their own commits.

Alex

