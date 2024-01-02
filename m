Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B90EC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 11:40:17 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.27055.1704195611228752023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 03:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NXR0ZoF3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40d858c56cbso22857135e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 03:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704195609; x=1704800409; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OKDmbL1QED/XZzjS0RH1UGftgPaUfgT/QdXXk+ar4uM=;
        b=NXR0ZoF3I5gml3U8TtSpZUpfbeYf+KinGG7YS+TxTqkkH66AW100kQoaZhQUq7SIPz
         0S27Mhp6nmesTRsLfVsneM1hPeuYWVYrtTtHgiABh/XyjOKu5KXXq5mC11So4rlW7CDI
         2cz1VoRn5HkhH3F/sDrVCgGbpb5xb0olp1t/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704195609; x=1704800409;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKDmbL1QED/XZzjS0RH1UGftgPaUfgT/QdXXk+ar4uM=;
        b=rGAf4b1E7HhOEOlSknVW6LovBT1ibD8aDRwiO+cfmJ0bqU0lOzNWNUQm1qAI75j2xz
         1oQzLLW+CCm0kxtchqYsqCCk3rQ7FDBdV/D/sgULaAINz1OWItJtGB5MOofiEumcO6kE
         02RRKT91CfT6HiOUh0rYgkQHkqY2G+WZ4basBuCz4NFyeSdA4uZU1vssObDPYCDbgdB2
         A6iC0fpyYB5V6cBTxr4il4CDs9eZuyg+xRoFsKgPA5jnnaEqrcqHHn5g7gUOzmUhKHIO
         AZy6lJh3W8eLjHkdEBmUllr/WVjvKwnFQPS+xzh64rCqCj2QPsiYFTGfCclcRoukNZfR
         8F3w==
X-Gm-Message-State: AOJu0YwKVBy1H/PNv37TQGNF/vxGbQU0Zft/EW8yJZxAvkwYey6L8OGg
	aC4BIS4gUyZaxc74hWxNox/nHFCMuBV7kA==
X-Google-Smtp-Source: AGHT+IEzv3qBMW8Htw1ahivLdrdkiKtGWXhjEWDtOjl9mgPLh9ET6lkS0PMDUB4xPcboMqLEQ4iZlw==
X-Received: by 2002:a05:600c:3acb:b0:40d:88fd:a21b with SMTP id d11-20020a05600c3acb00b0040d88fda21bmr1586364wms.52.1704195609634;
        Tue, 02 Jan 2024 03:40:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fbfd:7888:db42:b332? ([2001:8b0:aba:5f3c:fbfd:7888:db42:b332])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c358400b0040d5471f7acsm32532149wmq.13.2024.01.02.03.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 03:40:09 -0800 (PST)
Message-ID: <a46cf5c2b2afd5f73f247c9aefd9b3103201db8d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 2/3] mesa: add support for RustiCL under
 PACKAGECONFIG "opencl"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	=?ISO-8859-1?Q?Zolt=E1n_B=F6sz=F6rm=E9nyi?=
	 <zboszor@gmail.com>
Date: Tue, 02 Jan 2024 11:40:08 +0000
In-Reply-To: <CALT56yPPkLbxQbMtu1o4K5gAoN4MY2uaHPdxJBLgia4Ynw9AUA@mail.gmail.com>
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
	 <20231230191444.1204808-3-dmitry.baryshkov@linaro.org>
	 <cee73ff2f2260660bd9138d13921a5425dbbb333.camel@linuxfoundation.org>
	 <CALT56yPPkLbxQbMtu1o4K5gAoN4MY2uaHPdxJBLgia4Ynw9AUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 11:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193229

On Tue, 2024-01-02 at 12:32 +0200, Dmitry Baryshkov wrote:
> On Sat, 30 Dec 2023 at 23:02, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Sat, 2023-12-30 at 21:14 +0200, Dmitry Baryshkov wrote:
> > > From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> > >=20
> > > Mesa now has two OpenCL implementations: Clover (older one) and Rusti=
CL
> > > (newer one). Extend the "opencl" package config to include both
> > > implementations into the libopencl-mesa (-dev) packages. As the Clove=
r
> > > implementation is in maintenance mode and is expected to be removed a=
t
> > > some point, it doesn't make sense to split the packages or to provide
> > > two config options.
> > >=20
> > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> > > [DB: reworked rust class inheritance]
> > > [DB: merged "rusticl" and "clover" back to "opencl"]
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++++++-----
> > >  1 file changed, 16 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graph=
ics/mesa/mesa.inc
> > > index efbce5caade5..a192562a7935 100644
> > > --- a/meta/recipes-graphics/mesa/mesa.inc
> > > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > > @@ -48,6 +48,12 @@ PROVIDES =3D " \
> > >=20
> > >  inherit meson pkgconfig python3native gettext features_check
> > >=20
> > > +# We can not include rust conditionally, otherwise it can not be ove=
rriden by
> > > +# the bbappends.  Instead always include it, but remove the dependen=
cies by
> > > +# default.
> > > +inherit rust
> > > +INHIBIT_DEFAULT_RUST_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG',=
 'opencl', '', '1', d)}"
> > > +
> >=20
> > I'd really prefer not to have the rust inherit unconditionally. I have
> > some ideas about how we could fix this in bitbake so we may need to
> > wait for that if we can't avoid the PACKAGECONFIG issue from appends...
>=20
> Well, it's not just appends. Extending PACKAGECONFIG from local.conf
> also doesn't work. In fact even adding "opencl" to the default
> PACKAGECONFIG doesn't work unless I move `inherit
> @{bb.utils.contains....` after the PACKAGECONFIG definition. Using
> `INHIBIT_DEFAULT_RUST_DEPS` works around that issue, but yes, it has a
> drawback of including rust unconditionally.

PACKAGECONFIG:append:pn-mesa =3D " opencl"

should work from local.conf?

Cheers,

Richard

