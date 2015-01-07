Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9196265CDB;
	Wed,  7 Jan 2015 14:12:54 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so1690058wiw.9;
	Wed, 07 Jan 2015 06:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zijdGJKBqkfyenU23BQPua8jxVVWHzxE1c6JyQGWQAM=;
	b=plPIRbucPNdJaEZBSGMydHVgORSoqvX9UfAnDK19khesRY3zfgMTrFavn7w6wSviFZ
	T4L7a+cU/jhv552Q5yiEr909bkqhHBLrYT/yQm6594oBSeobWvbpuVHYJKo0ivZzoKBd
	FQgGuPi7whGr6IIuR8pe+ew3VMvy/1UxsY8EkUXXLnJ3WcfzYCsvTib3b7JdS/7IvV+2
	w/uUrpNjypeVp1YAEEsFQwmKQfw0Hw3xDh5gq+fSPslg1aSVv/NLdgUK0ChoUZfsbMQ5
	iNa5K/1zyK9WpLajadVyfjRyubmno296/5eNbBraGnEW9DhReTM9dJqO9La+VOHLQ9IZ
	ieKg==
X-Received: by 10.180.97.106 with SMTP id dz10mr8137522wib.6.1420639974404;
	Wed, 07 Jan 2015 06:12:54 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cg8sm2313201wjc.1.2015.01.07.06.12.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 06:12:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 Jan 2015 15:12:56 +0100
To: openembedded-core@lists.openembedded.org,
	Richard Tollerton <rich.tollerton@ni.com>
Message-ID: <20150107141256.GM29986@jama>
References: <20141219180841.C5F5A503BF@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20141219180841.C5F5A503BF@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Tollerton : font-util: Fix incorrect PKG_CONFIG_PATH
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
X-List-Received-Date: Wed, 07 Jan 2015 14:12:57 -0000
X-Groupsio-MsgNum: 61106
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KSyhVCl2eeZHT0Rn"
Content-Disposition: inline

--KSyhVCl2eeZHT0Rn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2014 at 06:08:41PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 89a29a3ad0742cd713e739d3d460be7711966679
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D89a29a3ad0742cd713e739d3d460be7711966679
>=20
> Author: Richard Tollerton <rich.tollerton@ni.com>
> Date:   Fri Dec 12 13:34:00 2014 -0600
>=20
> font-util: Fix incorrect PKG_CONFIG_PATH
>=20
> PKG_CONFIG_PATH always defaults to /usr/lib/pkgconfig, and the host
> /usr/lib/pkgconfig is always checked as a fallback; however,
> PKG_CONFIG_PATH is currently (incorrectly) set to /usr/lib/pkg-config in
> the sysroot, which doesn't exist. On host distros where the font


> encoding maps are stored under a different path than OE, this will break
> font builds, because ucs2any will attempt to read the sysroot's encoding
> maps with the host paths.

^ Is this description of what the patch is supposed to fix or expected
side-effect of this change?

Because all font recipes and meta-oe are failing since this change with
errors like this:

/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/ucs=
2any: Can't read mapping file
'/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/share/=
fonts/X11/util/map-ISO8859-1': No such file or directory!

See http://www.openembedded.org/wiki/Bitbake_World_Status

>=20
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>=20
> ---
>=20
>  meta/recipes-graphics/xorg-font/font-util_1.3.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb b/meta/re=
cipes-graphics/xorg-font/font-util_1.3.0.bb
> index 8b42991..cc4258a 100644
> --- a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
> +++ b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
> @@ -17,7 +17,7 @@ RDEPENDS_${PN}_class-native =3D "mkfontdir-native mkfon=
tscale-native"
>  PR =3D "${INC_PR}.0"
> =20
>  do_configure_prepend() {
> -        sed -i "s#MAPFILES_PATH=3D\`pkg-config#MAPFILES_PATH=3D\`PKG_CON=
FIG_PATH=3D\"${STAGING_LIBDIR_NATIVE}/pkg-config\" pkg-config#g" ${S}/fontu=
til.m4.in
> +        sed -i "s#MAPFILES_PATH=3D\`pkg-config#MAPFILES_PATH=3D\`PKG_CON=
FIG_PATH=3D\"${STAGING_LIBDIR_NATIVE}/pkgconfig\" pkg-config#g" ${S}/fontut=
il.m4.in
>  }
> =20
>  BBCLASSEXTEND =3D "native"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KSyhVCl2eeZHT0Rn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlStPugACgkQN1Ujt2V2gBwMhQCfU3pLICO5g/WaZDxKzQQv8c/g
xSMAoLFrLVHJM+xynVAC7BViVIQK5xNv
=9GGp
-----END PGP SIGNATURE-----

--KSyhVCl2eeZHT0Rn--
