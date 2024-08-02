Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3CDC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 12:51:53 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.92125.1722603111496066725
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 05:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IyXwG1wn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.173, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f15e48f35bso7700371fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 05:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722603109; x=1723207909; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tD5d+gih9u7PXKCvPu83gbCnktJBg8OkydljPKLgyXI=;
        b=IyXwG1wnqbN9Uq44kRKbyBrrb5Od8gMHcNZiDINkFrJYRTxWk2ChKyKQZZWgD5g8Sn
         VtgJsKIuFbTJWckYysKHpeGwlp4hJG1oa3t6tkbeks5CYZCMzYrWrLQ+FJX1UjSdO+tV
         jMRYZAVcNfrbuHoe/uC7/mFETrv/5cFivWWGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722603109; x=1723207909;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tD5d+gih9u7PXKCvPu83gbCnktJBg8OkydljPKLgyXI=;
        b=M3ctbONCy35m6MP+Yu05hci73aMjOtETsFJe6B9cL95ZrzPvYuUJ3lNImGWyWu+0Jh
         lqf5cYGCYsv/ikqMDcW+VsapCTyVRGsdesi5tomHne7oD3E1zB09c2cLJLJIUuRX3mQb
         L1TYSI9X/vbbNmPDkRGAOpQocVaMxJm5wW1z+2MSN+mOGMjBip/L07C202MoJrYppK0m
         od60MhAZViGAZUDxRD/tvcCisy3gzYc2+wXgEq+EhbRm0OMZA2Z6Hd68vDU0EiRiJqJX
         xb8pFmAUuzb74MiTTzTywtG82vdc3TS6xk6fSv68Pe4s6ISGQy+bwSqRC+jDlo33b/4k
         Uc2A==
X-Gm-Message-State: AOJu0YzzD+tJuwQh37PdpFDZr9tF/BYlBtnIWHIz1UGs7ai6D98+RBok
	FNRPUZV/czxQSEJphqaiT3vZ7ZUGqrwmj4/J+QWCNclxoJhWZTakMr4qzj384NM=
X-Google-Smtp-Source: AGHT+IHFUiGq5vrIKgAdez3scaOEo5ZcyMcQREuvSSZjjl0dvv2y0INm2sN6MJ1wxK0bf10cuM1W1w==
X-Received: by 2002:a2e:320e:0:b0:2f1:597b:9aa4 with SMTP id 38308e7fff4ca-2f15ab0c27amr24080861fa.35.1722603109046;
        Fri, 02 Aug 2024 05:51:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e1c0:4ec6:2f32:2a4? ([2001:8b0:aba:5f3c:e1c0:4ec6:2f32:2a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e9cd14sm31885205e9.45.2024.08.02.05.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 05:51:48 -0700 (PDT)
Message-ID: <b1828490c77c3546ce1b263cf4968bd25f52a573.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/2] ell: add ptests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, Martin =?ISO-8859-1?Q?Hundeb=F8ll?=
 <martin@geanix.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 02 Aug 2024 13:51:45 +0100
In-Reply-To: <AE35C2E5-DFDE-4817-8068-95D30C567870@arm.com>
References: <20240801082253.974486-1-martin@geanix.com>
	 <AE35C2E5-DFDE-4817-8068-95D30C567870@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 12:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202907

On Fri, 2024-08-02 at 12:36 +0000, Ross Burton via
lists.openembedded.org wrote:
> On 1 Aug 2024, at 09:22, Martin Hundeb?ll via lists.openembedded.org
> <martin=3Dgeanix.com@lists.openembedded.org> wrote:
> > diff --git a/meta/recipes-core/ell/ell_0.67.bb b/meta/recipes-
> > core/ell/ell_0.67.bb
> > index 6b0ebbe62113..ee9aa73d2908 100644
> > --- a/meta/recipes-core/ell/ell_0.67.bb
> > +++ b/meta/recipes-core/ell/ell_0.67.bb
> > @@ -10,9 +10,27 @@ SECTION =3D "libs"
> > LICENSE=C2=A0 =3D "LGPL-2.1-only"
> > LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Dfb504b67c50331fc78734fed90fb0e09"
> >=20
> > -DEPENDS =3D "dbus"
> > +DEPENDS =3D "dbus openssl-native xxd-native"
>=20
> This should be conditional on ptest, right?
>=20
> > +EXTRA_OECONF +=3D "--enable-tests --enable-maintainer-mode"
>=20
> Make this conditional on ptest too?
>=20
> > +do_compile:prepend() {
> > +=C2=A0=C2=A0=C2=A0 mkdir -p ${B}/unit
> > +}
>=20
> This sounds like a broken Makefile.am that has a bad assumption in.
>=20
> > +do_install_ptest() {
> > +=C2=A0=C2=A0=C2=A0 install -m755 -Dt ${D}${PTEST_PATH} $(find ${B}/uni=
t -
> > executable -type f)
> > +=C2=A0=C2=A0=C2=A0 install -Dt ${D}${PTEST_PATH}/unit \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${S}/unit/dbus.conf \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${S}/unit/settings.test \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(find ${B}/unit -name \*.p=
em -type f)
> > +}
>=20
> As the test scripts are built with libtool, it=E2=80=99s best to use libt=
ool
> =E2=80=94mode=3Dinstall to install them.

Thanks for the review Ross. There was also a failure in automated
testing on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6864/step=
s/12/logs/stdio

The arm tests haven't run yet in that build.

Cheers,

Richard



