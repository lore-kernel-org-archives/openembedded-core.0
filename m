Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6548765CC9;
	Mon, 21 Jul 2014 22:32:24 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so8257049wes.19
	for <multiple recipients>; Mon, 21 Jul 2014 15:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0W5hDxiaBo9OndrCB3YsFmz/hKdrCmSFxvkuTA/N/Ew=;
	b=D+CCQJ/zS5BMvMLjlmjE3AfpZ9gehjAH+L3R0cXG/cryyVLjLl5616IXAIQJcil9ig
	8AvgCmrySYTzyNK7tMgZhte+ESVl7GectygpPxedXlQ2OcTanai3vcAkcWjDXkfjScef
	g9IhEvlBhJnxtB3WKJaX0a/WAG3KOJ6ESGoAUuNE2JEI4j4/rWz+vgWE0y0jkFqa1OW7
	o7tPPzo5oTXHGSfGO9gL/0Alv2/iGhZ5VaWZS1I7FpUfTH3X85DCxh1TCITasPQNwMhk
	g5/x55onusk88aMwjBz8Yq8zw2oQw4CoYeW+stsTPY/jxG8pzLnQCFQ0YkuFKjLt6fvH
	u+zg==
X-Received: by 10.194.177.168 with SMTP id cr8mr17755164wjc.134.1405981945829; 
	Mon, 21 Jul 2014 15:32:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wu6sm40749358wjb.46.2014.07.21.15.32.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jul 2014 15:32:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Jul 2014 00:32:40 +0200
To: openembedded-core@lists.openembedded.org,
	Peter Seebach <peter.seebach@windriver.com>
Message-ID: <20140721223240.GN22875@jama>
References: <20140716092525.988C0503D2@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140716092525.988C0503D2@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Peter Seebach : pseudo_1.6.0.bb: uprev to pseudo 1.6
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
X-List-Received-Date: Mon, 21 Jul 2014 22:32:25 -0000
X-Groupsio-MsgNum: 55296
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9lPOKfY2vCV97ybw"
Content-Disposition: inline

--9lPOKfY2vCV97ybw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 09:25:25AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: b8f5d6b493ec759a97b92cf9b4c07ad8a8114de6
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Db8f5d6b493ec759a97b92cf9b4c07ad8a8114de6
>=20
> Author: Peter Seebach <peter.seebach@windriver.com>
> Date:   Mon Jul 14 14:12:29 2014 -0500
>=20
> pseudo_1.6.0.bb: uprev to pseudo 1.6
>=20
> This uprevs pseudo to 1.6. This merges in all of the existing
> fixes, and also adds partial support for extended attributes,
> including storing arbitrary extended attributes in the database,
> and also interpreting the posix permissions ACLs as chmod
> requests.
>=20
> The extended attribute support means we need xattr.h, the simplest
> way to be sure of this is to build attr before pseudo, which doesn't
> take long.
>=20
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

I know there is 1.6.1 version in pseudo_git.bb but 1.6.0 is still default v=
ersion and target version fails to build with:

| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --sysr=
oot=3D/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm  -O2 -pip=
e -g -feliminate-unused-debug-types -pipe -std=3Dgnu99 -Wall -W -Wextra -fP=
IC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE -O2 -pipe -g -feliminate-unused-d=
ebug-types -DPSEUDO_PREFIX=3D'"/usr"' -DPSEUDO_SUFFIX=3D'""' -DPSEUDO_BINDI=
R=3D'"bin"' -DPSEUDO_LIBDIR=3D'"lib/pseudo/lib"' -DPSEUDO_LOCALSTATEDIR=3D'=
"var/pseudo"' -DPSEUDO_VERSION=3D'"1.6.0"' -DUSE_MEMORY_DB -DPSEUDO_FORCE_A=
SYNC -DPSEUDO_PASSWD_FALLBACK=3D'""' -O2 -g -L/home/jenkins/oe/world/shr-co=
re/tmp-eglibc/sysroots/qemuarm/usr/lib -I/home/jenkins/oe/world/shr-core/tm=
p-eglibc/sysroots/qemuarm/usr/include  -o bin/pseudolog pseudolog.o pseudo_=
client.o pseudo_ipc.o \
| 		pseudo_db.o pseudo_tables.o pseudo_util.o /home/jenkins/oe/world/shr-co=
re/tmp-eglibc/sysroots/qemuarm/usr/lib/libsqlite3.a -lpthread -ldl -lpthread
| pseudo.c:556: error: undefined reference to 'memcpy', version 'GLIBC_2.0'
=2E.

full log
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140721_02=
2210.log/3_min/failed/pseudo.log

Can you please check it?

>=20
> ---
>=20
>  meta/recipes-devtools/pseudo/pseudo.inc      |  6 +-----
>  meta/recipes-devtools/pseudo/pseudo_1.5.1.bb |  4 ++++
>  meta/recipes-devtools/pseudo/pseudo_1.6.0.bb | 10 ++++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb   |  4 ++--
>  4 files changed, 17 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devto=
ols/pseudo/pseudo.inc
> index 42738ab..11a8514 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -7,11 +7,7 @@ HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi/=
pseudo"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5df4a1e5920b344b8=
6ad"
>  SECTION =3D "base"
>  LICENSE =3D "LGPL2.1"
> -DEPENDS =3D "sqlite3"
> -
> -SRC_URI_append_class-nativesdk =3D " file://symver.patch"
> -
> -SRC_URI_append_class-native =3D " file://symver.patch"
> +DEPENDS =3D "sqlite3 attr"
> =20
>  FILES_${PN} =3D "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${lo=
calstatedir}/pseudo ${prefix}/var/pseudo"
>  FILES_${PN}-dbg +=3D "${prefix}/lib/pseudo/lib*/.debug"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb b/meta/recipes-=
devtools/pseudo/pseudo_1.5.1.bb
> index 47291fd..8d562ec 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
> @@ -10,6 +10,10 @@ SRC_URI =3D " \
>      file://pseudo-fchmodat-permissions.patch \
>  "
> =20
> +SRC_URI_append_class-nativesdk =3D " file://symver.patch"
> +
> +SRC_URI_append_class-native =3D " file://symver.patch"
> +
>  SRC_URI[md5sum] =3D "5ec67c7bff5fe68c56de500859c19172"
>  SRC_URI[sha256sum] =3D "3b896f592f4d568569bd02323fad2d6b8c398e16ca36ee5a=
8947d2ff6c1d3d52"
> =20
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.0.bb b/meta/recipes-=
devtools/pseudo/pseudo_1.6.0.bb
> new file mode 100644
> index 0000000..e92c4d7
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.6.0.bb
> @@ -0,0 +1,10 @@
> +require pseudo.inc
> +
> +SRC_URI =3D " \
> +    http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
> +"
> +
> +SRC_URI[md5sum] =3D "78c3f8aa8efe8cf15a2b21261174e3b6"
> +SRC_URI[sha256sum] =3D "e24f526443b31c3292ec5ba04950d230b5388e8983c7e192=
e9e489c007f3dba3"
> +
> +PSEUDO_EXTRA_OPTS ?=3D "--enable-force-async"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_git.bb
> index 66fc85f..ef258fa 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -1,7 +1,7 @@
>  require pseudo.inc
> =20
> -SRCREV =3D "b9eb2b5633b5a23efe72c950494728d93c2b5823"
> -PV =3D "1.5.1+git${SRCPV}"
> +SRCREV =3D "512b84fb539c970464a93107995edf0e775d13fa"
> +PV =3D "1.6.0+git${SRCPV}"
> =20
>  DEFAULT_PREFERENCE =3D "-1"
> =20
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9lPOKfY2vCV97ybw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPNlQgACgkQN1Ujt2V2gBx83ACcCoXDMEIlN//gYo0fT6r7EhEy
XkAAoLGG1k/ZoG44yFWyrX9Z5xOC2ybz
=BuQ9
-----END PGP SIGNATURE-----

--9lPOKfY2vCV97ybw--
