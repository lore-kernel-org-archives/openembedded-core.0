Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706A1C77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 10:47:39 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.15793.1683110856525052314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 03:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=R1SAPaDq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3063b5f32aaso1047898f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 03:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683110855; x=1685702855;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbOMX4lszF7rBOBc5Rrt2A0s6F81hKVeeav7pb+hNL0=;
        b=R1SAPaDqZuBJ99W5exM8FdGyOC39E0gl4yIrZIpJvZmA/yqM4IyBxgHEs144JLnxd6
         pPOrWauNZskro617vHN+e/1f8rj/SQKWzf6bbtJhXvYbzM4Y549LOMp9jvtohXDsN8My
         kgU0sTYRAAtiO39lBdfOwS59xq/qKcmRuLi90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683110855; x=1685702855;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zbOMX4lszF7rBOBc5Rrt2A0s6F81hKVeeav7pb+hNL0=;
        b=Wn8fKOtj4+IRc1JgXWSeFKPkJOyRTyuszkxQgsBZzIcCTJbJ9TyRUHsngsyYdFe2EG
         GOOiJhPOSB39RLX4lObkIDcW8J1f9UQq2SIsBQKo5NLpv0vcnfSR/Ji1FXLOYbRL73ZF
         cVAxWyZaY3hXsy9yEsVkrp+QlKtQPa8vPR9i/5bDi6YYwkTG1Lx30CX1WVxKdSw496mV
         K13CnfnXA6/sYitT13XrB26Zqa9ikm7tFYvXQZ2uAH3em+llFratWgFRrwc5khQH4+Cw
         AvBG6U+1CRL4xLRBkbj97piwaYTpdkWWAcANo+qas2lzEM5FHyeK9MNrUlmBhnlN1MKg
         k/7w==
X-Gm-Message-State: AC+VfDy86np6m2LqNWM0KcXmZdrXnK+QIiwn2KyUFm0iOMHmdxxYqo7s
	wzRdGRaB/G+VuC2J1e4PUcZGrw==
X-Google-Smtp-Source: ACHHUZ5FQtd2QD+erVYteWAp7/b7HgidA8wDZUxSTvcRNs8S/RQREGNp8AG1sRsxl19rfdlgRek48w==
X-Received: by 2002:adf:fa42:0:b0:306:2713:8088 with SMTP id y2-20020adffa42000000b0030627138088mr9680529wrr.25.1683110854893;
        Wed, 03 May 2023 03:47:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b? ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id j17-20020adfe511000000b003063ec828a4sm2177854wrm.117.2023.05.03.03.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:47:34 -0700 (PDT)
Message-ID: <b8d70b39c6cfd3127a6871f6666e86de0eaecc77.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: add "xz" to HOSTTOOLS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, openembedded-core@lists.openembedded.org
Date: Wed, 03 May 2023 11:47:33 +0100
In-Reply-To: <20230503095239.2487980-1-michael.opdenacker@bootlin.com>
References: <20230503095239.2487980-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 10:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180806

On Wed, 2023-05-03 at 11:52 +0200, Michael Opdenacker via
lists.openembedded.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
>=20
> xz is necessary to extract the uninative binary shims
>=20
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index afd9e2f552..2a6aefc01a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -529,7 +529,7 @@ HOSTTOOLS +=3D " \
>      python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed s=
eq sh \
>      sha1sum sha224sum sha256sum sha384sum sha512sum \
>      sleep sort split stat strings strip tail tar tee test touch tr true =
uname \
> -    uniq wc wget which xargs zstd \
> +    uniq wc wget which xargs xz zstd \
>  "
> =20
>  # Tools needed to run testimage runtime image testing

I don't quite understand, how is this working today without this?

Cheers,

Richard


