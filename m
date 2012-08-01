Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwhBz-00050K-QR
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 00:15:00 +0200
Received: by wibhm2 with SMTP id hm2so4480460wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 15:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BibFm6jLDyQfH5ebzss2VBWJCdDayDCJCB0fXOhRnJI=;
	b=lrC9n3XxACY44AtGqMV1t7ceB3RIodypcmbc8ykCjKrw6c07/1oLFA6zqcLOpE8OOy
	bZtjqqOYaWMrColaUeiCAVxph6z+ai8hmyP4eQUaYHS9u8t24FXVdqnQvqB4OWLNIpYf
	zqeee1rPhTrBc/JSsSsXM5Egdko2Ta9gGf1m4Zr5z8T+Cw4WuT2RPlLMfMMoIqPckT1i
	PcWowvxUiJKZ9GhNt/MkirZWgZq4vxJkLCl3GjE5mGcVJsW5HZAxxADMrvrMFsdVXaox
	LBE7Eqs4v87pk+BR0qolci+qq1epa0RbdNIWugSVnxNWAALpn0UzYf0Hg4sanY+lTkUj
	7Ixw==
Received: by 10.180.93.68 with SMTP id cs4mr15194837wib.14.1343858601284;
	Wed, 01 Aug 2012 15:03:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr4sm11937896wib.8.2012.08.01.15.03.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 15:03:20 -0700 (PDT)
Date: Thu, 2 Aug 2012 00:03:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120801220318.GL16306@jama.jama.net>
References: <1343858083.9756.63.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1343858083.9756.63.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] dbus: Ensure dbus-nativesdk doesn't RPROVIDE dbus-x11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 22:15:00 -0000
X-Groupsio-MsgNum: 26724
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yaPAUYI/0vT2YKpA"
Content-Disposition: inline

--yaPAUYI/0vT2YKpA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 10:54:43PM +0100, Richard Purdie wrote:
> dbus-x11 should not RPROVIDE dbus-x11 as this is incorrect and confuses
> builds. This fixes the nativesdk case.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbu=
s.inc
> index 164c4d3..1984c74 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -33,9 +33,12 @@ DEBIANNAME_${PN} =3D "dbus-1"
> =20
>  PACKAGES =3D+ "${PN}-lib ${PN}-systemd"
> =20
> +OLDPKGNAME =3D "dbus-x11"
> +OLDPKGNAME_virtclass-nativesdk =3D ""
> +
>  # for compatibility
> -RPROVIDES_${PN} =3D "dbus-x11"
> -RREPLACES_${PN} +=3D "dbus-x11"
> +RPROVIDES_${PN} =3D "${OLDPKGNAME}"
> +RREPLACES_${PN} +=3D "${OLDPKGNAME}"

what about this?
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-August/026947.h=
tml

> =20
>  FILES_${PN}-systemd =3D "${systemd_unitdir}/system/"
> =20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yaPAUYI/0vT2YKpA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAZp6YACgkQN1Ujt2V2gBzNtgCgi/e+XAI7nePA4cIJMDsi4iKb
YJMAn00wuzQ4KDbzy6ger0By2cSjMwmO
=nXa4
-----END PGP SIGNATURE-----

--yaPAUYI/0vT2YKpA--
