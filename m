Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id A557D713A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 23:20:41 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id r20so11109wiv.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 15:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FSr1uLkpve/H3c8oXjl2RO0a0FKUoDkNvx5mVBTRGWI=;
	b=rJeONUeQJKzng5sslGGvVtef3Dj+UpHk62J9QMHDzDUa2tzpo1cCRfw8+m0ys3cckM
	8bnvxjDfaxM5Di3tWE/d7QrrTwR8xaYBNlQUHkVsN0ZpAngzxbp+sU4Di4H8uI91IZLa
	buMZ6VT3rnUec0DJUb/wfQP8UfLE1e8Hf7SbWbQC/gi4/93vEwSedfCC1k0m16SXTlST
	FFcbSihf9pzJzgC+DKsfeR1y9jhuhC9wraXrgS/ORTxuk5H9ZUFhXclqicsLDsSzbvOn
	0VLSYRZBaMGrGDAfckdRdDbQLYrmvNwldOpORwSk1AS+Ndm0hYUW50pFqg4J4yx9XlBu
	jlFw==
X-Received: by 10.180.10.231 with SMTP id l7mr35115485wib.1.1415661641958;
	Mon, 10 Nov 2014 15:20:41 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s8sm24984427wjx.9.2014.11.10.15.20.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Nov 2014 15:20:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 11 Nov 2014 00:20:51 +0100
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20141110232051.GF2440@jama>
References: <cover.1415647839.git.pab@pabigot.com>
	<01cb8ceb7576735c0034283281f38cfe03aad4b2.1415647839.git.pab@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <01cb8ceb7576735c0034283281f38cfe03aad4b2.1415647839.git.pab@pabigot.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 08/14] gstreamer1.0-plugins-bad: switch to virtual/bluez
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
X-List-Received-Date: Mon, 10 Nov 2014 23:20:43 -0000
X-Groupsio-MsgNum: 59505
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1giRMj6yz/+FOIRq"
Content-Disposition: inline

--1giRMj6yz/+FOIRq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2014 at 03:13:05PM -0600, Peter A. Bigot wrote:
> Be aware that current versions of gstreamer1.0-plugins-bad (through
> 1.4.3) do not currently support bluez5, and will silently disable
> bluetooth support until that has been addressed upstream.
>=20
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc    | 4 ++=
--
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.i=
nc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> index dab0bf5..913a338 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> @@ -18,7 +18,7 @@ PACKAGECONFIG_GL ?=3D "${@bb.utils.contains('DISTRO_FEA=
TURES', 'opengl', 'gles2',
>  PACKAGECONFIG ??=3D " \
>      ${PACKAGECONFIG_GL} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)=
} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'virtual/bluez'=
, '', d)} \

There isn't any virtual/bluez PACKAGECONFIG

>      ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', =
d)} \
>      orc curl uvch264 neon sndfile \
>      hls sbc dash bz2 smoothstreaming \
> @@ -49,7 +49,7 @@ PACKAGECONFIG[bz2]             =3D "--enable-bz2,--disa=
ble-bz2,bzip2"
>  PACKAGECONFIG[fluidsynth]      =3D "--enable-fluidsynth,--disable-fluids=
ynth,fluidsynth"
>  PACKAGECONFIG[schroedinger]    =3D "--enable-schro,--disable-schro,schro=
edinger"
>  PACKAGECONFIG[smoothstreaming] =3D "--enable-smoothstreaming,--disable-s=
moothstreaming,libxml2"
> -PACKAGECONFIG[bluez]           =3D "--enable-bluez,--disable-bluez,bluez=
4"
> +PACKAGECONFIG[bluez]           =3D "--enable-bluez,--disable-bluez,virtu=
al/bluez"
>  PACKAGECONFIG[rsvg]            =3D "--enable-rsvg,--disable-rsvg,librsvg"
>  PACKAGECONFIG[sndfile]         =3D "--enable-sndfile,--disable-sndfile,l=
ibsndfile1"
>  PACKAGECONFIG[webp]            =3D "--enable-webp,--disable-webp,libwebp"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_g=
it.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
> index e1a5904..8f37be8 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
> @@ -11,7 +11,7 @@ S =3D "${WORKDIR}/git"
> =20
>  SRCREV =3D "6e5db57d2446a753aaa76bee268e1f95600b14ce"
> =20
> -PACKAGECONFIG[bluez] =3D "--enable-bluez,--disable-bluez,bluez4"
> +PACKAGECONFIG[bluez] =3D "--enable-bluez,--disable-bluez,virtual/bluez"
>  PACKAGECONFIG[sbc] =3D "--enable-sbc,--disable-sbc,sbc"
>  PACKAGECONFIG[hls] =3D "--enable-hls,--disable-hls,gnutls"
> =20
> --=20
> 1.8.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1giRMj6yz/+FOIRq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRhSFMACgkQN1Ujt2V2gBwD0ACcDdqfCFIuzwQ8fGOhPu4RDpX0
HeMAn0qStzbzPmrEqibwRVrc+1ZauPAx
=wBQb
-----END PGP SIGNATURE-----

--1giRMj6yz/+FOIRq--
