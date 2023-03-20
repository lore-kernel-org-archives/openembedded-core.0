Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B33C7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 17:18:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.547.1679332704539872434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 10:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LrALd76t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id j24so2211358wrd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 10:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679332703;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=btFkhe0VNuMbZlivDGOB3XSV/575xokWOwYzJ9jhkfE=;
        b=LrALd76tCxKx72MUG4qeuBbCX3843POXzBBm1OKY8/DPvOjazLfapvhl2hkD01Vp7q
         mnLVjDzGouZI1WIvKFG03qvHDU16Br1+3QpyAR4zzYztS/3yY6uGnybW0T5ZvcaVNfR9
         ciHYfphEyD2cZlwFfqBmcONoSmiVHyFxyDAQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679332703;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btFkhe0VNuMbZlivDGOB3XSV/575xokWOwYzJ9jhkfE=;
        b=72pF+cDuu/7n1OgTOpYxdrBgVnDWH+Sruo+6pty68uOuPhWZH0BCQ8KQOvyyR6qJlA
         Ecg6qQJopiy2wMoxXRMt/maa2dydRCH4c5QOBuJ2iu886mH0SJxO+mvf0U1Tc0+lnd7t
         e1ZZtSccCVB6tLWQcIpFGyV8wBxY5r0My+BAJhJ1UeQ6v6/serLRQM5KOEVTOCRUEku9
         EXlqnUxyz7C2s5qeYZ/CWCyG/z3Ri/JugAgi1fTybanmzX5cCnEcANk50MDCAZCdFaoi
         5T98bqsOiGqL7Hnu0ET9jhjlaUf6umGhFrAcxTrG95KQeSKp+9oI3fpjY7FZumOjuf/w
         ngEQ==
X-Gm-Message-State: AO0yUKWJVLV1l1r/f3A+gjeGw0g7ELmXuNjgriedqQx5aL8NapHDEz/n
	+7/acwcG0vOkxCMMAaUToRTJMg==
X-Google-Smtp-Source: AK7set9IeFxoqLveER74S6KJ6O2+1gk8aL+qgRs5clABaTzznniHkM/oX/bx6cKtl7wkYsVuy/iuRw==
X-Received: by 2002:adf:f54c:0:b0:2d5:2c7b:bc5f with SMTP id j12-20020adff54c000000b002d52c7bbc5fmr52915wrp.58.1679332703017;
        Mon, 20 Mar 2023 10:18:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1e4e:398:789f:af73? ([2001:8b0:aba:5f3c:1e4e:398:789f:af73])
        by smtp.gmail.com with ESMTPSA id i7-20020adffc07000000b002c5706f7c6dsm9352971wrr.94.2023.03.20.10.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 10:18:22 -0700 (PDT)
Message-ID: <e3935efc8fb85e27b6e88fcc12a3543ca6280e23.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 04/17] python3-unittest-automake-output: add
 new recipe for ptest integration
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Mon, 20 Mar 2023 17:18:21 +0000
In-Reply-To: <20230320132751.518693-4-ross.burton@arm.com>
References: <20230320132751.518693-1-ross.burton@arm.com>
	 <20230320132751.518693-4-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 17:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178837

On Mon, 2023-03-20 at 13:27 +0000, Ross Burton wrote:
> This package contains modules for both unittest and pytest that alter
> the output to look like automake's 'make check' output, for better
> integration with ptest.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../python/python3-unittest-automake-output_0.1.bb   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-unittest-automak=
e-output_0.1.bb
>=20
> diff --git a/meta/recipes-devtools/python/python3-unittest-automake-outpu=
t_0.1.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_0.=
1.bb
> new file mode 100644
> index 00000000000..5de526b895e
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.b=
b
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "Modules to make unittest and pytest look like Automake outp=
ut, for ptest"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df6f16008d9fb7349f06609329f1ab=
93b"
> +
> +SRC_URI =3D "git://gitlab.com/rossburton/python-unittest-automake-output=
;protocol=3Dhttps;branch=3Dmain"
> +SRCREV =3D "06537edb18f3641c70bce25256f6ecf5f5164ead"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit python_flit_core
> +
> +BBCLASSEXTEND =3D "native nativesdk"

This needs a MAINTAINER entry else we'll get selftest failures. I
tweaked the patch in -next for that.

Cheers,

Richard

