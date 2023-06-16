Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78620EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 07:31:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.3355.1686900696827867014
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 00:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=VA0XgpfU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-30fc2b44281so239894f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 00:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686900695; x=1689492695;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Is38aMx/guyLkKtNMTlJg3+dBfpnpdmQcDNIq5CifeI=;
        b=VA0XgpfUttARt2iIfZxpJNi5k1mJWgj6WJPHZwMDiAj7KLVvrIS2wnHaKkWARsqSRi
         QHxcX9oYdhJNbeqe86tu72ANHEBnFHvt2YXML2N4qus6TM9qV0nh5Hxf1BBZ7C/4S9Cy
         +iXlWNZH1YZYQ8hntCaLVrxb6lvWig/iBf4Xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686900695; x=1689492695;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Is38aMx/guyLkKtNMTlJg3+dBfpnpdmQcDNIq5CifeI=;
        b=cu8yv5jI/SwUvy7sCWIpJbkx8WKrwCAkQruefFVhqwCRSfSe3I5iRH7Q5/jedfis1z
         zjFwzCYNlDz09TXx3dI5OMXWxvbKO+Xd7pQ8hSv+eTcA9abgAt0OK6gIxLVo7HZ0rooe
         iKn1Lzt0EpvGiWH63GcpxnbQoNx2sdzZe+/utI7DjVGW5TbN7de+G752i7tjX9SfjAer
         9zzsGcP18khzcm+TtINwlOwXsU8iMWFfMxavK9lezNcmJuy9b5CxTs7JlhJNDcQ9V/cy
         ALNT1WznicfPqpuga6mwE+oMi1D79cp9U5xhhtQWuk47uEvw+UNYh8gypKYAiraJq2WZ
         caFg==
X-Gm-Message-State: AC+VfDwZdGN/ClQ9GFnI1eN4DumC+7Ao4SAwhYYs99Lfhxne0i0O1XSL
	1y06zfdDkn1zYVNxFWgVq8abYA==
X-Google-Smtp-Source: ACHHUZ5W8U/cA+7lMOqvLny4+Jy2ZjqnAi6dGYN+HVh3pgyrGtlCQEWhwy0nE0KwExY0fEyMFjz2cQ==
X-Received: by 2002:a5d:5608:0:b0:30e:3f55:ebc9 with SMTP id l8-20020a5d5608000000b0030e3f55ebc9mr782114wrv.13.1686900695170;
        Fri, 16 Jun 2023 00:31:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b814:609:2b03:c353? ([2001:8b0:aba:5f3c:b814:609:2b03:c353])
        by smtp.gmail.com with ESMTPSA id e13-20020adfef0d000000b0030aeb3731d0sm22833701wro.98.2023.06.16.00.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 00:31:34 -0700 (PDT)
Message-ID: <66bd3738b2a2175863074cde65ff76d175bfc735.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/3] wayland/weston upgrades
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2023 08:31:33 +0100
In-Reply-To: <cover.1686856412.git.pidge@baylibre.com>
References: <cover.1686856412.git.pidge@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182999

On Thu, 2023-06-15 at 20:20 +0100, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> Nothing really surprising here, except we should note that launcher-login=
d is=20
> being depreciated so some thought on how that is dealt with will need to =
occur.
>=20
> Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in (3):
>   wayland-utils: upgrade 1.1.0 -> 1.2.0
>   weston: Upgrade 11.0.1 -> 12.0.1
>   xwayland: Upgrade 23.1.1 -> 23.1.2
>=20
>  ...ayland-info-Fix-build-without-libdrm.patch | 42 -------------------
>  ...-utils_1.1.0.bb =3D> wayland-utils_1.2.0.bb} |  3 +-
>  .../{weston_11.0.1.bb =3D> weston_12.0.1.bb}    | 10 +++--
>  ...{xwayland_23.1.1.bb =3D> xwayland_23.1.2.bb} |  2 +-
>  4 files changed, 9 insertions(+), 48 deletions(-)
>  delete mode 100644 meta/recipes-graphics/wayland/files/0001-wayland-info=
-Fix-build-without-libdrm.patch
>  rename meta/recipes-graphics/wayland/{wayland-utils_1.1.0.bb =3D> waylan=
d-utils_1.2.0.bb} (82%)
>  rename meta/recipes-graphics/wayland/{weston_11.0.1.bb =3D> weston_12.0.=
1.bb} (92%)
>  rename meta/recipes-graphics/xwayland/{xwayland_23.1.1.bb =3D> xwayland_=
23.1.2.bb} (95%)

Thanks for these. Unfortunately there is a bit more work needed as I
think you didn't have ptests enabled:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/7200/step=
s/11/logs/stdio

| Dependency xcb found: YES 1.15 (cached)
| Run-time dependency xcb-cursor found: NO (tried pkgconfig and cmake)
|=20
| ../weston-12.0.1/tests/meson.build:317:2: ERROR: Problem encountered:
xcb and xcb-cursor required for running xwayland tests

which happened on musl and a load of other places in the parent build.

Cheers,

Richard

