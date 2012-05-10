Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SSbBK-000318-JU
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 23:45:54 +0200
Received: by wgbdr1 with SMTP id dr1so1810772wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 14:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sIlGhZUhTMNRJNrnwjkOaRJQQzMPapLT4orSSYMLOWE=;
	b=Z3n4E+7yD44yaoCdisx674u0KzHNX1VpMN3X2qYalcO9PJiZtW2ilDcTzM1vxRXWV/
	q1zgyQh4GIGiB0/2BxXTTX45QxXKyWVDGSOP5D/M6astqEH2VIXngGlpFZzvd5ljK4R3
	rU5llm3k+d/TNz25UqUSXOWJkft4Gb5ENzfmiXMZJiD4BafAA4E9XwX3w1xENBtKJOId
	X1Z0Ii2ZwKCGhj1EZG9NwFL4Vtz01G0CUsFtLOIXQqWavZDnw3jJTm5o+3n7ttXueaH9
	lmMB/Kn4kbFEi0YRbz1o/Vs+tklMuo7lFfO5tO0hUW9dLYxcnVeqNkBUJln5JVHEJhoY
	a/Dg==
Received: by 10.216.134.41 with SMTP id r41mr35780wei.13.1336685760286;
	Thu, 10 May 2012 14:36:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z3sm6185033wix.0.2012.05.10.14.35.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 14:35:59 -0700 (PDT)
Date: Thu, 10 May 2012 23:36:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120510213601.GA3166@jama.jama.net>
References: <1336684128-29514-1-git-send-email-cazfi74@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1336684128-29514-1-git-send-email-cazfi74@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] expat: update to upstream version 2.1.0
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
X-List-Received-Date: Thu, 10 May 2012 21:45:54 -0000
X-Groupsio-MsgNum: 22029
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline

--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 11, 2012 at 12:08:48AM +0300, Marko Lindqvist wrote:
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>  .../recipes-core/expat/expat-2.0.1/autotools.patch |   21 --------------=
---
>  .../recipes-core/expat/expat-2.1.0/autotools.patch |   24 ++++++++++++++=
++++++
>  meta/recipes-core/expat/expat_2.0.1.bb             |    6 -----
>  meta/recipes-core/expat/expat_2.1.0.bb             |    6 +++++
>  4 files changed, 30 insertions(+), 27 deletions(-)
>  delete mode 100644 meta/recipes-core/expat/expat-2.0.1/autotools.patch
>  create mode 100644 meta/recipes-core/expat/expat-2.1.0/autotools.patch
>  delete mode 100644 meta/recipes-core/expat/expat_2.0.1.bb
>  create mode 100644 meta/recipes-core/expat/expat_2.1.0.bb
>=20
> diff --git a/meta/recipes-core/expat/expat-2.0.1/autotools.patch b/meta/r=
ecipes-core/expat/expat-2.0.1/autotools.patch
> deleted file mode 100644
> index c0ac10b..0000000
> --- a/meta/recipes-core/expat/expat-2.0.1/autotools.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Avoid using expat's m4 files
> -
> -Upstream-Status: Inappropriate [Other]
> -Workaround specific to our build system.
> -
> -Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> -Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> -
> -diff -bur expat-2.0.0~orig/configure.in expat-2.0.0/configure.in
> ---- expat-2.0.0~orig/configure.in	2006-01-10 19:10:46.000000000 -0600
> -+++ expat-2.0.0/configure.in	2006-02-10 19:12:24.000000000 -0600
> -@@ -50,9 +50,6 @@
> -=20
> - AC_CONFIG_HEADER(expat_config.h)
> -=20
> --sinclude(conftools/libtool.m4)
> --sinclude(conftools/ac_c_bigendian_cross.m4)
> --
> - AC_LIBTOOL_WIN32_DLL
> - AC_PROG_LIBTOOL
> -=20
> diff --git a/meta/recipes-core/expat/expat-2.1.0/autotools.patch b/meta/r=
ecipes-core/expat/expat-2.1.0/autotools.patch
> new file mode 100644
> index 0000000..0e59969
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat-2.1.0/autotools.patch
> @@ -0,0 +1,24 @@
> +Avoid using expat's m4 files
> +
> +Upstream-Status: Inappropriate [Other]
> +Workaround specific to our build system.
> +
> +Signed-off-by: Kevin Tian <kevin.tian@intel.com>
> +Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> +
> +Updated to apply over expat 2.1.0
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +
> +diff -Nurd expat-2.1.0/configure.in expat-2.1.0/configure.in
> +--- expat-2.1.0/configure.in	2012-03-04 01:45:53.000000000 +0200
> ++++ expat-2.1.0/configure.in	2012-05-10 21:04:44.000000000 +0300
> +@@ -51,8 +51,6 @@
> +=20
> + AC_CONFIG_HEADER(expat_config.h)
> +=20
> +-sinclude(conftools/ac_c_bigendian_cross.m4)
> +-
> + AC_LIBTOOL_WIN32_DLL
> + AC_PROG_LIBTOOL
> +=20
> diff --git a/meta/recipes-core/expat/expat_2.0.1.bb b/meta/recipes-core/e=
xpat/expat_2.0.1.bb
> deleted file mode 100644
> index 30b5684..0000000
> --- a/meta/recipes-core/expat/expat_2.0.1.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require expat.inc
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1b71f681713d1256e1c23b0890920=
874"
> -PR =3D "r1"
> -
> -SRC_URI[md5sum] =3D "ee8b492592568805593f81f8cdf2a04c"
> -SRC_URI[sha256sum] =3D "847660b4df86e707c9150e33cd8c25bc5cd828f708c7418e=
765e3e983a2e5e93"
> diff --git a/meta/recipes-core/expat/expat_2.1.0.bb b/meta/recipes-core/e=
xpat/expat_2.1.0.bb
> new file mode 100644
> index 0000000..727769f
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat_2.1.0.bb
> @@ -0,0 +1,6 @@
> +require expat.inc
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1b71f681713d1256e1c23b0890920=
874"
> +PR =3D "r1"

Please reset this to r0 or remove PR completely (as r0 is default)

> +
> +SRC_URI[md5sum] =3D "dd7dab7a5fea97d2a6a43f511449b7cd"
> +SRC_URI[sha256sum] =3D "823705472f816df21c8f6aa026dd162b280806838bb55b34=
32b0fb1fcca7eb86"
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+sNMEACgkQN1Ujt2V2gByyxwCfVmHs/YCqKduxok4TUsny87MY
71YAn2txvlJ1i3wSj6S23zOd6mfmM4uN
=My3b
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
