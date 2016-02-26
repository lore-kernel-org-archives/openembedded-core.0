Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 80117731DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 08:01:48 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id x65so48130263pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 00:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=JXTI9U+tRvf2d83Vc2tE1YHI3EmqPujldN2hhG74Ak4=;
	b=cplD9pP7wr1oLUB8gpHYgwTHvzAzBr+VM5jUQMqgh2fodQokoH/dyeaAimacsXpNZp
	V0ENxQUOTYkcXYccSYgoGM1B+2g8eETf6yz9l6N+woI/eyPVoQpYt3Y0DxXzGcke/9GQ
	lDI/wByGaXJcAeRKoaI5rFa193cHvwk8rdPPsaZSltUXyDmcz8W3dNw5BeVCNcAjJuFy
	aMMF2SWDuBFnkAxYb6ae7UUPF5v4JmPDlXoNWZi4jXCCOKzooKhmO2CBNi98DOUboDLl
	k0X63lCIn708P/AQEZnnJUDwchbGmE64OKTCNDiy21BtZFYcLB64+bJf9pxHmPeOAlgs
	XAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=JXTI9U+tRvf2d83Vc2tE1YHI3EmqPujldN2hhG74Ak4=;
	b=F6k/+aKh6LXzpV6gxO4udHADc/T3x+vMvvAPriRt2CNN2sqAUA+k06a2x4thQNn15D
	bAT7kquyXhWykBL1Jc/Az939MQ/tFjq+y0Py05pwHvvrn9fIMMo+cHEM3HHR3OUEUkxr
	r9PLJdz++9AUCcbe1wCrjuLkpReU0s6nvZE7hF5Z23rCI4zrxHkglfaVoABySaUhhF+Z
	F0Xt7ZEgHweHjuajZEDsXD35Z5iSjS9jKHmZZHHm1uRjX9ckfM5XPiwlRYjGgDWV4xxu
	TYk3flmXuHhE8GtlSx/8155/qFinXkXK5aTouLsegR69C16Bkaj+5zbtWajZPj8iGh6z
	EJ0A==
X-Gm-Message-State: AD7BkJIz42U/DUiFmBy7wyYTUeZgA0fngLA5WwdzTbJ7COzMqkkzzx1pLNTxCFO5tCXw9g==
X-Received: by 10.98.18.207 with SMTP id 76mr220810pfs.53.1456473709836;
	Fri, 26 Feb 2016 00:01:49 -0800 (PST)
Received: from ?IPv6:2601:646:8800:5a9a:4537:747c:ca81:76b7?
	([2601:646:8800:5a9a:4537:747c:ca81:76b7])
	by smtp.gmail.com with ESMTPSA id
	ud10sm17187783pab.27.2016.02.26.00.01.48
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Feb 2016 00:01:49 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1456396226-14410-1-git-send-email-maxin.john@intel.com>
Date: Fri, 26 Feb 2016 00:01:48 -0800
Message-Id: <48F26C84-39D2-48FE-9891-DEDA70775368@gmail.com>
References: <1456396226-14410-1-git-send-email-maxin.john@intel.com>
To: "Maxin B. John" <maxin.john@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] uclibc support for rng-tools
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
X-List-Received-Date: Fri, 26 Feb 2016 08:01:49 -0000
X-Groupsio-MsgNum: 78763
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7FD0EE39-230B-4E3E-A90D-8D2CEA73776D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7FD0EE39-230B-4E3E-A90D-8D2CEA73776D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

its better fix

> On Feb 25, 2016, at 2:30 AM, Maxin B. John <maxin.john@intel.com> =
wrote:
>=20
> Uclibc has its own argp implemented as libuargp. So, we add a new
> option --enable-uclibc to select it.
>=20
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
> .../rng-tools/uclibc-libuargp-configure.patch      | 63 =
++++++++++++++++++++++
> meta/recipes-support/rng-tools/rng-tools_5.bb      |  4 +-
> 2 files changed, 66 insertions(+), 1 deletion(-)
> create mode 100644 =
meta/recipes-support/rng-tools/rng-tools/uclibc-libuargp-configure.patch
>=20
> diff --git =
a/meta/recipes-support/rng-tools/rng-tools/uclibc-libuargp-configure.patch=
 =
b/meta/recipes-support/rng-tools/rng-tools/uclibc-libuargp-configure.patch=

> new file mode 100644
> index 0000000..e691315
> --- /dev/null
> +++ =
b/meta/recipes-support/rng-tools/rng-tools/uclibc-libuargp-configure.patch=

> @@ -0,0 +1,63 @@
> +In case of uclibc, use libuargp
> +
> +If we use uclibc for system libraries, select libuargp
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Maxin B. John <maxin.john@intel.com>
> +---
> +diff -Naur rng-tools-5-orig/configure.ac rng-tools-5/configure.ac
> +--- rng-tools-5-orig/configure.ac	2016-02-24 18:11:24.023690235 =
+0200
> ++++ rng-tools-5/configure.ac	2016-02-24 18:14:49.763118138 +0200
> +@@ -39,6 +39,13 @@
> + 	[with_libargp=3Dcheck]
> + )
> +
> ++AC_ARG_ENABLE([uclibc],
> ++    AS_HELP_STRING([--enable-uclibc], [Use uclibc for system =
libraries]),
> ++        use_uclibc=3Dyes, use_uclibc=3Dno)
> ++AM_CONDITIONAL(USE_UCLIBC, test "x$use_uclibc" =3D "xyes")
> ++AS_IF([test "x$use_uclibc" =3D "xyes"], [AC_DEFINE(USE_UCLIBC)])
> ++AH_TEMPLATE([USE_UCLIBC], [Defined if uclibc libraries are used.])
> ++
> + dnl Make sure anyone changing configure.ac/Makefile.am has a clue
> + AM_MAINTAINER_MODE
> +
> +@@ -101,7 +108,7 @@
> + 			[need_libargp=3Dno],
> + 			[need_libargp=3Dyes
> + 			 if test "x$with_libargp" =3D "xno"; then
> +-				AC_MSG_FAILURE([libargp disabled and =
libc does not have argp])
> ++				AC_MSG_WARN([libargp disabled and libc =
does not have argp])
> + 			 fi]
> + 		)
> + 	],
> +@@ -110,7 +117,7 @@
> +
> + dnl Check for libargp
> + AS_IF(
> +-	[test "x$need_libargp" =3D "xyes"],
> ++	[test "x$need_libargp" =3D "xyes" -a "x$use_uclibc" =3D "xno"],
> + 	[
> + 		AC_CHECK_LIB(
> + 			[argp],
> +@@ -120,6 +127,19 @@
> + 		)
> + 	]
> + )
> ++
> ++dnl Check for libuargp
> ++AS_IF(
> ++	[test "x$use_uclibc" =3D "xyes"],
> ++	[
> ++		AC_CHECK_LIB(
> ++			[uargp],
> ++			[argp_parse],
> ++			[LIBS=3D"$LIBS -luargp"],
> ++			[AC_MSG_FAILURE([libuargp not found])]
> ++		)
> ++	]
> ++)
> +
> + dnl -----------------
> + dnl Configure options
> diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb =
b/meta/recipes-support/rng-tools/rng-tools_5.bb
> index bc67990..53d2d61 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_5.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
> @@ -6,6 +6,7 @@ SRC_URI =3D =
"http://heanet.dl.sourceforge.net/sourceforge/gkernel/${BP}.tar.gz \
>            file://0001-If-the-libc-is-lacking-argp-use-libargp.patch \
>            =
file://0002-Add-argument-to-control-the-libargp-dependency.patch \
>            file://underquote.patch \
> +           file://uclibc-libuargp-configure.patch \

is there tab and space mix here ?

>            file://init \
>            file://default"
>=20
> @@ -23,8 +24,9 @@ inherit autotools update-rc.d
>=20
> PACKAGECONFIG =3D "libgcrypt"
> PACKAGECONFIG_libc-musl =3D "libargp"
> -PACKAGECONFIG_libc-uclibc =3D "libargp"
> +PACKAGECONFIG_libc-uclibc =3D "libuargp"
> PACKAGECONFIG[libargp] =3D =
"--with-libargp,--without-libargp,argp-standalone,"
> +PACKAGECONFIG[libuargp] =3D "--enable-uclibc,,,"
> PACKAGECONFIG[libgcrypt] =3D =
"--with-libgcrypt,--without-libgcrypt,libgcrypt,"
>=20
> do_install_append() {
> --
> 2.4.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_7FD0EE39-230B-4E3E-A90D-8D2CEA73776D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbQBmwACgkQuwUzVZGdMxSOUwCgi6YguW0L/UNIfIgsgiG7JBuf
MQ4An0dKTB+agaUJwOkPCghCGcrzkTEh
=hyIl
-----END PGP SIGNATURE-----

--Apple-Mail=_7FD0EE39-230B-4E3E-A90D-8D2CEA73776D--
