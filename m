Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1T9GPn-0007bL-V1; Wed, 05 Sep 2012 16:17:11 +0200
Received: by wgbdr1 with SMTP id dr1so570855wgb.24
	for <multiple recipients>; Wed, 05 Sep 2012 07:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZEOZA8dcOUykTfRFFwop9lm+ZkTrCPSNa0N0A18zn8A=;
	b=d2t6y0Uta31KwHRXRM+zrW7csmAFDDdwkZuS1fvc/nw59mN5WWWVmhxgIJYvutvO8s
	WfgS8GwPP4rJJ6OEaJaxcwpiWSpf2v7O0+1kG0NWvZ/KPOBKN4c6vCiSJFOWkoMiWJoU
	uiVoUwVgE2s5NLLEawWVTMjRCryNarmmvmno3fUDo4/HqlxENflVdj4gBgZ3mdZigeZV
	TWkAzOY7TvJX3EZpzwjHYaARWi12vbNyLnCeHly9xd0eWy6XZRJ/UkGPe3qSFjGMn2HU
	2dt/xqhs25hM/WNQMT7GBZMYVGJ1gD2BR399Dm4La7Jd/VoiE2OZieUSk26I4A9oc7X5
	y3DA==
Received: by 10.216.144.234 with SMTP id n84mr13731076wej.78.1346853888912;
	Wed, 05 Sep 2012 07:04:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm4869624wix.6.2012.09.05.07.04.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 07:04:46 -0700 (PDT)
Date: Wed, 5 Sep 2012 16:05:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
Message-ID: <20120905140516.GQ3372@jama.jama.net>
References: <20120904115104.46A5A10383@opal>
MIME-Version: 1.0
In-Reply-To: <20120904115104.46A5A10383@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: autoreconf: automake failed with exit status: 1 Was: [oe-commits] Constantin Musca : automake: upgrade to 1.12.3
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
X-List-Received-Date: Wed, 05 Sep 2012 14:17:12 -0000
X-Groupsio-MsgNum: 28725
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DMLl6fZPX8o7hGmc"
Content-Disposition: inline

--DMLl6fZPX8o7hGmc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2012 at 11:51:04AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 1110da87a2395e1d516f092553e6ed542bb34805
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D1110da87a2395e1d516f092553e6ed542bb34805
>=20
> Author: Constantin Musca <constantinx.musca@intel.com>
> Date:   Mon Sep  3 10:06:42 2012 +0300
>=20
> automake: upgrade to 1.12.3
>=20
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  .../{automake_1.12.1.bb =3D> automake_1.12.3.bb}     |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/automake/automake_1.12.1.bb b/meta/rec=
ipes-devtools/automake/automake_1.12.3.bb
> similarity index 92%
> rename from meta/recipes-devtools/automake/automake_1.12.1.bb
> rename to meta/recipes-devtools/automake/automake_1.12.3.bb
> index 700592c..25069d7 100644

Has anyone seen errors like this?

| autoreconf: running: automake --foreign --add-missing --copy --force-miss=
ing --warnings=3Dcross
| automake: warning: unknown warning category 'cross'
| automake: warnings are treated as errors
| automake: warning: autoconf input should be named 'configure.ac', not 'co=
nfigure.in'
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.
| ERROR: Function failed: do_configure (see /OE/shr-core/tmp-eglibc/work/ar=
mv7a-vfp-neon-oe-linux-gnueabi/foxtrotgps-1.1.0-r1/temp/log.do_configure.32=
412 for further information)
NOTE: recipe foxtrotgps-1.1.0-r1: task do_configure: Failed
ERROR: Task 886 (/OE/shr-core/meta-openembedded/meta-oe/recipes-navigation/=
foxtrotgps/foxtrotgps_1.1.0.bb, do_configure) failed with exit code '1'

Failed like this for first time today.. so I suspect it's caused by automak=
e upgrade.

Cheers,

> --- a/meta/recipes-devtools/automake/automake_1.12.1.bb
> +++ b/meta/recipes-devtools/automake/automake_1.12.3.bb
> @@ -39,10 +39,10 @@ SRC_URI +=3D "${PATHFIXPATCH} \
>  	    file://python-libdir.patch \
>              file://py-compile-compile-only-optimized-byte-code.patch"
> =20
> -SRC_URI[md5sum] =3D "ec25c1855cacf47e4bdee76a776b96ba"
> -SRC_URI[sha256sum] =3D "24bf1640679ba4a9cbe2d36422f39a81eced7f556b576a7a=
2ccfc70ca85a1e2f"
> +SRC_URI[md5sum] =3D "d2af8484de94cdee16d89c50aaa1c729"
> +SRC_URI[sha256sum] =3D "095ffaa3ac887d1eb3511bf13d7f1fc9ec0503c6a06aeae0=
5c93730cdda9a5a0"
> =20
> -PR =3D "r1"
> +PR =3D "r0"
> =20
>  do_install () {
>      oe_runmake 'DESTDIR=3D${D}' install
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DMLl6fZPX8o7hGmc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBHXBwACgkQN1Ujt2V2gBw/dACeOSjcOMAZvRIjiiCYbnny4bIR
YRUAnRtG3LkbHR702trIkc7ZnI2LIuY7
=8RCQ
-----END PGP SIGNATURE-----

--DMLl6fZPX8o7hGmc--
