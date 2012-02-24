Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S10df-0000VM-Eb
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 20:17:07 +0100
Received: by eaal10 with SMTP id l10so1280130eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 11:08:44 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.131.145 as permitted sender) client-ip=10.14.131.145; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.131.145 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.131.145])
	by 10.14.131.145 with SMTP id m17mr2198843eei.115.1330110524731
	(num_hops = 1); Fri, 24 Feb 2012 11:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+/O15or/4T4njmDV590Z4ZoJPUfHFjzP5UoMDd9o/kw=;
	b=E8uJahxR7OAG3H4b6bsA97V/tNlKRMXkGZd+0Pnr3XN/wxUz7pijBfENVwNlF4wl1s
	JAktJvNAq44zyy0lYW5qNOjzQw3AAdPOG2e7gOQ6LEx/tG4ewncuPbznjraur/km/mYi
	IVtSb+k0gGkXdlizeUTkSQZdxTlb0rKv3GvE0=
Received: by 10.14.131.145 with SMTP id m17mr1648907eei.115.1330110524571;
	Fri, 24 Feb 2012 11:08:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm21327053eem.0.2012.02.24.11.08.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 11:08:44 -0800 (PST)
Date: Fri, 24 Feb 2012 20:08:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120224190842.GL3769@jama.jama.net>
References: <cover.1330109787.git.sgw@linux.intel.com>
	<e8916ebbe105cd17ac91f389787dabddf78028e7.1330109787.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <e8916ebbe105cd17ac91f389787dabddf78028e7.1330109787.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] gnupg: Update checksum, fix configure and compliation issues
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
X-List-Received-Date: Fri, 24 Feb 2012 19:17:07 -0000
X-Groupsio-MsgNum: 17942
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pfJPkqu8nAxkAh8+"
Content-Disposition: inline

--pfJPkqu8nAxkAh8+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 10:59:20AM -0800, Saul Wold wrote:
> This recipe was added, but did not have the correct
> checksum information for the LIC_FILES_CHKSUM or the
> SRC_URI.  Also disable Documetnation for now due to
> older autotools issue.

BTW: those checksums matches gnupg_1.4.10 which is available in
oe-classic and there is also similar patch (like mpfr from today)
for thumb issues in gnupg/mpi/longlong.h.

Maybe it would be worth updating from there if there isn't reason to
hold on 1.4.7.

Cheers,

>=20
> [YOCTO #1966]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../gnupg/gnupg-1.4.7/configure.patch              |   17 ++++++++++++++=
+++
>  meta/recipes-support/gnupg/gnupg_1.4.7.bb          |   17 +++++++++-----=
---
>  2 files changed, 26 insertions(+), 8 deletions(-)
>  create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/configure.patch
>=20
> diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/configure.patch b/met=
a/recipes-support/gnupg/gnupg-1.4.7/configure.patch
> new file mode 100644
> index 0000000..e005ac6
> --- /dev/null
> +++ b/meta/recipes-support/gnupg/gnupg-1.4.7/configure.patch
> @@ -0,0 +1,17 @@
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +
> +Index: gnupg-1.4.7/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnupg-1.4.7.orig/configure.ac
> ++++ gnupg-1.4.7/configure.ac
> +@@ -827,7 +827,6 @@ else
> +   AC_SUBST(USE_NLS)
> +   AC_SUBST(USE_INCLUDED_LIBINTL)
> +   AC_SUBST(BUILD_INCLUDED_LIBINTL)
> +-  AM_PO_SUBDIRS
> + fi
> +=20
> + if test "$try_extensions" =3D yes || test x"$card_support" =3D xyes ; t=
hen
> diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-sup=
port/gnupg/gnupg_1.4.7.bb
> index daea5aa..f033659 100644
> --- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
> +++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
> @@ -5,18 +5,18 @@ SECTION =3D "console/utils"
> =20
>  LICENSE =3D "GPLv2"
> =20
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a"
> =20
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  SRC_URI =3D "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
>             file://long-long-thumb.patch \
> -           file://mips_gcc4.4.patch"
> +           file://configure.patch \
> +           file://mips_gcc4.4.patch \
> +           file://curl_typeof_fix_backport.patch"
> =20
> -SRC_URI[md5sum] =3D "dcf7ed712997888d616e029637bfc303"
> -SRC_URI[sha256sum] =3D "a2907f4432d67894e425e48ae85785dd60ecb01658c9682b=
cd96f5e91043bb38"
> -
> -S =3D "${WORKDIR}/gnupg-${PV}"
> +SRC_URI[md5sum] =3D "b06a141cca5cd1a55bbdd25ab833303c"
> +SRC_URI[sha256sum] =3D "69d18b7d193f62ca27ed4febcb4c9044aa0c95305d3258fe=
902e2fae5fc6468d"
> =20
>  inherit autotools gettext
> =20
> @@ -73,7 +73,8 @@ EXTRA_OECONF =3D "--disable-ldap \
>  		--with-bzip2=3D${STAGING_LIBDIR}/.. \
>  		--disable-selinux-support \
>                  --with-readline=3D${STAGING_LIBDIR}/.. \
> -                ac_cv_sys_symbol_underscore=3Dyes"
> +                ac_cv_sys_symbol_underscore=3Dno \
> +		"
> =20
>  do_install () {
>  	autotools_do_install
> --=20
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pfJPkqu8nAxkAh8+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9H4DoACgkQN1Ujt2V2gBwQ7wCgnCKIKOGguCCK8dp2Brh7nt4l
mdYAnRB3jHuhdVfAfDRPB5at6ELka3f3
=dIfF
-----END PGP SIGNATURE-----

--pfJPkqu8nAxkAh8+--
