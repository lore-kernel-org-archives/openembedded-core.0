Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 056C87638A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:34:09 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so23748161wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m+zKa0eIwV1XIBdwIzRnH9wRlnTatRR5JktZ4H369LQ=;
	b=RMXBlU9nEYYIJeuoiq+Fxev/hyE4euGZTWp62EZfzWoz4EczZSrAW7jAWGga9RpA3L
	qgoYKRtr86sWHFc1AK0Hdxj+hgiUxSQXkuVeBS0wsidY6K9WlWpjuV4MuxTaFHrUWYIR
	4foxeTltwQGpmksbhWHFZuGjJn0jNgXPsprl9r7c1zbMLqF0jvgdfgsBbDeQTTklLxd+
	hGfV2n3MxrL2/XwG72aVvXrzmtBia4ugkf6HgrnyKQMnTP2Gmy00FonemcIdMF/WsYkp
	OQKgfLwuTw7reTM1TCJTWZUTkNq6wtuhtTRqEpb+703HO+zWa8Chm9C/OYzhYbwg2fx8
	P4QQ==
X-Received: by 10.194.201.71 with SMTP id jy7mr92199406wjc.93.1438266849562;
	Thu, 30 Jul 2015 07:34:09 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id lj2sm3459919wic.1.2015.07.30.07.34.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 07:34:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 16:34:24 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150730143424.GH2457@jama>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<eb991f734674a23f31de22ff59c8b2327aa26d36.1438262915.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <eb991f734674a23f31de22ff59c8b2327aa26d36.1438262915.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 13/26] oprofile: reorder SRC_URI lines to fix upstream version check
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
X-List-Received-Date: Thu, 30 Jul 2015 14:34:14 -0000
X-Groupsio-MsgNum: 68738
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hAW+M2+FUO+onfmf"
Content-Disposition: inline

--hAW+M2+FUO+onfmf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 04:31:42PM +0300, Alexander Kanavin wrote:
> The source tarball should be listed first.
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-kernel/oprofile/oprofile.inc      | 2 +-
>  meta/recipes-kernel/oprofile/oprofile_1.0.0.bb | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-ker=
nel/oprofile/oprofile.inc
> index 49e6b16..ff360d1 100644
> --- a/meta/recipes-kernel/oprofile/oprofile.inc
> +++ b/meta/recipes-kernel/oprofile/oprofile.inc
> @@ -18,7 +18,7 @@ FILES_${PN} =3D "${bindir} ${libdir}/${BPN}/lib*${SOLIB=
S} ${datadir}/${BPN}"
>  FILES_${PN}-dev +=3D "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}=
/lib*.la"
>  FILES_${PN}-staticdev +=3D "${libdir}/${BPN}/lib*.a"
> =20
> -SRC_URI =3D "file://filemode-fix.patch \
> +SRC_URI +=3D "file://filemode-fix.patch \
>             file://acinclude.m4 \
>             file://automake-foreign.patch \
>             file://oprofile-cross-compile-tests.patch \
> diff --git a/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb b/meta/recipe=
s-kernel/oprofile/oprofile_1.0.0.bb
> index f4a34b3..f75a1dd 100644
> --- a/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb
> +++ b/meta/recipes-kernel/oprofile/oprofile_1.0.0.bb
> @@ -1,13 +1,13 @@
> -require oprofile.inc
> -
>  DEPENDS +=3D "virtual/kernel"
>  DEPENDS_append_powerpc64 =3D " libpfm4"
> =20
> -SRC_URI +=3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"

Move this to .inc instead of re-ordering.

> =20
>  SRC_URI[md5sum] =3D "ba0b340e5c421a93959776c836ed35b3"
>  SRC_URI[sha256sum] =3D "847110b4ecdcf8c8353cd38f94c1b704aad4bfcd9453e38b=
88d112cfb7e3c45a"
> =20
> +require oprofile.inc
> +
>  S =3D "${WORKDIR}/oprofile-${PV}"
> =20
>  PR =3D "r1"
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

--hAW+M2+FUO+onfmf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6NfAACgkQN1Ujt2V2gBw8EgCdF6WUDGpd+LIauZER3ak8KS9l
A+oAoJPpDrCE/l/eFvUrezqNEQY5Q6J4
=ro1N
-----END PGP SIGNATURE-----

--hAW+M2+FUO+onfmf--
