Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id A65FD60C22
	for <openembedded-core@openembedded.org>;
	Sun, 29 Dec 2013 21:23:27 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id o10so4752843eaj.18
	for <openembedded-core@openembedded.org>;
	Sun, 29 Dec 2013 13:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EmEUBpKQv5MAQM4pPWpkScGK/gNZWnNGH665qjYp6SY=;
	b=Qsu/sQWm6Min4ZS+hnFTqpGl/o1QCEVJaGkgx536DlI2IBePOTtiHGbNA0LImaEYt0
	BkwbgejHpqYMn9NV2+wd3ZbVmj+MZcrQ1JtJTZbjXPJyjeE74MbiN4Ot57kbQlj7Edx4
	hrLzWyN8obmDJxmJAiXI0BTJNr6PgaOmyDWoSzDWxuTL6q5i9NtZSjGpL7nWQECaJ4UB
	tgYhyRs35l73KyXc/uvBW9qhdjzV+kbErNT8RT94ZhALA/xg1qv/31Qlsxc2HwPFNoiV
	1e4ywoxQC8mF4e6qag5zgswHzS3NrhmaVqv0SJZVtrlnXmcgwSaSHaNuZ0gRTwBdhXtR
	lKGQ==
X-Received: by 10.14.0.201 with SMTP id 49mr7861843eeb.38.1388352207659;
	Sun, 29 Dec 2013 13:23:27 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	n1sm102814490eep.20.2013.12.29.13.23.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Dec 2013 13:23:26 -0800 (PST)
Date: Sun, 29 Dec 2013 22:24:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Philip Balister <philip@balister.org>
Message-ID: <20131229212410.GB2776@jama>
References: <1388341658-8266-1-git-send-email-philip@balister.org>
	<1388341658-8266-2-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1388341658-8266-2-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@openembedded.org, Steve Arnold <esteve@gentoogeek.org>
Subject: Re: [PATCH v2] db : Include C++ binding library in Berkeley DB recipe.
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
X-List-Received-Date: Sun, 29 Dec 2013 21:23:28 -0000
X-Groupsio-MsgNum: 48492
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oTHb8nViIGeoXxdp"
Content-Disposition: inline

--oTHb8nViIGeoXxdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 29, 2013 at 01:27:38PM -0500, Philip Balister wrote:
> Create the C++ library for db. This library is packaged in a new
> package so the db package only contains the c library. This prevents
> existing users from adding libstdc++ to the package DEPENDS.
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> Signed-off-by: Douglas Geiger <doug.geiger@bioradiation.net>
> Signed-off-by: Steve Arnold <esteve@gentoogeek.org>
>=20
> foo

^ bar

>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta/recipes-support/db/db_5.3.21.bb | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-support/db/db_5.3.21.bb b/meta/recipes-support/=
db/db_5.3.21.bb
> index 328f9db..5abc1fe 100644
> --- a/meta/recipes-support/db/db_5.3.21.bb
> +++ b/meta/recipes-support/db/db_5.3.21.bb
> @@ -17,7 +17,8 @@ RCONFLICTS_${PN} =3D "db3"
> =20
>  SRC_URI =3D "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
>  SRC_URI +=3D "file://arm-thumb-mutex_db5.patch;patchdir=3D.. \
> -            file://fix-parallel-build.patch"
> +            file://fix-parallel-build.patch \
> +           "
> =20
>  SRC_URI[md5sum] =3D "3fda0b004acdaa6fa350bfc41a3b95ca"
>  SRC_URI[sha256sum] =3D "ddd92a930317df92021054c03992392db9ea5cddba43bef8=
920d392a82114fb8"
> @@ -47,18 +48,22 @@ B =3D "${WORKDIR}/db-${PV}/build_unix"
>  # management on the system.
>  inherit lib_package
> =20
> +PACKAGES =3D+ "${PN}-cxx"
> +FILES_${PN}-cxx =3D "${libdir}/*cxx*so"
> +
> +
>  # The dev package has the .so link (as in db3) and the .a's -
>  # it is therefore incompatible (cannot be installed at the
>  # same time) as the db3 package
>  # sort out the .so since they do version prior to the .so
>  SOLIBS =3D "-5*.so"
> -FILES_SOLIBSDEV =3D "${libdir}/libdb.so"
> +FILES_SOLIBSDEV =3D "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
> =20
>  #configuration - set in local.conf to override
>  # All the --disable-* options replace --enable-smallbuild, which breaks =
a bunch of stuff (eg. postfix)
>  DB5_CONFIG ?=3D "--enable-o_direct --disable-cryptography --disable-queu=
e --disable-replication --disable-verify --disable-compat185 --disable-sql"
> =20
> -EXTRA_OECONF =3D "${DB5_CONFIG}"
> +EXTRA_OECONF =3D "${DB5_CONFIG} --enable-shared --enable-cxx"
> =20
>  # Override the MUTEX setting here, the POSIX library is
>  # the default - "POSIX/pthreads/library".
> @@ -80,16 +85,17 @@ do_configure() {
>  	oe_runconf
>  }
> =20
> +do_compile_prepend() {
> +	sed -i -e 's|hardcode_into_libs=3Dyes|hardcode_into_libs=3Dno|' \
> +		${B}/libtool
> +}
> +
>  do_install_append() {
>  	mkdir -p ${D}/${includedir}/db51
> -	#mv ${D}/${includedir}/db_185.h ${D}/${includedir}/db51/.
>  	mv ${D}/${includedir}/db.h ${D}/${includedir}/db51/.
>  	mv ${D}/${includedir}/db_cxx.h ${D}/${includedir}/db51/.
> -	#mv ${D}/${includedir}/dbsql.h ${D}/${includedir}/db51/.
> -	#ln -s db51/db_185.h ${D}/${includedir}/db_185.h
>  	ln -s db51/db.h ${D}/${includedir}/db.h
>  	ln -s db51/db_cxx.h ${D}/${includedir}/db_cxx.h
> -	#ln -s db51/dbsql.h ${D}/${includedir}/dbsql.h
> =20
>  	# The docs end up in /usr/docs - not right.
>  	if test -d "${D}/${prefix}/docs"
> @@ -103,6 +109,7 @@ do_install_append() {
>  }
> =20
>  INSANE_SKIP_${PN} =3D "dev-so"
> +INSANE_SKIP_${PN}-cxx =3D "dev-so"
> =20
>  BBCLASSEXTEND =3D "native nativesdk"
> =20
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oTHb8nViIGeoXxdp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLAkvoACgkQN1Ujt2V2gBwvIACfVyVQ4sTR5RFURmdo7cOlAss2
NeMAoIn/N5uQI6uORAb+sEiempPWcuZT
=oezh
-----END PGP SIGNATURE-----

--oTHb8nViIGeoXxdp--
