Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SFsJj-0003Jv-1y
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 21:25:59 +0200
Received: by wgbdr12 with SMTP id dr12so1412800wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2012 12:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dCe0enXNNSvNLRb+2x0T6wJ5KnGdoNyuX07cbSiv7DY=;
	b=OmAibcdYKNwxOVALPRPLVkUCdYXNdkseV5NHMMt3pRnxwxpENyg6XjnvaNRcPT8UYi
	tmEaehZqIor253vop0uKlLAo2KHPr/5GY2lpLw6zbUu71+m3a7Y0B2d5KUtQo7N+i6kW
	cp1TlrMQ2u71zQ3aaAzOq/BU4ukR740RtIvFRhTjSSzVL0iNzV7uTd6Xs1UvwJa3t96N
	2KCUWxtjUACKKSAJscd7EfPmxrWxR0Q8vLPeUsbQc0pGAwJLspLcX1MmcKdsx04RhWi/
	gIvn9+lqLTGyRVAuRaCKhQfFVPEZBnnhqdu01+L3Q/4sooNkEucJ7loP/w22i3XFmUfz
	EMYQ==
Received: by 10.216.134.27 with SMTP id r27mr2361973wei.107.1333653407081;
	Thu, 05 Apr 2012 12:16:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gg2sm20686582wib.7.2012.04.05.12.16.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 12:16:45 -0700 (PDT)
Date: Thu, 5 Apr 2012 21:16:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120405191606.GS4181@jama.jama.net>
References: <cover.1333642153.git.dexuan.cui@intel.com>
	<515847c54a45a2cb7922cec91d2aeac26a4a7dea.1333642153.git.dexuan.cui@intel.com>
MIME-Version: 1.0
In-Reply-To: <515847c54a45a2cb7922cec91d2aeac26a4a7dea.1333642153.git.dexuan.cui@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/3] libxaw: move it from meta-demoapps/ into meta/ and upgrade it to 1.0.10
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
X-List-Received-Date: Thu, 05 Apr 2012 19:25:59 -0000
X-Groupsio-MsgNum: 20329
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qZLIv6EoKi7YuaSc"
Content-Disposition: inline

--qZLIv6EoKi7YuaSc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 06, 2012 at 12:10:11AM +0800, Dexuan Cui wrote:
> Add LICENSE and LIC_FILES_CHKSUM;
> Add SRC_URI checksums;
> Remove do_install_append since 1.0.10's Makefile has done the work.

This is also in meta-oe
meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb

as with xterm, can you compare and merge those changes?

Thanks,

Cheers,

>=20
> libxaw is needed by xterm.
>=20
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
>  .../recipes-graphics/xorg-lib/libxaw_1.0.10.bb     |   15 +++++++--------
>  1 files changed, 7 insertions(+), 8 deletions(-)
>  rename meta-demoapps/recipes-graphics/xorg-lib/libxaw_1.0.5.bb =3D> meta=
/recipes-graphics/xorg-lib/libxaw_1.0.10.bb (59%)
>=20
> diff --git a/meta-demoapps/recipes-graphics/xorg-lib/libxaw_1.0.5.bb b/me=
ta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
> similarity index 59%
> rename from meta-demoapps/recipes-graphics/xorg-lib/libxaw_1.0.5.bb
> rename to meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
> index 489f456..a10577e 100644
> --- a/meta-demoapps/recipes-graphics/xorg-lib/libxaw_1.0.5.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxaw_1.0.10.bb
> @@ -3,16 +3,15 @@ require xorg-lib-common.inc
>  DESCRIPTION =3D "X Athena Widget Set"
>  DEPENDS +=3D "xproto virtual/libx11 libxext xextproto libxt libxmu libxp=
m libxp printproto libxau"
>  PROVIDES =3D "xaw"
> -PR =3D "r1"
> -PE =3D "1"
> +PR =3D "r0"
> =20
> -XORG_PN =3D "libXaw"
> +LICENSE =3D "MIT & MIT-style"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1c65719d42900bb81b83e8293c20a=
364"
> +
> +SRC_URI[md5sum] =3D "f1ea52debce7a18cc26b21647a00ad8b"
> +SRC_URI[sha256sum] =3D "2d96bcf92638b8ec5c91d379f5ec2e7b15133adeb2ba2206=
6d48bf3239ee1bdd"
> =20
> -do_install_append () {
> -	ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
> -	ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
> -	ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so
> -}
> +XORG_PN =3D "libXaw"
> =20
>  PACKAGES =3D+ "libxaw6 libxaw7 libxaw8"
> =20
> --=20
> 1.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qZLIv6EoKi7YuaSc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk9973YACgkQN1Ujt2V2gBz/1wCgjdOuptgydg0tP0r0PfION1uy
Tf0AoKmMxFwLeKhkL9s/bQNiF2fs9rp6
=K1d4
-----END PGP SIGNATURE-----

--qZLIv6EoKi7YuaSc--
