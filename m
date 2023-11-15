Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30B1C2BB3F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 22:19:49 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.26705.1700086782703172833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 14:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ht5/Ui0C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4083740f92dso911505e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700086781; x=1700691581; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFMct+YB5RuZdtDTzrm14Iif/YJov7e1+zK9f95+7MY=;
        b=Ht5/Ui0CwixwlomkECSpUKKC+vMxE8QI/e+l/jidsFA67w5gb1qbA4B3ocsLU3Svfz
         CyFIO1G+DTj8mMvhguNJkACQkgUErEM6S4viDgJMsNeQbahc3xqj1wI8hqpGA1jLCMOX
         dSXbm7bSf3ym8wA3dJNM/KV8N5CTQv62R2NKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700086781; x=1700691581;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hFMct+YB5RuZdtDTzrm14Iif/YJov7e1+zK9f95+7MY=;
        b=c4N4G/+aQswYmrtpbOrn7vLN2ex/ErVLzbvh2/n4na5sTGee32oEUZPwZPWs1TAdcQ
         K5wY3gB+XIrHYdzpVI2tMuOR/27HBu7LLS/0eq816xUoUt1vpINO9bmwGRV6Ud+xtJhU
         OU4lTygtrsaZF6mxpsiTaDiGr9iQYo1aTWLcWqrOOfF0IUSWoFEniTlYPecB00Cfsmlj
         j3xHJufoavNpO13g9NkaIsOs+gk0O1fJ8Gb4F6U92n+9TB1INFbgzmyVRqOmx4NQE1kJ
         e7b2achtbXJLlN0T3jyuoQvd/fUwCel0tTe1ykLrzEAb7ExpmdfaIB6qhZHMmGj1Z4ik
         Qafw==
X-Gm-Message-State: AOJu0YxLTU4fo9mHetWCV9fkdSqf0KHi7koOCjHgkIPayjJMI0MMsHBB
	HVl1KY1WwCtx+k20+p/9XDGtYCzkLXg/B2UHbgE=
X-Google-Smtp-Source: AGHT+IFNPj/+GV+Aqsf5kaxmWjFswiL9slwrNvFvA4lyQASH/0ktw6NUWdpWeWLg/Qx2iRaZ2pQUFg==
X-Received: by 2002:a05:600c:1d02:b0:405:a30:151e with SMTP id l2-20020a05600c1d0200b004050a30151emr11540680wms.12.1700086781120;
        Wed, 15 Nov 2023 14:19:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6dd4:df61:1cbf:d952? ([2001:8b0:aba:5f3c:6dd4:df61:1cbf:d952])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d680a000000b0032d893d8dc8sm11703843wru.2.2023.11.15.14.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 14:19:40 -0800 (PST)
Message-ID: <cd9e75ac975fb17876a7c85e8bb4f6a69bf0e311.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2 2/2] ca-certificates-native: add certs path
 to SYSROOT_DIRS_NATIVE
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2023 22:19:40 +0000
In-Reply-To: <20231115215256.867653-2-p.lobacz@welotec.com>
References: <20231115215256.867653-1-p.lobacz@welotec.com>
	 <20231115215256.867653-2-p.lobacz@welotec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 22:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190746

On Wed, 2023-11-15 at 22:52 +0100, Piotr =C5=81obacz wrote:
> As curl-native needs CA bundle for establishing secure connection,
> its installation is required in native environment.
>=20
> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> ---
>  .../recipes-support/ca-certificates/ca-certificates_20211016.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_2021101=
6.bb b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
> index 99abe60613..0d55bae845 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
> @@ -86,4 +86,6 @@ RDEPENDS:${PN}:append:class-target =3D " openssl-bin op=
enssl"
>  RDEPENDS:${PN}:append:class-native =3D " openssl-native"
>  RDEPENDS:${PN}:append:class-nativesdk =3D " nativesdk-openssl-bin native=
sdk-openssl"
> =20
> +SYSROOT_DIRS_NATIVE +=3D "${sysconfdir}/ssl/certs"
> +
>  BBCLASSEXTEND =3D "native nativesdk"

If I look at SYSROOT_DIRS_NATIVE in staging.bbclass, it has  =20
${sysconfdir} already listed in it. That makes me wonder if this is
really needed?

Cheers,

Richard


