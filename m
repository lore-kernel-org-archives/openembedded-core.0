Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F94C19F2D
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 10:41:23 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.3673.1660387275115624783
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 03:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hzrHyFSo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id l22so3624956wrz.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=GstvTeXWFmEqZmFlD287pGJXVrcuMwbX0trY9fzOyYc=;
        b=hzrHyFSoU9Jc6yCV/1Z8zEDlnQGviDZOugKupCKU4GIOg//5iTYdWRr20LOw/cJrF0
         E5W49wYS2BfA8eh4lTb0Vyc1vR76Ssq0d7SlAmRYn9R0dFiubTrElsS8M/Sw+24O2fyr
         5hTvNlGKj9ubitR4/p79MO+BIz5Kw5c6sK660=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=GstvTeXWFmEqZmFlD287pGJXVrcuMwbX0trY9fzOyYc=;
        b=NT/rXvYHBp7iWRiXacYNmovFkAWTqUaE+ur3tbw3BFfqipgAtd9hennbWTjgCeN/Jv
         K2rjLo3uKEDtzVM0KBvXnFUkUps+goc6NZ/gmmg5subwPcMgPtMocIgAhi2Or2hDA60+
         pOHIA1DaNw4LC/FcqqcrIMSw/BChIlyBgVs5/8b72dHjfLJsu+jXLMLljYJR5fpBCZGi
         PHof6Gu6XaI2BeH5nvzHp6SI4OzP/QifBLwexFbOQRDaZ3Uj/73bdi5bIvzIz5AckGTp
         Xh5XD19mcYUZJXbbSRwnE1NVxwdwEempkomrlSQHymofVBhcZKvoBV0lC0FeC8I1Axfp
         sgAA==
X-Gm-Message-State: ACgBeo1rzikeLWrXcYJHONdMo1x9xxj/UeETnVi6XUTS7UZo7gvaHj2g
	TqoVB58B11zIJ0pd9xJ/WPN0dQ==
X-Google-Smtp-Source: 
 AA6agR6rTVQP5VZw6Et1kxpAJ86bpa1cn65ApuKqukEdUbjwrOTlVVvOFVuB6zS+gprJylMO41Q0uA==
X-Received: by 2002:a5d:47c4:0:b0:21f:f34:56fd with SMTP id
 o4-20020a5d47c4000000b0021f0f3456fdmr3967250wrc.585.1660387273464;
        Sat, 13 Aug 2022 03:41:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f6d8:ef31:d475:da8f?
 ([2001:8b0:aba:5f3c:f6d8:ef31:d475:da8f])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c214800b003a5c244fc13sm2698548wml.2.2022.08.13.03.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 03:41:12 -0700 (PDT)
Message-ID: 
 <68b55478e2e44ffffde830318d3ca731a9693edb.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] uninative: Upgrade to 3.7 with glibc 2.36
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Halstead <mhalstead@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Sat, 13 Aug 2022 11:41:12 +0100
In-Reply-To: <20220812215736.10309-1-mhalstead@linuxfoundation.org>
References: <20220812215736.10309-1-mhalstead@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 10:41:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169302

On Fri, 2022-08-12 at 14:57 -0700, Michael Halstead wrote:
> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> ---
>  meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/dis=
tro/include/yocto-uninative.inc
> index 411fe45a24..7012db441b 100644
> --- a/meta/conf/distro/include/yocto-uninative.inc
> +++ b/meta/conf/distro/include/yocto-uninative.inc
> @@ -6,10 +6,10 @@
>  # to the distro running on the build machine.
>  #
> =20
> -UNINATIVE_MAXGLIBCVERSION =3D "2.35"
> -UNINATIVE_VERSION =3D "3.6"
> +UNINATIVE_MAXGLIBCVERSION =3D "2.36"
> +UNINATIVE_VERSION =3D "3.7"
> =20
>  UNINATIVE_URL ?=3D "http://downloads.yoctoproject.org/releases/uninative=
/${UNINATIVE_VERSION}/"
> -UNINATIVE_CHECKSUM[aarch64] ?=3D "d64831cf2792c8e470c2e42230660e1a8e5de5=
6a579cdd59978791f663c2f3ed"
> -UNINATIVE_CHECKSUM[i686] ?=3D "2f0ee9b66b1bb2c85e2b592fb3c9c7f5d77399fa6=
38d74961330cdb8de34ca3b"
> -UNINATIVE_CHECKSUM[x86_64] ?=3D "9bfc4c970495b3716b2f9e52c4df9f968c02463=
a9a95000f6657fbc3fde1f098"
> +UNINATIVE_CHECKSUM[aarch64] ?=3D "6a29bcae4b5b716d2d520e18800b33943b65f8=
a835eac1ff8793fc5ee65b4be6"
> +UNINATIVE_CHECKSUM[i686] ?=3D "3f6d52e64996570c716108d49f8108baccf499a28=
3bbefae438c7266b7a93305"
> +UNINATIVE_CHECKSUM[x86_64] ?=3D "b110bf2e10fe420f5ca2f3ec55f048ee5f0a54c=
7e34856a3594e51eb2aea0570"

Thanks Michael! That sorts another potential headache :)

Cheers,

Richard

