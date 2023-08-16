Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24192C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 09:23:18 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.157106.1692177793061899571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 02:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wk8p9WPt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fe426b8583so63804675e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 02:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692177791; x=1692782591;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtjeNbqFv0U8RpTg41+vI9uWJlqojCXAZEcAkvUKrhk=;
        b=Wk8p9WPt+bePpWSUs+YzKoO9LdwyCyD9g/DT0J83Y04ClcsJdXyopIBdO5J0jGhW3Q
         yhGNsZ0BFL9Z23Ea00kzIP9qiYPRWkYsI+V6mkgnVUhwJxFcQnzkmyUQN809BCslGDBR
         cTgmtAQuV1bSFQCOAB6s2b6iUzybhksue0VbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692177791; x=1692782591;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vtjeNbqFv0U8RpTg41+vI9uWJlqojCXAZEcAkvUKrhk=;
        b=e+vX+nRrzraQROybq9UqWO4eA/U9SqSKEeeYYkA0+TiVry9vyQF1aMBRLilB/zQMIW
         q9/p+cMhgE2fd0ziLR7YPajqmQKfW5HlzDu3Icl7nHpSwChzyZx8qwudru1tvLe7PVwJ
         f+t8kjX92/F+jiZWE+xXGNgplItxFZLkq5qLkZT32AaZOjKS7m7XmVJv9Ph9HdaKHHzb
         tZIzGNPqj74O68mykn78D+ZEprksI/x5qdHfntmwUWG/JDGTiJvNYKpmrOQkpNOF7bx7
         RvNKaxh4Iv3Fmq1UQKLtAZup/QcBzWewLlQO/Lx7K0R5m7nRe/a4kJ9oHdnhWFjnVaIt
         KcvA==
X-Gm-Message-State: AOJu0Yzzl6O3r5bAo78fvrzWKBttYP+4uJf07tGIRUpX779jW98G8GuI
	5TA1Pt0nWBVZLCplJUo/V6k4wA==
X-Google-Smtp-Source: AGHT+IHV52cKvS2DYLNdMmSQJSip4Bo/woHHelGGt3JecDjFH6DqsX0YJovR8p86/C2ODucYT6CWSQ==
X-Received: by 2002:a05:600c:21d0:b0:3fe:4d66:2d4b with SMTP id x16-20020a05600c21d000b003fe4d662d4bmr947584wmj.28.1692177791454;
        Wed, 16 Aug 2023 02:23:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b782:7711:f696:663e? ([2001:8b0:aba:5f3c:b782:7711:f696:663e])
        by smtp.gmail.com with ESMTPSA id z1-20020a05600c220100b003fc01f7b415sm23320616wml.39.2023.08.16.02.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 02:23:10 -0700 (PDT)
Message-ID: <55f80b2075971da2f3c33f5de24ffde2f6813d1f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATHCH V4 1/4] rust: add cargo-c native recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2023 10:23:09 +0100
In-Reply-To: <88f884f675d3362b5c5fe3daae0965273f41fe63.1692164369.git.frederic.martinsons@gmail.com>
References: <cover.1692164369.git.frederic.martinsons@gmail.com>
	 <88f884f675d3362b5c5fe3daae0965273f41fe63.1692164369.git.frederic.martinsons@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 09:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186120

On Wed, 2023-08-16 at 07:41 +0200, Frederic Martinsons wrote:
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>=20
> This package make it easier to generate C/C++ ABI compatible
> header, library and also generate package config file.
>=20
> It is built around cbindgen (https://github.com/mozilla/cbindgen)
> for the header generation, it compiles the library (static or dynamic)
> through cargo and finally handle the generation of a custom
> package config file.
>=20
> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |    1 +
>  meta/recipes-devtools/rust/cargo-c-crates.inc |  453 ++++
>  .../rust/cargo-c-native_0.9.18.bb             |   23 +
>  .../rust/files/0001-Add-Cargo.lock-file.patch | 2180 +++++++++++++++++
>  4 files changed, 2657 insertions(+)
>  create mode 100644 meta/recipes-devtools/rust/cargo-c-crates.inc
>  create mode 100644 meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb
>  create mode 100644 meta/recipes-devtools/rust/files/0001-Add-Cargo.lock-=
file.patch

Should 0001-Add-Cargo.lock-file.patch be here?

Cheers,

Richard

