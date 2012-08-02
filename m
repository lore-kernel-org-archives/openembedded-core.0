Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwrbO-0002qa-Ra
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:21:54 +0200
Received: by weyr6 with SMTP id r6so5279136wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 02:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eWg5Zm1mTzMLUD6o4JSqFn218637yOkqCiJDMM+Aqvo=;
	b=gT6i63Hv8wv+PanwTtbR3QvhQjCigiXsft8+tGDxyrDectYuhWUkd36KBW2pn5YWDQ
	uz/TswbByAwuhQytSllsu3ACShsaosRRIbB/3AIoly3YnVHjSHjpcv1R3EWTjUKIxZut
	/7uImVIiCeSn0LLYqwelllcx+lr5RSkq020TkP0Iiaf7XpSBOBN/yZF+QE64MeGGDEbt
	p8GJ/3YQNCdYyby00aiZL+6lSL7ttLkU7Fb13tM3GdKkokVg14vo+j3GJq2mbvmeQQpT
	BmEvzqfhQTA72iWcTaZ/5hvmkM37aYvSmnJz949HoaFn7wiXXKaVUd80iQLQEO1cJijF
	OViw==
Received: by 10.180.84.1 with SMTP id u1mr2998972wiy.15.1343898615699;
	Thu, 02 Aug 2012 02:10:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm32669344wib.8.2012.08.02.02.10.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 02:10:12 -0700 (PDT)
Date: Thu, 2 Aug 2012 11:10:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120802091010.GN16306@jama.jama.net>
References: <1343898530-11885-1-git-send-email-radu.moisan@intel.com>
MIME-Version: 1.0
In-Reply-To: <1343898530-11885-1-git-send-email-radu.moisan@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] usbutils: Upgrade usbutils to upstream v002
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
X-List-Received-Date: Thu, 02 Aug 2012 09:21:54 -0000
X-Groupsio-MsgNum: 26753
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Zl+NncWK+U5aSfTo"
Content-Disposition: inline

--Zl+NncWK+U5aSfTo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 02, 2012 at 12:08:50PM +0300, Radu Moisan wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>

Why not current 006? And lsusb link is not needed anymore?

> ---
>  .../usbutils/{usbutils_0.91.bb =3D> usbutils_002.bb} |    7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta/recipes-bsp/usbutils/{usbutils_0.91.bb =3D> usbutils_002.bb}=
 (80%)
>=20
> diff --git a/meta/recipes-bsp/usbutils/usbutils_0.91.bb b/meta/recipes-bs=
p/usbutils/usbutils_002.bb
> similarity index 80%
> rename from meta/recipes-bsp/usbutils/usbutils_0.91.bb
> rename to meta/recipes-bsp/usbutils/usbutils_002.bb
> index abe807c..c546acd 100644
> --- a/meta/recipes-bsp/usbutils/usbutils_0.91.bb
> +++ b/meta/recipes-bsp/usbutils/usbutils_002.bb
> @@ -7,19 +7,18 @@ LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> =20
>  DEPENDS =3D "libusb zlib"
> -PR =3D "r5"
> +PR =3D "r0"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}=
=2Etar.gz \
>             file://usb-devices-avoid-dependency-on-bash.patch \
>             file://Fix-NULL-pointer-crash.patch"
> =20
> -SRC_URI[md5sum] =3D "49de2403b40bf3a9863faaa8d3858deb"
> -SRC_URI[sha256sum] =3D "c122346b0225121bcf159abf804116f826a4a3462c94ce7b=
8871f7559e6b3a46"
> +SRC_URI[md5sum] =3D "82decd82811458f0740cf2f715267d4d"
> +SRC_URI[sha256sum] =3D "d75e4f26ee6fa2f94712edf124456cc409d00934c57771d4=
1ccd5febf4538933"
> =20
>  inherit autotools
> =20
>  do_install_append() {
> -	ln -s ../sbin/lsusb ${D}${bindir}/lsusb
>  	# We only need the compressed copy, remove the uncompressed version
>  	rm -f ${D}${datadir}/usb.ids
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

--Zl+NncWK+U5aSfTo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAaQ/IACgkQN1Ujt2V2gBwNMwCgo294qzl2Casw8+FhteNtPgkr
zzcAn1prtYM3ra49JoeQwgNVK5fN8jq5
=6spx
-----END PGP SIGNATURE-----

--Zl+NncWK+U5aSfTo--
