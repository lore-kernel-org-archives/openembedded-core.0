Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 461D3605F2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 10:49:14 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c1so2743242eek.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2013 03:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+4zNWICjgTLGbggPKCIyBDOW5+t0z+8kNXstUhIgXv4=;
	b=nUBjapckYgCy2y9jwZiTLlEqoqZawb29ffE+wVMiT3sb8bhhnk7UzBpjv+PpBjO4Zl
	TazsGM9yxtpr9u5gHwE1rq3aeU3luZBiCeQMvFqBhihy+Fr3FPxGvzXQTTtX+yKnMgOj
	QrVACFNGEjjJ6dofp7ZzROPylS8n0UP6OOjrXxsUJ8X6Ui2IMtFdw6M93R0fyWel2YK4
	9lIxqjazKOPezyVwWYNMn4vGp0dgnGP3IInKb7iuQqaWk2Rr9Mvu1nrASncMkQFC9HvF
	zOWN1BbdriIyBFhP+sZYGL9hyuEm+uI6fA1bcf+3b8GveEZBxqF3CocoEbvCivqUh1Uf
	DB8Q==
X-Received: by 10.15.36.72 with SMTP id h48mr2582398eev.33.1373280554586;
	Mon, 08 Jul 2013 03:49:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm41099829eeo.14.2013.07.08.03.49.13 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 03:49:13 -0700 (PDT)
Date: Mon, 8 Jul 2013 12:49:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130708104922.GJ3288@jama>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<7f4986d3104e324f6fcbb4134cfe38870194866f.1372456294.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7f4986d3104e324f6fcbb4134cfe38870194866f.1372456294.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 16/24] python-distribute: Add recipes for python2 and python3
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
X-List-Received-Date: Mon, 08 Jul 2013 10:49:14 -0000
X-Groupsio-MsgNum: 41602
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hk6Zb6cduJ+I0Tmj"
Content-Disposition: inline

--hk6Zb6cduJ+I0Tmj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2013 at 03:04:01PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../python/python-distribute_0.6.32.bb             |   47 ++++++++++++++=
++++++
>  .../python/python3-distribute_0.6.32.bb            |   46 ++++++++++++++=
+++++
>  2 files changed, 93 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python-distribute_0.6.32=
=2Ebb
>  create mode 100644 meta/recipes-devtools/python/python3-distribute_0.6.3=
2.bb

easy_install is staged by both
WARNING: The recipe python-distribute-native is trying to install files
into a shared area when those files already exist. Those files and their
manifest location are:
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-l=
inux/usr/bin/easy_install
   Matched in manifest-x86_64-python3-distribute-native
Please verify which package should provide the above files.

Can we rename it in one of them to be more deterministic about which
version is used?

>=20
> diff --git a/meta/recipes-devtools/python/python-distribute_0.6.32.bb b/m=
eta/recipes-devtools/python/python-distribute_0.6.32.bb
> new file mode 100644
> index 0000000..86ac871
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
> @@ -0,0 +1,47 @@
> +DESCRIPTION =3D "Download, build, install, upgrade, and uninstall Python=
 packages"
> +HOMEPAGE =3D "http://packages.python.org/distribute"
> +SECTION =3D "devel/python"
> +LICENSE =3D "PSF"
> +LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D234;endline=3D234;md5=
=3D26f6b02022b737126d3c88838782dddb"
> +
> +SRCNAME =3D "distribute"
> +PR =3D "ml5"
> +DEPENDS +=3D "python"
> +DEPENDS_virtclass-native +=3D "python-native"
> +
> +SRC_URI =3D " \
> +  http://pypi.python.org/packages/source/d/distribute/${SRCNAME}-${PV}.t=
ar.gz \
> +"
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +#  http://python-distribute.org/distribute_setup.py=20
> +
> +# force the selection of python3
> +#PYTHON_BASEVERSION =3D "3.3"
> +#PYTHON_MAJMIN =3D "3.3"
> +
> +inherit distutils
> +
> +DISTUTILS_INSTALL_ARGS +=3D "--install-lib=3D${D}${libdir}/${PYTHON_DIR}=
/site-packages"
> +
> +do_install_prepend() {
> +    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
> +}
> +
> +#
> +#  The installer puts the wrong path in the setuptools.pth file.  Correc=
t it.
> +#
> +do_install_append() {
> +    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
> +    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON=
_SITEPACKAGES_DIR}/setuptools.pth
> +}
> +
> +RDEPENDS_${PN} =3D "\
> +  python-distutils \
> +  python-compression \
> +"
> +
> +SRC_URI[md5sum] =3D "acb7a2da81e3612bfb1608abe4f0e568"
> +SRC_URI[sha256sum] =3D "8970cd1e148b5d1fea9430584aea66c45ea22d80e0933393=
ec49ebc388f718df"
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb b/=
meta/recipes-devtools/python/python3-distribute_0.6.32.bb
> new file mode 100644
> index 0000000..e0415d5
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
> @@ -0,0 +1,46 @@
> +DESCRIPTION =3D "Download, build, install, upgrade, and uninstall Python=
 packages"
> +HOMEPAGE =3D "http://packages.python.org/distribute"
> +SECTION =3D "devel/python"
> +LICENSE =3D "PSF"
> +LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D234;endline=3D234;md5=
=3D26f6b02022b737126d3c88838782dddb"
> +
> +SRCNAME =3D "distribute"
> +PR =3D "ml5"
> +DEPENDS +=3D "python3"
> +DEPENDS_virtclass-native +=3D "python3-native"
> +
> +SRC_URI =3D " \
> +  http://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.t=
ar.gz \
> +"
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +#  http://python-distribute.org/distribute_setup.py=20
> +
> +# force the selection of python3
> +#PYTHON_BASEVERSION =3D "3.3"
> +#PYTHON_MAJMIN =3D "3.3"
> +
> +inherit distutils3
> +
> +DISTUTILS_INSTALL_ARGS +=3D "--install-lib=3D${D}${libdir}/${PYTHON_DIR}=
/site-packages"
> +
> +do_install_prepend() {
> +    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
> +}
> +#
> +#  The installer puts the wrong path in the setuptools.pth file.  Correc=
t it.
> +#
> +do_install_append() {
> +    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
> +    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON=
_SITEPACKAGES_DIR}/setuptools.pth
> +}
> +
> +RDEPENDS_${PN} =3D "\
> +  python3-distutils \
> +  python3-compression \
> +"
> +
> +SRC_URI[md5sum] =3D "acb7a2da81e3612bfb1608abe4f0e568"
> +SRC_URI[sha256sum] =3D "8970cd1e148b5d1fea9430584aea66c45ea22d80e0933393=
ec49ebc388f718df"
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hk6Zb6cduJ+I0Tmj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHamTIACgkQN1Ujt2V2gBy8NwCfWcOJUPAxnz1CJUgFnMsXOvQb
LHQAnR6Rwa7HLOM2WOjg7yofJthyFF0e
=BbYh
-----END PGP SIGNATURE-----

--hk6Zb6cduJ+I0Tmj--
