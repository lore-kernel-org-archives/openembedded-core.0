Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id E396A65CDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 14:49:49 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id x12so3906837wgg.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 06:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wizWcKIL2jO2tKG7ySCLueYhyCxJicUxKZqUAVKvbPg=;
	b=Zhcq7sL8g2wkXuleqZYJhF+AHV72xuUv5c1jPx8XvqMXAIjWldsDXkFkRMhghRvIFS
	BFEi8psOp5LRUc5Of+f3h9RUgXacx1rZK8PgH3v4PxTccRTyqaIg3rT13ZGOz8LipQw8
	u8jRQ/oXJS4e/POytw7wywD0WnwjHWHlOTCLX7+ZWjae5zi9Am/kFTKF9WEwF6EXnxXf
	n56PCiMKPDB32sT6ZVutz04VfNWYSKRDrmdDdFGXgTDeRL8ARzHSwYASJRKg6ursmmX7
	D094B9QKdneFOmTwErXNOX/Mjfrt+KMItKa0KdeI6UUmhOETFHKSVur1yjBeHfhM0IYN
	yxCA==
X-Received: by 10.194.81.70 with SMTP id y6mr16234091wjx.113.1415371413542;
	Fri, 07 Nov 2014 06:43:33 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pn4sm12022646wjc.38.2014.11.07.06.43.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Nov 2014 06:43:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 7 Nov 2014 15:43:39 +0100
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20141107144339.GG2444@jama>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<cd8ac315e533592e4ca82994049bf3dd7c2bd6c4.1415346812.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cd8ac315e533592e4ca82994049bf3dd7c2bd6c4.1415346812.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] pointercal-xinput: add the missing ALLOW_EMPTY
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
X-List-Received-Date: Fri, 07 Nov 2014 14:49:51 -0000
X-Groupsio-MsgNum: 59417
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sClP8c1IaQxyux9v"
Content-Disposition: inline

--sClP8c1IaQxyux9v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2014 at 03:57:03PM +0800, Hongxu Jia wrote:
> Since the do_install conditionally install file if it has a contents,
> it should allow the package empty.
>=20
> It avoids the do_rootfs failure while IMAGE_INSTALL +=3D "pointercal-xinp=
ut"

It was removed intentionally

http://git.openembedded.org/meta-openembedded/commit/?id=3D9477e53e8a8ffde1=
7b558ac436550687db4b86a0

> [YOCTO #6937]
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.=
0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> index 65348c3..ebc5155 100644
> --- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> +++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
> @@ -16,5 +16,6 @@ do_install() {
>      fi
>  }
> =20
> +ALLOW_EMPTY_${PN} =3D "1"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  CONFFILES_${PN} =3D "${sysconfdir}/pointercal.xinput"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sClP8c1IaQxyux9v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRc2psACgkQN1Ujt2V2gBwKPACeLpUpcsnHRGvoxfVkFzDT330E
nyIAn3OlU9PvvJmIB/ssMSGbQFrbdX5N
=C3tE
-----END PGP SIGNATURE-----

--sClP8c1IaQxyux9v--
