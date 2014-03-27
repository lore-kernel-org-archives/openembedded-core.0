Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id B83C06F90B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 11:39:49 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id d49so2771801eek.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 04:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FrghonFVsbQCvXpwnhfXwpFl387KXwFa4o9q9u6LnL8=;
	b=CGE5TNBuX5sZJU2QYBzXElI/Mk0tGqlZ6HWqd2Z9BrWTc/grl3eyfG8W2mUB++0KOm
	R6Oo07/Ne4xcWwoZb85tt7ENK/p5wWAaFMfxy0vgeG7jfrf1Wlp7yjXMnVge+C1YJhs8
	XUKwPdkOaI0e9n779DCiO8fm6m2AP/CoizagZxYOUSw3bL+uXXlQ1sYtaEmA8ia2dfkH
	w1jRx1Ok87QWkAnF5QQ7ubmJNOODCIEM9gZMV3r5K3YI5PgxIDs6SRBcrHVpDJzQ+jBw
	DBc/QRKWIr8u8qzkt8QqKNWdOyoHXPcFSsqoxthIpQldJKwX/8mOZfSXvSxA3equIaHn
	8xtQ==
X-Received: by 10.15.31.70 with SMTP id x46mr1414252eeu.26.1395920389800;
	Thu, 27 Mar 2014 04:39:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	44sm3789056eek.30.2014.03.27.04.39.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Mar 2014 04:39:48 -0700 (PDT)
Date: Thu, 27 Mar 2014 12:39:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140327113949.GQ3709@jama>
References: <cover.1395906475.git.liezhi.yang@windriver.com>
	<9bd12f5fca3736b2975ce0249b3428b5b0af194e.1395906475.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <9bd12f5fca3736b2975ce0249b3428b5b0af194e.1395906475.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] gummiboot: add COMPATIBLE_HOST
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
X-List-Received-Date: Thu, 27 Mar 2014 11:39:51 -0000
X-Groupsio-MsgNum: 51697
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XQ/JOjNzrAcf1KaA"
Content-Disposition: inline

--XQ/JOjNzrAcf1KaA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2014 at 04:11:22AM -0400, Robert Yang wrote:
> The gummiboot depends on gnu-efi which had set:
>=20
> COMPATIBLE_HOST =3D "(x86_64.*|i.86.*)-linux"
>=20
> We also need set this for gummiboot, otherwise there would be build
> failures for other non-x86 archs.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-bsp/gummiboot/gummiboot_git.bb |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-b=
sp/gummiboot/gummiboot_git.bb
> index 5868a23..61de58c 100644
> --- a/meta/recipes-bsp/gummiboot/gummiboot_git.bb
> +++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
> @@ -13,6 +13,8 @@ PV =3D "43+git${SRCPV}"
>  SRCREV =3D "4062c51075ba054d4949c714fe06123f9ad3097d"
>  SRC_URI =3D "git://anongit.freedesktop.org/gummiboot"
> =20

It would be good to add comment here saying it's only because of gnu-efi
dependency (if gummiboot itself can in theory work on other hosts).

People won't notice it in commit message when they are looking at
recipe.

> +COMPATIBLE_HOST =3D "(x86_64.*|i.86.*)-linux"
> +
>  S =3D "${WORKDIR}/git"
> =20
>  EXTRA_OECONF =3D "--disable-manpages --with-efi-includedir=3D${STAGING_I=
NCDIR} \
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XQ/JOjNzrAcf1KaA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM0DgUACgkQN1Ujt2V2gByLBACdE3ZbGetdpjxoEcgoV+Aeh9np
3/4Ani1tKHtQbNJC2kcMzbOXnqCmAF+S
=5LiN
-----END PGP SIGNATURE-----

--XQ/JOjNzrAcf1KaA--
