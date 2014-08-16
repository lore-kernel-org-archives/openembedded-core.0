Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 582AC60424
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 18:20:45 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id b17so3209699lan.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Aug 2014 11:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=naqAVaUlkcqHom5ZDVdC3KrpQjZL0pM1HnrLX7mH3IA=;
	b=0AkcQ8Kops2IujsTRamcBF/2Uq5JQ6LNig6bJexqo3hdaSCcV6Zh08lHsW7JNDxuid
	ragQ0qW5+j1xE+HGsu+HnxPOTq8xnzvglJBIsSGDCcD071vJPT2jDhQaRhEyTBqrYCEZ
	5xJJBDPkpisSQu4usCJyAtX/GbBIJ8zPs4pKhF3CXrrmzkWE3ofKXDBpYoIk2j7wy+K2
	qncoCJGQbj8DygnU37VN20kM3OEzlQZq2KICkJp4isXEleC8TUvv3DskPnUx5hLziJfv
	3bCL0K/qGNWXV8GalNnxeFH5ITyeixJ2MfRKi+2Lx/We9Cjd3Nrx95FYlMWY+jPxTPp9
	10pA==
X-Received: by 10.152.25.170 with SMTP id d10mr18771307lag.37.1408213245934;
	Sat, 16 Aug 2014 11:20:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	um4sm8763611lbb.40.2014.08.16.11.20.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Aug 2014 11:20:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 16 Aug 2014 20:20:43 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20140816182043.GB3660@jama>
References: <1405512834-14423-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1405512834-14423-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [RFC][PATCH] libav: drop unused FFMPEG_LIBS and move libpostproc only to 0.8.11
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
X-List-Received-Date: Sat, 16 Aug 2014 18:20:47 -0000
X-Groupsio-MsgNum: 56613
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Content-Disposition: inline

--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 02:13:54PM +0200, Martin Jansa wrote:
> * standalone libpostproc recipe depends on libav, but current PACKAGES_DY=
NAMIC indicated
>   that libav-9.13 also provides libpostproc

ping

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-multimedia/libav/libav.inc       | 5 -----
>  meta/recipes-multimedia/libav/libav_0.8.11.bb | 2 ++
>  meta/recipes-multimedia/libav/libav_9.13.bb   | 3 +++
>  3 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multi=
media/libav/libav.inc
> index 1d617a2..ff1ab0e 100644
> --- a/meta/recipes-multimedia/libav/libav.inc
> +++ b/meta/recipes-multimedia/libav/libav.inc
> @@ -87,9 +87,6 @@ do_install_append() {
>      install -m 0644 ${S}/libavfilter/*.h ${D}${includedir}/libavfilter/
>  }
> =20
> -FFMPEG_LIBS =3D "libavcodec libavdevice libavformat \
> -               libavutil libpostproc libswscale libavfilter"
> -
>  PACKAGES +=3D "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
> =20
>  RSUGGESTS_${PN} =3D "mplayer"
> @@ -142,5 +139,3 @@ python populate_packages_prepend() {
>          for pkg in pkgs:
>              d.appendVar('INSANE_SKIP_%s' % pkg, ' textrel')
>  }
> -
> -PACKAGES_DYNAMIC +=3D "^lib(av(codec|device|filter|format|util)|postproc=
|swscale).*"
> diff --git a/meta/recipes-multimedia/libav/libav_0.8.11.bb b/meta/recipes=
-multimedia/libav/libav_0.8.11.bb
> index 662d205..1344a2a 100644
> --- a/meta/recipes-multimedia/libav/libav_0.8.11.bb
> +++ b/meta/recipes-multimedia/libav/libav_0.8.11.bb
> @@ -16,3 +16,5 @@ PROVIDES +=3D "libpostproc"
>  EXTRA_OECONF +=3D " \
>      --enable-postproc \
>  "
> +
> +PACKAGES_DYNAMIC +=3D "^lib(av(codec|device|filter|format|util)|postproc=
|swscale).*"
> diff --git a/meta/recipes-multimedia/libav/libav_9.13.bb b/meta/recipes-m=
ultimedia/libav/libav_9.13.bb
> index 7bfbc48..f9c413f 100644
> --- a/meta/recipes-multimedia/libav/libav_9.13.bb
> +++ b/meta/recipes-multimedia/libav/libav_9.13.bb
> @@ -11,3 +11,6 @@ SRC_URI[md5sum] =3D "23b9e34bffdaee366710fdf20157a570"
>  SRC_URI[sha256sum] =3D "2ff05df6cd2259b3bb277eb16c234214f8e0530700d0c774=
d033eba23edde6ca"
> =20
>  DEFAULT_PREFERENCE =3D "-1"
> +
> +# unlike 0.8.11 we don't provide libpostproc
> +PACKAGES_DYNAMIC +=3D "^lib(av(codec|device|filter|format|util)|swscale)=
=2E*"
> --=20
> 2.0.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPvoPsACgkQN1Ujt2V2gBwWqwCfYeRMCrqc+z+/K6/oieWkxuVa
aoYAn1CCrfytnitlNwaUL722vlMk4gHK
=zhgw
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
