Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5F63B6B88F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 21:22:34 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e53so3176002eek.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 13:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=l7Hro+vIQ0QPF3uEX+Z1FYMzelNOl2IGiVgDiE3lG0s=;
	b=Z0PPG2o2yTnlb9mVV5yDRXGDqOfsJZpRihlF2YjAarJVpAKN0MXMlouiSbPOc4pilc
	Y5Rhu69jhiIl5UNHwHS2g+HkaQlPUD3i1Cj8wAhMwlgZmKySxEz6GemD/Z1tr5uXib9X
	Uu2ryWWYrVZC/5hLIIpJwlrWnC2AbCW0qi2mneolLjmUuvHBAqzRHlWRi6U5YSXWSC9v
	/WnCLeeUJSKkF4IchzX95iKponxAoF+gCbaF+v3nO56QU2SehClNvg/H3IYPfNF+nKi/
	A18t2rJ17cnVwyPvt7/z4H0Mg1vPWbJaSLL/0i1DRgapH0zdDmcV5nlJ8dKPx/aXVBIa
	NK0g==
X-Received: by 10.15.108.73 with SMTP id cc49mr3898120eeb.93.1386796953512;
	Wed, 11 Dec 2013 13:22:33 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm57933159eel.2.2013.12.11.13.22.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Dec 2013 13:22:32 -0800 (PST)
Date: Wed, 11 Dec 2013 22:22:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20131211212254.GA3717@jama>
References: <cover.1385575572.git.kergoth@gmail.com>
	<c39555e418cf1bbb70e06dbe905411a864727e42.1385575572.git.kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c39555e418cf1bbb70e06dbe905411a864727e42.1385575572.git.kergoth@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/7] pulseaudio: fix RDEPENDS traversal for consolekit
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
X-List-Received-Date: Wed, 11 Dec 2013 21:22:36 -0000
X-Groupsio-MsgNum: 48137
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline

--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2013 at 11:07:07AM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> Include the console-kit module in PACKSGES explicitly so bitbake can map =
to
> the RDEPENDS we define for it in this recipe, and thereby ensure that when
> adding the console-kit module to an image, we also get the necessary
> consolekit package produced.
>=20
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
> index 7e87ef8..2bee9eb 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -69,8 +69,12 @@ USERADD_PARAM_pulseaudio-server =3D "--system --home /=
var/run/pulse \
>                                --no-create-home --shell /bin/false \
>                                --groups audio,pulse --gid pulse pulse"
> =20
> +# The console-kit module is included here explicitly so bitbake can map =
to the
> +# RDEPENDS we define for it in this recipe, and thereby ensure that when
> +# adding the console-kit module to an image, we also get the necessary
> +# consolekit package produced.
>  PACKAGES =3D+ "libpulsecore libpulsecommon libpulse libpulse-simple libp=
ulse-mainloop-glib \
> -             pulseaudio-server pulseaudio-misc"
> +             pulseaudio-server pulseaudio-misc pulseaudio-module-console=
-kit"

Can we add PACKAGECONFIG for this and add it to PACKAGES only
conditionally?

It causes hard dependency on consolekit -> libx11 so pulseaudio now
cannot be built for distros without x11 DISTRO_FEATURE.

>  #upgrade path:
>  RREPLACES_pulseaudio-server =3D "libpulse-bin libpulse-conf"
> --=20
> 1.8.3.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKo164ACgkQN1Ujt2V2gBwwDACgicS8+8nR3GVqGv/TxOMbIY6h
Z/oAnje0n3l6aZdWPuQqZZw8izWHCZNt
=0KNT
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
