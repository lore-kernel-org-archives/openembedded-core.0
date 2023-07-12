Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577E4EB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 12:35:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.6192.1689165303093103989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 05:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=VHqQbsoC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742eso74242195e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 05:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689165301; x=1691757301;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epTRhsykocKQXGIe42ixBmOySWihFB0RxM9fZuPJlsM=;
        b=VHqQbsoCSiY7UxNgjgAN0H7viqZD6D2oqrhgL78CMgZcAAO2bXq2wVZGPI16rnMbUR
         SsYI9aAqR/Baso5kTwZ2Iggikt7WjAc/PVkxlCMVyUDoXtRRHk7peVTw5afFliPF6z6D
         /6aEGKQw7z3E27Ou7s3JruWeBjB2R6unTf83Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689165301; x=1691757301;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=epTRhsykocKQXGIe42ixBmOySWihFB0RxM9fZuPJlsM=;
        b=TT49PblmO+iN8mTstffF5tyCV9vUY1jrgYo/vt4kGeWv4/nhbkIjVwzlgCBHZj9WqW
         j7A+S9cufaoiOYb+E5SHgNopkskbnkgPogmI8Sae6TCg+hJUnw2/A+vwchgBtJ5G9lV0
         W+kVv4621KnfVOJJ9RqBMnBj8cQcEgt1QcvRT+O7Xxotf3riGZ+5i4bDUx3UCKwG/ToX
         3JOZb+Se6Y5njMw7OuxhgdoOVpPakcet9EYHGPti9kvAEfQFtMwMfrCBcTetXIf6mFNA
         o2COx/2gKJeEz/aynSjt6qKqyr9S4QzE5A9zRRh40P74IjowAmwHQGIZ+iVNCAluZEqP
         Hw3Q==
X-Gm-Message-State: ABy/qLZha4zgN3xN7OsZGCcc5A23sWgIiAKlWZiCOHQB/Uj+tfcfNaoJ
	JvIXKz3a+646r1mEgqUkaoC8nQ==
X-Google-Smtp-Source: APBJJlF4gar/YQzhl+cy4G0GqYtlAqqOajP5LM/mBH9ynXBo8Ppq8ZUHhKqjuFXgXTaSHmEADcoRxg==
X-Received: by 2002:a1c:cc0d:0:b0:3fb:b1fd:4183 with SMTP id h13-20020a1ccc0d000000b003fbb1fd4183mr18701008wmb.12.1689165301609;
        Wed, 12 Jul 2023 05:35:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:339c:939c:6851:d3b0? ([2001:8b0:aba:5f3c:339c:939c:6851:d3b0])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc30c000000b003fba92fad35sm15430222wmj.26.2023.07.12.05.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 05:35:01 -0700 (PDT)
Message-ID: <57f1d335c7b34bfae272ce2bdd0d141c7e7d72b6.camel@linuxfoundation.org>
Subject: Re: ODP: ODP: [OE-Core][PATCH 1/3] bitbake.conf: add acl and xattr
 distro native features support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2023 13:35:00 +0100
In-Reply-To: <VI1PR04MB5373801F47C0AB61E6DC0EFB9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230710095800.2033309-1-p.lobacz@welotec.com>
	 <956c0e383088df5f8568961f57741452a2cb1920.camel@linuxfoundation.org>
	 <VI1PR04MB53739BCEE43D11E08D0202E79136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <25f435cb5536206f10a339ed0a20cd9c990a1a9e.camel@linuxfoundation.org>
	 <VI1PR04MB5373801F47C0AB61E6DC0EFB9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 12:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184196

On Wed, 2023-07-12 at 12:32 +0000, Piotr =C5=81obacz wrote:
>=20
> It was before, but Alexander has written something like this:
>=20
>=20
>=20
>=20
> > ... and the next lines after that are:
> > # Native distro features on this list will use the target feature
> > value
> > DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod
> > opengl wayland"
> >=20
> > So you can simply add acl/xattr to DISTRO_FEATURES_FILTER_NATIVE
> > instead, which is purpose-made for the use case.
> >=20
> >=20
> > Alex

If we want to make it inherit from the target settings, then yes, this
is the way to do it. I'm wondering if we should just enable it
unconditionally which is simpler.

Cheers,

Richard

