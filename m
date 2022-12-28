Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4305AC4167B
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 14:32:35 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.181424.1672237953817007807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 06:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dgX1Z1wp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so8833651wmb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 06:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i2s4JNuRK9Lca8yKLEVHoiwLscxPKwLapg8trP7NvMg=;
        b=dgX1Z1wp/dt4kOWWBI5dgLZlfwKrLEr3vbqejh8w/aR3TUoAJozsiKEihWNB/y5z5q
         ii/Gtjc6vEZCQY3B4T/QulpR6OBsgl3mWeCMxWg9EfqRXyp8zuOvBawJZbuVgsMK6JyV
         8jUSq2fmIaPJ1zA1EqtBHRVkm0RUnR0IgYg1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i2s4JNuRK9Lca8yKLEVHoiwLscxPKwLapg8trP7NvMg=;
        b=yKUF/AqVC4szj7I10aicDL+rNE5JdQ1j4Nn8DzEy5SFpC9dsWaO4YwjKFCJ9RYqeD+
         kRGOafZ32yl1XfArUbN0GdVaay2RObR0LEVlh11bitFp8AZM4PAYpJs3zVIWlmVgOvYn
         VKaV8QB0xN7HZ7nLZtzDVRdQWtgJ6F62H78xpUxxX4PBSa3pk+nxZKTO2SdGFPF4Kqcs
         kAeqjEBzXfTIMbsu00r45m8wNyFn3gln5nTYLIm+FbEQ2CBQaVIllrrstmoT2YghJOeb
         FiICSS4tkBIn+nbKLe0hmpWLXN0BBwIVXJRPE8smeVPV/lBfKW/foIWGmBV0ypCwKM8P
         fEGw==
X-Gm-Message-State: AFqh2koc1tu77an5AJ1xzZHnFZDr5BXoFsQWxZ4qa6FAfpn1OdryC7d1
	DfvMeNhO/32fpmpXIGdzMPeqwQ==
X-Google-Smtp-Source: AMrXdXuUB+a1Mo7a9jRuBTB7Neu3gohVTYQhgi9r4L8zUtRAoPXNRqoiCVzV+wX59DHccKru52ozzw==
X-Received: by 2002:a05:600c:5008:b0:3cf:6f4d:c25d with SMTP id n8-20020a05600c500800b003cf6f4dc25dmr17883810wmr.21.1672237951997;
        Wed, 28 Dec 2022 06:32:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9a6e:7039:ab68:1e0d? ([2001:8b0:aba:5f3c:9a6e:7039:ab68:1e0d])
        by smtp.gmail.com with ESMTPSA id j30-20020a05600c1c1e00b003c71358a42dsm33831212wms.18.2022.12.28.06.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 06:32:31 -0800 (PST)
Message-ID: <b02a88ae46a84e7ad04702b925d2800519d5cd20.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 1/3] conf/machine/include: add x86-64-v3
 tunes (AVX, AVX2, BMI1, BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Wed, 28 Dec 2022 14:32:30 +0000
In-Reply-To: <20221226084455.2835751-1-alex@linutronix.de>
References: <20221226084455.2835751-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 14:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175068

On Mon, 2022-12-26 at 09:44 +0100, Alexander Kanavin wrote:
> Qemu 7.2 finally allows us to move beyond building for original Core 2/Co=
re i7 era hardware,
> and this patch adds support for the newer generations. But first, a bit o=
f
> background:
>=20
> Recently toolchains gained support for specifying x86-64 'levels' of
> instruction set support; v3 corresponds to 2013-era Haswell CPUs
> (and later), with AVX, AVX2 and a few other instructions that
> were introduced in that generation. I believe this is preferrable
> to picking a specific CPU model as the baseline.
>=20
> Here's Phoronix's feature article that explains the feature and the avail=
able levels:
>=20
> "Both LLVM Clang 12 and GCC 11 are ready to go in offering the new x86-64=
-v2, x86-64-v3, and x86-64-v4 targets.
>=20
> These x86_64 micro-architecture feature levels have been about coming up =
with a few "classes" of Intel/AMD CPU processor support rather than continu=
ing to rely on just the x86_64 baseline or targeting a
> specific CPU family for optimizations. These new levels make it easier to=
 raise the base requirements around Linux x86-64 whether it be for a Linux =
distribution or a particular software application where
> the developer/ISV may be wanting to compile with greater instruction set =
extensions enabled in catering to more recent Intel/AMD CPUs."
>=20
> https://www.phoronix.com/news/GCC-11-x86-64-Feature-Levels
>=20
> Here's gcc docs for it:
> https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html
>=20
> And here's the formal specification (click on the pdf link):
> https://gitlab.com/x86-psABIs/x86-64-ABI
>=20
> The actual tune file was created by copying corei7 tunes and doing
> search/replace on them. Qemu options were dropped as unnecessary.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../machine/include/x86/tune-x86-64-v3.inc    | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 meta/conf/machine/include/x86/tune-x86-64-v3.inc
>=20
> diff --git a/meta/conf/machine/include/x86/tune-x86-64-v3.inc b/meta/conf=
/machine/include/x86/tune-x86-64-v3.inc
> new file mode 100644
> index 0000000000..365e23b49b
> --- /dev/null
> +++ b/meta/conf/machine/include/x86/tune-x86-64-v3.inc
> @@ -0,0 +1,35 @@
> +# Settings for the GCC(1) cpu-type "x86-64-v3":
> +#
> +#     CPUs with AVX, AVX2, BMI1, BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE.
> +#     (but not AVX512).
> +#     See https://www.phoronix.com/news/GCC-11-x86-64-Feature-Levels for=
 details.
> +#
> +# This tune is recommended for Intel Haswell/AMD Excavator CPUs (and lat=
er).
> +#
> +DEFAULTTUNE ?=3D "x86-64-v3-64"
> +
> +# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
> +require conf/machine/include/x86/tune-corei7.inc
> +
> +# Extra tune features
> +TUNEVALID[x86-64-v3] =3D "Enable x86-64-v3 specific processor optimizati=
ons"
> +TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'x86-64-v3', ' -=
march=3Dx86-64-v3', '', d)}"
> +
> +# Extra tune selections
> +AVAILTUNES +=3D "x86-64-v3-32"
> +TUNE_FEATURES:tune-x86-64-v3-32 =3D "${TUNE_FEATURES:tune-x86} x86-64-v3=
"
> +BASE_LIB:tune-x86-64-v3-32 =3D "lib"
> +TUNE_PKGARCH:tune-x86-64-v3-32 =3D "x86-64-v3-32"
> +PACKAGE_EXTRA_ARCHS:tune-x86-64-v3-32 =3D "${PACKAGE_EXTRA_ARCHS:tune-co=
rei7-32} x86-64-v3-32"
> +
> +AVAILTUNES +=3D "x86-64-v3-64"
> +TUNE_FEATURES:tune-x86-64-v3-64 =3D "${TUNE_FEATURES:tune-x86-64} x86-64=
-v3"
> +BASE_LIB:tune-x86-64-v3-64 =3D "lib64"
> +TUNE_PKGARCH:tune-x86-64-v3-64 =3D "x86-64-v3-64"
> +PACKAGE_EXTRA_ARCHS:tune-x86-64-v3-64 =3D "${PACKAGE_EXTRA_ARCHS:tune-co=
rei7-64} x86-64-v3-64"
> +
> +AVAILTUNES +=3D "x86-64-v3-64-x32"
> +TUNE_FEATURES:tune-x86-64-v3-64-x32 =3D "${TUNE_FEATURES:tune-x86-64-x32=
} x86-64-v3"
> +BASE_LIB:tune-x86-64-v3-64-x32 =3D "libx32"
> +TUNE_PKGARCH:tune-x86-64-v3-64-x32 =3D "x86-64-v3-64-x32"
> +PACKAGE_EXTRA_ARCHS:tune-x86-64-v3-64-x32 =3D "${PACKAGE_EXTRA_ARCHS:tun=
e-corei7-64-x32} x86-64-v3-64-x32"

I suspect we may want to call the x86-64-v3-64 tune simply "x86-64-v3"?

Also, does a 32 bit version of the tune make sense? Is that useful to
anyone? I appreciate the x32 case is marginal as well but at least
there it is something designed for 64 bit processors.

Cheers,

Richard





