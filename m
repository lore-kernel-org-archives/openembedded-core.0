Return-Path: <jpewhacker@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7BE7549F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Apr 2018 13:36:21 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id 126-v6so3611911oig.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Apr 2018 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UdJxZCcazq+Ksm9ZLyhpD93Ga2JKuOLCldonCYRQaU8=;
	b=BmBDIz1iPXX7jOX0gv8D6DZdWuZPfkPn3D7/Qa83x4F4vsLPiPwD1zonviDkv+U9xE
	CAT2ZjlIXQ8uFpdYagk7KYLIsSnhWX3qiopLGvMcXk5awRc7SOG5brrkAa9Ve16FK0CW
	4QPj9MlhMlmP0EaznBaXPs+a5X+WQsLKFz+O+VwuBkZrUYJupC9n2HutgDUo+pNHjvxk
	AdlmhCGGqtrVWo8GsM7UThgfylCZZR13A/SQLLMFQxDrYnHJatLSyNv7CNQn92xXK7Fv
	GyqB8j2i37f/4M+5FJTPIBKBnME1rZGI18J9u2BCvKoMjJB3jlqTe6dBw4PJSnqEJks2
	63jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UdJxZCcazq+Ksm9ZLyhpD93Ga2JKuOLCldonCYRQaU8=;
	b=hmfyb5kTns9xQMcafgC/1Vbj7Swig0pJeGRutMlYhbxB/tdKflAveNH0dEEmHNIW2c
	HIWSRUu8OT/kKX6p5wG0ImvrksnDPZISVCXQWSFkGpN8i6MLAJ/FbiHDVxdBCoBCW5V/
	KZgLP7yHDa4FdZatNXCEwvDFzo/R1isn0t59hKV5PtsKP9LrbK4Re7Y2zt4mq9JUsJgh
	T3PsORn68EqCVmDGEkw43jyzCgiwLiBM+fS8jpFqhrl8iDOfpj6I5HBoG+uJKNCYgVwl
	4f/ORRGM79rDhj0rSr4nPaUpbmwe3eOIzIM1brlCyxMqknlcIB/5NaJcqkTxfghltogy
	+nVQ==
X-Gm-Message-State: AElRT7Fa5Bgs6cf3Z4rgYdcDDvU4k4y6V/588Tgx4fhq1sTPW0w4LWKz
	mKxiWTS+PwZfvMux92J71iD4Ptn5LBk4EVJpNWA=
X-Google-Smtp-Source: AIpwx4/RAp0mEvsmZqNyifsL2UeiUyYM5lTUt37ZeW4t8dRrnjGEiW2E1yFe4nsvY5pEu1ej8th17EF1jrTNXePzGFw=
X-Received: by 2002:aca:cf51:: with SMTP id
	f78-v6mr18674748oig.89.1523108181935; 
	Sat, 07 Apr 2018 06:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <1523097831-31184-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1523097831-31184-3-git-send-email-richard.purdie@linuxfoundation.org>
In-Reply-To: <1523097831-31184-3-git-send-email-richard.purdie@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 07 Apr 2018 13:36:11 +0000
Message-ID: <CAJdd5GbOcVGfGa4BSm6N0q2ffO9PzpOZnRx1s4_eQsz+f6yXcA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead
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
X-List-Received-Date: Sat, 07 Apr 2018 13:36:21 -0000
Content-Type: multipart/alternative; boundary="00000000000023898d0569424206"

--00000000000023898d0569424206
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 7, 2018, 05:44 Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Fedora28[1] has decided to go ahead and use libxcrypt to replace libcrypt
> from glibc
> despite the change not having merged into glibc upstream yet. This breaks
> the use of
> uninative in OE on fedora28 since binaries there are now using new symbol=
s
> only found
> in libxcrypt. libxcrypt is meant to be backwards compatible with libcrypt
> but not the
> reverse.
>
> Since this will impact OE in the next release cycle, this changes
> nativesdk only
> to use this new model and adds libxcrypt to work in that case. This allow=
s
> us to
> build a uninative which is compatible with fedora28 and previous other
> OSes.
>
> In order to work, recipes will now need to depend on virtual/crypt where
> they use
> libcrypt since its now a separate library and we can't depend on it from
> glibc to
> preseve backwards compatibility since glibc needs to build first. For now=
,
> only the
> problematic nativesdk recipes have been fixed up. For target use, the
> default
> provider remains glibc for now. Assuming this change is merged into
> upstream glibc,
> we will need to roll this change out for the target but we will do this i=
n
> the next
> release cycle when we can better deal with the resulting bugs.
>

Of course, after this I finished, I think up a new idea :)

Would it be possible to add libxcrypt to the default dependencies (along
side glibc)? The main advantage I can see is that it would maintain the
"status quo" of libcrypt being there be default. My main observation from
when I went though the exercise of getting this to build last night is that
while we fixed the SDK for core-image-sato, others may be including
additional recipes in their SDK that depend on libcrypt and these can fail
in non-obvious ways (for example, util-linux would have been very puzzling
to track down if I hadn't know it was related to the libcrypt changes).

We would obviously remove it in the next dev cycle and make the recipes fix
their DEPENDS, like we are already planning to do.

It might even be possible to switch the target to using libxcrypt this way,
but I don't think I would recommend it.

The main disadvantage that I can think of is that the libxcrypt recipe will
be ugly, since it would have to build with INHIBIT_DEFAULT_DEPS=3D1.

I'm not sure I sold myself on this idea. I don't think I know enough about
all the implications and adding additional nativesdk recipes is not very
common, so maybe a blurb in the release notes is sufficent?

Anyway, I thought I would put it out there.

Thanks,
Joshua

>
> [1]
> https://fedoraproject.org/wiki/Changes/Replace_glibc_libcrypt_with_libxcr=
ypt
>
> Original patch from Charles-Antoine Couret <
> charles-antoine.couret@essensium.com>,
> tweaked by RP to add virtual provides, SkipRecipe for libxcrypt and other
> minor
> tweaks.
>
> Signed-off-by: Charles-Antoine Couret <
> charles-antoine.couret@essensium.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/bitbake.conf                             |   1 +
>  meta/recipes-core/glibc/glibc.inc                  |   5 +-
>  .../glibc/0031-nativesdk-deprecate-libcrypt.patch  | 418
> +++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.27.bb              |   1 +
>  meta/recipes-core/glibc/site_config/headers        |   1 -
>  meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb     |  31 ++
>  meta/recipes-core/meta/uninative-tarball.bb        |   1 +
>  meta/recipes-core/util-linux/util-linux.inc        |   2 +-
>  meta/recipes-devtools/perl/perl_5.24.1.bb          |   2 +-
>  meta/recipes-extended/shadow/shadow.inc            |   3 +-
>  10 files changed, 459 insertions(+), 6 deletions(-)
>  create mode 100644
> meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
>  create mode 100644 meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 93f57f3..60590e2 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -187,6 +187,7 @@ ASSUME_PROVIDED =3D "\
>      tar-native \
>      virtual/libintl-native \
>      virtual/libiconv-native \
> +    virtual/crypt-native \
>      texinfo-native \
>      bash-native \
>      sed-native \
> diff --git a/meta/recipes-core/glibc/glibc.inc
> b/meta/recipes-core/glibc/glibc.inc
> index 361a6fd..9e02ffd 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -35,7 +35,10 @@ siteconfig_do_siteconfig_gencache_prepend =3D " \
>  DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial
> linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
>  # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect th=
is
>  #RDEPENDS_${PN} +=3D "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
> -PROVIDES =3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
> +
> +CRYPTPROVIDES =3D "virtual/crypt"
> +CRYPTPROVIDES_class-nativesdk =3D ""
> +PROVIDES =3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc
> ${CRYPTPROVIDES}"
>  PROVIDES +=3D "virtual/libintl virtual/libiconv"
>  inherit autotools texinfo distro_features_check systemd
>
> diff --git
> a/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
> b/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
> new file mode 100644
> index 0000000..6b34c70
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.pat=
ch
> @@ -0,0 +1,418 @@
> +Background information:
> +
> +https://sourceware.org/ml/libc-alpha/2017-08/msg01257.html
> +
> https://fedoraproject.org/wiki/Changes/Replace_glibc_libcrypt_with_libxcr=
ypt
> +
> +Upstream-Status: Submitted [libc-alpha@sourceware.org]
> +
> +From: Zack Weinberg <zackw@panix.com>
> +Subject: [PATCH] Deprecate libcrypt and don't build it by default
> +
> +Back in June, Bj=C3=B6rn Esser proposed to add OpenBSD-compatible bcrypt
> +support to our implementation of crypt(3), and Zack Weinberg replied
> +that it might actually make more sense to _remove_ libcrypt from
> +glibc, freeing up libcrypt.so.1 and crypt.h to be provided by a
> +separate project that could move faster.  (For instance, libxcrypt:
> +https://github.com/besser82/libxcrypt)
> +
> +This patch disables build and installation of libcrypt by default.  It
> +can be re-enabled with --enable-obsolete-crypt to configure.  Unlike
> +libnsl, we do *not* install a runtime shared library; that's left to
> +the replacement.  (Unlike the SunRPC situation, I think we can
> +probably drop this code altogether in a release or two.)
> +
> +The function prototypes for crypt and encrypt are removed from
> +unistd.h, and the function prototype for setkey is removed from
> +stdlib.h; they do *not* come back with --enable-obsolete-crypt.  This
> +means glibc no longer provides the POSIX CRYPT option, and the macro
> +_XOPEN_CRYPT is also removed from unistd.h to indicate that.
> +(_SC_XOPEN_CRYPT is still defined, but sysconf(_SC_XOPEN_CRYPT) will
> +return -1 at runtime.)  These functions are also unconditionally
> +removed from conform/data/{stdlib,unistd}.h-data.
> +
> +       * posix/unistd.h (_XOPEN_CRYPT, crypt, encrypt): Don't declare.
> +       * stdlib/stdlib.h (setkey): Don't declare.
> +
> +       * configure.ac (--enable-obsolete-crypt): New configure option.
> +       * configure: Regenerate.
> +       * config.make.in (build-obsolete-crypt): New makefile variable.
> +       * crypt/Banner: Delete file.
> +       * crypt/Makefile: Don't build anything unless
> +       $(build-obsolete-crypt) is 'yes'.
> +       * sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile: Only add thin=
gs
> +       to libcrypt-sysdep_routines when $(build-obsolete-crypt) is 'yes'=
.
> +       * sysdeps/sparc/sparc64/multiarch/Makefile: Likewise.
> +       * sysdeps/unix/sysv/linux/arm/Makefile: Likewise.
> +
> +       * conform/Makefile: Only include libcrypt.a in linknamespace test=
s
> +       when $(build-obsolete-crypt) is 'yes'.
> +       * conform/data/stdlib.h-data (setkey): Don't expect.
> +       * conform/data/unistd.h-data (crypt, encrypt): Don't expect.
> +       * elf/Makefile: Only perform various tests of
> libcrypt.so/libcrypt.a
> +       when $(build-obsolete-crypt) is 'yes'.
> +       * elf/tst-linkall-static.c: Don't include crypt.h when USE_CRYPT
> +       is false.
> +---
> + NEWS                                             | 18 +++++++++++++++++=
+
> + config.make.in                                   |  1 +
> + configure                                        | 13 +++++++++++++
> + configure.ac                                     |  8 ++++++++
> + conform/Makefile                                 | 14 ++++++++++----
> + conform/data/stdlib.h-data                       |  3 ---
> + conform/data/unistd.h-data                       |  6 ------
> + crypt/Makefile                                   |  5 +++++
> + elf/Makefile                                     | 16 ++++++++++++----
> + elf/tst-linkall-static.c                         |  2 ++
> + posix/unistd.h                                   | 16 ----------------
> + stdlib/stdlib.h                                  |  6 ------
> + sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile |  2 ++
> + sysdeps/sparc/sparc64/multiarch/Makefile         |  2 ++
> + sysdeps/unix/sysv/linux/arm/Makefile             |  2 ++
> + 15 files changed, 75 insertions(+), 39 deletions(-)
> +
> +diff --git a/config.make.in b/config.make.in
> +index 9e5e24b2c6..8fe610d04d 100644
> +--- a/config.make.in
> ++++ b/config.make.in
> +@@ -82,6 +82,7 @@ mach-interface-list =3D @mach_interface_list@
> +
> + experimental-malloc =3D @experimental_malloc@
> +
> ++build-obsolete-crypt =3D @build_obsolete_crypt@
> + nss-crypt =3D @libc_cv_nss_crypt@
> + static-nss-crypt =3D @libc_cv_static_nss_crypt@
> +
> +diff --git a/configure b/configure
> +index 7a8bd3f817..46f6bd7f86 100755
> +--- a/configure
> ++++ b/configure
> +@@ -672,6 +672,7 @@ base_machine
> + have_tunables
> + build_pt_chown
> + build_nscd
> ++build_obsolete_crypt
> + build_obsolete_nsl
> + link_obsolete_rpc
> + libc_cv_static_nss_crypt
> +@@ -782,6 +783,7 @@ enable_experimental_malloc
> + enable_nss_crypt
> + enable_obsolete_rpc
> + enable_obsolete_nsl
> ++enable_obsolete_crypt
> + enable_systemtap
> + enable_build_nscd
> + enable_nscd
> +@@ -1453,6 +1455,7 @@ Optional Features:
> +                           link-time usage
> +   --enable-obsolete-nsl   build and install the obsolete libnsl library
> and
> +                           depending NSS modules
> ++  --enable-obsolete-crypt build and install the obsolete libcrypt libra=
ry
> +   --enable-systemtap      enable systemtap static probe points
> [default=3Dno]
> +   --disable-build-nscd    disable building and installing the nscd daem=
on
> +   --disable-nscd          library functions will not contact the nscd
> daemon
> +@@ -3632,6 +3635,16 @@ if test "$build_obsolete_nsl" =3D yes; then
> +
> + fi
> +
> ++# Check whether --enable-obsolete-crypt was given.
> ++if test "${enable_obsolete_crypt+set}" =3D set; then :
> ++  enableval=3D$enable_obsolete_crypt; build_obsolete_crypt=3D$enableval
> ++else
> ++  build_obsolete_crypt=3Dno
> ++fi
> ++
> ++
> ++
> ++
> + # Check whether --enable-systemtap was given.
> + if test "${enable_systemtap+set}" =3D set; then :
> +   enableval=3D$enable_systemtap; systemtap=3D$enableval
> +diff --git a/configure.ac b/configure.ac
> +index ca1282a6b3..0142353740 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -378,6 +378,14 @@ if test "$build_obsolete_nsl" =3D yes; then
> +   AC_DEFINE(LINK_OBSOLETE_NSL)
> + fi
> +
> ++AC_ARG_ENABLE([obsolete-crypt],
> ++              AC_HELP_STRING([--enable-obsolete-crypt],
> ++                             [build and install the obsolete libcrypt
> library]),
> ++              [build_obsolete_crypt=3D$enableval],
> ++              [build_obsolete_crypt=3Dno])
> ++AC_SUBST(build_obsolete_crypt)
> ++
> ++
> + AC_ARG_ENABLE([systemtap],
> +               [AS_HELP_STRING([--enable-systemtap],
> +              [enable systemtap static probe points @<:@default=3Dno@
> :>@])],
> +diff --git a/conform/Makefile b/conform/Makefile
> +index 864fdeca21..5ef474fb24 100644
> +--- a/conform/Makefile
> ++++ b/conform/Makefile
> +@@ -193,22 +193,28 @@ linknamespace-libs-thr =3D $(linknamespace-libs-is=
oc)
> \
> +                        $(common-objpfx)rt/librt.a
> $(static-thread-library)
> + linknamespace-libs-posix =3D $(linknamespace-libs-thr) \
> +                          $(common-objpfx)dlfcn/libdl.a
> +-linknamespace-libs-xsi =3D $(linknamespace-libs-posix) \
> +-                       $(common-objpfx)crypt/libcrypt.a
> ++linknamespace-libs-xsi =3D $(linknamespace-libs-posix)
> + linknamespace-libs-ISO =3D $(linknamespace-libs-isoc)
> + linknamespace-libs-ISO99 =3D $(linknamespace-libs-isoc)
> + linknamespace-libs-ISO11 =3D $(linknamespace-libs-isoc)
> +-linknamespace-libs-XPG4 =3D $(linknamespace-libs-isoc) \
> +-                        $(common-objpfx)crypt/libcrypt.a
> ++linknamespace-libs-XPG4 =3D $(linknamespace-libs-isoc)
> + linknamespace-libs-XPG42 =3D $(linknamespace-libs-XPG4)
> + linknamespace-libs-POSIX =3D $(linknamespace-libs-thr)
> + linknamespace-libs-UNIX98 =3D $(linknamespace-libs-xsi)
> + linknamespace-libs-XOPEN2K =3D $(linknamespace-libs-xsi)
> + linknamespace-libs-POSIX2008 =3D $(linknamespace-libs-posix)
> + linknamespace-libs-XOPEN2K8 =3D $(linknamespace-libs-xsi)
> ++
> ++ifeq ($(build-obsolete-crypt),yes)
> ++linknamespace-libs-xsi +=3D $(common-objpfx)crypt/libcrypt.a
> ++linknamespace-libs-XPG4 +=3D $(common-objpfx)crypt/libcrypt.a
> ++endif
> ++
> + linknamespace-libs =3D $(foreach std,$(conformtest-standards),\
> +                                  $(linknamespace-libs-$(std)))
> +
> ++
> ++
> + $(linknamespace-symlist-stdlibs-tests): $(objpfx)symlist-stdlibs-%: \
> +                                       $(linknamespace-libs)
> +       LC_ALL=3DC $(READELF) -W -s $(linknamespace-libs-$*) > $@; \
> +diff --git a/conform/data/stdlib.h-data b/conform/data/stdlib.h-data
> +index d8fcccc2fb..6913828196 100644
> +--- a/conform/data/stdlib.h-data
> ++++ b/conform/data/stdlib.h-data
> +@@ -149,9 +149,6 @@ function {unsigned short int*} seed48 (unsigned shor=
t
> int[3])
> + #if !defined ISO && !defined ISO99 && !defined ISO11 && !defined POSIX
> && !defined XPG4 && !defined XPG42 && !defined UNIX98
> + function int setenv (const char*, const char*, int)
> + #endif
> +-#if !defined ISO && !defined ISO99 && !defined ISO11 && !defined POSIX
> && !defined POSIX2008
> +-function void setkey (const char*)
> +-#endif
> + #if !defined ISO && !defined ISO99 && !defined ISO11 && !defined XPG4 &=
&
> !defined POSIX && !defined POSIX2008
> + function {char*} setstate (char*)
> + #endif
> +diff --git a/conform/data/unistd.h-data b/conform/data/unistd.h-data
> +index ddf4f25132..aa070528e8 100644
> +--- a/conform/data/unistd.h-data
> ++++ b/conform/data/unistd.h-data
> +@@ -437,9 +437,6 @@ function int chroot (const char*)
> + function int chown (const char*, uid_t, gid_t)
> + function int close (int)
> + function size_t confstr (int, char*, size_t)
> +-#if !defined POSIX && !defined POSIX2008
> +-function {char*} crypt (const char*, const char*)
> +-#endif
> + #if defined XPG4 || defined XPG42 || defined UNIX98
> + function {char*} ctermid (char*)
> + function {char*} cuserid (char*)
> +@@ -449,9 +446,6 @@ allow cuserid
> + #endif
> + function int dup (int)
> + function int dup2 (int, int)
> +-#if !defined POSIX && !defined POSIX2008
> +-function void encrypt (char[64], int)
> +-#endif
> + function int execl (const char*, const char*, ...)
> + function int execle (const char*, const char*, ...)
> + function int execlp (const char*, const char*, ...)
> +diff --git a/crypt/Makefile b/crypt/Makefile
> +index 303800df73..024ec2c6ab 100644
> +--- a/crypt/Makefile
> ++++ b/crypt/Makefile
> +@@ -22,6 +22,8 @@ subdir       :=3D crypt
> +
> + include ../Makeconfig
> +
> ++ifeq ($(build-obsolete-crypt),yes)
> ++
> + headers :=3D crypt.h
> +
> + extra-libs :=3D libcrypt
> +@@ -52,9 +54,11 @@ tests +=3D md5test sha256test sha512test
> + # machine over a minute.
> + xtests =3D md5test-giant
> + endif
> ++endif
> +
> + include ../Rules
> +
> ++ifeq ($(build-obsolete-crypt),yes)
> + ifneq ($(nss-crypt),yes)
> + md5-routines :=3D md5 $(filter md5%,$(libcrypt-sysdep_routines))
> + sha256-routines :=3D sha256 $(filter sha256%,$(libcrypt-sysdep_routines=
))
> +@@ -71,3 +75,4 @@ $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.so
> + else
> + $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.a
> + endif
> ++endif
> +diff --git a/elf/Makefile b/elf/Makefile
> +index 2a432d8bee..366f7b80ec 100644
> +--- a/elf/Makefile
> ++++ b/elf/Makefile
> +@@ -385,15 +385,19 @@ $(objpfx)tst-_dl_addr_inside_object:
> $(objpfx)dl-addr-obj.os
> + CFLAGS-tst-_dl_addr_inside_object.c +=3D $(PIE-ccflag)
> + endif
> +
> +-# By default tst-linkall-static should try to use crypt routines to tes=
t
> +-# static libcrypt use.
> +-CFLAGS-tst-linkall-static.c +=3D -DUSE_CRYPT=3D1
> ++ifeq ($(build-obsolete-crypt),yes)
> ++# If the libcrypt library is being built, tst-linkall-static should
> ++# try to use crypt routines to test static libcrypt use.
> ++CFLAGS-tst-linkall-static.c =3D -DUSE_CRYPT=3D1
> + # However, if we are using NSS crypto and we don't have a static
> + # library, then we exclude the use of crypt functions in the test.
> + # We similarly exclude libcrypt.a from the static link (see below).
> + ifeq (yesno,$(nss-crypt)$(static-nss-crypt))
> + CFLAGS-tst-linkall-static.c +=3D -UUSE_CRYPT -DUSE_CRYPT=3D0
> + endif
> ++else
> ++CFLAGS-tst-linkall-static.c =3D -DUSE_CRYPT=3D0
> ++endif
> +
> + include ../Rules
> +
> +@@ -1113,8 +1117,10 @@ localplt-built-dso :=3D $(addprefix
> $(common-objpfx),\
> +                                 rt/librt.so \
> +                                 dlfcn/libdl.so \
> +                                 resolv/libresolv.so \
> +-                                crypt/libcrypt.so \
> +                      )
> ++ifeq ($(build-obsolete-crypt),yes)
> ++localplt-built-dso +=3D $(addprefix $(common-objpfx), crypt/libcrypt.so=
)
> ++endif
> + ifeq ($(build-mathvec),yes)
> + localplt-built-dso +=3D $(addprefix $(common-objpfx), mathvec/libmvec.s=
o)
> + endif
> +@@ -1395,6 +1401,7 @@ $(objpfx)tst-linkall-static: \
> +   $(common-objpfx)resolv/libanl.a \
> +   $(static-thread-library)
> +
> ++ifeq ($(build-obsolete-crypt),yes)
> + # If we are using NSS crypto and we have the ability to link statically
> + # then we include libcrypt.a, otherwise we leave out libcrypt.a and
> + # link as much as we can into the tst-linkall-static test.  This assume=
s
> +@@ -1410,6 +1417,7 @@ ifeq (no,$(nss-crypt))
> + $(objpfx)tst-linkall-static: \
> +   $(common-objpfx)crypt/libcrypt.a
> + endif
> ++endif
> +
> + # The application depends on the DSO, and the DSO loads the plugin.
> + # The plugin also depends on the DSO. This creates the circular
> +diff --git a/elf/tst-linkall-static.c b/elf/tst-linkall-static.c
> +index e8df38f74e..0ffae7c723 100644
> +--- a/elf/tst-linkall-static.c
> ++++ b/elf/tst-linkall-static.c
> +@@ -18,7 +18,9 @@
> +
> + #include <math.h>
> + #include <pthread.h>
> ++#if USE_CRYPT
> + #include <crypt.h>
> ++#endif
> + #include <resolv.h>
> + #include <dlfcn.h>
> + #include <utmp.h>
> +diff --git a/posix/unistd.h b/posix/unistd.h
> +index 4d149f9945..e75ce4d4ec 100644
> +--- a/posix/unistd.h
> ++++ b/posix/unistd.h
> +@@ -107,9 +107,6 @@ __BEGIN_DECLS
> + /* The X/Open Unix extensions are available.  */
> + #define _XOPEN_UNIX   1
> +
> +-/* Encryption is present.  */
> +-#define       _XOPEN_CRYPT    1
> +-
> + /* The enhanced internationalization capabilities according to XPG4.2
> +    are present.  */
> + #define       _XOPEN_ENH_I18N 1
> +@@ -1118,20 +1115,7 @@ ssize_t copy_file_range (int __infd, __off64_t
> *__pinoff,
> + extern int fdatasync (int __fildes);
> + #endif /* Use POSIX199309 */
> +
> +-
> +-/* XPG4.2 specifies that prototypes for the encryption functions must
> +-   be defined here.  */
> + #ifdef        __USE_XOPEN
> +-/* Encrypt at most 8 characters from KEY using salt to perturb DES.  */
> +-extern char *crypt (const char *__key, const char *__salt)
> +-     __THROW __nonnull ((1, 2));
> +-
> +-/* Encrypt data in BLOCK in place if EDFLAG is zero; otherwise decrypt
> +-   block in place.  */
> +-extern void encrypt (char *__glibc_block, int __edflag)
> +-     __THROW __nonnull ((1));
> +-
> +-
> + /* Swab pairs bytes in the first N bytes of the area pointed to by
> +    FROM and copy the result to TO.  The value of TO must not be in the
> +    range [FROM - N + 1, FROM - 1].  If N is odd the first byte in FROM
> +diff --git a/stdlib/stdlib.h b/stdlib/stdlib.h
> +index 6b1ead31e0..8e23e93557 100644
> +--- a/stdlib/stdlib.h
> ++++ b/stdlib/stdlib.h
> +@@ -958,12 +958,6 @@ extern int getsubopt (char **__restrict __optionp,
> + #endif
> +
> +
> +-#ifdef __USE_XOPEN
> +-/* Setup DES tables according KEY.  */
> +-extern void setkey (const char *__key) __THROW __nonnull ((1));
> +-#endif
> +-
> +-
> + /* X/Open pseudo terminal handling.  */
> +
> + #ifdef __USE_XOPEN2KXSI
> +diff --git a/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
> b/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
> +index a6d08f3a00..d8b8297fb0 100644
> +--- a/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
> ++++ b/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile
> +@@ -1,6 +1,8 @@
> + ifeq ($(subdir),crypt)
> ++ifeq ($(build-obsolete-crypt),yes)
> + libcrypt-sysdep_routines +=3D md5-crop sha256-crop sha512-crop
> + endif
> ++endif
> +
> + ifeq ($(subdir),locale)
> + localedef-aux +=3D md5-crop
> +diff --git a/sysdeps/sparc/sparc64/multiarch/Makefile
> b/sysdeps/sparc/sparc64/multiarch/Makefile
> +index eaf758e7aa..0198f9886f 100644
> +--- a/sysdeps/sparc/sparc64/multiarch/Makefile
> ++++ b/sysdeps/sparc/sparc64/multiarch/Makefile
> +@@ -1,6 +1,8 @@
> + ifeq ($(subdir),crypt)
> ++ifeq ($(build-obsolete-crypt),yes)
> + libcrypt-sysdep_routines +=3D md5-crop sha256-crop sha512-crop
> + endif
> ++endif
> +
> + ifeq ($(subdir),locale)
> + localedef-aux +=3D md5-crop
> +diff --git a/sysdeps/unix/sysv/linux/arm/Makefile
> b/sysdeps/unix/sysv/linux/arm/Makefile
> +index 4adc35de04..6cab4f3a31 100644
> +--- a/sysdeps/unix/sysv/linux/arm/Makefile
> ++++ b/sysdeps/unix/sysv/linux/arm/Makefile
> +@@ -19,8 +19,10 @@ endif
> + # Add a syscall function to each library that needs one.
> +
> + ifeq ($(subdir),crypt)
> ++ifeq ($(build-obsolete-crypt),yes)
> + libcrypt-sysdep_routines +=3D libc-do-syscall
> + endif
> ++endif
> +
> + ifeq ($(subdir),rt)
> + librt-sysdep_routines +=3D libc-do-syscall
> +--
> +2.16.0
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.27.bb
> b/meta/recipes-core/glibc/glibc_2.27.bb
> index 772351a..c814798 100644
> --- a/meta/recipes-core/glibc/glibc_2.27.bb
> +++ b/meta/recipes-core/glibc/glibc_2.27.bb
> @@ -54,6 +54,7 @@ NATIVESDKFIXES_class-nativesdk =3D "\
>
> file://0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch \
>             file://0004-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patc=
h
> \
>             file://relocate-locales.patch \
> +           file://0031-nativesdk-deprecate-libcrypt.patch \
>  "
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-core/glibc/site_config/headers
> b/meta/recipes-core/glibc/site_config/headers
> index 609ab53..69fedea 100644
> --- a/meta/recipes-core/glibc/site_config/headers
> +++ b/meta/recipes-core/glibc/site_config/headers
> @@ -9,7 +9,6 @@ asm/page.h
>  asm/types.h
>  assert.h
>  byteswap.h
> -crypt.h
>  ctype.h
>  dirent.h
>  dlfcn.h
> diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
> b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
> new file mode 100644
> index 0000000..b1982c1
> --- /dev/null
> +++ b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
> @@ -0,0 +1,31 @@
> +SUMMARY =3D "Extended cryptographic library (from glibc)"
> +DESCRIPTION =3D "Forked code from glibc libary to extract only crypto pa=
rt."
> +HOMEPAGE =3D "https://github.com/besser82/libxcrypt"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM ?=3D
> "file://LICENSING;md5=3Dd1cc18f512ded3bd6000f3729f31be08 \
> +      file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c \
> +"
> +
> +inherit autotools
> +
> +SRCREV ?=3D "215b32aa4e0b255c3356a96bd6d257661bad73ca"
> +SRCBRANCH ?=3D "master"
> +
> +SRC_URI =3D "git://github.com/besser82/libxcrypt.git;branch=3D${SRCBRANC=
H}
> <http://github.com/besser82/libxcrypt.git;branch=3D$%7BSRCBRANCH%7D>"
> +
> +PROVIDES =3D "virtual/crypt"
> +
> +FILES_${PN} =3D "${libdir}/libcrypt*.so.* ${libdir}/libcrypt-*.so
> ${libdir}/libowcrypt*.so.* ${libdir}/libowcrypt-*.so"
> +
> +S =3D "${WORKDIR}/git"
> +
> +BUILD_CPPFLAGS =3D "-I${STAGING_INCDIR_NATIVE}"
> +TARGET_CPPFLAGS =3D "-I${STAGING_DIR_TARGET}${includedir}"
> +
> +python () {
> +    if not bb.data.inherits_class('nativesdk', d):
> +        raise bb.parse.SkipRecipe("Recipe only applies in nativesdk case
> for now")
> +}
> +
> +BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta/recipes-core/meta/uninative-tarball.bb
> b/meta/recipes-core/meta/uninative-tarball.bb
> index 5fabf7f..38c3a31 100644
> --- a/meta/recipes-core/meta/uninative-tarball.bb
> +++ b/meta/recipes-core/meta/uninative-tarball.bb
> @@ -13,6 +13,7 @@ TOOLCHAIN_HOST_TASK =3D "\
>      nativesdk-glibc-gconv-utf-16 \
>      nativesdk-glibc-gconv-cp1252 \
>      nativesdk-patchelf \
> +    nativesdk-libxcrypt \
>      "
>
>  INHIBIT_DEFAULT_DEPS =3D "1"
> diff --git a/meta/recipes-core/util-linux/util-linux.inc
> b/meta/recipes-core/util-linux/util-linux.inc
> index 5e40b20..157416d 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM =3D
> "file://README.licensing;md5=3D1715f5ee3e01203ca1e1e0b9ee65918c
>
>  #gtk-doc is not enabled as it requires xmlto which requires util-linux
>  inherit autotools gettext pkgconfig systemd update-alternatives
> python3-dir bash-completion ptest
> -DEPENDS =3D "zlib ncurses"
> +DEPENDS =3D "zlib ncurses virtual/crypt"
>  DEPENDS_append_class-native =3D " lzo-native"
>  DEPENDS_append_class-nativesdk =3D " lzo-native"
>
> diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb
> b/meta/recipes-devtools/perl/perl_5.24.1.bb
> index 66ccd7f..222dd88 100644
> --- a/meta/recipes-devtools/perl/perl_5.24.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
> @@ -1,7 +1,7 @@
>  require perl.inc
>
>  # We need gnugrep (for -I)
> -DEPENDS =3D "db grep-native gdbm zlib"
> +DEPENDS =3D "db grep-native gdbm zlib virtual/crypt"
>
>  # Pick up patches from debian
>  #
> http://ftp.de.debian.org/debian/pool/main/p/perl/perl_5.22.0-1.debian.tar=
.xz
> diff --git a/meta/recipes-extended/shadow/shadow.inc
> b/meta/recipes-extended/shadow/shadow.inc
> index 48a3be8..673207f 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -6,8 +6,7 @@ LICENSE =3D "BSD | Artistic-1.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ded80ff1c2b40843cf5768e5229cf1=
6e5 \
>
>  file://src/passwd.c;beginline=3D8;endline=3D30;md5=3Dd83888ea14ae6195198=
2d77125947661"
>
> -DEPENDS_class-native =3D ""
> -DEPENDS_class-nativesdk =3D ""
> +DEPENDS =3D "virtual/crypt"
>
>  SRC_URI =3D "
> http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
>             file://shadow-4.1.3-dots-in-usernames.patch \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000023898d0569424206
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Sat, Apr 7, 2018, 05:44 Richard Purdie &lt;<a href=3D"mailto:richard.pur=
die@linuxfoundation.org" rel=3D"noreferrer noreferrer noreferrer" target=3D=
"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Fedora28[1] has decided to go ahead and use libxcry=
pt to replace libcrypt from glibc<br>
despite the change not having merged into glibc upstream yet. This breaks t=
he use of<br>
uninative in OE on fedora28 since binaries there are now using new symbols =
only found<br>
in libxcrypt. libxcrypt is meant to be backwards compatible with libcrypt b=
ut not the<br>
reverse.<br>
<br>
Since this will impact OE in the next release cycle, this changes nativesdk=
 only<br>
to use this new model and adds libxcrypt to work in that case. This allows =
us to<br>
build a uninative which is compatible with fedora28 and previous other OSes=
.<br>
<br>
In order to work, recipes will now need to depend on virtual/crypt where th=
ey use<br>
libcrypt since its now a separate library and we can&#39;t depend on it fro=
m glibc to<br>
preseve backwards compatibility since glibc needs to build first. For now, =
only the<br>
problematic nativesdk recipes have been fixed up. For target use, the defau=
lt<br>
provider remains glibc for now. Assuming this change is merged into upstrea=
m glibc,<br>
we will need to roll this change out for the target but we will do this in =
the next<br>
release cycle when we can better deal with the resulting bugs.<br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div><div =
dir=3D"auto">Of course, after this I finished, I think up a new idea :)</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Would it be possible to add=
 libxcrypt to the default dependencies (along side glibc)? The main advanta=
ge I can see is that it would maintain the &quot;status quo&quot; of libcry=
pt being there be default. My main observation from when I went though the =
exercise of getting this to build last night is that while we fixed the SDK=
 for core-image-sato, others may be including additional recipes in their S=
DK that depend on libcrypt and these can fail in non-obvious ways (for exam=
ple, util-linux would have been very puzzling to track down if I hadn&#39;t=
 know it was related to the libcrypt changes).</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">We would obviously remove it in the next dev cycle a=
nd make the recipes fix their DEPENDS, like we are already planning to do.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">It might even be possibl=
e to switch the target to using libxcrypt this way, but I don&#39;t think I=
 would recommend it.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The=
 main disadvantage that I can think of is that the libxcrypt recipe will be=
 ugly, since it would have to build with=C2=A0<span style=3D"font-family:sa=
ns-serif">INHIBIT_DEFAULT_DEPS=3D1.</span></div><div dir=3D"auto"><span sty=
le=3D"font-family:sans-serif"><br></span></div><div dir=3D"auto"><span styl=
e=3D"font-family:sans-serif">I&#39;m not sure I sold myself on this idea. I=
 don&#39;t think I know enough about all the implications and adding additi=
onal nativesdk recipes is not very common, so maybe a blurb in the release =
notes is sufficent?</span></div><div dir=3D"auto"><span style=3D"font-famil=
y:sans-serif"><br></span></div><div dir=3D"auto"><span style=3D"font-family=
:sans-serif">Anyway, I thought I would put it out there.</span></div><div d=
ir=3D"auto"><span style=3D"font-family:sans-serif"><br></span></div><div di=
r=3D"auto"><span style=3D"font-family:sans-serif">Thanks,</span></div><div =
dir=3D"auto"><span style=3D"font-family:sans-serif">Joshua</span></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br=
>
[1] <a href=3D"https://fedoraproject.org/wiki/Changes/Replace_glibc_libcryp=
t_with_libxcrypt" rel=3D"noreferrer noreferrer noreferrer noreferrer norefe=
rrer" target=3D"_blank">https://fedoraproject.org/wiki/Changes/Replace_glib=
c_libcrypt_with_libxcrypt</a><br>
<br>
Original patch from Charles-Antoine Couret &lt;<a href=3D"mailto:charles-an=
toine.couret@essensium.com" rel=3D"noreferrer noreferrer noreferrer norefer=
rer" target=3D"_blank">charles-antoine.couret@essensium.com</a>&gt;,<br>
tweaked by RP to add virtual provides, SkipRecipe for libxcrypt and other m=
inor<br>
tweaks.<br>
<br>
Signed-off-by: Charles-Antoine Couret &lt;<a href=3D"mailto:charles-antoine=
.couret@essensium.com" rel=3D"noreferrer noreferrer noreferrer noreferrer" =
target=3D"_blank">charles-antoine.couret@essensium.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"=
_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 =
+<br>
=C2=A0meta/recipes-core/glibc/glibc.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A0.../glibc/0031-nativesdk-deprecate-libcrypt.patch=C2=A0 | 418 +++++++=
++++++++++++++<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.27.bb" rel=3D"noref=
errer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">glibc_=
2.27.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01=
 +<br>
=C2=A0meta/recipes-core/glibc/site_config/headers=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 -<br>
=C2=A0meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt_4.0.0.bb" rel=
=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blan=
k">libxcrypt_4.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 31 ++<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://uninative-tarball.bb" rel=3D=
"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">=
uninative-tarball.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-core/util-linux/util-linux.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=3D"n=
oreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">pe=
rl_5.24.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-extended/shadow/shadow.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A010 files changed, 459 insertions(+), 6 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0031-nativesdk-depre=
cate-libcrypt.patch<br>
=C2=A0create mode 100644 meta/recipes-core/libxcrypt/<a href=3D"http://libx=
crypt_4.0.0.bb" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferr=
er" target=3D"_blank">libxcrypt_4.0.0.bb</a><br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 93f57f3..60590e2 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -187,6 +187,7 @@ ASSUME_PROVIDED =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0tar-native \<br>
=C2=A0 =C2=A0 =C2=A0virtual/libintl-native \<br>
=C2=A0 =C2=A0 =C2=A0virtual/libiconv-native \<br>
+=C2=A0 =C2=A0 virtual/crypt-native \<br>
=C2=A0 =C2=A0 =C2=A0texinfo-native \<br>
=C2=A0 =C2=A0 =C2=A0bash-native \<br>
=C2=A0 =C2=A0 =C2=A0sed-native \<br>
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/gl=
ibc.inc<br>
index 361a6fd..9e02ffd 100644<br>
--- a/meta/recipes-core/glibc/glibc.inc<br>
+++ b/meta/recipes-core/glibc/glibc.inc<br>
@@ -35,7 +35,10 @@ siteconfig_do_siteconfig_gencache_prepend =3D &quot; \<b=
r>
=C2=A0DEPENDS =3D &quot;virtual/${TARGET_PREFIX}gcc-initial libgcc-initial =
linux-libc-headers virtual/${TARGET_PREFIX}libc-initial&quot;<br>
=C2=A0# nptl needs libgcc but dlopens it, so our shlibs code doesn&#39;t de=
tect this<br>
=C2=A0#RDEPENDS_${PN} +=3D &quot;${@[&#39;&#39;,&#39;libgcc&#39;][&#39;nptl=
&#39; in &#39;${GLIBC_ADDONS}&#39;]}&quot;<br>
-PROVIDES =3D &quot;virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc&quot;=
<br>
+<br>
+CRYPTPROVIDES =3D &quot;virtual/crypt&quot;<br>
+CRYPTPROVIDES_class-nativesdk =3D &quot;&quot;<br>
+PROVIDES =3D &quot;virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc ${CRY=
PTPROVIDES}&quot;<br>
=C2=A0PROVIDES +=3D &quot;virtual/libintl virtual/libiconv&quot;<br>
=C2=A0inherit autotools texinfo distro_features_check systemd<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcryp=
t.patch b/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.p=
atch<br>
new file mode 100644<br>
index 0000000..6b34c70<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch=
<br>
@@ -0,0 +1,418 @@<br>
+Background information:<br>
+<br>
+<a href=3D"https://sourceware.org/ml/libc-alpha/2017-08/msg01257.html" rel=
=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blan=
k">https://sourceware.org/ml/libc-alpha/2017-08/msg01257.html</a><br>
+<a href=3D"https://fedoraproject.org/wiki/Changes/Replace_glibc_libcrypt_w=
ith_libxcrypt" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferre=
r" target=3D"_blank">https://fedoraproject.org/wiki/Changes/Replace_glibc_l=
ibcrypt_with_libxcrypt</a><br>
+<br>
+Upstream-Status: Submitted [<a href=3D"mailto:libc-alpha@sourceware.org" r=
el=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">libc-a=
lpha@sourceware.org</a>]<br>
+<br>
+From: Zack Weinberg &lt;<a href=3D"mailto:zackw@panix.com" rel=3D"noreferr=
er noreferrer noreferrer noreferrer" target=3D"_blank">zackw@panix.com</a>&=
gt;<br>
+Subject: [PATCH] Deprecate libcrypt and don&#39;t build it by default<br>
+<br>
+Back in June, Bj=C3=B6rn Esser proposed to add OpenBSD-compatible bcrypt<b=
r>
+support to our implementation of crypt(3), and Zack Weinberg replied<br>
+that it might actually make more sense to _remove_ libcrypt from<br>
+glibc, freeing up libcrypt.so.1 and crypt.h to be provided by a<br>
+separate project that could move faster.=C2=A0 (For instance, libxcrypt:<b=
r>
+<a href=3D"https://github.com/besser82/libxcrypt" rel=3D"noreferrer norefe=
rrer noreferrer noreferrer noreferrer" target=3D"_blank">https://github.com=
/besser82/libxcrypt</a>)<br>
+<br>
+This patch disables build and installation of libcrypt by default.=C2=A0 I=
t<br>
+can be re-enabled with --enable-obsolete-crypt to configure.=C2=A0 Unlike<=
br>
+libnsl, we do *not* install a runtime shared library; that&#39;s left to<b=
r>
+the replacement.=C2=A0 (Unlike the SunRPC situation, I think we can<br>
+probably drop this code altogether in a release or two.)<br>
+<br>
+The function prototypes for crypt and encrypt are removed from<br>
+unistd.h, and the function prototype for setkey is removed from<br>
+stdlib.h; they do *not* come back with --enable-obsolete-crypt.=C2=A0 This=
<br>
+means glibc no longer provides the POSIX CRYPT option, and the macro<br>
+_XOPEN_CRYPT is also removed from unistd.h to indicate that.<br>
+(_SC_XOPEN_CRYPT is still defined, but sysconf(_SC_XOPEN_CRYPT) will<br>
+return -1 at runtime.)=C2=A0 These functions are also unconditionally<br>
+removed from conform/data/{stdlib,unistd}.h-data.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* posix/unistd.h (_XOPEN_CRYPT, crypt, encrypt)=
: Don&#39;t declare.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* stdlib/stdlib.h (setkey): Don&#39;t declare.<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* <a href=3D"http://configure.ac" rel=3D"norefe=
rrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">configu=
re.ac</a> (--enable-obsolete-crypt): New configure option.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* configure: Regenerate.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* <a href=3D"http://config.make.in" rel=3D"nore=
ferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">confi=
g.make.in</a> (build-obsolete-crypt): New makefile variable.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* crypt/Banner: Delete file.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* crypt/Makefile: Don&#39;t build anything unle=
ss<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(build-obsolete-crypt) is &#39;yes&#39;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* sysdeps/sparc/sparc32/sparcv9/multiarch/Makef=
ile: Only add things<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0to libcrypt-sysdep_routines when $(build-obsole=
te-crypt) is &#39;yes&#39;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* sysdeps/sparc/sparc64/multiarch/Makefile: Lik=
ewise.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* sysdeps/unix/sysv/linux/arm/Makefile: Likewis=
e.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* conform/Makefile: Only include libcrypt.a in =
linknamespace tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0when $(build-obsolete-crypt) is &#39;yes&#39;.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* conform/data/stdlib.h-data (setkey): Don&#39;=
t expect.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* conform/data/unistd.h-data (crypt, encrypt): =
Don&#39;t expect.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* elf/Makefile: Only perform various tests of <=
a href=3D"http://libcrypt.so/libcrypt.a" rel=3D"noreferrer noreferrer noref=
errer noreferrer noreferrer" target=3D"_blank">libcrypt.so/libcrypt.a</a><b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0when $(build-obsolete-crypt) is &#39;yes&#39;.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* elf/tst-linkall-static.c: Don&#39;t include c=
rypt.h when USE_CRYPT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0is false.<br>
+---<br>
+ NEWS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++++<br>
+ <a href=3D"http://config.make.in" rel=3D"noreferrer noreferrer noreferrer=
 noreferrer noreferrer" target=3D"_blank">config.make.in</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
+ configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 13 +++++++++++++<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer noreferrer n=
oreferrer noreferrer" target=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++++++<br>
+ conform/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++=
++----<br>
+ conform/data/stdlib.h-data=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ---<br>
+ conform/data/unistd.h-data=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ------<br>
+ crypt/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5=
 +++++<br>
+ elf/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
16 ++++++++++++----<br>
+ elf/tst-linkall-static.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
+ posix/unistd.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 ----=
------------<br>
+ stdlib/stdlib.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 --=
----<br>
+ sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile |=C2=A0 2 ++<br>
+ sysdeps/sparc/sparc64/multiarch/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 ++<br>
+ sysdeps/unix/sysv/linux/arm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 ++<br>
+ 15 files changed, 75 insertions(+), 39 deletions(-)<br>
+<br>
+diff --git a/<a href=3D"http://config.make.in" rel=3D"noreferrer noreferre=
r noreferrer noreferrer noreferrer" target=3D"_blank">config.make.in</a> b/=
<a href=3D"http://config.make.in" rel=3D"noreferrer noreferrer noreferrer n=
oreferrer noreferrer" target=3D"_blank">config.make.in</a><br>
+index 9e5e24b2c6..8fe610d04d 100644<br>
+--- a/<a href=3D"http://config.make.in" rel=3D"noreferrer noreferrer noref=
errer noreferrer noreferrer" target=3D"_blank">config.make.in</a><br>
++++ b/<a href=3D"http://config.make.in" rel=3D"noreferrer noreferrer noref=
errer noreferrer noreferrer" target=3D"_blank">config.make.in</a><br>
+@@ -82,6 +82,7 @@ mach-interface-list =3D @mach_interface_list@<br>
+<br>
+ experimental-malloc =3D @experimental_malloc@<br>
+<br>
++build-obsolete-crypt =3D @build_obsolete_crypt@<br>
+ nss-crypt =3D @libc_cv_nss_crypt@<br>
+ static-nss-crypt =3D @libc_cv_static_nss_crypt@<br>
+<br>
+diff --git a/configure b/configure<br>
+index 7a8bd3f817..46f6bd7f86 100755<br>
+--- a/configure<br>
++++ b/configure<br>
+@@ -672,6 +672,7 @@ base_machine<br>
+ have_tunables<br>
+ build_pt_chown<br>
+ build_nscd<br>
++build_obsolete_crypt<br>
+ build_obsolete_nsl<br>
+ link_obsolete_rpc<br>
+ libc_cv_static_nss_crypt<br>
+@@ -782,6 +783,7 @@ enable_experimental_malloc<br>
+ enable_nss_crypt<br>
+ enable_obsolete_rpc<br>
+ enable_obsolete_nsl<br>
++enable_obsolete_crypt<br>
+ enable_systemtap<br>
+ enable_build_nscd<br>
+ enable_nscd<br>
+@@ -1453,6 +1455,7 @@ Optional Features:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0link-time usage<br>
+=C2=A0 =C2=A0--enable-obsolete-nsl=C2=A0 =C2=A0build and install the obsol=
ete libnsl library and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0depending NSS modules<br>
++=C2=A0 --enable-obsolete-crypt build and install the obsolete libcrypt li=
brary<br>
+=C2=A0 =C2=A0--enable-systemtap=C2=A0 =C2=A0 =C2=A0 enable systemtap stati=
c probe points [default=3Dno]<br>
+=C2=A0 =C2=A0--disable-build-nscd=C2=A0 =C2=A0 disable building and instal=
ling the nscd daemon<br>
+=C2=A0 =C2=A0--disable-nscd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 library func=
tions will not contact the nscd daemon<br>
+@@ -3632,6 +3635,16 @@ if test &quot;$build_obsolete_nsl&quot; =3D yes; th=
en<br>
+<br>
+ fi<br>
+<br>
++# Check whether --enable-obsolete-crypt was given.<br>
++if test &quot;${enable_obsolete_crypt+set}&quot; =3D set; then :<br>
++=C2=A0 enableval=3D$enable_obsolete_crypt; build_obsolete_crypt=3D$enable=
val<br>
++else<br>
++=C2=A0 build_obsolete_crypt=3Dno<br>
++fi<br>
++<br>
++<br>
++<br>
++<br>
+ # Check whether --enable-systemtap was given.<br>
+ if test &quot;${enable_systemtap+set}&quot; =3D set; then :<br>
+=C2=A0 =C2=A0enableval=3D$enable_systemtap; systemtap=3D$enableval<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer =
noreferrer noreferrer noreferrer" target=3D"_blank">configure.ac</a> b/<a h=
ref=3D"http://configure.ac" rel=3D"noreferrer noreferrer noreferrer norefer=
rer noreferrer" target=3D"_blank">configure.ac</a><br>
+index ca1282a6b3..0142353740 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer norefer=
rer noreferrer noreferrer" target=3D"_blank">configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer norefer=
rer noreferrer noreferrer" target=3D"_blank">configure.ac</a><br>
+@@ -378,6 +378,14 @@ if test &quot;$build_obsolete_nsl&quot; =3D yes; then=
<br>
+=C2=A0 =C2=A0AC_DEFINE(LINK_OBSOLETE_NSL)<br>
+ fi<br>
+<br>
++AC_ARG_ENABLE([obsolete-crypt],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_HELP_STRING([--enable=
-obsolete-crypt],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[build and install the obsolete libcrypt lib=
rary]),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [build_obsolete_crypt=3D=
$enableval],<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [build_obsolete_crypt=3D=
no])<br>
++AC_SUBST(build_obsolete_crypt)<br>
++<br>
++<br>
+ AC_ARG_ENABLE([systemtap],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[AS_HELP_STRING([--=
enable-systemtap],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [enable systemtap static =
probe points @&lt;:@default=3Dno@:&gt;@])],<br>
+diff --git a/conform/Makefile b/conform/Makefile<br>
+index 864fdeca21..5ef474fb24 100644<br>
+--- a/conform/Makefile<br>
++++ b/conform/Makefile<br>
+@@ -193,22 +193,28 @@ linknamespace-libs-thr =3D $(linknamespace-libs-isoc=
) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(common-objpfx)rt/librt.a $(static-thread-library)<br>
+ linknamespace-libs-posix =3D $(linknamespace-libs-thr) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 $(common-objpfx)dlfcn/libdl.a<br>
+-linknamespace-libs-xsi =3D $(linknamespace-libs-posix) \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$(common-objpfx)crypt/libcrypt.a<br>
++linknamespace-libs-xsi =3D $(linknamespace-libs-posix)<br>
+ linknamespace-libs-ISO =3D $(linknamespace-libs-isoc)<br>
+ linknamespace-libs-ISO99 =3D $(linknamespace-libs-isoc)<br>
+ linknamespace-libs-ISO11 =3D $(linknamespace-libs-isoc)<br>
+-linknamespace-libs-XPG4 =3D $(linknamespace-libs-isoc) \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(common-objpfx)crypt/libcrypt.a<br>
++linknamespace-libs-XPG4 =3D $(linknamespace-libs-isoc)<br>
+ linknamespace-libs-XPG42 =3D $(linknamespace-libs-XPG4)<br>
+ linknamespace-libs-POSIX =3D $(linknamespace-libs-thr)<br>
+ linknamespace-libs-UNIX98 =3D $(linknamespace-libs-xsi)<br>
+ linknamespace-libs-XOPEN2K =3D $(linknamespace-libs-xsi)<br>
+ linknamespace-libs-POSIX2008 =3D $(linknamespace-libs-posix)<br>
+ linknamespace-libs-XOPEN2K8 =3D $(linknamespace-libs-xsi)<br>
++<br>
++ifeq ($(build-obsolete-crypt),yes)<br>
++linknamespace-libs-xsi +=3D $(common-objpfx)crypt/libcrypt.a<br>
++linknamespace-libs-XPG4 +=3D $(common-objpfx)crypt/libcrypt.a<br>
++endif<br>
++<br>
+ linknamespace-libs =3D $(foreach std,$(conformtest-standards),\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(linknamespace-libs-$(std)))=
<br>
+<br>
++<br>
++<br>
+ $(linknamespace-symlist-stdlibs-tests): $(objpfx)symlist-stdlibs-%: \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(linknam=
espace-libs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0LC_ALL=3DC $(READELF) -W -s $(linknamespace-lib=
s-$*) &gt; $@; \<br>
+diff --git a/conform/data/stdlib.h-data b/conform/data/stdlib.h-data<br>
+index d8fcccc2fb..6913828196 100644<br>
+--- a/conform/data/stdlib.h-data<br>
++++ b/conform/data/stdlib.h-data<br>
+@@ -149,9 +149,6 @@ function {unsigned short int*} seed48 (unsigned short =
int[3])<br>
+ #if !defined ISO &amp;&amp; !defined ISO99 &amp;&amp; !defined ISO11 &amp=
;&amp; !defined POSIX &amp;&amp; !defined XPG4 &amp;&amp; !defined XPG42 &a=
mp;&amp; !defined UNIX98<br>
+ function int setenv (const char*, const char*, int)<br>
+ #endif<br>
+-#if !defined ISO &amp;&amp; !defined ISO99 &amp;&amp; !defined ISO11 &amp=
;&amp; !defined POSIX &amp;&amp; !defined POSIX2008<br>
+-function void setkey (const char*)<br>
+-#endif<br>
+ #if !defined ISO &amp;&amp; !defined ISO99 &amp;&amp; !defined ISO11 &amp=
;&amp; !defined XPG4 &amp;&amp; !defined POSIX &amp;&amp; !defined POSIX200=
8<br>
+ function {char*} setstate (char*)<br>
+ #endif<br>
+diff --git a/conform/data/unistd.h-data b/conform/data/unistd.h-data<br>
+index ddf4f25132..aa070528e8 100644<br>
+--- a/conform/data/unistd.h-data<br>
++++ b/conform/data/unistd.h-data<br>
+@@ -437,9 +437,6 @@ function int chroot (const char*)<br>
+ function int chown (const char*, uid_t, gid_t)<br>
+ function int close (int)<br>
+ function size_t confstr (int, char*, size_t)<br>
+-#if !defined POSIX &amp;&amp; !defined POSIX2008<br>
+-function {char*} crypt (const char*, const char*)<br>
+-#endif<br>
+ #if defined XPG4 || defined XPG42 || defined UNIX98<br>
+ function {char*} ctermid (char*)<br>
+ function {char*} cuserid (char*)<br>
+@@ -449,9 +446,6 @@ allow cuserid<br>
+ #endif<br>
+ function int dup (int)<br>
+ function int dup2 (int, int)<br>
+-#if !defined POSIX &amp;&amp; !defined POSIX2008<br>
+-function void encrypt (char[64], int)<br>
+-#endif<br>
+ function int execl (const char*, const char*, ...)<br>
+ function int execle (const char*, const char*, ...)<br>
+ function int execlp (const char*, const char*, ...)<br>
+diff --git a/crypt/Makefile b/crypt/Makefile<br>
+index 303800df73..024ec2c6ab 100644<br>
+--- a/crypt/Makefile<br>
++++ b/crypt/Makefile<br>
+@@ -22,6 +22,8 @@ subdir=C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D crypt<br>
+<br>
+ include ../Makeconfig<br>
+<br>
++ifeq ($(build-obsolete-crypt),yes)<br>
++<br>
+ headers :=3D crypt.h<br>
+<br>
+ extra-libs :=3D libcrypt<br>
+@@ -52,9 +54,11 @@ tests +=3D md5test sha256test sha512test<br>
+ # machine over a minute.<br>
+ xtests =3D md5test-giant<br>
+ endif<br>
++endif<br>
+<br>
+ include ../Rules<br>
+<br>
++ifeq ($(build-obsolete-crypt),yes)<br>
+ ifneq ($(nss-crypt),yes)<br>
+ md5-routines :=3D md5 $(filter md5%,$(libcrypt-sysdep_routines))<br>
+ sha256-routines :=3D sha256 $(filter sha256%,$(libcrypt-sysdep_routines))=
<br>
+@@ -71,3 +75,4 @@ $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.so<br=
>
+ else<br>
+ $(addprefix $(objpfx),$(tests)): $(objpfx)libcrypt.a<br>
+ endif<br>
++endif<br>
+diff --git a/elf/Makefile b/elf/Makefile<br>
+index 2a432d8bee..366f7b80ec 100644<br>
+--- a/elf/Makefile<br>
++++ b/elf/Makefile<br>
+@@ -385,15 +385,19 @@ $(objpfx)tst-_dl_addr_inside_object: $(objpfx)dl-add=
r-obj.os<br>
+ CFLAGS-tst-_dl_addr_inside_object.c +=3D $(PIE-ccflag)<br>
+ endif<br>
+<br>
+-# By default tst-linkall-static should try to use crypt routines to test<=
br>
+-# static libcrypt use.<br>
+-CFLAGS-tst-linkall-static.c +=3D -DUSE_CRYPT=3D1<br>
++ifeq ($(build-obsolete-crypt),yes)<br>
++# If the libcrypt library is being built, tst-linkall-static should<br>
++# try to use crypt routines to test static libcrypt use.<br>
++CFLAGS-tst-linkall-static.c =3D -DUSE_CRYPT=3D1<br>
+ # However, if we are using NSS crypto and we don&#39;t have a static<br>
+ # library, then we exclude the use of crypt functions in the test.<br>
+ # We similarly exclude libcrypt.a from the static link (see below).<br>
+ ifeq (yesno,$(nss-crypt)$(static-nss-crypt))<br>
+ CFLAGS-tst-linkall-static.c +=3D -UUSE_CRYPT -DUSE_CRYPT=3D0<br>
+ endif<br>
++else<br>
++CFLAGS-tst-linkall-static.c =3D -DUSE_CRYPT=3D0<br>
++endif<br>
+<br>
+ include ../Rules<br>
+<br>
+@@ -1113,8 +1117,10 @@ localplt-built-dso :=3D $(addprefix $(common-objpfx=
),\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rt/librt.so \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dlfcn/libdl.so \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resolv/libresolv.so \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crypt/libcrypt.so \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 )<br>
++ifeq ($(build-obsolete-crypt),yes)<br>
++localplt-built-dso +=3D $(addprefix $(common-objpfx), crypt/libcrypt.so)<=
br>
++endif<br>
+ ifeq ($(build-mathvec),yes)<br>
+ localplt-built-dso +=3D $(addprefix $(common-objpfx), mathvec/libmvec.so)=
<br>
+ endif<br>
+@@ -1395,6 +1401,7 @@ $(objpfx)tst-linkall-static: \<br>
+=C2=A0 =C2=A0$(common-objpfx)resolv/libanl.a \<br>
+=C2=A0 =C2=A0$(static-thread-library)<br>
+<br>
++ifeq ($(build-obsolete-crypt),yes)<br>
+ # If we are using NSS crypto and we have the ability to link statically<b=
r>
+ # then we include libcrypt.a, otherwise we leave out libcrypt.a and<br>
+ # link as much as we can into the tst-linkall-static test.=C2=A0 This ass=
umes<br>
+@@ -1410,6 +1417,7 @@ ifeq (no,$(nss-crypt))<br>
+ $(objpfx)tst-linkall-static: \<br>
+=C2=A0 =C2=A0$(common-objpfx)crypt/libcrypt.a<br>
+ endif<br>
++endif<br>
+<br>
+ # The application depends on the DSO, and the DSO loads the plugin.<br>
+ # The plugin also depends on the DSO. This creates the circular<br>
+diff --git a/elf/tst-linkall-static.c b/elf/tst-linkall-static.c<br>
+index e8df38f74e..0ffae7c723 100644<br>
+--- a/elf/tst-linkall-static.c<br>
++++ b/elf/tst-linkall-static.c<br>
+@@ -18,7 +18,9 @@<br>
+<br>
+ #include &lt;math.h&gt;<br>
+ #include &lt;pthread.h&gt;<br>
++#if USE_CRYPT<br>
+ #include &lt;crypt.h&gt;<br>
++#endif<br>
+ #include &lt;resolv.h&gt;<br>
+ #include &lt;dlfcn.h&gt;<br>
+ #include &lt;utmp.h&gt;<br>
+diff --git a/posix/unistd.h b/posix/unistd.h<br>
+index 4d149f9945..e75ce4d4ec 100644<br>
+--- a/posix/unistd.h<br>
++++ b/posix/unistd.h<br>
+@@ -107,9 +107,6 @@ __BEGIN_DECLS<br>
+ /* The X/Open Unix extensions are available.=C2=A0 */<br>
+ #define _XOPEN_UNIX=C2=A0 =C2=A01<br>
+<br>
+-/* Encryption is present.=C2=A0 */<br>
+-#define=C2=A0 =C2=A0 =C2=A0 =C2=A0_XOPEN_CRYPT=C2=A0 =C2=A0 1<br>
+-<br>
+ /* The enhanced internationalization capabilities according to XPG4.2<br>
+=C2=A0 =C2=A0 are present.=C2=A0 */<br>
+ #define=C2=A0 =C2=A0 =C2=A0 =C2=A0_XOPEN_ENH_I18N 1<br>
+@@ -1118,20 +1115,7 @@ ssize_t copy_file_range (int __infd, __off64_t *__p=
inoff,<br>
+ extern int fdatasync (int __fildes);<br>
+ #endif /* Use POSIX199309 */<br>
+<br>
+-<br>
+-/* XPG4.2 specifies that prototypes for the encryption functions must<br>
+-=C2=A0 =C2=A0be defined here.=C2=A0 */<br>
+ #ifdef=C2=A0 =C2=A0 =C2=A0 =C2=A0 __USE_XOPEN<br>
+-/* Encrypt at most 8 characters from KEY using salt to perturb DES.=C2=A0=
 */<br>
+-extern char *crypt (const char *__key, const char *__salt)<br>
+-=C2=A0 =C2=A0 =C2=A0__THROW __nonnull ((1, 2));<br>
+-<br>
+-/* Encrypt data in BLOCK in place if EDFLAG is zero; otherwise decrypt<br=
>
+-=C2=A0 =C2=A0block in place.=C2=A0 */<br>
+-extern void encrypt (char *__glibc_block, int __edflag)<br>
+-=C2=A0 =C2=A0 =C2=A0__THROW __nonnull ((1));<br>
+-<br>
+-<br>
+ /* Swab pairs bytes in the first N bytes of the area pointed to by<br>
+=C2=A0 =C2=A0 FROM and copy the result to TO.=C2=A0 The value of TO must n=
ot be in the<br>
+=C2=A0 =C2=A0 range [FROM - N + 1, FROM - 1].=C2=A0 If N is odd the first =
byte in FROM<br>
+diff --git a/stdlib/stdlib.h b/stdlib/stdlib.h<br>
+index 6b1ead31e0..8e23e93557 100644<br>
+--- a/stdlib/stdlib.h<br>
++++ b/stdlib/stdlib.h<br>
+@@ -958,12 +958,6 @@ extern int getsubopt (char **__restrict __optionp,<br=
>
+ #endif<br>
+<br>
+<br>
+-#ifdef __USE_XOPEN<br>
+-/* Setup DES tables according KEY.=C2=A0 */<br>
+-extern void setkey (const char *__key) __THROW __nonnull ((1));<br>
+-#endif<br>
+-<br>
+-<br>
+ /* X/Open pseudo terminal handling.=C2=A0 */<br>
+<br>
+ #ifdef __USE_XOPEN2KXSI<br>
+diff --git a/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile b/sysdeps/sp=
arc/sparc32/sparcv9/multiarch/Makefile<br>
+index a6d08f3a00..d8b8297fb0 100644<br>
+--- a/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile<br>
++++ b/sysdeps/sparc/sparc32/sparcv9/multiarch/Makefile<br>
+@@ -1,6 +1,8 @@<br>
+ ifeq ($(subdir),crypt)<br>
++ifeq ($(build-obsolete-crypt),yes)<br>
+ libcrypt-sysdep_routines +=3D md5-crop sha256-crop sha512-crop<br>
+ endif<br>
++endif<br>
+<br>
+ ifeq ($(subdir),locale)<br>
+ localedef-aux +=3D md5-crop<br>
+diff --git a/sysdeps/sparc/sparc64/multiarch/Makefile b/sysdeps/sparc/spar=
c64/multiarch/Makefile<br>
+index eaf758e7aa..0198f9886f 100644<br>
+--- a/sysdeps/sparc/sparc64/multiarch/Makefile<br>
++++ b/sysdeps/sparc/sparc64/multiarch/Makefile<br>
+@@ -1,6 +1,8 @@<br>
+ ifeq ($(subdir),crypt)<br>
++ifeq ($(build-obsolete-crypt),yes)<br>
+ libcrypt-sysdep_routines +=3D md5-crop sha256-crop sha512-crop<br>
+ endif<br>
++endif<br>
+<br>
+ ifeq ($(subdir),locale)<br>
+ localedef-aux +=3D md5-crop<br>
+diff --git a/sysdeps/unix/sysv/linux/arm/Makefile b/sysdeps/unix/sysv/linu=
x/arm/Makefile<br>
+index 4adc35de04..6cab4f3a31 100644<br>
+--- a/sysdeps/unix/sysv/linux/arm/Makefile<br>
++++ b/sysdeps/unix/sysv/linux/arm/Makefile<br>
+@@ -19,8 +19,10 @@ endif<br>
+ # Add a syscall function to each library that needs one.<br>
+<br>
+ ifeq ($(subdir),crypt)<br>
++ifeq ($(build-obsolete-crypt),yes)<br>
+ libcrypt-sysdep_routines +=3D libc-do-syscall<br>
+ endif<br>
++endif<br>
+<br>
+ ifeq ($(subdir),rt)<br>
+ librt-sysdep_routines +=3D libc-do-syscall<br>
+--<br>
+2.16.0<br>
+<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.27.bb" rel=
=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blan=
k">glibc_2.27.bb</a> b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.27=
.bb" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" target=
=3D"_blank">glibc_2.27.bb</a><br>
index 772351a..c814798 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.27.bb" rel=3D"noref=
errer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">glibc_=
2.27.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.27.bb" rel=3D"noref=
errer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">glibc_=
2.27.bb</a><br>
@@ -54,6 +54,7 @@ NATIVESDKFIXES_class-nativesdk =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-nativesdk-glibc-Raise=
-the-size-of-arrays-containing-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-nativesdk-glibc-Allow=
-64-bit-atomics-for-x86.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://relocate-locales.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0031-nativesdk-deprecate-l=
ibcrypt.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
diff --git a/meta/recipes-core/glibc/site_config/headers b/meta/recipes-cor=
e/glibc/site_config/headers<br>
index 609ab53..69fedea 100644<br>
--- a/meta/recipes-core/glibc/site_config/headers<br>
+++ b/meta/recipes-core/glibc/site_config/headers<br>
@@ -9,7 +9,6 @@ asm/page.h<br>
=C2=A0asm/types.h<br>
=C2=A0assert.h<br>
=C2=A0byteswap.h<br>
-crypt.h<br>
=C2=A0ctype.h<br>
=C2=A0dirent.h<br>
=C2=A0dlfcn.h<br>
diff --git a/meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt_4.0.0.=
bb" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" target=
=3D"_blank">libxcrypt_4.0.0.bb</a> b/meta/recipes-core/libxcrypt/<a href=3D=
"http://libxcrypt_4.0.0.bb" rel=3D"noreferrer noreferrer noreferrer norefer=
rer noreferrer" target=3D"_blank">libxcrypt_4.0.0.bb</a><br>
new file mode 100644<br>
index 0000000..b1982c1<br>
--- /dev/null<br>
+++ b/meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt_4.0.0.bb" rel=
=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blan=
k">libxcrypt_4.0.0.bb</a><br>
@@ -0,0 +1,31 @@<br>
+SUMMARY =3D &quot;Extended cryptographic library (from glibc)&quot;<br>
+DESCRIPTION =3D &quot;Forked code from glibc libary to extract only crypto=
 part.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/besser82/libxcrypt" rel=
=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blan=
k">https://github.com/besser82/libxcrypt</a>&quot;<br>
+SECTION =3D &quot;libs&quot;<br>
+LICENSE =3D &quot;LGPLv2.1&quot;<br>
+LIC_FILES_CHKSUM ?=3D &quot;file://LICENSING;md5=3Dd1cc18f512ded3bd6000f37=
29f31be08 \<br>
+=C2=A0 =C2=A0 =C2=A0 file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364=
516c \<br>
+&quot;<br>
+<br>
+inherit autotools<br>
+<br>
+SRCREV ?=3D &quot;215b32aa4e0b255c3356a96bd6d257661bad73ca&quot;<br>
+SRCBRANCH ?=3D &quot;master&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/besser82/libxcrypt.gi=
t;branch=3D$%7BSRCBRANCH%7D" rel=3D"noreferrer noreferrer noreferrer norefe=
rrer noreferrer" target=3D"_blank">github.com/besser82/libxcrypt.git;branch=
=3D${SRCBRANCH}</a>&quot;<br>
+<br>
+PROVIDES =3D &quot;virtual/crypt&quot;<br>
+<br>
+FILES_${PN} =3D &quot;${libdir}/libcrypt*.so.* ${libdir}/libcrypt-*.so ${l=
ibdir}/libowcrypt*.so.* ${libdir}/libowcrypt-*.so&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+BUILD_CPPFLAGS =3D &quot;-I${STAGING_INCDIR_NATIVE}&quot;<br>
+TARGET_CPPFLAGS =3D &quot;-I${STAGING_DIR_TARGET}${includedir}&quot;<br>
+<br>
+python () {<br>
+=C2=A0 =C2=A0 if not bb.data.inherits_class(&#39;nativesdk&#39;, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;Recipe only ap=
plies in nativesdk case for now&quot;)<br>
+}<br>
+<br>
+BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://uninative-tarball.bb"=
 rel=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_=
blank">uninative-tarball.bb</a> b/meta/recipes-core/meta/<a href=3D"http://=
uninative-tarball.bb" rel=3D"noreferrer noreferrer noreferrer noreferrer no=
referrer" target=3D"_blank">uninative-tarball.bb</a><br>
index 5fabf7f..38c3a31 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://uninative-tarball.bb" rel=3D=
"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">=
uninative-tarball.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://uninative-tarball.bb" rel=3D=
"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">=
uninative-tarball.bb</a><br>
@@ -13,6 +13,7 @@ TOOLCHAIN_HOST_TASK =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-glibc-gconv-utf-16 \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-glibc-gconv-cp1252 \<br>
=C2=A0 =C2=A0 =C2=A0nativesdk-patchelf \<br>
+=C2=A0 =C2=A0 nativesdk-libxcrypt \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc<br>
index 5e40b20..157416d 100644<br>
--- a/meta/recipes-core/util-linux/util-linux.inc<br>
+++ b/meta/recipes-core/util-linux/util-linux.inc<br>
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM =3D &quot;file://README.licensing;md5=3D=
1715f5ee3e01203ca1e1e0b9ee65918c<br>
<br>
=C2=A0#gtk-doc is not enabled as it requires xmlto which requires util-linu=
x<br>
=C2=A0inherit autotools gettext pkgconfig systemd update-alternatives pytho=
n3-dir bash-completion ptest<br>
-DEPENDS =3D &quot;zlib ncurses&quot;<br>
+DEPENDS =3D &quot;zlib ncurses virtual/crypt&quot;<br>
=C2=A0DEPENDS_append_class-native =3D &quot; lzo-native&quot;<br>
=C2=A0DEPENDS_append_class-nativesdk =3D &quot; lzo-native&quot;<br>
<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" r=
el=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_bl=
ank">perl_5.24.1.bb</a> b/meta/recipes-devtools/perl/<a href=3D"http://perl=
_5.24.1.bb" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" =
target=3D"_blank">perl_5.24.1.bb</a><br>
index 66ccd7f..222dd88 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=3D"n=
oreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">pe=
rl_5.24.1.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.24.1.bb" rel=3D"n=
oreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">pe=
rl_5.24.1.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0require perl.inc<br>
<br>
=C2=A0# We need gnugrep (for -I)<br>
-DEPENDS =3D &quot;db grep-native gdbm zlib&quot;<br>
+DEPENDS =3D &quot;db grep-native gdbm zlib virtual/crypt&quot;<br>
<br>
=C2=A0# Pick up patches from debian<br>
=C2=A0# <a href=3D"http://ftp.de.debian.org/debian/pool/main/p/perl/perl_5.=
22.0-1.debian.tar.xz" rel=3D"noreferrer noreferrer noreferrer noreferrer no=
referrer" target=3D"_blank">http://ftp.de.debian.org/debian/pool/main/p/per=
l/perl_5.22.0-1.debian.tar.xz</a><br>
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extende=
d/shadow/shadow.inc<br>
index 48a3be8..673207f 100644<br>
--- a/meta/recipes-extended/shadow/shadow.inc<br>
+++ b/meta/recipes-extended/shadow/shadow.inc<br>
@@ -6,8 +6,7 @@ LICENSE =3D &quot;BSD | Artistic-1.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Ded80ff1c2b40843cf5768=
e5229cf16e5 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://src/passwd.c;beginline=3D8;endline=3D30;md5=3Dd83888ea14ae6195198=
2d77125947661&quot;<br>
<br>
-DEPENDS_class-native =3D &quot;&quot;<br>
-DEPENDS_class-nativesdk =3D &quot;&quot;<br>
+DEPENDS =3D &quot;virtual/crypt&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://pkg-shadow.alioth.debian.org/rele=
ases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer noreferrer noreferrer n=
oreferrer noreferrer" target=3D"_blank">http://pkg-shadow.alioth.debian.org=
/releases/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://shadow-4.1.3-dots-in-usern=
ames.patch \<br>
--<br>
2.7.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" rel=3D"noreferr=
er noreferrer noreferrer noreferrer" target=3D"_blank">Openembedded-core@li=
sts.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"=
_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a=
><br>
</blockquote></div></div></div>

--00000000000023898d0569424206--
