Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUd5w-0008Rr-Ki
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 14:12:44 +0200
Received: by yenl13 with SMTP id l13so551260yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 05:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=jlP2NfQTyh18lDHCXyfEqU7pG8iU3WMJdsTGGWMHcCg=;
	b=iKE2pNLs2TT904rvvFQM/qQ56Gkfdy1sWjChp01pJLsK3B3R4+UG5OAk74IstFUIxi
	NWu0Lp/2EqtoRjzWivAXnQ0Kle1N1An6UAGGH4vlk1+znDfhn8PPYfshTVkBSjTvrY8s
	I4S+/ao0CDvuQfWJG8vE4W3g25aRuY7AjygPxwZRvYLiDDm04AWy5F/d8aPefedUE/Of
	K13yWb7ChqnXaUDEUixVUiJ9iX4wjeRRrIYBCeQ+cBsg5l1PqxJcz5khb1Yq2S7BNIi6
	EphVx24xloBBiQKcMlsgAtW5vaLKizJWqJ0u/g5y2p+ngbgNEld0iuYOeze58v612/Cb
	+kQg==
MIME-Version: 1.0
Received: by 10.236.75.232 with SMTP id z68mr3259550yhd.6.1337169763045; Wed,
	16 May 2012 05:02:43 -0700 (PDT)
Received: by 10.236.23.9 with HTTP; Wed, 16 May 2012 05:02:43 -0700 (PDT)
In-Reply-To: <1337169512-2431-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1337169512-2431-1-git-send-email-bogdan.a.marinescu@intel.com>
Date: Wed, 16 May 2012 14:02:43 +0200
Message-ID: <CA+chaQeOJRQXAuHqJxPOraL6BxwsN00Z-cT9qawW0sPTBYCo5A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnutls: update to 2.12.19
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
X-List-Received-Date: Wed, 16 May 2012 12:12:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 1:58 PM, Bogdan Marinescu
<bogdan.a.marinescu@intel.com> wrote:
> Tested with curl in qemux86/core-image-lsb.
>

recreate patch with -M and resend

Cheers,

> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
> =C2=A0.../gnutls/gnutls-2.12.18/configure-fix.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 65 ----------
> =C2=A0.../correct_rpl_gettimeofday_signature.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 57 ---------
> =C2=A0.../gnutls-2.12.18/fix-gettext-version.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 46 -------
> =C2=A0.../gnutls/gnutls-2.12.18/gnutls-openssl.patch =C2=A0 =C2=A0 | =C2=
=A0126 --------------------
> =C2=A0.../gnutls-2.12.18/gnutls-texinfo-euro.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 18 ---
> =C2=A0.../gnutls/gnutls-2.12.19/configure-fix.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 65 ++++++++++
> =C2=A0.../correct_rpl_gettimeofday_signature.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 57 +++++++++
> =C2=A0.../gnutls-2.12.19/fix-gettext-version.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 46 +++++++
> =C2=A0.../gnutls/gnutls-2.12.19/gnutls-openssl.patch =C2=A0 =C2=A0 | =C2=
=A0126 ++++++++++++++++++++
> =C2=A0.../gnutls-2.12.19/gnutls-texinfo-euro.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 18 +++
> =C2=A0meta/recipes-support/gnutls/gnutls_2.12.18.bb =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 19 ---
> =C2=A0meta/recipes-support/gnutls/gnutls_2.12.19.bb =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 19 +++
> =C2=A012 files changed, 331 insertions(+), 331 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-support/gnutls/gnutls-2.12.18/confi=
gure-fix.patch
> =C2=A0delete mode 100644 meta/recipes-support/gnutls/gnutls-2.12.18/corre=
ct_rpl_gettimeofday_signature.patch
> =C2=A0delete mode 100644 meta/recipes-support/gnutls/gnutls-2.12.18/fix-g=
ettext-version.patch
> =C2=A0delete mode 100644 meta/recipes-support/gnutls/gnutls-2.12.18/gnutl=
s-openssl.patch
> =C2=A0delete mode 100644 meta/recipes-support/gnutls/gnutls-2.12.18/gnutl=
s-texinfo-euro.patch
> =C2=A0create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/confi=
gure-fix.patch
> =C2=A0create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/corre=
ct_rpl_gettimeofday_signature.patch
> =C2=A0create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/fix-g=
ettext-version.patch
> =C2=A0create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/gnutl=
s-openssl.patch
> =C2=A0create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.19/gnutl=
s-texinfo-euro.patch
> =C2=A0delete mode 100644 meta/recipes-support/gnutls/gnutls_2.12.18.bb
> =C2=A0create mode 100644 meta/recipes-support/gnutls/gnutls_2.12.19.bb
>
> diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/configure-fix.pat=
ch b/meta/recipes-support/gnutls/gnutls-2.12.18/configure-fix.patch
> deleted file mode 100644
> index 14f87e0..0000000
> --- a/meta/recipes-support/gnutls/gnutls-2.12.18/configure-fix.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -Upstream-Status: Inappropriate [distribution]
> -
> -rebased from original configure_madness.patch
> -
> -libtasn1 provides an .pc file in upstream,
> -and a libgcrypt.pc is added in libgcrypt recipe,
> -so use Requires.private for these two.
> -
> -against 2.8.6
> -
> -07/02/2010 - qhe
> -
> ----
> -Index: gnutls-2.12.11/lib/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gnutls-2.12.11.orig/lib/configure.ac
> -+++ gnutls-2.12.11/lib/configure.ac
> -@@ -126,8 +126,8 @@ lgl_INIT
> - AC_CHECK_FUNCS(getrusage,,)
> - AC_LIB_HAVE_LINKFLAGS(pthread,, [#include <pthread.h>], [pthread_mutex_=
lock (0);])
> -
> --LIBGNUTLS_LIBS=3D"-L${libdir} -lgnutls $LIBS"
> --LIBGNUTLS_CFLAGS=3D"-I${includedir}"
> -+LIBGNUTLS_LIBS=3D"-lgnutls $LIBS"
> -+LIBGNUTLS_CFLAGS=3D""
> - AC_SUBST(LIBGNUTLS_LIBS)
> - AC_SUBST(LIBGNUTLS_CFLAGS)
> -
> -Index: gnutls-2.12.11/lib/gnutls.pc.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gnutls-2.12.11.orig/lib/gnutls.pc.in
> -+++ gnutls-2.12.11/lib/gnutls.pc.in
> -@@ -20,6 +20,4 @@ Description: Transport Security Layer im
> - URL: http://www.gnu.org/software/gnutls/
> - Version: @VERSION@
> - Libs: -L${libdir} -lgnutls
> --Libs.private: @LTLIBGCRYPT@ @LTLIBNETTLE@ @NETTLE_LIBS@ @GNUTLS_ZLIB_LI=
BS_PRIVATE@
> --@GNUTLS_REQUIRES_PRIVATE@
> - Cflags: -I${includedir}
> -Index: gnutls-2.12.11/libextra/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gnutls-2.12.11.orig/libextra/configure.ac
> -+++ gnutls-2.12.11/libextra/configure.ac
> -@@ -41,8 +41,8 @@ LIBGNUTLS_EXTRA_HOOKS
> -
> - xgl_INIT
> -
> --LIBGNUTLS_EXTRA_LIBS=3D"-L${libdir} -lgnutls-extra $LZO_LIBS $LIBGNUTLS=
_LIBS"
> --LIBGNUTLS_EXTRA_CFLAGS=3D"-I${includedir}"
> -+LIBGNUTLS_EXTRA_LIBS=3D"-lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
> -+LIBGNUTLS_EXTRA_CFLAGS=3D""
> - AC_SUBST(LIBGNUTLS_EXTRA_LIBS)
> - AC_SUBST(LIBGNUTLS_EXTRA_CFLAGS)
> -
> -Index: gnutls-2.12.11/libextra/gnutls-extra.pc.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gnutls-2.12.11.orig/libextra/gnutls-extra.pc.in
> -+++ gnutls-2.12.11/libextra/gnutls-extra.pc.in
> -@@ -22,5 +22,5 @@ URL: http://www.gnu.org/software/gnutls/
> - Requires: gnutls
> - Version: @VERSION@
> - Libs: -L${libdir} -lgnutls-extra
> --Libs.private: @LIBGNUTLS_EXTRA_LIBS@
> -+Libs.private: -llzo2
> - Cflags: -I${includedir}
> diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/correct_rpl_getti=
meofday_signature.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/correc=
t_rpl_gettimeofday_signature.patch
> deleted file mode 100644
> index b8f0d72..0000000
> --- a/meta/recipes-support/gnutls/gnutls-2.12.18/correct_rpl_gettimeofday=
_signature.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -Currently we fail on uclibc like below
> -
> -| In file included from /home/kraj/work/angstrom/sources/openembedded-co=
re/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/procfs.h:32:0,
> -| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /ho=
me/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/q=
emuarm/usr/include/sys/ucontext.h:26,
> -| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /ho=
me/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/q=
emuarm/usr/include/signal.h:392,
> -| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../=
../gl/signal.h:52,
> -| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../=
../gl/sys/select.h:58,
> -| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /ho=
me/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/q=
emuarm/usr/include/sys/types.h:220,
> -| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../=
../gl/sys/types.h:28,
> -| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../=
../lib/includes/gnutls/gnutls.h:46,
> -| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ex-=
cxx.cpp:3:
> -| ../../gl/sys/time.h:396:66: error: conflicting declaration 'void* rest=
rict'
> -| ../../gl/sys/time.h:396:50: error: 'restrict' has a previous declarati=
on as 'timeval* restrict'
> -| make[4]: *** [ex-cxx.o] Error 1
> -| make[4]: *** Waiting for unfinished jobs....
> -
> -
> -GCC detects that we call 'restrict' as param name in function
> -signatures and complains since both params are called 'restrict'
> -therefore we use __restrict to denote the C99 keywork
> -
> -This only happens of uclibc since this code is not excercised with
> -eglibc otherwise we will have same issue there too
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -
> -Index: gnutls-2.12.14/gl/sys_time.in.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gnutls-2.12.14.orig/gl/sys_time.in.h =C2=A0 =C2=A0 =C2=A0 2012-01-15=
 10:54:39.517285351 -0800
> -+++ gnutls-2.12.14/gl/sys_time.in.h =C2=A0 =C2=A02012-01-15 10:59:23.773=
299108 -0800
> -@@ -82,20 +82,20 @@
> - # =C2=A0 =C2=A0define gettimeofday rpl_gettimeofday
> - # =C2=A0 endif
> - _GL_FUNCDECL_RPL (gettimeofday, int,
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct =
timeval *restrict, void *restrict)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct =
timeval *__restrict, void *__restrict)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _GL_ARG_=
NONNULL ((1)));
> - _GL_CXXALIAS_RPL (gettimeofday, int,
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct =
timeval *restrict, void *restrict));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct =
timeval *__restrict, void *__restrict));
> - # =C2=A0else
> - # =C2=A0 if !@HAVE_GETTIMEOFDAY@
> - _GL_FUNCDECL_SYS (gettimeofday, int,
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct =
timeval *restrict, void *restrict)
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct =
timeval *__restrict, void *__restrict)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _GL_ARG_=
NONNULL ((1)));
> - # =C2=A0 endif
> - /* Need to cast, because on glibc systems, by default, the second argum=
ent is
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timezone *. =C2=A0*/
> - _GL_CXXALIAS_SYS_CAST (gettimeofday, int,
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (struct timeval *restrict, void *restrict));
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (struct timeval *__restrict, void *__restrict));
> - # =C2=A0endif
> - _GL_CXXALIASWARN (gettimeofday);
> - # elif defined GNULIB_POSIXCHECK
> diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/fix-gettext-versi=
on.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/fix-gettext-version.p=
atch
> deleted file mode 100644
> index 4c9137a..0000000
> --- a/meta/recipes-support/gnutls/gnutls-2.12.18/fix-gettext-version.patc=
h
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Saul Wold <sgw@linux.intel.com>
> -
> -Index: gnutls-2.12.14/lib/po/Makefile.in.in
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gnutls-2.12.14.orig/lib/po/Makefile.in.in
> -+++ gnutls-2.12.14/lib/po/Makefile.in.in
> -@@ -8,8 +8,8 @@
> - # Please note that the actual code of GNU gettext is covered by the GNU
> - # General Public License and is *not* in the public domain.
> - #
> --# Origin: gettext-0.17
> --GETTEXT_MACRO_VERSION =3D 0.17
> -+# Origin: gettext-0.18
> -+GETTEXT_MACRO_VERSION =3D 0.18
> -
> - PACKAGE =3D @PACKAGE@
> - VERSION =3D @VERSION@
> -Index: gnutls-2.12.14/lib/m4/po.m4
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gnutls-2.12.14.orig/lib/m4/po.m4
> -+++ gnutls-2.12.14/lib/m4/po.m4
> -@@ -29,7 +29,7 @@ AC_DEFUN([AM_PO_SUBDIRS],
> -
> - =C2=A0 dnl Release version of the gettext macros. This is used to ensur=
e that
> - =C2=A0 dnl the gettext macros and po/Makefile.in.in are in sync.
> -- =C2=A0AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
> -+ =C2=A0AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
> -
> - =C2=A0 dnl Perform the following tests also if --disable-nls has been g=
iven,
> - =C2=A0 dnl because they are needed for "make dist" to work.
> -Index: gnutls-2.12.14/lib/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gnutls-2.12.14.orig/lib/configure.ac
> -+++ gnutls-2.12.14/lib/configure.ac
> -@@ -39,7 +39,7 @@ AC_PROG_LIBTOOL
> - LIBGNUTLS_HOOKS
> -
> - AM_GNU_GETTEXT([external])
> --AM_GNU_GETTEXT_VERSION([0.17])
> -+AM_GNU_GETTEXT_VERSION([0.18])
> -
> - AC_C_BIGENDIAN
> -
> diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-openssl.pa=
tch b/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-openssl.patch
> deleted file mode 100644
> index ef70674..0000000
> --- a/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-openssl.patch
> +++ /dev/null
> @@ -1,126 +0,0 @@
> -Upstream-Status: Backport
> -
> -Index: gnutls-1.6.0/libextra/gnutls_openssl.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gnutls-1.6.0.orig/libextra/gnutls_openssl.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A02006-08-13 22:34:09.000000000 +0200
> -+++ gnutls-1.6.0/libextra/gnutls_openssl.c =C2=A0 =C2=A0 2006-12-12 15:0=
7:59.002227000 +0100
> -@@ -256,12 +256,17 @@
> - =C2=A0 ssl->rfd =3D (gnutls_transport_ptr_t) - 1;
> - =C2=A0 ssl->wfd =3D (gnutls_transport_ptr_t) - 1;
> -
> -+ =C2=A0ssl->ssl_peek_buffer =3D NULL;
> -+ =C2=A0ssl->ssl_peek_buffer_size =3D ssl->ssl_peek_avail =3D 0;
> -+
> - =C2=A0 return ssl;
> - }
> -
> - void
> - SSL_free (SSL * ssl)
> - {
> -+ =C2=A0if (ssl->ssl_peek_buffer)
> -+ =C2=A0 =C2=A0free(ssl->ssl_peek_buffer);
> - =C2=A0 gnutls_certificate_free_credentials (ssl->gnutls_cred);
> - =C2=A0 gnutls_deinit (ssl->gnutls_state);
> - =C2=A0 free (ssl);
> -@@ -285,6 +290,7 @@
> - SSL_set_fd (SSL * ssl, int fd)
> - {
> - =C2=A0 gnutls_transport_set_ptr (ssl->gnutls_state, GNUTLS_INT_TO_POINT=
ER (fd));
> -+ =C2=A0ssl->rfd =3D ssl->wfd =3D fd;
> - =C2=A0 return 1;
> - }
> -
> -@@ -310,6 +316,17 @@
> - =C2=A0 return 1;
> - }
> -
> -+int SSL_get_rfd(SSL *ssl)
> -+{
> -+ =C2=A0return ssl->rfd;
> -+}
> -+
> -+int SSL_get_wfd(SSL *ssl)
> -+{
> -+ =C2=A0return ssl->wfd;
> -+}
> -+
> -+
> - void
> - SSL_set_bio (SSL * ssl, BIO * rbio, BIO * wbio)
> - {
> -@@ -325,6 +342,8 @@
> - int
> - SSL_pending (SSL * ssl)
> - {
> -+ =C2=A0if (ssl->ssl_peek_avail)
> -+ =C2=A0 =C2=A0return ssl->ssl_peek_avail;
> - =C2=A0 return gnutls_record_check_pending (ssl->gnutls_state);
> - }
> -
> -@@ -480,11 +499,50 @@
> - =C2=A0 return 1;
> - }
> -
> -+int SSL_peek(SSL *ssl, void *buf, int len)
> -+{
> -+ =C2=A0if (len > ssl->ssl_peek_buffer_size) {
> -+ =C2=A0 =C2=A0ssl->ssl_peek_buffer =3D realloc (ssl->ssl_peek_buffer, l=
en);
> -+ =C2=A0 =C2=A0ssl->ssl_peek_buffer_size =3D len;
> -+ =C2=A0}
> -+
> -+ =C2=A0if (ssl->ssl_peek_avail =3D=3D 0) {
> -+
> -+ =C2=A0 =C2=A0int ret;
> -+
> -+ =C2=A0 =C2=A0ret =3D gnutls_record_recv(ssl->gnutls_state, ssl->ssl_pe=
ek_buffer, len);
> -+ =C2=A0 =C2=A0ssl->last_error =3D ret;
> -+
> -+ =C2=A0 =C2=A0if (ret > 0)
> -+ =C2=A0 =C2=A0 =C2=A0ssl->ssl_peek_avail +=3D ret;
> -+ =C2=A0}
> -+
> -+ =C2=A0if (len > ssl->ssl_peek_avail)
> -+ =C2=A0 =C2=A0len =3D ssl->ssl_peek_avail;
> -+
> -+ =C2=A0memcpy (buf, ssl->ssl_peek_buffer, len);
> -+
> -+ =C2=A0return len;
> -+}
> -+
> - int
> - SSL_read (SSL * ssl, void *buf, int len)
> - {
> - =C2=A0 int ret;
> -
> -+ =C2=A0if (ssl->ssl_peek_avail) {
> -+ =C2=A0 =C2=A0int n =3D (ssl->ssl_peek_avail > len) ? len : ssl->ssl_pe=
ek_avail;
> -+
> -+ =C2=A0 =C2=A0memcpy (buf, ssl->ssl_peek_buffer, n);
> -+
> -+ =C2=A0 =C2=A0if (ssl->ssl_peek_avail > n)
> -+ =C2=A0 =C2=A0 =C2=A0memmove (ssl->ssl_peek_buffer, ssl->ssl_peek_buffe=
r + n, ssl->ssl_peek_avail - n);
> -+
> -+ =C2=A0 =C2=A0ssl->ssl_peek_avail -=3D n;
> -+
> -+ =C2=A0 =C2=A0return n;
> -+ =C2=A0}
> -+
> - =C2=A0 ret =3D gnutls_record_recv (ssl->gnutls_state, buf, len);
> - =C2=A0 ssl->last_error =3D ret;
> -
> -Index: gnutls-1.6.0/includes/gnutls/openssl.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- gnutls-1.6.0.orig/libextra/includes/gnutls/openssl.h =C2=A0 =C2=A0 =
=C2=A0 2006-03-08 11:44:58.000000000 +0100
> -+++ gnutls-1.6.0/libextra/includes/gnutls/openssl.h =C2=A0 =C2=A02006-12=
-12 15:07:26.032227000 +0100
> -@@ -164,6 +164,11 @@
> -
> - =C2=A0 =C2=A0 gnutls_transport_ptr_t rfd;
> - =C2=A0 =C2=A0 gnutls_transport_ptr_t wfd;
> -+
> -+ =C2=A0 =C2=A0char *ssl_peek_buffer;
> -+ =C2=A0 =C2=A0size_t ssl_peek_buffer_size;
> -+ =C2=A0 =C2=A0size_t ssl_peek_avail;
> -+
> - =C2=A0 };
> -
> - #define rbio gnutls_state
> diff --git a/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-texinfo-eu=
ro.patch b/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-texinfo-euro.p=
atch
> deleted file mode 100644
> index 10e3774..0000000
> --- a/meta/recipes-support/gnutls/gnutls-2.12.18/gnutls-texinfo-euro.patc=
h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Upstream-Status: Backport
> -
> -The version of texinfo in Debian Sarge does not understand the @euro{} c=
ommand.
> -This patch replaces the @euro{} command with the word "euro".
> -
> ---- gnutls-1.3.5/doc/gnutls.texi.orig =C2=A02006-04-26 08:06:40.91826800=
0 +0930
> -+++ gnutls-1.3.5/doc/gnutls.texi =C2=A0 =C2=A0 =C2=A0 2006-04-26 08:06:5=
2.446515440 +0930
> -@@ -11,8 +11,8 @@
> - long as it is difficult enough to generate two different messages with
> - the same hash algorithm output. In that case the same signature could
> - be used as a proof for both messages. Nobody wants to sign an innocent
> --message of donating 1 @euro{} to Greenpeace and find out that he
> --donated 1.000.000 @euro{} to Bad Inc.
> -+message of donating 1 euro to Greenpeace and find out that he
> -+donated 1.000.000 euro to Bad Inc.
> -
> - For a hash algorithm to be called cryptographic the following three
> - requirements must hold
> diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/configure-fix.pat=
ch b/meta/recipes-support/gnutls/gnutls-2.12.19/configure-fix.patch
> new file mode 100644
> index 0000000..14f87e0
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls-2.12.19/configure-fix.patch
> @@ -0,0 +1,65 @@
> +Upstream-Status: Inappropriate [distribution]
> +
> +rebased from original configure_madness.patch
> +
> +libtasn1 provides an .pc file in upstream,
> +and a libgcrypt.pc is added in libgcrypt recipe,
> +so use Requires.private for these two.
> +
> +against 2.8.6
> +
> +07/02/2010 - qhe
> +
> +---
> +Index: gnutls-2.12.11/lib/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-2.12.11.orig/lib/configure.ac
> ++++ gnutls-2.12.11/lib/configure.ac
> +@@ -126,8 +126,8 @@ lgl_INIT
> + AC_CHECK_FUNCS(getrusage,,)
> + AC_LIB_HAVE_LINKFLAGS(pthread,, [#include <pthread.h>], [pthread_mutex_=
lock (0);])
> +
> +-LIBGNUTLS_LIBS=3D"-L${libdir} -lgnutls $LIBS"
> +-LIBGNUTLS_CFLAGS=3D"-I${includedir}"
> ++LIBGNUTLS_LIBS=3D"-lgnutls $LIBS"
> ++LIBGNUTLS_CFLAGS=3D""
> + AC_SUBST(LIBGNUTLS_LIBS)
> + AC_SUBST(LIBGNUTLS_CFLAGS)
> +
> +Index: gnutls-2.12.11/lib/gnutls.pc.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-2.12.11.orig/lib/gnutls.pc.in
> ++++ gnutls-2.12.11/lib/gnutls.pc.in
> +@@ -20,6 +20,4 @@ Description: Transport Security Layer im
> + URL: http://www.gnu.org/software/gnutls/
> + Version: @VERSION@
> + Libs: -L${libdir} -lgnutls
> +-Libs.private: @LTLIBGCRYPT@ @LTLIBNETTLE@ @NETTLE_LIBS@ @GNUTLS_ZLIB_LI=
BS_PRIVATE@
> +-@GNUTLS_REQUIRES_PRIVATE@
> + Cflags: -I${includedir}
> +Index: gnutls-2.12.11/libextra/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-2.12.11.orig/libextra/configure.ac
> ++++ gnutls-2.12.11/libextra/configure.ac
> +@@ -41,8 +41,8 @@ LIBGNUTLS_EXTRA_HOOKS
> +
> + xgl_INIT
> +
> +-LIBGNUTLS_EXTRA_LIBS=3D"-L${libdir} -lgnutls-extra $LZO_LIBS $LIBGNUTLS=
_LIBS"
> +-LIBGNUTLS_EXTRA_CFLAGS=3D"-I${includedir}"
> ++LIBGNUTLS_EXTRA_LIBS=3D"-lgnutls-extra $LZO_LIBS $LIBGNUTLS_LIBS"
> ++LIBGNUTLS_EXTRA_CFLAGS=3D""
> + AC_SUBST(LIBGNUTLS_EXTRA_LIBS)
> + AC_SUBST(LIBGNUTLS_EXTRA_CFLAGS)
> +
> +Index: gnutls-2.12.11/libextra/gnutls-extra.pc.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-2.12.11.orig/libextra/gnutls-extra.pc.in
> ++++ gnutls-2.12.11/libextra/gnutls-extra.pc.in
> +@@ -22,5 +22,5 @@ URL: http://www.gnu.org/software/gnutls/
> + Requires: gnutls
> + Version: @VERSION@
> + Libs: -L${libdir} -lgnutls-extra
> +-Libs.private: @LIBGNUTLS_EXTRA_LIBS@
> ++Libs.private: -llzo2
> + Cflags: -I${includedir}
> diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/correct_rpl_getti=
meofday_signature.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/correc=
t_rpl_gettimeofday_signature.patch
> new file mode 100644
> index 0000000..b8f0d72
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls-2.12.19/correct_rpl_gettimeofday=
_signature.patch
> @@ -0,0 +1,57 @@
> +Currently we fail on uclibc like below
> +
> +| In file included from /home/kraj/work/angstrom/sources/openembedded-co=
re/build/tmp-uclibc/sysroots/qemuarm/usr/include/sys/procfs.h:32:0,
> +| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /ho=
me/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/q=
emuarm/usr/include/sys/ucontext.h:26,
> +| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /ho=
me/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/q=
emuarm/usr/include/signal.h:392,
> +| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../=
../gl/signal.h:52,
> +| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../=
../gl/sys/select.h:58,
> +| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /ho=
me/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/q=
emuarm/usr/include/sys/types.h:220,
> +| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../=
../gl/sys/types.h:28,
> +| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../=
../lib/includes/gnutls/gnutls.h:46,
> +| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ex-=
cxx.cpp:3:
> +| ../../gl/sys/time.h:396:66: error: conflicting declaration 'void* rest=
rict'
> +| ../../gl/sys/time.h:396:50: error: 'restrict' has a previous declarati=
on as 'timeval* restrict'
> +| make[4]: *** [ex-cxx.o] Error 1
> +| make[4]: *** Waiting for unfinished jobs....
> +
> +
> +GCC detects that we call 'restrict' as param name in function
> +signatures and complains since both params are called 'restrict'
> +therefore we use __restrict to denote the C99 keywork
> +
> +This only happens of uclibc since this code is not excercised with
> +eglibc otherwise we will have same issue there too
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +
> +Index: gnutls-2.12.14/gl/sys_time.in.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-2.12.14.orig/gl/sys_time.in.h =C2=A0 =C2=A0 =C2=A0 2012-01-15=
 10:54:39.517285351 -0800
> ++++ gnutls-2.12.14/gl/sys_time.in.h =C2=A0 =C2=A02012-01-15 10:59:23.773=
299108 -0800
> +@@ -82,20 +82,20 @@
> + # =C2=A0 =C2=A0define gettimeofday rpl_gettimeofday
> + # =C2=A0 endif
> + _GL_FUNCDECL_RPL (gettimeofday, int,
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct =
timeval *restrict, void *restrict)
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct =
timeval *__restrict, void *__restrict)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _GL_ARG_=
NONNULL ((1)));
> + _GL_CXXALIAS_RPL (gettimeofday, int,
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct =
timeval *restrict, void *restrict));
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct =
timeval *__restrict, void *__restrict));
> + # =C2=A0else
> + # =C2=A0 if !@HAVE_GETTIMEOFDAY@
> + _GL_FUNCDECL_SYS (gettimeofday, int,
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct =
timeval *restrict, void *restrict)
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(struct =
timeval *__restrict, void *__restrict)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _GL_ARG_=
NONNULL ((1)));
> + # =C2=A0 endif
> + /* Need to cast, because on glibc systems, by default, the second argum=
ent is
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timezone *. =C2=A0*/
> + _GL_CXXALIAS_SYS_CAST (gettimeofday, int,
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (struct timeval *restrict, void *restrict));
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (struct timeval *__restrict, void *__restrict));
> + # =C2=A0endif
> + _GL_CXXALIASWARN (gettimeofday);
> + # elif defined GNULIB_POSIXCHECK
> diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/fix-gettext-versi=
on.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/fix-gettext-version.p=
atch
> new file mode 100644
> index 0000000..4c9137a
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls-2.12.19/fix-gettext-version.patc=
h
> @@ -0,0 +1,46 @@
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +
> +Index: gnutls-2.12.14/lib/po/Makefile.in.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-2.12.14.orig/lib/po/Makefile.in.in
> ++++ gnutls-2.12.14/lib/po/Makefile.in.in
> +@@ -8,8 +8,8 @@
> + # Please note that the actual code of GNU gettext is covered by the GNU
> + # General Public License and is *not* in the public domain.
> + #
> +-# Origin: gettext-0.17
> +-GETTEXT_MACRO_VERSION =3D 0.17
> ++# Origin: gettext-0.18
> ++GETTEXT_MACRO_VERSION =3D 0.18
> +
> + PACKAGE =3D @PACKAGE@
> + VERSION =3D @VERSION@
> +Index: gnutls-2.12.14/lib/m4/po.m4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-2.12.14.orig/lib/m4/po.m4
> ++++ gnutls-2.12.14/lib/m4/po.m4
> +@@ -29,7 +29,7 @@ AC_DEFUN([AM_PO_SUBDIRS],
> +
> + =C2=A0 dnl Release version of the gettext macros. This is used to ensur=
e that
> + =C2=A0 dnl the gettext macros and po/Makefile.in.in are in sync.
> +- =C2=A0AC_SUBST([GETTEXT_MACRO_VERSION], [0.17])
> ++ =C2=A0AC_SUBST([GETTEXT_MACRO_VERSION], [0.18])
> +
> + =C2=A0 dnl Perform the following tests also if --disable-nls has been g=
iven,
> + =C2=A0 dnl because they are needed for "make dist" to work.
> +Index: gnutls-2.12.14/lib/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-2.12.14.orig/lib/configure.ac
> ++++ gnutls-2.12.14/lib/configure.ac
> +@@ -39,7 +39,7 @@ AC_PROG_LIBTOOL
> + LIBGNUTLS_HOOKS
> +
> + AM_GNU_GETTEXT([external])
> +-AM_GNU_GETTEXT_VERSION([0.17])
> ++AM_GNU_GETTEXT_VERSION([0.18])
> +
> + AC_C_BIGENDIAN
> +
> diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-openssl.pa=
tch b/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-openssl.patch
> new file mode 100644
> index 0000000..ef70674
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-openssl.patch
> @@ -0,0 +1,126 @@
> +Upstream-Status: Backport
> +
> +Index: gnutls-1.6.0/libextra/gnutls_openssl.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-1.6.0.orig/libextra/gnutls_openssl.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A02006-08-13 22:34:09.000000000 +0200
> ++++ gnutls-1.6.0/libextra/gnutls_openssl.c =C2=A0 =C2=A0 2006-12-12 15:0=
7:59.002227000 +0100
> +@@ -256,12 +256,17 @@
> + =C2=A0 ssl->rfd =3D (gnutls_transport_ptr_t) - 1;
> + =C2=A0 ssl->wfd =3D (gnutls_transport_ptr_t) - 1;
> +
> ++ =C2=A0ssl->ssl_peek_buffer =3D NULL;
> ++ =C2=A0ssl->ssl_peek_buffer_size =3D ssl->ssl_peek_avail =3D 0;
> ++
> + =C2=A0 return ssl;
> + }
> +
> + void
> + SSL_free (SSL * ssl)
> + {
> ++ =C2=A0if (ssl->ssl_peek_buffer)
> ++ =C2=A0 =C2=A0free(ssl->ssl_peek_buffer);
> + =C2=A0 gnutls_certificate_free_credentials (ssl->gnutls_cred);
> + =C2=A0 gnutls_deinit (ssl->gnutls_state);
> + =C2=A0 free (ssl);
> +@@ -285,6 +290,7 @@
> + SSL_set_fd (SSL * ssl, int fd)
> + {
> + =C2=A0 gnutls_transport_set_ptr (ssl->gnutls_state, GNUTLS_INT_TO_POINT=
ER (fd));
> ++ =C2=A0ssl->rfd =3D ssl->wfd =3D fd;
> + =C2=A0 return 1;
> + }
> +
> +@@ -310,6 +316,17 @@
> + =C2=A0 return 1;
> + }
> +
> ++int SSL_get_rfd(SSL *ssl)
> ++{
> ++ =C2=A0return ssl->rfd;
> ++}
> ++
> ++int SSL_get_wfd(SSL *ssl)
> ++{
> ++ =C2=A0return ssl->wfd;
> ++}
> ++
> ++
> + void
> + SSL_set_bio (SSL * ssl, BIO * rbio, BIO * wbio)
> + {
> +@@ -325,6 +342,8 @@
> + int
> + SSL_pending (SSL * ssl)
> + {
> ++ =C2=A0if (ssl->ssl_peek_avail)
> ++ =C2=A0 =C2=A0return ssl->ssl_peek_avail;
> + =C2=A0 return gnutls_record_check_pending (ssl->gnutls_state);
> + }
> +
> +@@ -480,11 +499,50 @@
> + =C2=A0 return 1;
> + }
> +
> ++int SSL_peek(SSL *ssl, void *buf, int len)
> ++{
> ++ =C2=A0if (len > ssl->ssl_peek_buffer_size) {
> ++ =C2=A0 =C2=A0ssl->ssl_peek_buffer =3D realloc (ssl->ssl_peek_buffer, l=
en);
> ++ =C2=A0 =C2=A0ssl->ssl_peek_buffer_size =3D len;
> ++ =C2=A0}
> ++
> ++ =C2=A0if (ssl->ssl_peek_avail =3D=3D 0) {
> ++
> ++ =C2=A0 =C2=A0int ret;
> ++
> ++ =C2=A0 =C2=A0ret =3D gnutls_record_recv(ssl->gnutls_state, ssl->ssl_pe=
ek_buffer, len);
> ++ =C2=A0 =C2=A0ssl->last_error =3D ret;
> ++
> ++ =C2=A0 =C2=A0if (ret > 0)
> ++ =C2=A0 =C2=A0 =C2=A0ssl->ssl_peek_avail +=3D ret;
> ++ =C2=A0}
> ++
> ++ =C2=A0if (len > ssl->ssl_peek_avail)
> ++ =C2=A0 =C2=A0len =3D ssl->ssl_peek_avail;
> ++
> ++ =C2=A0memcpy (buf, ssl->ssl_peek_buffer, len);
> ++
> ++ =C2=A0return len;
> ++}
> ++
> + int
> + SSL_read (SSL * ssl, void *buf, int len)
> + {
> + =C2=A0 int ret;
> +
> ++ =C2=A0if (ssl->ssl_peek_avail) {
> ++ =C2=A0 =C2=A0int n =3D (ssl->ssl_peek_avail > len) ? len : ssl->ssl_pe=
ek_avail;
> ++
> ++ =C2=A0 =C2=A0memcpy (buf, ssl->ssl_peek_buffer, n);
> ++
> ++ =C2=A0 =C2=A0if (ssl->ssl_peek_avail > n)
> ++ =C2=A0 =C2=A0 =C2=A0memmove (ssl->ssl_peek_buffer, ssl->ssl_peek_buffe=
r + n, ssl->ssl_peek_avail - n);
> ++
> ++ =C2=A0 =C2=A0ssl->ssl_peek_avail -=3D n;
> ++
> ++ =C2=A0 =C2=A0return n;
> ++ =C2=A0}
> ++
> + =C2=A0 ret =3D gnutls_record_recv (ssl->gnutls_state, buf, len);
> + =C2=A0 ssl->last_error =3D ret;
> +
> +Index: gnutls-1.6.0/includes/gnutls/openssl.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnutls-1.6.0.orig/libextra/includes/gnutls/openssl.h =C2=A0 =C2=A0 =
=C2=A0 2006-03-08 11:44:58.000000000 +0100
> ++++ gnutls-1.6.0/libextra/includes/gnutls/openssl.h =C2=A0 =C2=A02006-12=
-12 15:07:26.032227000 +0100
> +@@ -164,6 +164,11 @@
> +
> + =C2=A0 =C2=A0 gnutls_transport_ptr_t rfd;
> + =C2=A0 =C2=A0 gnutls_transport_ptr_t wfd;
> ++
> ++ =C2=A0 =C2=A0char *ssl_peek_buffer;
> ++ =C2=A0 =C2=A0size_t ssl_peek_buffer_size;
> ++ =C2=A0 =C2=A0size_t ssl_peek_avail;
> ++
> + =C2=A0 };
> +
> + #define rbio gnutls_state
> diff --git a/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-texinfo-eu=
ro.patch b/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-texinfo-euro.p=
atch
> new file mode 100644
> index 0000000..10e3774
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls-2.12.19/gnutls-texinfo-euro.patc=
h
> @@ -0,0 +1,18 @@
> +Upstream-Status: Backport
> +
> +The version of texinfo in Debian Sarge does not understand the @euro{} c=
ommand.
> +This patch replaces the @euro{} command with the word "euro".
> +
> +--- gnutls-1.3.5/doc/gnutls.texi.orig =C2=A02006-04-26 08:06:40.91826800=
0 +0930
> ++++ gnutls-1.3.5/doc/gnutls.texi =C2=A0 =C2=A0 =C2=A0 2006-04-26 08:06:5=
2.446515440 +0930
> +@@ -11,8 +11,8 @@
> + long as it is difficult enough to generate two different messages with
> + the same hash algorithm output. In that case the same signature could
> + be used as a proof for both messages. Nobody wants to sign an innocent
> +-message of donating 1 @euro{} to Greenpeace and find out that he
> +-donated 1.000.000 @euro{} to Bad Inc.
> ++message of donating 1 euro to Greenpeace and find out that he
> ++donated 1.000.000 euro to Bad Inc.
> +
> + For a hash algorithm to be called cryptographic the following three
> + requirements must hold
> diff --git a/meta/recipes-support/gnutls/gnutls_2.12.18.bb b/meta/recipes=
-support/gnutls/gnutls_2.12.18.bb
> deleted file mode 100644
> index 7355855..0000000
> --- a/meta/recipes-support/gnutls/gnutls_2.12.18.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -require gnutls.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI +=3D "file://gnutls-openssl.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://correct_rpl_gettimeofda=
y_signature.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure-fix.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> -
> -SRC_URI[md5sum] =3D "e9215d00d2930e09bc8f23f02b54f2d1"
> -SRC_URI[sha256sum] =3D "780b12e3f05191316390611a3d9d982d29ca3f3abc234517=
b2fc542064b6f07a"
> -
> -python() {
> - =C2=A0 =C2=A0if not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").fin=
d("GPLv3") !=3D -1):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0# if GPLv3 add patch
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0src_uri =3D (d.getVar("SRC_URI", False) or "=
").split()
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0src_uri.append("file://fix-gettext-version.p=
atch")
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar("SRC_URI", " ".join(src_uri))
> -}
> diff --git a/meta/recipes-support/gnutls/gnutls_2.12.19.bb b/meta/recipes=
-support/gnutls/gnutls_2.12.19.bb
> new file mode 100644
> index 0000000..7d76510
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls_2.12.19.bb
> @@ -0,0 +1,19 @@
> +require gnutls.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI +=3D "file://gnutls-openssl.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://correct_rpl_gettimeofda=
y_signature.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure-fix.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> +
> +SRC_URI[md5sum] =3D "14228b34e3d8ed176a617df40693b441"
> +SRC_URI[sha256sum] =3D "8f167b39de4e2fddd83f7e29c98ce2e7fc76f4d79ccf4d3d=
66d1379b971160ec"
> +
> +python() {
> + =C2=A0 =C2=A0if not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").fin=
d("GPLv3") !=3D -1):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# if GPLv3 add patch
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0src_uri =3D (d.getVar("SRC_URI", False) or "=
").split()
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0src_uri.append("file://fix-gettext-version.p=
atch")
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar("SRC_URI", " ".join(src_uri))
> +}
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


