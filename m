Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C413C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 15:30:08 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.31323.1704209402025563382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 07:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aEp4Sysa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40d89446895so7690535e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704209400; x=1704814200; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZP0MI1R7OInv5QOcDcnE9f9gUhxngEPSkK1rJWYLXeU=;
        b=aEp4Sysatyce+1HT2HaE3GeybdkLfoRYjTruGTPfrbo52LExVF7jR9DN69EtsltGFl
         Mg3cafLYYK6MDuTuBvNSPFi+CSoc4rtbCeZ6v3fSryFmDf8KIfGIJJjZaNls/REY/hDw
         +nSNsvq0C3i07cZo4ytA7wWOEEqlBzjhg27mA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704209400; x=1704814200;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZP0MI1R7OInv5QOcDcnE9f9gUhxngEPSkK1rJWYLXeU=;
        b=HFNdiSNsZ7he4SZXN7/hUkCwLNuR1plxmgwc0D8V7U6lQqKmXfHw54gwpxPcZFJKrr
         97lvwlHp+tHLsBLzBI4YBxRdPL912JToNsKT5U2Nfj5fAj7Z66ve/eXCYHfIqK0PrdVB
         0M21Q/3N4gyzu6sEYrTOJO0DmL+sAF9H+0inLaXBXXnf+bjxE/HWkSrxnnjMIj9YWB3T
         4FzYimCsd9SImEuSzrO8cO+q2/TKHTjqt/qSSlbRBH5YdK9nsROazpUSwsD9Y34DzGxB
         M90uyOYKaBkSA8YjSKMpu2HPsV6/P5AgJIQi2Fxte1CuimgV79n+odjvYBE6dnUtFf9K
         l/Nw==
X-Gm-Message-State: AOJu0Yz9Lcoov2ixySwvyYJncefPNwT3ypERpzhFoufm06YXZZSrw7ja
	Yqo+HloTfrsfTYZlgYuzw670fH0QQ5nzwednpfWnfZWsoow=
X-Google-Smtp-Source: AGHT+IFpUsBnDCWUIjuqwkjueI0GEqA6Ikq7kuzyhjLi1+1qMUlLDNp+p4J9lYIFNyvKxr8YVNh33A==
X-Received: by 2002:a05:600c:4713:b0:40d:734e:665d with SMTP id v19-20020a05600c471300b0040d734e665dmr3113314wmo.41.1704209400448;
        Tue, 02 Jan 2024 07:30:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fbfd:7888:db42:b332? ([2001:8b0:aba:5f3c:fbfd:7888:db42:b332])
        by smtp.gmail.com with ESMTPSA id m13-20020a05600c3b0d00b0040d87d7a253sm8781183wms.27.2024.01.02.07.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 07:29:58 -0800 (PST)
Message-ID: <67deee116e78f2d0695e3cb25b284380465d780c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 2/3] mesa: add support for RustiCL under
 PACKAGECONFIG "opencl"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	=?ISO-8859-1?Q?Zolt=E1n_B=F6sz=F6rm=E9nyi?=
	 <zboszor@gmail.com>
Date: Tue, 02 Jan 2024 15:29:57 +0000
In-Reply-To: <CALT56yPGZjpz0agYzDmmSQeaHXC8g0O=dwLPqcU+kDdJ3WCk+g@mail.gmail.com>
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
	 <20231230191444.1204808-3-dmitry.baryshkov@linaro.org>
	 <cee73ff2f2260660bd9138d13921a5425dbbb333.camel@linuxfoundation.org>
	 <CALT56yPPkLbxQbMtu1o4K5gAoN4MY2uaHPdxJBLgia4Ynw9AUA@mail.gmail.com>
	 <a46cf5c2b2afd5f73f247c9aefd9b3103201db8d.camel@linuxfoundation.org>
	 <CALT56yPGZjpz0agYzDmmSQeaHXC8g0O=dwLPqcU+kDdJ3WCk+g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 15:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193241

On Tue, 2024-01-02 at 17:25 +0200, Dmitry Baryshkov wrote:
> On Tue, 2 Jan 2024 at 13:40, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Tue, 2024-01-02 at 12:32 +0200, Dmitry Baryshkov wrote:
> > > On Sat, 30 Dec 2023 at 23:02, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > On Sat, 2023-12-30 at 21:14 +0200, Dmitry Baryshkov wrote:
> > > > > From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> > > > >=20
> > > > > Mesa now has two OpenCL implementations: Clover (older one) and R=
ustiCL
> > > > > (newer one). Extend the "opencl" package config to include both
> > > > > implementations into the libopencl-mesa (-dev) packages. As the C=
lover
> > > > > implementation is in maintenance mode and is expected to be remov=
ed at
> > > > > some point, it doesn't make sense to split the packages or to pro=
vide
> > > > > two config options.
> > > > >=20
> > > > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gm=
ail.com>
> > > > > [DB: reworked rust class inheritance]
> > > > > [DB: merged "rusticl" and "clover" back to "opencl"]
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > >  meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++++++-----
> > > > >  1 file changed, 16 insertions(+), 5 deletions(-)
> > > > >=20
> > > > > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-g=
raphics/mesa/mesa.inc
> > > > > index efbce5caade5..a192562a7935 100644
> > > > > --- a/meta/recipes-graphics/mesa/mesa.inc
> > > > > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > > > > @@ -48,6 +48,12 @@ PROVIDES =3D " \
> > > > >=20
> > > > >  inherit meson pkgconfig python3native gettext features_check
> > > > >=20
> > > > > +# We can not include rust conditionally, otherwise it can not be=
 overriden by
> > > > > +# the bbappends.  Instead always include it, but remove the depe=
ndencies by
> > > > > +# default.
> > > > > +inherit rust
> > > > > +INHIBIT_DEFAULT_RUST_DEPS =3D "${@bb.utils.contains('PACKAGECONF=
IG', 'opencl', '', '1', d)}"
> > > > > +
> > > >=20
> > > > I'd really prefer not to have the rust inherit unconditionally. I h=
ave
> > > > some ideas about how we could fix this in bitbake so we may need to
> > > > wait for that if we can't avoid the PACKAGECONFIG issue from append=
s...
> > >=20
> > > Well, it's not just appends. Extending PACKAGECONFIG from local.conf
> > > also doesn't work. In fact even adding "opencl" to the default
> > > PACKAGECONFIG doesn't work unless I move `inherit
> > > @{bb.utils.contains....` after the PACKAGECONFIG definition. Using
> > > `INHIBIT_DEFAULT_RUST_DEPS` works around that issue, but yes, it has =
a
> > > drawback of including rust unconditionally.
> >=20
> > PACKAGECONFIG:append:pn-mesa =3D " opencl"
>=20
> Yes, I tried that. I got an error about rust tools not being defined.
> I think the :append: and overrides are handled after the inherit
> argument is handled. So it is either PACKAGECONFIG being fully defined
> before inherit (literally before), or inherit ends up with an empty
> argument.

The append and overrides would be expanded at the time the expression
in the inherit statement is evaluated so if that didn't work there is
something else at play...

Cheers,

Richard



