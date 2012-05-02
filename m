Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPaOr-0007oQ-0Z
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 16:19:25 +0200
Received: by bkcjm2 with SMTP id jm2so516197bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+3agpI3MI3kQmLvw+fFiWYDX6TR+oCsBZMEQ6YS2d5k=;
	b=M1cwqxXbAW8MJ/0lfiE8Gl5st/jyhX6Rrh5+yPqe9PQT1CJE+mfiUlJR3TkXEB0ocJ
	GKy2pjnMiLwsvIyG6FYWDLkpc2/qR8rdDbHFYFqGiSnN+4C8agflQivSFeTumiMls6Sb
	3dGAKwo0wu/m2yMxrEFmR/8dFEB/S6Q+i/7jznpylFI0bOm1uoOqKFt8zUplu2xTur6G
	LUGwCGTYRXxOq/5JZqS/ez8H8irstozQgkA88mHEtkG1b+aXpTjiOuqtMO0utL3HLIfu
	0DjWww/ZyqJHToRwQlfyyxlsGvCxC90rbePF67ELKad+Foy3mQ6zd2J8ZxGrAeZsXUTr
	stYw==
Received: by 10.204.154.28 with SMTP id m28mr9527829bkw.102.1335967780749;
	Wed, 02 May 2012 07:09:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n19sm4127930bkv.14.2012.05.02.07.09.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 07:09:39 -0700 (PDT)
Date: Wed, 2 May 2012 16:09:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120502140940.GB3682@jama.jama.net>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
	<eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] site/arm-common: alignment values for guin32, guin64 and unsigned long
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2012 14:19:25 -0000
X-Groupsio-MsgNum: 21466
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 02, 2012 at 03:59:45PM +0200, Martin Jansa wrote:
> From: Tomas Frydrych <tomas@sleepfive.com>
>=20
> These are required to build recent versions of glib-2.0

similar patch is needed also for other site files, just noticed it while
building for qemux86-64

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/site/arm-common |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/site/arm-common b/meta/site/arm-common
> index c3ffe08..cad8027 100644
> --- a/meta/site/arm-common
> +++ b/meta/site/arm-common
> @@ -76,6 +76,9 @@ glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=
=3D4}
>  glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}
>  glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
>  glib_cv_sys_use_pid_niceness_surrogate=3D${glib_cv_sys_use_pid_niceness_=
surrogate=3Dyes}
> +ac_cv_alignof_guint32=3D4
> +ac_cv_alignof_guint64=3D8
> +ac_cv_alignof_unsigned_long=3D4
> =20
>  #gstreamer
>  as_cv_unaligned_access=3D${as_cv_unaligned_access=3Dno}
> --=20
> 1.7.8.6
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+hQCQACgkQN1Ujt2V2gBxYKQCgqbYhK5fUR3Wcz9awY2fIqInu
8z8AoJgxYOPG6uFnqaA34RkZ1ctkBxse
=+Lmt
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
