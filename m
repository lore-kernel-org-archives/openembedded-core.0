Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 234D26012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 11:14:16 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so66156932wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ScUNljz8FIIMXp1aiZF86jf09skYltBnN+RGIR1PLv0=;
	b=avOxFgbyvBZkIGjgkT2SDM93W2YfJaB45DHg7CTbAX7v4haaTHmZbaH4ErbfxmuHvS
	8rhKv/IflqOnMTNcyUDD/Hv8trlC5H/naBpuD3pInALPzcWjhEU19vTkNn4kQ3pZEFhD
	DRLYu7wGtIVefHXIPdxRExT3hAdJi4m2eMu6CYewnm98hejSvldcUqJnIGhFeA6iOEvj
	z3hIDcNhZaAbc/dHc6f/l/bzeYHggoTY6L9/QJ9ICReaOz5UKaZ92BGNSpy7tvq+oO5Q
	hStNIOdAznCJ4G2RQXHs7A8TDZBzHTRhxtySKbY/4noSaPMyE1TZOiJfk+PXnXobTSnR
	FO/g==
X-Received: by 10.28.35.203 with SMTP id j194mr9596345wmj.13.1448622857434;
	Fri, 27 Nov 2015 03:14:17 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	200sm6999031wmn.11.2015.11.27.03.14.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Nov 2015 03:14:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Nov 2015 12:14:52 +0100
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20151127111452.GB17303@jama>
References: <1448622259-5907-1-git-send-email-maxin.john@intel.com>
	<1448622259-5907-3-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1448622259-5907-3-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libjpeg-turbo: import the recipe from meta-oe
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
X-List-Received-Date: Fri, 27 Nov 2015 11:14:17 -0000
X-Groupsio-MsgNum: 74083
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dgVgbXf0Vb2tUvlQ"
Content-Disposition: inline

--dgVgbXf0Vb2tUvlQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2015 at 01:04:19PM +0200, Maxin B. John wrote:
> libjpeg-turbo has same API/ABI as libjpeg. It is relatively
> faster in JPEG compression/decompression than libjpeg.

Is this imported as-is from meta-oe? If so then at least mention it in
commit message and sent libjpeg-turbo removal for meta-oe.

>=20
> [YOCTO #8628]
>=20
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb | 40 ++++++++++++++++++=
++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
>=20
> diff --git a/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb b/meta/reci=
pes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> new file mode 100644
> index 0000000..e79f800
> --- /dev/null
> +++ b/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> @@ -0,0 +1,40 @@
> +DESCRIPTION =3D "libjpeg-turbo is a derivative of libjpeg that uses SIMD=
 instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and=
 decompression"
> +HOMEPAGE =3D "http://libjpeg-turbo.org/"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://cdjpeg.h;endline=3D12;md5=3Dcad955d15145c3f=
dceec6855e078e953 \
> +                    file://jpeglib.h;endline=3D14;md5=3Ddfc803dc51ae2117=
8d1376ec73c4454d \
> +                    file://djpeg.c;endline=3D9;md5=3De93a8f2061e8a0ac71c=
7a485c10489e2 \
> +"
> +
> +DEPENDS =3D "nasm-native"
> +
> +BASEPV =3D "${@d.getVar('PV',True).split('+')[1]}"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
> +SRC_URI[md5sum] =3D "b1f6b84859a16b8ebdcda951fa07c3f2"
> +SRC_URI[sha256sum] =3D "4bf5bad4ce85625bffbbd9912211e06790e00fb982b77724=
af7211034efafb08"
> +
> +S =3D "${WORKDIR}/${BPN}-${BASEPV}"
> +
> +# Drop-in replacement for jpeg
> +PROVIDES =3D "jpeg"
> +RPROVIDES_${PN} +=3D "jpeg"
> +RREPLACES_${PN} +=3D "jpeg"
> +RCONFLICTS_${PN} +=3D "jpeg"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D "--with-jpeg8 "
> +
> +PACKAGES =3D+ "jpeg-tools libturbojpeg"
> +
> +DESCRIPTION_jpeg-tools =3D "The jpeg-tools package includes client progr=
ams to access libjpeg functionality.  These tools allow for the compression=
, decompression, transformation and display of JPEG files and benchmarking =
of the libjpeg library."
> +FILES_jpeg-tools =3D "${bindir}/*"
> +
> +FILES_libturbojpeg =3D "${libdir}/libturbojpeg.so"
> +INSANE_SKIP_libturbojpeg =3D "dev-so"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +LEAD_SONAME =3D "libjpeg.so.8"
> --=20
> 2.4.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dgVgbXf0Vb2tUvlQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZYOysACgkQN1Ujt2V2gBx1yACghaKaiwu5IYnXLiM7FxQRGv7y
NXMAnRS65ruKfpoizhuw7/a5/95kfthg
=1SuH
-----END PGP SIGNATURE-----

--dgVgbXf0Vb2tUvlQ--
