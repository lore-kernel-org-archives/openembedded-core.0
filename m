Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbDGO-0003aN-T4
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 17:35:01 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4011968eei.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 08:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TrkAmnOK4sbIsyNvJC3pIT4PpdwrMjGBrIo+Ha82nMA=;
	b=00Q4wW0xwhruy4Qv52mwBKXm/LC+wSm7WDsBJZLERVGLzu8+YddxDBd31TLSrjYHLZ
	1qzxyC0jZGTs34G5BBuvnkYZ5MFNywaw0Cj6QTJm1KrO/toBca/vGlP+ro7Ryrmc1Ikb
	DUq1lfXrHlMkY8oTrCgNPOPNfv/KDCA9H1Svf5bKCQmnOPSNixd+f4KljMtsZo4bbXZa
	V+I7+yBLCee8LZUc02x4v3/8oy5FsCHZ0IUcjB+fOgLMI4DkkvPWkbhGWaP0Xpj9WdMA
	serY1CxfDOOzNaTMSNtfevvk38aGZMnY7srvBtQvdv2zLgOpECuSR7yVSk/i+AcIBNfy
	ckDA==
Received: by 10.14.1.69 with SMTP id 45mr47152397eec.23.1353514855875;
	Wed, 21 Nov 2012 08:20:55 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q2sm1040319eem.13.2012.11.21.08.20.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 08:20:55 -0800 (PST)
Date: Wed, 21 Nov 2012 17:20:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20121121162051.GK12637@jama.jama.net>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<7f73d8a0aee08a41e949ec7a1297f5edbf12ed57.1352898505.git.laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <7f73d8a0aee08a41e949ec7a1297f5edbf12ed57.1352898505.git.laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 12/12] xf86-video-omap: add new recipe to follow the maintained repo
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
X-List-Received-Date: Wed, 21 Nov 2012 16:35:01 -0000
X-Groupsio-MsgNum: 31613
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcXnUX77nabWBLF4"
Content-Disposition: inline

--HcXnUX77nabWBLF4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 14, 2012 at 03:21:10PM +0200, Laurentiu Palcu wrote:
> This new recipe is needed because the old driver is unmaintained. This
> new recipe will follow the new repo.

On which MACHINE did you test this? Here it fails in do_configure with:
| configure:18796: result: yes
| configure:18808: checking whether to include DRI support
| configure:18812: checking for /usr/include/xorg/dri.h
| configure:18818: error: cannot check for file existence when cross compil=
ing

So I'm wondering if it was tested at all.

With xf86-video-omapfb not ported to xserver-1.13 video API it makes new
default xserver from oe-core unusable on many armv7a machines..

Cheers,

>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  .../xorg-driver/xf86-video-omap_git.bb             |   31 ++++++++++++++=
++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap_git=
=2Ebb
>=20
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/m=
eta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
> new file mode 100644
> index 0000000..b3177eb
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
> @@ -0,0 +1,31 @@
> +require xorg-driver-video.inc
> +
> +SUMMARY =3D "X.Org X server -- Texas Instruments OMAP framebuffer driver"
> +
> +DESCRIPTION =3D "omap driver supports the basic Texas Instruments OMAP \
> +framebuffer."
> +
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D10ce5de3b111315ea652a5f74ec0c=
602"
> +DEPENDS +=3D "virtual/libx11 libdrm"
> +
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
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECONF_armv7a =3D " --enable-neon "
> +CFLAGS +=3D " -I${STAGING_INCDIR}/xorg "
> +
> +# Use overlay 2 on omap3 to enable other apps to use overlay 1 (e.g. dma=
i or omapfbplay)
> +do_compile_prepend_armv7a () {
> +        sed -i -e s:fb1:fb2:g ${S}/src/omap_xv.c
> +}
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

--HcXnUX77nabWBLF4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCs/2MACgkQN1Ujt2V2gBwWxACfTIr12yTjfjuF0trkB/ttOeW0
y9EAmgKOig8LyPKdNNSFl3EXkucGAaf8
=jncR
-----END PGP SIGNATURE-----

--HcXnUX77nabWBLF4--
