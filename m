Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPqgY-0002Br-41
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 10:47:20 +0200
Received: by mail-pb0-f50.google.com with SMTP id jt11so138617pbb.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 01:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=fkXWU24VbnccWyByvRY2Oi1Km75JGKuP9HGo9nl672Q=;
	b=dS6ZTzRUQfvxQU2iyEla/Le9mRgHhOy3bFCJPU4a/MmZxxIVenxn0aOoeWi/y+zZzU
	/ZnEwIRhr8RYFQRoBFOyQrzaQFMLfCg+OBIvK8sozuwSwyPid8tWVwapEA/DqAS0Km5n
	wwWpehtKHh5s1HVlmkR4Z6p88mB1N6Db05f9429/6H5zN2DJZGzzbvlKAPF+tMdzRRH3
	0EbyoXIAJbzAkD16tVYVBfdVLnoBqVSYtVY1Ckcyokp6cizkRrtNQVT7W8oJzsQJY8jJ
	XFPlOgbtN6R5cjKepcxue4TNGjciEniEoIBbFVZodiAl0mgq4/IxhZGiN5ChgXiE3PN5
	rjhA==
X-Received: by 10.68.204.71 with SMTP id kw7mr1570238pbc.40.1365582596189;
	Wed, 10 Apr 2013 01:29:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id dr4sm5609575pbb.19.2013.04.10.01.29.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 01:29:55 -0700 (PDT)
Date: Wed, 10 Apr 2013 10:29:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130410082947.GB2471@jama>
References: <1365578806-1907-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1365578806-1907-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] bitbake.conf: include machine name in DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Wed, 10 Apr 2013 08:47:21 -0000
X-Groupsio-MsgNum: 37718
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 09:26:46AM +0200, Koen Kooi wrote:
> This allows a clean seperation between all image outputs and making it po=
ssible to have convinience symlinks to make it ready to deploy. And while i=
t isn't a valid reason, it must be mentioned: BSP layers which do use conve=
nience symlinks already don't step on files owned by others anymore.
>=20
> I assumed this was the default behaviour in OE-classic, but as it turns o=
ut every DISTRO set it to deploy/images/$MACHINE on its own.
>=20
> Code inspections shows that the all references to the image deploy dir in=
 classes and scripts in OE-core do the right thing and parse the DEPLOY_DIR=
_IMAGE variable.
>=20

AFAIK we also deploy only MACHINE_ARCH images, so it nicely indicates
that (like deploy/<pkg>/MACHINE_ARCH).

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index cd5d61e..0540766 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -379,7 +379,7 @@ DEPLOY_DIR_TAR =3D "${DEPLOY_DIR}/tar"
>  DEPLOY_DIR_IPK =3D "${DEPLOY_DIR}/ipk"
>  DEPLOY_DIR_RPM =3D "${DEPLOY_DIR}/rpm"
>  DEPLOY_DIR_DEB =3D "${DEPLOY_DIR}/deb"
> -DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR}/images"
> +DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR}/images/${MACHINE}"
>  DEPLOY_DIR_TOOLS =3D "${DEPLOY_DIR}/tools"
> =20
>  PKGDATA_DIR =3D "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
> --=20
> 1.8.1.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFlIvsACgkQN1Ujt2V2gBygIACfdTgQgEL6QJrHbO1rXv4RrxoC
V+IAn1qkoMDw/KmIpmMjXYIGm+39KYN2
=VZ0L
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
