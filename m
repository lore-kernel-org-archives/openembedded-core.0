Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id B4DE2606CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 00:03:07 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g2so90652pge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 17:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=0MGjZqt8Az3rHxyajQkp4suRK34WZF4rzalwAU1ROrc=;
	b=SiSeoIiozSAdnkTkZlwCoKwG0w/1C2OLI80SGLfDkUGz5P6mOc0EFYc/G5WSkdjOlT
	LDc0tQKXwI62olsJ7CM3oFJ0nc1I3i3X0v2OJoWIbwpFooh68VOLR6HvK96REmUoXKDA
	hG8aQc5yokUEXXb2DzIvNy/Uc+8qNzkkGxE3/CRTvZ/0HHvWP5OrmdHbcmBDFFRfanL/
	r6WZneDOAcMJMApCMWaGZk6sMTQdXMJjHfP93B3DuQHeAqHDGHbdWMwXQkCmy+ngYT2K
	aaChnDgtVPopyA9bYjrAnB4weHELcA/p087aGOMKEdB8pw1OxpsZ9/uu+aT510vtTWKP
	yXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=0MGjZqt8Az3rHxyajQkp4suRK34WZF4rzalwAU1ROrc=;
	b=Zd5SI8eMkL7lcJ4FtajLh9E0Zp5PAzACX9XiQXX6fZnPpOM6qKZbkhVQdaaEIEhz3I
	6lOd7bvPQhG1xt68jwglWbvWiIQCoiDIEx3L/psuC4C8vrWxhzcy9VUySfGA54aKLB5G
	9sNBP1uEEcNxEzO4P7oQgk9nQNJYZGPhAowX1TF5+H/9oAnrKcMhtdCJREOy9iC6xen/
	r9Qkf7CFZ0UfoYToxZkBAfesAtN20W5Ump2XGpshHKvCWXCapNKD7xtlIUEbm/7WiN6y
	ji1ALgxEqe8JHboZUlisvi3Du4+nlp6M/GPYsML0Cmspc5AkVof0rdGSc0Q+QhjdrdmF
	4RwA==
X-Gm-Message-State: AFeK/H3y00iyH6GJbNyRiROaAjT0D5CCYsyKnF9PDCd89Vsk6OEFGyjIE2T85lDb1R4cZA==
X-Received: by 10.99.213.81 with SMTP id v17mr33135979pgi.130.1490745788577;
	Tue, 28 Mar 2017 17:03:08 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:3d13:dbd2:8d6d:4405])
	by smtp.gmail.com with ESMTPSA id
	s65sm9289109pgb.64.2017.03.28.17.03.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Mar 2017 17:03:07 -0700 (PDT)
To: Serhii Popovych <spopovyc@cisco.com>,
	openembedded-core@lists.openembedded.org
References: <4713eca3e627fb1bececc59af252a0768c955d11.1490727266.git.spopovyc@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <ec839388-19b4-5daa-d6fe-b9d5c5c9c054@gmail.com>
Date: Tue, 28 Mar 2017 17:03:00 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <4713eca3e627fb1bececc59af252a0768c955d11.1490727266.git.spopovyc@cisco.com>
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [PATCH] glibc: Support building with 2.6.32 kernels on x86 / x86_64
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
X-List-Received-Date: Wed, 29 Mar 2017 00:03:07 -0000
X-Groupsio-MsgNum: 95424
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="iDTaAACLcSxUARjKEQuPKOfcb32QP5RnO"

--iDTaAACLcSxUARjKEQuPKOfcb32QP5RnO
Content-Type: multipart/mixed; boundary="DuIO9kCXMDtCjSjBXj8baDTf6f7Q9vNL4";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Serhii Popovych <spopovyc@cisco.com>,
 openembedded-core@lists.openembedded.org
Cc: XE-Linux <xe-linux-external@cisco.com>
Message-ID: <ec839388-19b4-5daa-d6fe-b9d5c5c9c054@gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Support building with 2.6.32 kernels on
 x86 / x86_64
References: <4713eca3e627fb1bececc59af252a0768c955d11.1490727266.git.spopovyc@cisco.com>
In-Reply-To: <4713eca3e627fb1bececc59af252a0768c955d11.1490727266.git.spopovyc@cisco.com>

--DuIO9kCXMDtCjSjBXj8baDTf6f7Q9vNL4
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 3/28/17 11:57 AM, Serhii Popovych wrote:
> While glibc states that 2.6.32 kernels still supported
> for x86 / x86_64 builds are failing due to out of date
> LIBC_LINUX_VERSION macro checks for such architectures.
>=20
> This macro statically defined to 3.2.0 with commit 5b4ecd3
> (Require Linux 3.2 except on x86 / x86_64, 3.2 headers everywhere.)
> and additionally checked before --enable-kernel.
>=20
> Since both --enable-kernel and LIBC_LINUX_VERSION checks
> are the same and there is no users of last one we can
> safely get rid of it enabling glibc builds with 2.6.32
> kernel headers.
>=20
> Also add --enable-kernel to glibc-initial build so that we
> build it correctly with old headers.
>=20
> Cc: XE-Linux <xe-linux-external@cisco.com>
> Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
> ---
>  meta/recipes-core/glibc/glibc-initial.inc          |   1 +
>  .../glibc/0028-Kill-LIBC_LINUX_VERSION-macro.patch | 113 +++++++++++++=
++++++++
>  meta/recipes-core/glibc/glibc_2.25.bb              |   1 +
>  3 files changed, 115 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0028-Kill-LIBC_LINUX_=
VERSION-macro.patch
>=20
> diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-c=
ore/glibc/glibc-initial.inc
> index f94603c..60b25dd 100644
> --- a/meta/recipes-core/glibc/glibc-initial.inc
> +++ b/meta/recipes-core/glibc/glibc-initial.inc
> @@ -12,6 +12,7 @@ do_configure () {
>  	find ${S} -name "configure" | xargs touch
>  	cfgscript=3D`python3 -c "import os; print(os.path.relpath('${S}', '.'=
))"`/configure
>  	$cfgscript --host=3D${TARGET_SYS} --build=3D${BUILD_SYS} \
> +		--enable-kernel=3D${OLDEST_KERNEL} \
>  		--prefix=3D/usr \
>  		--without-cvs --disable-sanity-checks \
>  		--with-headers=3D${STAGING_DIR_TARGET}${includedir} \
> diff --git a/meta/recipes-core/glibc/glibc/0028-Kill-LIBC_LINUX_VERSION=
-macro.patch b/meta/recipes-core/glibc/glibc/0028-Kill-LIBC_LINUX_VERSION=
-macro.patch
> new file mode 100644
> index 0000000..f5eaf1c
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0028-Kill-LIBC_LINUX_VERSION-macro.=
patch
> @@ -0,0 +1,113 @@
> +From 88f83e4b5a8929dac9095ed264700fcb62d5e4dd Mon Sep 17 00:00:00 2001=

> +From: Serhii Popovych <spopovyc@cisco.com>
> +Date: Fri, 17 Mar 2017 15:48:34 +0000
> +Subject: Kill LIBC_LINUX_VERSION macro
> +
> +After commit 5b4ecd3 (Require Linux 3.2 except on x86 / x86_64,
> +3.2 headers everywhere.) minimal kernel version raised from
> +2.6.32 to 3.2.0 for all architectures except x86 and x86_64
> +unless newer already used for architecture.
> +
> +However LIBC_LINUX_VERSION macro still is in effect and fails
> +configure even with --enable-kernel=3D2.6.32.
> +
> +While it is present in configure.ac it does not affect anything
> +except LINUX_VERSION_CODE check which already performed by
> +--enable-kernel.
> +

--enable-kernel is forces the minimum kernel for glibc to configure for
kernel interfaces if not set it defaults to arch specific value but it
wont check for version of linux headers during compile time. Whereas
this check is checking and errors out during build time if minimum
kernel version is not met. If you were to make the LIBC_LINUX_VERSION
have a value that matches the arch_minimum_kernel version that would be
an improvement.

As such if you want to do quick fix then lower the value of
LIBC_LINUX_VERSION to 2.6.32 when building for x86/x86_64, we can accept
such a patch with a bit less happiness.


> +Upstream-Status: Pending
> +Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
> +---
> + sysdeps/unix/sysv/linux/configure    | 39 ---------------------------=
---------
> + sysdeps/unix/sysv/linux/configure.ac | 21 -------------------
> + 2 files changed, 60 deletions(-)
> +
> +diff --git a/sysdeps/unix/sysv/linux/configure b/sysdeps/unix/sysv/lin=
ux/configure
> +index cace758..ab5fabe 100644
> +--- a/sysdeps/unix/sysv/linux/configure
> ++++ b/sysdeps/unix/sysv/linux/configure
> +@@ -6,45 +6,6 @@ if test -n "$sysheaders"; then
> +   CPPFLAGS=3D"$CPPFLAGS $SYSINCLUDES"
> + fi
> +=20
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking installed Linux ker=
nel header files" >&5
> +-$as_echo_n "checking installed Linux kernel header files... " >&6; }
> +-if ${libc_cv_linux320+:} false; then :
> +-  $as_echo_n "(cached) " >&6
> +-else
> +-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
> +-/* end confdefs.h.  */
> +-#include <linux/version.h>
> +-#if !defined LINUX_VERSION_CODE || LINUX_VERSION_CODE <  (3 *65536+ 2=
 *256+ 0) /* 3.2.0 */
> +-# error kernel headers missing or too old
> +-#endif
> +-int
> +-main ()
> +-{
> +-
> +-  ;
> +-  return 0;
> +-}
> +-_ACEOF
> +-if ac_fn_c_try_compile "$LINENO"; then :
> +-  libc_cv_linux320=3D'3.2.0 or later'
> +-else
> +-  libc_cv_linux320=3D'missing or too old!'
> +-fi
> +-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
> +-fi
> +-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $libc_cv_linux320" >=
&5
> +-$as_echo "$libc_cv_linux320" >&6; }
> +-if test "$libc_cv_linux320" !=3D '3.2.0 or later'; then
> +-  as_fn_error $? "GNU libc requires kernel header files from
> +-Linux 3.2.0 or later to be installed before configuring.
> +-The kernel header files are found usually in /usr/include/asm and
> +-/usr/include/linux; make sure these directories use files from
> +-Linux 3.2.0 or later.  This check uses <linux/version.h>, so
> +-make sure that file was built correctly when installing the kernel he=
ader
> +-files.  To use kernel headers not from /usr/include/linux, use the
> +-configure option --with-headers." "$LINENO" 5
> +-fi
> +-
> + # If the user gave a minimal version number test whether the availabl=
e
> + # kernel headers are young enough.  Additionally we have minimal
> + # kernel versions for some architectures.  If a previous configure fr=
agment
> +diff --git a/sysdeps/unix/sysv/linux/configure.ac b/sysdeps/unix/sysv/=
linux/configure.ac
> +index 13abda0..5b47db5 100644
> +--- a/sysdeps/unix/sysv/linux/configure.ac
> ++++ b/sysdeps/unix/sysv/linux/configure.ac
> +@@ -1,31 +1,10 @@
> + GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
> + # Local configure fragment for sysdeps/unix/sysv/linux.
> +=20
> +-define([LIBC_LINUX_VERSION],[3.2.0])dnl
> + if test -n "$sysheaders"; then
> +   OLD_CPPFLAGS=3D$CPPFLAGS
> +   CPPFLAGS=3D"$CPPFLAGS $SYSINCLUDES"
> + fi
> +-define([libc_cv_linuxVER], [libc_cv_linux]patsubst(LIBC_LINUX_VERSION=
,[\.]))dnl
> +-AC_CACHE_CHECK(installed Linux kernel header files, libc_cv_linuxVER,=
 [dnl
> +-AC_TRY_COMPILE([#include <linux/version.h>
> +-#if !defined LINUX_VERSION_CODE || LINUX_VERSION_CODE < ]dnl
> +-patsubst(LIBC_LINUX_VERSION,[^\([^.]*\)\.\([^.]*\)\.\([^.]*\)$],dnl
> +-[ (\1 *65536+ \2 *256+ \3) /* \1.\2.\3 */])[
> +-# error kernel headers missing or too old
> +-#endif], [],
> +-	       [libc_cv_linuxVER=3D'LIBC_LINUX_VERSION or later'],
> +-	       [libc_cv_linuxVER=3D'missing or too old!'])])
> +-if test "$libc_cv_linuxVER" !=3D 'LIBC_LINUX_VERSION or later'; then
> +-  AC_MSG_ERROR([GNU libc requires kernel header files from
> +-Linux LIBC_LINUX_VERSION or later to be installed before configuring.=

> +-The kernel header files are found usually in /usr/include/asm and
> +-/usr/include/linux; make sure these directories use files from
> +-Linux LIBC_LINUX_VERSION or later.  This check uses <linux/version.h>=
, so
> +-make sure that file was built correctly when installing the kernel he=
ader
> +-files.  To use kernel headers not from /usr/include/linux, use the
> +-configure option --with-headers.])
> +-fi
> +=20
> + # If the user gave a minimal version number test whether the availabl=
e
> + # kernel headers are young enough.  Additionally we have minimal
> +--=20
> +2.7.4
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/=
glibc/glibc_2.25.bb
> index cf9c4f7..869d023 100644
> --- a/meta/recipes-core/glibc/glibc_2.25.bb
> +++ b/meta/recipes-core/glibc/glibc_2.25.bb
> @@ -42,6 +42,7 @@ SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};n=
ame=3Dglibc \
>             file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>             file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadt=
h-fir.patch \
>             file://0027-locale-fix-hard-coded-reference-to-gcc-E.patch =
\
> +           file://0028-Kill-LIBC_LINUX_VERSION-macro.patch \
>  "
> =20
>  NATIVESDKFIXES ?=3D ""
>=20


--DuIO9kCXMDtCjSjBXj8baDTf6f7Q9vNL4--

--iDTaAACLcSxUARjKEQuPKOfcb32QP5RnO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlja+boACgkQuwUzVZGdMxSIdgCgk87c4aUQRA26vB4ZYm0hWbZp
uLAAnjyCAvPhnwKhkpBQ4tDCMN+4J1dp
=ef5+
-----END PGP SIGNATURE-----

--iDTaAACLcSxUARjKEQuPKOfcb32QP5RnO--
