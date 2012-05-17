Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUvtp-0006AX-Ap
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 10:17:29 +0200
Received: by wibhm14 with SMTP id hm14so5614541wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nh5S8uqPZthEBR9waRv9xXNcjpd0uULnR7oYxum4934=;
	b=eDDazpwf+/QGDmhAPAb6Q1LP7kvTybrmYZgHcMQ8kYAzF7OqrIFspYFzetSJy2oiZh
	HjmTE6E0rUjnREdZzjiQO5ysKU29LeHGiQC3DGqnWPtvIIONwj4QQ5KDo12eQYWh471j
	hsfSWzaJf8QRSt3HCqrFACBd6KBzVbtz8JBgYsbpDIWejRBbgpDXtjNStS+jKotvjlPB
	ZL1zv3dp8se7Cw5m/ftlyM1mJiFjbU/1pArJKDwCFrtoOkDNq5ezMZx5PbMuCvTfsaYw
	7ToEXMuJQ3ty1924AqbIszgegiEoDXvaTlHwrsbloZVR64A4rvLesAReZSPWixP6p5Ru
	046Q==
Received: by 10.180.79.72 with SMTP id h8mr48627773wix.1.1337242047062;
	Thu, 17 May 2012 01:07:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j3sm18566048wiw.1.2012.05.17.01.07.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 01:07:26 -0700 (PDT)
Date: Thu, 17 May 2012 10:07:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120517080725.GD3164@jama.jama.net>
References: <1337242038-8854-1-git-send-email-radu.moisan@intel.com>
MIME-Version: 1.0
In-Reply-To: <1337242038-8854-1-git-send-email-radu.moisan@intel.com>
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
X-List-Received-Date: Thu, 17 May 2012 08:17:29 -0000
X-Groupsio-MsgNum: 22276
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline

--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 11:07:18AM +0300, Radu Moisan wrote:
> ---
>  build/conf/sanity_info                             |    3 +++
>  build/pseudodone                                   |    1 +
>  .../{man-pages_3.36.bb =3D> man-pages_3.41.bb}       |    4 ++--
>  3 files changed, 6 insertions(+), 2 deletions(-)
>  create mode 100644 build/bitbake.lock
>  create mode 100644 build/conf/sanity_info
>  create mode 100644 build/pseudodone


^^^

>  rename meta/recipes-extended/man-pages/{man-pages_3.36.bb =3D> man-pages=
_3.41.bb} (80%)
>=20
> diff --git a/build/bitbake.lock b/build/bitbake.lock
> new file mode 100644
> index 0000000..e69de29
> diff --git a/build/conf/sanity_info b/build/conf/sanity_info
> new file mode 100644
> index 0000000..3744c0d
> --- /dev/null
> +++ b/build/conf/sanity_info
> @@ -0,0 +1,3 @@
> +SANITY_VERSION 1
> +TMPDIR /home/radu/Documents/Development/yocto/poky/build/tmp
> +SSTATE_DIR /home/radu/Documents/Development/yocto/poky/build/sstate-cache
> diff --git a/build/pseudodone b/build/pseudodone
> new file mode 100644
> index 0000000..a9331dd
> --- /dev/null
> +++ b/build/pseudodone
> @@ -0,0 +1 @@
> +/home/radu/Documents/Development/yocto/poky/build/tmp/sysroots/x86_64-li=
nux/usr/bin
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

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+0sb0ACgkQN1Ujt2V2gByX3ACdE5eHm8+v6OfX0v3S5BnYRrsi
WnsAni7bqDjBlEhsHhWT16nZhn2+/w8d
=ssVF
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
