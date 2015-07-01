Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3343365C89
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 18:47:54 +0000 (UTC)
Received: by wgqq4 with SMTP id q4so44328284wgq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 11:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xVPtK0JnMoWsNciXJlwYVUmGAAfV82llqMnNzEZV+5M=;
	b=zTSEEJQo0AE8B0CmdEDQ/Vcc3AQ6bIDlhQNi7iGKfsc0zU+/Sa359fnaJYhBh96J/d
	k2gbgHHJkm5Jn7ZZ2ctZcn5pX2yFK8popnwgex2WBiSJB3bjyt4NaqNwWyRmZcsLgzki
	pEW+4WjdCJKerJxznArBxBfBE1TrQ9MbVy4C3tJNbCNNwcWX11RtmUBmII4v+mAvXVLS
	tT6tTdq7Reenpe1BCmaTwO67YFLcAObIg4qDXcOxeflEORSLMILFJAHV2NCO3g3cCeiX
	dVrP9KKERlJTLUCG3XpYUkc6DGL5pgnfW8Etmvs5uHyK2ILRT4j2STVyGDocIpLrtYi4
	cWVg==
X-Received: by 10.180.91.100 with SMTP id cd4mr46438813wib.1.1435776474687;
	Wed, 01 Jul 2015 11:47:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id fq7sm23303175wic.5.2015.07.01.11.47.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jul 2015 11:47:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Jul 2015 20:48:16 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20150701184816.GK2409@jama>
References: <cover.1435774899.git.raj.khem@gmail.com>
	<2112607f62fe5c4abf6ff958c88c03d066a719c7.1435774899.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2112607f62fe5c4abf6ff958c88c03d066a719c7.1435774899.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] wayland: Upgrade 1.6.0 -> 1.8.1
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
X-List-Received-Date: Wed, 01 Jul 2015 18:48:02 -0000
X-Groupsio-MsgNum: 67433
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RXc6EO4W1yUvSQ0X"
Content-Disposition: inline

--RXc6EO4W1yUvSQ0X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2015 at 11:24:53AM -0700, Khem Raj wrote:
> Fetch from git, at same release revision SHA

This doesn't match with the change anymore.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/wayland/{wayland_1.6.0.bb =3D> wayland_1.8.1.bb} |=
 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/wayland/{wayland_1.6.0.bb =3D> wayland_1.8.=
1.bb} (92%)
>=20
> diff --git a/meta/recipes-graphics/wayland/wayland_1.6.0.bb b/meta/recipe=
s-graphics/wayland/wayland_1.8.1.bb
> similarity index 92%
> rename from meta/recipes-graphics/wayland/wayland_1.6.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.8.1.bb
> index 6413a0a..5b36745 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.6.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.8.1.bb
> @@ -11,8 +11,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1d4476a7d98d=
d5691c53d4d43a510c72 \
>                      file://src/wayland-server.c;endline=3D21;md5=3D079ae=
21dbf98ada52ec23744851b0a5c"
> =20
>  SRC_URI =3D "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] =3D "d34c141c975084e4fb668e77b38f840e"
> -SRC_URI[sha256sum] =3D "a7d5102dcf53d08c059d24bc62de491d7cd482070abeb673=
7a20d0d86ba6fc7f"
> +SRC_URI[md5sum] =3D "6e877877c3e04cfb865cfcd0733c9ab1"
> +SRC_URI[sha256sum] =3D "f17c938d1c24fd0a10f650a623a2775d329db3168b5732e4=
98b08388ec776fc8"
> +
>  SRC_URI_append_class-native =3D " \
>      file://disable-macro-checks-not-used-for-scanner.patch \
>      "
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RXc6EO4W1yUvSQ0X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWUNe8ACgkQN1Ujt2V2gBzRFQCeN5pkOqz3Impl4uGxoBVfZP/O
5RQAniMXAXO+H6g1t1IUFYUTbRTyTZXw
=UIbZ
-----END PGP SIGNATURE-----

--RXc6EO4W1yUvSQ0X--
