Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYZk1-0002fH-9c
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 10:58:41 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so75746bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 01:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yJ6swD80WyS9sSkfkMMWOL89UjIoz5r1UPunjRcfhPY=;
	b=Xs2k4iLOKUzBX685smCtSzstq1lh0OdZLIaivyij5K92gbzk2YBumLcrgHfFk0G0v7
	5Pyw5kmwhnTQImemSHdSpcvX6qj0oyv0gsKEvA19ZyqzYOy73itBNqUs4Sgfz879GDzu
	Z3QvjL6/WJ3fkSP3PrYiflKr0VDA+Pqm3Hce7BBAGwoZ67pGPsuFX7kabJIgVKvQQtHp
	k6Gr+i9Yag7x88jE/yAGXJLdhMska+AZQCA9hq0OlHpLvNWrKjP9eMn2JZKaeHDs8SMR
	mCB83O1b0tgVLALSiCr8czyL0TiqsRshP0eA0+4M0OjJ671PTwAwpcdU9iwu3rSTbzF/
	/wdg==
Received: by 10.204.9.9 with SMTP id j9mr8984599bkj.12.1352886286065;
	Wed, 14 Nov 2012 01:44:46 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ht18sm7377096bkc.14.2012.11.14.01.44.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Nov 2012 01:44:45 -0800 (PST)
Date: Wed, 14 Nov 2012 10:44:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20121114094457.GJ3928@jama.jama.net>
References: <cover.1352884713.git.laurentiu.palcu@intel.com>
	<5467b530a59b1d698e8171b4a7c77104593dde40.1352884713.git.laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <5467b530a59b1d698e8171b4a7c77104593dde40.1352884713.git.laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 12/12] xf86-video-omapfb: upgrade to 0.4.2
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
X-List-Received-Date: Wed, 14 Nov 2012 09:58:41 -0000
X-Groupsio-MsgNum: 31315
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bgQAstJ9X1Eg13Dy"
Content-Disposition: inline

--bgQAstJ9X1Eg13Dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 14, 2012 at 11:28:09AM +0200, Laurentiu Palcu wrote:
> Other changes:
>  * changed the recipe's SRC_URI to track the new (maintained) repo;
>  * removed all old patches as the latest driver's structure has changed
>    drastically;
>  * license file changed quite a bit: MIT -> GPLv2 (needs to be reviewed
>    by somebody with a better understanding of these things though);
>  * xf86-video-omapfb changed its name to xf86-video-omap: change the
>    recipe name acordingly;
>  * add dependency of libdrm-omap;
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  ...-video-omapfb_git.bb =3D> xf86-video-omap_git.bb} |   27 ++++++++++--=
--------
>  1 file changed, 13 insertions(+), 14 deletions(-)
>  rename meta/recipes-graphics/xorg-driver/{xf86-video-omapfb_git.bb =3D> =
xf86-video-omap_git.bb} (43%)
>=20
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b=
/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
> similarity index 43%
> rename from meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
> rename to meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
> index f16441e..fec3365 100644
> --- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
> @@ -6,19 +6,18 @@ DESCRIPTION =3D "omapfb driver supports the basic Texas=
 Instruments OMAP \
>  framebuffer."
> =20
>  LICENSE =3D "MIT-X & GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D63e2cbac53863f60e2f43343fb343=
67f"
> -DEPENDS +=3D "virtual/libx11"
> -
> -SRCREV =3D "28c006c94e57ea71df11ec4fff79d7ffcfc4860f"
> -PR =3D "${INC_PR}.6"
> -PV =3D "0.1.1+gitr${SRCPV}"
> -
> -SRC_URI =3D "git://git.pingu.fi/xf86-video-omapfb;protocol=3Dhttp \
> -            file://omap-revert-set-CRTC-limit.patch \
> -            file://omap-revert-set-virtual-size.patch \
> -            file://omap-force-plain-mode.patch  \
> -            file://omap-blacklist-tv-out.patch  \
> -            file://0004-Attempt-to-fix-VRFB.patch \
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D10ce5de3b111315ea652a5f74ec0c=
602"
> +DEPENDS +=3D "virtual/libx11 libdrm-omap"

Ah, now I see why you added them in libdrm PROVIDES, but why not use
libdrm in DEPENDS and libdrm-omap added to RDEPENDS by shlibs?

I also don't see GNUtoo comment resolved.

Cheers,

> +RPROVIDES =3D "xf86-video-omapfb"
> +RCONFLICTS =3D "xf86-video-omapfb"
> +RREPLACES =3D "xf86-video-omapfb"
> +
> +SRCREV =3D "ae0394e687f1a77e966cf72f895da91840dffb8f"
> +PR =3D "${INC_PR}.0"
> +PV =3D "0.4.2+gitr${SRCPV}"
> +
> +SRC_URI =3D "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap;p=
rotocol=3Dgit \
>  "
> =20
>  S =3D "${WORKDIR}/git"
> @@ -28,5 +27,5 @@ CFLAGS +=3D " -I${STAGING_INCDIR}/xorg "
> =20
>  # Use overlay 2 on omap3 to enable other apps to use overlay 1 (e.g. dma=
i or omapfbplay)
>  do_compile_prepend_armv7a () {
> -        sed -i -e s:fb1:fb2:g ${S}/src/omapfb-xv.c
> +        sed -i -e s:fb1:fb2:g ${S}/src/omap_xv.c
>  }
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

--bgQAstJ9X1Eg13Dy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCjaBkACgkQN1Ujt2V2gBzvqQCgm/g9H+BWWTiaJU9DSA+mXfDp
QI0AmQHVDk9I+r0I6MCqjSAr9uE8tRNJ
=qLH2
-----END PGP SIGNATURE-----

--bgQAstJ9X1Eg13Dy--
