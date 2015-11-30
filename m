Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E0AD9601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 14:08:33 +0000 (UTC)
Received: by wmec201 with SMTP id c201so139755771wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 06:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cld/3f6PWD/RplVkn7SvfzdctmyAM/605kjep8bo/Ng=;
	b=mVSh3fAlkesjcUVfUCXJkoY5cKh2ZQMmYDBptRy7BuzbtAQIT5wuJon1cWjtVbXCve
	LvmSDFfQn81g6XSTTiufDQyoX/foxtZ6PIyP+CjqaQSVVWOjl3SUUh9I8yA4BNHLLfHW
	+wq/eN9Wa87Q62eG4aNAvbUWOP0NJDPZzuKaQjoBLEV2XK27ISfRq1vW4w/pv+RTacrM
	Fmey1AivWk3VYDE+6DdYkDk6+HAALGIaxAFYHPRu319UnGnF9ySdldfRo3teU9qjx4QP
	298d2YQ9utwij9OKrYy9E2pr3Alnm4P23RgjSGOcQZHOfwstdl2jaw1kUdStKAxbELfu
	sPPw==
X-Received: by 10.194.205.103 with SMTP id lf7mr59437385wjc.147.1448892510689; 
	Mon, 30 Nov 2015 06:08:30 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q77sm21515728wmd.22.2015.11.30.06.08.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Nov 2015 06:08:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Nov 2015 15:09:22 +0100
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20151130140922.GB2250@jama>
References: <1448874081-23745-1-git-send-email-maxin.john@intel.com>
	<1448874081-23745-2-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1448874081-23745-2-git-send-email-maxin.john@intel.com>
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
X-List-Received-Date: Mon, 30 Nov 2015 14:08:34 -0000
X-Groupsio-MsgNum: 74133
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline

--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 30, 2015 at 11:01:21AM +0200, Maxin B. John wrote:
> Moving the package from meta-oe as a replacement for libjpeg
> package. libjpeg-turbo has same API/ABI as libjpeg. It is relatively
> faster in JPEG compression/decompression than libjpeg.

Please squash them or apply in opposite order, otherwise you break
bisect-ability without good reason.

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

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZcWJEACgkQN1Ujt2V2gBxDEwCaAqbWohSZA+/gZ97BGHWzFFii
RxkAnjCsFhbCYqh6/5UzXIPVwoXa6yxw
=Cz5R
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
