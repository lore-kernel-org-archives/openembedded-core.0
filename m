Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1THGIq-0000VT-8g; Thu, 27 Sep 2012 17:47:04 +0200
Received: by wibhj13 with SMTP id hj13so378641wib.6
	for <multiple recipients>; Thu, 27 Sep 2012 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NF8WslLn18NhC4HS0ucUgALMssqEvq1VyhOxGpWFsSo=;
	b=0H/Mwz8DzWyfM2uHaJaKfyGh85Or1wdSjoXXutHZQ8igdqtkjCKorncusiciHpocik
	g0gwTwv0zfw8LpeuZsgNW2qpeKXxEVE+6xq80537AVXu+rDQ330Qb1udD51S95KC1TKp
	wGAsZDe5uvlZGyKorQNR2Oe77d6cSeXRt36YovALbjBVwdWQNw96Za3CLaIgs9tDEufc
	du71a5e60IPylo6UhQvpFQLy4LkzTaIfCp2DXfab1b6vU8ct9nludoEw+Ug0UIw9Bfme
	HraLBnIYMnXj+aRmvCN1y2uFczoPmtQsuuf1o6NA7qV4K0s6xJBZDLzfeBfWLjE5p43Z
	NdZw==
Received: by 10.180.85.99 with SMTP id g3mr9263029wiz.5.1348760052181;
	Thu, 27 Sep 2012 08:34:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm13749738wid.1.2012.09.27.08.34.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 08:34:10 -0700 (PDT)
Date: Thu, 27 Sep 2012 17:34:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120927153419.GD3454@jama.jama.net>
References: <20120927142926.CA9C5103AC@opal>
MIME-Version: 1.0
In-Reply-To: <20120927142926.CA9C5103AC@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Martin Jansa : xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
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
X-List-Received-Date: Thu, 27 Sep 2012 15:47:04 -0000
X-Groupsio-MsgNum: 29997
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline

--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2012 at 02:29:25PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: ed0216d29fc4355c5220f3ad51df04a63cacb0c3
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Ded0216d29fc4355c5220f3ad51df04a63cacb0c3
>=20
> Author: Martin Jansa <martin.jansa@gmail.com>
> Date:   Sat Sep 22 19:13:14 2012 +0200
>=20
> xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
>=20
> * it doesn't make much sense with PV, because xserver-xorg-module-exa
>   was introduced in
>   http://git.openembedded.org/openembedded-core/commit/meta/recipes-graph=
ics/xorg-xserver?id=3D1a666ee1cda3c0b74daba5881fc5f62e13deec66
>   so our xserver-xorg-module-exa RCONFLICTS with xserver-xorg (<=3D 1.11.=
2-r4)
>   and (< 1.11.2) is not good enough
>=20
> * because we don't know how many PRINC are in BSP/DISTRO layers,
>   then it's safer to RCONFLICTS with every older version then current
>   EXTENDPKGV
>=20
> Also fixes whitespace to work correctly with opkg

The whitespace problem wasn't opkg fault AFAIK, but
bb.utils.explode_dep_versions as shown in=20
http://patchwork.openembedded.org/patch/37069/

Cheers

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> --
>=20
> * I haven't really tested this with IPK, since it was changed from
>   RREPLACES to RCONFLICTS (because of RPM) and all my installed devices
>   are already upgraded
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
> index 643ca70..7513399 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -66,7 +66,7 @@ PACKAGES =3D+ "${PN}-security-policy \
> =20
>  RRECOMMENDS_${PN} +=3D "${PN}-security-policy xkeyboard-config rgb xserv=
er-xf86-config"
>  RDEPENDS_${PN}-xvfb +=3D "xkeyboard-config"
> -RCONFLICTS_${PN}-module-exa =3D "${PN} (<${PV})"
> +RCONFLICTS_${PN}-module-exa =3D "${PN} (< ${EXTENDPKGV})"
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

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBkcfsACgkQN1Ujt2V2gBwMrwCcCCfaxDJzfWy+79fKTPgKkZOv
DsYAn3T+YlVlL2u5GIKXB1VrTDpiJyF5
=zrSA
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--
