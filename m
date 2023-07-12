Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB81FEB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 19:25:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.4861.1689189918299414682
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 12:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=MbKXE29F;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbca8935bfso75614125e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689189917; x=1691781917;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jiZGM/+KML7zZwQR65iXcPs9ELHBKvG9gO30y/7y9jo=;
        b=MbKXE29FtAKbYDFAp/hB76bnS1Dsh8kNnl+/igv6Zrn60ZVYvTAtv36/bxnqjolGVm
         cyn7MGzxW0DJfYv+K7TrRGGf9tV9NpgmXqFwgxjg24tqheLYL+IsFn3d1hQ/VJR99LAs
         MtnkL8E9gkrnEycVDyW3hzcspdgMDaLSvqaGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689189917; x=1691781917;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jiZGM/+KML7zZwQR65iXcPs9ELHBKvG9gO30y/7y9jo=;
        b=dNjFvahjTTPnDGLCuXraSVSzJIPD7oKy7YZx+f31uqh+7emGPKiO+dzj6dFsD4WkL0
         P9YraCX9smwRmVzR+CRP836kadegtNqwKWv5bNPDuCeJA2l4upcuTJcp/Aah4skc4jfl
         ivCM873w5qdRaDbJ/v4m5ZKouO2g5BuXAuIDGctSWcCcySFtSzOh9z5uye9+GIBuQ1nW
         Ei48hbSezjJ4H0kvQutd6zzY7aCyszkhKvHcajrdJ6poC+I5mCvHNcIn4+JMjFNpP9b8
         WxhVRvdaDqB7QTwob3bWK1htBtUIP9cc+1eyInrjlokGVoLKiw0zee3tmgp2ZnfCqj7N
         SiKA==
X-Gm-Message-State: ABy/qLaxGE4z6ylYSE8O0CU81ckD5dtAzinq8I4INEyLSTlrOyUgvkDR
	L9DVn4tRLk80JM9W9Wxm63PXaQ==
X-Google-Smtp-Source: APBJJlGb30LqFfE0T9e4NvznjNGu3kruIUzh0NwxzSW6cx9FWHzWxC+2Ays3OOOALVTYhLSy3V0p/g==
X-Received: by 2002:adf:e349:0:b0:313:e9be:24e7 with SMTP id n9-20020adfe349000000b00313e9be24e7mr13091365wrj.59.1689189916681;
        Wed, 12 Jul 2023 12:25:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:339c:939c:6851:d3b0? ([2001:8b0:aba:5f3c:339c:939c:6851:d3b0])
        by smtp.gmail.com with ESMTPSA id f4-20020a5d4dc4000000b0031424f4ef1dsm5860957wru.19.2023.07.12.12.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 12:25:16 -0700 (PDT)
Message-ID: <d2d9f29c1d04105c76b6791387fab33662da3cd5.camel@linuxfoundation.org>
Subject: Re: ODP: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr
 distro native features support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2023 20:25:15 +0100
In-Reply-To: <VI1PR04MB53731CE4B03808CBFFB5B33B9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712122558.711029-1-p.lobacz@welotec.com>
	 <2f5daca6267d0a7dd9655527ce862fd4ca1b265c.camel@linuxfoundation.org>
	 <CANNYZj9LiFaL8syxNrv5Sc5OfP6xeZJfgRn_LH+ExjuK7XbLzQ@mail.gmail.com>
	 <VI1PR04MB53731CE4B03808CBFFB5B33B9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 19:25:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184221

On Wed, 2023-07-12 at 19:08 +0000, Piotr =C5=81obacz wrote:
> OK, I have set in v5 patches set, these acl and xattr attributes by
> default in DISTRO_FEATURES_NATIVE, without any checks, if it exists
> in DISTRO_FEATURES. Is that ok for all of you?

No, don't check DISTRO_FEATURES. Just add acl unconditionally.

Cheers,

Richard

