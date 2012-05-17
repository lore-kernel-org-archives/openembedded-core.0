Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUvRw-0004Hx-DK
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 09:48:48 +0200
Received: by wgbdr1 with SMTP id dr1so1311146wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 00:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J0N8gts8WRIn4T7/MlW0XGFT+l0gnhJ3VkPPcUOdD/c=;
	b=Z2Sf4HMPivd9BoQCjh4MRZPucqp9VnhCRytB+M8YYp90E4nEVv8Zn8gOjQq0oLNUM/
	T1DC9ldyJTomaT9C6B9WaEOaNMN6HBNZ3iyjEej61XEz6dberwrUNI4kzMypikopu+/2
	KEO4M4l1AxfsbNGjvmtJcdUGwwQ0rcdINnyC6ogqxhDEoetbxJSiTUqT4oveUc6f8PsJ
	ut1+zGwByy+o8e5jAHDxZpsZL44W6lvPRb+VvJmDhMSpyN8l5glXMtlJml20lqulBgCH
	gwmQKcFyQbKqKXMnPwor90A6BiLHmgO3xOSn8gv1qYWgSxDpDFcbRiNNKxDp7b3FAGZH
	TI1A==
Received: by 10.216.218.230 with SMTP id k80mr3925780wep.39.1337240315548;
	Thu, 17 May 2012 00:38:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z3sm56328851wix.0.2012.05.17.00.38.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 00:38:34 -0700 (PDT)
Date: Thu, 17 May 2012 09:38:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120517073833.GB3164@jama.jama.net>
References: <1337238883-7920-1-git-send-email-radu.moisan@intel.com>
MIME-Version: 1.0
In-Reply-To: <1337238883-7920-1-git-send-email-radu.moisan@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] man-pages: Update to 3.41
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
X-List-Received-Date: Thu, 17 May 2012 07:48:49 -0000
X-Groupsio-MsgNum: 22270
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline

--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 10:14:43AM +0300, Radu Moisan wrote:
> ---
>  .../{man-pages_3.36.bb =3D> man-pages_3.41.bb}       |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/man-pages/{man-pages_3.36.bb =3D> man-pages=
_3.41.bb} (80%)
>=20
> diff --git a/meta/recipes-extended/man-pages/man-pages_3.36.bb b/meta/rec=
ipes-extended/man-pages/man-pages_3.41.bb
> similarity index 80%
> rename from meta/recipes-extended/man-pages/man-pages_3.36.bb
> rename to meta/recipes-extended/man-pages/man-pages_3.41.bb
> index 6025a87..cc1c224 100644
> --- a/meta/recipes-extended/man-pages/man-pages_3.36.bb
> +++ b/meta/recipes-extended/man-pages/man-pages_3.41.bb
> @@ -8,8 +8,8 @@ PR =3D "r1"
>  LIC_FILES_CHKSUM =3D "file://README;md5=3D0422377a748010b2b738342e24f141=
c1"
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/docs/man-pages/Archive/${BPN}-${P=
V}.tar.gz"

^ this could be simplified to
"${KERNELORG_MIRROR}/linux/docs/${PN}/Archive/${BP}.tar.gz"

Cheers,

> =20
> -SRC_URI[md5sum] =3D "cfe991b1ce9e0ea5355f29ff9fcac125"
> -SRC_URI[sha256sum] =3D "c0575e31f73cd9dc2761c274217e06e7130fdfee51017095=
7a9d72d012a5437c"
> +SRC_URI[md5sum] =3D "ee8412e72dc79f3c62573add29954b26"
> +SRC_URI[sha256sum] =3D "13f08bf1bb7429cd7208acd41250f36fb6b2e12ab9f86f7e=
8fa8c67af142d81d"
> =20
>  RDEPENDS_${PN} =3D "man"
> =20
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

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+0qvkACgkQN1Ujt2V2gByiegCeOsZ+NmN2my9BPQ/dLXyNYDTC
ykMAnRyYsKxxNt5o1nPgcVntnL5Jj0J6
=C447
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--
