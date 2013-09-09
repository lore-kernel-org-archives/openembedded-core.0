Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id A41176110E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 12:06:59 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so3104423eae.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 05:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NplkVVaGSousbiJxkoFSdNw0mDO28lwmfDNEYZFgyMk=;
	b=TVPXZjm8Nv5M/tyZ/nFYhVERw//erMR8/VKuxcddY4z9kPXf6TzBiuclRiSGh7Qtj/
	vtR9yQoLqymlHm5qOTmHczgi1iK4PbM5C0u3D3ySiuPQvaFfyl8QqE2VG6hWidiSvsu7
	ZIsTxSAeUXFAUw1nJNlunagj9VkEY0ji7cbrTK0H5JaQm0V3ggy0FuF5pxcTPFNU+5Z1
	9bhNvnzb7xv1pjyJKit5jNDgz/Rki/ADCEiJ+IhZWsfDzFLBCJ5svu6ozV6uzozuK/E9
	NfEshH719+Pjg7duswuUn24DDsMOTUsIAz4rsuu2sUAqsGukdknYY9/07UGD/klp2OI6
	9VNg==
X-Received: by 10.14.107.68 with SMTP id n44mr30137545eeg.26.1378728420347;
	Mon, 09 Sep 2013 05:07:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y47sm21293559eew.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 05:06:59 -0700 (PDT)
Date: Mon, 9 Sep 2013 14:08:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130909120824.GQ11500@jama>
References: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] mesa: use distro_features_check to abort build without opengl feature
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
X-List-Received-Date: Mon, 09 Sep 2013 12:07:00 -0000
X-Groupsio-MsgNum: 44693
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gblAvmLjk8yGG9If"
Content-Disposition: inline

--gblAvmLjk8yGG9If
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2013 at 11:19:11AM +0100, Ross Burton wrote:
> Stop mesa from building on distributions without the "opengl" DISTRO_FEAT=
URE.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 71fcabd..79605fa 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -19,7 +19,9 @@ DEPENDS =3D "expat makedepend-native flex-native bison-=
native"
> =20
>  PROVIDES =3D "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/eg=
l"
> =20
> -inherit autotools pkgconfig pythonnative gettext
> +inherit autotools pkgconfig pythonnative gettext distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "opengl"

Is this really needed? I was building mesa in distro without opengl for
long time and was considering (probably incorrectly) opengl DISTRO_FEATURE =
more
like sign of proper hw GL libraries.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gblAvmLjk8yGG9If
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlItujgACgkQN1Ujt2V2gBwBeACdEj3qBjvZ5ZZu5OqUySQ6UMTm
xX0AnApnt8GIOLLlZwu85uG02/98prRM
=WF/f
-----END PGP SIGNATURE-----

--gblAvmLjk8yGG9If--
