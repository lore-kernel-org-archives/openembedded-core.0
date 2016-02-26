Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id F1C00773E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 11:03:08 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g62so65309833wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 03:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jJtJLojdLHsL4uCVE3AU7qoEjxgSS3KHyMHq3CxxYf4=;
	b=ZeAuxRkFpfZYZM2vsog1jaXrpLYg2Kh8kXN7NSK1kptBzUSpuBr5yJy3x3SbEzWFFQ
	MoFp/28H4FA4G07hnJmDKYukvEPuYoqCVfjL4mAImNUCMgZN3HjRX3CW1U5Q8qnpiWCo
	AftpJPSxuo2rnwYG0frpSqKIER0GyMNR6HVHZqob51Cy/mB7ptyGmMi7CIkD+c/KUg+i
	c3iy8Vcz3BCZxw2R2DzVBwLu29bIvo9QJEINpQPSmtNL2Pi/jMuNA9HCLakYcaIcjzRL
	ieIBCi+d6ww2nGTudXG+rbveElAL4T+92bNe9TzAkiEx9YibNVgzAOnMK8nFr2jSaFOt
	eFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jJtJLojdLHsL4uCVE3AU7qoEjxgSS3KHyMHq3CxxYf4=;
	b=VZSceE48b3m7VUxABRutzBacAQ2o6tBtRbt660P4YahOmL41EofSD723nz/77F106g
	J2vXszWCCd6TQDcvRkfPlpUqt9FltqhI6fIwLGs2Jz2Wzwks7Vr47AsuNoGj42UDYhT6
	hj+seRhVqAqCbciEHG8ZYWFZsf7CankN64vgu+lPMZm+KkOhkRj2nE6KRF5eKLc6R2YT
	owWwqzvibs81bnPHABjDtd1annYQtF3nSW/559oJ+1X4rFFLGvXK0zy3GmC2V97DuNes
	Cj3gjJ45Xh0s6LuzsiFucePpT4+kCm6+SpBRR51k9ft7y4HXxX6CU4JR7ctaNuf5pU94
	XG7w==
X-Gm-Message-State: AD7BkJIwvbxvzv8Jjk8fRKjhNb4RZD0Lc2JYbZOCtMlc4gmL/0iN/lwI1xsGW7hi+f4lNg==
X-Received: by 10.194.61.19 with SMTP id l19mr1046091wjr.148.1456484589270;
	Fri, 26 Feb 2016 03:03:09 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a128sm2398027wmh.6.2016.02.26.03.03.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 03:03:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 26 Feb 2016 12:04:28 +0100
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20160226110428.GA2557@jama>
References: <1456483945-16340-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1456483945-16340-1-git-send-email-net147@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ffmpeg: fix build when DISTRO_FEATURES doesn't contain x11
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
X-List-Received-Date: Fri, 26 Feb 2016 11:03:10 -0000
X-Groupsio-MsgNum: 78770
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 26, 2016 at 09:52:25PM +1100, Jonathan Liu wrote:
> If avdevice is enabled, libxv is used if it is detected by configure
> for the XV outdev. However, we can't depend on libxv for avdevice when
> DISTRO_FEATURES doesn't contain x11 as this will result in an error.
>=20
> Fix this by adding a libxv dependency only when the avdevice
> PACKAGECONFIG is enabled and DISTRO_FEATURES contains x11. XV outdev
> is only one of many that are supported by avdevice so it is still
> useful to enable avdevice even if libxv is not available.
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_2.8.6.bb
> index 72393b3..f29c05e 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
> @@ -23,11 +23,12 @@ SRC_URI[sha256sum] =3D "25bcedbdafadac3d09c325c1d46a5=
1f53d858b26a260d5aed6b4f17fea
>  PROVIDES =3D "libav libpostproc"
> =20
>  DEPENDS =3D "alsa-lib zlib libogg yasm-native"
> +DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'avdevice', bb.utils=
=2Econtains('DISTRO_FEATURES', 'x11', 'libxv', '', d), '', d)}"
> =20
>  inherit autotools pkgconfig
> =20
>  PACKAGECONFIG ??=3D "avdevice avfilter gpl theora x264 ${@bb.utils.conta=
ins('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> -PACKAGECONFIG[avdevice] =3D "--enable-avdevice,--disable-avdevice, libxv"
> +PACKAGECONFIG[avdevice] =3D "--enable-avdevice,--disable-avdevice"

bb.utils.contains didn't work in PACKAGECONFIG?

Why not
PACKAGECONFIG[avdevice] =3D "--enable-avdevice,--disable-avdevice, ${@bb.ut=
ils.contains('DISTRO_FEATURES', 'x11', 'libxv', '', d)"

>  PACKAGECONFIG[avfilter] =3D "--enable-avfilter,--disable-avfilter"
>  PACKAGECONFIG[faac] =3D "--enable-libfaac,--disable-libfaac,faac"
>  PACKAGECONFIG[gpl] =3D "--enable-gpl,--disable-gpl"
> --=20
> 2.7.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbQMTUACgkQN1Ujt2V2gBwBkgCgtYZ4C3UscF6tjLTsShh0FgbS
XQkAnjkwYFFdFo/GA7XdUaY898x92u9S
=RTW3
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
