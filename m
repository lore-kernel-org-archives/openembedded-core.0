Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1URQNX-0006a6-G9; Sun, 14 Apr 2013 19:07:01 +0200
Received: by mail-ee0-f46.google.com with SMTP id d49so1862344eek.19
	for <multiple recipients>; Sun, 14 Apr 2013 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=zGMZRN+up3iKnwZWfEojN2h4e0mmMfJ44A/txTjUe9U=;
	b=hlwyGATZGmUxUcF9n0GQXotR4B/vYCW59ZOiVhMpw6oO7zBpR06+LzDxH/BAJIduso
	keVOer7EYoZePaMJ0vrcJ2yQdBrco+DuFiU7CscDLYA+UNOiB+idf02nX+wxPmGwOsdH
	DXhZwlNKqlkEzbqHmM77a8kTdoC2j9Yvf9FC2cujxRWzhsCmMu++aJFoKnBnQfSzByjC
	wCxcY9An4+muiAHzdxqHaqH5+E+gj8+7xTXSN13c/Rb+ly5vOMo4tk916tVyAH+pYoTh
	q3qNz1gOy0Bkfksmgbb7NVGdcL5EQRbEVDKT6MaBcYZqX+LgYOAi6bAtAJTS+6ep/ASB
	dUrg==
X-Received: by 10.14.181.196 with SMTP id l44mr45611280eem.44.1365958124093;
	Sun, 14 Apr 2013 09:48:44 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 8sm5661624eeg.15.2013.04.14.09.48.42
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 09:48:43 -0700 (PDT)
Date: Sun, 14 Apr 2013 18:48:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130414164848.GG2475@jama>
References: <20130329103919.019B350446@opal>
MIME-Version: 1.0
In-Reply-To: <20130329103919.019B350446@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Marko Lindqvist : coreutils: update to upstream version 8.21
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2013 17:07:06 -0000
X-Groupsio-MsgNum: 37876
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lHGcFxmlz1yfXmOs"
Content-Disposition: inline

--lHGcFxmlz1yfXmOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2013 at 10:39:19AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: c2fd59028a57356cff8d165edb71c45c3b05cc67
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dc2fd59028a57356cff8d165edb71c45c3b05cc67
>=20
> Author: Marko Lindqvist <cazfi74@gmail.com>
> Date:   Sun Mar 24 07:35:57 2013 +0000
>=20
> coreutils: update to upstream version 8.21
>=20
> remove-gets.patch removed as issue is fixed upstream.
>=20
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

coreutils-8.15 and newer build realpath which conflicts with busybox's
u-a.

Please add u-a settings for that in coreutils to fix upgrade path:

Configuring busybox.
ln: /usr/bin/realpath: File exists
=2E...
update-alternatives: Error: not linking //usr/bin/realpath to /bin/busybox =
since //usr/bin/realpath exists and is not a link

>=20
> ---
>=20
>  .../coreutils/coreutils-8.14/remove-gets.patch     |   23 --------------=
------
>  .../coreutils-build-with-acl.patch                 |    0
>  .../coreutils/coreutils-8.21/dummy_help2man.patch  |   22 ++++++++++++++=
+++++
>  .../remove-usr-local-lib-from-m4.patch             |    0
>  .../{coreutils_8.14.bb =3D> coreutils_8.21.bb}       |   11 +++++----
>  5 files changed, 28 insertions(+), 28 deletions(-)
>=20
> diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch=
 b/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
> deleted file mode 100644
> index 4f61c92..0000000
> --- a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -use gets iff its defined. eglibc 2.16 removed gets
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> -
> -Index: coreutils-8.14/lib/stdio.in.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- coreutils-8.14.orig/lib/stdio.in.h	2011-09-24 04:20:48.000000000 -07=
00
> -+++ coreutils-8.14/lib/stdio.in.h	2012-07-03 10:36:19.886296576 -0700
> -@@ -713,11 +713,13 @@
> - _GL_CXXALIAS_SYS (gets, char *, (char *s));
> - #  undef gets
> - # endif
> -+# if defined gets
> - _GL_CXXALIASWARN (gets);
> - /* It is very rare that the developer ever has full control of stdin,
> -    so any use of gets warrants an unconditional warning.  Assume it is
> -    always declared, since it is required by C89.  */
> - _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
> -+# endif
> - #endif
> -=20
> -=20
> diff --git a/meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-w=
ith-acl.patch b/meta/recipes-core/coreutils/coreutils-8.21/coreutils-build-=
with-acl.patch
> similarity index 100%
> rename from meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-wi=
th-acl.patch
> rename to meta/recipes-core/coreutils/coreutils-8.21/coreutils-build-with=
-acl.patch
> diff --git a/meta/recipes-core/coreutils/coreutils-8.21/dummy_help2man.pa=
tch b/meta/recipes-core/coreutils/coreutils-8.21/dummy_help2man.patch
> new file mode 100644
> index 0000000..4757f52
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils-8.21/dummy_help2man.patch
> @@ -0,0 +1,22 @@
> +Upstream-Status: Inappropriate [disable feature]
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +diff -Nurd coreutils-8.21/man/local.mk coreutils-8.21/man/local.mk
> +--- coreutils-8.21/man/local.mk	2013-02-05 16:01:21.000000000 +0200
> ++++ coreutils-8.21/man/local.mk	2013-03-23 09:12:53.360470192 +0200
> +@@ -19,11 +19,11 @@
> + EXTRA_DIST +=3D man/help2man man/dummy-man
> +
> + ## Graceful degradation for systems lacking perl.
> +-if HAVE_PERL
> +-run_help2man =3D $(PERL) -- $(srcdir)/man/help2man
> +-else
> ++#if HAVE_PERL
> ++#run_help2man =3D $(PERL) -- $(srcdir)/man/help2man
> ++#else
> + run_help2man =3D $(SHELL) $(srcdir)/man/dummy-man
> +-endif
> ++#endif
> +
> + man1_MANS =3D @man1_MANS@
> + EXTRA_DIST +=3D $(man1_MANS:.1=3D.x)
> diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-=
lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.21/remove-usr-l=
ocal-lib-from-m4.patch
> similarity index 100%
> rename from meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-l=
ib-from-m4.patch
> rename to meta/recipes-core/coreutils/coreutils-8.21/remove-usr-local-lib=
-from-m4.patch
> diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes=
-core/coreutils/coreutils_8.21.bb
> similarity index 91%
> rename from meta/recipes-core/coreutils/coreutils_8.14.bb
> rename to meta/recipes-core/coreutils/coreutils_8.21.bb
> index b82bbe4..e789f59 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.14.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.21.bb
> @@ -6,8 +6,8 @@ HOMEPAGE =3D "http://www.gnu.org/software/coreutils/"
>  BUGTRACKER =3D "http://debbugs.gnu.org/coreutils"
>  LICENSE =3D "GPLv3+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504\
> -                    file://src/ls.c;beginline=3D5;endline=3D16;md5=3D2e9=
acd8818fe6db4c2981d20ca632553"
> -PR =3D "r5"
> +                    file://src/ls.c;beginline=3D5;endline=3D16;md5=3D38b=
79785ca88537b75871782a2a3c6b8"
> +PR =3D "r0"
>  DEPENDS =3D "gmp libcap"
>  DEPENDS_class-native =3D ""
> =20
> @@ -15,11 +15,12 @@ inherit autotools gettext
> =20
>  SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>             file://remove-usr-local-lib-from-m4.patch \
> -           file://remove-gets.patch \
>             file://coreutils-build-with-acl.patch \
> +           file://dummy_help2man.patch \
>            "
> -SRC_URI[md5sum] =3D "bcb135ce553493a45aba01b39eb3920a"
> -SRC_URI[sha256sum] =3D "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb1=
16cf82b65d18b02d"
> +
> +SRC_URI[md5sum] =3D "065ba41828644eca5dd8163446de5d64"
> +SRC_URI[sha256sum] =3D "adaa44bdab3fa5eb352e80d8a31fdbf957b78653d0c2cd30=
d63e161444288e18"
> =20
>  EXTRA_OECONF =3D "--disable-acl"
>  EXTRA_OECONF_class-native =3D "--disable-acl --without-gmp"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lHGcFxmlz1yfXmOs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFq3fAACgkQN1Ujt2V2gByuYwCaAiAbou/9L1MCwB9S2x38ociG
JHkAnAsyvewkJNnWme6LLvPeNow3mSx2
=xHu+
-----END PGP SIGNATURE-----

--lHGcFxmlz1yfXmOs--
