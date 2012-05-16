Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUg4W-0002ts-UC
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 17:23:29 +0200
Received: by eaal1 with SMTP id l1so238355eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 08:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=//42HTZ+KePCjX5YhKLADx+kXbaGfna1rBpxa8qQAxs=;
	b=m1d8oJkdEyzEXGT7u8qsYdCw9r4LXgbQbTsqE5Isnu0GXyKEIwmWwI/3DHyCYwJoap
	3p2brq1juP0a6sGSogVx3kSBdq8HTXYhUTdIbW3JBBkwoU9u5bcNhoyFRYgVOOfs3T5U
	zAxVjT+P/1EkHsGnkvGdN7nFLptwe0oTmvBTdOinSCicFJA/XgSN/JaFEQIhhtoAc66X
	1zqXcsusc4LfVqb/CGBiL+c2akWFGFcZoP8X7KHNZlWXd1/LT+Xt4x9KT0ez5xfrLQqh
	IoWh8CtBsUPkeyJ4PN5iJGpAfcQUb+r5TBEVDeSVQDq1ZqeaVo0wcwPVxyqfMIt/7hJH
	73Cg==
Received: by 10.213.7.70 with SMTP id c6mr1551320ebc.75.1337181207373;
	Wed, 16 May 2012 08:13:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u7sm5961820eeb.7.2012.05.16.08.13.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 08:13:26 -0700 (PDT)
Date: Wed, 16 May 2012 17:13:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120516151327.GC3154@jama.jama.net>
References: <1337178421-22908-1-git-send-email-alexandru.damian@intel.com>
MIME-Version: 1.0
In-Reply-To: <1337178421-22908-1-git-send-email-alexandru.damian@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] xf86-video-vmware: update package to 12.0.2
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
X-List-Received-Date: Wed, 16 May 2012 15:23:29 -0000
X-Groupsio-MsgNum: 22206
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Content-Disposition: inline

--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 05:27:01PM +0300, Alexandru DAMIAN wrote:
> This patch updates the package version for the vmware xorg driver
> to 12.0.2, following upstream. No other changes made beside updating
> the checksums.

This does apply to all patches and their updates sent today from @intel.com:

Would be great if you manage to put "PATCHv2" in subject-prefix and also
fill In-Reply-To headr with Message-Id from your older patch or review
comment, so they stay in same thread and it's easy to see what's latest
version.

Cheers,

> ---
>  ...mware_12.0.1.bb =3D> xf86-video-vmware_12.0.2.bb} |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_12.0.1.bb =
=3D> xf86-video-vmware_12.0.2.bb} (74%)
>=20
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.b=
b b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
> similarity index 74%
> rename from meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb
> rename to meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
> index a5655fc..71f0339 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
> @@ -9,10 +9,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5fcd7d437a95=
9a15fbee8707747c6b53"
>  DEPENDS +=3D "virtual/libx11 libxvmc drm glproto \
>  	    virtual/libgl xineramaproto libpciaccess"
> =20
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.0"
> =20
> -SRC_URI[md5sum] =3D "08101a9b09774ec2f432db5118928c53"
> -SRC_URI[sha256sum] =3D "ded644af1f74ca0ebdc759e3db715519c476b341c1783c3d=
92c93a76591ed496"
> +SRC_URI[md5sum] =3D "0743ec7c479603fba60d118858fd5783"
> +SRC_URI[sha256sum] =3D "c827875fd94805ec9b925fe09aaa973e7e3f9096c7ef311d=
449c3f134ae75147"
> =20
>  COMPATIBLE_HOST =3D '(i.86.*-linux|x86_64.*-linux)'
> =20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+zxBcACgkQN1Ujt2V2gBxmowCbBH4bGfiCKZya22tHlbPXtsX5
52MAn2TKYyVt+OlPvyYlAdEqdT255h7j
=QYL8
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--
