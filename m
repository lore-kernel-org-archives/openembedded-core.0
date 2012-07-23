Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1StGpq-00028P-6W; Mon, 23 Jul 2012 13:29:58 +0200
Received: by bkcik5 with SMTP id ik5so3969610bkc.6
	for <multiple recipients>; Mon, 23 Jul 2012 04:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p3L2ft5z3poi2cULbWoFxBkAeiEivUKY264rJDFHvC0=;
	b=BiHsJiYMjaeZjEpsjtL0jlyl4rD5uArnRseH/J9RImieJ07vrbagMQAWQgE4leXg3d
	008qLwtp1aab/xtF8Ph+Ac+X1CwrinKUZVtsfkStgc7A+EZBO/BJ6g/Z2G9R41zc5di8
	TouT42F06sKmCYCnDZOlXhlkgl01ojg4b4XhSqGpbW6VM0UX/lseh0Tpcs9qE59rNNzA
	TvleudjHNPqUntuCjmIyPGCuvIgiY+k8wgH92dzPvVwL8tjG/byawLF+AAPkXDzy7yIt
	ZxxVbexzkhE9rBUhXmBJ9vYjHOG0GxeBR+d0Q6//hdtFldByRquE+vxOQHJcJdAFh+zo
	T0pw==
Received: by 10.204.154.214 with SMTP id p22mr7614357bkw.111.1343042311193;
	Mon, 23 Jul 2012 04:18:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n5sm7030953bkv.14.2012.07.23.04.18.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 04:18:30 -0700 (PDT)
Date: Mon, 23 Jul 2012 13:18:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120723111829.GA20311@jama.jama.net>
References: <20120722104358.0339C10217@opal>
MIME-Version: 1.0
In-Reply-To: <20120722104358.0339C10217@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Morgan Little : python: Update for python-native changes
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
X-List-Received-Date: Mon, 23 Jul 2012 11:29:58 -0000
X-Groupsio-MsgNum: 25990
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 22, 2012 at 10:43:53AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 284a65d55f0ffad0f4f7f32d72da0f9410578643
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D284a65d55f0ffad0f4f7f32d72da0f9410578643
>=20
> Author: Morgan Little <morgan.little@windriver.com>
> Date:   Thu Jul 19 13:46:07 2012 -0400
>=20
> python: Update for python-native changes
>=20
> Add pythonnative onto the list of inherits and update the paths to the bi=
naries
> referenced in the recipe to the new paths.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20

Any idea why is opkg package-index now failing _sometimes_ ?

| + '[' -e /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/dep=
loy/ipk/ ']'
| + touch /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/depl=
oy/ipk/Packages
| + flock /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/depl=
oy/ipk/Packages.flock -c 'opkg-make-index -r /var/lib/jenkins/jobs/shr-core=
/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -p /var/lib/jenkins/jobs=
/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -m /var/lib/jen=
kins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/'
| Traceback (most recent call last):
|   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysr=
oots/x86_64-linux/usr/lib/python2.7/site.py", line 569, in <module>
|     main()
|   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysr=
oots/x86_64-linux/usr/lib/python2.7/site.py", line 552, in main
|     known_paths =3D addsitepackages(known_paths)
|   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysr=
oots/x86_64-linux/usr/lib/python2.7/site.py", line 329, in addsitepackages
|     for sitedir in getsitepackages():
|   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysr=
oots/x86_64-linux/usr/lib/python2.7/site.py", line 303, in getsitepackages
|     sitepackages.append(os.path.join(prefix, sys.lib,
| AttributeError: 'module' object has no attribute 'lib'
| ERROR: Function failed: do_package_index (see /var/lib/jenkins/jobs/shr-c=
ore/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/package-inde=
x-1.0-r0/temp/log.do_package_index.17223 for further information)
NOTE: package package-index-1.0-r0: task do_package_index: Failed

Cheers,

> ---
>=20
>  meta/recipes-devtools/python/python_2.7.3.bb |   18 +++++++++---------
>  1 files changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-=
devtools/python/python_2.7.3.bb
> index b736cc2..d27ff05 100644
> --- a/meta/recipes-devtools/python/python_2.7.3.bb
> +++ b/meta/recipes-devtools/python/python_2.7.3.bb
> @@ -1,6 +1,6 @@
>  require python.inc
>  DEPENDS =3D "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
> =20
>  DISTRO_SRC_URI ?=3D "file://sitecustomize.py"
>  DISTRO_SRC_URI_linuxstdbase =3D ""
> @@ -30,7 +30,7 @@ SRC_URI +=3D "\
> =20
>  S =3D "${WORKDIR}/Python-${PV}"
> =20
> -inherit autotools multilib_header
> +inherit autotools multilib_header pythonnative
> =20
>  # The 3 lines below are copied from the libffi recipe, ctypes ships its =
own copy of the libffi sources
>  #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=3Dsoftp :(
> @@ -45,7 +45,7 @@ do_configure_prepend() {
>  do_compile() {
>          # regenerate platform specific files, because they depend on sys=
tem headers
>          cd Lib/plat-linux2
> -        include=3D${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python \
> +        include=3D${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python-nati=
ve/python \
>                  ${S}/Tools/scripts/h2py.py -i '(u_long)' \
>                  ${STAGING_INCDIR}/dlfcn.h \
>                  ${STAGING_INCDIR}/linux/cdrom.h \
> @@ -89,8 +89,8 @@ do_compile() {
> =20
>  	export CROSS_COMPILE=3D"${TARGET_PREFIX}"
> =20
> -	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/pgen \
> -		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python \
> +	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python-native/pgen \
> +		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python-native/python \
>  		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>  		STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \
>  		STAGING_INCDIR=3D${STAGING_INCDIR} \
> @@ -99,8 +99,8 @@ do_compile() {
> =20
>  	oe_libinstall -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
> =20
> -	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/pgen \
> -		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python \
> +	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python-native/pgen \
> +		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python-native/python \
>  		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>  		STAGING_INCDIR=3D${STAGING_INCDIR} \
>  		STAGING_BASELIBDIR=3D${STAGING_BASELIBDIR} \
> @@ -115,8 +115,8 @@ do_install() {
> =20
>  	export CROSS_COMPILE=3D"${TARGET_PREFIX}"
>  =09
> -	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/pgen \
> -		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python \
> +	oe_runmake HOSTPGEN=3D${STAGING_BINDIR_NATIVE}/python-native/pgen \
> +		HOSTPYTHON=3D${STAGING_BINDIR_NATIVE}/python-native/python \
>  		CROSSPYTHONPATH=3D${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-=
dynload/ \
>  		STAGING_LIBDIR=3D${STAGING_LIBDIR} \
>  		STAGING_INCDIR=3D${STAGING_INCDIR} \
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlANMwUACgkQN1Ujt2V2gBwx9wCggNHME/XPWKwUa4tF441s+MbK
GIEAmweDRbY1r2QuRtGoiUzIGkzFvkxC
=Kngt
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
