Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D949C32793
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:13:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.4287.1661292815201579000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OPXzK3Eg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id bq11so12006432wrb.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=yyR1+g9KFqbK6J0w8VfamuMIxkRAMT2iCVguL/vWRFw=;
        b=OPXzK3EgBpV+4nzbP2aH35SpSssxBdBJJYZB9R8tLiYmtH9bYRhsVinNBpQ/eyDt+y
         gEwh6WcivyQJZdV7yhdI2YdFqa2zPVscwUobOQZUw6XJkTYwIzdoN6yWZLB44fX2hXwU
         N9RcHAz8vr88kYt2UK15WDY7OarjK2RKBzMyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=yyR1+g9KFqbK6J0w8VfamuMIxkRAMT2iCVguL/vWRFw=;
        b=ZsH3skNNdYpGpJXt0NJdc9E8aPR14zyJdn/KAFVTDYSRWy+W9+eZQzLgsUT5BsQcFI
         tBdnnx92UaQrTHV+bt7UNa3lhWU8m+V8bG7KKgwhG++iocApWybSroeF77xDLJsUxCP1
         9f8IpLvaF5RLhbSlfABBa+NffHtPXLRCfQCpfS1/PHS0t7D6Y9zFwOhxsITLvXQGZCaP
         TZAmVR2ACdxjd9Pec+Rj9sMbsZUvro3fZWZC8+WEJ2/5fDwnsmDMGAFkXiTbvVZKQ/kt
         1hRa63X6U9AblMLtjI+O8tPW42RcRSvfEfpsxChqoFRL+DTrP3perLJPXdkfoSR+YZWD
         vkbg==
X-Gm-Message-State: ACgBeo1lWo+i3fm1WnRKeYzQ4hxN/F7QJ6/OX7tAUAt8L8g5HgXILa0L
	NExZFoZaS8wVNzp/+Ej5mzg89w==
X-Google-Smtp-Source: 
 AA6agR7qAOfFZYxLJxZfj9IdeveGLVf1uqglcVZNVSpsdHeLHWvRry2tY7WgDM7zXNKF9zmgVauW2A==
X-Received: by 2002:a5d:648b:0:b0:222:cc32:c292 with SMTP id
 o11-20020a5d648b000000b00222cc32c292mr14123570wri.463.1661292813527;
        Tue, 23 Aug 2022 15:13:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4e4:9da0:6de0:5e33?
 ([2001:8b0:aba:5f3c:4e4:9da0:6de0:5e33])
        by smtp.gmail.com with ESMTPSA id
 g1-20020adff3c1000000b0021e5f32ade7sm15274969wrp.68.2022.08.23.15.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:13:32 -0700 (PDT)
Message-ID: 
 <d9d568b0796c77bd44ab82d4dbcc3ae01b0b8972.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] baremetal-image.bbclass: Emulate
 image.bbclass to handle new classes scope
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>,
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2022 23:13:30 +0100
In-Reply-To: <20220823213124.4185070-1-alejandro@enedino.org>
References: <20220823213124.4185070-1-alejandro@enedino.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:13:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169730

On Tue, 2022-08-23 at 15:31 -0600, Alejandro Hernandez Samaniego wrote:
> The new classes scope implemented on commit 7bd328f9d
> made testimage.bbclass (and perhaps others) stop working
> for baremetal-images, the expected way to run testimage
> is no longer to use INHERIT but to use IMAGE_CLASSES
> instead, however this functionality was not implemented in the
> baremetal-image class until now.
>=20
> Emulate image.bbclass allowing the baremetal-image class to
> use IMAGE_CLASSES to fix this issue.
>=20
> Set defaults for IMAGE_FEATURES to allow bitbake checks to
> pass properly.
>=20
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
> ---
>  meta/classes-recipe/baremetal-image.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-r=
ecipe/baremetal-image.bbclass
> index 3a979f2ed1..d3377a92fa 100644
> --- a/meta/classes-recipe/baremetal-image.bbclass
> +++ b/meta/classes-recipe/baremetal-image.bbclass
> @@ -15,6 +15,15 @@
>  #
>  # See meta-skeleton for a working example.
> =20
> +## Emulate image.bbclass
> +# Handle inherits of any of the image classes we need
> +IMAGE_CLASSES ??=3D ""
> +IMGCLASSES =3D " ${IMAGE_CLASSES}"
> +inherit ${IMGCLASSES}
> +# Set defaults to satisfy IMAGE_FEATURES check
> +IMAGE_FEATURES ?=3D ""
> +IMAGE_FEATURES[type] =3D "list"
> +IMAGE_FEATURES[validitems] +=3D ""
> =20
>  # Toolchain should be baremetal or newlib based.
>  # TCLIBC=3D"baremetal" or TCLIBC=3D"newlib"


I think we're missing a testcase!

Cheers,

Richard


