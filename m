Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4F99661E92
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 12:29:41 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id c10so1217841wiw.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 05:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zAzmpct2y56oFvi8UsMeC3U4bg64bfDwRKUGdZKcnCM=;
	b=Ec1zDdlZ4Np93E5Ipu45cZMFg7lZY5d4kRWply4VwMddQRgwiUViPieQUWAxgHkFXd
	B6zp2TdCPWjr52Z0DiktgaT/xoPDU4yfNiqygMzbAI4rDDq/cxj1LYsxZHS13a9Grbhh
	Aite5dHZcRY3V5ara0ZCqkXj+ejEYyoiPAoloH9KLSuOLS0ICHAHpBFZ7L90f9yYyIjh
	9mwxHhesMe4YD2jcuJQfgGrY+eotc5eCk9bh5EheivJvkxBW540aoJnnZakPqnntjm4+
	ONVL3a0FWdK25QC9JhNLH2HeoZMJoRccA2jjmhV3070kGFmVqG1lqDZ09D8DB9/Pv2Dv
	7wNw==
X-Received: by 10.180.14.130 with SMTP id p2mr6446331wic.32.1370435381263;
	Wed, 05 Jun 2013 05:29:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b19sm4173808wik.10.2013.06.05.05.29.40 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 05 Jun 2013 05:29:40 -0700 (PDT)
Date: Wed, 5 Jun 2013 14:29:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20130605122958.GF30727@jama>
References: <1370434054-5470-1-git-send-email-cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <1370434054-5470-1-git-send-email-cristian.iorga@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: upgrade to 1.15
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jun 2013 12:29:42 -0000
X-Groupsio-MsgNum: 40180
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xaMk4Io5JJdpkLEb"
Content-Disposition: inline

--xaMk4Io5JJdpkLEb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2013 at 03:07:34PM +0300, Cristian Iorga wrote:
> Bugfix release.

Duplicate
http://lists.openembedded.org/pipermail/openembedded-core/2013-June/079477.=
html

>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../connman/{connman_1.14.bb =3D> connman_1.15.bb}                   |  =
  4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/connman/{connman_1.14.bb =3D> connman_1=
=2E15.bb} (73%)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman_1.14.bb b/meta/rec=
ipes-connectivity/connman/connman_1.15.bb
> similarity index 73%
> rename from meta/recipes-connectivity/connman/connman_1.14.bb
> rename to meta/recipes-connectivity/connman/connman_1.15.bb
> index f9a5ecc..0ec29c9 100644
> --- a/meta/recipes-connectivity/connman/connman_1.14.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.15.bb
> @@ -7,8 +7,8 @@ SRC_URI  =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${=
BP}.tar.xz \
>              file://inet-fix-ip-cleanup-functions.patch \
>              "
> =20
> -SRC_URI[md5sum] =3D "6c9ecaf9c044f8c66a7b465f6716b569"
> -SRC_URI[sha256sum] =3D "d0c37452a4e8eec27e433ff901a6c447963b9d8a8ceddd4a=
7311cc322e2dbf8c"
> +SRC_URI[md5sum] =3D "e785c0c4564bfffb5215272f1be6f17c"
> +SRC_URI[sha256sum] =3D "8229cc5e3e75197453ba2a644c03860a7cf9f4f27fcbf111=
bb589530d4efb58f"
> =20
>  PR =3D "${INC_PR}.0"
> =20
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xaMk4Io5JJdpkLEb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGvL0YACgkQN1Ujt2V2gByjiQCffZlXQPkj4lYjDvtK1WgT+GBZ
W/kAnjAfYLFKAHmCiASMhpOMx92blNRB
=EzyF
-----END PGP SIGNATURE-----

--xaMk4Io5JJdpkLEb--
