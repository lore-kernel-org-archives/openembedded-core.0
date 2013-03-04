Received: from mail-pa0-f51.google.com ([209.85.220.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UCQrn-00037D-T0
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 09:35:28 +0100
Received: by mail-pa0-f51.google.com with SMTP id hz1so3009659pad.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 00:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=5sC26+SNj46Tx8W+e6Cpoy5V9uw6wM5KfGGGoQ+jJsA=;
	b=whgQl7LHvJ3K668C16yMVoJ4IfaaSyN2WIe6AQVfmzovIaoZZpsYFsaNuCO6fUgA/H
	qcXakSOXWhmE7FWH73ME6a8UkFZZSVQcHmDeM+EXgS+qwwYTJ1IWS3txSFOprqocyhIT
	wgy4LWWTptoumGraJWo5HBWGu3LztwyCi3YuLyDEqJJbTcCL/V9+vCseWgIU/UkK4o9X
	LxoY3ReuaZd9wyWD6WPz578MpnFSyKBWkkg1WxYjtgYCAClScYvfmkqEB4dSiv4MuvPw
	SzIx1AEohERwp9YCo61k33oGxv0Ewv6yhGc4FNnDI4wpt3j5tdCV/Ur2IQycT/DabSHv
	PwaQ==
X-Received: by 10.66.251.102 with SMTP id zj6mr31198503pac.7.1362385139717;
	Mon, 04 Mar 2013 00:18:59 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id y9sm23089367paw.1.2013.03.04.00.18.54
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 00:18:57 -0800 (PST)
Date: Mon, 4 Mar 2013 09:18:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: randy.macleod@windriver.com
Message-ID: <20130304081846.GC3268@jama>
References: <1362360870-12148-1-git-send-email-randy.macleod@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1362360870-12148-1-git-send-email-randy.macleod@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] apr: add libtool to SSTATE_SCAN_FILES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2013 08:35:28 -0000
X-Groupsio-MsgNum: 36170
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
Content-Disposition: inline

--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 03, 2013 at 08:34:30PM -0500, randy.macleod@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The hardcoded paths in libtool will cause apache2 compile fail at
> link stage when the package apr is installed from sstate cache, so
> add libtool to SSTATE_SCAN_FILES.
>=20
> [ CQID: WIND00405372 ]

You can drop this.

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-support/apr/apr_1.4.6.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support=
/apr/apr_1.4.6.bb
> index b7220e0..77dffee 100644
> --- a/meta/recipes-support/apr/apr_1.4.6.bb
> +++ b/meta/recipes-support/apr/apr_1.4.6.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0c35ff3c4c83b8=
9d2f076e315caac28b \
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI =3D "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
>             file://configure_fixes.patch \
> @@ -43,7 +43,7 @@ do_install_append() {
>  	cp ${S}/${HOST_SYS}-libtool ${D}${datadir}/build-1/libtool
>  }
> =20
> -SSTATE_SCAN_FILES +=3D "apr_rules.mk"
> +SSTATE_SCAN_FILES +=3D "apr_rules.mk libtool"
> =20
>  SYSROOT_PREPROCESS_FUNCS +=3D "apr_sysroot_preprocess"
> =20
> --=20
> 1.8.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE0WOYACgkQN1Ujt2V2gBw8eACfeRhUbpmScbpPZ4nWG9HbK/Jo
8vMAn2U2yiWStW38xCX1sPSHTT5DSlNw
=L9Sg
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--
