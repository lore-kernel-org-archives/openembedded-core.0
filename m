Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 323E177254
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 10:48:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o80so2152410wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 03:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=F5rg+BQFE/u7wiohl5SGf95fIkGx7QzOk+Ka9nEQ1Dc=;
	b=EjA2E/BDcYgjuArDWHrY/FzZxqQsaa91C09qOOoc4pTlCFKVGI/LwTneLTRTWkW594
	zK2JZOPRyaaAnGP/X+8cZ3yUcUvCWi8JES1Qv/WbZiT2BpUk+gU0CyAR7XnrxJHR7M0w
	3zX9ySrHM1uPZ9CjG6Zzoa0nMgeOYn7a99m/QeWVJ7kOe/ClvGijLIThEmEl2wBspnSP
	myFUdZ2G5V0877TDpKsBYuAaLHcn/kK+yjxO5OxXUlriwPFDVJnMSgKTRrdd2Ad7iPBx
	tw8NqAOU56bU7pxz+A8pNkBz5lmtpze7Jz8eHwbAIT6gNsAV/UFWTEyoM1rVHvo383QV
	03qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=F5rg+BQFE/u7wiohl5SGf95fIkGx7QzOk+Ka9nEQ1Dc=;
	b=Vwr8bxNbS3YVpHFXs+rnmJZ1vybjwQvqjPzWc/swnTT/r6wdJTEmGPDsKeUxZx833y
	Ud/dnvUd3HeIMDvKLxsMYvsoY/oIu6/hIZzVL5lbKADEMZ5wrbaAyoWK1+Vo6nKgFfOm
	zCILYvKazLDVCv/Y4NztZaziM82+H1fdkGYRunyiGWLsMoh+vp6xO1O8rg+G7nLyG0vf
	IoYqXkxo6UhBJE9x2X1hQoLUc4e2XJzvVfBbu/GsV0RW6gVsIDUyJL9He9KJfcoort2+
	YG3TxTbubqAE07mPCXR7By9WmQXxWNJjXuU/SMofip9spAgo5Iu2CPo4ut2hCzwt7L4o
	NZdg==
X-Gm-Message-State: AEkoouu55UyFR4eIH9mw/nce+QQEjlQv8Z2YePMWcCvlOQ7JNfwT0/g5SkOQRblDB1dQEw==
X-Received: by 10.194.110.42 with SMTP id hx10mr14576259wjb.116.1470998939262; 
	Fri, 12 Aug 2016 03:48:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	142sm1990508wmh.12.2016.08.12.03.48.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Aug 2016 03:48:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 12 Aug 2016 12:48:59 +0200
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20160812104859.c5zhna6xj24eptct@jama>
References: <1470997583-13210-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1470997583-13210-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] curl: upgrade to 7.50.1
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
X-List-Received-Date: Fri, 12 Aug 2016 10:49:00 -0000
X-Groupsio-MsgNum: 85711
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xio7k2x7nqp5r5sb"
Content-Disposition: inline

--xio7k2x7nqp5r5sb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2016 at 11:26:23AM +0100, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>

If the <=3D is correct, then you might reuse this from Armin's commit:

This fixes 3 CVES:

CVE-2016-5419
CVE-2016-5420
CVE-2016-5421

Affects curl <=3D 7.50.0

> ---
>  meta/recipes-support/curl/{curl_7.50.0.bb =3D> curl_7.50.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/curl/{curl_7.50.0.bb =3D> curl_7.50.1.bb} (9=
4%)
>=20
> diff --git a/meta/recipes-support/curl/curl_7.50.0.bb b/meta/recipes-supp=
ort/curl/curl_7.50.1.bb
> similarity index 94%
> rename from meta/recipes-support/curl/curl_7.50.0.bb
> rename to meta/recipes-support/curl/curl_7.50.1.bb
> index 6a5be25..a21419a 100644
> --- a/meta/recipes-support/curl/curl_7.50.0.bb
> +++ b/meta/recipes-support/curl/curl_7.50.1.bb
> @@ -14,8 +14,8 @@ SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.ta=
r.bz2 \
>  #
>  SRC_URI +=3D " file://configure_ac.patch"
> =20
> -SRC_URI[md5sum] =3D "9e463ff8fdc1b5daa81c850c514980ec"
> -SRC_URI[sha256sum] =3D "608dfe2db77f48db792c387e7791aca55a25f0b42385707a=
d927164199ecfa9a"
> +SRC_URI[md5sum] =3D "015f6a0217ca6f2c5442ca406476920b"
> +SRC_URI[sha256sum] =3D "3c12c5f54ccaa1d40abc65d672107dcc75d3e1fcb38c2674=
84334280096e5156"
> =20
>  inherit autotools pkgconfig binconfig multilib_header
> =20
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xio7k2x7nqp5r5sb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAletqZsACgkQN1Ujt2V2gBwQKACdFJEFTVWFkOOOlaRavTmzpRN6
InkAoJCLy8cGQ1g2x3POMUJHQE+fQz/M
=9YiF
-----END PGP SIGNATURE-----

--xio7k2x7nqp5r5sb--
