Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 77FCB60017
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 17:05:21 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id n3so10968138wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 09:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RZ5k0kGZueWFKEo9vnDjjrwHN0JE0cvcf7C3p85oe4g=;
	b=x4WjQ6jkAhBqN09U1Q5Dft5yCCruczMjyT5VJETOVmzHoImLnFDkbpG3szWeuMVmbv
	OVvTf8Gu9WnBcso3HPDkhy7wvKXc26XoO8QD6SEiMgMW0Op2fi1SnE3Ga8qRvblJiHF4
	272NhxHVnOz7KMfjMC/sKp0sJQo4tkuaagKPcSTzUrGlaVlODqvB99DHDTS0t31dqfc5
	JUbEG0dHy6Az4y+UoQcBighdZu8U9S8OZ5aBYlOvmoGXUiHSPVDtRu92GExMRQ22dIvD
	N45bCPkY7Q7Wt50DFBin7GJcS7zkYZYRxyZ0rMJG860KuD4d6Tpm+BxvUenP/knq2k0R
	bnPQ==
X-Received: by 10.180.98.3 with SMTP id ee3mr27154906wib.12.1421600721397;
	Sun, 18 Jan 2015 09:05:21 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	mo12sm14036005wjc.35.2015.01.18.09.05.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Jan 2015 09:05:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 18 Jan 2015 18:05:30 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20150118170530.GA2454@jama>
References: <20141030082101.GE15148@jama>
	<1418221027-12371-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1418221027-12371-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCHv2 1/4] gst-ffmpeg: add dependency on libpostproc
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
X-List-Received-Date: Sun, 18 Jan 2015 17:05:28 -0000
X-Groupsio-MsgNum: 61466
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline

--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2014 at 03:17:04PM +0100, Martin Jansa wrote:
> * building with libav-9 fails with:
>   | checking for POSTPROC... configure: error: Package requirements (libp=
ostproc libavcodec libavutil) were not met:
>   |
>   | No package 'libpostproc' found
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/me=
ta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> index 30e5deb..7304fff 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
>                      file://gst-libs/ext/libav/COPYING.LGPLv3;md5=3De6a60=
0fd5e1d9cbde2d983680233ad02"
>  LICENSE_FLAGS =3D "commercial"
>  HOMEPAGE =3D "http://www.gstreamer.net/"
> -DEPENDS =3D "gstreamer gst-plugins-base zlib bzip2 yasm-native"
> +DEPENDS =3D "gstreamer gst-plugins-base zlib bzip2 yasm-native libpostpr=
oc"
> =20
>  inherit autotools pkgconfig

Ping, this patchset is stalled since August 2014 :/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlS759oACgkQN1Ujt2V2gBxWJwCdGFyzUkgrbH43ab6fOuG/646o
u7UAoIGnKoQL/Yw3eRln0mVauE5HXZMI
=/PkL
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
