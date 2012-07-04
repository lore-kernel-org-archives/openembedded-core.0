Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SmTUa-0003zI-IZ
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 19:35:56 +0200
Received: by wgbdr1 with SMTP id dr1so6880786wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2PdA7V2ciQWq+lq63Xdc7L/n1ACLrK6rkPN7y7hO6hg=;
	b=IEAvnZi50du2T5pPHJWceChlcZQvS9qhUn23syKx+5k6n25lFJghcJrwP6nrFJYRnY
	2G3k/SyOK0kuOJc0AGPCsWM0l97967qqPVkspFB/7IVre9gmsF9xMczPnd+6penzFyuK
	Thws7hbwYv49CIeTGl9UG/woZmoyCOQ9uHhUxrx6oalJJiBz1cJU/ACKIXgtUOJUWHjm
	NVtIcnTxJ+U0DGqgt1xgn4+dVzvLAUnuRPeFQ3tCx2PFLFebfOD8w73di0pQ61bn66Cz
	XVz/9JX/BOsju8LTK13VRH+k4TWOGKRU6dFXZSMLBC5pTe/Yyk/wctdTmMU0xX1G2f88
	OI9Q==
Received: by 10.180.78.35 with SMTP id y3mr34383812wiw.16.1341422693482;
	Wed, 04 Jul 2012 10:24:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm64868968wix.5.2012.07.04.10.24.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jul 2012 10:24:52 -0700 (PDT)
Date: Wed, 4 Jul 2012 19:24:46 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120704172446.GG15100@jama.jama.net>
References: <1341298228-4412-1-git-send-email-laurentiu.palcu@intel.com>
	<1341298228-4412-4-git-send-email-laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1341298228-4412-4-git-send-email-laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 03/10] xcb-util: upgrade to 0.3.9
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
X-List-Received-Date: Wed, 04 Jul 2012 17:35:56 -0000
X-Groupsio-MsgNum: 24677
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qVHblb/y9DPlgkHs"
Content-Disposition: inline

--qVHblb/y9DPlgkHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 03, 2012 at 09:50:20AM +0300, Laurentiu Palcu wrote:
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>

This bumps SO version, so package is renamed from
libxcb-util0 to libxcb-util1

all packages which need libxcb-util .so need PR bump now..

> ---
>  .../xcb/{xcb-util_0.3.8.bb =3D> xcb-util_0.3.9.bb}   |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/xcb/{xcb-util_0.3.8.bb =3D> xcb-util_0.3.9.=
bb} (62%)
>=20
> diff --git a/meta/recipes-graphics/xcb/xcb-util_0.3.8.bb b/meta/recipes-g=
raphics/xcb/xcb-util_0.3.9.bb
> similarity index 62%
> rename from meta/recipes-graphics/xcb/xcb-util_0.3.8.bb
> rename to meta/recipes-graphics/xcb/xcb-util_0.3.9.bb
> index b7eff29..6f2cd43 100644
> --- a/meta/recipes-graphics/xcb/xcb-util_0.3.8.bb
> +++ b/meta/recipes-graphics/xcb/xcb-util_0.3.9.bb
> @@ -5,5 +5,5 @@ LIC_FILES_CHKSUM =3D "file://src/xcb_aux.c;endline=3D30;m=
d5=3Dae305b9c2a38f9ba27060191
>                      file://src/xcb_event.h;endline=3D27;md5=3D627be355ae=
e59e1b8ade80d5bd90fad9"
>  PR =3D "r0"
> =20
> -SRC_URI[md5sum] =3D "8ce019c4bbf20dce246b98f177cfccff"
> -SRC_URI[sha256sum] =3D "c1eed9284750bc09352e60654df77bb585dbbe7673fdcc67=
5e58b7f3a0b447b9"
> +SRC_URI[md5sum] =3D "01dcc7a16d5020530552712710646ea2"
> +SRC_URI[sha256sum] =3D "c611259c0ab20fd76f79f48f4684843c18ea9c967eba78a4=
5e8b3636315c18c4"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qVHblb/y9DPlgkHs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/0fF4ACgkQN1Ujt2V2gBy2+gCgo5S1TS+0QqsGjbMENebnQFKs
TB0An0BKT8aarT94dFBEqGuiHNeEUzSP
=7y+E
-----END PGP SIGNATURE-----

--qVHblb/y9DPlgkHs--
