Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7A5827FC32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 09:00:42 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t14so6272016wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 01:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=cFQ6ImXIU4Xk36Kap/yE3/VT9arS/TekvMErNRa4X/Q=;
	b=eh3zeNKwPv4og4UEkWTZnAqTrojON8gOi5xjFtmIMAmaSWk+LhxUHE0gRisKiplsQl
	ueKET/cr2k2dPqJxZfEfVmpKzPVq7Ugszi6MQ3x9RoU6pBAKEYkWgwnHEwuTzh4WhrRV
	8kftbCpR8edi0AmeLbZ5gUbG7pz7enYUBvg7rDxwECHIXUEgLa9TyF0gDxGkcWfWmLO1
	MK6gKDuqP9ppJ/fdYndrqKzgwbmhVKggirvQfSuSUY3o+HJnQHPeZVtjbhJccPjVbKIB
	OE7GIkjKl5P1b6nt3JXoU/fFunMYlhAGbY6Hz7o6xmw1XWWx9FArCE2yRYz6E4urNZGo
	fPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=cFQ6ImXIU4Xk36Kap/yE3/VT9arS/TekvMErNRa4X/Q=;
	b=LQcEcto6qHg8cHaKhp3fN5gRPuyVE7flbb/9woFAhNeehwSsdyj6vn1/el4ley8RIL
	4Xj1o1Q7/BMpjEsD2t2W0S4NCSLfyZDVegUMDCd7i2VzisILpN7nmfOV/6u6X0s4DKkP
	vqzumGapC7CN09PlAn2trLC0igplmvo1MJfJh7YHwcDQxWJKd0jJV1k7oieFWi8IbYTj
	kJKvoQc/pb9N4oTanFHt5oL94qLfa2e2IrXMK23bmpMbaTL9CffvaeLtKQYup2gCb3uj
	oyPdFgiUt0JLZBrVQK1dhOY0nLDPBVlt9qRFwR1rwaqWsKT4155PqGi9UIwBDa1OlfVC
	I64w==
X-Gm-Message-State: APjAAAUvd83JMF7olE5UOCOgwNcIfukFVK4khSrY+dtkJYFuzzNsvf5y
	kPejtHguFScbLtvy/JY8KJ4=
X-Google-Smtp-Source: APXvYqxBOAKDNJ/zACjdIs4RL8j+SrTPkv7/GvBRiNm4PRGqNFJaQ3htDDkrCnmOK5aKK8CHfxq10A==
X-Received: by 2002:a05:600c:cd:: with SMTP id
	u13mr1794301wmm.24.1579683643093; 
	Wed, 22 Jan 2020 01:00:43 -0800 (PST)
Received: from ernie.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112]) by smtp.gmail.com with ESMTPSA id
	c195sm3379443wmd.45.2020.01.22.01.00.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jan 2020 01:00:42 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <E48325FE-F892-4ABC-A44E-DE63582A9658@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Date: Wed, 22 Jan 2020 10:00:40 +0100
In-Reply-To: <CA+chaQeZg=ENRH4AbF1h5hkW=YBxaX-d_MHTLnYY4oGo2PJ7hw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
References: <20200121164733.13892-1-sno@netbsd.org>
	<CA+chaQeZg=ENRH4AbF1h5hkW=YBxaX-d_MHTLnYY4oGo2PJ7hw@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] make: 4.2.1 -> 4.3
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
X-List-Received-Date: Wed, 22 Jan 2020 09:00:42 -0000
X-Groupsio-MsgNum: 134000
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B7F5575D-0A18-4FE7-AEAC-3721DD53E068";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_B7F5575D-0A18-4FE7-AEAC-3721DD53E068
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 21.01.2020 um 17:59 schrieb Martin Jansa <martin.jansa@gmail.com>:
>=20
> There are also some backwards incompatible changes introduced in this =
release.
>=20
> Link to whole =
announcement:https://lists.gnu.org/archive/html/bug-make/2020-01/msg00057.=
html

Do you want them included in commit message?
AFAIK hostbuild is used anyway - so this affects SDK's and I got reports =
from
SDK users that the kernel build is not running parallel.

> On Tue, Jan 21, 2020 at 5:47 PM Jens Rehsack <sno@netbsd.org> wrote:
> 1) Remove upstream provided patches =
0001-glob-Do-not-assume-glibc-glob-internals.patch
>    and 0002-glob-Do-not-assume-glibc-glob-internals.patch.
>=20
> 2) License has been changed to GPLv3 only
>=20
> 3) Important bug-fix is
>    * https://lists.gnu.org/archive/html/bug-make/2018-09/msg00006.html
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/recipes-devtools/make/make.inc           |  4 +-
>  ...b-Do-not-assume-glibc-glob-internals.patch | 70 =
-------------------
>  ...b-Do-not-assume-glibc-glob-internals.patch | 38 ----------
>  meta/recipes-devtools/make/make_4.2.1.bb      | 12 ----
>  meta/recipes-devtools/make/make_4.3.bb        | 10 +++
>  5 files changed, 11 insertions(+), 123 deletions(-)
>  delete mode 100644 =
meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-interna=
ls.patch
>  delete mode 100644 =
meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-interna=
ls.patch
>  delete mode 100644 meta/recipes-devtools/make/make_4.2.1.bb
>  create mode 100644 meta/recipes-devtools/make/make_4.3.bb
>=20
> diff --git a/meta/recipes-devtools/make/make.inc =
b/meta/recipes-devtools/make/make.inc
> index b8905bc6d3..4142cf23d3 100644
> --- a/meta/recipes-devtools/make/make.inc
> +++ b/meta/recipes-devtools/make/make.inc
> @@ -5,9 +5,7 @@ called the makefile, which lists each of the =
non-source files and how to compute
>  HOMEPAGE =3D "http://www.gnu.org/software/make/"
>  SECTION =3D "devel"
>=20
> -SRC_URI =3D "${GNU_MIRROR}/make/make-${PV}.tar.bz2 \
> -           file://0001-glob-Do-not-assume-glibc-glob-internals.patch =
\
> -           file://0002-glob-Do-not-assume-glibc-glob-internals.patch =
\
> +SRC_URI =3D "${GNU_MIRROR}/make/make-${PV}.tar.lz \
>             "
>=20
>  inherit autotools gettext pkgconfig texinfo
> diff --git =
a/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-inter=
nals.patch =
b/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-inter=
nals.patch
> deleted file mode 100644
> index 2b6e4d40c3..0000000000
> --- =
a/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-inter=
nals.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -=46rom c90a7dda6c572f79b8e78da44b6ebf8704edef65 Mon Sep 17 00:00:00 =
2001
> -From: Paul Eggert <eggert@cs.ucla.edu>
> -Date: Sun, 24 Sep 2017 09:12:58 -0400
> -Subject: [PATCH 1/2] glob: Do not assume glibc glob internals.
> -
> -It has been proposed that glibc glob start using gl_lstat,
> -which the API allows it to do.  GNU 'make' should not get in
> -the way of this.  See:
> -https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html
> -
> -* dir.c (local_lstat): New function, like local_stat.
> -(dir_setup_glob): Use it to initialize gl_lstat too, as the API
> -requires.
> ----
> -Upstream-Status: Backport
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> - dir.c | 29 +++++++++++++++++++++++++++--
> - 1 file changed, 27 insertions(+), 2 deletions(-)
> -
> -diff --git a/dir.c b/dir.c
> -index f34bbf5..12eef30 100644
> ---- a/dir.c
> -+++ b/dir.c
> -@@ -1299,15 +1299,40 @@ local_stat (const char *path, struct stat =
*buf)
> - }
> - #endif
> -
> -+/* Similarly for lstat.  */
> -+#if !defined(lstat) && !defined(WINDOWS32) || defined(VMS)
> -+# ifndef VMS
> -+#  ifndef HAVE_SYS_STAT_H
> -+int lstat (const char *path, struct stat *sbuf);
> -+#  endif
> -+# else
> -+    /* We are done with the fake lstat.  Go back to the real lstat =
*/
> -+#   ifdef lstat
> -+#     undef lstat
> -+#   endif
> -+# endif
> -+# define local_lstat lstat
> -+#elif defined(WINDOWS32)
> -+/* Windows doesn't support lstat().  */
> -+# define local_lstat local_stat
> -+#else
> -+static int
> -+local_lstat (const char *path, struct stat *buf)
> -+{
> -+  int e;
> -+  EINTRLOOP (e, lstat (path, buf));
> -+  return e;
> -+}
> -+#endif
> -+
> - void
> - dir_setup_glob (glob_t *gl)
> - {
> -   gl->gl_opendir =3D open_dirstream;
> -   gl->gl_readdir =3D read_dirstream;
> -   gl->gl_closedir =3D free;
> -+  gl->gl_lstat =3D local_lstat;
> -   gl->gl_stat =3D local_stat;
> --  /* We don't bother setting gl_lstat, since glob never calls it.
> --     The slot is only there for compatibility with 4.4 BSD.  */
> - }
> -
> - void
> ---
> -2.16.1
> -
> diff --git =
a/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-inter=
nals.patch =
b/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-inter=
nals.patch
> deleted file mode 100644
> index d49acd9f6e..0000000000
> --- =
a/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-inter=
nals.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -=46rom 9858702dbd1e137262c06765919937660879f63c Mon Sep 17 00:00:00 =
2001
> -From: Paul Eggert <eggert@cs.ucla.edu>
> -Date: Sun, 24 Sep 2017 09:12:58 -0400
> -Subject: [PATCH 2/2] glob: Do not assume glibc glob internals.
> -
> -It has been proposed that glibc glob start using gl_lstat,
> -which the API allows it to do.  GNU 'make' should not get in
> -the way of this.  See:
> -https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html
> -
> -* dir.c (local_lstat): New function, like local_stat.
> -(dir_setup_glob): Use it to initialize gl_lstat too, as the API
> -requires.
> ----
> -Upstream-Status: Backport
> -
> - configure.ac | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 64ec870..e87901c 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -399,10 +399,9 @@ AC_CACHE_CHECK([if system libc has GNU glob], =
[make_cv_sys_gnu_glob],
> - #include <glob.h>
> - #include <fnmatch.h>
> -
> --#define GLOB_INTERFACE_VERSION 1
> - #if !defined _LIBC && defined __GNU_LIBRARY__ && __GNU_LIBRARY__ > 1
> - # include <gnu-versions.h>
> --# if _GNU_GLOB_INTERFACE_VERSION =3D=3D GLOB_INTERFACE_VERSION
> -+if _GNU_GLOB_INTERFACE_VERSION =3D=3D 1 || =
_GNU_GLOB_INTERFACE_VERSION =3D=3D 2
> -    gnu glob
> - # endif
> - #endif],
> ---
> -2.16.1
> -
> diff --git a/meta/recipes-devtools/make/make_4.2.1.bb =
b/meta/recipes-devtools/make/make_4.2.1.bb
> deleted file mode 100644
> index c6e6a0cd58..0000000000
> --- a/meta/recipes-devtools/make/make_4.2.1.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -LICENSE =3D "GPLv3 & LGPLv2"
> -LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \
> -                    =
file://tests/COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \
> -                    =
file://glob/COPYING.LIB;md5=3D4a770b67e6be0f60da244beb2de0fce4"
> -require make.inc
> -
> -EXTRA_OECONF +=3D "--without-guile"
> -
> -SRC_URI[md5sum] =3D "15b012617e7c44c0ed482721629577ac"
> -SRC_URI[sha256sum] =3D =
"d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-devtools/make/make_4.3.bb =
b/meta/recipes-devtools/make/make_4.3.bb
> new file mode 100644
> index 0000000000..a3eb9d92f2
> --- /dev/null
> +++ b/meta/recipes-devtools/make/make_4.3.bb
> @@ -0,0 +1,10 @@
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
> +require make.inc
> +
> +EXTRA_OECONF +=3D "--without-guile"
> +
> +SRC_URI[md5sum] =3D "d5c40e7bd1e97a7404f5d3be982f479a"
> +SRC_URI[sha256sum] =3D =
"de1a441c4edf952521db30bfca80baae86a0ff1acd0a00402999344f04c45e82"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.17.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_B7F5575D-0A18-4FE7-AEAC-3721DD53E068
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl4oDzgACgkQRJmWrtzl
Cp3gxhAAoXrX6MLmnV/MhiZLdSWoB+4/J5aaGNFu/sht66OctdG3L8XCKKOt1ahf
wddWw2Gu6xQABarybFTREt0iSJrAycuxCdvcCvqOUQNclY2H14CxmDzGW5uqFbND
rJpB96mvu0etISMv7/Cr63RFBUJXdKfjOabmtkqLUVvTEKnOAes0ZJLPqus7+AtI
n+Kezyk1GGLgI/b09Ex/MqAdIkTx7xd9ULxyWCFk3vza+RijGUkkdt11/WUH7VpG
qTyR6x8XqxnFLp1rWLpT18tWovKZ4tqdp377t22M/S7ahh9rkzbjDTMKWzbkaPcw
uo1qrpFMMgycN4OC0CrdV8cXkIjefWK8aq7nEdmx7LSUVVXyP775pcGNeIHDZie+
WJlNbPx75CgT0Vos5ffwlWrCkHmCzP2PRHsP0VrNyaM43ELqJsPoqJ2NgqB8o5Sf
inUKcyjegol5gH5RW/Xvsf3HX1/EIpFqAERBOs3lImYXNuYLbl2piWkgffRFH5NB
BhfVZij8pW5TzWyPW5cBGn97T/y8aWHqFkyU4gUMO3QCWb8Ysl2bnv0x1Hxd8YQG
n3cgcLWNYAz2f1eKUi8dBbXmAFMqfF/YrI5u72EG0cH8321G5VH6OHkLsJ4Fa4YY
dWCgGsSiYHNgqquQEEH9vD2IfmBcqGQqaDErVHNZ3/oYkq+jZO0=
=HzXe
-----END PGP SIGNATURE-----

--Apple-Mail=_B7F5575D-0A18-4FE7-AEAC-3721DD53E068--
