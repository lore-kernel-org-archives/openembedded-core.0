Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1033660629
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 10:25:40 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b15so141133eae.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 03:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7wqIIQQeoMynNnbdRlHXoPC6+GLreF/TRCfj0AYZoqo=;
	b=Hyowuwu0v9gCx5DMuhFXcSVPr9tTQKAIa2s49hoO5yVlum3GhfNaTSoe1CMERYP78Z
	61kIzF1vyf0JQxP2dYbM9DWKFlgvWMDnrQC/CZCZp0JDEB7WVnUyMtzLYv17kZSdv6KS
	B+d6jRMpGI7vhLH6qmY6XIQESGNeRb+i5GoJrXn6X1Jd8tubEQnnxRzFNbvISDykBQll
	XKEbzXs3CQjsRnmyZYYS7s56G6rYeju5JkDg+BNx0NL2L38ZJGV9lf5qJsPR+RweP6Bq
	L4jkEttN43dc+UwpEtOUIHxv6+J5IzK9XFUbuo0eW2AhTsaQi1SQyoWUsj0lO4gREWW5
	mrqQ==
X-Received: by 10.14.0.4 with SMTP id 4mr36387784eea.68.1374661540578;
	Wed, 24 Jul 2013 03:25:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm65014170eed.9.2013.07.24.03.25.38 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 03:25:39 -0700 (PDT)
Date: Wed, 24 Jul 2013 12:26:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
Message-ID: <20130724102602.GD4136@jama>
References: <1374577279-21342-1-git-send-email-alexandru.damian@intel.com>
	<1374656368-12517-1-git-send-email-alexandru.damian@intel.com>
MIME-Version: 1.0
In-Reply-To: <1374656368-12517-1-git-send-email-alexandru.damian@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] weston: add harfbuzz dependency
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
X-List-Received-Date: Wed, 24 Jul 2013 10:25:41 -0000
X-Groupsio-MsgNum: 42359
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jCrbxBqMcLqd4mOl"
Content-Disposition: inline

--jCrbxBqMcLqd4mOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2013 at 09:59:28AM +0100, Alex DAMIAN wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>=20
> Weston 1.1.0 has a build time dependency on pango,
> so we add it.

Subject doesn't match with what commit does now.

>=20
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>  meta/recipes-graphics/wayland/weston_1.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/wayland/weston_1.1.0.bb b/meta/recipes=
-graphics/wayland/weston_1.1.0.bb
> index 7327b98..c7c64ad 100644
> --- a/meta/recipes-graphics/wayland/weston_1.1.0.bb
> +++ b/meta/recipes-graphics/wayland/weston_1.1.0.bb
> @@ -18,7 +18,7 @@ SRC_URI[sha256sum] =3D "e7715d2c731f77a729c994a599ffdae=
bac1307b2dd9336136706869fa5
>  inherit autotools pkgconfig useradd
> =20
>  DEPENDS =3D "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
> -DEPENDS +=3D "wayland mesa virtual/egl"
> +DEPENDS +=3D "wayland mesa virtual/egl pango"
> =20
>  EXTRA_OECONF =3D "--disable-android-compositor \
>                  --enable-setuid-install \
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jCrbxBqMcLqd4mOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHvq7oACgkQN1Ujt2V2gBxI5QCffpLpbEBrbwKoViYQV5R4G6sl
jn8An00iygyw4Bij5v9VkjRX+Y1Vi4rw
=pGXQ
-----END PGP SIGNATURE-----

--jCrbxBqMcLqd4mOl--
