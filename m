Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB846AF02
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 05:28:31 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id m19so1776374wev.36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IDhiKsBYpGjEJbpmPThXB7QHiEmYfAIkgMRMFDULor4=;
	b=CyMq0m2IKFpHIQi06I+b6n9CQClk7qRXLsEYHzfCT8aYNG6PmORZCHGWIKH3Y8h/Zd
	Lk6ZOoUvQKKrZE83VPBcpgl4h1Wt37FVvxuTB55l26E4OFCtDCPP/qOGj0zZJrMkEvve
	Kv09y3dV3JO1HjXt1c6Bn8g++1P8FGuUCsoI0RO39oncs0K0PwZAQb5hYjyw06kOPakW
	/U/PUfnHiKI+NLEeYKOx2GNfgGGFBvekmhpcxFOPf0240CMceplFFbnuL7lKAUJvg650
	Mnb5ULv9P5fIuhaK6D/8iWmpMqbZQXx1B7O6ivYDojxq665mNKzxx/ObBlnh/hZES4kK
	a9aw==
X-Received: by 10.194.174.38 with SMTP id bp6mr12414822wjc.83.1372483711559;
	Fri, 28 Jun 2013 22:28:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	w43sm14827772eez.6.2013.06.28.22.28.30 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 22:28:30 -0700 (PDT)
Date: Sat, 29 Jun 2013 07:29:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130629052911.GP3261@jama>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<984ceb9c26e5fc05dcad1046f8ebf396a9034e10.1372456294.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <984ceb9c26e5fc05dcad1046f8ebf396a9034e10.1372456294.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/24] classes/distutils: Introduce PYTHON_PN
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
X-List-Received-Date: Sat, 29 Jun 2013 05:28:31 -0000
X-Groupsio-MsgNum: 41191
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FrxVhwK/bNRjN48l"
Content-Disposition: inline

--FrxVhwK/bNRjN48l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2013 at 03:03:49PM -0700, Khem Raj wrote:
> This is needed to accomodate python3 alongside
> python2
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/distutils-base.bbclass        |    5 ++---
>  meta/classes/distutils-native-base.bbclass |    4 ++--
>  meta/classes/distutils.bbclass             |   24 +++++++++++++---------=
--
>  meta/classes/python-dir.bbclass            |    1 +
>  meta/classes/pythonnative.bbclass          |    9 ++++++---
>  5 files changed, 24 insertions(+), 19 deletions(-)
>=20
> diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils=
-base.bbclass
> index 3b43e76..aa18e8b 100644
> --- a/meta/classes/distutils-base.bbclass
> +++ b/meta/classes/distutils-base.bbclass
> @@ -1,5 +1,4 @@
> -DEPENDS  +=3D "${@["python-native python", ""][(d.getVar('PACKAGES', Tru=
e) =3D=3D '')]}"
> -RDEPENDS_${PN} +=3D "${@['', 'python-core']['${CLASSOVERRIDE}' =3D=3D 'c=
lass-target']}"
> +DEPENDS  +=3D "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PA=
CKAGES', True) =3D=3D '')]}"
> +RDEPENDS_${PN} +=3D "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' =3D=
=3D 'class-target']}"
> =20
>  inherit distutils-common-base pythonnative
> -
> diff --git a/meta/classes/distutils-native-base.bbclass b/meta/classes/di=
stutils-native-base.bbclass
> index ceda512..509cb95 100644
> --- a/meta/classes/distutils-native-base.bbclass
> +++ b/meta/classes/distutils-native-base.bbclass
> @@ -1,3 +1,3 @@
> -DEPENDS  +=3D "${@["python-native", ""][(d.getVar('PACKAGES', True) =3D=
=3D '')]}"
> -
>  inherit distutils-common-base
> +
> +DEPENDS  +=3D "${@["${PYTHON_PN}-native", ""][(d.getVar('PACKAGES', True=
) =3D=3D '')]}"
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbcl=
ass
> index a0e1f50..f99959d 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -1,4 +1,5 @@
>  inherit distutils-base
> +#distutils-tools

^^ do we need this?

> =20
>  DISTUTILS_BUILD_ARGS ?=3D ""
>  DISTUTILS_STAGE_HEADERS_ARGS ?=3D "--install-dir=3D${STAGING_INCDIR}/${P=
YTHON_DIR}"
> @@ -11,15 +12,15 @@ distutils_do_compile() {
>           STAGING_INCDIR=3D${STAGING_INCDIR} \
>           STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>           BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> -         ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${=
DISTUTILS_BUILD_ARGS} || \
> -         bbfatal "python setup.py build_ext execution failed."
> +         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup=
=2Epy build ${DISTUTILS_BUILD_ARGS} || \
> +         bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
>  }
> =20
>  distutils_stage_headers() {
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>          BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install_h=
eaders ${DISTUTILS_STAGE_HEADERS_ARGS} || \
> -        bbfatal "python setup.py install_headers execution failed."
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
> +        bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
>  }
> =20
>  distutils_stage_all() {
> @@ -28,21 +29,22 @@ distutils_stage_all() {
>          install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
>          PYTHONPATH=3D${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
>          BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install $=
{DISTUTILS_STAGE_ALL_ARGS} || \
> -        bbfatal "python setup.py install (stage) execution failed."
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py install ${DISTUTILS_STAGE_ALL_ARGS} || \
> +        bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
>  }
> =20
>  distutils_do_install() {
>          install -d ${D}${PYTHON_SITEPACKAGES_DIR}
>          STAGING_INCDIR=3D${STAGING_INCDIR} \
>          STAGING_LIBDIR=3D${STAGING_LIBDIR} \
> -        PYTHONPATH=3D${D}/${PYTHON_SITEPACKAGES_DIR} \
> +        PYTHONPATH=3D${D}${PYTHON_SITEPACKAGES_DIR} \
>          BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \
> -        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install -=
-install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} ||=
 \
> -        bbfatal "python setup.py install execution failed."
> +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py install --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INST=
ALL_ARGS} || \
> +        bbfatal "${PYTHON_PN} setup.py install execution failed."
> =20
> -        for i in `find ${D} -name "*.py"` ; do \
> -            sed -i -e s:${D}::g $i
> +        # support filenames with *spaces*
> +        find ${D} -name "*.py" -print0 | while read -d $'\0' i ; do \
> +            sed -i -e s:${D}::g "$i"
>          done
> =20
>          if test -e ${D}${bindir} ; then=09
> diff --git a/meta/classes/python-dir.bbclass b/meta/classes/python-dir.bb=
class
> index 0b6a33c..b4b5ab0 100644
> --- a/meta/classes/python-dir.bbclass
> +++ b/meta/classes/python-dir.bbclass
> @@ -1,3 +1,4 @@
>  PYTHON_BASEVERSION ?=3D "2.7"
>  PYTHON_DIR =3D "python${PYTHON_BASEVERSION}"
> +PYTHON_PN =3D "python${@'' if '${PYTHON_BASEVERSION}'.startswith('2') el=
se '3'}"
>  PYTHON_SITEPACKAGES_DIR =3D "${libdir}/${PYTHON_DIR}/site-packages"
> diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnativ=
e.bbclass
> index 7886207..fdd22bb 100644
> --- a/meta/classes/pythonnative.bbclass
> +++ b/meta/classes/pythonnative.bbclass
> @@ -1,3 +1,6 @@
> -PYTHON=3D"${STAGING_BINDIR_NATIVE}/python-native/python"
> -EXTRANATIVEPATH +=3D "python-native"
> -DEPENDS +=3D " python-native "
> +
> +inherit python-dir
> +
> +PYTHON=3D"${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
> +EXTRANATIVEPATH +=3D "${PYTHON_PN}-native"
> +DEPENDS +=3D " ${PYTHON_PN}-native "
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FrxVhwK/bNRjN48l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHOcKcACgkQN1Ujt2V2gBwMrgCdEBDdtOIkL+DZn2MDTzHx099T
/CEAn0mZFoViS45CvQ3Q7aOs3JRoqVTN
=q8WM
-----END PGP SIGNATURE-----

--FrxVhwK/bNRjN48l--
