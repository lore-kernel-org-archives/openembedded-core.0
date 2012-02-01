Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RscNS-00054m-7d
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 16:45:42 +0100
Received: by eaal10 with SMTP id l10so76842eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2012 07:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lROAqJBDbyhmnpHX6Dwni5PZjCUljV5LEAQR1ocBv1E=;
	b=oBVMKCnMJZgyMV88Rc6Ey7Mi6dcDv4q3/DTMKLZ6EjWXCJRLbjW0hBcij1jN7qUOG7
	eEVg3fi0Gt0ngB2oHJF+TwyYv4y1UAk7X7CIxQmr/ZeHJ64QlmPrED6kp/ZdKeaus+L3
	rD7jcllvZS/iw1VHA8OBqcLpzRvFm5bi+1rpw=
Received: by 10.213.3.5 with SMTP id 5mr1209855ebl.91.1328110666887;
	Wed, 01 Feb 2012 07:37:46 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm46075341eei.0.2012.02.01.07.37.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Feb 2012 07:37:44 -0800 (PST)
Date: Wed, 1 Feb 2012 16:37:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120201153742.GA6969@jama.jama.net>
References: <20120201151531.BE60410330@opal>
MIME-Version: 1.0
In-Reply-To: <20120201151531.BE60410330@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Saul Wold : opkg-utils: convert to git repo at git.yoctoproject.org
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
X-List-Received-Date: Wed, 01 Feb 2012 15:45:42 -0000
X-Groupsio-MsgNum: 16837
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 01, 2012 at 03:15:31PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: b44717c29c4f50917570039adf896680d24bb216
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Db44717c29c4f50917570039adf896680d24bb216
>=20
> Author: Saul Wold <sgw@linux.intel.com>
> Date:   Tue Jan 31 10:27:53 2012 -0800
>=20
> opkg-utils: convert to git repo at git.yoctoproject.org
>=20
> The svn.openmoko.org site seems to have become unstable, make a copy
> and convert to git at git.yoctoproject.org to preserve history
>=20
> [YOCTO #1867]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  .../{opkg-utils_svn.bb =3D> opkg-utils_git.bb}       |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/re=
cipes-devtools/opkg-utils/opkg-utils_git.bb
> similarity index 82%
> rename from meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> rename to meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> index 9702131..d2dfda6 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -6,11 +6,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f \
>                      file://opkg.py;beginline=3D1;endline=3D18;md5=3D1591=
7491ad6bf7acc666ca5f7cc1e083"
>  RDEPENDS_${PN} =3D "python"
>  RDEPENDS_${PN}_virtclass-native =3D ""
> -SRCREV =3D "4747"
> -PV =3D "0.1.8+svnr${SRCPV}"
> -PR =3D "r7"
> +SRCREV =3D "002d29bc605d7c2d02e4cf20a43c5277c15f5597"
> +PV =3D "0.1.8+git${SRCPV}"

Should this be +git or +gitr?

in OE-classic we have mostly +gitr, +git is used only without SRCPV:
OE @ ~/oe $ git grep "+git\\$" | wc -l
22
OE @ ~/oe $ git grep "+gitr\\$" | wc -l
368

meta-oe has always +gitr:
OE @ ~/meta-openembedded $ git grep "+gitr\\$" | wc -l
24
OE @ ~/meta-openembedded $ git grep "+git\\$" | wc -l
0

and oe-core has mostly +git:
OE @ ~/openembedded-core $ git grep "+gitr\\$" | wc -l
9
OE @ ~/openembedded-core $ git grep "+git\\$" | wc -l
78

It's only cosmetics but we should use one format if possible.

http://www.yoctoproject.org/docs/current/poky-ref-manual/poky-ref-manual.ht=
ml
doesn't say anything about SRCPV (only SRCREV) so nothing about prefered
+git(r).

BTW: there are also 2 recipes not using SRCPV
meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb:PV =3D "2.0.pre11+=
git${SRCREV}"
meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb:PV =3D "v2.0.pre16+g=
it${SRCREV}"
1 in meta-oe
meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb:PV =3D "3.4.0-${PR}+g=
itr${SRCREV}"

Cheers,

> +PR =3D "r0"
> =20
> -SRC_URI =3D "svn://svn.openmoko.org/trunk/src/host/;module=3Dopkg-utils;=
proto=3Dhttp \
> +SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dgit \
>             file://index-ignore-filenotfound.patch \
>             file://mtime-int.patch \
>             file://add-license-field.patch \
> @@ -18,7 +18,7 @@ SRC_URI =3D "svn://svn.openmoko.org/trunk/src/host/;mod=
ule=3Dopkg-utils;proto=3Dhttp \
>             file://shebang.patch \
>             "
> =20
> -S =3D "${WORKDIR}/opkg-utils"
> +S =3D "${WORKDIR}/git"
> =20
>  # Avoid circular dependencies from package_ipk.bbclass
>  PACKAGES_virtclass-native =3D ""
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8pXEYACgkQN1Ujt2V2gBzlKwCcCe6+NTpR+1EhrldmkGSFDWuq
AZQAniZKFG/EQs0yunTgXYh9GbGSjxb+
=N3aB
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
