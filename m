Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 831E5731C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 17:07:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q128so7402472wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 10:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=C1xsFUM5agYHsYQGw2P08ai+CCDKGDPOynu0rusNKYM=;
	b=lYrmLYK6K+frqRNUSaFcicdOtsX36rFR8FHHI/8+FoM9tP4a3Kb1GAY8y3AkpZTnGJ
	hAURrBrEbQoDB7vWTN3uy+P7E6J/IfhNRYloeX5rMaH27jUQyxkXfv+Vp6Qv8KtIyGtu
	d/AUtJP9w8sQXAkUXFt08L4JbX9QAyuQV2S+VhJoYd7RSu8Kl6WhEf2EQuqy9tZcrYjj
	8+VmfWCBHO9TGfj0cP8ZAA/kf0jaW9axPiTkpOYzlpHByQRnoHgqJ+/JZuFB/kCy3R1I
	/oLAwy8aayKBOQKMAjvlp3da2Yjbfeig5Hh4OhWefsUI06/dzBQhiqIeFstfmjRC/Fx8
	uuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=C1xsFUM5agYHsYQGw2P08ai+CCDKGDPOynu0rusNKYM=;
	b=iYx2XONQBD1J5DuYe0fxDeWntjEN6NDrOf6MK4CZFaw/+CBbzT7S8fwYQs6+49dR3/
	cQb3c1q1VWiprTmX1Uwts4nttgiH18PMBC7S/yfni5fGU+0D3Tx3puUMxRxxfynzdn9+
	/glHz+rGtLSW5zXhr70UFE6nPa2ol5Qf+5KPauUQCkFlTjppRD7XeljtIVikaGSnpuSW
	85m7P3EaD22DIEPZrPgi9HsTaz1rROU+ccFwKbyVqrwBMpKKXpYPbxklmb5rgdxC1j+Q
	UqOlQstoRmSAVUUrjYa0ITIhQGCEOstThvCdEsxoQRgbEJtEGFlKvvvLhTvOFa4BY10r
	Xiqw==
X-Gm-Message-State: AEkoouswCxJfxeYfjBEEMzbHAHKdn/gLCF11nzaWJVPOJUklhGSIkmJemO3e2Ea4k0coWA==
X-Received: by 10.194.73.136 with SMTP id l8mr28145682wjv.153.1469639273816;
	Wed, 27 Jul 2016 10:07:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id he3sm7318484wjc.6.2016.07.27.10.07.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Jul 2016 10:07:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Jul 2016 19:07:56 +0200
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20160727170756.aridi4qzmmuyedyt@jama>
References: <1469637177-2657-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1469637177-2657-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: add missing wayland-native dependency
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
X-List-Received-Date: Wed, 27 Jul 2016 17:07:55 -0000
X-Groupsio-MsgNum: 85011
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="64itijzfxwe5ndsg"
Content-Disposition: inline

--64itijzfxwe5ndsg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2016 at 05:32:57PM +0100, Ross Burton wrote:
> The wayland support requires wayland-scanner, so add a dependency on
> wayland-native.

Why is this needed when wayland already depends on wayland-native?

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.i=
nc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> index 9e2b94e..d8c8179 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> @@ -58,7 +58,7 @@ PACKAGECONFIG[srtp]            =3D "--enable-srtp,--dis=
able-srtp,libsrtp"
>  PACKAGECONFIG[uvch264]         =3D "--enable-uvch264,--disable-uvch264,l=
ibusb1 libgudev"
>  PACKAGECONFIG[voaacenc]        =3D "--enable-voaacenc,--disable-voaacenc=
,vo-aacenc"
>  PACKAGECONFIG[voamrwbenc]      =3D "--enable-voamrwbenc,--disable-voamrw=
benc,vo-amrwbenc"
> -PACKAGECONFIG[wayland]         =3D "--enable-wayland --enable-egl,--disa=
ble-wayland --disable-egl,wayland virtual/egl"
> +PACKAGECONFIG[wayland]         =3D "--enable-wayland --enable-egl,--disa=
ble-wayland --disable-egl,wayland-native wayland virtual/egl"
>  PACKAGECONFIG[webp]            =3D "--enable-webp,--disable-webp,libwebp"
> =20
>  # these plugins have not been ported to 1.0 (yet):
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--64itijzfxwe5ndsg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleY6msACgkQN1Ujt2V2gBx5EQCfUa0vcYhRP4eCjS7rjiVXrGlp
xI4AoLbDOf04GhAnNT1ODWMOPrQpeHj6
=NdT0
-----END PGP SIGNATURE-----

--64itijzfxwe5ndsg--
