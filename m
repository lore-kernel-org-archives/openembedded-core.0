Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1U9evW-0002Z5-AS; Sun, 24 Feb 2013 17:59:50 +0100
Received: by mail-da0-f54.google.com with SMTP id p1so521545dad.41
	for <multiple recipients>; Sun, 24 Feb 2013 08:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=CPrMHb6KAqPCkZyLbaM47FBTZdDW//aDkhljiBfUI/M=;
	b=WK4VvSz36vwOtNFtbDpAVg3Sq7ImmWLQ1abxLtg7FeW3EQfp6SNEODR5/GxlZDAy/t
	Ngo6KAmud2k8Qvh1xSOaFtbCiioQnffw7Lgxk+0eBwL8k4IyQ2lF5pAJVnqSjo00zZxF
	u5BBX01QEtBNeX5XbYZ9nvoSdVFynN+iNVNvpNEhklmwbomFBaf9wTizmjwmz86p+AqM
	ayUkDWKTSkpAKs2702PE+whq06zjwtIKmtrgtkziN0ewYuqfdPJdtFEwnrbsjKdBF5fD
	oswzdFSxS1Q6WEzsA9Iqc0zSOdI5cYtGVhxw+D3KN7CmX9Pg9MvPzfWJygfiU1X5fOmC
	pdQg==
X-Received: by 10.68.125.169 with SMTP id mr9mr13579265pbb.74.1361724212789;
	Sun, 24 Feb 2013 08:43:32 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kb3sm9689873pbc.21.2013.02.24.08.43.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 24 Feb 2013 08:43:31 -0800 (PST)
Date: Sun, 24 Feb 2013 17:43:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Constantin Musca <constantinx.musca@intel.com>
Message-ID: <20130224164338.GC3300@jama>
References: <20130222140918.682E65029C@opal>
MIME-Version: 1.0
In-Reply-To: <20130222140918.682E65029C@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Constantin Musca : augeas: upgrade to 1.0.0
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
X-List-Received-Date: Sun, 24 Feb 2013 16:59:51 -0000
X-Groupsio-MsgNum: 35763
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WvN+AgSXEIYfFXlk"
Content-Disposition: inline

--WvN+AgSXEIYfFXlk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 22, 2013 at 02:09:18PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: a711a8617c39b06c9a494d0ceae9f96f65b024f9
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Da711a8617c39b06c9a494d0ceae9f96f65b024f9
>=20
> Author: Constantin Musca <constantinx.musca@intel.com>
> Date:   Mon Feb 18 14:05:09 2013 +0200
>=20
> augeas: upgrade to 1.0.0

Fails to fetch here:
WARNING: Failed to fetch URL
http://augeas.net/download/augeas-1.0.0.tar.gz, attempting MIRRORS if
available
ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
http://augeas.net/download/augeas-1.0.0.tar.gz:
2013-02-23 18:34:48 ERROR 404: Not Found.

http://download.augeas.net/augeas-1.0.0.tar.gz
Seems like correct URL now.

>=20
> 0001-Add-missing-argument-to-escape.patch: removed
>     - included in the new version
>=20
> remove-gets.patch: not needed anymore
>=20
> add-missing-argz-conditional.patch: added
>     - the Makefiles assume that the argz conditional
> is present in configure.ac
>=20
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-extended/augeas/augeas.inc            |    2 +-
>  .../0001-Add-missing-argument-to-escape.patch      |   29 --------------=
------
>  .../augeas/add-missing-argz-conditional.patch      |   20 +++++++++++++
>  .../augeas/augeas/remove-gets.patch                |   20 -------------
>  meta/recipes-extended/augeas/augeas_0.10.0.bb      |    8 -----
>  meta/recipes-extended/augeas/augeas_1.0.0.bb       |    6 ++++
>  6 files changed, 27 insertions(+), 58 deletions(-)
>=20
> diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-exten=
ded/augeas/augeas.inc
> index 479fb97..a0aa9dd 100644
> --- a/meta/recipes-extended/augeas/augeas.inc
> +++ b/meta/recipes-extended/augeas/augeas.inc
> @@ -6,7 +6,7 @@ LICENSE =3D "LGPLv2.1+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbb461211a33b134d42ed5ee802b3=
7ff"
> =20
>  SRC_URI =3D "http://augeas.net/download/${BP}.tar.gz \
> -           file://0001-Add-missing-argument-to-escape.patch \
> +           file://add-missing-argz-conditional.patch \
>            "
> =20
>  DEPENDS =3D "readline libxml2"
> diff --git a/meta/recipes-extended/augeas/augeas/0001-Add-missing-argumen=
t-to-escape.patch b/meta/recipes-extended/augeas/augeas/0001-Add-missing-ar=
gument-to-escape.patch
> deleted file mode 100644
> index 3d0d0e3..0000000
> --- a/meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-es=
cape.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -From 021ea39f8e400225e2d01b4c62eb9d56404f2ecd Mon Sep 17 00:00:00 2001
> -From: Michael Chapman <mike@very.puzzling.org>
> -Date: Fri, 16 Dec 2011 21:30:07 +1100
> -Subject: [PATCH] Add missing argument to escape()
> -
> -Fixes ticket #242.
> ----
> - src/regexp.c |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> -diff --git a/src/regexp.c b/src/regexp.c
> -index cf0ea5d..811087d 100644
> ---- a/src/regexp.c
> -+++ b/src/regexp.c
> -@@ -50,7 +50,7 @@ char *regexp_escape(const struct regexp *r) {
> -     ret =3D fa_restrict_alphabet(r->pattern->str, strlen(r->pattern->st=
r),
> -                                &nre, &nre_len, 2, 1);
> -     if (ret =3D=3D 0) {
> --        pat =3D escape(nre, nre_len);
> -+        pat =3D escape(nre, nre_len, RX_ESCAPES);
> -         free(nre);
> -     }
> - #endif
> ---=20
> -1.7.5.4
> -
> diff --git a/meta/recipes-extended/augeas/augeas/add-missing-argz-conditi=
onal.patch b/meta/recipes-extended/augeas/augeas/add-missing-argz-condition=
al.patch
> new file mode 100644
> index 0000000..abbdbaa
> --- /dev/null
> +++ b/meta/recipes-extended/augeas/augeas/add-missing-argz-conditional.pa=
tch
> @@ -0,0 +1,20 @@
> +Add missing GL_GENERATE_ARGZ_H conditional
> +
> +- GL_GENERATE_ARGZ_H is used in gnulib/lib/Makefile.am
> +
> +Upstream-Status: Pending
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +
> +Index: augeas-1.0.0/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- augeas-1.0.0.orig/configure.ac
> ++++ augeas-1.0.0/configure.ac
> +@@ -55,6 +55,8 @@ AC_ARG_WITH([failmalloc],
> +=20
> + AM_CONDITIONAL([WITH_FAILMALLOC], [test x$with_failmalloc !=3D xno])
> +=20
> ++AM_CONDITIONAL([GL_GENERATE_ARGZ_H], [test -n "$ARGZ_H"])
> ++
> + dnl --enable-debug=3D(yes|no)
> + AC_ARG_ENABLE([debug],
> +               [AC_HELP_STRING([--enable-debug=3Dno/yes],
> diff --git a/meta/recipes-extended/augeas/augeas/remove-gets.patch b/meta=
/recipes-extended/augeas/augeas/remove-gets.patch
> deleted file mode 100644
> index bd6e92c..0000000
> --- a/meta/recipes-extended/augeas/augeas/remove-gets.patch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -eglibc 2.16 has remove gets so check for it to be there before using it
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -Index: augeas-0.10.0/gnulib/lib/stdio.in.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- augeas-0.10.0.orig/gnulib/lib/stdio.in.h	2011-03-03 17:07:59.0000000=
00 -0800
> -+++ augeas-0.10.0/gnulib/lib/stdio.in.h	2012-07-03 19:46:42.871894833 -0=
700
> -@@ -161,8 +161,10 @@
> - /* It is very rare that the developer ever has full control of stdin,
> -    so any use of gets warrants an unconditional warning.  Assume it is
> -    always declared, since it is required by C89.  */
> -+#if defined gets
> - #undef gets
> - _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
> -+#endif
> -=20
> - #if @GNULIB_FOPEN@
> - # if @REPLACE_FOPEN@
> diff --git a/meta/recipes-extended/augeas/augeas_0.10.0.bb b/meta/recipes=
-extended/augeas/augeas_0.10.0.bb
> deleted file mode 100644
> index 0840428..0000000
> --- a/meta/recipes-extended/augeas/augeas_0.10.0.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require augeas.inc
> -
> -SRC_URI +=3D "file://remove-gets.patch \
> -           "
> -PR =3D "r3"
> -
> -SRC_URI[md5sum] =3D "fe1834e90a066c3208ac0214622c7352"
> -SRC_URI[sha256sum] =3D "ec111af06186216930176ebe5ecccdf7bf528528aee9acde=
1d5d70088484afca"
> diff --git a/meta/recipes-extended/augeas/augeas_1.0.0.bb b/meta/recipes-=
extended/augeas/augeas_1.0.0.bb
> new file mode 100644
> index 0000000..2f7061a
> --- /dev/null
> +++ b/meta/recipes-extended/augeas/augeas_1.0.0.bb
> @@ -0,0 +1,6 @@
> +require augeas.inc
> +
> +PR =3D "r0"
> +
> +SRC_URI[md5sum] =3D "82131019432ecf8102e1491610ad2dd1"
> +SRC_URI[sha256sum] =3D "31bf757c5b8197765946b3805f3793c32b03cd92a7a77ec9=
5d37e71a1f131912"
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WvN+AgSXEIYfFXlk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEqQzoACgkQN1Ujt2V2gByj8QCeKMIEtSCnH+/dIebuR+1OQYvk
VOUAoIwoIZMfIjBOKimj+5MKuEHVPoqM
=TLID
-----END PGP SIGNATURE-----

--WvN+AgSXEIYfFXlk--
