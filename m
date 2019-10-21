Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 542D27EC95
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 20:23:01 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f22so14046574wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 13:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=k/WoLX/SnSBv53EpGqPVhZxeEBIghIxKk8k+opKENBM=;
	b=hXn6S2ygjc9vLMtzRS5mRm7iPewIlnE71tb7rZ0hQCUw5bjOXRa6v46/uaVMZUB+PC
	U8UegCbubj1DSzxuUJ2tP9woNZUgo115bmpoK3Iy05GhfSj9BA1Ey8V047f70XQbkIlc
	TRPDdwV3JyLzHLiaTEZBbX4ireDtRGXP3izpnOVo2DoqK21sRwRsJeG1eZ/MpfhsvQXh
	+hG7upzdpMZU4hibRIV9o4Ouvpr5A35kZrNvBZZD6r1BCPk+rMW7tcT7eib47vR5McD+
	ghVyvXQN+KalWZIMmXtYzh92y33eFL8trusy/plDKh8db7n1rStqd7nHBYg6fvbIu4kr
	gSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=k/WoLX/SnSBv53EpGqPVhZxeEBIghIxKk8k+opKENBM=;
	b=GbXjUioQ3zFlCzfCjUZSiG8Tz+7xc7MDjtH3aYl/8LWbH8wBCDgMqd5VyWDr2+0J2F
	7VeFRofIUhkjP5CdfEwFVpc5JfBT1C8gfpDDbmkFEv5+sjbOBHmJVAsf93mcNrB8AEfp
	Q1tv5UwP7N3+0muX0IC3MP3AQAHLc4nvfZQfQAvpK0WomxpXSRWVxrOPZ1bvswrGPz0l
	C3ULJwgepDYnp+frBnUS9bzdxw/hfefSOioqyqI9xj5exvSfGl6Wrn9CzinSBkIy2JI4
	vdjdpbHEIJD0el/q3PXUxO7f3clSH1S8+0UljiDkZtg8oD6BykM0HD18XCWLdPHHDkLc
	VM1g==
X-Gm-Message-State: APjAAAW+db3cUjDE0e6xJRfNcQQgoCd83Liekilh1P2dfUHInp2eZWFt
	p1NCC0g/WNRg1J004dlxjxY=
X-Google-Smtp-Source: APXvYqzFNuVDySc/3yJ81HjKaJYEqZQDyEkZC4WEsHPm4b/XP2QFdpX/ReNZUSYxWFZco2UC/Bq18w==
X-Received: by 2002:a1c:2c88:: with SMTP id s130mr8684458wms.66.1571689382164; 
	Mon, 21 Oct 2019 13:23:02 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id a2sm3235492wrv.39.2019.10.21.13.23.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Oct 2019 13:23:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Oct 2019 22:23:03 +0200
To: bruce.ashfield@gmail.com
Message-ID: <20191021202303.GA1500@jama>
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
	<501fbbcc04603d80fb47727bdde64ca5abe14e87.1571688520.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
In-Reply-To: <501fbbcc04603d80fb47727bdde64ca5abe14e87.1571688520.git.bruce.ashfield@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] perf: fix v5.4+ builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Oct 2019 20:23:02 -0000
X-Groupsio-MsgNum: 130302
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2019 at 04:16:15PM -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> When building perf for 5.4+, we have some new files that need to
> be copied (and synchronized) due to structural changes in the
> kernel source tree.
>=20
> Some of the issues these fixes are warnings, but none the less,
> they are worth fixing.
>=20
>  - We copy arch/${ARCH}/Makefile, since it is source by some perf
>    Makefiles
>=20
>  - We copy scripts/, since the perf utilities are looking for files
>    in that directory stucture.
>=20
>  - We have *three* copies of ctypes.h in the tools/* hierarchy
>    during the build. If the tools/perf/util/include/linux/ variant
>    is used, it will trigger build errors since it is not complete.
>    We copy the kernel's main include/linux/ctype.h to ensure they
>    are in sync.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index 8201c0cb60..0f5df74f11 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -113,6 +113,8 @@ PERF_SRC ?=3D "Makefile \
>               tools/Makefile \
>               tools/perf \
>               tools/scripts \
> +             scripts/ \
> +             arch/${ARCH}/Makefile \
>  "
> =20
>  PERF_EXTRA_LDFLAGS =3D ""
> @@ -246,6 +248,11 @@ do_configure_prepend () {
> =20
>      # bits.h can have the same issue as unistd.h, so we make the tools v=
ariant take precedence
>      [ -e ${S}/tools/include/linux/bits.h ] && install -D -m0644 ${S}/too=
ls/include/linux/bits.h ${S}/include/linux/bits.h
> +
> +    [ -e ${S}/tools/perf/util/include/linux/ctype.h ] && install -D -m06=
44 ${S}/include/linux/ctype.h ${S}/tools/perf/util/include/linux/ctype.h

This one doesn't look right, why are you checking for the destination
existence instead of source?

> +    [ -e ${S}/include/uapi/linux/kvm.h ] && install -D -m0644 ${S}/inclu=
de/uapi/linux/kvm.h  ${S}/tools/include/uapi/linux/kvm.h
> +    [ -e ${S}/include/uapi/linux/sched.h ] && install -D -m0644 ${S}/inc=
lude/uapi/linux/sched.h  ${S}/tools/include/uapi/linux/sched.h
>  }
> =20
>  python do_package_prepend() {
> --=20
> 2.19.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXa4TpwAKCRA3VSO3ZXaA
HE4TAKCCoW6s2yaFmrIDOZ7yVpnYq9p+DwCfZ32MhCxkuCnNMQrpmQrBD46EGX8=
=VmjH
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
