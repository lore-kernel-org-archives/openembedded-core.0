Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1743D6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 15:45:02 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so18738890wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 08:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=I9R60OEKOzdOosqjeVJd5GGimX4bmOBNYdHfby+UK8M=;
	b=PThkDHWusJV/OBYhbxhTCPAz7j2ACwfdm1WS7YZtd1LmYwYUMTBMOtCza57kAiNh9l
	e9HivZOtSAdoHEO7PJFVXpxCd/i+BY2YnuCII8N3w0c8E3DEjhnSwuu11feMG+1u/KOK
	w9vtkHijoO9tkjeloMmBDC+XJ5jMMwlQTzigDaVsbKSOG9xJf8rdR3Gk6dvgbQrkVV45
	MnClU0CsUMGi41tAHyEJTSSGIZu5cpKFL2XGlzTbFdZAbRXg3zlPFoJg5Gb+HFkgkmOc
	LD11JGpRpXKyQ89vRwcA/nUiGhanSl49odFr1qVunYIFGOlfWZKGgi1pQaijKMEttJec
	4vhg==
X-Received: by 10.194.202.197 with SMTP id kk5mr19747324wjc.64.1437061502157; 
	Thu, 16 Jul 2015 08:45:02 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ib9sm13737448wjb.2.2015.07.16.08.45.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jul 2015 08:45:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Jul 2015 17:45:29 +0200
To: Drew Moseley <drew_moseley@mentor.com>
Message-ID: <20150716154529.GE2134@jama>
References: <1437059524-15971-1-git-send-email-drew_moseley@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1437059524-15971-1-git-send-email-drew_moseley@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] mesa-demos: Fix building demos which require GLU.
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
X-List-Received-Date: Thu, 16 Jul 2015 15:45:04 -0000
X-Groupsio-MsgNum: 68044
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TD8GDToEDw0WLGOL"
Content-Disposition: inline

--TD8GDToEDw0WLGOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2015 at 11:12:04AM -0400, Drew Moseley wrote:
> The existing test for GLU support is backwards.  Reverse the
> sense of the conditional when built with "--enable-glu".
>=20
> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> ---
>  ...figure-Allow-to-disable-demos-which-require-GLEW-.patch | 14 ++++++++=
------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-t=
o-disable-demos-which-require-GLEW-.patch b/meta/recipes-graphics/mesa/mesa=
-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
> index 4b07193..b25f5ce 100644
> --- a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disab=
le-demos-which-require-GLEW-.patch
> +++ b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disab=
le-demos-which-require-GLEW-.patch
> @@ -10,20 +10,21 @@ Subject: [PATCH 3/9] configure: Allow to disable demo=
s which require GLEW or
>  Upstream-Status: Pending
> =20
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
>  ---
> - configure.ac                  | 49 ++++++++++++++++++++---------
> - src/Makefile.am               | 14 ++++++---
> + configure.ac                  | 50 ++++++++++++++++++++---------
> + src/Makefile.am               | 18 ++++++++---
>   src/demos/Makefile.am         | 73 ++++++++++++++++++++++++------------=
-------
>   src/egl/Makefile.am           |  8 +++--
>   src/egl/opengles1/Makefile.am | 44 +++++++++++++++-----------
>   src/egl/opengles2/Makefile.am | 33 ++++++++++---------
> - 6 files changed, 135 insertions(+), 86 deletions(-)
> + 6 files changed, 140 insertions(+), 86 deletions(-)
> =20
>  diff --git a/configure.ac b/configure.ac
>  index 9445424..bc4c8d1 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -93,25 +93,44 @@ AC_EGREP_HEADER([glutInitContextProfile],
> +@@ -89,25 +89,45 @@ AC_EGREP_HEADER([glutInitContextProfile],
>   		[AC_DEFINE(HAVE_FREEGLUT)],
>   		[])
>  =20
> @@ -66,7 +67,7 @@ index 9445424..bc4c8d1 100644
>  -DEMO_CFLAGS=3D"$DEMO_CFLAGS $GLU_CFLAGS"
>  -DEMO_LIBS=3D"$DEMO_LIBS $GLU_LIBS"
>  +if test "x$enable_glu" =3D xyes; then
> -+    PKG_CHECK_MODULES(GLU, [glu], [],
> ++    PKG_CHECK_MODULES(GLU, [glu],

Are you sure? It was like this in original PKG_CHECK_MODULES and I think
it was correct. 4th parameter is used as fallback to find it manually
when pkg-config doesn't find it, with your change it would use
AC_CHECK_HEADER and ignore the values set returned by pkg-config.

>  +                     [AC_CHECK_HEADER([GL/glu.h],
>  +                                      [],
>  +                                      AC_MSG_ERROR([GLU not found]))
> @@ -74,7 +75,8 @@ index 9445424..bc4c8d1 100644
>  +                                   [gluBeginCurve],
>  +                                   [GLU_LIBS=3D-lGLU
>  +				    glu_enabled=3Dyes],
> -+                                   AC_MSG_ERROR([GLU required])) ])
> ++                                   AC_MSG_ERROR([GLU required])) ],
> ++                      [])
>  +
>  +    DEMO_CFLAGS=3D"$DEMO_CFLAGS $GLU_CFLAGS"
>  +    DEMO_LIBS=3D"$DEMO_LIBS $GLU_LIBS"
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

--TD8GDToEDw0WLGOL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWn0ZgACgkQN1Ujt2V2gByewQCgjgHnMzvaB9CzHRqkLjngML3y
3REAn27vj9+sYYIG2WtIBjfTgs9FxKAS
=A7QF
-----END PGP SIGNATURE-----

--TD8GDToEDw0WLGOL--
