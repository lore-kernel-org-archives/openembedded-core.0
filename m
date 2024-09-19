Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B7FCE8D6F
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 10:05:22 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.16111.1726740316978478243
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 03:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gcl9Z8Zz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.176, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so7014671fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 03:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726740315; x=1727345115; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+LXn9H20EkWmiWpdldp1KtSUO2WrarYdRD5w98B2VUk=;
        b=gcl9Z8ZzJNllo4FZaFNtflQC12d7fuIg9ysOYa34HiKzt/xCa60QNF6Y7/cRBtFxBl
         6Y0oJ1ZnagWBVvcSUq15gReXgvKqTvnuN+jexOepsc3H5ctCyn5W/WDAafLek6FXz+zi
         L/KBZ4FgLovBtlwCyNSGFJOXukwN3ap/s7RHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726740315; x=1727345115;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+LXn9H20EkWmiWpdldp1KtSUO2WrarYdRD5w98B2VUk=;
        b=U4J3LAgalb2ulJyBxB/kp4gMvg9jyt0bKcviaB7KY6BW5p6u2VcKzQTHdz9fx+HpAI
         9SyqdiCCgtVBVcu94vMqPbZaNoBiWYsCsIH+RWkQu47uuXCRcrhutVFloLQKKlsXrJqd
         WvNVsrQFLrrQ+wpk89G348CEZTxEfpqLp2gw2DwAvf3BuDLEtR3VQjVUUzlkiKhbRzxT
         c4aq4FsimH3+CsxD6PpX420y0lk45FhndllA2Mk6xzndH6Uc/0lquzJBWO/8Ni+22WJV
         RgjZBR2PG4D96my5Ifm+LcUkl6UkC/GZVr0im6MPLnkLgCR3ytOtk6YSXKoamhT7tvOm
         o+2A==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZPn5mvZGGBFI72i05jH+p0vj9IBI7sJ13Azt/hAxU4iBleXvpS+l+SevVpay6o2TsqwAEgRTH3fmwsXDItE/oA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwE4LmJ2kzA3jUi6gieyqncQnouop/1KpS6zYuVpUwZIDzYhi6v
	hELdK+mfW1TL6/MSkozPAmCwuKXjOQh3F1tkudyknahWQOCFa0bJywlhpcg/gr0=
X-Google-Smtp-Source: AGHT+IHMWBMjioebbQz9JBX0Y/wNbYSDWTyQ8zlsaEDMhA/fs2BUghJDUboMd7DMSqku6LNcFqSlfg==
X-Received: by 2002:a2e:a586:0:b0:2f7:51e3:fe2f with SMTP id 38308e7fff4ca-2f787dbf537mr156251391fa.13.1726740314656;
        Thu, 19 Sep 2024 03:05:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f722:770d:8a57:e159? ([2001:8b0:aba:5f3c:f722:770d:8a57:e159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754c6dbcsm17549785e9.46.2024.09.19.03.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 03:05:13 -0700 (PDT)
Message-ID: <599af576201ac8ce88f752d259be0b359119d4d2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 2/2] nativesdk-packagegroup-sdk-host: Add
 missing perl modules to RDEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Thu, 19 Sep 2024 11:05:12 +0100
In-Reply-To: <20240919094231.3840077-2-Harish.Sadineni@windriver.com>
References: <20240919094231.3840077-1-Harish.Sadineni@windriver.com>
	 <20240919094231.3840077-2-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 10:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204666

On Thu, 2024-09-19 at 02:42 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> In SDK, missing perl modules causes 'x86_64-pokysdk-linux-gp-display-html=
 --help' to abort with below errors..
> =C2=A0 - Can't locate bignum.pm in @INC (you may need to install the feat=
ure module).
> =C2=A0 - Can't locate Math/BigInt.pm in @INC (you may need to install the=
 Math::BigInt module)
>=20
> By adding the following perl modules to RDEPENDS fixes the above errors:
> =C2=A0 nativesdk-perl-module-bignum
> =C2=A0 nativesdk-perl-module-bigint
> =C2=A0 nativesdk-perl-module-math-bigint
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0.../packagegroups/nativesdk-packagegroup-sdk-host.bb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-h=
ost.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> index c1d3c25060..70a7d3e494 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> @@ -30,6 +30,9 @@ RDEPENDS:${PN} =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 nativesdk-bison \
> =C2=A0=C2=A0=C2=A0=C2=A0 nativesdk-flex \
> =C2=A0=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-integer \
> +=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-bignum=C2=A0 \
> +=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-bigint \
> +=C2=A0=C2=A0=C2=A0 nativesdk-perl-module-math-bigint \
> =C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0
> =C2=A0RDEPENDS:${PN}:darwin =3D "\

This doesn't address my feedback/concerns in the original patch.
SHouldn't these dependencies be added to the nativesdk-binutils-gprofng
RDEPENDS?

Cheers,

Richard

