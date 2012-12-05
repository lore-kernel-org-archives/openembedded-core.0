Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgKVU-0004zS-7K
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 20:19:44 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3087150eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 11:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RoTgZ/Gj5S1oCOPsF9yj0kcFh4c0Kgey/qifTb5oDy8=;
	b=i5PsA+GX2+OJ5ftcfDhEfyVty5Rp73ScV0GEkLDTyw7TCHXajvmPmKElk7JurirL+l
	iDl310ewVO0+L3IXbdsTGXxHYyNTF/rsJegj5tVuFMVtTemCBDSdvzzoFdw1ds2O8NZi
	kz1nAACfuUwrJEMmXDNzILhdja8asr0CyUyF03DhLGre7e0gUDQPciuc66Gb1coaaOQX
	Ke6eRW2kRs5Z7kZ1lYRXfpMg8XtDBBvrB11tmiQgdVF48AttvzPTJ9zn6h9BlFepY8xM
	cy5xK20qO3K50ANIIWMtOJGryUVf3/Nqct9qSfWRlB2geYtGCgHN3g2394lMgb1Q7Wom
	sxXQ==
Received: by 10.14.184.131 with SMTP id s3mr63458664eem.38.1354734320025;
	Wed, 05 Dec 2012 11:05:20 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 43sm10859379eed.10.2012.12.05.11.05.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 11:05:19 -0800 (PST)
Date: Wed, 5 Dec 2012 20:05:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121205190516.GF3396@jama.jama.net>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
	<3ea1d54a3b1673540257592c1cfdaa9faf7a5d43.1354731942.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3ea1d54a3b1673540257592c1cfdaa9faf7a5d43.1354731942.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 4/5] git: fix unpackaged python files
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
X-List-Received-Date: Wed, 05 Dec 2012 19:19:44 -0000
X-Groupsio-MsgNum: 32290
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A9z/3b/E4MkkD+7G"
Content-Disposition: inline

--A9z/3b/E4MkkD+7G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2012 at 07:26:06PM +0100, Martin Jansa wrote:
> * fixes:
> git-1.7.7: git: Files/directories were installed but not shipped
>   /usr/lib64
>   /usr/lib64/python2.7
>   /usr/lib64/python2.7/site-packages
>   /usr/lib64/python2.7/site-packages/git_remote_helpers-0.1.0-py2.7.egg-i=
nfo
>   /usr/lib64/python2.7/site-packages/git_remote_helpers
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/__init__.py
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/util.pyc
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/__init__.pyc
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/util.py
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/git
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/git/__init__.py
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/git/importer.pyc
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/git/non_local.pyc
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/git/exporter.py
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/git/git.py
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/git/repo.py
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/git/__init__.pyc
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/git/importer.py
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/git/exporter.pyc
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/git/repo.pyc
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/git/git.pyc
>   /usr/lib64/python2.7/site-packages/git_remote_helpers/git/non_local.py
>=20
> * fixes [YOCTO #3344]
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/git/git.inc      | 4 ++--
>  meta/recipes-devtools/git/git_1.7.7.bb | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/gi=
t/git.inc
> index 55e1482..80a88c2 100644
> --- a/meta/recipes-devtools/git/git.inc
> +++ b/meta/recipes-devtools/git/git.inc
> @@ -16,7 +16,7 @@ EXTRA_OECONF =3D "--with-perl=3D${STAGING_BINDIR_NATIVE=
}/perl-native/perl \
> =20
>  EXTRA_OEMAKE =3D "NO_PYTHON=3D1"
> =20
> -inherit autotools perlnative
> +inherit autotools perlnative python-dir
> =20
>  do_compile_prepend () {
>  	# Remove perl/perl.mak to fix the out-of-date perl.mak error
> @@ -58,7 +58,7 @@ FILES_${PN}-perltools +=3D " \
>  RDEPENDS_${PN}-perltools =3D "${PN} perl perl-module-file-path findutils"
> =20
>  PACKAGES =3D+ "${PN}-python"
> -FILES_${PN}-python =3D "${libdir}/python*"
> +FILES_${PN}-python =3D "${libdir}/python* ${PYTHON_SITEPACKAGES_DIR}"
> =20
> =20
>  # git-tk package with gitk and git-gui
> diff --git a/meta/recipes-devtools/git/git_1.7.7.bb b/meta/recipes-devtoo=
ls/git/git_1.7.7.bb
> index 9d24911..6b6e04b 100644
> --- a/meta/recipes-devtools/git/git_1.7.7.bb
> +++ b/meta/recipes-devtools/git/git_1.7.7.bb
> @@ -1,6 +1,6 @@
>  require git.inc
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  SRC_URI =3D "http://git-core.googlecode.com/files/git-${PV}.tar.gz"
>  SRC_URI[md5sum] =3D "5d645884e688921e773186783b65ce33"

Oh, this isn't sometimes enough.. in some cases like commit message it's
using wrong python-config and installing to paths like on host (lib64).

Sending v2 soon

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--A9z/3b/E4MkkD+7G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC/muwACgkQN1Ujt2V2gBx5gwCffz6t0/zyrssoASXVwYBA1+A9
0R4An1uo3htAEBGa0PPS0zb6fzflP5SD
=N4xr
-----END PGP SIGNATURE-----

--A9z/3b/E4MkkD+7G--
