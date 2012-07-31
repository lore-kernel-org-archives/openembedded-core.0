Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SwCau-00049A-17; Tue, 31 Jul 2012 15:34:40 +0200
Received: by wgbdr1 with SMTP id dr1so5191408wgb.24
	for <multiple recipients>; Tue, 31 Jul 2012 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xsFocQJnUE0tzTrrlMFQvH+xpCVN0iH3XAMiCI/O6qY=;
	b=VFB9rVY+4Wj5gIDywUoGSK1zxVxQMu7JCUswoCwyDNb+dHiq7cDcaMAuVGxcv5OHf0
	D7GCxepVwidMLhvEKbalO+NHgjpFmUvCuQg3OdseL6Fx+Lp0t/TlGJ3dpZS6FafGWP6S
	XkVfO8xOCcyFNaRfKIvCIBtnve0D6J2kYFJPEsrD18GKMMZ0F33uWjImgoGD8I6ORxEG
	+WhtdIBMhAEfMTDINtfpUsmGOi/7S+YNaxhbAU4r/RlExghfrYAjnBBwfUr5mgPR9A9U
	1GcffyHLOeXvc4k2VxL5uloCPmDOc86VGUEFrrthxj+/Q25Zw5O9PxEETVtnYejdSFUw
	Wa7w==
Received: by 10.180.103.4 with SMTP id fs4mr6832564wib.16.1343740982917;
	Tue, 31 Jul 2012 06:23:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm218381wix.6.2012.07.31.06.23.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 06:23:01 -0700 (PDT)
Date: Tue, 31 Jul 2012 15:22:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120731132257.GW3261@jama.jama.net>
References: <20120731110242.D424910219@opal>
MIME-Version: 1.0
In-Reply-To: <20120731110242.D424910219@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Radu Moisan : dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Tue, 31 Jul 2012 13:34:40 -0000
X-Groupsio-MsgNum: 26572
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/Y6L//1es8ezVqBy"
Content-Disposition: inline

--/Y6L//1es8ezVqBy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 11:02:42AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: c02364f36e228835ea5d7fd4e1d347fd451f8544
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dc02364f36e228835ea5d7fd4e1d347fd451f8544
>=20
> Author: Radu Moisan <radu.moisan@intel.com>
> Date:   Tue Jul 31 09:23:23 2012 +0300
>=20
> dbus: include dbus-launch in the main dbus package
>=20
> Followed suggestions from Bugz 2261:
>=20
> 2) make the virtual/libx11 DEPENDS conditional based on the x11 distro fe=
ature.
> This makes the build dependencies reflect the feature list.
>=20
> 3) remove dbus-x11, meaning that dbus-launch with its potential X11 depen=
dency
> is now back in dbus where is belongs.
>=20
> 4) make dbus provide dbus-x11, for compatibility.

5) create new warning:
NOTE: multiple providers are available for runtime dbus-x11 (dbus, dbus-nat=
ivesdk)
NOTE: consider defining a PREFERRED_PROVIDER entry to match dbus-x11

Cheers,

>=20
> Fixes [Yocto #2261]
>=20
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-core/dbus/dbus.inc |   10 ++++++----
>  1 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbu=
s.inc
> index a75583d..164c4d3 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -31,10 +31,11 @@ CONFFILES_${PN} =3D "${sysconfdir}/dbus-1/system.conf=
 ${sysconfdir}/dbus-1/session
> =20
>  DEBIANNAME_${PN} =3D "dbus-1"
> =20
> -PACKAGES =3D+ "${PN}-lib ${PN}-systemd ${@base_contains('DISTRO_FEATURES=
', 'x11', '${PN}-x11', '', d)}"
> +PACKAGES =3D+ "${PN}-lib ${PN}-systemd"
> =20
> -FILES_${PN}-x11 =3D "${bindir}/dbus-launch"
> -RDEPENDS_${PN}-x11 =3D "${PN}"
> +# for compatibility
> +RPROVIDES_${PN} =3D "dbus-x11"
> +RREPLACES_${PN} +=3D "dbus-x11"
> =20
>  FILES_${PN}-systemd =3D "${systemd_unitdir}/system/"
> =20
> @@ -43,6 +44,7 @@ FILES_${PN} =3D "${bindir}/dbus-daemon* \
>                 ${bindir}/dbus-cleanup-sockets \
>                 ${bindir}/dbus-send \
>                 ${bindir}/dbus-monitor \
> +               ${bindir}/dbus-launch \
>                 ${libexecdir}/dbus* \
>                 ${sysconfdir} \
>                 ${localstatedir} \
> @@ -59,7 +61,7 @@ pkg_postinst_dbus() {
>  }
> =20
>  EXTRA_OECONF_X =3D "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x=
', '--without-x', d)}"
> -EXTRA_OECONF_X_virtclass-native =3D "--without-x"
> +EXTRA_OECONF_X_virtclass-native =3D "--disable-x11-autolaunch"
> =20
>  EXTRA_OECONF =3D "--disable-tests \
>                  --disable-checks \
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/Y6L//1es8ezVqBy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAX3DEACgkQN1Ujt2V2gBzO7QCdETmYMRNTMZUPWhwe5xOzx/on
FDYAni2U03tZEaOs/a7JKKcTcwE7PFpO
=ylPN
-----END PGP SIGNATURE-----

--/Y6L//1es8ezVqBy--
