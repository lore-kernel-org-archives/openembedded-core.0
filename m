Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TF1V9-0006hQ-7V; Fri, 21 Sep 2012 13:34:31 +0200
Received: by wgbdq11 with SMTP id dq11so2229221wgb.24
	for <multiple recipients>; Fri, 21 Sep 2012 04:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ItozG5DBK0UDT/h34DU/YW/TipjPCwTKhv6e/k+fegs=;
	b=TSmdjoVdwrE+7g115dM7mNMR93v6Mk1DwCxn1pfSI+qruLmKjFEaaytpV6yBjRJFWi
	wpFA59rgMCpW5xcLWeG2qFXAIpWmX00LT9qROBy5oVOQhHZNuElqVoqNz1BY22fWVETp
	jh7M4ktqrdZWRDwh45VCT6JgSiw0daaduZhUgGJrd8Uw5XDve8mibIwATc//4chpuPVu
	Mm3hwvOUsGa06EmlceHLahSIdI9OnGUZ63+HhqghHtbz2Z8WqfnDMPkW+xKONpTAcpB4
	BaKWRPXI8LQ3G60mPs4SmXiPg21pYWy57tISdedtQn8+E5q8sTo3SxXyfh6DDvnOIEzm
	v3kg==
Received: by 10.180.79.103 with SMTP id i7mr3913197wix.13.1348226507516;
	Fri, 21 Sep 2012 04:21:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm16130784wib.0.2012.09.21.04.21.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 04:21:46 -0700 (PDT)
Date: Fri, 21 Sep 2012 13:21:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120921112144.GE10268@jama.jama.net>
References: <20120919170333.7835210338@opal>
MIME-Version: 1.0
In-Reply-To: <20120919170333.7835210338@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Saul Wold : xserver-xorg: Modify RREPLACES for RCONFLICTS
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
X-List-Received-Date: Fri, 21 Sep 2012 11:34:31 -0000
X-Groupsio-MsgNum: 29629
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h56sxpGKRmy85csR"
Content-Disposition: inline

--h56sxpGKRmy85csR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 19, 2012 at 05:03:33PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 467c59495d83748d35846e8b37548182fea99cbf
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D467c59495d83748d35846e8b37548182fea99cbf
>=20
> Author: Saul Wold <sgw@linux.intel.com>
> Date:   Mon Sep 17 09:17:01 2012 -0700
>=20
> xserver-xorg: Modify RREPLACES for RCONFLICTS
>=20
> fix bad runtime dependency that was causing -exa to be a suitable candida=
te for xserver-xorg, thus resulting in no X server in some situations
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b=
/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> index c71896a..35cb33a 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
> @@ -8,4 +8,4 @@ SRC_URI +=3D "file://crosscompile.patch \
>  SRC_URI[md5sum] =3D "8796fff441e5435ee36a72579008af24"
>  SRC_URI[sha256sum] =3D "fa415decf02027ca278b06254ccfbcceba2a83c274140525=
7ebf749da4a73cf2"
> =20
> -PR =3D "r7"
> +PR =3D "r8"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
> index 210abad..643ca70 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -66,7 +66,7 @@ PACKAGES =3D+ "${PN}-security-policy \
> =20
>  RRECOMMENDS_${PN} +=3D "${PN}-security-policy xkeyboard-config rgb xserv=
er-xf86-config"
>  RDEPENDS_${PN}-xvfb +=3D "xkeyboard-config"
> -RREPLACES_${PN}-module-exa =3D "${PN}"
> +RCONFLICTS_${PN}-module-exa =3D "${PN} (<${PV})"

Hmm now it fails in do_rootfs for me :/

| Collected errors:
|  * check_conflicts_for: The following packages conflict with xserver-xorg=
-module-exa:
|  * check_conflicts_for: 	xserver-xorg *
|  * opkg_install_cmd: Cannot install package packagegroup-shr-minimal-x.
| ERROR: Function failed: do_rootfs (see /var/lib/jenkins/jobs/shr-core/wor=
kspace/shr-core/tmp-eglibc/work/om_gta02-oe-linux-gnueabi/shr-image-2.0-r20=
/temp/log.do_rootfs.8716 for further information)

> =20
>  FILES_${PN} =3D "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${l=
ibdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xor=
g/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.con=
f.d"
>  FILES_${PN}-dev +=3D "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules=
/*/*.la"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h56sxpGKRmy85csR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBcTccACgkQN1Ujt2V2gBykPwCggx6nDn1oWu+B5u3UbPbNmeYD
5+8AmwVRkf2b4sQ+w8jIEnvpOWkLlu9D
=NxJc
-----END PGP SIGNATURE-----

--h56sxpGKRmy85csR--
