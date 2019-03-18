Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id E59B27C64E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:40:27 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id w1so11891524wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 09:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kWQbit85uRIfgN7DBbDM0RkVBdUWAirS0oKfp9ya/ew=;
	b=QEIJEdf6q8UcRJfnH6Ps0Q1ONHMhKBuo9eAgRCOjJuuDqbEwAWjlYMbN5OkrvKezu2
	ZyXmxEudNEfhua8azOfz7SqQ4gwhzM6q/qHqxdnVg8LKSCtQQ2BRnmk1kukNynZLx+gd
	mIT4GANKQTK8tNgL5jtnBiiUzsYx7O4xmrJT9PgYuTRVG7t6GQ0gt/Ldr70lyUBu1zNC
	znSI6fqGgJ+DswhwcHu3TYkxew3kJvuHjrks6OEBtq/Nns4PeGWoLs1n+gWPEGh0cGi9
	2AnJge3zpy18/Ie0Rmwl5x8fUUFEKdfHdBAUc9E+Te0Jv88gh+7G/BDkXBRP1mdqez6W
	q6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kWQbit85uRIfgN7DBbDM0RkVBdUWAirS0oKfp9ya/ew=;
	b=kq8nXfgPw/moVVCDN1msKuHgphw7j6Vb9h0kLshqBEC5XEVTqGmL6h+e1DwbmbtPWO
	r+WGtJLS8TKQkC2SLFbkBQI8HLHUX+5MI57hVE+hE3kC4rKnj3Za5POTx8DKwRtslY26
	X7FIZDhuAad3AyZvfWvq78FxUNNd7PPG0KyhSC4+Uva5f2zHtKFiYCIXPyEINE9yu8uP
	aZmVhJgnk69psw53P+SQVeNRG2z3eqnCwz5l1RpL9efQh6fmPw2+zZpVzgOKvWPwfsYK
	pf4Tt2bCY/ZgsoL6dCafVdk7xQQP+1IiasFrG29cjFmQ1fS7HAij49hpars7EC5wQuNg
	q2dg==
X-Gm-Message-State: APjAAAXHSkbPWfm5TUVOPCyTaueCY/qYOBRSjMD0mA9HQTkobI5B+V8A
	1IfdwUj7+85yZHDTCqsBrt0=
X-Google-Smtp-Source: APXvYqz1a8eIwcZCMKvt0VjZ/MsCQf3G7XCUHfOSqOMrpv7Gy14jGTq2OsbHDBJvXr8liMyp1qvwrQ==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr12952356wrj.16.1552927228570; 
	Mon, 18 Mar 2019 09:40:28 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	11sm11888702wmg.27.2019.03.18.09.40.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Mar 2019 09:40:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 18 Mar 2019 17:40:28 +0100
To: Mark Asselstine <mark.asselstine@windriver.com>
Message-ID: <20190318164028.GD1994@jama>
References: <1552922513-21915-1-git-send-email-mark.asselstine@windriver.com>
	<1552922513-21915-2-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1552922513-21915-2-git-send-email-mark.asselstine@windriver.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [v3][PATCH 2/2] goarch.bbclass: use MACHINEOVERRIDES and simplify go_map_arm()
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
X-List-Received-Date: Mon, 18 Mar 2019 16:40:28 -0000
X-Groupsio-MsgNum: 122348
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline

--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2019 at 11:21:53AM -0400, Mark Asselstine wrote:
> Per https://github.com/golang/go/wiki/GoArm we need to set GOARM when
> cross building for ARMv5, ARMv6 and ARMv7. The current approach of
> using TUNE_FEATURES can be error prone, as we can see today when
> attempting to build for Cortex-A7 which results in GOARM=3D''.
>=20
> Since the value of MACHINEOVERRIDES already consolidates the values of
> TUNE_FEATURES into something more consistent we can use the overrides
> mechanism to set GOARM, leaving just a little bit of logic in
> go_map_arm() to trigger off the arch (basically target vs host)
> for the setting of GOARM.
>=20
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>=20
> V2
> * Cover all ARMv7 Cortex* variants
>=20
> V3
> * Switch to using MACHINEOVERRIDES/overrides mechanism
>=20
>  meta/classes/goarch.bbclass | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 39fea5e..8fdb443 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -3,18 +3,26 @@ BUILD_GOARCH =3D "${@go_map_arch(d.getVar('BUILD_ARCH')=
, d)}"
>  BUILD_GOTUPLE =3D "${BUILD_GOOS}_${BUILD_GOARCH}"
>  HOST_GOOS =3D "${@go_map_os(d.getVar('HOST_OS'), d)}"
>  HOST_GOARCH =3D "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
> -HOST_GOARM =3D "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEAT=
URES'), d)}"
> +HOST_GOARM =3D "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('BASE_GOAR=
M'), d)}"
>  HOST_GO386 =3D "${@go_map_386(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEAT=
URES'), d)}"
>  HOST_GOMIPS =3D "${@go_map_mips(d.getVar('HOST_ARCH'), d.getVar('TUNE_FE=
ATURES'), d)}"
>  HOST_GOTUPLE =3D "${HOST_GOOS}_${HOST_GOARCH}"
>  TARGET_GOOS =3D "${@go_map_os(d.getVar('TARGET_OS'), d)}"
>  TARGET_GOARCH =3D "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
> -TARGET_GOARM =3D "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('TUNE_=
FEATURES'), d)}"
> +TARGET_GOARM =3D "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('BASE_=
GOARM'), d)}"
>  TARGET_GO386 =3D "${@go_map_386(d.getVar('TARGET_ARCH'), d.getVar('TUNE_=
FEATURES'), d)}"
>  TARGET_GOMIPS =3D "${@go_map_mips(d.getVar('TARGET_ARCH'), d.getVar('TUN=
E_FEATURES'), d)}"
>  TARGET_GOTUPLE =3D "${TARGET_GOOS}_${TARGET_GOARCH}"
>  GO_BUILD_BINDIR =3D "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GO=
TUPLE') =3D=3D d.getVar('HOST_GOTUPLE')]}"
> =20
> +# Use the MACHINEOVERRIDES to map ARM CPU architecture passed to GO via =
GOARM.
> +# This is combined with *_ARCH to set HOST_GOARM and TARGET_GOARM.
> +BASE_GOARM =3D ''
> +BASE_GOARM_armv7ve =3D '7'
> +BASE_GOARM_armv7a =3D '7'
> +BASE_GOARM_armv6 =3D '6'
> +BASE_GOARM_armv5 =3D '5'
> +
>  # Go supports dynamic linking on a limited set of architectures.
>  # See the supportsDynlink function in go/src/cmd/compile/internal/gc/mai=
n.go
>  GO_DYNLINK =3D ""
> @@ -74,12 +82,7 @@ def go_map_arch(a, d):
>  def go_map_arm(a, f, d):
>      import re
>      if re.match('arm.*', a):
> -        if 'armv7' in f:
> -            return '7'
> -        elif 'armv6' in f:
> -            return '6'
> -        elif 'armv5' in f:
> -            return '5'
> +        return f
>      return ''

Is this function still useful? Cannot you set TARGET_GOARM and
HOST_GOARM with arm override (to simulate the effect of "re.match('arm.*', =
a)")?

Regards,

> =20
>  def go_map_386(a, f, d):
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXI/J/AAKCRA3VSO3ZXaA
HF6SAKCQLwDhCpUgCb49UJz6mc8NKBDOSACeP5LllrNsc5d3hbhdGGBu+/l7yWc=
=PkZB
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--
