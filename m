Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D21CC27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 21:56:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.4870.1718315791474976620
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 14:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VgjxuU/I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4230366ad7bso9770975e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718315790; x=1718920590; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKLlekprh4bbYRysqM2ky9HXDz9WHbiZQwbymlc+Pbs=;
        b=VgjxuU/IuIh7aWK7QoNcYYm0eMJBREjKu1R8lEakUzyAjVmADS4pUBjMcUbmyOm/Xk
         /n/8B1RnOlYlqxVabOhlVuS9C3ZMODcrtPima54VD1nwhxLxY5g37SGByak7mJCHaB6b
         aFalmJ0tC380nlDAjRnyOns/OCCoIa3MEZp8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718315790; x=1718920590;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eKLlekprh4bbYRysqM2ky9HXDz9WHbiZQwbymlc+Pbs=;
        b=DBCMjX5BzYuAyeu8i2ku2fLtohktE+bQVUPwYHi/cJVem4Dv81sEY5t5rFxgjZoBOR
         75btXmdIX1fN8cimXufyMFN4t5Qz16/iUip7OuyEhdte/TFlRcmDhY5ErcWQxXYqsRjN
         bLzdlAjX/S5QsKdfk9zVPaCOKIx00Di/BVBVAgI+beYh8jSatuuhFghOyZiXnqDoiLty
         ztMa5CS3aO4BqT/acNrK22dOyI93IMJ0WMvsosoBVdiQPTOQUiY+MuNNjpU+jR4CZwml
         G934iocbG8XXTztm5oKAwYexgQ3/1ugzFhq+3L2EwZd4yU8k9Xx2yEURduUUHYTIhUaR
         MC+g==
X-Forwarded-Encrypted: i=1; AJvYcCUXyxD6KZpknlpV08Cc20qazZSLk3bCfLFEzNvoI2vtPUPLpA+NffaRbPoVGi3F/ksYaKBepLEf2bXmXVu54GeETkbhm3JuhRtcH2d59zBAPB6FNMMsy0kp
X-Gm-Message-State: AOJu0YxQpKoAx0Fm8v1eV3EJFMGDamL1lUI6wcf8zwqclGzOkUBbCgc6
	g3iDpn15mSH9fVuvlxzwJWPePL2OhBtW1K5ByO5PD833/M/hckVALrcZN4u6zTlK11DFZDdBn7V
	F
X-Google-Smtp-Source: AGHT+IEFMOPFIPi5PBSdai/JKPDanxOibIArUxpIw+5YO6Yon3NEshF1bP+pNDj67LrhOQIVu14DHg==
X-Received: by 2002:a05:600c:2d07:b0:420:182e:eb46 with SMTP id 5b1f17b1804b1-4230484c868mr9128795e9.38.1718315789778;
        Thu, 13 Jun 2024 14:56:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6937:7920:d:ef6c? ([2001:8b0:aba:5f3c:6937:7920:d:ef6c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f5f33be5sm39012745e9.2.2024.06.13.14.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 14:56:29 -0700 (PDT)
Message-ID: <8848eb364f3c60d5883cb0cee25afe9e70d63a54.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] gfortran: update runtime dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2024 22:56:28 +0100
In-Reply-To: <20240613115159.3660790-1-kai.kang@windriver.com>
References: <20240613115159.3660790-1-kai.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 21:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200640

On Thu, 2024-06-13 at 19:51 +0800, Kai Kang via lists.openembedded.org
wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> It fails to run both `gcc` and `gfortran` with errors:
>=20
> > root@qemux86-64:~# x86_64-poky-linux-gcc a.c
> > x86_64-poky-linux-gcc: fatal error: cannot execute 'as':
> > posix_spawnp: No such file or directory
>=20
> then add binutils which provides `as` to RDEPENDS of gcc.
>=20
> libgfortran-dev provides libgfortran.spec which required by gfortran:
>=20
> > root@qemux86-64:~# gfortran hello.f95
> > gfortran: fatal error: cannot read spec file 'libgfortran.spec': No
> > such file or directory
>=20
> And gcc provides liblto_plugin.so:
>=20
> > root@qemux86-64:~# gfortran hello.f95
> > gfortran: fatal error: '-fuse-linker-plugin', but liblto_plugin.so
> > not found
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/gcc/gcc-target.inc | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-
> devtools/gcc/gcc-target.inc
> index 82da5ef82b..6ab83449ea 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -61,7 +61,7 @@ RRECOMMENDS:${PN} +=3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 libssp \
> =C2=A0=C2=A0=C2=A0=C2=A0 libssp-dev \
> =C2=A0"
> -RDEPENDS:${PN} +=3D "cpp"
> +RDEPENDS:${PN} +=3D "binutils cpp"
> =C2=A0
> =C2=A0FILES:${PN}-dev =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSD=
EV} \
> @@ -94,10 +94,15 @@ RRECOMMENDS:g77 =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 libg2c-dev \
> =C2=A0"
> =C2=A0
> +INSANE_SKIP:gfortran +=3D "dev-deps"
> =C2=A0FILES:gfortran =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 ${bindir}/${TARGET_PREFIX}gfortran \
> =C2=A0=C2=A0=C2=A0=C2=A0 ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
> =C2=A0"
> +RDEPENDS:gfortran =3D "\
> +=C2=A0=C2=A0=C2=A0 gcc \
> +=C2=A0=C2=A0=C2=A0 libgfortran-dev \
> +"
> =C2=A0RRECOMMENDS:gfortran =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 libquadmath \
> =C2=A0=C2=A0=C2=A0=C2=A0 libquadmath-dev \
>=20

https://valkyrie.yoctoproject.org/#/builders/10/builds/56/steps/11/logs/std=
io

(and may more similar failures)

Cheers,

Richard



