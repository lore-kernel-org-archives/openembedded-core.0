Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1ACC433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 22:51:57 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.3676.1637621516011674380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:51:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YMlrDh+q;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d5so35534566wrc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=ux0iUuudY/I7+o3Asi6Snm3z2aVsy4bTSkdYetfY6QI=;
        b=YMlrDh+qW+p87BXtKsjVZc7vNTNOcgCgT4z/bKChNUSI6v5Oi093RfZwUSxfuMP8wa
         FToVyhs2tXXdzUBKwW9Q6pyVPsEaDfV3/t4Ks0TNqpXWj0N/glx79zsDDy+9TuVcdj+b
         o+1NMLH8V8qQm3FxCcLoYcW3euznZNLWVxSBKZLkgwxB2cOQk4qyuukUGvH3giNLwVIm
         BxIkSEkMybSbw/ssWn7Gfqfe7UqnWFa/fZFLpWG4PsGLljJ0Dai0lo7wJICeslxlJcTf
         ZRmkUJx7Fm91/msseRcJwZOSlxPIaKz6pxVAXejg9ivvCNV0EBp4hoXgTVqFA/+FCjJm
         l1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=ux0iUuudY/I7+o3Asi6Snm3z2aVsy4bTSkdYetfY6QI=;
        b=oHUxk8brL56CkuQ2/7bApivsEZo3vtVOXxzpmakAc7DU4ADbgh53QTRcLIKyXC8T2r
         t9tRN05vD86LJDrRGz+fZSfqH3T8o1ETFzNqI32o1i1pZHrkk1qc4y02uTfgwPDjFnJe
         0Xw9AxfFstyrHfkCuJVQT3HKV76cRObqvQivQ6/jGXZKdhc7iPdYMkIfAgDLLOIF1mA8
         LCVNKYkC6tEsASKJ8fUnQQvRNFfm4E6cv5EG6PQhoEuQ7hN/4/pAQ9SQotGxwofXVViR
         efuXEvymIeDfRS3bEaFYgNX41gnN5TaIzUCaNxs/YJLSvNUkbWE30uMrWS0DuWO48Pz6
         0L1g==
X-Gm-Message-State: AOAM530uBlutaMULgvY/u+hLR46xgQuj6UVnmHQ/yzXwRums7RTWhdkz
	gg6CJKXSiI0Ra1V8Ryb7UQk=
X-Google-Smtp-Source: 
 ABdhPJxMHTCkfgHDEe429j4u9V4r3d6glTeb1M5AXsFhRjo3UeugUqa+yvGUUPRn564jG4Yab/JBqA==
X-Received: by 2002:a5d:4143:: with SMTP id c3mr1212712wrq.254.1637621514610;
        Mon, 22 Nov 2021 14:51:54 -0800 (PST)
Received: from ?IPv6:2a01:4b00:f41a:3600:df86:cebc:8870:2184?
 ([2a01:4b00:f41a:3600:df86:cebc:8870:2184])
        by smtp.googlemail.com with ESMTPSA id
 r15sm21896694wmh.13.2021.11.22.14.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 14:51:53 -0800 (PST)
Message-ID: <35bd52bb21646cd9aa61eae4921a1232bb2908b6.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 4/7] systemd: remove volatile-binds
 RDEPENDS for nativesdk
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Date: Mon, 22 Nov 2021 22:51:52 +0000
In-Reply-To: 
 <db2638a45928ea0d875de1cc62c9fc4ea5dc9149.camel@linuxfoundation.org>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <20211119113429.502652-1-luca.boccassi@gmail.com>
	 <20211119113429.502652-4-luca.boccassi@gmail.com>
	 <db2638a45928ea0d875de1cc62c9fc4ea5dc9149.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+GpzIm8zZ/DcrLvVywjY"
User-Agent: Evolution 3.42.1-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 22:51:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158593


--=-+GpzIm8zZ/DcrLvVywjY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-11-22 at 11:56 +0000, Richard Purdie wrote:
> On Fri, 2021-11-19 at 11:34 +0000, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >=20
> > Not needed for SDK binaries
> >=20
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v2: remove dependency instead of adding nativesdk to volatile-binds
> >=20
> > =C2=A0meta/recipes-core/systemd/systemd_249.5.bb | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/recipes-core/systemd/systemd_249.5.bb
> > b/meta/recipes-core/systemd/systemd_249.5.bb
> > index 9993036aac..2928a85c93 100644
> > --- a/meta/recipes-core/systemd/systemd_249.5.bb
> > +++ b/meta/recipes-core/systemd/systemd_249.5.bb
> > @@ -644,6 +644,7 @@ FILES:${PN}-dev +=3D
> > "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
> > =C2=A0RDEPENDS:${PN} +=3D "kmod dbus util-linux-mount util-linux-umount
> > udev (=3D ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-
> > linux-fsck"
> > =C2=A0RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'seria=
l-
> > getty-generator', '', 'systemd-serialgetty', d)}"
> > =C2=A0RDEPENDS:${PN} +=3D "volatile-binds"
> > +RDEPENDS_${PN}_remove_class-nativesdk =3D "volatile-binds"
> > =C2=A0
> > =C2=A0RRECOMMENDS:${PN} +=3D "systemd-extra-utils \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 udev-hwdb \
>=20
> This patch raises a few questions like how this is being tested?
>=20
> The override syntax changed so the avoid would never have worked with
> master.
>=20
> Also, I have a strong preference for not using remove operators in
> OE-Core, you
> can usually rearrange things so that it isn't necessary. The reason
> for that is
> that it is very hard to override these operations. I know we do have
> some but
> minimising them is good.
>=20
> Cheers,
>=20
> Richard

It was tested in a downstream dunfell branch, since that's what our
build system supports. I was not aware there had been a backward
incompatible syntax change, thanks for the hint.

--=20
Kind regards,
Luca Boccassi

--=-+GpzIm8zZ/DcrLvVywjY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmGcHwgACgkQSylmgFB4
UWL7pwf+JFxCmjgbBV4C/tx1DbIeUfn/6GVER7TVri4BYey0XaQpXrwJH1eSx8Rt
7FVMi8aULTihHhLvIrH2unlTsuWReFvzW5pYUQW39WiAuwmPXWlhRVfnq94upVmG
8X+nX/0gCJTq9NArAO1XAozPWZK0fmr+R2E/OtwuILhUD9tj21HL+JzqmIGszOdV
FT8mISfHi0OixkxQX2LjP+hNw+QMXGlQ3Cn11D5IVkvv3G+N8DUXuzb12ZQeerik
vhkM40i8a/KbHDbowbVBzfFFqrn3a4IwXFASpflBsRRm0YMs0wgkRpXqQtKxtxT1
ua7PKtJFlIDGPYOpkZV1sAA1GUx68g==
=cW3n
-----END PGP SIGNATURE-----

--=-+GpzIm8zZ/DcrLvVywjY--

