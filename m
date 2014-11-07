Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 634F265CDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 14:38:07 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id r20so4572064wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zLzwQ/pv5pzMVPgSGL3ayYyhigX7XwaSukOM5ooOf4E=;
	b=g5ZvCJiV8sw/h/0dXh6esm6e/OuizLpOsFeUVweeLtZyXCcYqNF02RddriwHnNPh3g
	iVwHXBwDGkHEHwmgLwy4mE9M8O0GhVizz1c8Fmme2ROiH/gjcMDKwh1vsjWuicPiXCGR
	fQQLwL2y+D8mQQqriaifYtJ1Ie7RCiaT0q97YNSs1A9MHRGbSRVzUHoI6PmCR29+xpCr
	KyvcFUxegP8D1ohVZn/S74ww0d86Faa9jafZ/DKyinYw7PZ+nx2IQ4cC1ySi1XZynVRr
	Drs/QOyRo2EZspFYIPeDMzHIUOInNBuwIC/IJMyYQaGH46HAGDVF98F/PQ7XYkl9uWor
	/4TA==
X-Received: by 10.194.92.82 with SMTP id ck18mr16711922wjb.103.1415371087660; 
	Fri, 07 Nov 2014 06:38:07 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cx9sm12024764wjc.25.2014.11.07.06.38.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Nov 2014 06:38:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 7 Nov 2014 15:38:13 +0100
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20141107143813.GF2444@jama>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<16384282a6c5f4878b1c377bbe38cfae1d311d0b.1415346812.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <16384282a6c5f4878b1c377bbe38cfae1d311d0b.1415346812.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] avahi.inc: use avahi-daemon as avahi's provider
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
X-List-Received-Date: Fri, 07 Nov 2014 14:38:16 -0000
X-Groupsio-MsgNum: 59414
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s5/bjXLgkIwAv6Hi"
Content-Disposition: inline

--s5/bjXLgkIwAv6Hi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2014 at 03:57:01PM +0800, Hongxu Jia wrote:
> The package avahi does not exist, so we use avahi-daemon as the provider.
> It avoids the do_rootfs failure while IMAGE_INSTALL +=3D "avahi"

Why don't you fix your IMAGE_INSTALL instead?

>=20
> [YOCTO #6937]
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-connectivity/avahi/avahi.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-con=
nectivity/avahi/avahi.inc
> index b060437..5573372 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -76,6 +76,8 @@ PACKAGES =3D+ "avahi-daemon libavahi-common libavahi-co=
re libavahi-client avahi-dn
>  # As avahi doesn't put any files into PN, clear the files list to avoid =
problems
>  # if extra libraries appear.
>  FILES_avahi =3D ""
> +# Let avahi-daemon to provide avahi
> +RPROVIDES_avahi-daemon =3D "avahi"
>  FILES_avahi-autoipd =3D "${sbindir}/avahi-autoipd \
>                         ${sysconfdir}/avahi/avahi-autoipd.action \
>                         ${sysconfdir}/dhcp/*/avahi-autoipd \
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

--s5/bjXLgkIwAv6Hi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRc2VUACgkQN1Ujt2V2gByvmwCcCspReIUr9CrFAH+oqQt15M4K
nxIAniNfbik5hcYUxz7MLwnphXg+ziwB
=O+yw
-----END PGP SIGNATURE-----

--s5/bjXLgkIwAv6Hi--
