Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UBRrZ-00077V-7O; Fri, 01 Mar 2013 16:27:12 +0100
Received: by mail-pa0-f43.google.com with SMTP id bh2so1865495pad.2
	for <multiple recipients>; Fri, 01 Mar 2013 07:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=r/pVmbiVCQG8cjJW7XnJXT1rEUE1vRYlBFgyXBMK4lE=;
	b=cKaPAx1i8WQ+DDe9/1UZ2Wc2oRl0cbvDWzxlwKn38QsQIg/P3I3NnOWOkIKQ/axmxt
	HElfRlJd2iGhWVTQh04woBvydeBsYrZXGMRwSHuiNVoILsi8AQukkvUVzmpuQMrSsxgJ
	uuhLbZ6NfYVzVECUZ8jtkCP2BgA42b6dGyX/i3a2PeYWYxPtghpR+ssFvRDML5se7MpP
	amHaI+2XQ51g7TpbswRLg2M7zn87g0+VRSrqxipHwGOFuSDvcPM27MdPd2cFIm+rtsjv
	ZGRxRRpU+0QzJHeAXogC3xNkoKbC6LSRZw4RQJDM2zgKBkW8MU+tNV9oY78OB5hp0XiY
	7qPQ==
X-Received: by 10.66.83.232 with SMTP id t8mr19178280pay.73.1362150644820;
	Fri, 01 Mar 2013 07:10:44 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ri1sm12330441pbc.16.2013.03.01.07.10.41
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 07:10:43 -0800 (PST)
Date: Fri, 1 Mar 2013 16:10:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Constantin Musca <constantinx.musca@intel.com>
Message-ID: <20130301151037.GM3279@jama>
References: <20130212132846.46275501F6@opal>
MIME-Version: 1.0
In-Reply-To: <20130212132846.46275501F6@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Constantin Musca : mesa: upgrade to 9.0.2
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
X-List-Received-Date: Fri, 01 Mar 2013 15:27:18 -0000
X-Groupsio-MsgNum: 36091
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aTCJOP0qgkSGqHWA"
Content-Disposition: inline

--aTCJOP0qgkSGqHWA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 12, 2013 at 01:28:46PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 7a0eca4379b72981a378ffe62f4e8e3428ee791a
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D7a0eca4379b72981a378ffe62f4e8e3428ee791a
>=20
> Author: Constantin Musca <constantinx.musca@intel.com>
> Date:   Mon Feb 11 14:59:55 2013 +0200
>=20
> mesa: upgrade to 9.0.2
>=20
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

This breaks upgrade path:
 * check_data_file_clashes: Package libdricore9.0.2-1 wants to install
 * file /etc/drirc
        But that file is already provided by package  * libdricore9.0.1-1


>=20
> ---
>=20
>  .../mesa/{mesa-9.0.1.inc =3D> mesa-9.0.2.inc}        |    4 ++--
>  .../mesa/{mesa-dri_9.0.1.bb =3D> mesa-dri_9.0.2.bb}  |    0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-9.0.1.inc b/meta/recipes-gra=
phics/mesa/mesa-9.0.2.inc
> similarity index 66%
> rename from meta/recipes-graphics/mesa/mesa-9.0.1.inc
> rename to meta/recipes-graphics/mesa/mesa-9.0.2.inc
> index 9b639da..bed432c 100644
> --- a/meta/recipes-graphics/mesa/mesa-9.0.1.inc
> +++ b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
> @@ -3,8 +3,8 @@ SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/Mes=
aLib-${PV}.tar.bz2 \
>             file://cross-glsl.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "97d6554c05ea7449398afe3a0ede7018"
> -SRC_URI[sha256sum] =3D "57a7ba83bace3f3a7dc0929fe026ef5f0ad454234ec4ad8a=
3e0d31650a75db6f"
> +SRC_URI[md5sum] =3D "dc45d1192203e418163e0017640e1cfc"
> +SRC_URI[sha256sum] =3D "75bf31f26c6e7b5515e610c1005fd1be1f7eeb2c9e685984=
8dab879c355ad64e"
> =20
>  LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D012f69938d81b766472=
fd0d240df38a4"
> =20
> diff --git a/meta/recipes-graphics/mesa/mesa-dri_9.0.1.bb b/meta/recipes-=
graphics/mesa/mesa-dri_9.0.2.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-dri_9.0.1.bb
> rename to meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aTCJOP0qgkSGqHWA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEwxO0ACgkQN1Ujt2V2gBycVQCcCyC3PKmjmRd90TynXRcyWiCS
C/AAn2T4MAGLOQBqg11JeF3+ZopW76+a
=RhNU
-----END PGP SIGNATURE-----

--aTCJOP0qgkSGqHWA--
