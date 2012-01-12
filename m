Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlJkk-0004bX-Bu
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 13:27:34 +0100
Received: by eaao13 with SMTP id o13so564173eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 04:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XL7JZoejx/DLu2IB9QgJWMpltjolfjpf0+DNc119EPQ=;
	b=JlC35D1vQiJ/QVGvrhdWl4IG3lWdczKiEaa54ftICet9rm+PxyKCR+thyzBAt6Otit
	fT27NFMe1wktPTjgpfSP0XSim5JnA2qykhNbZSjRx6Rf6KI+ExwvS2evP2b5uNUbxHi/
	vhg/akmvVvKpF6V8Ou16GQv4UQ5dXAAWqMi2A=
Received: by 10.213.14.71 with SMTP id f7mr1975066eba.61.1326370803011;
	Thu, 12 Jan 2012 04:20:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t59sm18827397eeh.10.2012.01.12.04.20.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 04:20:01 -0800 (PST)
Date: Thu, 12 Jan 2012 13:19:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120112121949.GB3452@jama.jama.net>
References: <1326369146-4369-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1326369146-4369-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] dbus.inc: s/INC_PR/PR/ to fix PR bump after dbus-launch-helper permission change
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
X-List-Received-Date: Thu, 12 Jan 2012 12:27:34 -0000
X-Groupsio-MsgNum: 15868
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Content-Disposition: inline

--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2012 at 12:52:26PM +0100, Koen Kooi wrote:
> The dbus recipes don't use INC_PR so it didn't get rebuilt after the prev=
ious commit to fix the launch helper permissions
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-core/dbus/dbus.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbu=
s.inc
> index 2a25256..489e8db 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -10,7 +10,7 @@ DEPENDS =3D "expat virtual/libintl ${@base_contains('DI=
STRO_FEATURES', 'x11', '${X
>  DEPENDS_virtclass-native =3D "expat-native virtual/libintl-native"
>  DEPENDS_virtclass-nativesdk =3D "expat-nativesdk virtual/libintl-natives=
dk virtual/libx11"
> =20
> -INC_PR =3D "r1"
> +PR =3D "r1"

Can we move it to dbus_1.4.16.bb too? or change dbus_1.4.16.bb to use
INC_PR, I can imagine someone reusing meta/recipes-core/dbus/dbus.inc in
his layer won't notice that there is PR now.

Cheers,

> =20
>  SRC_URI =3D "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz=
 \
>             file://tmpdir.patch; \
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8Oz+UACgkQN1Ujt2V2gBzoDQCfWAVC33DA4DVy/x5l0qUYIdhE
PXoAniu8jyQ9BysY1+cvjqj5hBzBuI4y
=baVl
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
