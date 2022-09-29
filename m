Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FB3C04A95
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 07:16:24 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.7766.1664435774479080189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gr4XUUK/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id n10so677584wrw.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=7u4EOej1R0R6mJwye97Bfp/MQpPHBNC4dI/K1NaZA9I=;
        b=gr4XUUK/4UoUUqHY1uQedUbRP8SeWKIg0C6LZNj6Bbf4GFlTh0l9VFIA1lKbQRq6eL
         E6+oMbeJfC92vO01nI4LmYQFT+C9utsMzC0JMA8xS+nTHTwqooW13Lu95T31RGLP4Bc4
         PoM0WSv/vu0KhGfCm9HRFv9juCnQ+Gca4qJe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=7u4EOej1R0R6mJwye97Bfp/MQpPHBNC4dI/K1NaZA9I=;
        b=VTsi7lCpx6eFirQ5Yrna16M/GWZqZzRUqQ2HgGhPoWatwI3WJMzQKPbixDa2ssXlri
         VAHXNSr8GVanUc/N9PNnrYbmUtW30/+fBTDofQ/HqIC2lpeeF5tQYYu+o37A2CQxE2hh
         nmtP6QU6OCTNjhI5wRzmB7j4tkAkLFFcDAEJPO1KyYDn5F2Z2dzprLE3V7sRITaRAMkY
         yxMENW9zmaIiry7eZZjaxNAhFPubYKHYKqZHcU03GlcN8/hlKaShRqhqT0YzOmDg545l
         +NqLkz8j6xKx0G0JUoYyuLFs+xUhU3B+8v/+DHCwNIbnYGH8j0HQZ9M6Gak327krAZkQ
         wwtQ==
X-Gm-Message-State: ACrzQf2NvfQMDuxBtTtTQtfFJb68RvZ6GZil/4fbLKlyw506kx6Zo23g
	YRSi0HVOjaz2kCExO2H2qibn/g==
X-Google-Smtp-Source: 
 AMsMyM4eX3e6jEXZsxDV17xfGnwxqCOXew6ZksM+/ASqlZlVd/y4o1meWe7DES1+7N+ac/gVe38JBg==
X-Received: by 2002:adf:ea4b:0:b0:22c:c28a:d038 with SMTP id
 j11-20020adfea4b000000b0022cc28ad038mr1148859wrn.271.1664435772969;
        Thu, 29 Sep 2022 00:16:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6fd0:d3d3:fcc6:1fd6?
 ([2001:8b0:aba:5f3c:6fd0:d3d3:fcc6:1fd6])
        by smtp.gmail.com with ESMTPSA id
 v4-20020a5d4b04000000b0022c96d3b6f2sm7639244wrq.54.2022.09.29.00.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 00:16:12 -0700 (PDT)
Message-ID: 
 <f272f8ecb7f5dd8c34b6abfb64d89f8bc209bdd7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] systemd: generate manpages indexes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dan McGregor <danismostlikely@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Date: Thu, 29 Sep 2022 08:16:11 +0100
In-Reply-To: <20220928221320.1763684-3-danismostlikely@gmail.com>
References: <20220928221320.1763684-1-danismostlikely@gmail.com>
	 <20220928221320.1763684-3-danismostlikely@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 07:16:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171170

On Wed, 2022-09-28 at 16:13 -0600, Dan McGregor wrote:
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>=20
> Now that python3-lxml is in core, use it to generate
> systemd.directives and systemd.index manual pages.
>=20
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
>  meta/recipes-core/systemd/systemd_251.4.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-co=
re/systemd/systemd_251.4.bb
> index 910ea71bf64..b4ad7e45eb0 100644
> --- a/meta/recipes-core/systemd/systemd_251.4.bb
> +++ b/meta/recipes-core/systemd/systemd_251.4.bb
> @@ -159,7 +159,10 @@ PACKAGECONFIG[localed] =3D "-Dlocaled=3Dtrue,-Dlocal=
ed=3Dfalse"
>  PACKAGECONFIG[logind] =3D "-Dlogind=3Dtrue,-Dlogind=3Dfalse"
>  PACKAGECONFIG[lz4] =3D "-Dlz4=3Dtrue,-Dlz4=3Dfalse,lz4"
>  PACKAGECONFIG[machined] =3D "-Dmachined=3Dtrue,-Dmachined=3Dfalse"
> -PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native x=
mlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
> +PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,python3-lxml-nat=
ive xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
> +# Ensure we're seeing the XML catalog from the build system and not the =
host.
> +# Otherwise, the build may fail generating the manpages.
> +export XML_CATALOG_FILES=3D"${STAGING_ETCDIR_NATIVE}/xml/catalog"

Wasn't there a fix that means this isn't required now?

https://git.yoctoproject.org/poky/commit/?id=3D544c3255b1b1d2be7d7c77f0d64c=
c4a11a947887
https://git.yoctoproject.org/poky/commit/?id=3Dfbc8f3d395711db00cae32d25025=
88ea9b61b1da

Cheers,

Richard

