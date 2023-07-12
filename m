Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9939EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 12:29:42 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.6085.1689164974684440729
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 05:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=DZJ9FpqX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-314172bb818so7457580f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 05:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689164973; x=1691756973;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0gOsFMj6pFqHXMkfsqYeTRwePq8+u1DJDdH6xXQb2g=;
        b=DZJ9FpqXXBQRgC+wxYyQKeMCRxMKkInb9EseixJWps4ZLaVPI2up1q9TTEOnp4b6TM
         bCytJ1F9kSVa1Bh+nf9FH67FcEsi/WFW6g+eAnXnXLVSTnnsOByRbL8OqC0rcAwVEMNx
         K6HoJXCPKUW1pkr8UgUrI/LGwKddJPwZbMYr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689164973; x=1691756973;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J0gOsFMj6pFqHXMkfsqYeTRwePq8+u1DJDdH6xXQb2g=;
        b=FjPc0iNi4j5bOpLWRydNTTALw0KvFAI2ndNluhVNuvTRi9aQxugwc9cO0syMuWPBQJ
         quC3qO32GMGC8yZjtNGvdtxNkxKDGqo83PDJvV2owVunJZW5mYYe3mqCVFXjPqqHY7EM
         YPXY3rfiCm+NXo+pON79LZYUzebOBace6UlVIQLf3tovgSUnX/AySlr10iFeAanEiiMF
         wb1NygFZtmdv2SAKMZOIkb1eAahcRZF7GBWe1j0yXbgcqUFWW8Pu/ciBqdKRw1GbmcjP
         lDDDC7y3kptlA3fjHxUTJca/Si5b/1Sud6cDfVYwq5INUTtZp6cYSvMFPfGCKopoZWx+
         Ri1A==
X-Gm-Message-State: ABy/qLYqnGePSU9Fu3I4+7MC2C7RzMCO3+yDN2Cga//y7wSWrCD/wl3n
	iCYkNnOVU1IgevEi+xc+bmGbvA==
X-Google-Smtp-Source: APBJJlEmZ4RA37aubcBl5VRcRzz+DM8fyGzuh07IgIDTvzxlms7d3PG1+pXB5Jn2dMkqPPJ3rSp+cQ==
X-Received: by 2002:a5d:4c92:0:b0:314:1494:ea01 with SMTP id z18-20020a5d4c92000000b003141494ea01mr18486226wrs.5.1689164972965;
        Wed, 12 Jul 2023 05:29:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:339c:939c:6851:d3b0? ([2001:8b0:aba:5f3c:339c:939c:6851:d3b0])
        by smtp.gmail.com with ESMTPSA id g12-20020a5d46cc000000b0031455482d1fsm4996842wrs.47.2023.07.12.05.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 05:29:32 -0700 (PDT)
Message-ID: <25f435cb5536206f10a339ed0a20cd9c990a1a9e.camel@linuxfoundation.org>
Subject: Re: ODP: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr
 distro native features support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2023 13:29:31 +0100
In-Reply-To: <VI1PR04MB53739BCEE43D11E08D0202E79136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
	 <956c0e383088df5f8568961f57741452a2cb1920.camel@linuxfoundation.org>
	 <VI1PR04MB53739BCEE43D11E08D0202E79136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184194

On Wed, 2023-07-12 at 12:18 +0000, Piotr =C5=81obacz wrote:
>=20
> Generally we need these in native, otherwise ACLs and xattrs are not
> being preserved as packages are being built on native with usage of
> native tools which actually need the support for these
> functionalities as well...

Agreed, so should be not just set:

DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr acl"

?

Cheers,

Richard

