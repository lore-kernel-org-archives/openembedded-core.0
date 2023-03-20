Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3399DC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 17:06:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.178.1679331976880641932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 10:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ghHMb/tJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id j2so11071405wrh.9
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679331975;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RsUpL2ji6lBhllzZZtse/WtGapv+3ADQA7s0Wx2JXOU=;
        b=ghHMb/tJUIYuMR9AqmYCLIXxqwLjMP2wnnFkOleeLSLY9TwphESJB7Oe5+s/CzysZE
         U1sW46vYZiKeR0xKV0KkJJqPb3C1Wlw2ANOnWITp5wpgF/Cc+QQVlkTQbzNIav9hOHlF
         cyNPOtmaUZrwDe7FY5gImQ6y1sacuIIFJmKiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679331975;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RsUpL2ji6lBhllzZZtse/WtGapv+3ADQA7s0Wx2JXOU=;
        b=Kbk0gEzsZuARmZKkFPYQRlJ7r4tEwEpwCB1PIUxAWKpmYUYDcu63dkDpmrDQo72X7q
         v7XedINwoKvyjG1RsCR/AVqt2i5X+Osi4Bot1KeCjRP4y4P5sFEsCZA3NYQdhMmO8QKV
         8/IIry32fzDE3e2EmyBo2YHInbrpXJ6HSygwKOMKCmN8tixbifmLzxjGrHelJxTGDyY/
         qtLrlRhPPhlUD6ADIxCBP+SKHLIWwJCKyEc6uq81aQxl7Ask2+ptuxmz/BtErr9qtou/
         cwI7+ddQ4b5QpT6ICjxyI4w6YcqU7EE++eojCL8IbWNRsZGEX/0yWklYY8hCk/v2XZlk
         zHew==
X-Gm-Message-State: AO0yUKUOijQreCzvTgOoxS4SAKsuWGqHVv9hruTCqvScCy+exNUX7M2x
	Lxz/dhTf0UF/JHLSYm7eWS92Sg==
X-Google-Smtp-Source: AK7set8/tAPH/EXJEcTZdw3e+eUFF9LeG8dXiHBL+Lu042VsaFx7Rg8Kc7RMiOSyg4oP1YhHBOZhrQ==
X-Received: by 2002:adf:ff85:0:b0:2c9:e585:84b0 with SMTP id j5-20020adfff85000000b002c9e58584b0mr82083wrr.1.1679331975214;
        Mon, 20 Mar 2023 10:06:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1e4e:398:789f:af73? ([2001:8b0:aba:5f3c:1e4e:398:789f:af73])
        by smtp.gmail.com with ESMTPSA id v3-20020adfe4c3000000b002cf8220cc75sm1437546wrm.24.2023.03.20.10.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 10:06:14 -0700 (PDT)
Message-ID: <9212d8f0f76da35ede627287be8cfe48f9b3fea8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 10/17] python3-markupsafe: use
 python3-unittest-automake-output
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Mon, 20 Mar 2023 17:06:14 +0000
In-Reply-To: <20230320132751.518693-10-ross.burton@arm.com>
References: <20230320132751.518693-1-ross.burton@arm.com>
	 <20230320132751.518693-10-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 17:06:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178834

On Mon, 2023-03-20 at 13:27 +0000, Ross Burton wrote:
> Instead of using sed to reformat the output use this new module.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/python/python3-markupsafe/run-ptest | 2 +-
>  meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb  | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python3-markupsafe/run-ptest b/=
meta/recipes-devtools/python/python3-markupsafe/run-ptest
> index 5cec7116968..8d2017d39ce 100644
> --- a/meta/recipes-devtools/python/python3-markupsafe/run-ptest
> +++ b/meta/recipes-devtools/python/python3-markupsafe/run-ptest
> @@ -1,3 +1,3 @@
>  #!/bin/sh
> =20
> -pytest
> +pytest --automake
> diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb b/m=
eta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
> index f4f0ad2df0f..32420529635 100644
> --- a/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
> +++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
> @@ -6,8 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3Dffeffa59c9=
0c9c4a033c7574f8f3fb75"
>  SRC_URI[sha256sum] =3D "abcabc8c2b26036d62d4c746381a6f7cf60aafcc653198ad=
678306986b09450d"
> =20
>  PYPI_PACKAGE =3D "MarkupSafe"
> -inherit pypi setuptools3
> -inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
> +inherit pypi setuptools3 ptest
> =20
>  RDEPENDS:${PN} +=3D "${PYTHON_PN}-stringold"
> =20
> @@ -19,6 +18,7 @@ SRC_URI +=3D " \
> =20
>  RDEPENDS:${PN}-ptest +=3D " \
>  	${PYTHON_PN}-pytest \
> +	${PYTHON_PN}-unittest-automake-output \
>  "
> =20
>  do_install_ptest() {

Where is sed being used to reformat the output? I'm mainly proving I
did read the patches :)

Thanks for putting this series together, it does clean up all those
horrible sed expressions which is great to see.

Cheers,

Richard

