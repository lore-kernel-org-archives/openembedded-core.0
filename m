Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TwBDa-0003L6-7Y
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 13:38:52 +0100
Received: by mail-pb0-f44.google.com with SMTP id uo1so2016707pbc.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 04:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=92HypcY1i3cz2YojqwotkGOAuMD4jTdY0dQlBOQR5/Y=;
	b=e5LakZSAuMz3WJs+Olvgnmwt8fMOHBEfsts15S04t7a3sw59jji5nkmXrIQnv6qfgo
	Mi6vuryEu4BajIv3Yqko+Roh0OsL7hKetVHWsjeX91pR9LfX2LghiYC8cHDwZo7k64bO
	/LkL8/r/gfdr2tkRA4tExb8lSDGegIq4vA0N8MqUbf71EvFmOeNGOLgHfYKNwIALqFbd
	JxGnR8WkJFSb7x70U1UXfQad2lkhfoDenVpL1IGHf5AmiD8tm6dCzeB26/rQAvrCP4hM
	5q6WBNvaAcfimaKAF370+ppP2R6Wgw2vZoQfSb9odAe9sSBlt3+Ok0/WQvcy93e83d5n
	DLmQ==
X-Received: by 10.68.135.40 with SMTP id pp8mr23613647pbb.63.1358511801052;
	Fri, 18 Jan 2013 04:23:21 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pj1sm3009864pbb.71.2013.01.18.04.23.18
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 04:23:19 -0800 (PST)
Date: Fri, 18 Jan 2013 13:23:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
Message-ID: <20130118122314.GA23233@jama.palm1.palmone.com>
References: <cover.1358509450.git.constantinx.musca@intel.com>
	<3e9e32d745fa7a228acfcc04aac62e084e0540cd.1358509450.git.constantinx.musca@intel.com>
MIME-Version: 1.0
In-Reply-To: <3e9e32d745fa7a228acfcc04aac62e084e0540cd.1358509450.git.constantinx.musca@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] packagegroup-core-gtk-directfb: rename to packagegroup-core-directfb
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
X-List-Received-Date: Fri, 18 Jan 2013 12:38:53 -0000
X-Groupsio-MsgNum: 34021
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 18, 2013 at 01:48:29PM +0200, Constantin Musca wrote:
> - DirectFB is not supported by gtk versions >=3D 2.18
> - remove the backwards compatibility statements (packagegroup-core-direct=
fb
> is an independent packagegroup)

And what will happen with task-core-gtk-directfb-base/
packagegroup-core-gtk-directfb packages already installed on targets?

It's also possible that someone still with task-core-gtk-directfb-base
will decide that now it's right time to do upgrade..

Cheers,

> - remove all gtk dependencies
>=20
> [YOCTO #3642]
>=20
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>  ...oup-core-gtk-directfb.bb =3D> packagegroup-core-directfb.bb} | 11 ++-=
--------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>  rename meta/recipes-graphics/packagegroups/{packagegroup-core-gtk-direct=
fb.bb =3D> packagegroup-core-directfb.bb} (49%)
>=20
> diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-di=
rectfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.=
bb
> similarity index 49%
> rename from meta/recipes-graphics/packagegroups/packagegroup-core-gtk-dir=
ectfb.bb
> rename to meta/recipes-graphics/packagegroups/packagegroup-core-directfb.=
bb
> index 55b0b9d..aca3a67 100644
> --- a/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.=
bb
> +++ b/meta/recipes-graphics/packagegroups/packagegroup-core-directfb.bb
> @@ -1,14 +1,9 @@
> -SUMMARY =3D "GTK+ over DirectFB without X11"
> -PR =3D "r1"
> +SUMMARY =3D "DirectFB without X11"
> +PR =3D "r0"
>  LICENSE =3D "MIT"
> =20
>  inherit packagegroup
> =20
> -# For backwards compatibility after rename
> -RPROVIDES_${PN} =3D "task-core-gtk-directfb-base"
> -RREPLACES_${PN} =3D "task-core-gtk-directfb-base"
> -RCONFLICTS_${PN} =3D "task-core-gtk-directfb-base"
> -
>  TOUCH =3D ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib t=
slib-calibrate tslib-tests", "",d)}'
> =20
>  RDEPENDS_${PN} =3D " \
> @@ -17,7 +12,5 @@ RDEPENDS_${PN} =3D " \
>  		pango \
>  		pango-modules \
>  		fontconfig \
> -		gtk+ \
> -		gtk-demo \
>  		${TOUCH} \
>  "
> --=20
> 1.7.11.7
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD5PrIACgkQN1Ujt2V2gBz9VQCfcx34KXOnNBC4wBDkhQPJeffn
N3MAn2avpP0C7PMSqMNuday8zGjUc6ND
=Eux+
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
