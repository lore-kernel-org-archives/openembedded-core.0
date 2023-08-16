Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547F2C001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 10:03:28 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.157190.1692180200329036618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 03:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ju6sqObC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fe4a89e7efso57474805e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 03:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692180199; x=1692784999;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JaavS6OCo4at/PkLq6QW6YQ0itrKB6AOTAUwQ2xqwj8=;
        b=Ju6sqObCO3QDajaioM/Jvd5hyGVVDOyR+m4PHpPVpubtx4RlyrTjcxqXkLgHHlubIe
         SiBwZVTLDYtMeLx7VqO9SNMJXHeVh/QxxW8Sr2ZG+VdsK3z9CHGNOqAjVF5nbxAELwP/
         g2dBTHNBW8BnaiwGHl9Yzf0PsUz/WjwDTc9TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692180199; x=1692784999;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaavS6OCo4at/PkLq6QW6YQ0itrKB6AOTAUwQ2xqwj8=;
        b=c0UQdUa6yKVMQOpFgylILECvhCc9mOaRFaM/w31Px9O/uZMb6impv/YRhWzpdAYCIC
         bP8CTqzFZTn7OCNRJJLLWQJrLQQHLZtM0Ln2MusoT2KeP2jj0yH9C46+KWIbK4kjGvmF
         pFuIDH4v6kQhRth1GDhsbv1M9IUP317Q6qhewAeHRicn8duBaFEudcmSBn08qzYHKfWS
         rF80Cgv2Z4rpLMSaIo75mJDI0LoPJLtUgWYeT/ltT854LM7wGmKYz0R81l8cohCWblEa
         111AeTeDD/QqK0+bLrZkIRw+Fn8gEdYTNy3Pytc5tDWhxylW0t6nrb8WRbce+aU8JHzU
         XXVg==
X-Gm-Message-State: AOJu0YxbazSnOK2CrxI/lDBqlEbwIo5IRXCyhsHhO2fvC8skoeqgzDuA
	23j/aUaMjMYKvLyBqJVHZR9q+Q==
X-Google-Smtp-Source: AGHT+IGVe0HHOYfhPv3n0wsajWow+wxRlGpL93RBkRMWDL7vRe7VQ6gP9oY/UD2FrYp7zi+3ze3NAg==
X-Received: by 2002:a05:600c:214f:b0:3fe:266f:fe28 with SMTP id v15-20020a05600c214f00b003fe266ffe28mr973456wml.14.1692180198536;
        Wed, 16 Aug 2023 03:03:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b782:7711:f696:663e? ([2001:8b0:aba:5f3c:b782:7711:f696:663e])
        by smtp.gmail.com with ESMTPSA id m22-20020a7bcb96000000b003fe2696ccfcsm20641936wmi.23.2023.08.16.03.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 03:03:17 -0700 (PDT)
Message-ID: <420ea1732e9039e0f13840c070417765cd01449d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATHCH V4 1/4] rust: add cargo-c native recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Aug 2023 11:03:17 +0100
In-Reply-To: <CA+cAkeq57Q-YPYN-M=9NMj4+rLV6Zzsvx-G5jnA3MqKo_M62KA@mail.gmail.com>
References: <cover.1692164369.git.frederic.martinsons@gmail.com>
	 <88f884f675d3362b5c5fe3daae0965273f41fe63.1692164369.git.frederic.martinsons@gmail.com>
	 <55f80b2075971da2f3c33f5de24ffde2f6813d1f.camel@linuxfoundation.org>
	 <CA+cAkeq57Q-YPYN-M=9NMj4+rLV6Zzsvx-G5jnA3MqKo_M62KA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 10:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186122

On Wed, 2023-08-16 at 11:56 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
>=20
>=20
> Le mer. 16 ao=C3=BBt 2023, 11:23, Richard Purdie
> <richard.purdie@linuxfoundation.org> a =C3=A9crit=C2=A0:
> > On Wed, 2023-08-16 at 07:41 +0200, Frederic Martinsons wrote:
> > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > >=20
> > > This package make it easier to generate C/C++ ABI compatible
> > > header, library and also generate package config file.
> > >=20
> > > It is built around cbindgen (https://github.com/mozilla/cbindgen)
> > > for the header generation, it compiles the library (static or
> > > dynamic)
> > > through cargo and finally handle the generation of a custom
> > > package config file.
> > >=20
> > > Signed-off-by: Frederic Martinsons
> > > <frederic.martinsons@gmail.com>
> > > ---
> > > =C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 1 +
> > > =C2=A0 meta/recipes-devtools/rust/cargo-c-crates.inc |=C2=A0 453 ++++
> > > =C2=A0 .../rust/cargo-c-native_0.9.18.bb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A023 +
> > > =C2=A0 .../rust/files/0001-Add-Cargo.lock-file.patch | 2180
> > > +++++++++++++++++
> > > =C2=A0 4 files changed, 2657 insertions(+)
> > > =C2=A0 create mode 100644 meta/recipes-devtools/rust/cargo-c-
> > > crates.inc
> > > =C2=A0 create mode 100644 meta/recipes-devtools/rust/cargo-c-
> > > native_0.9.18.bb
> > > =C2=A0 create mode 100644 meta/recipes-devtools/rust/files/0001-Add-
> > > Cargo.lock-file.patch
> >=20
> > Should 0001-Add-Cargo.lock-file.patch be here?
>=20
> Hello Richard,=C2=A0
>=20
> What do you mean? The file 0001-Add-Cargo.lock-file.patch is=C2=A0
> present.=C2=A0
> By re reading it though, there is a wrong signed off , will correct
> that in a v5
>=20
> Maybe I missed your point though, sorry if I misunderstood your
> question, can you tell me more?=C2=A0

Sorry, I'm getting a little confused as these are all in the rust
directory and in general you'd assume these patches were for rust
itself.=C2=A0I appreciate now that in this case it isn't.

What you've done will work but is confusing, can you move it to a
cargo-c or cargo-c-native directory please?

Thanks,

Richard



