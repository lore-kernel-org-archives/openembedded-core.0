Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C292EC072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 22:17:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.26661.1700086663505602233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 14:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WmJ/3iOk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4083f613272so1070085e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700086662; x=1700691462; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSdbsxnaVoi9RsV77SMRhJr7azzZR0/jGm8XaOFJhDQ=;
        b=WmJ/3iOkl5uxJOJh0JDHKYqBqWLSQq647OzzXBlu1/XzmGIlmrcoFns9cuuS2D/2XO
         R78JHmm0Qqgir5WdT7l51gbLzRG1JTkjvAv8FVA2/gAABsJS0XzpJ3gvFud6A4c6LFhL
         06ICHM5iu7u6+rQqx0u2Erzq2qTwY3T5u++mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700086662; x=1700691462;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HSdbsxnaVoi9RsV77SMRhJr7azzZR0/jGm8XaOFJhDQ=;
        b=rSrkgL6TkGJ7nikZXRfKWDNQKuLKs5b6byRgV/ACNTq/J/hoFbcGnSJud91TVcTbMc
         lVbyZb5eJpD0t+A5WhWMW7SHG4JJuQVS+0bMVb5E+T5+r+UpYSpEbxkCXaK4RjAEM8DF
         rW/E2xRWjzZsB7Kd5cFsZ7SOqdwhaXdjzIUJlvSar2SVL5fdckwBm2rXiVxZ2wzKeRQh
         NDzv8Zxn2+FXz8ORd0FkXhr4eQV1Y7gsT5lA5o7NuDFTSVW9uxFE0WQNZoEreZ15vVkQ
         sGR43V3kxvs1Qr4rgX+GrH7pYF6Aj/EtUmCcRUduHogOgKOguGm2X07LBVJkFbKwnf5T
         fr1Q==
X-Gm-Message-State: AOJu0YxWJd6B0+PKHBLThELYXE9FPThzs4VKoZ9jP/nO9b8rR0qzMYOC
	3IYO79s+PODEnBa4vge+BHKN1Q==
X-Google-Smtp-Source: AGHT+IFqet7eknxyxZUcHKd1TSZSvpQitcPMEiiIlA3M1F+RkIf7WQBpnFpsMcECCrIKK1rITCSTKQ==
X-Received: by 2002:a05:600c:548e:b0:403:cc64:2dbf with SMTP id iv14-20020a05600c548e00b00403cc642dbfmr11294030wmb.27.1700086661808;
        Wed, 15 Nov 2023 14:17:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6dd4:df61:1cbf:d952? ([2001:8b0:aba:5f3c:6dd4:df61:1cbf:d952])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c025300b004053e9276easm1029337wmj.32.2023.11.15.14.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 14:17:41 -0800 (PST)
Message-ID: <9a6435e91f517739cd565d0f597cf07521b16075.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2 1/2] curl-native: add missing
 ca-certificates-native dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Nov 2023 22:17:40 +0000
In-Reply-To: <20231115215256.867653-1-p.lobacz@welotec.com>
References: <20231115215256.867653-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 22:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190745

On Wed, 2023-11-15 at 22:52 +0100, Piotr =C5=81obacz wrote:
> By default curl is being configured with:
>=20
> --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt
>=20
> which causes an issue for native build, when calling
> curl-native command, as certificates file is missing.
>=20
> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> ---
>  meta/recipes-support/curl/curl_8.4.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-support/curl/curl_8.4.0.bb b/meta/recipes-suppo=
rt/curl/curl_8.4.0.bb
> index 5f97730bf4..f0e09868f6 100644
> --- a/meta/recipes-support/curl/curl_8.4.0.bb
> +++ b/meta/recipes-support/curl/curl_8.4.0.bb
> @@ -130,6 +130,7 @@ PACKAGES =3D+ "lib${BPN}"
> =20
>  FILES:lib${BPN} =3D "${libdir}/lib*.so.*"
>  RRECOMMENDS:lib${BPN} +=3D "ca-certificates"
> +DEPENDS:append:class-native =3D " ca-certificates-native"
> =20
>  FILES:${PN} +=3D "${datadir}/zsh"
> =20

I think this can be an RDEPENDS:${PN}:append:class-native which would
have the advantage of not blocking the build of curl-native on ca-certs
and only require it at runtime for running it?

I suspect bitbake is struggling to "see" the RRECOMENDS on a non-PN
package for the native recipe extension.

Cheers,

Richard

