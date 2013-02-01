Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U1E7R-0006X3-Vt
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 11:45:47 +0100
Received: by mail-pb0-f52.google.com with SMTP id mc8so1344878pbc.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 02:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=BQQClz6n65qVXOGJNmWXDrJw13uaTO/KI1IHMWLqlrE=;
	b=wHZuiIiQoj71o5LKYD7lJrFiPEfXvyQPX1IjHYMdHIW4FUDc0Ie6YkQ0hDI/Cxqhu5
	Kom2SKEh/A406McoQkYE+pP2KvMyokPyuLKrNjOEoWtCcXXY0Qs2Bj30jZ7o0JIE5QMX
	UTR57HJSlGTIWgPuBAWGCAFD0T9dzKuan5cBmbHas9nG8f7YxHskrjmnociDFvHddqnL
	8MNakBx29jBpDGcVS3dCDmoDOHN6WneSVj4dXqOQoFEZEdRfmCSkFOwtNGr8YtfV6Itq
	oD4F0ByaJOpjlJIlRid6EYMkwfL0GIKWauYVbdP/+58CNkMb3cIKvrNSrckQdNCgii5B
	Ep/w==
X-Received: by 10.68.237.135 with SMTP id vc7mr30845394pbc.2.1359714573456;
	Fri, 01 Feb 2013 02:29:33 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t7sm5200010pax.17.2013.02.01.02.29.30
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Feb 2013 02:29:32 -0800 (PST)
Date: Fri, 1 Feb 2013 11:29:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Message-ID: <20130201102935.GD3234@jama.dyndns-home.com>
References: <cover.1359669354.git.peter.seebach@windriver.com>
	<fd09dfbdf025e14bcccaedb85d9d3f16e6f4aa58.1359669354.git.peter.seebach@windriver.com>
MIME-Version: 1.0
In-Reply-To: <fd09dfbdf025e14bcccaedb85d9d3f16e6f4aa58.1359669354.git.peter.seebach@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] pseudo.inc: Fix sqlite libdir again, pseudo 1.4.3
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
X-List-Received-Date: Fri, 01 Feb 2013 10:45:50 -0000
X-Groupsio-MsgNum: 34801
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Content-Disposition: inline

--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2013 at 04:00:25PM -0600, Peter Seebach wrote:
> This updates to pseudo 1.4.3. Changes:
>=20
> 1. A couple of minor tweaks to reduce difficulties using SDKs built
>    on slightly more recent machines on older machines; specifically,
>    avoiding getting @GLIBC_2.7 symbol references for sscanf(), fscanf(),
>    and open2().
> 2. Revision of the logic determining the library directory to use for
>    sqlite's library files.
>=20
> The latter is a source of difficulty because it's come up a few times
> that we may want pseudo to use lib64 for libpseudo.so, but bitbake's
> usual setup would have libsqlite3.a in lib regardless of bit width.
> Cleaned up previous design a bit by providing a distinct setting for
> sqlite-lib, which defaults to the same library directory used for other
> things. Adjusted build to use this new setting.
>=20
> Testing: Successful build of meta-toolchain for both 64-bit and 32-bit
> SDKMACHINE, and builds with NO32LIBS =3D "0" also succeeded.

Interesting that this patch didn't make it to patchwork:
http://patchwork.openembedded.org/project/oe-core/list/?state=3D*&q=3Dpseud=
o&archive=3Dboth
and it's not one of known cases where patchwork does not work (e.g.
renames only with -M).

Peter can you check this issue:
http://lists.linuxtogo.org/pipermail/openembedded-core/2013-January/035089.=
html
to confirm or disprove that it could be somehow caused by pseudo?

I'll try it with 1.4.3 just in case :).

Regards,
=20
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> ---
>  meta/recipes-devtools/pseudo/pseudo.inc      |    8 ++++----
>  meta/recipes-devtools/pseudo/pseudo_1.4.1.bb |    8 --------
>  meta/recipes-devtools/pseudo/pseudo_1.4.3.bb |    8 ++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb   |    4 ++--
>  4 files changed, 14 insertions(+), 14 deletions(-)
>  delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
>  create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.3.bb
>=20
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devto=
ols/pseudo/pseudo.inc
> index 98f706c..8dd9842 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -30,9 +30,9 @@ NO32LIBS ??=3D "1"
>  # Compile for the local machine arch...
>  do_compile () {
>  	if [ "${SITEINFO_BITS}" =3D "64" ]; then
> -	  ${S}/configure --prefix=3D${prefix} --libdir=3D${prefix}/lib/pseudo/l=
ib${SITEINFO_BITS} --with-sqlite=3D${STAGING_DIR_TARGET}${exec_prefix} --cf=
lags=3D"${CFLAGS}" --bits=3D${SITEINFO_BITS} --enable-static-sqlite --witho=
ut-rpath
> +	  ${S}/configure --prefix=3D${prefix} --libdir=3D${prefix}/lib/pseudo/l=
ib${SITEINFO_BITS} --with-sqlite-lib=3Dlib --with-sqlite=3D${STAGING_DIR_TA=
RGET}${exec_prefix} --cflags=3D"${CFLAGS}" --bits=3D${SITEINFO_BITS} --enab=
le-static-sqlite --without-rpath
>  	else
> -	  ${S}/configure --prefix=3D${prefix} --libdir=3D${prefix}/lib/pseudo/l=
ib --with-sqlite=3D${STAGING_DIR_TARGET}${exec_prefix} --cflags=3D"${CFLAGS=
}" --bits=3D${SITEINFO_BITS} --enable-static-sqlite --without-rpath
> +	  ${S}/configure --prefix=3D${prefix} --libdir=3D${prefix}/lib/pseudo/l=
ib --with-sqlite-lib=3Dlib --with-sqlite=3D${STAGING_DIR_TARGET}${exec_pref=
ix} --cflags=3D"${CFLAGS}" --bits=3D${SITEINFO_BITS} --enable-static-sqlite=
 --without-rpath
>  	fi
>  	oe_runmake ${MAKEOPTS}
>  }
> @@ -51,7 +51,7 @@ do_compile_prepend_class-native () {
>  		# built this will fail and be ignored.
>  		make ${MAKEOPTS} distclean || :
> =20
> -		./configure --prefix=3D${prefix} --libdir=3D${prefix}/lib/pseudo/lib -=
-with-sqlite=3D${STAGING_DIR_TARGET}${exec_prefix} --bits=3D32 --without-rp=
ath
> +		./configure --prefix=3D${prefix} --libdir=3D${prefix}/lib/pseudo/lib -=
-with-sqlite-lib=3Dlib --with-sqlite=3D${STAGING_DIR_TARGET}${exec_prefix} =
--bits=3D32 --without-rpath
>  		oe_runmake ${MAKEOPTS} libpseudo
>  		# prevent it from removing the lib, but remove everything else
>  		make 'LIB=3Dfoo' ${MAKEOPTS} distclean=20
> @@ -63,7 +63,7 @@ do_compile_prepend_class-nativesdk () {
>  		# We need the 32-bit libpseudo on a 64-bit machine...
>                  # ... and we really, really, hope that the native host is
>                  # x86, or else --bits may not work.
> -		./configure --prefix=3D${prefix} --libdir=3D${prefix}/lib/pseudo/lib -=
-with-sqlite=3D${STAGING_DIR_TARGET}${exec_prefix} --bits=3D32 --without-rp=
ath
> +		./configure --prefix=3D${prefix} --libdir=3D${prefix}/lib/pseudo/lib -=
-with-sqlite-lib=3Dlib --with-sqlite=3D${STAGING_DIR_TARGET}${exec_prefix} =
--bits=3D32 --without-rpath
>  		oe_runmake ${MAKEOPTS} libpseudo
>  		# prevent it from removing the lib, but remove everything else
>  		make 'LIB=3Dfoo' ${MAKEOPTS} distclean=20
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb b/meta/recipes-=
devtools/pseudo/pseudo_1.4.1.bb
> deleted file mode 100644
> index 70fe9c0..0000000
> --- a/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require pseudo.inc
> -
> -PR =3D "r13"
> -
> -SRC_URI =3D "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.t=
ar.bz2"
> -
> -SRC_URI[md5sum] =3D "b49bb87c7e1de33f37fea479ddb99dca"
> -SRC_URI[sha256sum] =3D "ae4bfba2bd1e3954ea8f83bf06571ee4958bf7623e4fa897=
056281dddfe6446d"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.3.bb b/meta/recipes-=
devtools/pseudo/pseudo_1.4.3.bb
> new file mode 100644
> index 0000000..9b3cb5f
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.4.3.bb
> @@ -0,0 +1,8 @@
> +require pseudo.inc
> +
> +PR =3D "r14"
> +
> +SRC_URI =3D "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.t=
ar.bz2"
> +
> +SRC_URI[md5sum] =3D "ac943153aa78e210e2d0db7c85845db3"
> +SRC_URI[sha256sum] =3D "0ca12a319c0ee87d1c8b2a4310c36a6d68d8d4b8c9c7dba0=
0bace1773baf18e8"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
> index e394ffb..d2fe498 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -1,7 +1,7 @@
>  require pseudo.inc
> =20
> -SRCREV =3D "398a264490713c912b4ce465251a8a82a7905f45"
> -PV =3D "1.4.1+git${SRCPV}"
> +SRCREV =3D "a01d7884e5f3acba1460cf6b500d28390e7af9f8"
> +PV =3D "1.4.3+git${SRCPV}"
>  PR =3D "r28"
> =20
>  DEFAULT_PREFERENCE =3D "-1"
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

--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlELmQ8ACgkQN1Ujt2V2gBx9lwCghaz4IxAD6FGmTLaIv+5gAjNX
t7MAoKhMHcYYOH01mpGQ2C/8EMbH+Vkr
=pRXp
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--
