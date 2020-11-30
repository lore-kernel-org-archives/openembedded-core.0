Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web09.60418.1606745462234943544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 06:11:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=EahTPHuc;
 spf=pass (domain: burtonini.com, ip: 209.85.167.67, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f67.google.com with SMTP id u18so21858301lfd.9
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 06:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tqUhbf3D4Xs94VKycC7lpVJyW8zSu4jAK4cxAajABlw=;
        b=EahTPHucchlrBJrNanN3f7fa6hESHQn2QUhWZNUrT1OC4Mun1Xfd1jnJRhJGx/fxno
         P85BhLwlFlB+nrWt0g9+Vr1j2XrmbLd69Y2Lpgb8Z6HTgIRLVzD/ADWBcxB5Y+sjZixk
         KwTtJFsmYQjjVP8JBaal+Sb+oy/3v021PcTV/rcBg2KIN2e3xF2u2DpCprjN2xQ1S8kt
         RSjX2zgp6EvWvHAjRy1Lst3NO6Ey+doJhOJ/m1gpZBhlTMJO4XkWSPP5M4SSMFvlgRl9
         /8tTLJ3+rqGfcWZjoyrPWbFcTLwZeaaoizaYBcnZgWagEgoGg7voMyxMNqpkVn2mSwmm
         LL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tqUhbf3D4Xs94VKycC7lpVJyW8zSu4jAK4cxAajABlw=;
        b=Qt8HFQobSFeyMCR2+l2/jzHb+zFL82Ll4uErN1osLiplbfTVZlSbYI0bLZDmaSa1aI
         FS0VhUjQd13Ssq7XIoGRg9ABskd5H6uSO24E0AxcuqVePnOIC1aPzns8VajbbViBzsTE
         /nV6y4myRWRzJt8eXGF/Bizs544OYk/LbbddkHX0fWCUWRNYwrhmBlsKJUD4Jv6xMKx7
         qzi2QIk47x7Yp5hKv9UoLfMXih2myz5G+FIrr6KB7TJwomxohFovCgJ5N/oyHNCIB3Sq
         0z8gmU5YmXxVV+i0xMudt1QmZAa+pGRBbtfVfS+7KUIz9z/RzK978Mx3HQ5iNGh2CrGC
         UsFA==
X-Gm-Message-State: AOAM532g+iitYvfQ7PsTqGeeCDgEFC4oLsLuPWBN01kmanGCA/NW8oPd
	bsGl6wgS2EqjtyB0lJSs9mN5zWX8ituyYlXNKY3p9A==
X-Google-Smtp-Source: ABdhPJyLx7TuAuJDQeQvJnK01qum4mfiyBtpVoz4whLlzyzuMN2FduWECvaMN/r3NY6vRZIy30xz4JbJRWeAqMuwq60=
X-Received: by 2002:a19:4a41:: with SMTP id x62mr10041545lfa.398.1606745458890;
 Mon, 30 Nov 2020 06:10:58 -0800 (PST)
MIME-Version: 1.0
References: <20201129074802.1493537-1-raj.khem@gmail.com> <20201129074802.1493537-2-raj.khem@gmail.com>
In-Reply-To: <20201129074802.1493537-2-raj.khem@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 30 Nov 2020 14:10:44 +0000
Message-ID: <CAAnfSTsTrHve_H+WMKdt7d2bYWC+mBKoTcWwa0sZ-Mo=xWWs6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 2/5] python3-numpy: Add ptest
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Why are all the patches from this not squashed into this?  We don't
need to see the bugs you fixed.

Ross

On Sun, 29 Nov 2020 at 07:48, Khem Raj <raj.khem@gmail.com> wrote:
>
> Since 1.15, numpy have replaced nose with pytest testing framework
> it additionally needs hypothesis and sortedcontainers modules
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/python-numpy/files/run-ptest         | 5 +++++
>  meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb | 7 +++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/python-numpy/files/run-ptest
>
> diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b/meta/recipes-devtools/python-numpy/files/run-ptest
> new file mode 100644
> index 0000000000..9a1c72aeb1
> --- /dev/null
> +++ b/meta/recipes-devtools/python-numpy/files/run-ptest
> @@ -0,0 +1,5 @@
> +#!/usr/bin/env python3
> +
> +import numpy
> +numpy.test(label='full', verbose=2)
> +
> diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
> index d54f2f6c18..b484e7cddc 100644
> --- a/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
> +++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.19.4.bb
> @@ -8,6 +8,7 @@ SRCNAME = "numpy"
>  SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
>             file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
>             file://0001-numpy-core-Define-RISCV-32-support.patch \
> +           file://run-ptest \
>  "
>  SRC_URI[sha256sum] = "fe836a685d6838dbb3f603caef01183ea98e88febf4ce956a2ea484a75378413"
>
> @@ -16,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
>
>  DEPENDS += "python3-cython-native"
>
> -inherit setuptools3
> +inherit ptest setuptools3
>
>  S = "${WORKDIR}/numpy-${PV}"
>
> @@ -30,7 +31,6 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
>                    ${PYTHON_PN}-pprint \
>                    ${PYTHON_PN}-pickle \
>                    ${PYTHON_PN}-shell \
> -                  ${PYTHON_PN}-nose \
>                    ${PYTHON_PN}-doctest \
>                    ${PYTHON_PN}-datetime \
>                    ${PYTHON_PN}-distutils \
> @@ -39,6 +39,9 @@ RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
>                    ${PYTHON_PN}-netclient \
>                    ${PYTHON_PN}-numbers \
>                    ${PYTHON_PN}-pydoc \
> +                  ${PYTHON_PN}-pytest \
> +                  ${PYTHON_PN}-hypothesis \
> +                  ${PYTHON_PN}-sortedcontainers \
>                    ${PYTHON_PN}-pkgutil \
>                    ${PYTHON_PN}-email \
>                    ${PYTHON_PN}-compression \
> --
> 2.29.2
>
>
> 
>
