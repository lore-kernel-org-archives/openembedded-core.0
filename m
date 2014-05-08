Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f48.google.com (unknown [209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 539FF65F09
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 10:55:38 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id rd3so2708325pab.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 03:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uu/KWIMrTVO+Tc3KqeM82SW74iIfdDOD8ceR5+dC5vU=;
	b=Axgl4OoeNwFd//C2hHPKqF6mP4VYcAsFPikTQdimuzdXusdkdmKXd291LyeiArm7Xz
	NmMFvG6VPkHyCR+n/MZrtFy3uMJVEMnHeHaA6wXr6GTRU1RYSNJngMxGMwPdhloIH7vQ
	L6wfqij8pD7ESS7YbfvtoSQZEeyAWRVeoHvBHgF/uu9FyujjizNVNAN94yNvBVVyLpQu
	NwJdXPY6j32FLn3AXkjDBikOuGNaGMvxpuOH2sI7Il3iQcSUez7YZXEZPXfc+eyBZmDP
	Y02bYbVtMlgYtgAvk/kdHGV9jTZs2NgG6dqvLyC6eUtuqnhDJ3CFB1Nv1YNblrN006Jw
	J7Aw==
X-Received: by 10.66.148.197 with SMTP id tu5mr6340323pab.108.1399546140505;
	Thu, 08 May 2014 03:49:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	oz7sm1366802pbc.41.2014.05.08.03.48.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 May 2014 03:48:59 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 May 2014 12:49:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Petter =?iso-8859-1?Q?Mab=E4cker?= <petter@technux.se>
Message-ID: <20140508104920.GN30955@jama>
References: <cover.1399497346.git.petter@technux.se>
	<ef46a93d3cc0aba1ae86b5c78c29374b0e9eacd5.1399497346.git.petter@technux.se>
MIME-Version: 1.0
In-Reply-To: <ef46a93d3cc0aba1ae86b5c78c29374b0e9eacd5.1399497346.git.petter@technux.se>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/13] mesa: remove usage of FILESPATH
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
X-List-Received-Date: Thu, 08 May 2014 10:55:44 -0000
X-Groupsio-MsgNum: 52971
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A2x6GFCQWVc4i5ud"
Content-Disposition: inline

--A2x6GFCQWVc4i5ud
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 11:19:52PM +0200, Petter Mab=E4cker wrote:
> Fixes [YOCTO #4497]
>=20
> Usage of FILESPATH is discouraged, since it can make recipes harder to
> bbappend. Instead FILESEXTRAPATHS should be used to extend the path.
> Avoid using files dir in mesa, since current patchdirs are only shared
> between some of the bb-files. Also remove unused filespath addition.
>=20
> Signed-off-by: Petter Mab=E4cker <petter@technux.se>
> ---
>  meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb b/meta/recipes-g=
raphics/mesa/mesa-gl_9.2.5.bb
> index 8c7d8e8..9059207 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
> @@ -2,7 +2,7 @@ require mesa_${PV}.bb
> =20
>  SUMMARY +=3D " (OpenGL only, no EGL/GLES)"
> =20
> -FILESPATH =3D "${@base_set_filespath(["${FILE_DIRNAME}/mesa-${PV}", "${F=
ILE_DIRNAME}/mesa"], d)}"
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/mesa:"

This was prefering files from mesa-${PV} (when there was version
specific file available) now it doesn't, is it correct?

> =20
>  PROVIDES =3D "virtual/libgl virtual/mesa"
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--A2x6GFCQWVc4i5ud
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNrYTAACgkQN1Ujt2V2gByazACgprcC3aA4IRzK8vuJmixFLGac
0y4AmwT9ABozxRL9Qg0XEIORTcvfCL/s
=Ch8z
-----END PGP SIGNATURE-----

--A2x6GFCQWVc4i5ud--
