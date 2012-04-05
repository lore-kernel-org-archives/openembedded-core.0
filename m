Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SFrg5-0002Zb-4i
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 20:45:01 +0200
Received: by wgbdr12 with SMTP id dr12so1387819wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2012 11:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ID9CSD3uawIxRrD9nEE/PhFbeJgZp5IJU44PsM+uWQE=;
	b=jDE4cOjw3Dfkfyr63Rh1HqghtpuHaBBkaH2LhHB4I0ES1xi9nN4J5KJLcRrIi8Xn8z
	ue3XzlK+cs2NK/nYpJ57VDaDN7M8F/w6EzFaNa5L9kSo+5r8hJhVz6AFay8DNWUMqfk1
	w93MFa2OPRoG6fBWFiOjSUVXOOgrHS2EwlxC8g1ohFHmHAINvEE0GLYzM7QR0FdLpeRi
	Vckb1BwOXLsqQBM5p9Ldlmnpf/d4DWFibjKoVnWFXcx2cQbOY29UWZn7qkh/bZdbdw7Q
	51+YJ4EBOGazvWwk0Ui+RbNy+r0LdHKPrzcyXClWJXNi3yuzxOkVVIE43PTkz8YdS/+R
	9+gQ==
Received: by 10.216.225.216 with SMTP id z66mr2272070wep.71.1333650949303;
	Thu, 05 Apr 2012 11:35:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff9sm15696555wib.2.2012.04.05.11.35.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 11:35:48 -0700 (PDT)
Date: Thu, 5 Apr 2012 20:35:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120405183549.GQ4181@jama.jama.net>
References: <cover.1333637904.git.lianhao.lu@intel.com>
	<c41184f84bc40618994e624cf24697ad61e810a0.1333637904.git.lianhao.lu@intel.com>
MIME-Version: 1.0
In-Reply-To: <c41184f84bc40618994e624cf24697ad61e810a0.1333637904.git.lianhao.lu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/1] python: multilib header support.
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
X-List-Received-Date: Thu, 05 Apr 2012 18:45:01 -0000
X-Groupsio-MsgNum: 20327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kZU6r8y0YpRwyDfh"
Content-Disposition: inline

--kZU6r8y0YpRwyDfh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 05, 2012 at 11:00:34PM +0800, Lianhao Lu wrote:
> Add intercept multilib header for pyconfig.h in python.
>=20
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  .../python/python-2.7-manifest.inc                 |    2 +-
>  meta/recipes-devtools/python/python_2.7.2.bb       |    6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/=
recipes-devtools/python/python-2.7-manifest.inc
> index ca01553..1e16c6b 100644
> --- a/meta/recipes-devtools/python/python-2.7-manifest.inc
> +++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
> @@ -40,7 +40,7 @@ FILES_${PN}-compression=3D"${libdir}/python2.7/gzip.* $=
{libdir}/python2.7/zipfile.
>  DESCRIPTION_${PN}-core=3D"Python Interpreter and core modules (needed!)"
>  RDEPENDS_${PN}-core=3D"${PN}-lang ${PN}-re"
>  FILES_${PN}-core=3D"${libdir}/python2.7/__future__.* ${libdir}/python2.7=
/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/copy.* ${libdir}/p=
ython2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/=
genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* =
${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posi=
xpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdi=
r}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict=
=2E* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libd=
ir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_stru=
ct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynlo=
ad/xreadlines.so \
> -${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/pyt=
hon* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${li=
bdir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconf=
ig.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
> +${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/pyt=
hon* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${li=
bdir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconf=
ig*.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "

read header of this file and change that in
scripts/contrib/python/generate-manifest-2.7.py instead

> =20
>  DESCRIPTION_${PN}-crypt=3D"Python Basic Cryptographic and Hashing Suppor=
t"
>  RDEPENDS_${PN}-crypt=3D"${PN}-core"
> diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-=
devtools/python/python_2.7.2.bb
> index 8cf45da..b6997c1 100644
> --- a/meta/recipes-devtools/python/python_2.7.2.bb
> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> @@ -1,6 +1,6 @@
>  require python.inc
>  DEPENDS =3D "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
> -PR =3D "${INC_PR}.9"
> +PR =3D "${INC_PR}.10"
> =20
>  DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
>  DISTRO_SRC_URI_linuxstdbase =3D ""
> @@ -25,7 +25,7 @@ SRC_URI +=3D "\
> =20
>  S =3D "${WORKDIR}/Python-${PV}"
> =20
> -inherit autotools
> +inherit autotools multilib_header
> =20
>  # The 3 lines below are copied from the libffi recipe, ctypes ships its =
own copy of the libffi sources
>  #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=3Dsoftp :(
> @@ -110,6 +110,8 @@ do_install() {
>  	if [ -e ${WORKDIR}/sitecustomize.py ]; then
>  		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYT=
HON_MAJMIN}
>  	fi
> +
> +	oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
>  }
> =20
>  SSTATE_SCAN_FILES +=3D "Makefile"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kZU6r8y0YpRwyDfh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk995gUACgkQN1Ujt2V2gBzW+ACgrf7jezWf2Y8PkU8O7YoWgPRC
320Ani1jmsEY7EFXjj9/Nf9oQwiofkS1
=vXcg
-----END PGP SIGNATURE-----

--kZU6r8y0YpRwyDfh--
