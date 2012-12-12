Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tie2h-0005LI-Ot
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 05:35:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Dec 2012 20:21:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,264,1355126400"; d="scan'208";a="230288117"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.105])
	by azsmga001.ch.intel.com with ESMTP; 11 Dec 2012 20:21:00 -0800
Message-ID: <50C8062C.9050408@linux.intel.com>
Date: Tue, 11 Dec 2012 20:21:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1354273734-7103-1-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1354273734-7103-1-git-send-email-cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: update to upstream version 8.20
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
X-List-Received-Date: Wed, 12 Dec 2012 04:35:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/2012 03:08 AM, Marko Lindqvist wrote:
> * remove-gets.patch removed as issue is fixed upstream
> * cross-prime-list.patch added to fix cross-compilation
> * noman.patch added to disable manpage creation that does not
>    work while cross-compiling
>
> * License texts are identical to old, but old md5sum was
>    erronously calculated from the beginning of the ls.c file, and
>    not from the beginning of license text segment.
>
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>   .../coreutils/coreutils-8.14/remove-gets.patch     |   23 ----------------
>   .../coreutils-build-with-acl.patch                 |    0
>   .../coreutils-8.20/cross-prime-list.patch          |   29 ++++++++++++++++++++
>   .../coreutils/coreutils-8.20/noman.patch           |   19 +++++++++++++
>   .../remove-usr-local-lib-from-m4.patch             |    0
>   .../{coreutils_8.14.bb => coreutils_8.20.bb}       |   11 ++++----
>   6 files changed, 54 insertions(+), 28 deletions(-)
>   delete mode 100644 meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
>   rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.20}/coreutils-build-with-acl.patch (100%)
>   create mode 100644 meta/recipes-core/coreutils/coreutils-8.20/cross-prime-list.patch
>   create mode 100644 meta/recipes-core/coreutils/coreutils-8.20/noman.patch
>   rename meta/recipes-core/coreutils/{coreutils-8.14 => coreutils-8.20}/remove-usr-local-lib-from-m4.patch (100%)
>   rename meta/recipes-core/coreutils/{coreutils_8.14.bb => coreutils_8.20.bb} (91%)
>

This patch has been in and out of Master_Under_Test for a week or so, I 
keep seeing a failure and had not kept the right build, this time I have 
it and here's the failure:
> | mips-poky-linux-gcc  -meb -mabi=32   -mhard-float -march=mips32 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -std=gnu99  -I. -I./lib  -Ilib -I./lib -Isrc -I./src    -O2 -pipe -g -feliminate-unused-debug-types -c -o src/false.o src/false.c
> | src/factor.c: In function 'factor_using_division':
> | src/factor.c:766:11: error: unable to emulate 'TI'
> | src/factor.c:766:11: warning: right shift count >= width of type [enabled by default]
> | src/factor.c: In function 'mulredc':
> | src/factor.c:955:3: error: unable to emulate 'TI'
> | src/factor.c:955:3: warning: right shift count >= width of type [enabled by default]
> | src/factor.c:957:3: error: unable to emulate 'TI'
> | src/factor.c:957:3: warning: right shift count >= width of type [enabled by default]
> | src/factor.c: In function 'mulredc2':
> | src/factor.c:992:3: error: unable to emulate 'TI'
> | src/factor.c:992:3: warning: right shift count >= width of type [enabled by default]
> | src/factor.c:993:3: error: unable to emulate 'TI'
> | src/factor.c:993:3: warning: right shift count >= width of type [enabled by default]
> | src/factor.c:995:3: error: unable to emulate 'TI'
> | src/factor.c:995:3: warning: right shift count >= width of type [enabled by default]
> | src/factor.c:996:3: error: unable to emulate 'TI'
> | src/factor.c:996:3: warning: right shift count >= width of type [enabled by default]
> | src/factor.c:1017:3: error: unable to emulate 'TI'
> | src/factor.c:1017:3: warning: right shift count >= width of type [enabled by default]
> | src/factor.c:1018:3: error: unable to emulate 'TI'
> | src/factor.c:1018:3: warning: right shift count >= width of type [enabled by default]
> | src/factor.c:1022:3: error: unable to emulate 'TI'
> | src/factor.c:1022:3: warning: right shift count >= width of type [enabled by default]
> | src/factor.c:1023:3: error: unable to emulate 'TI'
> | src/factor.c:1023:3: warning: right shift count >= width of type [enabled by default]
> | src/factor.c: In function 'prime_p':
> | src/factor.c:1238:9: error: unable to emulate 'TI'
> | src/factor.c:1238:9: warning: right shift count >= width of type [enabled by default]
> | mips-poky-linux-gcc  -meb -mabi=32   -mhard-float -march=mips32 --sysroot=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/sysroots/qemumips -std=gnu99  -I. -I./lib  -Ilib -I./lib -Isrc -I./src    -O2 -pipe -g -feliminate-unused-debug-types -c -o src/fmt.o src/fmt.c
> | src/factor.c: In function 'prime2_p':
> | src/factor.c:1331:17: error: unable to emulate 'TI'
> | src/factor.c:1331:17: warning: right shift count >= width of type [enabled by default]
> | src/factor.c: In function 'factor_using_pollard_rho2':
> | src/factor.c:1587:11: error: unable to emulate 'TI'
> | src/factor.c:1587:11: warning: right shift count >= width of type [enabled by default]
> | src/factor.c: In function 'isqrt2':
> | src/factor.c:1783:11: error: unable to emulate 'TI'
> | src/factor.c:1783:11: warning: right shift count >= width of type [enabled by default]
> | src/factor.c:1786:11: error: unable to emulate 'TI'
> | src/factor.c:1786:11: warning: right shift count >= width of type [enabled by default]
> | src/factor.c: In function 'factor_using_squfof':
> | src/factor.c:1959:7: error: unable to emulate 'TI'
> | src/factor.c:1959:7: warning: right shift count >= width of type [enabled by default]
> | src/factor.c:2015:7: error: unable to emulate 'TI'
> | src/factor.c:2015:7: warning: right shift count >= width of type [enabled by default]
> | src/factor.c:2116:19: error: unable to emulate 'TI'
> | src/factor.c:2116:19: warning: right shift count >= width of type [enabled by default]
> | src/factor.c:2154:19: error: unable to emulate 'TI'
> | src/factor.c:2154:19: warning: right shift count >= width of type [enabled by default]
> | make[2]: *** [src/factor.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/coreutils/8.20-r0/coreutils-8.20'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/coreutils/8.20-r0/coreutils-8.20'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-mips/build/build/tmp/work/mips32-poky-linux/coreutils/8.20-r0/temp/log.do_compile.24549 for further information)

Please look into this.

Thanks
	Sau!


> diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch b/meta/recipes-core/coreutils/coreutils-8.14/remove-gets.patch
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
> -===================================================================
> ---- coreutils-8.14.orig/lib/stdio.in.h	2011-09-24 04:20:48.000000000 -0700
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
> -
> -
> diff --git a/meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-with-acl.patch b/meta/recipes-core/coreutils/coreutils-8.20/coreutils-build-with-acl.patch
> similarity index 100%
> rename from meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-with-acl.patch
> rename to meta/recipes-core/coreutils/coreutils-8.20/coreutils-build-with-acl.patch
> diff --git a/meta/recipes-core/coreutils/coreutils-8.20/cross-prime-list.patch b/meta/recipes-core/coreutils/coreutils-8.20/cross-prime-list.patch
> new file mode 100644
> index 0000000..524c636
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils-8.20/cross-prime-list.patch
> @@ -0,0 +1,29 @@
> +Build make-prime-list for build system
> +
> +make-prime-list is used in build time only for generating the prime list.
> +Build it executable in build system.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +diff -Nurd coreutils-8.20/src/local.mk coreutils-8.20/src/local.mk
> +--- coreutils-8.20/src/local.mk	2012-10-23 17:14:12.000000000 +0300
> ++++ coreutils-8.20/src/local.mk	2012-11-30 11:47:11.155372281 +0200
> +@@ -37,7 +37,6 @@
> + # Needed by the testsuite.
> + noinst_PROGRAMS =		\
> +   src/getlimits			\
> +-  src/make-prime-list		\
> +   src/setuidgid
> +
> + noinst_HEADERS =		\
> +@@ -370,6 +369,9 @@
> + src_libstdbuf_so_LDFLAGS = -shared
> + src_libstdbuf_so_CFLAGS = -fPIC $(AM_CFLAGS)
> +
> ++src/make-prime-list: src/make-prime-list.c
> ++	$(CC_FOR_BUILD) -o src/make-prime-list -I$(top_builddir)/lib $(srcdir)/src/make-prime-list.c
> ++
> + BUILT_SOURCES += src/dircolors.h
> + src/dircolors.h: src/dcgen src/dircolors.hin
> + 	$(AM_V_GEN)rm -f $@ $@-t
> diff --git a/meta/recipes-core/coreutils/coreutils-8.20/noman.patch b/meta/recipes-core/coreutils/coreutils-8.20/noman.patch
> new file mode 100644
> index 0000000..90521e2
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils-8.20/noman.patch
> @@ -0,0 +1,19 @@
> +Do not build man pages
> +
> +Coreutils manpage creation does not work when cross-compiling and
> +produced binaries are not executable in build system. Don't even try.
> +
> +Upstream-Status: Inappropriate [Other]
> +Workaround suitable for OpenEmbedded, but not acceptable in generic case
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +diff -Nurd coreutils-8.20/Makefile.am coreutils-8.20/Makefile.am
> +--- coreutils-8.20/Makefile.am	2012-10-23 17:14:12.000000000 +0300
> ++++ coreutils-8.20/Makefile.am	2012-11-30 11:58:00.123358042 +0200
> +@@ -205,5 +205,5 @@
> + include $(top_srcdir)/lib/local.mk
> + include $(top_srcdir)/src/local.mk
> + include $(top_srcdir)/doc/local.mk
> +-include $(top_srcdir)/man/local.mk
> ++# include $(top_srcdir)/man/local.mk
> + include $(top_srcdir)/tests/local.mk
> diff --git a/meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.20/remove-usr-local-lib-from-m4.patch
> similarity index 100%
> rename from meta/recipes-core/coreutils/coreutils-8.14/remove-usr-local-lib-from-m4.patch
> rename to meta/recipes-core/coreutils/coreutils-8.20/remove-usr-local-lib-from-m4.patch
> diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.20.bb
> similarity index 91%
> rename from meta/recipes-core/coreutils/coreutils_8.14.bb
> rename to meta/recipes-core/coreutils/coreutils_8.20.bb
> index 3f58cfd..456d928 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.14.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.20.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
>   BUGTRACKER = "http://debbugs.gnu.org/coreutils"
>   LICENSE = "GPLv3+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
> -                    file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
> -PR = "r5"
> +                    file://src/ls.c;beginline=4;endline=15;md5=2e9acd8818fe6db4c2981d20ca632553"
> +PR = "r0"
>   DEPENDS = "gmp libcap"
>   DEPENDS_class-native = ""
>
> @@ -15,11 +15,12 @@ inherit autotools gettext
>
>   SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>              file://remove-usr-local-lib-from-m4.patch \
> -           file://remove-gets.patch \
>              file://coreutils-build-with-acl.patch \
> +           file://cross-prime-list.patch \
> +           file://noman.patch \
>             "
> -SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
> -SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
> +SRC_URI[md5sum] = "3d69af8f561fce512538a9fe85f147ff"
> +SRC_URI[sha256sum] = "dbcb798764827a0f74be738662ecb516705cf520330cd3d7b2640fdffa499eb2"
>
>   EXTRA_OECONF_class-native = "--without-gmp"
>
>


