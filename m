Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web09.37370.1605544169846230906
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 08:29:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sual4H5k;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: alistair23@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id r12so18032469iot.4
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 08:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q568vc+THZ+3uzm3pLva4eZIAGWc3kWwY5P/MFVXz4M=;
        b=Sual4H5kMTYRiHZ4BpKV6XEzZd3aUEbFXpCiQm/duvYGwmLq5wbg7PDa14+ubw1+kw
         eKfKobeDW2e+fegaqL4AmzfVcF5zr3trLsuGT0vyBfrMnNPHnv9jfsecFgihDbBJfsGN
         P/aKwb8w53MTlTv5zWM/HND/LeWJnGbuBdpV1PXLjEmKsP6hwjamAVi2/TkAcN/YuU2g
         gfNZgL5vy2PDMUwD6HL284eclFvb4/v3ojxORFf5iQG0dIVkC1AhfWP3rC3TnXMyTKiz
         tfvZd7wHGDL+JBUUWq8mvsf2/cgdmboERrv/DJQ1msjnsWKx1JCR5K7ZKUy7EREMyNg7
         waCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q568vc+THZ+3uzm3pLva4eZIAGWc3kWwY5P/MFVXz4M=;
        b=t/u5Z6chEW3Rv/UmaFg+07SXdU8n0KsK2tFBG+pVl8TTMAaceSmNCe/9NHA2hA+eyL
         uKs/QncVSJ26fSLjUwsf6VyOrfpjY1LGBFj0FllD+GnKr++9qFvEl36+/fYCqJuM82wH
         S70q8GPJt10tes8mIPX+DPwJhtUwVTQB9vZzK5NKwQsBRIKPdJ+fpfJNTVTXkkTBgPsx
         ImlhvQ6PMcbgbrzE1u22pQ8dLc9StXp0/WmBeEz89IR2KxBiNg6eRPC5Q8GKnjNTmJiq
         aHCs6YaniFCv0ca9XaGCTUbV6K3sND71AY+kMIKvmE/uN1jstTsRSJXybcnp/YGaq08B
         BP3w==
X-Gm-Message-State: AOAM532U4wlfkRMl5gzQNJbvmqLtMFsBRamxExzh30M141y15VNGG8pw
	hU6dvlF8OwrVX0IIr9OynKayjat5ne3hgsVwdUM=
X-Google-Smtp-Source: ABdhPJzQmee5UfSzE8rxuTOnkqRzomyoQxHE85v3m5ZZmfBvvQv6+7wU2Aw1hW+0TT4CObN4qjyqYaQlzms6c7qXYfE=
X-Received: by 2002:a5e:dc01:: with SMTP id b1mr8684255iok.42.1605544169258;
 Mon, 16 Nov 2020 08:29:29 -0800 (PST)
MIME-Version: 1.0
References: <20201115234223.2985120-1-raj.khem@gmail.com>
In-Reply-To: <20201115234223.2985120-1-raj.khem@gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Mon, 16 Nov 2020 08:17:14 -0800
Message-ID: <CAKmqyKOw_doVmWoUh_guRX1DmiVyRNFOYbS1-au+16J=Dv4SGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python-numpy: Add support for riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 15, 2020 at 3:42 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  ...1-numpy-core-Define-RISCV-32-support.patch | 35 +++++++++++++++++++
>  .../python-numpy/python-numpy.inc             |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
>
> diff --git a/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
> new file mode 100644
> index 0000000000..b7a9e42b30
> --- /dev/null
> +++ b/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
> @@ -0,0 +1,35 @@
> +From fff0371f043177b4a23998241beaaa2a3413106a Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 15 Nov 2020 15:32:39 -0800
> +Subject: [PATCH] numpy/core: Define RISCV-32 support
> +
> +Helps compile on riscv32
> +
> +Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + numpy/core/include/numpy/npy_cpu.h | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
> +index 4dbf9d84e..045e84d63 100644
> +--- a/numpy/core/include/numpy/npy_cpu.h
> ++++ b/numpy/core/include/numpy/npy_cpu.h
> +@@ -100,8 +100,12 @@
> +     #define NPY_CPU_ARCEL
> + #elif defined(__arc__) && defined(__BIG_ENDIAN__)
> +     #define NPY_CPU_ARCEB
> +-#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 64
> +-    #define NPY_CPU_RISCV64
> ++#elif defined(__riscv)
> ++    #if __riscv_xlen == 64
> ++      #define NPY_CPU_RISCV64
> ++    #elif __riscv_xlen == 32
> ++      #define NPY_CPU_RISCV32
> ++    #endif
> + #elif defined(__EMSCRIPTEN__)
> +     /* __EMSCRIPTEN__ is defined by emscripten: an LLVM-to-Web compiler */
> +     #define NPY_CPU_WASM
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
> index b1058b26c8..40f81046ee 100644
> --- a/meta/recipes-devtools/python-numpy/python-numpy.inc
> +++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
> @@ -7,6 +7,7 @@ SRCNAME = "numpy"
>
>  SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
>             file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
> +           file://0001-numpy-core-Define-RISCV-32-support.patch \
>             "
>  SRC_URI[sha256sum] = "9179d259a9bc53ed7b153d31fc3156d1ca560d61079f53191cf177c3efc4a498"
>
> --
> 2.29.2
>
>
> 
>
