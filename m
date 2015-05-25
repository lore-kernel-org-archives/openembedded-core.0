Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5E93D65C78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 18:30:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 May 2015 11:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,493,1427785200"; d="scan'208";a="735020925"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.144])
	([10.219.4.144])
	by orsmga002.jf.intel.com with ESMTP; 25 May 2015 11:30:45 -0700
Message-ID: <55636AA6.5030800@linux.intel.com>
Date: Mon, 25 May 2015 13:32:06 -0500
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Andre McCurdy <armccurdy@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1432253466-9933-1-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1432253466-9933-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH] gnutls: remove --with-libz-prefix configure option
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
X-List-Received-Date: Mon, 25 May 2015 18:30:49 -0000
X-Groupsio-MsgNum: 65990
Content-Type: multipart/mixed; boundary="------------030209080506070506030108"

--------------030209080506070506030108
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andre,

This patch broke gnutls build on multilib,

ERROR: QA Issue: gnutls: The compile log indicates that host include 
and/or library paths were used.
          Please check the log 
'/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/temp/log.do_compile' 
for more information. [compile-host-path]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa
ERROR: Logfile of failure stored in: 
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/temp/log.do_package_qa.25738
ERROR: Task 2411 
(/home/alimon/repos/poky/meta/recipes-support/gnutls/gnutls_3.3.14.bb, 
do_package_qa) failed with exit code '1

Kind regards,
     alimon

On 21/05/15 19:11, Andre McCurdy wrote:
> The default search path in sysroot is sufficient to find zlib, so the
> --with-libz-prefix configure option seems to be unnecessary.
>
> For target builds, relying on sysroot also prevents an absolute path
> from being hardcoded in the gnutls.pc pkg-config file.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>   meta/recipes-support/gnutls/gnutls.inc | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
> index 45fb529..87f275a 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -23,7 +23,6 @@ EXTRA_OECONF="--disable-rpath \
>                 --with-included-libtasn1 \
>                 --enable-local-libopts \
>                 --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
> -              --with-libz-prefix=${STAGING_DIR_HOST}${prefix} \
>                 --disable-guile \
>                 --disable-crywrap \
>                 --without-p11-kit \


--------------030209080506070506030108
Content-Type: text/plain; charset=UTF-8;
 name="log.do_compile"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="log.do_compile"

DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64=
', 'x86_64-linux', 'common']
DEBUG: Executing shell function do_compile
NOTE: make -j 48
make  all-recursive
make[1]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build'
Making all in gl
make[2]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/gl'
rm -f alloca.h-t alloca.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  cat /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/alloca.in.h; \
} > alloca.h-t && \
mv -f alloca.h-t alloca.h
rm -f c++defs.h-t c++defs.h && \
sed -n -e '/_GL_CXXDEFS/,$p' \
  < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/build-aux/snippet/c++defs.h \
  > c++defs.h-t && \
mv c++defs.h-t c++defs.h
rm -f arg-nonnull.h-t arg-nonnull.h && \
sed -n -e '/GL_ARG_NONNULL/,$p' \
  < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/build-aux/snippet/arg-nonnull.h \
  > arg-nonnull.h-t && \
mv arg-nonnull.h-t arg-nonnull.h
rm -f warn-on-use.h-t warn-on-use.h && \
sed -n -e '/^.ifndef/,$p' \
  < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/build-aux/snippet/warn-on-use.h \
  > warn-on-use.h-t && \
mv warn-on-use.h-t warn-on-use.h
rm -f stddef.h-t stddef.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_STDDEF_H''@|<stddef.h>|g' \
      -e 's|@''HAVE_MAX_ALIGN_T''@|0|g' \
      -e 's|@''HAVE_WCHAR_T''@|1|g' \
      -e 's|@''REPLACE_NULL''@|0|g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/stddef.in.h; \
} > stddef.h-t && \
mv stddef.h-t stddef.h
/usr/bin/mkdir -p sys
/usr/bin/mkdir -p sys
rm -f sys/types.h-t sys/types.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_SYS_TYPES_H''@|<sys/types.h>|g' \
      -e 's|@''WINDOWS_64_BIT_OFF_T''@|0|g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/sys_types.in.h; \
} > sys/types.h-t && \
mv sys/types.h-t sys/types.h
rm -f sys/uio.h-t sys/uio.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_SYS_UIO_H''@|<sys/uio.h>|g' \
      -e 's|@''HAVE_SYS_UIO_H''@|1|g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/sys_uio.in.h; \
} > sys/uio.h-t && \
mv -f sys/uio.h-t sys/uio.h
rm -f netdb.h-t netdb.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_NETDB_H''@|<netdb.h>|g' \
      -e 's|@''HAVE_NETDB_H''@|1|g' \
      -e 's/@''GNULIB_GETADDRINFO''@/1/g' \
      -e 's|@''HAVE_STRUCT_ADDRINFO''@|1|g' \
      -e 's|@''HAVE_DECL_FREEADDRINFO''@|1|g' \
      -e 's|@''HAVE_DECL_GAI_STRERROR''@|1|g' \
      -e 's|@''HAVE_DECL_GETADDRINFO''@|1|g' \
      -e 's|@''HAVE_DECL_GETNAMEINFO''@|1|g' \
      -e 's|@''REPLACE_GAI_STRERROR''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/netdb.in.h; \
} > netdb.h-t && \
mv netdb.h-t netdb.h
rm -f stdio.h-t stdio.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_STDIO_H''@|<stdio.h>|g' \
      -e 's/@''GNULIB_DPRINTF''@/0/g' \
      -e 's/@''GNULIB_FCLOSE''@/0/g' \
      -e 's/@''GNULIB_FDOPEN''@/IN_GNUTLS_GNULIB_TESTS/g' \
      -e 's/@''GNULIB_FFLUSH''@/0/g' \
      -e 's/@''GNULIB_FGETC''@/1/g' \
      -e 's/@''GNULIB_FGETS''@/1/g' \
      -e 's/@''GNULIB_FOPEN''@/0/g' \
      -e 's/@''GNULIB_FPRINTF''@/1/g' \
      -e 's/@''GNULIB_FPRINTF_POSIX''@/0/g' \
      -e 's/@''GNULIB_FPURGE''@/0/g' \
      -e 's/@''GNULIB_FPUTC''@/1/g' \
      -e 's/@''GNULIB_FPUTS''@/1/g' \
      -e 's/@''GNULIB_FREAD''@/1/g' \
      -e 's/@''GNULIB_FREOPEN''@/0/g' \
      -e 's/@''GNULIB_FSCANF''@/1/g' \
      -e 's/@''GNULIB_FSEEK''@/1/g' \
      -e 's/@''GNULIB_FSEEKO''@/1/g' \
      -e 's/@''GNULIB_FTELL''@/1/g' \
      -e 's/@''GNULIB_FTELLO''@/1/g' \
      -e 's/@''GNULIB_FWRITE''@/1/g' \
      -e 's/@''GNULIB_GETC''@/1/g' \
      -e 's/@''GNULIB_GETCHAR''@/1/g' \
      -e 's/@''GNULIB_GETDELIM''@/1/g' \
      -e 's/@''GNULIB_GETLINE''@/1/g' \
      -e 's/@''GNULIB_OBSTACK_PRINTF''@/0/g' \
      -e 's/@''GNULIB_OBSTACK_PRINTF_POSIX''@/0/g' \
      -e 's/@''GNULIB_PCLOSE''@/0/g' \
      -e 's/@''GNULIB_PERROR''@/0/g' \
      -e 's/@''GNULIB_POPEN''@/0/g' \
      -e 's/@''GNULIB_PRINTF''@/1/g' \
      -e 's/@''GNULIB_PRINTF_POSIX''@/0/g' \
      -e 's/@''GNULIB_PUTC''@/1/g' \
      -e 's/@''GNULIB_PUTCHAR''@/1/g' \
      -e 's/@''GNULIB_PUTS''@/1/g' \
      -e 's/@''GNULIB_REMOVE''@/0/g' \
      -e 's/@''GNULIB_RENAME''@/0/g' \
      -e 's/@''GNULIB_RENAMEAT''@/0/g' \
      -e 's/@''GNULIB_SCANF''@/1/g' \
      -e 's/@''GNULIB_SNPRINTF''@/1/g' \
      -e 's/@''GNULIB_SPRINTF_POSIX''@/0/g' \
      -e 's/@''GNULIB_STDIO_H_NONBLOCKING''@/0/g' \
      -e 's/@''GNULIB_STDIO_H_SIGPIPE''@/0/g' \
      -e 's/@''GNULIB_TMPFILE''@/0/g' \
      -e 's/@''GNULIB_VASPRINTF''@/1/g' \
      -e 's/@''GNULIB_VDPRINTF''@/0/g' \
      -e 's/@''GNULIB_VFPRINTF''@/1/g' \
      -e 's/@''GNULIB_VFPRINTF_POSIX''@/0/g' \
      -e 's/@''GNULIB_VFSCANF''@/0/g' \
      -e 's/@''GNULIB_VSCANF''@/0/g' \
      -e 's/@''GNULIB_VPRINTF''@/1/g' \
      -e 's/@''GNULIB_VPRINTF_POSIX''@/0/g' \
      -e 's/@''GNULIB_VSNPRINTF''@/1/g' \
      -e 's/@''GNULIB_VSPRINTF_POSIX''@/0/g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/stdio.in.h | \
  sed -e 's|@''HAVE_DECL_FPURGE''@|1|g' \
      -e 's|@''HAVE_DECL_FSEEKO''@|1|g' \
      -e 's|@''HAVE_DECL_FTELLO''@|1|g' \
      -e 's|@''HAVE_DECL_GETDELIM''@|1|g' \
      -e 's|@''HAVE_DECL_GETLINE''@|1|g' \
      -e 's|@''HAVE_DECL_OBSTACK_PRINTF''@|1|g' \
      -e 's|@''HAVE_DECL_SNPRINTF''@|1|g' \
      -e 's|@''HAVE_DECL_VSNPRINTF''@|1|g' \
      -e 's|@''HAVE_DPRINTF''@|1|g' \
      -e 's|@''HAVE_FSEEKO''@|1|g' \
      -e 's|@''HAVE_FTELLO''@|1|g' \
      -e 's|@''HAVE_PCLOSE''@|1|g' \
      -e 's|@''HAVE_POPEN''@|1|g' \
      -e 's|@''HAVE_RENAMEAT''@|1|g' \
      -e 's|@''HAVE_VASPRINTF''@|1|g' \
      -e 's|@''HAVE_VDPRINTF''@|1|g' \
      -e 's|@''REPLACE_DPRINTF''@|0|g' \
      -e 's|@''REPLACE_FCLOSE''@|0|g' \
      -e 's|@''REPLACE_FDOPEN''@|0|g' \
      -e 's|@''REPLACE_FFLUSH''@|0|g' \
      -e 's|@''REPLACE_FOPEN''@|0|g' \
      -e 's|@''REPLACE_FPRINTF''@|0|g' \
      -e 's|@''REPLACE_FPURGE''@|0|g' \
      -e 's|@''REPLACE_FREOPEN''@|0|g' \
      -e 's|@''REPLACE_FSEEK''@|0|g' \
      -e 's|@''REPLACE_FSEEKO''@|0|g' \
      -e 's|@''REPLACE_FTELL''@|0|g' \
      -e 's|@''REPLACE_FTELLO''@|0|g' \
      -e 's|@''REPLACE_GETDELIM''@|0|g' \
      -e 's|@''REPLACE_GETLINE''@|0|g' \
      -e 's|@''REPLACE_OBSTACK_PRINTF''@|0|g' \
      -e 's|@''REPLACE_PERROR''@|0|g' \
      -e 's|@''REPLACE_POPEN''@|0|g' \
      -e 's|@''REPLACE_PRINTF''@|0|g' \
      -e 's|@''REPLACE_REMOVE''@|0|g' \
      -e 's|@''REPLACE_RENAME''@|0|g' \
      -e 's|@''REPLACE_RENAMEAT''@|0|g' \
      -e 's|@''REPLACE_SNPRINTF''@|0|g' \
      -e 's|@''REPLACE_SPRINTF''@|0|g' \
      -e 's|@''REPLACE_STDIO_READ_FUNCS''@|0|g' \
      -e 's|@''REPLACE_STDIO_WRITE_FUNCS''@|0|g' \
      -e 's|@''REPLACE_TMPFILE''@|0|g' \
      -e 's|@''REPLACE_VASPRINTF''@|0|g' \
      -e 's|@''REPLACE_VDPRINTF''@|0|g' \
      -e 's|@''REPLACE_VFPRINTF''@|0|g' \
      -e 's|@''REPLACE_VPRINTF''@|0|g' \
      -e 's|@''REPLACE_VSNPRINTF''@|0|g' \
      -e 's|@''REPLACE_VSPRINTF''@|0|g' \
      -e 's|@''ASM_SYMBOL_PREFIX''@||g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
} > stdio.h-t && \
mv stdio.h-t stdio.h
rm -f stdlib.h-t stdlib.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_STDLIB_H''@|<stdlib.h>|g' \
      -e 's/@''GNULIB__EXIT''@/0/g' \
      -e 's/@''GNULIB_ATOLL''@/0/g' \
      -e 's/@''GNULIB_CALLOC_POSIX''@/0/g' \
      -e 's/@''GNULIB_CANONICALIZE_FILE_NAME''@/0/g' \
      -e 's/@''GNULIB_GETLOADAVG''@/0/g' \
      -e 's/@''GNULIB_GETSUBOPT''@/0/g' \
      -e 's/@''GNULIB_GRANTPT''@/0/g' \
      -e 's/@''GNULIB_MALLOC_POSIX''@/1/g' \
      -e 's/@''GNULIB_MBTOWC''@/0/g' \
      -e 's/@''GNULIB_MKDTEMP''@/0/g' \
      -e 's/@''GNULIB_MKOSTEMP''@/0/g' \
      -e 's/@''GNULIB_MKOSTEMPS''@/0/g' \
      -e 's/@''GNULIB_MKSTEMP''@/0/g' \
      -e 's/@''GNULIB_MKSTEMPS''@/0/g' \
      -e 's/@''GNULIB_POSIX_OPENPT''@/0/g' \
      -e 's/@''GNULIB_PTSNAME''@/0/g' \
      -e 's/@''GNULIB_PTSNAME_R''@/0/g' \
      -e 's/@''GNULIB_PUTENV''@/0/g' \
      -e 's/@''GNULIB_QSORT_R''@/0/g' \
      -e 's/@''GNULIB_RANDOM''@/0/g' \
      -e 's/@''GNULIB_RANDOM_R''@/0/g' \
      -e 's/@''GNULIB_REALLOC_POSIX''@/1/g' \
      -e 's/@''GNULIB_REALPATH''@/0/g' \
      -e 's/@''GNULIB_RPMATCH''@/0/g' \
      -e 's/@''GNULIB_SECURE_GETENV''@/0/g' \
      -e 's/@''GNULIB_SETENV''@/1/g' \
      -e 's/@''GNULIB_STRTOD''@/0/g' \
      -e 's/@''GNULIB_STRTOLL''@/0/g' \
      -e 's/@''GNULIB_STRTOULL''@/0/g' \
      -e 's/@''GNULIB_SYSTEM_POSIX''@/0/g' \
      -e 's/@''GNULIB_UNLOCKPT''@/0/g' \
      -e 's/@''GNULIB_UNSETENV''@/1/g' \
      -e 's/@''GNULIB_WCTOMB''@/0/g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/stdlib.in.h | \
  sed -e 's|@''HAVE__EXIT''@|1|g' \
      -e 's|@''HAVE_ATOLL''@|1|g' \
      -e 's|@''HAVE_CANONICALIZE_FILE_NAME''@|1|g' \
      -e 's|@''HAVE_DECL_GETLOADAVG''@|1|g' \
      -e 's|@''HAVE_GETSUBOPT''@|1|g' \
      -e 's|@''HAVE_GRANTPT''@|1|g' \
      -e 's|@''HAVE_MKDTEMP''@|1|g' \
      -e 's|@''HAVE_MKOSTEMP''@|1|g' \
      -e 's|@''HAVE_MKOSTEMPS''@|1|g' \
      -e 's|@''HAVE_MKSTEMP''@|1|g' \
      -e 's|@''HAVE_MKSTEMPS''@|1|g' \
      -e 's|@''HAVE_POSIX_OPENPT''@|1|g' \
      -e 's|@''HAVE_PTSNAME''@|1|g' \
      -e 's|@''HAVE_PTSNAME_R''@|1|g' \
      -e 's|@''HAVE_RANDOM''@|1|g' \
      -e 's|@''HAVE_RANDOM_H''@|1|g' \
      -e 's|@''HAVE_RANDOM_R''@|1|g' \
      -e 's|@''HAVE_REALPATH''@|1|g' \
      -e 's|@''HAVE_RPMATCH''@|1|g' \
      -e 's|@''HAVE_SECURE_GETENV''@|1|g' \
      -e 's|@''HAVE_DECL_SETENV''@|1|g' \
      -e 's|@''HAVE_STRTOD''@|1|g' \
      -e 's|@''HAVE_STRTOLL''@|1|g' \
      -e 's|@''HAVE_STRTOULL''@|1|g' \
      -e 's|@''HAVE_STRUCT_RANDOM_DATA''@|1|g' \
      -e 's|@''HAVE_SYS_LOADAVG_H''@|0|g' \
      -e 's|@''HAVE_UNLOCKPT''@|1|g' \
      -e 's|@''HAVE_DECL_UNSETENV''@|1|g' \
      -e 's|@''REPLACE_CALLOC''@|0|g' \
      -e 's|@''REPLACE_CANONICALIZE_FILE_NAME''@|0|g' \
      -e 's|@''REPLACE_MALLOC''@|0|g' \
      -e 's|@''REPLACE_MBTOWC''@|0|g' \
      -e 's|@''REPLACE_MKSTEMP''@|0|g' \
      -e 's|@''REPLACE_PTSNAME''@|0|g' \
      -e 's|@''REPLACE_PTSNAME_R''@|0|g' \
      -e 's|@''REPLACE_PUTENV''@|0|g' \
      -e 's|@''REPLACE_QSORT_R''@|0|g' \
      -e 's|@''REPLACE_RANDOM_R''@|0|g' \
      -e 's|@''REPLACE_REALLOC''@|0|g' \
      -e 's|@''REPLACE_REALPATH''@|0|g' \
      -e 's|@''REPLACE_SETENV''@|0|g' \
      -e 's|@''REPLACE_STRTOD''@|0|g' \
      -e 's|@''REPLACE_UNSETENV''@|0|g' \
      -e 's|@''REPLACE_WCTOMB''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _Noreturn/r /home/alimon/repos/poky/build-x86-64-m=
ultilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/build-a=
ux/snippet/_Noreturn.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
} > stdlib.h-t && \
mv stdlib.h-t stdlib.h
rm -f string.h-t string.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_STRING_H''@|<string.h>|g' \
      -e 's/@''GNULIB_FFSL''@/0/g' \
      -e 's/@''GNULIB_FFSLL''@/0/g' \
      -e 's/@''GNULIB_MBSLEN''@/0/g' \
      -e 's/@''GNULIB_MBSNLEN''@/0/g' \
      -e 's/@''GNULIB_MBSCHR''@/0/g' \
      -e 's/@''GNULIB_MBSRCHR''@/0/g' \
      -e 's/@''GNULIB_MBSSTR''@/0/g' \
      -e 's/@''GNULIB_MBSCASECMP''@/0/g' \
      -e 's/@''GNULIB_MBSNCASECMP''@/0/g' \
      -e 's/@''GNULIB_MBSPCASECMP''@/0/g' \
      -e 's/@''GNULIB_MBSCASESTR''@/0/g' \
      -e 's/@''GNULIB_MBSCSPN''@/0/g' \
      -e 's/@''GNULIB_MBSPBRK''@/0/g' \
      -e 's/@''GNULIB_MBSSPN''@/0/g' \
      -e 's/@''GNULIB_MBSSEP''@/0/g' \
      -e 's/@''GNULIB_MBSTOK_R''@/0/g' \
      -e 's/@''GNULIB_MEMCHR''@/1/g' \
      -e 's/@''GNULIB_MEMMEM''@/1/g' \
      -e 's/@''GNULIB_MEMPCPY''@/0/g' \
      -e 's/@''GNULIB_MEMRCHR''@/0/g' \
      -e 's/@''GNULIB_RAWMEMCHR''@/0/g' \
      -e 's/@''GNULIB_STPCPY''@/0/g' \
      -e 's/@''GNULIB_STPNCPY''@/0/g' \
      -e 's/@''GNULIB_STRCHRNUL''@/0/g' \
      -e 's/@''GNULIB_STRDUP''@/1/g' \
      -e 's/@''GNULIB_STRNCAT''@/0/g' \
      -e 's/@''GNULIB_STRNDUP''@/1/g' \
      -e 's/@''GNULIB_STRNLEN''@/1/g' \
      -e 's/@''GNULIB_STRPBRK''@/0/g' \
      -e 's/@''GNULIB_STRSEP''@/0/g' \
      -e 's/@''GNULIB_STRSTR''@/0/g' \
      -e 's/@''GNULIB_STRCASESTR''@/0/g' \
      -e 's/@''GNULIB_STRTOK_R''@/1/g' \
      -e 's/@''GNULIB_STRERROR''@/1/g' \
      -e 's/@''GNULIB_STRERROR_R''@/0/g' \
      -e 's/@''GNULIB_STRSIGNAL''@/0/g' \
      -e 's/@''GNULIB_STRVERSCMP''@/1/g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/string.in.h | \
  sed -e 's|@''HAVE_FFSL''@|1|g' \
      -e 's|@''HAVE_FFSLL''@|1|g' \
      -e 's|@''HAVE_MBSLEN''@|0|g' \
      -e 's|@''HAVE_MEMCHR''@|1|g' \
      -e 's|@''HAVE_DECL_MEMMEM''@|1|g' \
      -e 's|@''HAVE_MEMPCPY''@|1|g' \
      -e 's|@''HAVE_DECL_MEMRCHR''@|1|g' \
      -e 's|@''HAVE_RAWMEMCHR''@|1|g' \
      -e 's|@''HAVE_STPCPY''@|1|g' \
      -e 's|@''HAVE_STPNCPY''@|1|g' \
      -e 's|@''HAVE_STRCHRNUL''@|1|g' \
      -e 's|@''HAVE_DECL_STRDUP''@|1|g' \
      -e 's|@''HAVE_DECL_STRNDUP''@|1|g' \
      -e 's|@''HAVE_DECL_STRNLEN''@|1|g' \
      -e 's|@''HAVE_STRPBRK''@|1|g' \
      -e 's|@''HAVE_STRSEP''@|1|g' \
      -e 's|@''HAVE_STRCASESTR''@|1|g' \
      -e 's|@''HAVE_DECL_STRTOK_R''@|1|g' \
      -e 's|@''HAVE_DECL_STRERROR_R''@|1|g' \
      -e 's|@''HAVE_DECL_STRSIGNAL''@|1|g' \
      -e 's|@''HAVE_STRVERSCMP''@|1|g' \
      -e 's|@''REPLACE_STPNCPY''@|0|g' \
      -e 's|@''REPLACE_MEMCHR''@|1|g' \
      -e 's|@''REPLACE_MEMMEM''@|0|g' \
      -e 's|@''REPLACE_STRCASESTR''@|0|g' \
      -e 's|@''REPLACE_STRCHRNUL''@|0|g' \
      -e 's|@''REPLACE_STRDUP''@|0|g' \
      -e 's|@''REPLACE_STRSTR''@|0|g' \
      -e 's|@''REPLACE_STRERROR''@|0|g' \
      -e 's|@''REPLACE_STRERROR_R''@|0|g' \
      -e 's|@''REPLACE_STRNCAT''@|0|g' \
      -e 's|@''REPLACE_STRNDUP''@|0|g' \
      -e 's|@''REPLACE_STRNLEN''@|0|g' \
      -e 's|@''REPLACE_STRSIGNAL''@|0|g' \
      -e 's|@''REPLACE_STRTOK_R''@|0|g' \
      -e 's|@''UNDEFINE_STRTOK_R''@|1|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/string.in.h; \
} > string.h-t && \
mv string.h-t string.h
rm -f strings.h-t strings.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''HAVE_STRINGS_H''@|1|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_STRINGS_H''@|<strings.h>|g' \
      -e 's|@''GNULIB_FFS''@|0|g' \
      -e 's|@''HAVE_FFS''@|1|g' \
      -e 's|@''HAVE_STRCASECMP''@|1|g' \
      -e 's|@''HAVE_DECL_STRNCASECMP''@|1|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/strings.in.h; \
} > strings.h-t && \
mv strings.h-t strings.h
/usr/bin/mkdir -p sys
/usr/bin/mkdir -p sys
/usr/bin/mkdir -p sys
rm -f time.h-t time.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_TIME_H''@|<time.h>|g' \
      -e 's/@''GNULIB_GETTIMEOFDAY''@/1/g' \
      -e 's/@''GNULIB_MKTIME''@/1/g' \
      -e 's/@''GNULIB_NANOSLEEP''@/0/g' \
      -e 's/@''GNULIB_STRPTIME''@/0/g' \
      -e 's/@''GNULIB_TIMEGM''@/0/g' \
      -e 's/@''GNULIB_TIME_R''@/1/g' \
      -e 's|@''HAVE_DECL_LOCALTIME_R''@|1|g' \
      -e 's|@''HAVE_NANOSLEEP''@|1|g' \
      -e 's|@''HAVE_STRPTIME''@|1|g' \
      -e 's|@''HAVE_TIMEGM''@|1|g' \
      -e 's|@''REPLACE_GMTIME''@|0|g' \
      -e 's|@''REPLACE_LOCALTIME''@|0|g' \
      -e 's|@''REPLACE_LOCALTIME_R''@|0|g' \
      -e 's|@''REPLACE_MKTIME''@|1|g' \
      -e 's|@''REPLACE_NANOSLEEP''@|GNULIB_PORTCHECK|g' \
      -e 's|@''REPLACE_TIMEGM''@|GNULIB_PORTCHECK|g' \
      -e 's|@''PTHREAD_H_DEFINES_STRUCT_TIMESPEC''@|0|g' \
      -e 's|@''SYS_TIME_H_DEFINES_STRUCT_TIMESPEC''@|0|g' \
      -e 's|@''TIME_H_DEFINES_STRUCT_TIMESPEC''@|1|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/time.in.h; \
} > time.h-t && \
mv time.h-t time.h
rm -f sys/socket.h-t sys/socket.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_SYS_SOCKET_H''@|<sys/socket.h>|g' \
      -e 's|@''HAVE_SYS_SOCKET_H''@|1|g' \
      -e 's/@''GNULIB_CLOSE''@/1/g' \
      -e 's/@''GNULIB_SOCKET''@/1/g' \
      -e 's/@''GNULIB_CONNECT''@/1/g' \
      -e 's/@''GNULIB_ACCEPT''@/1/g' \
      -e 's/@''GNULIB_BIND''@/1/g' \
      -e 's/@''GNULIB_GETPEERNAME''@/1/g' \
      -e 's/@''GNULIB_GETSOCKNAME''@/0/g' \
      -e 's/@''GNULIB_GETSOCKOPT''@/0/g' \
      -e 's/@''GNULIB_LISTEN''@/1/g' \
      -e 's/@''GNULIB_RECV''@/1/g' \
      -e 's/@''GNULIB_SEND''@/1/g' \
      -e 's/@''GNULIB_RECVFROM''@/1/g' \
      -e 's/@''GNULIB_SENDTO''@/1/g' \
      -e 's/@''GNULIB_SETSOCKOPT''@/1/g' \
      -e 's/@''GNULIB_SHUTDOWN''@/1/g' \
      -e 's/@''GNULIB_ACCEPT4''@/0/g' \
      -e 's|@''HAVE_WINSOCK2_H''@|0|g' \
      -e 's|@''HAVE_WS2TCPIP_H''@|0|g' \
      -e 's|@''HAVE_STRUCT_SOCKADDR_STORAGE''@|1|g' \
      -e 's|@''HAVE_STRUCT_SOCKADDR_STORAGE_SS_FAMILY''@|1|g' \
      -e 's|@''HAVE_SA_FAMILY_T''@|1|g' \
      -e 's|@''HAVE_ACCEPT4''@|1|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/sys_socket.in.h; \
} > sys/socket.h-t && \
mv -f sys/socket.h-t sys/socket.h
rm -f sys/stat.h-t sys/stat.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_SYS_STAT_H''@|<sys/stat.h>|g' \
      -e 's|@''WINDOWS_64_BIT_ST_SIZE''@|0|g' \
      -e 's/@''GNULIB_FCHMODAT''@/0/g' \
      -e 's/@''GNULIB_FSTAT''@/1/g' \
      -e 's/@''GNULIB_FSTATAT''@/0/g' \
      -e 's/@''GNULIB_FUTIMENS''@/0/g' \
      -e 's/@''GNULIB_LCHMOD''@/0/g' \
      -e 's/@''GNULIB_LSTAT''@/0/g' \
      -e 's/@''GNULIB_MKDIRAT''@/0/g' \
      -e 's/@''GNULIB_MKFIFO''@/0/g' \
      -e 's/@''GNULIB_MKFIFOAT''@/0/g' \
      -e 's/@''GNULIB_MKNOD''@/0/g' \
      -e 's/@''GNULIB_MKNODAT''@/0/g' \
      -e 's/@''GNULIB_STAT''@/0/g' \
      -e 's/@''GNULIB_UTIMENSAT''@/0/g' \
      -e 's|@''HAVE_FCHMODAT''@|1|g' \
      -e 's|@''HAVE_FSTATAT''@|1|g' \
      -e 's|@''HAVE_FUTIMENS''@|1|g' \
      -e 's|@''HAVE_LCHMOD''@|1|g' \
      -e 's|@''HAVE_LSTAT''@|1|g' \
      -e 's|@''HAVE_MKDIRAT''@|1|g' \
      -e 's|@''HAVE_MKFIFO''@|1|g' \
      -e 's|@''HAVE_MKFIFOAT''@|1|g' \
      -e 's|@''HAVE_MKNOD''@|1|g' \
      -e 's|@''HAVE_MKNODAT''@|1|g' \
      -e 's|@''HAVE_UTIMENSAT''@|1|g' \
      -e 's|@''REPLACE_FSTAT''@|0|g' \
      -e 's|@''REPLACE_FSTATAT''@|0|g' \
      -e 's|@''REPLACE_FUTIMENS''@|0|g' \
      -e 's|@''REPLACE_LSTAT''@|0|g' \
      -e 's|@''REPLACE_MKDIR''@|0|g' \
      -e 's|@''REPLACE_MKFIFO''@|0|g' \
      -e 's|@''REPLACE_MKNOD''@|0|g' \
      -e 's|@''REPLACE_STAT''@|0|g' \
      -e 's|@''REPLACE_UTIMENSAT''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/sys_stat.in.h; \
} > sys/stat.h-t && \
mv sys/stat.h-t sys/stat.h
rm -f sys/time.h-t sys/time.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's/@''HAVE_SYS_TIME_H''@/1/g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_SYS_TIME_H''@|<sys/time.h>|g' \
      -e 's/@''GNULIB_GETTIMEOFDAY''@/1/g' \
      -e 's|@''HAVE_WINSOCK2_H''@|0|g' \
      -e 's/@''HAVE_GETTIMEOFDAY''@/1/g' \
      -e 's/@''HAVE_STRUCT_TIMEVAL''@/1/g' \
      -e 's/@''REPLACE_GETTIMEOFDAY''@/0/g' \
      -e 's/@''REPLACE_STRUCT_TIMEVAL''@/0/g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/sys_time.in.h; \
} > sys/time.h-t && \
mv sys/time.h-t sys/time.h
rm -f unistd.h-t unistd.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''HAVE_UNISTD_H''@|1|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_UNISTD_H''@|<unistd.h>|g' \
      -e 's|@''WINDOWS_64_BIT_OFF_T''@|0|g' \
      -e 's/@''GNULIB_CHDIR''@/0/g' \
      -e 's/@''GNULIB_CHOWN''@/0/g' \
      -e 's/@''GNULIB_CLOSE''@/1/g' \
      -e 's/@''GNULIB_DUP''@/0/g' \
      -e 's/@''GNULIB_DUP2''@/1/g' \
      -e 's/@''GNULIB_DUP3''@/0/g' \
      -e 's/@''GNULIB_ENVIRON''@/1/g' \
      -e 's/@''GNULIB_EUIDACCESS''@/0/g' \
      -e 's/@''GNULIB_FACCESSAT''@/0/g' \
      -e 's/@''GNULIB_FCHDIR''@/0/g' \
      -e 's/@''GNULIB_FCHOWNAT''@/0/g' \
      -e 's/@''GNULIB_FDATASYNC''@/0/g' \
      -e 's/@''GNULIB_FSYNC''@/0/g' \
      -e 's/@''GNULIB_FTRUNCATE''@/0/g' \
      -e 's/@''GNULIB_GETCWD''@/0/g' \
      -e 's/@''GNULIB_GETDOMAINNAME''@/0/g' \
      -e 's/@''GNULIB_GETDTABLESIZE''@/0/g' \
      -e 's/@''GNULIB_GETGROUPS''@/0/g' \
      -e 's/@''GNULIB_GETHOSTNAME''@/0/g' \
      -e 's/@''GNULIB_GETLOGIN''@/0/g' \
      -e 's/@''GNULIB_GETLOGIN_R''@/0/g' \
      -e 's/@''GNULIB_GETPAGESIZE''@/IN_GNUTLS_GNULIB_TESTS/g' \
      -e 's/@''GNULIB_GETUSERSHELL''@/0/g' \
      -e 's/@''GNULIB_GROUP_MEMBER''@/0/g' \
      -e 's/@''GNULIB_ISATTY''@/0/g' \
      -e 's/@''GNULIB_LCHOWN''@/0/g' \
      -e 's/@''GNULIB_LINK''@/0/g' \
      -e 's/@''GNULIB_LINKAT''@/0/g' \
      -e 's/@''GNULIB_LSEEK''@/1/g' \
      -e 's/@''GNULIB_PIPE''@/0/g' \
      -e 's/@''GNULIB_PIPE2''@/0/g' \
      -e 's/@''GNULIB_PREAD''@/0/g' \
      -e 's/@''GNULIB_PWRITE''@/0/g' \
      -e 's/@''GNULIB_READ''@/0/g' \
      -e 's/@''GNULIB_READLINK''@/0/g' \
      -e 's/@''GNULIB_READLINKAT''@/0/g' \
      -e 's/@''GNULIB_RMDIR''@/0/g' \
      -e 's/@''GNULIB_SETHOSTNAME''@/0/g' \
      -e 's/@''GNULIB_SLEEP''@/0/g' \
      -e 's/@''GNULIB_SYMLINK''@/0/g' \
      -e 's/@''GNULIB_SYMLINKAT''@/0/g' \
      -e 's/@''GNULIB_TTYNAME_R''@/0/g' \
      -e 's/@''GNULIB_UNISTD_H_GETOPT''@/0/g' \
      -e 's/@''GNULIB_UNISTD_H_NONBLOCKING''@/0/g' \
      -e 's/@''GNULIB_UNISTD_H_SIGPIPE''@/0/g' \
      -e 's/@''GNULIB_UNLINK''@/0/g' \
      -e 's/@''GNULIB_UNLINKAT''@/0/g' \
      -e 's/@''GNULIB_USLEEP''@/0/g' \
      -e 's/@''GNULIB_WRITE''@/0/g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/unistd.in.h | \
  sed -e 's|@''HAVE_CHOWN''@|1|g' \
      -e 's|@''HAVE_DUP2''@|1|g' \
      -e 's|@''HAVE_DUP3''@|1|g' \
      -e 's|@''HAVE_EUIDACCESS''@|1|g' \
      -e 's|@''HAVE_FACCESSAT''@|1|g' \
      -e 's|@''HAVE_FCHDIR''@|1|g' \
      -e 's|@''HAVE_FCHOWNAT''@|1|g' \
      -e 's|@''HAVE_FDATASYNC''@|1|g' \
      -e 's|@''HAVE_FSYNC''@|1|g' \
      -e 's|@''HAVE_FTRUNCATE''@|1|g' \
      -e 's|@''HAVE_GETDTABLESIZE''@|1|g' \
      -e 's|@''HAVE_GETGROUPS''@|1|g' \
      -e 's|@''HAVE_GETHOSTNAME''@|1|g' \
      -e 's|@''HAVE_GETLOGIN''@|1|g' \
      -e 's|@''HAVE_GETPAGESIZE''@|1|g' \
      -e 's|@''HAVE_GROUP_MEMBER''@|1|g' \
      -e 's|@''HAVE_LCHOWN''@|1|g' \
      -e 's|@''HAVE_LINK''@|1|g' \
      -e 's|@''HAVE_LINKAT''@|1|g' \
      -e 's|@''HAVE_PIPE''@|1|g' \
      -e 's|@''HAVE_PIPE2''@|1|g' \
      -e 's|@''HAVE_PREAD''@|1|g' \
      -e 's|@''HAVE_PWRITE''@|1|g' \
      -e 's|@''HAVE_READLINK''@|1|g' \
      -e 's|@''HAVE_READLINKAT''@|1|g' \
      -e 's|@''HAVE_SETHOSTNAME''@|1|g' \
      -e 's|@''HAVE_SLEEP''@|1|g' \
      -e 's|@''HAVE_SYMLINK''@|1|g' \
      -e 's|@''HAVE_SYMLINKAT''@|1|g' \
      -e 's|@''HAVE_UNLINKAT''@|1|g' \
      -e 's|@''HAVE_USLEEP''@|1|g' \
      -e 's|@''HAVE_DECL_ENVIRON''@|1|g' \
      -e 's|@''HAVE_DECL_FCHDIR''@|1|g' \
      -e 's|@''HAVE_DECL_FDATASYNC''@|1|g' \
      -e 's|@''HAVE_DECL_GETDOMAINNAME''@|1|g' \
      -e 's|@''HAVE_DECL_GETLOGIN_R''@|1|g' \
      -e 's|@''HAVE_DECL_GETPAGESIZE''@|1|g' \
      -e 's|@''HAVE_DECL_GETUSERSHELL''@|1|g' \
      -e 's|@''HAVE_DECL_SETHOSTNAME''@|1|g' \
      -e 's|@''HAVE_DECL_TTYNAME_R''@|1|g' \
      -e 's|@''HAVE_OS_H''@|0|g' \
      -e 's|@''HAVE_SYS_PARAM_H''@|0|g' \
  | \
  sed -e 's|@''REPLACE_CHOWN''@|0|g' \
      -e 's|@''REPLACE_CLOSE''@|0|g' \
      -e 's|@''REPLACE_DUP''@|0|g' \
      -e 's|@''REPLACE_DUP2''@|1|g' \
      -e 's|@''REPLACE_FCHOWNAT''@|0|g' \
      -e 's|@''REPLACE_FTRUNCATE''@|0|g' \
      -e 's|@''REPLACE_GETCWD''@|0|g' \
      -e 's|@''REPLACE_GETDOMAINNAME''@|0|g' \
      -e 's|@''REPLACE_GETDTABLESIZE''@|0|g' \
      -e 's|@''REPLACE_GETLOGIN_R''@|0|g' \
      -e 's|@''REPLACE_GETGROUPS''@|0|g' \
      -e 's|@''REPLACE_GETPAGESIZE''@|0|g' \
      -e 's|@''REPLACE_ISATTY''@|0|g' \
      -e 's|@''REPLACE_LCHOWN''@|0|g' \
      -e 's|@''REPLACE_LINK''@|0|g' \
      -e 's|@''REPLACE_LINKAT''@|0|g' \
      -e 's|@''REPLACE_LSEEK''@|0|g' \
      -e 's|@''REPLACE_PREAD''@|0|g' \
      -e 's|@''REPLACE_PWRITE''@|0|g' \
      -e 's|@''REPLACE_READ''@|0|g' \
      -e 's|@''REPLACE_READLINK''@|0|g' \
      -e 's|@''REPLACE_READLINKAT''@|0|g' \
      -e 's|@''REPLACE_RMDIR''@|0|g' \
      -e 's|@''REPLACE_SLEEP''@|0|g' \
      -e 's|@''REPLACE_SYMLINK''@|0|g' \
      -e 's|@''REPLACE_SYMLINKAT''@|0|g' \
      -e 's|@''REPLACE_TTYNAME_R''@|0|g' \
      -e 's|@''REPLACE_UNLINK''@|0|g' \
      -e 's|@''REPLACE_UNLINKAT''@|0|g' \
      -e 's|@''REPLACE_USLEEP''@|0|g' \
      -e 's|@''REPLACE_WRITE''@|0|g' \
      -e 's|@''UNISTD_H_HAVE_WINSOCK2_H''@|0|g' \
      -e 's|@''UNISTD_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
} > unistd.h-t && \
mv unistd.h-t unistd.h
rm -f wchar.h-t wchar.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''HAVE_FEATURES_H''@|1|g' \
      -e 's|@''NEXT_WCHAR_H''@|<wchar.h>|g' \
      -e 's|@''HAVE_WCHAR_H''@|1|g' \
      -e 's/@''GNULIB_BTOWC''@/0/g' \
      -e 's/@''GNULIB_WCTOB''@/0/g' \
      -e 's/@''GNULIB_MBSINIT''@/0/g' \
      -e 's/@''GNULIB_MBRTOWC''@/0/g' \
      -e 's/@''GNULIB_MBRLEN''@/0/g' \
      -e 's/@''GNULIB_MBSRTOWCS''@/0/g' \
      -e 's/@''GNULIB_MBSNRTOWCS''@/0/g' \
      -e 's/@''GNULIB_WCRTOMB''@/0/g' \
      -e 's/@''GNULIB_WCSRTOMBS''@/0/g' \
      -e 's/@''GNULIB_WCSNRTOMBS''@/0/g' \
      -e 's/@''GNULIB_WCWIDTH''@/0/g' \
      -e 's/@''GNULIB_WMEMCHR''@/0/g' \
      -e 's/@''GNULIB_WMEMCMP''@/0/g' \
      -e 's/@''GNULIB_WMEMCPY''@/0/g' \
      -e 's/@''GNULIB_WMEMMOVE''@/0/g' \
      -e 's/@''GNULIB_WMEMSET''@/0/g' \
      -e 's/@''GNULIB_WCSLEN''@/0/g' \
      -e 's/@''GNULIB_WCSNLEN''@/0/g' \
      -e 's/@''GNULIB_WCSCPY''@/0/g' \
      -e 's/@''GNULIB_WCPCPY''@/0/g' \
      -e 's/@''GNULIB_WCSNCPY''@/0/g' \
      -e 's/@''GNULIB_WCPNCPY''@/0/g' \
      -e 's/@''GNULIB_WCSCAT''@/0/g' \
      -e 's/@''GNULIB_WCSNCAT''@/0/g' \
      -e 's/@''GNULIB_WCSCMP''@/0/g' \
      -e 's/@''GNULIB_WCSNCMP''@/0/g' \
      -e 's/@''GNULIB_WCSCASECMP''@/0/g' \
      -e 's/@''GNULIB_WCSNCASECMP''@/0/g' \
      -e 's/@''GNULIB_WCSCOLL''@/0/g' \
      -e 's/@''GNULIB_WCSXFRM''@/0/g' \
      -e 's/@''GNULIB_WCSDUP''@/0/g' \
      -e 's/@''GNULIB_WCSCHR''@/0/g' \
      -e 's/@''GNULIB_WCSRCHR''@/0/g' \
      -e 's/@''GNULIB_WCSCSPN''@/0/g' \
      -e 's/@''GNULIB_WCSSPN''@/0/g' \
      -e 's/@''GNULIB_WCSPBRK''@/0/g' \
      -e 's/@''GNULIB_WCSSTR''@/0/g' \
      -e 's/@''GNULIB_WCSTOK''@/0/g' \
      -e 's/@''GNULIB_WCSWIDTH''@/0/g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/wchar.in.h | \
  sed -e 's|@''HAVE_WINT_T''@|1|g' \
      -e 's|@''HAVE_BTOWC''@|1|g' \
      -e 's|@''HAVE_MBSINIT''@|1|g' \
      -e 's|@''HAVE_MBRTOWC''@|1|g' \
      -e 's|@''HAVE_MBRLEN''@|1|g' \
      -e 's|@''HAVE_MBSRTOWCS''@|1|g' \
      -e 's|@''HAVE_MBSNRTOWCS''@|1|g' \
      -e 's|@''HAVE_WCRTOMB''@|1|g' \
      -e 's|@''HAVE_WCSRTOMBS''@|1|g' \
      -e 's|@''HAVE_WCSNRTOMBS''@|1|g' \
      -e 's|@''HAVE_WMEMCHR''@|1|g' \
      -e 's|@''HAVE_WMEMCMP''@|1|g' \
      -e 's|@''HAVE_WMEMCPY''@|1|g' \
      -e 's|@''HAVE_WMEMMOVE''@|1|g' \
      -e 's|@''HAVE_WMEMSET''@|1|g' \
      -e 's|@''HAVE_WCSLEN''@|1|g' \
      -e 's|@''HAVE_WCSNLEN''@|1|g' \
      -e 's|@''HAVE_WCSCPY''@|1|g' \
      -e 's|@''HAVE_WCPCPY''@|1|g' \
      -e 's|@''HAVE_WCSNCPY''@|1|g' \
      -e 's|@''HAVE_WCPNCPY''@|1|g' \
      -e 's|@''HAVE_WCSCAT''@|1|g' \
      -e 's|@''HAVE_WCSNCAT''@|1|g' \
      -e 's|@''HAVE_WCSCMP''@|1|g' \
      -e 's|@''HAVE_WCSNCMP''@|1|g' \
      -e 's|@''HAVE_WCSCASECMP''@|1|g' \
      -e 's|@''HAVE_WCSNCASECMP''@|1|g' \
      -e 's|@''HAVE_WCSCOLL''@|1|g' \
      -e 's|@''HAVE_WCSXFRM''@|1|g' \
      -e 's|@''HAVE_WCSDUP''@|1|g' \
      -e 's|@''HAVE_WCSCHR''@|1|g' \
      -e 's|@''HAVE_WCSRCHR''@|1|g' \
      -e 's|@''HAVE_WCSCSPN''@|1|g' \
      -e 's|@''HAVE_WCSSPN''@|1|g' \
      -e 's|@''HAVE_WCSPBRK''@|1|g' \
      -e 's|@''HAVE_WCSSTR''@|1|g' \
      -e 's|@''HAVE_WCSTOK''@|1|g' \
      -e 's|@''HAVE_WCSWIDTH''@|1|g' \
      -e 's|@''HAVE_DECL_WCTOB''@|1|g' \
      -e 's|@''HAVE_DECL_WCWIDTH''@|1|g' \
  | \
  sed -e 's|@''REPLACE_MBSTATE_T''@|0|g' \
      -e 's|@''REPLACE_BTOWC''@|0|g' \
      -e 's|@''REPLACE_WCTOB''@|0|g' \
      -e 's|@''REPLACE_MBSINIT''@|0|g' \
      -e 's|@''REPLACE_MBRTOWC''@|0|g' \
      -e 's|@''REPLACE_MBRLEN''@|0|g' \
      -e 's|@''REPLACE_MBSRTOWCS''@|0|g' \
      -e 's|@''REPLACE_MBSNRTOWCS''@|0|g' \
      -e 's|@''REPLACE_WCRTOMB''@|0|g' \
      -e 's|@''REPLACE_WCSRTOMBS''@|0|g' \
      -e 's|@''REPLACE_WCSNRTOMBS''@|0|g' \
      -e 's|@''REPLACE_WCWIDTH''@|0|g' \
      -e 's|@''REPLACE_WCSWIDTH''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
} > wchar.h-t && \
mv wchar.h-t wchar.h
make  all-recursive
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/gl'
Making all in tests
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/gl/tests'
rm -f c++defs.h-t c++defs.h && \
sed -n -e '/_GL_CXXDEFS/,$p' \
  < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/build-aux/snippet/c++defs.h \
  > c++defs.h-t && \
mv c++defs.h-t c++defs.h
rm -f arg-nonnull.h-t arg-nonnull.h && \
sed -n -e '/GL_ARG_NONNULL/,$p' \
  < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/build-aux/snippet/arg-nonnull.h \
  > arg-nonnull.h-t && \
mv arg-nonnull.h-t arg-nonnull.h
rm -f warn-on-use.h-t warn-on-use.h && \
sed -n -e '/^.ifndef/,$p' \
  < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/build-aux/snippet/warn-on-use.h \
  > warn-on-use.h-t && \
mv warn-on-use.h-t warn-on-use.h
rm -f fcntl.h-t fcntl.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_FCNTL_H''@|<fcntl.h>|g' \
      -e 's/@''GNULIB_FCNTL''@/0/g' \
      -e 's/@''GNULIB_NONBLOCKING''@/0/g' \
      -e 's/@''GNULIB_OPEN''@/0/g' \
      -e 's/@''GNULIB_OPENAT''@/0/g' \
      -e 's|@''HAVE_FCNTL''@|1|g' \
      -e 's|@''HAVE_OPENAT''@|1|g' \
      -e 's|@''REPLACE_FCNTL''@|0|g' \
      -e 's|@''REPLACE_OPEN''@|0|g' \
      -e 's|@''REPLACE_OPENAT''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/tests/fcntl.in.h; \
} > fcntl.h-t && \
mv fcntl.h-t fcntl.h
rm -f inttypes.h-t inttypes.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's/@''HAVE_INTTYPES_H''@/1/g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_INTTYPES_H''@|<inttypes.h>|g' \
      -e 's/@''PRI_MACROS_BROKEN''@/0/g' \
      -e 's/@''APPLE_UNIVERSAL_BUILD''@/0/g' \
      -e 's/@''HAVE_LONG_LONG_INT''@/1/g' \
      -e 's/@''HAVE_UNSIGNED_LONG_LONG_INT''@/1/g' \
      -e 's/@''PRIPTR_PREFIX''@/"l"/g' \
      -e 's/@''GNULIB_IMAXABS''@/0/g' \
      -e 's/@''GNULIB_IMAXDIV''@/0/g' \
      -e 's/@''GNULIB_STRTOIMAX''@/0/g' \
      -e 's/@''GNULIB_STRTOUMAX''@/0/g' \
      -e 's/@''HAVE_DECL_IMAXABS''@/1/g' \
      -e 's/@''HAVE_DECL_IMAXDIV''@/1/g' \
      -e 's/@''HAVE_DECL_STRTOIMAX''@/1/g' \
      -e 's/@''HAVE_DECL_STRTOUMAX''@/1/g' \
      -e 's/@''REPLACE_STRTOIMAX''@/0/g' \
      -e 's/@''REPLACE_STRTOUMAX''@/0/g' \
      -e 's/@''INT32_MAX_LT_INTMAX_MAX''@/1/g' \
      -e 's/@''INT64_MAX_EQ_LONG_MAX''@/1/g' \
      -e 's/@''UINT32_MAX_LT_UINTMAX_MAX''@/1/g' \
      -e 's/@''UINT64_MAX_EQ_ULONG_MAX''@/1/g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/tests/inttypes.in.h; \
} > inttypes.h-t && \
mv inttypes.h-t inttypes.h
make  all-recursive
make[5]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/gl/tests'
Making all in .
make[6]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/gl/tests'
make[6]: Nothing to be done for `all-am'.
make[6]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/gl/tests'
make[5]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/gl/tests'
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/gl/tests'
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/gl'
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I..     -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o base64.lo /home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/gl/base64.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I..     -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o c-ctype.lo /home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/gl/c-ctype.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I..     -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o hash-pjw-bare.lo /home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnu=
tls-3.3.14/gl/hash-pjw-bare.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I..     -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o read-file.lo /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/gl/read-file.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I..     -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o sys_socket.lo /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/gl/sys_socket.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I..     -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o u64.lo /home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/gl/u64.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I..     -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o unistd.lo /home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/gl/unistd.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I..     -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o xsize.lo /home/alimon/repos/poky/buil=
d-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.=
14/gl/xsize.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I..     -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o asnprintf.lo /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/gl/asnprintf.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I..     -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o memchr.lo /home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/gl/memchr.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I..     -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o printf-args.lo /home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutl=
s-3.3.14/gl/printf-args.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I..     -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o printf-parse.lo /home/alimon/repos/po=
ky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnut=
ls-3.3.14/gl/printf-parse.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I..     -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o vasnprintf.lo /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/gl/vasnprintf.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/gl -I.. -O2 -pipe -g -feliminate-unused-debug-typ=
es -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/base64.c  -fPIC -DPIC -o .libs/base=
64.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/gl -I.. -O2 -pipe -g -feliminate-unused-debug-typ=
es -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/c-ctype.c  -fPIC -DPIC -o .libs/c-c=
type.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/gl -I.. -O2 -pipe -g -feliminate-unused-debug-typ=
es -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/hash-pjw-bare.c  -fPIC -DPIC -o .li=
bs/hash-pjw-bare.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/gl -I.. -O2 -pipe -g -feliminate-unused-debug-typ=
es -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/read-file.c  -fPIC -DPIC -o .libs/r=
ead-file.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/gl -I.. -O2 -pipe -g -feliminate-unused-debug-typ=
es -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/sys_socket.c  -fPIC -DPIC -o .libs/=
sys_socket.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/gl -I.. -O2 -pipe -g -feliminate-unused-debug-typ=
es -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/memchr.c  -fPIC -DPIC -o .libs/memc=
hr.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/gl -I.. -O2 -pipe -g -feliminate-unused-debug-typ=
es -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/u64.c  -fPIC -DPIC -o .libs/u64.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/gl -I.. -O2 -pipe -g -feliminate-unused-debug-typ=
es -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/printf-parse.c  -fPIC -DPIC -o .lib=
s/printf-parse.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/gl -I.. -O2 -pipe -g -feliminate-unused-debug-typ=
es -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/unistd.c  -fPIC -DPIC -o .libs/unis=
td.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/gl -I.. -O2 -pipe -g -feliminate-unused-debug-typ=
es -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/printf-args.c  -fPIC -DPIC -o .libs=
/printf-args.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/gl -I.. -O2 -pipe -g -feliminate-unused-debug-typ=
es -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/xsize.c  -fPIC -DPIC -o .libs/xsize=
.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/gl -I.. -O2 -pipe -g -feliminate-unused-debug-typ=
es -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/vasnprintf.c  -fPIC -DPIC -o .libs/=
vasnprintf.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/gl -I.. -O2 -pipe -g -feliminate-unused-debug-typ=
es -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl/asnprintf.c  -fPIC -DPIC -o .libs/a=
snprintf.o
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64  -O2 -=
pipe -g -feliminate-unused-debug-types  -no-undefined   -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o libgnu.la  base64.lo c-ctype.lo hash-pjw-bar=
e.lo read-file.lo sys_socket.lo u64.lo unistd.lo xsize.lo asnprintf.lo memc=
hr.lo printf-args.lo printf-parse.lo vasnprintf.lo =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libgnu.a .l=
ibs/base64.o .libs/c-ctype.o .libs/hash-pjw-bare.o .libs/read-file.o .libs/=
sys_socket.o .libs/u64.o .libs/unistd.o .libs/xsize.o .libs/asnprintf.o .li=
bs/memchr.o .libs/printf-args.o .libs/printf-parse.o .libs/vasnprintf.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libgnu.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libgnu.la" && ln -s=
 "../libgnu.la" "libgnu.la" )
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/gl'
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/gl'
make[2]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/gl'
Making all in lib
make[2]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib'
make  all-recursive
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib'
Making all in includes
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/includes'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/includes'
Making all in x509
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/x509'
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o common.lo /ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/x509/common.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o key_encode.lo=
 /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/key_encode.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o key_decode.lo=
 /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/key_decode.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o crl.lo /home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/x509/crl.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o crl_write.lo =
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/crl_write.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o crq.lo /home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/x509/crq.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o dn.lo /home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/x509/dn.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o extensions.lo=
 /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/extensions.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o mpi.lo /home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/x509/mpi.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o output.lo /ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/x509/output.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o pbkdf2-sha1.l=
o /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/pbkdf2-sha1.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o pkcs12.lo /ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/x509/pkcs12.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o pkcs12_bag.lo=
 /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/pkcs12_bag.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o pkcs12_encr.l=
o /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/pkcs12_encr.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o pkcs7.lo /hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/lib/x509/pkcs7.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o privkey.lo /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/privkey.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o privkey_pkcs8=
.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/privkey_pkcs8.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o privkey_opens=
sl.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/privkey_openssl.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o rfc2818_hostn=
ame.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky=
-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/rfc2818_hostname.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o sign.lo /home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509/sign.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o verify.lo /ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/x509/verify.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o x509.lo /home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509/x509.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o x509_dn.lo /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/x509_dn.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o x509_write.lo=
 /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/x509_write.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o name_constrai=
nts.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky=
-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/name_constraints.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o verify-high.l=
o /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/verify-high.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o verify-high2.=
lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-lin=
ux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/verify-high2.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o x509_ext.lo /=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/x509_ext.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o ocsp.lo /home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509/ocsp.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/x509/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/x509/../includes -I./../includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509/..  -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../mini=
tasn1       -O2 -pipe -g -feliminate-unused-debug-types -c -o ocsp_output.l=
o /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/ocsp_output.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/extensions.=
c  -fPIC -DPIC -o .libs/extensions.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/crq.c  -fPI=
C -DPIC -o .libs/crq.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/pkcs12_encr=
.c  -fPIC -DPIC -o .libs/pkcs12_encr.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/mpi.c  -fPI=
C -DPIC -o .libs/mpi.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/privkey_ope=
nssl.c  -fPIC -DPIC -o .libs/privkey_openssl.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/pkcs12.c  -=
fPIC -DPIC -o .libs/pkcs12.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/pkcs7.c  -f=
PIC -DPIC -o .libs/pkcs7.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/output.c  -=
fPIC -DPIC -o .libs/output.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/privkey.c  =
-fPIC -DPIC -o .libs/privkey.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/x509_write.=
c  -fPIC -DPIC -o .libs/x509_write.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/x509.c  -fP=
IC -DPIC -o .libs/x509.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/x509_dn.c  =
-fPIC -DPIC -o .libs/x509_dn.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/sign.c  -fP=
IC -DPIC -o .libs/sign.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/x509_ext.c =
 -fPIC -DPIC -o .libs/x509_ext.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/common.c  -=
fPIC -DPIC -o .libs/common.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/key_decode.=
c  -fPIC -DPIC -o .libs/key_decode.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/key_encode.=
c  -fPIC -DPIC -o .libs/key_encode.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/crl.c  -fPI=
C -DPIC -o .libs/crl.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/crl_write.c=
  -fPIC -DPIC -o .libs/crl_write.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/dn.c  -fPIC=
 -DPIC -o .libs/dn.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/pkcs12_bag.=
c  -fPIC -DPIC -o .libs/pkcs12_bag.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/privkey_pkc=
s8.c  -fPIC -DPIC -o .libs/privkey_pkcs8.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/pbkdf2-sha1=
.c  -fPIC -DPIC -o .libs/pbkdf2-sha1.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/rfc2818_hos=
tname.c  -fPIC -DPIC -o .libs/rfc2818_hostname.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/verify.c  -=
fPIC -DPIC -o .libs/verify.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/verify-high=
2.c  -fPIC -DPIC -o .libs/verify-high2.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/verify-high=
.c  -fPIC -DPIC -o .libs/verify-high.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/ocsp_output=
.c  -fPIC -DPIC -o .libs/ocsp_output.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/name_constr=
aints.c  -fPIC -DPIC -o .libs/name_constraints.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/x509 -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/x509/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.=
./includes -I./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/.. -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/x509/../minitasn1 -O2 -pipe -g -feliminat=
e-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509/ocsp.c  -fP=
IC -DPIC -o .libs/ocsp.o
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
   -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3D=
gnu -Wl,--as-needed -o libgnutls_x509.la  common.lo key_encode.lo key_decod=
e.lo crl.lo crl_write.lo crq.lo dn.lo extensions.lo mpi.lo output.lo pbkdf2=
-sha1.lo pkcs12.lo pkcs12_bag.lo pkcs12_encr.lo pkcs7.lo privkey.lo privkey=
_pkcs8.lo privkey_openssl.lo rfc2818_hostname.lo sign.lo verify.lo x509.lo =
x509_dn.lo x509_write.lo name_constraints.lo verify-high.lo verify-high2.lo=
 x509_ext.lo ocsp.lo ocsp_output.lo =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libgnutls_x=
509.a .libs/common.o .libs/key_encode.o .libs/key_decode.o .libs/crl.o .lib=
s/crl_write.o .libs/crq.o .libs/dn.o .libs/extensions.o .libs/mpi.o .libs/o=
utput.o .libs/pbkdf2-sha1.o .libs/pkcs12.o .libs/pkcs12_bag.o .libs/pkcs12_=
encr.o .libs/pkcs7.o .libs/privkey.o .libs/privkey_pkcs8.o .libs/privkey_op=
enssl.o .libs/rfc2818_hostname.o .libs/sign.o .libs/verify.o .libs/x509.o .=
libs/x509_dn.o .libs/x509_write.o .libs/name_constraints.o .libs/verify-hig=
h.o .libs/verify-high2.o .libs/x509_ext.o .libs/ocsp.o .libs/ocsp_output.o=
=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libgnutls_x=
509.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libgnutls_x509.la" =
&& ln -s "../libgnutls_x509.la" "libgnutls_x509.la" )
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/x509'
Making all in auth
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/auth'
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o anon.lo /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/auth/anon.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o cert.lo /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/auth/cert.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o dh_common.lo /home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/auth/dh_common.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o dhe.lo /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/=
gnutls-3.3.14/lib/auth/dhe.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o rsa_psk.lo /home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/rsa_psk.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o dhe_psk.lo /home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/dhe_psk.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o psk.lo /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/=
gnutls-3.3.14/lib/auth/psk.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o psk_passwd.lo /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/psk_passwd.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o rsa.lo /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/=
gnutls-3.3.14/lib/auth/rsa.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o srp.lo /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/=
gnutls-3.3.14/lib/auth/srp.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o srp_passwd.lo /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/srp_passwd.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o srp_rsa.lo /home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/srp_rsa.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o srp_sb64.lo /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/lib/auth/srp_sb64.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o anon_ecdh.lo /home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/auth/anon_ecdh.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth -I../..  -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/auth/../../gl -I./../../gl -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/auth/../includes -I./../includes -I./../../gl -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
auth/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../minitasn1     =
 -O2 -pipe -g -feliminate-unused-debug-types -c -o ecdhe.lo /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/auth/ecdhe.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/cert.c  -fPIC -DPIC =
-o .libs/cert.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/anon.c  -fPIC -DPIC =
-o .libs/anon.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/dh_common.c  -fPIC -=
DPIC -o .libs/dh_common.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/dhe.c  -fPIC -DPIC -=
o .libs/dhe.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/dhe_psk.c  -fPIC -DP=
IC -o .libs/dhe_psk.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/srp.c  -fPIC -DPIC -=
o .libs/srp.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/srp_passwd.c  -fPIC =
-DPIC -o .libs/srp_passwd.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/psk_passwd.c  -fPIC =
-DPIC -o .libs/psk_passwd.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/srp_sb64.c  -fPIC -D=
PIC -o .libs/srp_sb64.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/psk.c  -fPIC -DPIC -=
o .libs/psk.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/rsa_psk.c  -fPIC -DP=
IC -o .libs/rsa_psk.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/rsa.c  -fPIC -DPIC -=
o .libs/rsa.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/anon_ecdh.c  -fPIC -=
DPIC -o .libs/anon_ecdh.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/srp_rsa.c  -fPIC -DP=
IC -o .libs/srp_rsa.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/auth -I../.. -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/lib/auth/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/.=
./includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/li=
b/auth/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/../opencdk -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/auth/../minitasn1 -O2 -pipe -g -feliminate-unused-=
debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/auth/ecdhe.c  -fPIC -DPIC=
 -o .libs/ecdhe.o
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
  -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dg=
nu -Wl,--as-needed -o libgnutls_auth.la  anon.lo cert.lo dh_common.lo dhe.l=
o rsa_psk.lo dhe_psk.lo psk.lo psk_passwd.lo rsa.lo srp.lo srp_passwd.lo sr=
p_rsa.lo srp_sb64.lo anon_ecdh.lo ecdhe.lo =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libgnutls_a=
uth.a .libs/anon.o .libs/cert.o .libs/dh_common.o .libs/dhe.o .libs/rsa_psk=
.o .libs/dhe_psk.o .libs/psk.o .libs/psk_passwd.o .libs/rsa.o .libs/srp.o .=
libs/srp_passwd.o .libs/srp_rsa.o .libs/srp_sb64.o .libs/anon_ecdh.o .libs/=
ecdhe.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libgnutls_a=
uth.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libgnutls_auth.la" =
&& ln -s "../libgnutls_auth.la" "libgnutls_auth.la" )
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/auth'
Making all in ext
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/ext'
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext -I../..  -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/ext/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../includes -I./../includes -I./../../gl -I/home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/=
../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../minitasn1      -O2 -=
pipe -g -feliminate-unused-debug-types -c -o max_record.lo /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/ext/max_record.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext -I../..  -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/ext/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../includes -I./../includes -I./../../gl -I/home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/=
../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../minitasn1      -O2 -=
pipe -g -feliminate-unused-debug-types -c -o cert_type.lo /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/=
gnutls-3.3.14/lib/ext/cert_type.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext -I../..  -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/ext/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../includes -I./../includes -I./../../gl -I/home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/=
../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../minitasn1      -O2 -=
pipe -g -feliminate-unused-debug-types -c -o server_name.lo /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/server_name.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext -I../..  -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/ext/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../includes -I./../includes -I./../../gl -I/home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/=
../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../minitasn1      -O2 -=
pipe -g -feliminate-unused-debug-types -c -o signature.lo /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/=
gnutls-3.3.14/lib/ext/signature.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext -I../..  -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/ext/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../includes -I./../includes -I./../../gl -I/home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/=
../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../minitasn1      -O2 -=
pipe -g -feliminate-unused-debug-types -c -o safe_renegotiation.lo /home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/safe_renegotiation.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext -I../..  -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/ext/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../includes -I./../includes -I./../../gl -I/home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/=
../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../minitasn1      -O2 -=
pipe -g -feliminate-unused-debug-types -c -o session_ticket.lo /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/lib/ext/session_ticket.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext -I../..  -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/ext/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../includes -I./../includes -I./../../gl -I/home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/=
../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../minitasn1      -O2 -=
pipe -g -feliminate-unused-debug-types -c -o srp.lo /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/ext/srp.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext -I../..  -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/ext/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../includes -I./../includes -I./../../gl -I/home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/=
../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../minitasn1      -O2 -=
pipe -g -feliminate-unused-debug-types -c -o ecc.lo /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/ext/ecc.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext -I../..  -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/ext/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../includes -I./../includes -I./../../gl -I/home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/=
../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../minitasn1      -O2 -=
pipe -g -feliminate-unused-debug-types -c -o heartbeat.lo /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/=
gnutls-3.3.14/lib/ext/heartbeat.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext -I../..  -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/ext/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../includes -I./../includes -I./../../gl -I/home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/=
../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../minitasn1      -O2 -=
pipe -g -feliminate-unused-debug-types -c -o status_request.lo /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/lib/ext/status_request.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext -I../..  -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/ext/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../includes -I./../includes -I./../../gl -I/home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/=
../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../minitasn1      -O2 -=
pipe -g -feliminate-unused-debug-types -c -o dumbfw.lo /home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnu=
tls-3.3.14/lib/ext/dumbfw.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext -I../..  -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/ext/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../includes -I./../includes -I./../../gl -I/home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/=
../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../minitasn1      -O2 -=
pipe -g -feliminate-unused-debug-types -c -o alpn.lo /home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutl=
s-3.3.14/lib/ext/alpn.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext -I../..  -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/ext/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../includes -I./../includes -I./../../gl -I/home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/ext/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/=
../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../minitasn1      -O2 -=
pipe -g -feliminate-unused-debug-types -c -o srtp.lo /home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutl=
s-3.3.14/lib/ext/srtp.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/ext -I../.. -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/ext/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../i=
ncludes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/e=
xt/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../opencdk -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../minitasn1 -O2 -pipe -g -feliminate-unused-debug-=
types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-po=
ky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/max_record.c  -fPIC -DPIC -=
o .libs/max_record.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/ext -I../.. -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/ext/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../i=
ncludes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/e=
xt/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../opencdk -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../minitasn1 -O2 -pipe -g -feliminate-unused-debug-=
types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-po=
ky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/server_name.c  -fPIC -DPIC =
-o .libs/server_name.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/ext -I../.. -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/ext/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../i=
ncludes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/e=
xt/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../opencdk -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../minitasn1 -O2 -pipe -g -feliminate-unused-debug-=
types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-po=
ky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/cert_type.c  -fPIC -DPIC -o=
 .libs/cert_type.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/ext -I../.. -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/ext/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../i=
ncludes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/e=
xt/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../opencdk -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../minitasn1 -O2 -pipe -g -feliminate-unused-debug-=
types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-po=
ky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/signature.c  -fPIC -DPIC -o=
 .libs/signature.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/ext -I../.. -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/ext/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../i=
ncludes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/e=
xt/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../opencdk -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../minitasn1 -O2 -pipe -g -feliminate-unused-debug-=
types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-po=
ky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/safe_renegotiation.c  -fPIC=
 -DPIC -o .libs/safe_renegotiation.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/ext -I../.. -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/ext/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../i=
ncludes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/e=
xt/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../opencdk -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../minitasn1 -O2 -pipe -g -feliminate-unused-debug-=
types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-po=
ky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/session_ticket.c  -fPIC -DP=
IC -o .libs/session_ticket.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/ext -I../.. -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/ext/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../i=
ncludes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/e=
xt/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../opencdk -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../minitasn1 -O2 -pipe -g -feliminate-unused-debug-=
types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-po=
ky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/dumbfw.c  -fPIC -DPIC -o .l=
ibs/dumbfw.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/ext -I../.. -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/ext/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../i=
ncludes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/e=
xt/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../opencdk -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../minitasn1 -O2 -pipe -g -feliminate-unused-debug-=
types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-po=
ky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/status_request.c  -fPIC -DP=
IC -o .libs/status_request.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/ext -I../.. -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/ext/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../i=
ncludes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/e=
xt/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../opencdk -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../minitasn1 -O2 -pipe -g -feliminate-unused-debug-=
types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-po=
ky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/srp.c  -fPIC -DPIC -o .libs=
/srp.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/ext -I../.. -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/ext/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../i=
ncludes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/e=
xt/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../opencdk -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../minitasn1 -O2 -pipe -g -feliminate-unused-debug-=
types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-po=
ky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/srtp.c  -fPIC -DPIC -o .lib=
s/srtp.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/ext -I../.. -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/ext/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../i=
ncludes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/e=
xt/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../opencdk -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../minitasn1 -O2 -pipe -g -feliminate-unused-debug-=
types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-po=
ky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/ecc.c  -fPIC -DPIC -o .libs=
/ecc.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/ext -I../.. -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/ext/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../i=
ncludes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/e=
xt/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../opencdk -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../minitasn1 -O2 -pipe -g -feliminate-unused-debug-=
types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-po=
ky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/heartbeat.c  -fPIC -DPIC -o=
 .libs/heartbeat.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/ext -I../.. -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/ext/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../i=
ncludes -I./../includes -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/e=
xt/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/../opencdk -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/ext/../minitasn1 -O2 -pipe -g -feliminate-unused-debug-=
types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-po=
ky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ext/alpn.c  -fPIC -DPIC -o .lib=
s/alpn.o
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
  -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dg=
nu -Wl,--as-needed -o libgnutls_ext.la  max_record.lo cert_type.lo server_n=
ame.lo signature.lo safe_renegotiation.lo session_ticket.lo srp.lo ecc.lo h=
eartbeat.lo status_request.lo dumbfw.lo alpn.lo srtp.lo =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libgnutls_e=
xt.a .libs/max_record.o .libs/cert_type.o .libs/server_name.o .libs/signatu=
re.o .libs/safe_renegotiation.o .libs/session_ticket.o .libs/srp.o .libs/ec=
c.o .libs/heartbeat.o .libs/status_request.o .libs/dumbfw.o .libs/alpn.o .l=
ibs/srtp.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libgnutls_e=
xt.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libgnutls_ext.la" &=
& ln -s "../libgnutls_ext.la" "libgnutls_ext.la" )
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/ext'
Making all in algorithms
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/algorithms'
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../../gl -I./../../gl -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../includes -I./../includes -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/algorithms/../opencdk -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/algorithms/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-=
types -c -o cert_types.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/cer=
t_types.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../../gl -I./../../gl -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../includes -I./../includes -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/algorithms/../opencdk -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/algorithms/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-=
types -c -o ciphers.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/wo=
rk/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/cipher=
s.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../../gl -I./../../gl -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../includes -I./../includes -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/algorithms/../opencdk -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/algorithms/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-=
types -c -o ciphersuites.lo /home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/c=
iphersuites.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../../gl -I./../../gl -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../includes -I./../includes -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/algorithms/../opencdk -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/algorithms/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-=
types -c -o ecc.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/ecc.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../../gl -I./../../gl -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../includes -I./../includes -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/algorithms/../opencdk -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/algorithms/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-=
types -c -o kx.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/kx.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../../gl -I./../../gl -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../includes -I./../includes -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/algorithms/../opencdk -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/algorithms/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-=
types -c -o mac.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/mac.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../../gl -I./../../gl -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../includes -I./../includes -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/algorithms/../opencdk -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/algorithms/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-=
types -c -o protocols.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/=
work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/prot=
ocols.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../../gl -I./../../gl -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../includes -I./../includes -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/algorithms/../opencdk -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/algorithms/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-=
types -c -o publickey.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/=
work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/publ=
ickey.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../../gl -I./../../gl -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../includes -I./../includes -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/algorithms/../opencdk -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/algorithms/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-=
types -c -o secparams.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/=
work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/secp=
arams.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../../gl -I./../../gl -I/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../includes -I./../includes -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/algorithms/../opencdk -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/algorithms/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-=
types -c -o sign.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/sign.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../.. -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/../../gl -I./../../gl -I/home/alimon/repos/poky/build=
-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.1=
4/lib/algorithms/../includes -I./../includes -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algo=
rithms/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../minita=
sn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/cert_types.c  -fPIC -DPIC -o .libs/cert_types.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../.. -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/../../gl -I./../../gl -I/home/alimon/repos/poky/build=
-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.1=
4/lib/algorithms/../includes -I./../includes -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algo=
rithms/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../minita=
sn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/ciphers.c  -fPIC -DPIC -o .libs/ciphers.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../.. -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/../../gl -I./../../gl -I/home/alimon/repos/poky/build=
-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.1=
4/lib/algorithms/../includes -I./../includes -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algo=
rithms/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../minita=
sn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/ciphersuites.c  -fPIC -DPIC -o .libs/ciphersuites.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../.. -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/../../gl -I./../../gl -I/home/alimon/repos/poky/build=
-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.1=
4/lib/algorithms/../includes -I./../includes -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algo=
rithms/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../minita=
sn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/kx.c  -fPIC -DPIC -o .libs/kx.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../.. -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/../../gl -I./../../gl -I/home/alimon/repos/poky/build=
-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.1=
4/lib/algorithms/../includes -I./../includes -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algo=
rithms/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../minita=
sn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/ecc.c  -fPIC -DPIC -o .libs/ecc.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../.. -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/../../gl -I./../../gl -I/home/alimon/repos/poky/build=
-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.1=
4/lib/algorithms/../includes -I./../includes -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algo=
rithms/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../minita=
sn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/mac.c  -fPIC -DPIC -o .libs/mac.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../.. -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/../../gl -I./../../gl -I/home/alimon/repos/poky/build=
-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.1=
4/lib/algorithms/../includes -I./../includes -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algo=
rithms/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../minita=
sn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/protocols.c  -fPIC -DPIC -o .libs/protocols.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../.. -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/../../gl -I./../../gl -I/home/alimon/repos/poky/build=
-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.1=
4/lib/algorithms/../includes -I./../includes -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algo=
rithms/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../minita=
sn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/secparams.c  -fPIC -DPIC -o .libs/secparams.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../.. -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/../../gl -I./../../gl -I/home/alimon/repos/poky/build=
-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.1=
4/lib/algorithms/../includes -I./../includes -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algo=
rithms/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../minita=
sn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/publickey.c  -fPIC -DPIC -o .libs/publickey.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/algorithms -I../.. -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/../../gl -I./../../gl -I/home/alimon/repos/poky/build=
-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.1=
4/lib/algorithms/../includes -I./../includes -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/algorithms/.. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algo=
rithms/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/algorithms/../minita=
sn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/algorithms/sign.c  -fPIC -DPIC -o .libs/sign.o
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
  -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dg=
nu -Wl,--as-needed -o libgnutls_alg.la  cert_types.lo ciphers.lo ciphersuit=
es.lo ecc.lo kx.lo mac.lo protocols.lo publickey.lo secparams.lo sign.lo =
=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libgnutls_a=
lg.a .libs/cert_types.o .libs/ciphers.o .libs/ciphersuites.o .libs/ecc.o .l=
ibs/kx.o .libs/mac.o .libs/protocols.o .libs/publickey.o .libs/secparams.o =
.libs/sign.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libgnutls_a=
lg.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libgnutls_alg.la" &=
& ln -s "../libgnutls_alg.la" "libgnutls_alg.la" )
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/algorithms'
Making all in extras
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/extras'
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/extras -I../..  -I=
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/lib/extras/../../gl -I./../../gl -I/home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/extras/../includes -I./../includes -I./../../gl -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/extras/.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/extras/../opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/extras/../mi=
nitasn1      -O2 -pipe -g -feliminate-unused-debug-types -c -o randomart.lo=
 /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/extras/randomart.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/extras -I../.. -I/home/alimon/repos/poky/buil=
d-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.=
14/lib/extras/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64-=
multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/ex=
tras/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/extras/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/extras/../opencdk -I=
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/lib/extras/../minitasn1 -O2 -pipe -g -felimi=
nate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tm=
p/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/extras/random=
art.c  -fPIC -DPIC -o .libs/randomart.o
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
  -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dg=
nu -Wl,--as-needed -o libgnutls_extras.la  randomart.lo =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libgnutls_e=
xtras.a .libs/randomart.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libgnutls_e=
xtras.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libgnutls_extras.la=
" && ln -s "../libgnutls_extras.la" "libgnutls_extras.la" )
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/extras'
Making all in accelerated
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/accelerated'
Making all in x86
make[5]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/accelerated/x86'
../../../x86_64-poky-linux-libtool  --tag=3DCC --tag=3DCC  --mode=3Dcompile=
 x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/acce=
lerated/x86 -I../../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x8=
6/../../../gl -I./../../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelera=
ted/x86/../../includes -I./../../includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../ -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated=
/x86/../ -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../minitas=
n1      -DASM_X86_64 -DASM_X86  -O2 -pipe -g -feliminate-unused-debug-types=
 -c -o x86-common.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/x86=
-common.c
../../../x86_64-poky-linux-libtool  --tag=3DCC --tag=3DCC  --mode=3Dcompile=
 x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/acce=
lerated/x86 -I../../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x8=
6/../../../gl -I./../../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelera=
ted/x86/../../includes -I./../../includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../ -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated=
/x86/../ -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../minitas=
n1      -DASM_X86_64 -DASM_X86  -O2 -pipe -g -feliminate-unused-debug-types=
 -c -o sha-x86-ssse3.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/=
sha-x86-ssse3.c
../../../x86_64-poky-linux-libtool  --tag=3DCC --tag=3DCC  --mode=3Dcompile=
 x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/acce=
lerated/x86 -I../../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x8=
6/../../../gl -I./../../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelera=
ted/x86/../../includes -I./../../includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../ -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated=
/x86/../ -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../minitas=
n1      -DASM_X86_64 -DASM_X86  -O2 -pipe -g -feliminate-unused-debug-types=
 -c -o hmac-x86-ssse3.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/=
work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86=
/hmac-x86-ssse3.c
../../../x86_64-poky-linux-libtool  --tag=3DCC --tag=3DCC  --mode=3Dcompile=
 x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/acce=
lerated/x86 -I../../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x8=
6/../../../gl -I./../../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelera=
ted/x86/../../includes -I./../../includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../ -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated=
/x86/../ -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../minitas=
n1      -DASM_X86_64 -DASM_X86  -O2 -pipe -g -feliminate-unused-debug-types=
 -c -o aes-gcm-x86-ssse3.lo /home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/=
x86/aes-gcm-x86-ssse3.c
../../../x86_64-poky-linux-libtool  --tag=3DCC --tag=3DCC  --mode=3Dcompile=
 x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/acce=
lerated/x86 -I../../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x8=
6/../../../gl -I./../../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelera=
ted/x86/../../includes -I./../../includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../ -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated=
/x86/../ -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../minitas=
n1      -DASM_X86_64 -DASM_X86  -O2 -pipe -g -feliminate-unused-debug-types=
 -c -o aes-gcm-x86-aesni.lo /home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/=
x86/aes-gcm-x86-aesni.c
../../../x86_64-poky-linux-libtool  --tag=3DCC --tag=3DCC  --mode=3Dcompile=
 x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/acce=
lerated/x86 -I../../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x8=
6/../../../gl -I./../../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelera=
ted/x86/../../includes -I./../../includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../ -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated=
/x86/../ -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../minitas=
n1      -DASM_X86_64 -DASM_X86  -O2 -pipe -g -feliminate-unused-debug-types=
 -c -o aes-cbc-x86-ssse3.lo /home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/=
x86/aes-cbc-x86-ssse3.c
../../../x86_64-poky-linux-libtool  --tag=3DCC --tag=3DCC  --mode=3Dcompile=
 x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/acce=
lerated/x86 -I../../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x8=
6/../../../gl -I./../../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelera=
ted/x86/../../includes -I./../../includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../ -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated=
/x86/../ -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../minitas=
n1      -DASM_X86_64 -DASM_X86  -O2 -pipe -g -feliminate-unused-debug-types=
 -c -o aes-cbc-x86-aesni.lo /home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/=
x86/aes-cbc-x86-aesni.c
../../../x86_64-poky-linux-libtool  --tag=3DCC --tag=3DCC  --mode=3Dcompile=
 x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/acce=
lerated/x86 -I../../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x8=
6/../../../gl -I./../../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelera=
ted/x86/../../includes -I./../../includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../ -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated=
/x86/../ -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../minitas=
n1      -DASM_X86_64 -DASM_X86  -O2 -pipe -g -feliminate-unused-debug-types=
 -c -o sha-padlock.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/sh=
a-padlock.c
../../../x86_64-poky-linux-libtool  --tag=3DCC --tag=3DCC  --mode=3Dcompile=
 x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/acce=
lerated/x86 -I../../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x8=
6/../../../gl -I./../../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelera=
ted/x86/../../includes -I./../../includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../ -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated=
/x86/../ -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../minitas=
n1      -DASM_X86_64 -DASM_X86  -O2 -pipe -g -feliminate-unused-debug-types=
 -c -o hmac-padlock.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/wo=
rk/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/h=
mac-padlock.c
../../../x86_64-poky-linux-libtool  --tag=3DCC --tag=3DCC  --mode=3Dcompile=
 x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/acce=
lerated/x86 -I../../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x8=
6/../../../gl -I./../../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelera=
ted/x86/../../includes -I./../../includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../ -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated=
/x86/../ -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../minitas=
n1      -DASM_X86_64 -DASM_X86  -O2 -pipe -g -feliminate-unused-debug-types=
 -c -o aes-padlock.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/ae=
s-padlock.c
../../../x86_64-poky-linux-libtool  --tag=3DCC --tag=3DCC  --mode=3Dcompile=
 x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/acce=
lerated/x86 -I../../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x8=
6/../../../gl -I./../../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelera=
ted/x86/../../includes -I./../../includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../ -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated=
/x86/../ -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../minitas=
n1      -DASM_X86_64 -DASM_X86  -O2 -pipe -g -feliminate-unused-debug-types=
 -c -o aes-gcm-padlock.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x8=
6/aes-gcm-padlock.c
../../../x86_64-poky-linux-libtool  --tag=3DCC --tag=3DCC  --mode=3Dcompile=
 x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/acce=
lerated/x86 -I../../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x8=
6/../../../gl -I./../../../gl -I/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelera=
ted/x86/../../includes -I./../../includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../ -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated=
/x86/../ -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../minitas=
n1      -DASM_X86_64 -DASM_X86  -O2 -pipe -g -feliminate-unused-debug-types=
 -c -o aes-gcm-x86-pclmul.lo /home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated=
/x86/aes-gcm-x86-pclmul.c
../../../x86_64-poky-linux-libtool  --tag=3DCC  --mode=3Dcompile x86_64-pok=
y-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sys=
root=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-6=
4  -O2 -pipe -g -feliminate-unused-debug-types -c -o elf/aesni-x86_64.lo /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/aesni-x86_64.s
../../../x86_64-poky-linux-libtool  --tag=3DCC  --mode=3Dcompile x86_64-pok=
y-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sys=
root=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-6=
4  -O2 -pipe -g -feliminate-unused-debug-types -c -o elf/cpuid-x86_64.lo /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/cpuid-x86_64.s
../../../x86_64-poky-linux-libtool  --tag=3DCC  --mode=3Dcompile x86_64-pok=
y-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sys=
root=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-6=
4  -O2 -pipe -g -feliminate-unused-debug-types -c -o elf/ghash-x86_64.lo /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/ghash-x86_64.s
../../../x86_64-poky-linux-libtool  --tag=3DCC  --mode=3Dcompile x86_64-pok=
y-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sys=
root=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-6=
4  -O2 -pipe -g -feliminate-unused-debug-types -c -o elf/sha1-ssse3-x86_64.=
lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-lin=
ux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/sha1-ssse3-x86_64=
.s
../../../x86_64-poky-linux-libtool  --tag=3DCC  --mode=3Dcompile x86_64-pok=
y-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sys=
root=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-6=
4  -O2 -pipe -g -feliminate-unused-debug-types -c -o elf/sha512-ssse3-x86_6=
4.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/sha512-ssse3-x8=
6_64.s
../../../x86_64-poky-linux-libtool  --tag=3DCC  --mode=3Dcompile x86_64-pok=
y-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sys=
root=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-6=
4  -O2 -pipe -g -feliminate-unused-debug-types -c -o elf/aes-ssse3-x86_64.l=
o /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/aes-ssse3-x86_64.s
../../../x86_64-poky-linux-libtool  --tag=3DCC  --mode=3Dcompile x86_64-pok=
y-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sys=
root=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-6=
4  -O2 -pipe -g -feliminate-unused-debug-types -c -o elf/e_padlock-x86_64.l=
o /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/e_padlock-x86_64.s
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86 -I../../.. -I/home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/accelerated/x86/../../../gl -I./../../../gl -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../includes -I./../../includes =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../ -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/accelerated/x86/../ -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../minitasn1 -DASM_X86_64 -DASM_X86 -O2 -pipe -g -fe=
liminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerat=
ed/x86/x86-common.c  -fPIC -DPIC -o .libs/x86-common.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86 -I../../.. -I/home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/accelerated/x86/../../../gl -I./../../../gl -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../includes -I./../../includes =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../ -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/accelerated/x86/../ -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../minitasn1 -DASM_X86_64 -DASM_X86 -O2 -pipe -g -fe=
liminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerat=
ed/x86/hmac-x86-ssse3.c  -fPIC -DPIC -o .libs/hmac-x86-ssse3.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86 -I../../.. -I/home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/accelerated/x86/../../../gl -I./../../../gl -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../includes -I./../../includes =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../ -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/accelerated/x86/../ -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../minitasn1 -DASM_X86_64 -DASM_X86 -O2 -pipe -g -fe=
liminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerat=
ed/x86/sha-x86-ssse3.c  -fPIC -DPIC -o .libs/sha-x86-ssse3.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86 -I../../.. -I/home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/accelerated/x86/../../../gl -I./../../../gl -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../includes -I./../../includes =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../ -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/accelerated/x86/../ -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../minitasn1 -DASM_X86_64 -DASM_X86 -O2 -pipe -g -fe=
liminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerat=
ed/x86/aes-gcm-x86-ssse3.c  -fPIC -DPIC -o .libs/aes-gcm-x86-ssse3.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86 -I../../.. -I/home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/accelerated/x86/../../../gl -I./../../../gl -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../includes -I./../../includes =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../ -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/accelerated/x86/../ -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../minitasn1 -DASM_X86_64 -DASM_X86 -O2 -pipe -g -fe=
liminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerat=
ed/x86/aes-gcm-x86-aesni.c  -fPIC -DPIC -o .libs/aes-gcm-x86-aesni.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86 -I../../.. -I/home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/accelerated/x86/../../../gl -I./../../../gl -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../includes -I./../../includes =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../ -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/accelerated/x86/../ -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../minitasn1 -DASM_X86_64 -DASM_X86 -O2 -pipe -g -fe=
liminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerat=
ed/x86/aes-padlock.c  -fPIC -DPIC -o .libs/aes-padlock.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86 -I../../.. -I/home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/accelerated/x86/../../../gl -I./../../../gl -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../includes -I./../../includes =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../ -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/accelerated/x86/../ -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../minitasn1 -DASM_X86_64 -DASM_X86 -O2 -pipe -g -fe=
liminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerat=
ed/x86/aes-gcm-padlock.c  -fPIC -DPIC -o .libs/aes-gcm-padlock.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86 -I../../.. -I/home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/accelerated/x86/../../../gl -I./../../../gl -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../includes -I./../../includes =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../ -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/accelerated/x86/../ -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../minitasn1 -DASM_X86_64 -DASM_X86 -O2 -pipe -g -fe=
liminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerat=
ed/x86/aes-cbc-x86-ssse3.c  -fPIC -DPIC -o .libs/aes-cbc-x86-ssse3.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86 -I../../.. -I/home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/accelerated/x86/../../../gl -I./../../../gl -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../includes -I./../../includes =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../ -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/accelerated/x86/../ -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../minitasn1 -DASM_X86_64 -DASM_X86 -O2 -pipe -g -fe=
liminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerat=
ed/x86/aes-cbc-x86-aesni.c  -fPIC -DPIC -o .libs/aes-cbc-x86-aesni.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86 -I../../.. -I/home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/accelerated/x86/../../../gl -I./../../../gl -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../includes -I./../../includes =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../ -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/accelerated/x86/../ -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../minitasn1 -DASM_X86_64 -DASM_X86 -O2 -pipe -g -fe=
liminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerat=
ed/x86/sha-padlock.c  -fPIC -DPIC -o .libs/sha-padlock.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86 -I../../.. -I/home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/accelerated/x86/../../../gl -I./../../../gl -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../includes -I./../../includes =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../ -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/accelerated/x86/../ -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../minitasn1 -DASM_X86_64 -DASM_X86 -O2 -pipe -g -fe=
liminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerat=
ed/x86/aes-gcm-x86-pclmul.c  -fPIC -DPIC -o .libs/aes-gcm-x86-pclmul.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86 -I../../.. -I/home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/accelerated/x86/../../../gl -I./../../../gl -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../includes -I./../../includes =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/../../ -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/accelerated/x86/../ -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/accelerated/x86/../../minitasn1 -DASM_X86_64 -DASM_X86 -O2 -pipe -g -fe=
liminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerat=
ed/x86/hmac-padlock.c  -fPIC -DPIC -o .libs/hmac-padlock.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/=
cpuid-x86_64.s  -fPIC -DPIC -o elf/.libs/cpuid-x86_64.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/=
aesni-x86_64.s  -fPIC -DPIC -o elf/.libs/aesni-x86_64.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/=
sha1-ssse3-x86_64.s  -fPIC -DPIC -o elf/.libs/sha1-ssse3-x86_64.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/=
ghash-x86_64.s  -fPIC -DPIC -o elf/.libs/ghash-x86_64.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/=
sha512-ssse3-x86_64.s  -fPIC -DPIC -o elf/.libs/sha512-ssse3-x86_64.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/=
e_padlock-x86_64.s  -fPIC -DPIC -o elf/.libs/e_padlock-x86_64.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/x86/elf/=
aes-ssse3-x86_64.s  -fPIC -DPIC -o elf/.libs/aes-ssse3-x86_64.o
../../../x86_64-poky-linux-libtool  --tag=3DCC --tag=3DCC  --mode=3Dlink x8=
6_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Ds=
se --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/q=
emux86-64     -DASM_X86_64 -DASM_X86  -O2 -pipe -g -feliminate-unused-debug=
-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o libx86.la  x86-co=
mmon.lo sha-x86-ssse3.lo hmac-x86-ssse3.lo aes-gcm-x86-ssse3.lo aes-gcm-x86=
-aesni.lo aes-cbc-x86-ssse3.lo aes-cbc-x86-aesni.lo sha-padlock.lo hmac-pad=
lock.lo aes-padlock.lo aes-gcm-padlock.lo aes-gcm-x86-pclmul.lo     elf/aes=
ni-x86_64.lo elf/cpuid-x86_64.lo elf/ghash-x86_64.lo elf/sha1-ssse3-x86_64.=
lo elf/sha512-ssse3-x86_64.lo elf/aes-ssse3-x86_64.lo elf/e_padlock-x86_64.=
lo       =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libx86.a .l=
ibs/x86-common.o .libs/sha-x86-ssse3.o .libs/hmac-x86-ssse3.o .libs/aes-gcm=
-x86-ssse3.o .libs/aes-gcm-x86-aesni.o .libs/aes-cbc-x86-ssse3.o .libs/aes-=
cbc-x86-aesni.o .libs/sha-padlock.o .libs/hmac-padlock.o .libs/aes-padlock.=
o .libs/aes-gcm-padlock.o .libs/aes-gcm-x86-pclmul.o elf/.libs/aesni-x86_64=
.o elf/.libs/cpuid-x86_64.o elf/.libs/ghash-x86_64.o elf/.libs/sha1-ssse3-x=
86_64.o elf/.libs/sha512-ssse3-x86_64.o elf/.libs/aes-ssse3-x86_64.o elf/.l=
ibs/e_padlock-x86_64.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libx86.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libx86.la" && ln -s=
 "../libx86.la" "libx86.la" )
make[5]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/accelerated/x86'
make[5]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/accelerated'
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated -I../.=
.  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/../../gl -I./../../gl -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/../includes -I./../../gl -I=
./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/.. -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/accelerated/../minitasn1      -DASM_X86  -DASM_=
X86_64 -O2 -pipe -g -feliminate-unused-debug-types -c -o accelerated.lo /ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/accelerated.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated -I../.=
.  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/../../gl -I./../../gl -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/../includes -I./../../gl -I=
./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/.. -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/accelerated/../minitasn1      -DASM_X86  -DASM_=
X86_64 -O2 -pipe -g -feliminate-unused-debug-types -c -o cryptodev.lo /home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated/cryptodev.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated -I../.=
.  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/../../gl -I./../../gl -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/../includes -I./../../gl -I=
./../includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/.. -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/accelerated/../minitasn1      -DASM_X86  -DASM_=
X86_64 -O2 -pipe -g -feliminate-unused-debug-types -c -o cryptodev-gcm.lo /=
home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/g=
nutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/cryptodev-gcm.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated -I../.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/accelerated/../../gl -I./../../gl -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/accelerated/../includes -I./../../gl -I./../includes -I/home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/lib/accelerated/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
accelerated/../minitasn1 -DASM_X86 -DASM_X86_64 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/accelera=
ted.c  -fPIC -DPIC -o .libs/accelerated.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated -I../.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/accelerated/../../gl -I./../../gl -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/accelerated/../includes -I./../../gl -I./../includes -I/home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/lib/accelerated/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
accelerated/../minitasn1 -DASM_X86 -DASM_X86_64 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/cryptode=
v.c  -fPIC -DPIC -o .libs/cryptodev.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/accelerated -I../.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/accelerated/../../gl -I./../../gl -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/accelerated/../includes -I./../../gl -I./../includes -I/home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/lib/accelerated/.. -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
accelerated/../minitasn1 -DASM_X86 -DASM_X86_64 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/accelerated/cryptode=
v-gcm.c  -fPIC -DPIC -o .libs/cryptodev-gcm.o
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
  -DASM_X86  -DASM_X86_64 -O2 -pipe -g -feliminate-unused-debug-types  -Wl,=
-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o libaccelerated.la  accelerate=
d.lo cryptodev.lo cryptodev-gcm.lo x86/libx86.la=20
x86_64-poky-linux-libtool: link: (cd .libs/libaccelerated.lax/libx86.a && x=
86_64-poky-linux-ar x "/home/alimon/repos/poky/build-x86-64-multilib/tmp/wo=
rk/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/accelerated/x86/.libs/lib=
x86.a")
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libaccelera=
ted.a .libs/accelerated.o .libs/cryptodev.o .libs/cryptodev-gcm.o   .libs/l=
ibaccelerated.lax/libx86.a/aes-cbc-x86-aesni.o .libs/libaccelerated.lax/lib=
x86.a/aes-cbc-x86-ssse3.o .libs/libaccelerated.lax/libx86.a/aes-gcm-padlock=
.o .libs/libaccelerated.lax/libx86.a/aes-gcm-x86-aesni.o .libs/libaccelerat=
ed.lax/libx86.a/aes-gcm-x86-pclmul.o .libs/libaccelerated.lax/libx86.a/aes-=
gcm-x86-ssse3.o .libs/libaccelerated.lax/libx86.a/aes-padlock.o .libs/libac=
celerated.lax/libx86.a/aes-ssse3-x86_64.o .libs/libaccelerated.lax/libx86.a=
/aesni-x86_64.o .libs/libaccelerated.lax/libx86.a/cpuid-x86_64.o .libs/liba=
ccelerated.lax/libx86.a/e_padlock-x86_64.o .libs/libaccelerated.lax/libx86.=
a/ghash-x86_64.o .libs/libaccelerated.lax/libx86.a/hmac-padlock.o .libs/lib=
accelerated.lax/libx86.a/hmac-x86-ssse3.o .libs/libaccelerated.lax/libx86.a=
/sha-padlock.o .libs/libaccelerated.lax/libx86.a/sha-x86-ssse3.o .libs/liba=
ccelerated.lax/libx86.a/sha1-ssse3-x86_64.o .libs/libaccelerated.lax/libx86=
.a/sha512-ssse3-x86_64.o .libs/libaccelerated.lax/libx86.a/x86-common.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libaccelera=
ted.a
x86_64-poky-linux-libtool: link: rm -fr .libs/libaccelerated.lax
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libaccelerated.la" =
&& ln -s "../libaccelerated.la" "libaccelerated.la" )
make[5]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/accelerated'
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/accelerated'
Making all in minitasn1
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/minitasn1'
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. =
 -DASN1_BUILDING -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/..   -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o decoding.lo /home/alimon/repos/poky/b=
uild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3=
.3.14/lib/minitasn1/decoding.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. =
 -DASN1_BUILDING -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/..   -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o gstr.lo /home/alimon/repos/poky/build=
-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.1=
4/lib/minitasn1/gstr.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. =
 -DASN1_BUILDING -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/..   -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o errors.lo /home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/minitasn1/errors.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. =
 -DASN1_BUILDING -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/..   -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o parser_aux.lo /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/minitasn1/parser_aux.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. =
 -DASN1_BUILDING -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/..   -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o structure.lo /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/minitasn1/structure.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. =
 -DASN1_BUILDING -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/..   -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o element.lo /home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/minitasn1/element.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. =
 -DASN1_BUILDING -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/..   -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o coding.lo /home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/minitasn1/coding.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. =
 -DASN1_BUILDING -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I=
./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/..   -O2 -pipe -g=
 -feliminate-unused-debug-types -c -o version.lo /home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/minitasn1/version.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. -DASN1_BUILDING -I/home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/minitasn1/.. -O2 -pipe -g -feliminate-unused-debug-type=
s -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/gstr.c  -fPIC -DPIC -o .l=
ibs/gstr.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. -DASN1_BUILDING -I/home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/minitasn1/.. -O2 -pipe -g -feliminate-unused-debug-type=
s -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/decoding.c  -fPIC -DPIC -=
o .libs/decoding.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. -DASN1_BUILDING -I/home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/minitasn1/.. -O2 -pipe -g -feliminate-unused-debug-type=
s -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/errors.c  -fPIC -DPIC -o =
.libs/errors.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. -DASN1_BUILDING -I/home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/minitasn1/.. -O2 -pipe -g -feliminate-unused-debug-type=
s -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/version.c  -fPIC -DPIC -o=
 .libs/version.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. -DASN1_BUILDING -I/home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/minitasn1/.. -O2 -pipe -g -feliminate-unused-debug-type=
s -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/structure.c  -fPIC -DPIC =
-o .libs/structure.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. -DASN1_BUILDING -I/home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/minitasn1/.. -O2 -pipe -g -feliminate-unused-debug-type=
s -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/parser_aux.c  -fPIC -DPIC=
 -o .libs/parser_aux.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. -DASN1_BUILDING -I/home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/minitasn1/.. -O2 -pipe -g -feliminate-unused-debug-type=
s -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/coding.c  -fPIC -DPIC -o =
.libs/coding.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -I../.. -DASN1_BUILDING -I/home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/minitasn1/../../gl -I./../../gl -I/home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/minitasn1/.. -O2 -pipe -g -feliminate-unused-debug-type=
s -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1/element.c  -fPIC -DPIC -o=
 .libs/element.o
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64  -=
O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu =
-Wl,--as-needed -o libminitasn1.la  decoding.lo gstr.lo errors.lo parser_au=
x.lo structure.lo element.lo coding.lo version.lo =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libminitasn=
1.a .libs/decoding.o .libs/gstr.o .libs/errors.o .libs/parser_aux.o .libs/s=
tructure.o .libs/element.o .libs/coding.o .libs/version.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libminitasn=
1.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libminitasn1.la" &&=
 ln -s "../libminitasn1.la" "libminitasn1.la" )
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/minitasn1'
Making all in opencdk
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/opencdk'
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/opencdk/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/../minitasn1   -O2 -pipe -g -feliminate-unused-debug-ty=
pes -c -o armor.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/armor.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/opencdk/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/../minitasn1   -O2 -pipe -g -feliminate-unused-debug-ty=
pes -c -o kbnode.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/kbnode.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/opencdk/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/../minitasn1   -O2 -pipe -g -feliminate-unused-debug-ty=
pes -c -o sig-check.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/wo=
rk/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/sig-check=
.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/opencdk/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/../minitasn1   -O2 -pipe -g -feliminate-unused-debug-ty=
pes -c -o keydb.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/keydb.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/opencdk/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/../minitasn1   -O2 -pipe -g -feliminate-unused-debug-ty=
pes -c -o pubkey.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/pubkey.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/opencdk/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/../minitasn1   -O2 -pipe -g -feliminate-unused-debug-ty=
pes -c -o stream.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/stream.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/opencdk/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/../minitasn1   -O2 -pipe -g -feliminate-unused-debug-ty=
pes -c -o write-packet.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/write-=
packet.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/opencdk/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/../minitasn1   -O2 -pipe -g -feliminate-unused-debug-ty=
pes -c -o misc.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/misc.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/opencdk/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/../minitasn1   -O2 -pipe -g -feliminate-unused-debug-ty=
pes -c -o seskey.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/seskey.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/opencdk/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/../minitasn1   -O2 -pipe -g -feliminate-unused-debug-ty=
pes -c -o literal.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/literal.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/opencdk/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/../minitasn1   -O2 -pipe -g -feliminate-unused-debug-ty=
pes -c -o new-packet.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/new-pack=
et.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/opencdk/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/../minitasn1   -O2 -pipe -g -feliminate-unused-debug-ty=
pes -c -o read-packet.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/=
work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/read-pa=
cket.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/opencdk/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
opencdk/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../minit=
asn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/armor.c  -fPIC -DPIC -o .libs/armor.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/opencdk/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
opencdk/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../minit=
asn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/kbnode.c  -fPIC -DPIC -o .libs/kbnode.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/opencdk/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
opencdk/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../minit=
asn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/sig-check.c  -fPIC -DPIC -o .libs/sig-check.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/opencdk/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
opencdk/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../minit=
asn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/pubkey.c  -fPIC -DPIC -o .libs/pubkey.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/opencdk/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
opencdk/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../minit=
asn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/keydb.c  -fPIC -DPIC -o .libs/keydb.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/opencdk/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
opencdk/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../minit=
asn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/write-packet.c  -fPIC -DPIC -o .libs/write-packet.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/opencdk/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
opencdk/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../minit=
asn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/stream.c  -fPIC -DPIC -o .libs/stream.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/opencdk/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
opencdk/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../minit=
asn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/read-packet.c  -fPIC -DPIC -o .libs/read-packet.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/opencdk/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
opencdk/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../minit=
asn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/literal.c  -fPIC -DPIC -o .libs/literal.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/opencdk/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
opencdk/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../minit=
asn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/misc.c  -fPIC -DPIC -o .libs/misc.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/opencdk/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
opencdk/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../minit=
asn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/seskey.c  -fPIC -DPIC -o .libs/seskey.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/opencdk/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
opencdk/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/opencdk/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk/../minit=
asn1 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk/new-packet.c  -fPIC -DPIC -o .libs/new-packet.o
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64  -=
O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu =
-Wl,--as-needed -o libminiopencdk.la  armor.lo kbnode.lo sig-check.lo keydb=
.lo pubkey.lo stream.lo write-packet.lo misc.lo seskey.lo literal.lo new-pa=
cket.lo read-packet.lo =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libminiopen=
cdk.a .libs/armor.o .libs/kbnode.o .libs/sig-check.o .libs/keydb.o .libs/pu=
bkey.o .libs/stream.o .libs/write-packet.o .libs/misc.o .libs/seskey.o .lib=
s/literal.o .libs/new-packet.o .libs/read-packet.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libminiopen=
cdk.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libminiopencdk.la" =
&& ln -s "../libminiopencdk.la" "libminiopencdk.la" )
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/opencdk'
Making all in openpgp
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/openpgp'
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/openpgp/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/openpgp/../opencdk -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-types -c -o pgp.lo=
 /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/pgp.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/openpgp/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/openpgp/../opencdk -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-types -c -o pgpver=
ify.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky=
-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/pgpverify.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/openpgp/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/openpgp/../opencdk -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-types -c -o extras=
.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/extras.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/openpgp/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/openpgp/../opencdk -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-types -c -o compat=
.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/compat.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/openpgp/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/openpgp/../opencdk -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-types -c -o privke=
y.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/privkey.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/openpgp/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/openpgp/../opencdk -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-types -c -o output=
.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/output.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../../gl -I./../../gl -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/openpgp/../includes -I./../includes -I./../../g=
l -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/openpgp/../opencdk -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/../minitasn1      -O2 -pipe -g -feliminate-unused-debug-types -c -o gnutls=
_openpgp.lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64=
-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/gnutls_openpgp.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/openpgp/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
openpgp/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../openc=
dk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../minitasn1 -O2 -pipe -g -=
feliminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/extras.c  -fPIC -DPIC -o .libs/extras.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/openpgp/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
openpgp/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../openc=
dk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../minitasn1 -O2 -pipe -g -=
feliminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/pgp.c  -fPIC -DPIC -o .libs/pgp.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/openpgp/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
openpgp/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../openc=
dk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../minitasn1 -O2 -pipe -g -=
feliminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/compat.c  -fPIC -DPIC -o .libs/compat.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/openpgp/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
openpgp/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../openc=
dk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../minitasn1 -O2 -pipe -g -=
feliminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/privkey.c  -fPIC -DPIC -o .libs/privkey.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/openpgp/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
openpgp/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../openc=
dk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../minitasn1 -O2 -pipe -g -=
feliminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/gnutls_openpgp.c  -fPIC -DPIC -o .libs/gnutls_openpgp.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/openpgp/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
openpgp/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../openc=
dk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../minitasn1 -O2 -pipe -g -=
feliminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/output.c  -fPIC -DPIC -o .libs/output.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/openpgp -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/openpgp/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/=
openpgp/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/lib/openpgp/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../openc=
dk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp/../minitasn1 -O2 -pipe -g -=
feliminate-unused-debug-types -c /home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/openpgp=
/pgpverify.c  -fPIC -DPIC -o .libs/pgpverify.o
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
  -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dg=
nu -Wl,--as-needed -o libgnutls_openpgp.la  pgp.lo pgpverify.lo extras.lo c=
ompat.lo privkey.lo output.lo gnutls_openpgp.lo =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libgnutls_o=
penpgp.a .libs/pgp.o .libs/pgpverify.o .libs/extras.o .libs/compat.o .libs/=
privkey.o .libs/output.o .libs/gnutls_openpgp.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libgnutls_o=
penpgp.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libgnutls_openpgp.l=
a" && ln -s "../libgnutls_openpgp.la" "libgnutls_openpgp.la" )
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/openpgp'
Making all in nettle
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/nettle'
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../..  -I=
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/int -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/nettle/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/n=
ettle/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/nettle/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1=
        -O2 -pipe -g -feliminate-unused-debug-types -c -o pk.lo /home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/nettle/pk.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../..  -I=
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/int -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/nettle/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/n=
ettle/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/nettle/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1=
        -O2 -pipe -g -feliminate-unused-debug-types -c -o mpi.lo /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/nettle/mpi.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../..  -I=
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/int -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/nettle/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/n=
ettle/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/nettle/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1=
        -O2 -pipe -g -feliminate-unused-debug-types -c -o mac.lo /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/nettle/mac.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../..  -I=
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/int -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/nettle/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/n=
ettle/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/nettle/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1=
        -O2 -pipe -g -feliminate-unused-debug-types -c -o cipher.lo /home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/nettle/cipher.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../..  -I=
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/int -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/nettle/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/n=
ettle/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/nettle/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1=
        -O2 -pipe -g -feliminate-unused-debug-types -c -o init.lo /home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/nettle/init.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../..  -I=
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/int -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/nettle/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/n=
ettle/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/nettle/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1=
        -O2 -pipe -g -feliminate-unused-debug-types -c -o egd.lo /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/nettle/egd.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../..  -I=
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/int -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/nettle/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/n=
ettle/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/nettle/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1=
        -O2 -pipe -g -feliminate-unused-debug-types -c -o rnd-common.lo /ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/nettle/rnd-common.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../..  -I=
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/int -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/nettle/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/n=
ettle/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/nettle/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1=
        -O2 -pipe -g -feliminate-unused-debug-types -c -o rnd.lo /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/nettle/rnd.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../..  -I=
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/int -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/lib/nettle/../../gl -I./../../gl -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/n=
ettle/../includes -I./../includes -I./../../gl -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/nettle/.. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1=
        -O2 -pipe -g -feliminate-unused-debug-types -c -o int/gcm-camellia.=
lo /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-lin=
ux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/int/gcm-camellia.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../.. -I/home/alimon/repos/poky/buil=
d-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.=
14/lib/nettle/int -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../../gl -I./=
../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../includes -I./../inc=
ludes -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/.. -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/pk.c  -fPIC -=
DPIC -o .libs/pk.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../.. -I/home/alimon/repos/poky/buil=
d-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.=
14/lib/nettle/int -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../../gl -I./=
../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../includes -I./../inc=
ludes -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/.. -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/mpi.c  -fPIC =
-DPIC -o .libs/mpi.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../.. -I/home/alimon/repos/poky/buil=
d-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.=
14/lib/nettle/int -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../../gl -I./=
../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../includes -I./../inc=
ludes -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/.. -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/mac.c  -fPIC =
-DPIC -o .libs/mac.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../.. -I/home/alimon/repos/poky/buil=
d-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.=
14/lib/nettle/int -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../../gl -I./=
../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../includes -I./../inc=
ludes -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/.. -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/cipher.c  -fP=
IC -DPIC -o .libs/cipher.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../.. -I/home/alimon/repos/poky/buil=
d-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.=
14/lib/nettle/int -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../../gl -I./=
../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../includes -I./../inc=
ludes -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/.. -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/init.c  -fPIC=
 -DPIC -o .libs/init.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../.. -I/home/alimon/repos/poky/buil=
d-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.=
14/lib/nettle/int -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../../gl -I./=
../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../includes -I./../inc=
ludes -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/.. -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/rnd-common.c =
 -fPIC -DPIC -o .libs/rnd-common.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../.. -I/home/alimon/repos/poky/buil=
d-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.=
14/lib/nettle/int -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../../gl -I./=
../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../includes -I./../inc=
ludes -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/.. -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/rnd.c  -fPIC =
-DPIC -o .libs/rnd.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../.. -I/home/alimon/repos/poky/buil=
d-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.=
14/lib/nettle/int -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../../gl -I./=
../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../includes -I./../inc=
ludes -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/.. -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/egd.c  -fPIC =
-DPIC -o .libs/egd.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/nettle -I../.. -I/home/alimon/repos/poky/buil=
d-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.=
14/lib/nettle/int -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../../gl -I./=
../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/../includes -I./../inc=
ludes -I./../../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/.. -I/home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/nettle/../minitasn1 -O2 -pipe -g -feliminate-un=
used-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/nettle/int/gcm-camel=
lia.c  -fPIC -DPIC -o int/.libs/gcm-camellia.o
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
    -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=
=3Dgnu -Wl,--as-needed -o libcrypto.la  pk.lo mpi.lo mac.lo cipher.lo init.=
lo egd.lo rnd-common.lo int/gcm-camellia.lo rnd.lo  =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libcrypto.a=
 .libs/pk.o .libs/mpi.o .libs/mac.o .libs/cipher.o .libs/init.o .libs/egd.o=
 .libs/rnd-common.o int/.libs/gcm-camellia.o .libs/rnd.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libcrypto.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libcrypto.la" && ln=
 -s "../libcrypto.la" "libcrypto.la" )
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib/nettle'
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib'
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_range.lo /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/lib/gnutls_range.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_record.lo /home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/gnutls_record.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_compress.lo /home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/gnutls_compress.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o debug.lo /home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/lib/debug.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_cipher.lo /home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/gnutls_cipher.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_mbuffers.lo /home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/gnutls_mbuffers.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_buffers.lo /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/gnutls_buffers.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_handshake.lo /home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/gnutls_handshake.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_num.lo /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/lib/gnutls_num.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_errors.lo /home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/gnutls_errors.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_dh.lo /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/gnutls_dh.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_kx.lo /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/gnutls_kx.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_priority.lo /home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/gnutls_priority.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_hash_int.lo /home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/gnutls_hash_int.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_cipher_int.lo /home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/gnutls_cipher_int.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_session.lo /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/gnutls_session.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_db.lo /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/gnutls_db.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o x509_b64.lo /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/lib/x509_b64.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_extensions.lo /home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/gnutls_extensions.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_auth.lo /home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/gnutls_auth.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_v2_compat.lo /home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/gnutls_v2_compat.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_datum.lo /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/lib/gnutls_datum.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_session_pack.lo /home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/gnutls_session_pack.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_mpi.lo /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/lib/gnutls_mpi.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_pk.lo /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/gnutls_pk.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_cert.lo /home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/gnutls_cert.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_global.lo /home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/gnutls_global.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_constate.lo /home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/gnutls_constate.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_anon_cred.lo /home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/lib/gnutls_anon_cred.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o pkix_asn1_tab.lo /home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/pkix_asn1_tab.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_asn1_tab.lo /home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/gnutls_asn1_tab.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_mem.lo /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/lib/gnutls_mem.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_ui.lo /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/gnutls_ui.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o vasprintf.lo /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/vasprintf.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_sig.lo /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/lib/gnutls_sig.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_ecc.lo /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/lib/gnutls_ecc.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_alert.lo /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/lib/gnutls_alert.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_privkey_raw.lo /home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/gnutls_privkey_raw.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o system.lo /home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/system.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_str.lo /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/lib/gnutls_str.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_state.lo /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/lib/gnutls_state.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_x509.lo /home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/gnutls_x509.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_rsa_export.lo /home/a=
limon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/=
3.3.14-r0/gnutls-3.3.14/lib/gnutls_rsa_export.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_helper.lo /home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/gnutls_helper.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_supplemental.lo /home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib/gnutls_supplemental.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o random.lo /home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/random.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o crypto-api.lo /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/lib/crypto-api.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_privkey.lo /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/gnutls_privkey.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_record.c  -fPIC -DPIC =
-o .libs/gnutls_record.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_mbuffers.c  -fPIC -DPI=
C -o .libs/gnutls_mbuffers.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_compress.c  -fPIC -DPI=
C -o .libs/gnutls_compress.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_handshake.c  -fPIC -DP=
IC -o .libs/gnutls_handshake.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_num.c  -fPIC -DPIC -o =
.libs/gnutls_num.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_range.c  -fPIC -DPIC -=
o .libs/gnutls_range.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_cipher.c  -fPIC -DPIC =
-o .libs/gnutls_cipher.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_buffers.c  -fPIC -DPIC=
 -o .libs/gnutls_buffers.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_db.c  -fPIC -DPIC -o .=
libs/gnutls_db.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_dh.c  -fPIC -DPIC -o .=
libs/gnutls_dh.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_kx.c  -fPIC -DPIC -o .=
libs/gnutls_kx.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_auth.c  -fPIC -DPIC -o=
 .libs/gnutls_auth.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_errors.c  -fPIC -DPIC =
-o .libs/gnutls_errors.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_session_pack.c  -fPIC =
-DPIC -o .libs/gnutls_session_pack.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_hash_int.c  -fPIC -DPI=
C -o .libs/gnutls_hash_int.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/debug.c  -fPIC -DPIC -o .libs=
/debug.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_priority.c  -fPIC -DPI=
C -o .libs/gnutls_priority.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_v2_compat.c  -fPIC -DP=
IC -o .libs/gnutls_v2_compat.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_asn1_tab.c  -fPIC -DPI=
C -o .libs/gnutls_asn1_tab.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_mpi.c  -fPIC -DPIC -o =
.libs/gnutls_mpi.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_session.c  -fPIC -DPIC=
 -o .libs/gnutls_session.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_mem.c  -fPIC -DPIC -o =
.libs/gnutls_mem.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_extensions.c  -fPIC -D=
PIC -o .libs/gnutls_extensions.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_global.c  -fPIC -DPIC =
-o .libs/gnutls_global.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_datum.c  -fPIC -DPIC -=
o .libs/gnutls_datum.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509_b64.c  -fPIC -DPIC -o .l=
ibs/x509_b64.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_ui.c  -fPIC -DPIC -o .=
libs/gnutls_ui.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_cert.c  -fPIC -DPIC -o=
 .libs/gnutls_cert.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/vasprintf.c  -fPIC -DPIC -o .=
libs/vasprintf.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_constate.c  -fPIC -DPI=
C -o .libs/gnutls_constate.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_cipher_int.c  -fPIC -D=
PIC -o .libs/gnutls_cipher_int.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_sig.c  -fPIC -DPIC -o =
.libs/gnutls_sig.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_anon_cred.c  -fPIC -DP=
IC -o .libs/gnutls_anon_cred.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_privkey_raw.c  -fPIC -=
DPIC -o .libs/gnutls_privkey_raw.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_ecc.c  -fPIC -DPIC -o =
.libs/gnutls_ecc.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_helper.c  -fPIC -DPIC =
-o .libs/gnutls_helper.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/system.c  -fPIC -DPIC -o .lib=
s/system.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_rsa_export.c  -fPIC -D=
PIC -o .libs/gnutls_rsa_export.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_state.c  -fPIC -DPIC -=
o .libs/gnutls_state.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_pk.c  -fPIC -DPIC -o .=
libs/gnutls_pk.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_supplemental.c  -fPIC =
-DPIC -o .libs/gnutls_supplemental.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/pkix_asn1_tab.c  -fPIC -DPIC =
-o .libs/pkix_asn1_tab.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_privkey.c  -fPIC -DPIC=
 -o .libs/gnutls_privkey.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_alert.c  -fPIC -DPIC -=
o .libs/gnutls_alert.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/random.c  -fPIC -DPIC -o .lib=
s/random.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_str.c  -fPIC -DPIC -o =
.libs/gnutls_str.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/crypto-api.c  -fPIC -DPIC -o =
.libs/crypto-api.o
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_pcert.lo /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/lib/gnutls_pcert.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_pubkey.lo /home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/gnutls_pubkey.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o locks.lo /home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/lib/locks.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_x509.c  -fPIC -DPIC -o=
 .libs/gnutls_x509.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_pcert.c  -fPIC -DPIC -=
o .libs/gnutls_pcert.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_pubkey.c  -fPIC -DPIC =
-o .libs/gnutls_pubkey.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/locks.c  -fPIC -DPIC -o .libs=
/locks.o
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_dtls.lo /home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/gnutls_dtls.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o system_override.lo /home/ali=
mon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.=
3.14-r0/gnutls-3.3.14/lib/system_override.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o crypto-backend.lo /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/lib/crypto-backend.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o verify-tofu.lo /home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/verify-tofu.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o pin.lo /home/alimon/repos/po=
ky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnut=
ls-3.3.14/lib/pin.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o tpm.lo /home/alimon/repos/po=
ky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnut=
ls-3.3.14/lib/tpm.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o fips.lo /home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnu=
tls-3.3.14/lib/fips.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o safe-memset.lo /home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/safe-memset.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o inet_pton.lo /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/lib/inet_pton.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_srp.lo /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/lib/gnutls_srp.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_dtls.c  -fPIC -DPIC -o=
 .libs/gnutls_dtls.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/system_override.c  -fPIC -DPI=
C -o .libs/system_override.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/crypto-backend.c  -fPIC -DPIC=
 -o .libs/crypto-backend.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/verify-tofu.c  -fPIC -DPIC -o=
 .libs/verify-tofu.o
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -DLOCALEDIR=3D=
\"/usr/share/locale\" -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl =
-I./includes -I./x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/x509   -I/home/alimon/repos/poky=
/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls=
-3.3.14/lib/opencdk -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_psk.lo /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/lib/gnutls_psk.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/pin.c  -fPIC -DPIC -o .libs/p=
in.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/tpm.c  -fPIC -DPIC -o .libs/t=
pm.o
../x86_64-poky-linux-libtool  --tag=3DCXX   --mode=3Dcompile x86_64-poky-li=
nux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I..  -I/home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/includes -I../includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
lib/includes  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes	 -=
O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -=
o libgnutlsxx_la-gnutlsxx.lo `test -f 'gnutlsxx.cpp' || echo '/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib/'`gnutlsxx.cpp
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/fips.c  -fPIC -DPIC -o .libs/=
fips.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/safe-memset.c  -fPIC -DPIC -o=
 .libs/safe-memset.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/inet_pton.c  -fPIC -DPIC -o .=
libs/inet_pton.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_srp.c  -fPIC -DPIC -o =
.libs/gnutls_srp.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -DLOCALEDIR=3D\"/usr/share/locale\" -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/../gl -I./../gl -I./includes -I./x509 -I/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes -I/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/lib/x509 -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/opencdk -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/lib/minitasn1 -O2 -pipe -g -feliminate-unused-debu=
g-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/gnutls_psk.c  -fPIC -DPIC -o =
.libs/gnutls_psk.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-g++ -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/lib -I.. -I/home/alimon/repos/poky/build-x86-64-m=
ultilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/include=
s -I../includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/co=
re2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/includes -I./includes -O2 -pipe -g -feliminate-unus=
ed-debug-types -fvisibility-inlines-hidden -c /home/alimon/repos/poky/build=
-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.1=
4/lib/gnutlsxx.cpp  -fPIC -DPIC -o .libs/libgnutlsxx_la-gnutlsxx.o
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64     -O=
2 -pipe -g -feliminate-unused-debug-types -no-undefined -version-info 69:6:=
41 -Wl,--version-script=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/libgnutls.map =
  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o libgnutls.la -rpath /us=
r/lib64  gnutls_range.lo gnutls_record.lo gnutls_compress.lo debug.lo gnutl=
s_cipher.lo gnutls_mbuffers.lo gnutls_buffers.lo gnutls_handshake.lo gnutls=
_num.lo gnutls_errors.lo gnutls_dh.lo gnutls_kx.lo gnutls_priority.lo gnutl=
s_hash_int.lo gnutls_cipher_int.lo gnutls_session.lo gnutls_db.lo x509_b64.=
lo gnutls_extensions.lo gnutls_auth.lo gnutls_v2_compat.lo gnutls_datum.lo =
gnutls_session_pack.lo gnutls_mpi.lo gnutls_pk.lo gnutls_cert.lo gnutls_glo=
bal.lo gnutls_constate.lo gnutls_anon_cred.lo pkix_asn1_tab.lo gnutls_asn1_=
tab.lo gnutls_mem.lo gnutls_ui.lo vasprintf.lo gnutls_sig.lo gnutls_ecc.lo =
gnutls_alert.lo gnutls_privkey_raw.lo system.lo gnutls_str.lo gnutls_state.=
lo gnutls_x509.lo gnutls_rsa_export.lo gnutls_helper.lo gnutls_supplemental=
.lo random.lo crypto-api.lo gnutls_privkey.lo gnutls_pcert.lo gnutls_pubkey=
.lo locks.lo gnutls_dtls.lo system_override.lo crypto-backend.lo verify-tof=
u.lo pin.lo tpm.lo fips.lo safe-memset.lo inet_pton.lo   gnutls_srp.lo gnut=
ls_psk.lo ../gl/libgnu.la x509/libgnutls_x509.la ext/libgnutls_ext.la auth/=
libgnutls_auth.la algorithms/libgnutls_alg.la extras/libgnutls_extras.la ac=
celerated/libaccelerated.la openpgp/libgnutls_openpgp.la opencdk/libminiope=
ncdk.la minitasn1/libminitasn1.la nettle/libcrypto.la -L/usr/lib64 -lz     =
       -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86=
-64/usr/lib64 -lnettle -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/=
sysroots/qemux86-64/usr/lib64 -lhogweed -lgmp =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc  -m64 -march=3Dcore2=
 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/b=
uild-x86-64-multilib/tmp/sysroots/qemux86-64 -shared  -fPIC -DPIC  .libs/gn=
utls_range.o .libs/gnutls_record.o .libs/gnutls_compress.o .libs/debug.o .l=
ibs/gnutls_cipher.o .libs/gnutls_mbuffers.o .libs/gnutls_buffers.o .libs/gn=
utls_handshake.o .libs/gnutls_num.o .libs/gnutls_errors.o .libs/gnutls_dh.o=
 .libs/gnutls_kx.o .libs/gnutls_priority.o .libs/gnutls_hash_int.o .libs/gn=
utls_cipher_int.o .libs/gnutls_session.o .libs/gnutls_db.o .libs/x509_b64.o=
 .libs/gnutls_extensions.o .libs/gnutls_auth.o .libs/gnutls_v2_compat.o .li=
bs/gnutls_datum.o .libs/gnutls_session_pack.o .libs/gnutls_mpi.o .libs/gnut=
ls_pk.o .libs/gnutls_cert.o .libs/gnutls_global.o .libs/gnutls_constate.o .=
libs/gnutls_anon_cred.o .libs/pkix_asn1_tab.o .libs/gnutls_asn1_tab.o .libs=
/gnutls_mem.o .libs/gnutls_ui.o .libs/vasprintf.o .libs/gnutls_sig.o .libs/=
gnutls_ecc.o .libs/gnutls_alert.o .libs/gnutls_privkey_raw.o .libs/system.o=
 .libs/gnutls_str.o .libs/gnutls_state.o .libs/gnutls_x509.o .libs/gnutls_r=
sa_export.o .libs/gnutls_helper.o .libs/gnutls_supplemental.o .libs/random.=
o .libs/crypto-api.o .libs/gnutls_privkey.o .libs/gnutls_pcert.o .libs/gnut=
ls_pubkey.o .libs/locks.o .libs/gnutls_dtls.o .libs/system_override.o .libs=
/crypto-backend.o .libs/verify-tofu.o .libs/pin.o .libs/tpm.o .libs/fips.o =
.libs/safe-memset.o .libs/inet_pton.o .libs/gnutls_srp.o .libs/gnutls_psk.o=
  -Wl,--whole-archive ../gl/.libs/libgnu.a x509/.libs/libgnutls_x509.a ext/=
.libs/libgnutls_ext.a auth/.libs/libgnutls_auth.a algorithms/.libs/libgnutl=
s_alg.a extras/.libs/libgnutls_extras.a accelerated/.libs/libaccelerated.a =
openpgp/.libs/libgnutls_openpgp.a opencdk/.libs/libminiopencdk.a minitasn1/=
.libs/libminitasn1.a nettle/.libs/libcrypto.a -Wl,--no-whole-archive  -L/us=
r/lib64 -lz -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qe=
mux86-64/usr/lib64 -lnettle -lhogweed -lgmp  -m64 -march=3Dcore2 -mtune=3Dc=
ore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/sysroots/qemux86-64 -O2 -g -Wl,--version-script=3D/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/lib/libgnutls.map -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--=
as-needed   -Wl,-soname -Wl,libgnutls.so.28 -o .libs/libgnutls.so.28.41.6
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
x86_64-poky-linux-libtool: link: (cd ".libs" && rm -f "libgnutls.so.28" && =
ln -s "libgnutls.so.28.41.6" "libgnutls.so.28")
x86_64-poky-linux-libtool: link: (cd ".libs" && rm -f "libgnutls.so" && ln =
-s "libgnutls.so.28.41.6" "libgnutls.so")
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libgnutls.la" && ln=
 -s "../libgnutls.la" "libgnutls.la" )
../x86_64-poky-linux-libtool  --tag=3DCXX   --mode=3Dlink x86_64-poky-linux=
-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D=
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/lib/includes -I./includes	 -O2 -pipe -g -felimi=
nate-unused-debug-types -fvisibility-inlines-hidden -no-undefined -version-=
info 29:0:1 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o libgnutlsxx.l=
a -rpath /usr/lib64 libgnutlsxx_la-gnutlsxx.lo libgnutls.la=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-g++  -m64 -march=3Dcore2=
 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/b=
uild-x86-64-multilib/tmp/sysroots/qemux86-64  -fPIC -DPIC -shared -nostdlib=
 /home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64/usr/=
lib64/../lib64/crti.o /home/alimon/repos/poky/build-x86-64-multilib/tmp/sys=
roots/qemux86-64/usr/lib64/x86_64-poky-linux/4.9.2/crtbeginS.o  .libs/libgn=
utlsxx_la-gnutlsxx.o   ./.libs/libgnutls.so -L/usr/lib64 -L/home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64/usr/lib64 -lz -lnettl=
e -lhogweed -lgmp -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysro=
ots/x86_64-linux/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2 -L/h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64/lib64/.=
./lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux8=
6-64/usr/lib64/x86_64-poky-linux/4.9.2 -L/home/alimon/repos/poky/build-x86-=
64-multilib/tmp/sysroots/qemux86-64/usr/lib64/../lib64 -L/home/alimon/repos=
/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64/lib64 /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64/usr/lib64/libstdc++.so=
 -lm -lc -lgcc_s /home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots=
/qemux86-64/usr/lib64/x86_64-poky-linux/4.9.2/crtendS.o /home/alimon/repos/=
poky/build-x86-64-multilib/tmp/sysroots/qemux86-64/usr/lib64/../lib64/crtn.=
o  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -g -=
Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed   -Wl,-soname -Wl,libgnutlsxx=
.so.28 -o .libs/libgnutlsxx.so.28.1.0
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
x86_64-poky-linux-libtool: link: (cd ".libs" && rm -f "libgnutlsxx.so.28" &=
& ln -s "libgnutlsxx.so.28.1.0" "libgnutlsxx.so.28")
x86_64-poky-linux-libtool: link: (cd ".libs" && rm -f "libgnutlsxx.so" && l=
n -s "libgnutlsxx.so.28.1.0" "libgnutlsxx.so")
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libgnutlsxx.la" && =
ln -s "../libgnutlsxx.la" "libgnutlsxx.la" )
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib'
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib'
make[2]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/lib'
Making all in extra
make[2]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/extra'
Making all in includes
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/extra/includes'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/extra/includes'
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/extra'
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra -I..  -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/extra/../gl -I./../gl -I./../lib/includes -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/extra/../lib/includes -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/extra/includes -I./includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/../lib =
-I./../lib -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/../lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gnutls_openssl.lo /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/extra/gnutls_openssl.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra -I..  -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/extra/../gl -I./../gl -I./../lib/includes -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/extra/../lib/includes -I/home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/extra/includes -I./includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/../lib =
-I./../lib -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/../lib/minitasn1      -O2=
 -pipe -g -feliminate-unused-debug-types -c -o openssl_compat.lo /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/extra/openssl_compat.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/extra -I.. -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra=
/../gl -I./../gl -I./../lib/includes -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra=
/../lib/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I./includ=
es -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/../lib -I./../lib -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/extra/../lib/minitasn1 -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/openssl_compat.c  -fPIC -=
DPIC -o .libs/openssl_compat.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/extra -I.. -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra=
/../gl -I./../gl -I./../lib/includes -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra=
/../lib/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/c=
ore2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I./includ=
es -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-l=
inux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/../lib -I./../lib -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/extra/../lib/minitasn1 -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/gnutls_openssl.c  -fPIC -=
DPIC -o .libs/gnutls_openssl.o
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64     -O=
2 -pipe -g -feliminate-unused-debug-types -no-undefined -version-info 27:2:=
0  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o libgnutls-openssl.la -=
rpath /usr/lib64 gnutls_openssl.lo openssl_compat.lo ../gl/libgnu.la ../lib=
/libgnutls.la ../lib/minitasn1/libminitasn1.la  =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc  -m64 -march=3Dcore2=
 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/b=
uild-x86-64-multilib/tmp/sysroots/qemux86-64 -shared  -fPIC -DPIC  .libs/gn=
utls_openssl.o .libs/openssl_compat.o  -Wl,--whole-archive ../gl/.libs/libg=
nu.a ../lib/minitasn1/.libs/libminitasn1.a -Wl,--no-whole-archive  ../lib/.=
libs/libgnutls.so -L/usr/lib64 -L/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/sysroots/qemux86-64/usr/lib64 -lz -lnettle -lhogweed -lgmp  -m64 -m=
arch=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -g -Wl,-O1 -Wl=
,--hash-style=3Dgnu -Wl,--as-needed   -Wl,-soname -Wl,libgnutls-openssl.so.=
27 -o .libs/libgnutls-openssl.so.27.0.2
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
x86_64-poky-linux-libtool: link: (cd ".libs" && rm -f "libgnutls-openssl.so=
.27" && ln -s "libgnutls-openssl.so.27.0.2" "libgnutls-openssl.so.27")
x86_64-poky-linux-libtool: link: (cd ".libs" && rm -f "libgnutls-openssl.so=
" && ln -s "libgnutls-openssl.so.27.0.2" "libgnutls-openssl.so")
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libgnutls-openssl.l=
a" && ln -s "../libgnutls-openssl.la" "libgnutls-openssl.la" )
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/extra'
make[2]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/extra'
Making all in po
make[2]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/po'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/po'
Making all in src
make[2]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src'
make  all-recursive
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src'
Making all in gl
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/gl'
rm -f alloca.h-t alloca.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  cat /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-=
linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/alloca.in.h; \
} > alloca.h-t && \
mv -f alloca.h-t alloca.h
rm -f c++defs.h-t c++defs.h && \
sed -n -e '/_GL_CXXDEFS/,$p' \
  < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/build-aux/snippet/c++defs.h \
  > c++defs.h-t && \
mv c++defs.h-t c++defs.h
rm -f warn-on-use.h-t warn-on-use.h && \
sed -n -e '/^.ifndef/,$p' \
  < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/build-aux/snippet/warn-on-use.h \
  > warn-on-use.h-t && \
mv warn-on-use.h-t warn-on-use.h
rm -f arg-nonnull.h-t arg-nonnull.h && \
sed -n -e '/GL_ARG_NONNULL/,$p' \
  < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/build-aux/snippet/arg-nonnull.h \
  > arg-nonnull.h-t && \
mv arg-nonnull.h-t arg-nonnull.h
rm -f stddef.h-t stddef.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_STDDEF_H''@|<stddef.h>|g' \
      -e 's|@''HAVE_MAX_ALIGN_T''@|0|g' \
      -e 's|@''HAVE_WCHAR_T''@|1|g' \
      -e 's|@''REPLACE_NULL''@|0|g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/stddef.in.h; \
} > stddef.h-t && \
mv stddef.h-t stddef.h
/usr/bin/mkdir -p sys
/usr/bin/mkdir -p sys
rm -f sys/types.h-t sys/types.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_SYS_TYPES_H''@|<sys/types.h>|g' \
      -e 's|@''WINDOWS_64_BIT_OFF_T''@|0|g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/sys_types.in.h; \
} > sys/types.h-t && \
mv sys/types.h-t sys/types.h
rm -f sys/uio.h-t sys/uio.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_SYS_UIO_H''@|<sys/uio.h>|g' \
      -e 's|@''HAVE_SYS_UIO_H''@|1|g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/sys_uio.in.h; \
} > sys/uio.h-t && \
mv -f sys/uio.h-t sys/uio.h
/usr/bin/mkdir -p sys
/usr/bin/mkdir -p arpa
rm -f netdb.h-t netdb.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_NETDB_H''@|<netdb.h>|g' \
      -e 's|@''HAVE_NETDB_H''@|1|g' \
      -e 's/@''GNULIB_GETADDRINFO''@/1/g' \
      -e 's|@''HAVE_STRUCT_ADDRINFO''@|1|g' \
      -e 's|@''HAVE_DECL_FREEADDRINFO''@|1|g' \
      -e 's|@''HAVE_DECL_GAI_STRERROR''@|1|g' \
      -e 's|@''HAVE_DECL_GETADDRINFO''@|1|g' \
      -e 's|@''HAVE_DECL_GETNAMEINFO''@|1|g' \
      -e 's|@''REPLACE_GAI_STRERROR''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/netdb.in.h; \
} > netdb.h-t && \
mv netdb.h-t netdb.h
rm -f signal.h-t signal.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_SIGNAL_H''@|<signal.h>|g' \
      -e 's|@''GNULIB_PTHREAD_SIGMASK''@|0|g' \
      -e 's|@''GNULIB_RAISE''@|0|g' \
      -e 's/@''GNULIB_SIGNAL_H_SIGPIPE''@/0/g' \
      -e 's/@''GNULIB_SIGPROCMASK''@/0/g' \
      -e 's/@''GNULIB_SIGACTION''@/0/g' \
      -e 's|@''HAVE_POSIX_SIGNALBLOCKING''@|1|g' \
      -e 's|@''HAVE_PTHREAD_SIGMASK''@|1|g' \
      -e 's|@''HAVE_RAISE''@|1|g' \
      -e 's|@''HAVE_SIGSET_T''@|1|g' \
      -e 's|@''HAVE_SIGINFO_T''@|1|g' \
      -e 's|@''HAVE_SIGACTION''@|1|g' \
      -e 's|@''HAVE_STRUCT_SIGACTION_SA_SIGACTION''@|1|g' \
      -e 's|@''HAVE_TYPE_VOLATILE_SIG_ATOMIC_T''@|1|g' \
      -e 's|@''HAVE_SIGHANDLER_T''@|1|g' \
      -e 's|@''REPLACE_PTHREAD_SIGMASK''@|0|g' \
      -e 's|@''REPLACE_RAISE''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/signal.in.h; \
} > signal.h-t && \
mv signal.h-t signal.h
rm -f sys/select.h-t sys/select.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_SYS_SELECT_H''@|<sys/select.h>|g' \
      -e 's|@''HAVE_SYS_SELECT_H''@|1|g' \
      -e 's/@''GNULIB_PSELECT''@/0/g' \
      -e 's/@''GNULIB_SELECT''@/1/g' \
      -e 's|@''HAVE_WINSOCK2_H''@|0|g' \
      -e 's|@''HAVE_PSELECT''@|1|g' \
      -e 's|@''REPLACE_PSELECT''@|0|g' \
      -e 's|@''REPLACE_SELECT''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/sys_select.in.h; \
} > sys/select.h-t && \
mv sys/select.h-t sys/select.h
rm -f stdio.h-t stdio.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_STDIO_H''@|<stdio.h>|g' \
      -e 's/@''GNULIB_DPRINTF''@/0/g' \
      -e 's/@''GNULIB_FCLOSE''@/0/g' \
      -e 's/@''GNULIB_FDOPEN''@/IN_GNUTLS_GNULIB_TESTS/g' \
      -e 's/@''GNULIB_FFLUSH''@/0/g' \
      -e 's/@''GNULIB_FGETC''@/1/g' \
      -e 's/@''GNULIB_FGETS''@/1/g' \
      -e 's/@''GNULIB_FOPEN''@/0/g' \
      -e 's/@''GNULIB_FPRINTF''@/1/g' \
      -e 's/@''GNULIB_FPRINTF_POSIX''@/0/g' \
      -e 's/@''GNULIB_FPURGE''@/0/g' \
      -e 's/@''GNULIB_FPUTC''@/1/g' \
      -e 's/@''GNULIB_FPUTS''@/1/g' \
      -e 's/@''GNULIB_FREAD''@/1/g' \
      -e 's/@''GNULIB_FREOPEN''@/0/g' \
      -e 's/@''GNULIB_FSCANF''@/1/g' \
      -e 's/@''GNULIB_FSEEK''@/1/g' \
      -e 's/@''GNULIB_FSEEKO''@/1/g' \
      -e 's/@''GNULIB_FTELL''@/1/g' \
      -e 's/@''GNULIB_FTELLO''@/1/g' \
      -e 's/@''GNULIB_FWRITE''@/1/g' \
      -e 's/@''GNULIB_GETC''@/1/g' \
      -e 's/@''GNULIB_GETCHAR''@/1/g' \
      -e 's/@''GNULIB_GETDELIM''@/1/g' \
      -e 's/@''GNULIB_GETLINE''@/1/g' \
      -e 's/@''GNULIB_OBSTACK_PRINTF''@/0/g' \
      -e 's/@''GNULIB_OBSTACK_PRINTF_POSIX''@/0/g' \
      -e 's/@''GNULIB_PCLOSE''@/0/g' \
      -e 's/@''GNULIB_PERROR''@/0/g' \
      -e 's/@''GNULIB_POPEN''@/0/g' \
      -e 's/@''GNULIB_PRINTF''@/1/g' \
      -e 's/@''GNULIB_PRINTF_POSIX''@/0/g' \
      -e 's/@''GNULIB_PUTC''@/1/g' \
      -e 's/@''GNULIB_PUTCHAR''@/1/g' \
      -e 's/@''GNULIB_PUTS''@/1/g' \
      -e 's/@''GNULIB_REMOVE''@/0/g' \
      -e 's/@''GNULIB_RENAME''@/0/g' \
      -e 's/@''GNULIB_RENAMEAT''@/0/g' \
      -e 's/@''GNULIB_SCANF''@/1/g' \
      -e 's/@''GNULIB_SNPRINTF''@/1/g' \
      -e 's/@''GNULIB_SPRINTF_POSIX''@/0/g' \
      -e 's/@''GNULIB_STDIO_H_NONBLOCKING''@/0/g' \
      -e 's/@''GNULIB_STDIO_H_SIGPIPE''@/0/g' \
      -e 's/@''GNULIB_TMPFILE''@/0/g' \
      -e 's/@''GNULIB_VASPRINTF''@/1/g' \
      -e 's/@''GNULIB_VDPRINTF''@/0/g' \
      -e 's/@''GNULIB_VFPRINTF''@/1/g' \
      -e 's/@''GNULIB_VFPRINTF_POSIX''@/0/g' \
      -e 's/@''GNULIB_VFSCANF''@/0/g' \
      -e 's/@''GNULIB_VSCANF''@/0/g' \
      -e 's/@''GNULIB_VPRINTF''@/1/g' \
      -e 's/@''GNULIB_VPRINTF_POSIX''@/0/g' \
      -e 's/@''GNULIB_VSNPRINTF''@/1/g' \
      -e 's/@''GNULIB_VSPRINTF_POSIX''@/0/g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/stdio.in.h | \
  sed -e 's|@''HAVE_DECL_FPURGE''@|1|g' \
      -e 's|@''HAVE_DECL_FSEEKO''@|1|g' \
      -e 's|@''HAVE_DECL_FTELLO''@|1|g' \
      -e 's|@''HAVE_DECL_GETDELIM''@|1|g' \
      -e 's|@''HAVE_DECL_GETLINE''@|1|g' \
      -e 's|@''HAVE_DECL_OBSTACK_PRINTF''@|1|g' \
      -e 's|@''HAVE_DECL_SNPRINTF''@|1|g' \
      -e 's|@''HAVE_DECL_VSNPRINTF''@|1|g' \
      -e 's|@''HAVE_DPRINTF''@|1|g' \
      -e 's|@''HAVE_FSEEKO''@|1|g' \
      -e 's|@''HAVE_FTELLO''@|1|g' \
      -e 's|@''HAVE_PCLOSE''@|1|g' \
      -e 's|@''HAVE_POPEN''@|1|g' \
      -e 's|@''HAVE_RENAMEAT''@|1|g' \
      -e 's|@''HAVE_VASPRINTF''@|1|g' \
      -e 's|@''HAVE_VDPRINTF''@|1|g' \
      -e 's|@''REPLACE_DPRINTF''@|0|g' \
      -e 's|@''REPLACE_FCLOSE''@|0|g' \
      -e 's|@''REPLACE_FDOPEN''@|0|g' \
      -e 's|@''REPLACE_FFLUSH''@|0|g' \
      -e 's|@''REPLACE_FOPEN''@|0|g' \
      -e 's|@''REPLACE_FPRINTF''@|0|g' \
      -e 's|@''REPLACE_FPURGE''@|0|g' \
      -e 's|@''REPLACE_FREOPEN''@|0|g' \
      -e 's|@''REPLACE_FSEEK''@|0|g' \
      -e 's|@''REPLACE_FSEEKO''@|0|g' \
      -e 's|@''REPLACE_FTELL''@|0|g' \
      -e 's|@''REPLACE_FTELLO''@|0|g' \
      -e 's|@''REPLACE_GETDELIM''@|0|g' \
      -e 's|@''REPLACE_GETLINE''@|0|g' \
      -e 's|@''REPLACE_OBSTACK_PRINTF''@|0|g' \
      -e 's|@''REPLACE_PERROR''@|0|g' \
      -e 's|@''REPLACE_POPEN''@|0|g' \
      -e 's|@''REPLACE_PRINTF''@|0|g' \
      -e 's|@''REPLACE_REMOVE''@|0|g' \
      -e 's|@''REPLACE_RENAME''@|0|g' \
      -e 's|@''REPLACE_RENAMEAT''@|0|g' \
      -e 's|@''REPLACE_SNPRINTF''@|0|g' \
      -e 's|@''REPLACE_SPRINTF''@|0|g' \
      -e 's|@''REPLACE_STDIO_READ_FUNCS''@|0|g' \
      -e 's|@''REPLACE_STDIO_WRITE_FUNCS''@|0|g' \
      -e 's|@''REPLACE_TMPFILE''@|0|g' \
      -e 's|@''REPLACE_VASPRINTF''@|0|g' \
      -e 's|@''REPLACE_VDPRINTF''@|0|g' \
      -e 's|@''REPLACE_VFPRINTF''@|0|g' \
      -e 's|@''REPLACE_VPRINTF''@|0|g' \
      -e 's|@''REPLACE_VSNPRINTF''@|0|g' \
      -e 's|@''REPLACE_VSPRINTF''@|0|g' \
      -e 's|@''ASM_SYMBOL_PREFIX''@||g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
} > stdio.h-t && \
mv stdio.h-t stdio.h
rm -f arpa/inet.h-t arpa/inet.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''HAVE_FEATURES_H''@|1|g' \
      -e 's|@''NEXT_ARPA_INET_H''@|<arpa/inet.h>|g' \
      -e 's|@''HAVE_ARPA_INET_H''@|1|g' \
      -e 's/@''GNULIB_INET_NTOP''@/1/g' \
      -e 's/@''GNULIB_INET_PTON''@/1/g' \
      -e 's|@''HAVE_DECL_INET_NTOP''@|1|g' \
      -e 's|@''HAVE_DECL_INET_PTON''@|1|g' \
      -e 's|@''REPLACE_INET_NTOP''@|0|g' \
      -e 's|@''REPLACE_INET_PTON''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/arpa_inet.in.h; \
} > arpa/inet.h-t && \
mv arpa/inet.h-t arpa/inet.h
rm -f stdlib.h-t stdlib.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_STDLIB_H''@|<stdlib.h>|g' \
      -e 's/@''GNULIB__EXIT''@/0/g' \
      -e 's/@''GNULIB_ATOLL''@/0/g' \
      -e 's/@''GNULIB_CALLOC_POSIX''@/0/g' \
      -e 's/@''GNULIB_CANONICALIZE_FILE_NAME''@/0/g' \
      -e 's/@''GNULIB_GETLOADAVG''@/0/g' \
      -e 's/@''GNULIB_GETSUBOPT''@/0/g' \
      -e 's/@''GNULIB_GRANTPT''@/0/g' \
      -e 's/@''GNULIB_MALLOC_POSIX''@/1/g' \
      -e 's/@''GNULIB_MBTOWC''@/0/g' \
      -e 's/@''GNULIB_MKDTEMP''@/0/g' \
      -e 's/@''GNULIB_MKOSTEMP''@/0/g' \
      -e 's/@''GNULIB_MKOSTEMPS''@/0/g' \
      -e 's/@''GNULIB_MKSTEMP''@/0/g' \
      -e 's/@''GNULIB_MKSTEMPS''@/0/g' \
      -e 's/@''GNULIB_POSIX_OPENPT''@/0/g' \
      -e 's/@''GNULIB_PTSNAME''@/0/g' \
      -e 's/@''GNULIB_PTSNAME_R''@/0/g' \
      -e 's/@''GNULIB_PUTENV''@/0/g' \
      -e 's/@''GNULIB_QSORT_R''@/0/g' \
      -e 's/@''GNULIB_RANDOM''@/0/g' \
      -e 's/@''GNULIB_RANDOM_R''@/0/g' \
      -e 's/@''GNULIB_REALLOC_POSIX''@/1/g' \
      -e 's/@''GNULIB_REALPATH''@/0/g' \
      -e 's/@''GNULIB_RPMATCH''@/0/g' \
      -e 's/@''GNULIB_SECURE_GETENV''@/0/g' \
      -e 's/@''GNULIB_SETENV''@/1/g' \
      -e 's/@''GNULIB_STRTOD''@/0/g' \
      -e 's/@''GNULIB_STRTOLL''@/0/g' \
      -e 's/@''GNULIB_STRTOULL''@/0/g' \
      -e 's/@''GNULIB_SYSTEM_POSIX''@/0/g' \
      -e 's/@''GNULIB_UNLOCKPT''@/0/g' \
      -e 's/@''GNULIB_UNSETENV''@/1/g' \
      -e 's/@''GNULIB_WCTOMB''@/0/g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/stdlib.in.h | \
  sed -e 's|@''HAVE__EXIT''@|1|g' \
      -e 's|@''HAVE_ATOLL''@|1|g' \
      -e 's|@''HAVE_CANONICALIZE_FILE_NAME''@|1|g' \
      -e 's|@''HAVE_DECL_GETLOADAVG''@|1|g' \
      -e 's|@''HAVE_GETSUBOPT''@|1|g' \
      -e 's|@''HAVE_GRANTPT''@|1|g' \
      -e 's|@''HAVE_MKDTEMP''@|1|g' \
      -e 's|@''HAVE_MKOSTEMP''@|1|g' \
      -e 's|@''HAVE_MKOSTEMPS''@|1|g' \
      -e 's|@''HAVE_MKSTEMP''@|1|g' \
      -e 's|@''HAVE_MKSTEMPS''@|1|g' \
      -e 's|@''HAVE_POSIX_OPENPT''@|1|g' \
      -e 's|@''HAVE_PTSNAME''@|1|g' \
      -e 's|@''HAVE_PTSNAME_R''@|1|g' \
      -e 's|@''HAVE_RANDOM''@|1|g' \
      -e 's|@''HAVE_RANDOM_H''@|1|g' \
      -e 's|@''HAVE_RANDOM_R''@|1|g' \
      -e 's|@''HAVE_REALPATH''@|1|g' \
      -e 's|@''HAVE_RPMATCH''@|1|g' \
      -e 's|@''HAVE_SECURE_GETENV''@|1|g' \
      -e 's|@''HAVE_DECL_SETENV''@|1|g' \
      -e 's|@''HAVE_STRTOD''@|1|g' \
      -e 's|@''HAVE_STRTOLL''@|1|g' \
      -e 's|@''HAVE_STRTOULL''@|1|g' \
      -e 's|@''HAVE_STRUCT_RANDOM_DATA''@|1|g' \
      -e 's|@''HAVE_SYS_LOADAVG_H''@|0|g' \
      -e 's|@''HAVE_UNLOCKPT''@|1|g' \
      -e 's|@''HAVE_DECL_UNSETENV''@|1|g' \
      -e 's|@''REPLACE_CALLOC''@|0|g' \
      -e 's|@''REPLACE_CANONICALIZE_FILE_NAME''@|0|g' \
      -e 's|@''REPLACE_MALLOC''@|0|g' \
      -e 's|@''REPLACE_MBTOWC''@|0|g' \
      -e 's|@''REPLACE_MKSTEMP''@|0|g' \
      -e 's|@''REPLACE_PTSNAME''@|0|g' \
      -e 's|@''REPLACE_PTSNAME_R''@|0|g' \
      -e 's|@''REPLACE_PUTENV''@|0|g' \
      -e 's|@''REPLACE_QSORT_R''@|0|g' \
      -e 's|@''REPLACE_RANDOM_R''@|0|g' \
      -e 's|@''REPLACE_REALLOC''@|0|g' \
      -e 's|@''REPLACE_REALPATH''@|0|g' \
      -e 's|@''REPLACE_SETENV''@|0|g' \
      -e 's|@''REPLACE_STRTOD''@|0|g' \
      -e 's|@''REPLACE_UNSETENV''@|0|g' \
      -e 's|@''REPLACE_WCTOMB''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _Noreturn/r /home/alimon/repos/poky/build-x86-64-m=
ultilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/build-a=
ux/snippet/_Noreturn.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
} > stdlib.h-t && \
mv stdlib.h-t stdlib.h
rm -f string.h-t string.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_STRING_H''@|<string.h>|g' \
      -e 's/@''GNULIB_FFSL''@/0/g' \
      -e 's/@''GNULIB_FFSLL''@/0/g' \
      -e 's/@''GNULIB_MBSLEN''@/0/g' \
      -e 's/@''GNULIB_MBSNLEN''@/0/g' \
      -e 's/@''GNULIB_MBSCHR''@/0/g' \
      -e 's/@''GNULIB_MBSRCHR''@/0/g' \
      -e 's/@''GNULIB_MBSSTR''@/0/g' \
      -e 's/@''GNULIB_MBSCASECMP''@/0/g' \
      -e 's/@''GNULIB_MBSNCASECMP''@/0/g' \
      -e 's/@''GNULIB_MBSPCASECMP''@/0/g' \
      -e 's/@''GNULIB_MBSCASESTR''@/0/g' \
      -e 's/@''GNULIB_MBSCSPN''@/0/g' \
      -e 's/@''GNULIB_MBSPBRK''@/0/g' \
      -e 's/@''GNULIB_MBSSPN''@/0/g' \
      -e 's/@''GNULIB_MBSSEP''@/0/g' \
      -e 's/@''GNULIB_MBSTOK_R''@/0/g' \
      -e 's/@''GNULIB_MEMCHR''@/1/g' \
      -e 's/@''GNULIB_MEMMEM''@/1/g' \
      -e 's/@''GNULIB_MEMPCPY''@/0/g' \
      -e 's/@''GNULIB_MEMRCHR''@/0/g' \
      -e 's/@''GNULIB_RAWMEMCHR''@/0/g' \
      -e 's/@''GNULIB_STPCPY''@/0/g' \
      -e 's/@''GNULIB_STPNCPY''@/0/g' \
      -e 's/@''GNULIB_STRCHRNUL''@/0/g' \
      -e 's/@''GNULIB_STRDUP''@/1/g' \
      -e 's/@''GNULIB_STRNCAT''@/0/g' \
      -e 's/@''GNULIB_STRNDUP''@/1/g' \
      -e 's/@''GNULIB_STRNLEN''@/1/g' \
      -e 's/@''GNULIB_STRPBRK''@/0/g' \
      -e 's/@''GNULIB_STRSEP''@/0/g' \
      -e 's/@''GNULIB_STRSTR''@/0/g' \
      -e 's/@''GNULIB_STRCASESTR''@/0/g' \
      -e 's/@''GNULIB_STRTOK_R''@/1/g' \
      -e 's/@''GNULIB_STRERROR''@/1/g' \
      -e 's/@''GNULIB_STRERROR_R''@/0/g' \
      -e 's/@''GNULIB_STRSIGNAL''@/0/g' \
      -e 's/@''GNULIB_STRVERSCMP''@/1/g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/string.in.h | \
  sed -e 's|@''HAVE_FFSL''@|1|g' \
      -e 's|@''HAVE_FFSLL''@|1|g' \
      -e 's|@''HAVE_MBSLEN''@|0|g' \
      -e 's|@''HAVE_MEMCHR''@|1|g' \
      -e 's|@''HAVE_DECL_MEMMEM''@|1|g' \
      -e 's|@''HAVE_MEMPCPY''@|1|g' \
      -e 's|@''HAVE_DECL_MEMRCHR''@|1|g' \
      -e 's|@''HAVE_RAWMEMCHR''@|1|g' \
      -e 's|@''HAVE_STPCPY''@|1|g' \
      -e 's|@''HAVE_STPNCPY''@|1|g' \
      -e 's|@''HAVE_STRCHRNUL''@|1|g' \
      -e 's|@''HAVE_DECL_STRDUP''@|1|g' \
      -e 's|@''HAVE_DECL_STRNDUP''@|1|g' \
      -e 's|@''HAVE_DECL_STRNLEN''@|1|g' \
      -e 's|@''HAVE_STRPBRK''@|1|g' \
      -e 's|@''HAVE_STRSEP''@|1|g' \
      -e 's|@''HAVE_STRCASESTR''@|1|g' \
      -e 's|@''HAVE_DECL_STRTOK_R''@|1|g' \
      -e 's|@''HAVE_DECL_STRERROR_R''@|1|g' \
      -e 's|@''HAVE_DECL_STRSIGNAL''@|1|g' \
      -e 's|@''HAVE_STRVERSCMP''@|1|g' \
      -e 's|@''REPLACE_STPNCPY''@|0|g' \
      -e 's|@''REPLACE_MEMCHR''@|1|g' \
      -e 's|@''REPLACE_MEMMEM''@|0|g' \
      -e 's|@''REPLACE_STRCASESTR''@|0|g' \
      -e 's|@''REPLACE_STRCHRNUL''@|0|g' \
      -e 's|@''REPLACE_STRDUP''@|0|g' \
      -e 's|@''REPLACE_STRSTR''@|0|g' \
      -e 's|@''REPLACE_STRERROR''@|0|g' \
      -e 's|@''REPLACE_STRERROR_R''@|0|g' \
      -e 's|@''REPLACE_STRNCAT''@|0|g' \
      -e 's|@''REPLACE_STRNDUP''@|0|g' \
      -e 's|@''REPLACE_STRNLEN''@|0|g' \
      -e 's|@''REPLACE_STRSIGNAL''@|0|g' \
      -e 's|@''REPLACE_STRTOK_R''@|0|g' \
      -e 's|@''UNDEFINE_STRTOK_R''@|1|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/string.in.h; \
} > string.h-t && \
mv string.h-t string.h
/usr/bin/mkdir -p sys
/usr/bin/mkdir -p sys
/usr/bin/mkdir -p sys
rm -f time.h-t time.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_TIME_H''@|<time.h>|g' \
      -e 's/@''GNULIB_GETTIMEOFDAY''@/1/g' \
      -e 's/@''GNULIB_MKTIME''@/1/g' \
      -e 's/@''GNULIB_NANOSLEEP''@/0/g' \
      -e 's/@''GNULIB_STRPTIME''@/0/g' \
      -e 's/@''GNULIB_TIMEGM''@/0/g' \
      -e 's/@''GNULIB_TIME_R''@/1/g' \
      -e 's|@''HAVE_DECL_LOCALTIME_R''@|1|g' \
      -e 's|@''HAVE_NANOSLEEP''@|1|g' \
      -e 's|@''HAVE_STRPTIME''@|1|g' \
      -e 's|@''HAVE_TIMEGM''@|1|g' \
      -e 's|@''REPLACE_GMTIME''@|0|g' \
      -e 's|@''REPLACE_LOCALTIME''@|0|g' \
      -e 's|@''REPLACE_LOCALTIME_R''@|0|g' \
      -e 's|@''REPLACE_MKTIME''@|1|g' \
      -e 's|@''REPLACE_NANOSLEEP''@|GNULIB_PORTCHECK|g' \
      -e 's|@''REPLACE_TIMEGM''@|GNULIB_PORTCHECK|g' \
      -e 's|@''PTHREAD_H_DEFINES_STRUCT_TIMESPEC''@|0|g' \
      -e 's|@''SYS_TIME_H_DEFINES_STRUCT_TIMESPEC''@|0|g' \
      -e 's|@''TIME_H_DEFINES_STRUCT_TIMESPEC''@|1|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/time.in.h; \
} > time.h-t && \
mv time.h-t time.h
rm -f sys/socket.h-t sys/socket.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_SYS_SOCKET_H''@|<sys/socket.h>|g' \
      -e 's|@''HAVE_SYS_SOCKET_H''@|1|g' \
      -e 's/@''GNULIB_CLOSE''@/1/g' \
      -e 's/@''GNULIB_SOCKET''@/1/g' \
      -e 's/@''GNULIB_CONNECT''@/1/g' \
      -e 's/@''GNULIB_ACCEPT''@/1/g' \
      -e 's/@''GNULIB_BIND''@/1/g' \
      -e 's/@''GNULIB_GETPEERNAME''@/1/g' \
      -e 's/@''GNULIB_GETSOCKNAME''@/0/g' \
      -e 's/@''GNULIB_GETSOCKOPT''@/0/g' \
      -e 's/@''GNULIB_LISTEN''@/1/g' \
      -e 's/@''GNULIB_RECV''@/1/g' \
      -e 's/@''GNULIB_SEND''@/1/g' \
      -e 's/@''GNULIB_RECVFROM''@/1/g' \
      -e 's/@''GNULIB_SENDTO''@/1/g' \
      -e 's/@''GNULIB_SETSOCKOPT''@/1/g' \
      -e 's/@''GNULIB_SHUTDOWN''@/1/g' \
      -e 's/@''GNULIB_ACCEPT4''@/0/g' \
      -e 's|@''HAVE_WINSOCK2_H''@|0|g' \
      -e 's|@''HAVE_WS2TCPIP_H''@|0|g' \
      -e 's|@''HAVE_STRUCT_SOCKADDR_STORAGE''@|1|g' \
      -e 's|@''HAVE_STRUCT_SOCKADDR_STORAGE_SS_FAMILY''@|1|g' \
      -e 's|@''HAVE_SA_FAMILY_T''@|1|g' \
      -e 's|@''HAVE_ACCEPT4''@|1|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/sys_socket.in.h; \
} > sys/socket.h-t && \
mv -f sys/socket.h-t sys/socket.h
rm -f sys/stat.h-t sys/stat.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_SYS_STAT_H''@|<sys/stat.h>|g' \
      -e 's|@''WINDOWS_64_BIT_ST_SIZE''@|0|g' \
      -e 's/@''GNULIB_FCHMODAT''@/0/g' \
      -e 's/@''GNULIB_FSTAT''@/1/g' \
      -e 's/@''GNULIB_FSTATAT''@/0/g' \
      -e 's/@''GNULIB_FUTIMENS''@/0/g' \
      -e 's/@''GNULIB_LCHMOD''@/0/g' \
      -e 's/@''GNULIB_LSTAT''@/0/g' \
      -e 's/@''GNULIB_MKDIRAT''@/0/g' \
      -e 's/@''GNULIB_MKFIFO''@/0/g' \
      -e 's/@''GNULIB_MKFIFOAT''@/0/g' \
      -e 's/@''GNULIB_MKNOD''@/0/g' \
      -e 's/@''GNULIB_MKNODAT''@/0/g' \
      -e 's/@''GNULIB_STAT''@/0/g' \
      -e 's/@''GNULIB_UTIMENSAT''@/0/g' \
      -e 's|@''HAVE_FCHMODAT''@|1|g' \
      -e 's|@''HAVE_FSTATAT''@|1|g' \
      -e 's|@''HAVE_FUTIMENS''@|1|g' \
      -e 's|@''HAVE_LCHMOD''@|1|g' \
      -e 's|@''HAVE_LSTAT''@|1|g' \
      -e 's|@''HAVE_MKDIRAT''@|1|g' \
      -e 's|@''HAVE_MKFIFO''@|1|g' \
      -e 's|@''HAVE_MKFIFOAT''@|1|g' \
      -e 's|@''HAVE_MKNOD''@|1|g' \
      -e 's|@''HAVE_MKNODAT''@|1|g' \
      -e 's|@''HAVE_UTIMENSAT''@|1|g' \
      -e 's|@''REPLACE_FSTAT''@|0|g' \
      -e 's|@''REPLACE_FSTATAT''@|0|g' \
      -e 's|@''REPLACE_FUTIMENS''@|0|g' \
      -e 's|@''REPLACE_LSTAT''@|0|g' \
      -e 's|@''REPLACE_MKDIR''@|0|g' \
      -e 's|@''REPLACE_MKFIFO''@|0|g' \
      -e 's|@''REPLACE_MKNOD''@|0|g' \
      -e 's|@''REPLACE_STAT''@|0|g' \
      -e 's|@''REPLACE_UTIMENSAT''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/sys_stat.in.h; \
} > sys/stat.h-t && \
mv sys/stat.h-t sys/stat.h
rm -f sys/time.h-t sys/time.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's/@''HAVE_SYS_TIME_H''@/1/g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_SYS_TIME_H''@|<sys/time.h>|g' \
      -e 's/@''GNULIB_GETTIMEOFDAY''@/1/g' \
      -e 's|@''HAVE_WINSOCK2_H''@|0|g' \
      -e 's/@''HAVE_GETTIMEOFDAY''@/1/g' \
      -e 's/@''HAVE_STRUCT_TIMEVAL''@/1/g' \
      -e 's/@''REPLACE_GETTIMEOFDAY''@/0/g' \
      -e 's/@''REPLACE_STRUCT_TIMEVAL''@/0/g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/sys_time.in.h; \
} > sys/time.h-t && \
mv sys/time.h-t sys/time.h
rm -f unistd.h-t unistd.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''HAVE_UNISTD_H''@|1|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''NEXT_UNISTD_H''@|<unistd.h>|g' \
      -e 's|@''WINDOWS_64_BIT_OFF_T''@|0|g' \
      -e 's/@''GNULIB_CHDIR''@/0/g' \
      -e 's/@''GNULIB_CHOWN''@/0/g' \
      -e 's/@''GNULIB_CLOSE''@/1/g' \
      -e 's/@''GNULIB_DUP''@/0/g' \
      -e 's/@''GNULIB_DUP2''@/1/g' \
      -e 's/@''GNULIB_DUP3''@/0/g' \
      -e 's/@''GNULIB_ENVIRON''@/1/g' \
      -e 's/@''GNULIB_EUIDACCESS''@/0/g' \
      -e 's/@''GNULIB_FACCESSAT''@/0/g' \
      -e 's/@''GNULIB_FCHDIR''@/0/g' \
      -e 's/@''GNULIB_FCHOWNAT''@/0/g' \
      -e 's/@''GNULIB_FDATASYNC''@/0/g' \
      -e 's/@''GNULIB_FSYNC''@/0/g' \
      -e 's/@''GNULIB_FTRUNCATE''@/0/g' \
      -e 's/@''GNULIB_GETCWD''@/0/g' \
      -e 's/@''GNULIB_GETDOMAINNAME''@/0/g' \
      -e 's/@''GNULIB_GETDTABLESIZE''@/0/g' \
      -e 's/@''GNULIB_GETGROUPS''@/0/g' \
      -e 's/@''GNULIB_GETHOSTNAME''@/0/g' \
      -e 's/@''GNULIB_GETLOGIN''@/0/g' \
      -e 's/@''GNULIB_GETLOGIN_R''@/0/g' \
      -e 's/@''GNULIB_GETPAGESIZE''@/IN_GNUTLS_GNULIB_TESTS/g' \
      -e 's/@''GNULIB_GETUSERSHELL''@/0/g' \
      -e 's/@''GNULIB_GROUP_MEMBER''@/0/g' \
      -e 's/@''GNULIB_ISATTY''@/0/g' \
      -e 's/@''GNULIB_LCHOWN''@/0/g' \
      -e 's/@''GNULIB_LINK''@/0/g' \
      -e 's/@''GNULIB_LINKAT''@/0/g' \
      -e 's/@''GNULIB_LSEEK''@/1/g' \
      -e 's/@''GNULIB_PIPE''@/0/g' \
      -e 's/@''GNULIB_PIPE2''@/0/g' \
      -e 's/@''GNULIB_PREAD''@/0/g' \
      -e 's/@''GNULIB_PWRITE''@/0/g' \
      -e 's/@''GNULIB_READ''@/0/g' \
      -e 's/@''GNULIB_READLINK''@/0/g' \
      -e 's/@''GNULIB_READLINKAT''@/0/g' \
      -e 's/@''GNULIB_RMDIR''@/0/g' \
      -e 's/@''GNULIB_SETHOSTNAME''@/0/g' \
      -e 's/@''GNULIB_SLEEP''@/0/g' \
      -e 's/@''GNULIB_SYMLINK''@/0/g' \
      -e 's/@''GNULIB_SYMLINKAT''@/0/g' \
      -e 's/@''GNULIB_TTYNAME_R''@/0/g' \
      -e 's/@''GNULIB_UNISTD_H_GETOPT''@/0/g' \
      -e 's/@''GNULIB_UNISTD_H_NONBLOCKING''@/0/g' \
      -e 's/@''GNULIB_UNISTD_H_SIGPIPE''@/0/g' \
      -e 's/@''GNULIB_UNLINK''@/0/g' \
      -e 's/@''GNULIB_UNLINKAT''@/0/g' \
      -e 's/@''GNULIB_USLEEP''@/0/g' \
      -e 's/@''GNULIB_WRITE''@/0/g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/unistd.in.h | \
  sed -e 's|@''HAVE_CHOWN''@|1|g' \
      -e 's|@''HAVE_DUP2''@|1|g' \
      -e 's|@''HAVE_DUP3''@|1|g' \
      -e 's|@''HAVE_EUIDACCESS''@|1|g' \
      -e 's|@''HAVE_FACCESSAT''@|1|g' \
      -e 's|@''HAVE_FCHDIR''@|1|g' \
      -e 's|@''HAVE_FCHOWNAT''@|1|g' \
      -e 's|@''HAVE_FDATASYNC''@|1|g' \
      -e 's|@''HAVE_FSYNC''@|1|g' \
      -e 's|@''HAVE_FTRUNCATE''@|1|g' \
      -e 's|@''HAVE_GETDTABLESIZE''@|1|g' \
      -e 's|@''HAVE_GETGROUPS''@|1|g' \
      -e 's|@''HAVE_GETHOSTNAME''@|1|g' \
      -e 's|@''HAVE_GETLOGIN''@|1|g' \
      -e 's|@''HAVE_GETPAGESIZE''@|1|g' \
      -e 's|@''HAVE_GROUP_MEMBER''@|1|g' \
      -e 's|@''HAVE_LCHOWN''@|1|g' \
      -e 's|@''HAVE_LINK''@|1|g' \
      -e 's|@''HAVE_LINKAT''@|1|g' \
      -e 's|@''HAVE_PIPE''@|1|g' \
      -e 's|@''HAVE_PIPE2''@|1|g' \
      -e 's|@''HAVE_PREAD''@|1|g' \
      -e 's|@''HAVE_PWRITE''@|1|g' \
      -e 's|@''HAVE_READLINK''@|1|g' \
      -e 's|@''HAVE_READLINKAT''@|1|g' \
      -e 's|@''HAVE_SETHOSTNAME''@|1|g' \
      -e 's|@''HAVE_SLEEP''@|1|g' \
      -e 's|@''HAVE_SYMLINK''@|1|g' \
      -e 's|@''HAVE_SYMLINKAT''@|1|g' \
      -e 's|@''HAVE_UNLINKAT''@|1|g' \
      -e 's|@''HAVE_USLEEP''@|1|g' \
      -e 's|@''HAVE_DECL_ENVIRON''@|1|g' \
      -e 's|@''HAVE_DECL_FCHDIR''@|1|g' \
      -e 's|@''HAVE_DECL_FDATASYNC''@|1|g' \
      -e 's|@''HAVE_DECL_GETDOMAINNAME''@|1|g' \
      -e 's|@''HAVE_DECL_GETLOGIN_R''@|1|g' \
      -e 's|@''HAVE_DECL_GETPAGESIZE''@|1|g' \
      -e 's|@''HAVE_DECL_GETUSERSHELL''@|1|g' \
      -e 's|@''HAVE_DECL_SETHOSTNAME''@|1|g' \
      -e 's|@''HAVE_DECL_TTYNAME_R''@|1|g' \
      -e 's|@''HAVE_OS_H''@|0|g' \
      -e 's|@''HAVE_SYS_PARAM_H''@|0|g' \
  | \
  sed -e 's|@''REPLACE_CHOWN''@|0|g' \
      -e 's|@''REPLACE_CLOSE''@|0|g' \
      -e 's|@''REPLACE_DUP''@|0|g' \
      -e 's|@''REPLACE_DUP2''@|1|g' \
      -e 's|@''REPLACE_FCHOWNAT''@|0|g' \
      -e 's|@''REPLACE_FTRUNCATE''@|0|g' \
      -e 's|@''REPLACE_GETCWD''@|0|g' \
      -e 's|@''REPLACE_GETDOMAINNAME''@|0|g' \
      -e 's|@''REPLACE_GETDTABLESIZE''@|0|g' \
      -e 's|@''REPLACE_GETLOGIN_R''@|0|g' \
      -e 's|@''REPLACE_GETGROUPS''@|0|g' \
      -e 's|@''REPLACE_GETPAGESIZE''@|0|g' \
      -e 's|@''REPLACE_ISATTY''@|0|g' \
      -e 's|@''REPLACE_LCHOWN''@|0|g' \
      -e 's|@''REPLACE_LINK''@|0|g' \
      -e 's|@''REPLACE_LINKAT''@|0|g' \
      -e 's|@''REPLACE_LSEEK''@|0|g' \
      -e 's|@''REPLACE_PREAD''@|0|g' \
      -e 's|@''REPLACE_PWRITE''@|0|g' \
      -e 's|@''REPLACE_READ''@|0|g' \
      -e 's|@''REPLACE_READLINK''@|0|g' \
      -e 's|@''REPLACE_READLINKAT''@|0|g' \
      -e 's|@''REPLACE_RMDIR''@|0|g' \
      -e 's|@''REPLACE_SLEEP''@|0|g' \
      -e 's|@''REPLACE_SYMLINK''@|0|g' \
      -e 's|@''REPLACE_SYMLINKAT''@|0|g' \
      -e 's|@''REPLACE_TTYNAME_R''@|0|g' \
      -e 's|@''REPLACE_UNLINK''@|0|g' \
      -e 's|@''REPLACE_UNLINKAT''@|0|g' \
      -e 's|@''REPLACE_USLEEP''@|0|g' \
      -e 's|@''REPLACE_WRITE''@|0|g' \
      -e 's|@''UNISTD_H_HAVE_WINSOCK2_H''@|0|g' \
      -e 's|@''UNISTD_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
} > unistd.h-t && \
mv unistd.h-t unistd.h
rm -f wchar.h-t wchar.h && \
{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
  sed -e 's|@''GUARD_PREFIX''@|GL_GGL|g' \
      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
      -e 's|@''PRAGMA_COLUMNS''@||g' \
      -e 's|@''HAVE_FEATURES_H''@|1|g' \
      -e 's|@''NEXT_WCHAR_H''@|<wchar.h>|g' \
      -e 's|@''HAVE_WCHAR_H''@|1|g' \
      -e 's/@''GNULIB_BTOWC''@/0/g' \
      -e 's/@''GNULIB_WCTOB''@/0/g' \
      -e 's/@''GNULIB_MBSINIT''@/0/g' \
      -e 's/@''GNULIB_MBRTOWC''@/0/g' \
      -e 's/@''GNULIB_MBRLEN''@/0/g' \
      -e 's/@''GNULIB_MBSRTOWCS''@/0/g' \
      -e 's/@''GNULIB_MBSNRTOWCS''@/0/g' \
      -e 's/@''GNULIB_WCRTOMB''@/0/g' \
      -e 's/@''GNULIB_WCSRTOMBS''@/0/g' \
      -e 's/@''GNULIB_WCSNRTOMBS''@/0/g' \
      -e 's/@''GNULIB_WCWIDTH''@/0/g' \
      -e 's/@''GNULIB_WMEMCHR''@/0/g' \
      -e 's/@''GNULIB_WMEMCMP''@/0/g' \
      -e 's/@''GNULIB_WMEMCPY''@/0/g' \
      -e 's/@''GNULIB_WMEMMOVE''@/0/g' \
      -e 's/@''GNULIB_WMEMSET''@/0/g' \
      -e 's/@''GNULIB_WCSLEN''@/0/g' \
      -e 's/@''GNULIB_WCSNLEN''@/0/g' \
      -e 's/@''GNULIB_WCSCPY''@/0/g' \
      -e 's/@''GNULIB_WCPCPY''@/0/g' \
      -e 's/@''GNULIB_WCSNCPY''@/0/g' \
      -e 's/@''GNULIB_WCPNCPY''@/0/g' \
      -e 's/@''GNULIB_WCSCAT''@/0/g' \
      -e 's/@''GNULIB_WCSNCAT''@/0/g' \
      -e 's/@''GNULIB_WCSCMP''@/0/g' \
      -e 's/@''GNULIB_WCSNCMP''@/0/g' \
      -e 's/@''GNULIB_WCSCASECMP''@/0/g' \
      -e 's/@''GNULIB_WCSNCASECMP''@/0/g' \
      -e 's/@''GNULIB_WCSCOLL''@/0/g' \
      -e 's/@''GNULIB_WCSXFRM''@/0/g' \
      -e 's/@''GNULIB_WCSDUP''@/0/g' \
      -e 's/@''GNULIB_WCSCHR''@/0/g' \
      -e 's/@''GNULIB_WCSRCHR''@/0/g' \
      -e 's/@''GNULIB_WCSCSPN''@/0/g' \
      -e 's/@''GNULIB_WCSSPN''@/0/g' \
      -e 's/@''GNULIB_WCSPBRK''@/0/g' \
      -e 's/@''GNULIB_WCSSTR''@/0/g' \
      -e 's/@''GNULIB_WCSTOK''@/0/g' \
      -e 's/@''GNULIB_WCSWIDTH''@/0/g' \
      < /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/wchar.in.h | \
  sed -e 's|@''HAVE_WINT_T''@|1|g' \
      -e 's|@''HAVE_BTOWC''@|1|g' \
      -e 's|@''HAVE_MBSINIT''@|1|g' \
      -e 's|@''HAVE_MBRTOWC''@|1|g' \
      -e 's|@''HAVE_MBRLEN''@|1|g' \
      -e 's|@''HAVE_MBSRTOWCS''@|1|g' \
      -e 's|@''HAVE_MBSNRTOWCS''@|1|g' \
      -e 's|@''HAVE_WCRTOMB''@|1|g' \
      -e 's|@''HAVE_WCSRTOMBS''@|1|g' \
      -e 's|@''HAVE_WCSNRTOMBS''@|1|g' \
      -e 's|@''HAVE_WMEMCHR''@|1|g' \
      -e 's|@''HAVE_WMEMCMP''@|1|g' \
      -e 's|@''HAVE_WMEMCPY''@|1|g' \
      -e 's|@''HAVE_WMEMMOVE''@|1|g' \
      -e 's|@''HAVE_WMEMSET''@|1|g' \
      -e 's|@''HAVE_WCSLEN''@|1|g' \
      -e 's|@''HAVE_WCSNLEN''@|1|g' \
      -e 's|@''HAVE_WCSCPY''@|1|g' \
      -e 's|@''HAVE_WCPCPY''@|1|g' \
      -e 's|@''HAVE_WCSNCPY''@|1|g' \
      -e 's|@''HAVE_WCPNCPY''@|1|g' \
      -e 's|@''HAVE_WCSCAT''@|1|g' \
      -e 's|@''HAVE_WCSNCAT''@|1|g' \
      -e 's|@''HAVE_WCSCMP''@|1|g' \
      -e 's|@''HAVE_WCSNCMP''@|1|g' \
      -e 's|@''HAVE_WCSCASECMP''@|1|g' \
      -e 's|@''HAVE_WCSNCASECMP''@|1|g' \
      -e 's|@''HAVE_WCSCOLL''@|1|g' \
      -e 's|@''HAVE_WCSXFRM''@|1|g' \
      -e 's|@''HAVE_WCSDUP''@|1|g' \
      -e 's|@''HAVE_WCSCHR''@|1|g' \
      -e 's|@''HAVE_WCSRCHR''@|1|g' \
      -e 's|@''HAVE_WCSCSPN''@|1|g' \
      -e 's|@''HAVE_WCSSPN''@|1|g' \
      -e 's|@''HAVE_WCSPBRK''@|1|g' \
      -e 's|@''HAVE_WCSSTR''@|1|g' \
      -e 's|@''HAVE_WCSTOK''@|1|g' \
      -e 's|@''HAVE_WCSWIDTH''@|1|g' \
      -e 's|@''HAVE_DECL_WCTOB''@|1|g' \
      -e 's|@''HAVE_DECL_WCWIDTH''@|1|g' \
  | \
  sed -e 's|@''REPLACE_MBSTATE_T''@|0|g' \
      -e 's|@''REPLACE_BTOWC''@|0|g' \
      -e 's|@''REPLACE_WCTOB''@|0|g' \
      -e 's|@''REPLACE_MBSINIT''@|0|g' \
      -e 's|@''REPLACE_MBRTOWC''@|0|g' \
      -e 's|@''REPLACE_MBRLEN''@|0|g' \
      -e 's|@''REPLACE_MBSRTOWCS''@|0|g' \
      -e 's|@''REPLACE_MBSNRTOWCS''@|0|g' \
      -e 's|@''REPLACE_WCRTOMB''@|0|g' \
      -e 's|@''REPLACE_WCSRTOMBS''@|0|g' \
      -e 's|@''REPLACE_WCSNRTOMBS''@|0|g' \
      -e 's|@''REPLACE_WCWIDTH''@|0|g' \
      -e 's|@''REPLACE_WCSWIDTH''@|0|g' \
      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
} > wchar.h-t && \
mv wchar.h-t wchar.h
make  all-recursive
make[5]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/gl'
make[6]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/gl'
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o c-ctype.lo /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/=
gnutls-3.3.14/src/gl/c-ctype.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o exitfail.lo /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/src/gl/exitfail.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o fd-hook.lo /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/=
gnutls-3.3.14/src/gl/fd-hook.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o gettime.lo /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/=
gnutls-3.3.14/src/gl/gettime.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o malloca.lo /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/=
gnutls-3.3.14/src/gl/malloca.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o parse-datetime.lo /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/src/gl/parse-datetime.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o progname.lo /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/src/gl/progname.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o read-file.lo /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/src/gl/read-file.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o sockets.lo /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/=
gnutls-3.3.14/src/gl/sockets.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o sys_socket.lo /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/src/gl/sys_socket.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o timespec.lo /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/src/gl/timespec.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o unistd.lo /home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/src/gl/unistd.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o xmalloc.lo /home/alimon/repo=
s/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/=
gnutls-3.3.14/src/gl/xmalloc.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o xalloc-die.lo /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/src/gl/xalloc-die.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o xsize.lo /home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl/xsize.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o asnprintf.lo /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/src/gl/asnprintf.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o dup2.lo /home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnu=
tls-3.3.14/src/gl/dup2.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o memchr.lo /home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/src/gl/memchr.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o mktime.lo /home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/g=
nutls-3.3.14/src/gl/mktime.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o printf-args.lo /home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/src/gl/printf-args.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o printf-parse.lo /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/src/gl/printf-parse.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../..     -O2=
 -pipe -g -feliminate-unused-debug-types -c -o vasnprintf.lo /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/src/gl/vasnprintf.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/exitfail.c  -fPIC -DPIC =
-o .libs/exitfail.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/c-ctype.c  -fPIC -DPIC -=
o .libs/c-ctype.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/fd-hook.c  -fPIC -DPIC -=
o .libs/fd-hook.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/gettime.c  -fPIC -DPIC -=
o .libs/gettime.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/parse-datetime.c  -fPIC =
-DPIC -o .libs/parse-datetime.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/malloca.c  -fPIC -DPIC -=
o .libs/malloca.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/read-file.c  -fPIC -DPIC=
 -o .libs/read-file.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/sys_socket.c  -fPIC -DPI=
C -o .libs/sys_socket.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/unistd.c  -fPIC -DPIC -o=
 .libs/unistd.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/progname.c  -fPIC -DPIC =
-o .libs/progname.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/sockets.c  -fPIC -DPIC -=
o .libs/sockets.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/xmalloc.c  -fPIC -DPIC -=
o .libs/xmalloc.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/timespec.c  -fPIC -DPIC =
-o .libs/timespec.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/xalloc-die.c  -fPIC -DPI=
C -o .libs/xalloc-die.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/asnprintf.c  -fPIC -DPIC=
 -o .libs/asnprintf.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/xsize.c  -fPIC -DPIC -o =
.libs/xsize.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/memchr.c  -fPIC -DPIC -o=
 .libs/memchr.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/dup2.c  -fPIC -DPIC -o .=
libs/dup2.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/printf-parse.c  -fPIC -D=
PIC -o .libs/printf-parse.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/vasnprintf.c  -fPIC -DPI=
C -o .libs/vasnprintf.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/mktime.c  -fPIC -DPIC -o=
 .libs/mktime.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/gl -I../.. -O2 -pipe -g -feliminate-unused-de=
bug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl/printf-args.c  -fPIC -DP=
IC -o .libs/printf-args.o
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64  -=
O2 -pipe -g -feliminate-unused-debug-types  -no-undefined          -Wl,-O1 =
-Wl,--hash-style=3Dgnu -Wl,--as-needed -o libgnu_gpl.la  c-ctype.lo exitfai=
l.lo fd-hook.lo gettime.lo malloca.lo parse-datetime.lo progname.lo read-fi=
le.lo sockets.lo sys_socket.lo timespec.lo unistd.lo xmalloc.lo xalloc-die.=
lo xsize.lo asnprintf.lo dup2.lo memchr.lo mktime.lo printf-args.lo printf-=
parse.lo vasnprintf.lo =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libgnu_gpl.=
a .libs/c-ctype.o .libs/exitfail.o .libs/fd-hook.o .libs/gettime.o .libs/ma=
lloca.o .libs/parse-datetime.o .libs/progname.o .libs/read-file.o .libs/soc=
kets.o .libs/sys_socket.o .libs/timespec.o .libs/unistd.o .libs/xmalloc.o .=
libs/xalloc-die.o .libs/xsize.o .libs/asnprintf.o .libs/dup2.o .libs/memchr=
.o .libs/mktime.o .libs/printf-args.o .libs/printf-parse.o .libs/vasnprintf=
.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libgnu_gpl.=
a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libgnu_gpl.la" && l=
n -s "../libgnu_gpl.la" "libgnu_gpl.la" )
make[6]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/gl'
make[5]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/gl'
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/gl'
Making all in libopts
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/libopts'
make  all-am
make[5]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/libopts'
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts -I../..  -=
I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux=
/gnutls/3.3.14-r0/gnutls-3.3.14   -O2 -pipe -g -feliminate-unused-debug-typ=
es -c -o libopts_la-libopts.lo `test -f 'libopts.c' || echo '/home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/src/libopts/'`libopts.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/libopts -I../.. -I/home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14 -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/src/libopts/libopts.c  -fPIC -DPIC -o .libs/libopts_la-libopts.o
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64  -=
O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu =
-Wl,--as-needed -o libopts.la  libopts_la-libopts.lo =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libopts.a .=
libs/libopts_la-libopts.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libopts.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libopts.la" && ln -=
s "../libopts.la" "libopts.la" )
make[5]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/libopts'
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/libopts'
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src'
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..  -I/home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnu=
tls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libd=
ane/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/includes -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feliminate-unused-de=
bug-types -c -o srptool-args.lo /home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/srptool-=
args.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..  -I/home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnu=
tls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libd=
ane/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/includes -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feliminate-unused-de=
bug-types -c -o psktool-args.lo /home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/psktool-=
args.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..  -I/home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnu=
tls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libd=
ane/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/includes -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feliminate-unused-de=
bug-types -c -o ocsptool-args.lo /home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/ocsptoo=
l-args.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..  -I/home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnu=
tls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libd=
ane/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/includes -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feliminate-unused-de=
bug-types -c -o serv-args.lo /home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/serv-args.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..  -I/home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnu=
tls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libd=
ane/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/includes -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feliminate-unused-de=
bug-types -c -o cli-args.lo /home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/cli-args.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..  -I/home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnu=
tls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libd=
ane/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/includes -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feliminate-unused-de=
bug-types -c -o cli-debug-args.lo /home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/cli-de=
bug-args.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..  -I/home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnu=
tls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libd=
ane/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/includes -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feliminate-unused-de=
bug-types -c -o certtool-args.lo /home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/certtoo=
l-args.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..  -I/home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnu=
tls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libd=
ane/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/includes -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feliminate-unused-de=
bug-types -c -o certtool-cfg.lo /home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/certtool=
-cfg.c
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..  -I/home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnu=
tls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libd=
ane/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2=
-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/includes -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feliminate-unused-de=
bug-types -c -o danetool-args.lo /home/alimon/repos/poky/build-x86-64-multi=
lib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/danetoo=
l-args.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o psk.o /home/alimon/repos/poky/build-x86-64-=
multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/ps=
k.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o cli-debug.o /home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
src/cli-debug.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o tests.o /home/alimon/repos/poky/build-x86-6=
4-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/=
tests.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o socket.o /home/alimon/repos/poky/build-x86-=
64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src=
/socket.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o common.o /home/alimon/repos/poky/build-x86-=
64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src=
/common.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o certtool.o /home/alimon/repos/poky/build-x8=
6-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/s=
rc/certtool.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o certtool-common.o /home/alimon/repos/poky/b=
uild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3=
.3.14/src/certtool-common.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o certtool-extras.o /home/alimon/repos/poky/b=
uild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3=
.3.14/src/certtool-extras.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o srptool.o /home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/sr=
c/srptool.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o ocsptool.o /home/alimon/repos/poky/build-x8=
6-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/s=
rc/ocsptool.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o ocsptool-common.o /home/alimon/repos/poky/b=
uild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3=
.3.14/src/ocsptool-common.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o serv.o /home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/s=
erv.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o udp-serv.o /home/alimon/repos/poky/build-x8=
6-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/s=
rc/udp-serv.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o cli.o /home/alimon/repos/poky/build-x86-64-=
multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/cl=
i.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o benchmark-cipher.o /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/src/benchmark-cipher.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o benchmark.o /home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
src/benchmark.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src -I..=
  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-li=
nux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I./gl -I./../lib/includes -I/hom=
e/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnut=
ls/3.3.14-r0/gnutls-3.3.14/src/../lib/includes -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/src/../libdane/includes -I/home/alimon/repos/poky/build-x86-64-multili=
b/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../extra/=
includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-=
poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/libopts    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o benchmark-tls.o /home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/src/benchmark-tls.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src -I.. -I/home/alimon/repos/poky/build-x86-64-m=
ultilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl =
-I./gl -I./../lib/includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../lib/incl=
udes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky=
-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libdane/includes -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/src/../extra/includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
src/libopts -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/src/psktool-args.c  -fPIC -DPIC -o .libs/psktool-args.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src -I.. -I/home/alimon/repos/poky/build-x86-64-m=
ultilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl =
-I./gl -I./../lib/includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../lib/incl=
udes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky=
-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libdane/includes -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/src/../extra/includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
src/libopts -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/src/cli-args.c  -fPIC -DPIC -o .libs/cli-args.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src -I.. -I/home/alimon/repos/poky/build-x86-64-m=
ultilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl =
-I./gl -I./../lib/includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../lib/incl=
udes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky=
-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libdane/includes -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/src/../extra/includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
src/libopts -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/src/cli-debug-args.c  -fPIC -DPIC -o .libs/cli-debug-args.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src -I.. -I/home/alimon/repos/poky/build-x86-64-m=
ultilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl =
-I./gl -I./../lib/includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../lib/incl=
udes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky=
-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libdane/includes -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/src/../extra/includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
src/libopts -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/src/certtool-cfg.c  -fPIC -DPIC -o .libs/certtool-cfg.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src -I.. -I/home/alimon/repos/poky/build-x86-64-m=
ultilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl =
-I./gl -I./../lib/includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../lib/incl=
udes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky=
-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libdane/includes -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/src/../extra/includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
src/libopts -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/src/danetool-args.c  -fPIC -DPIC -o .libs/danetool-args.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src -I.. -I/home/alimon/repos/poky/build-x86-64-m=
ultilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl =
-I./gl -I./../lib/includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../lib/incl=
udes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky=
-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libdane/includes -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/src/../extra/includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
src/libopts -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/src/srptool-args.c  -fPIC -DPIC -o .libs/srptool-args.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src -I.. -I/home/alimon/repos/poky/build-x86-64-m=
ultilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl =
-I./gl -I./../lib/includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../lib/incl=
udes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky=
-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libdane/includes -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/src/../extra/includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
src/libopts -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/src/ocsptool-args.c  -fPIC -DPIC -o .libs/ocsptool-args.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src -I.. -I/home/alimon/repos/poky/build-x86-64-m=
ultilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl =
-I./gl -I./../lib/includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../lib/incl=
udes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky=
-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libdane/includes -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/src/../extra/includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
src/libopts -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/src/serv-args.c  -fPIC -DPIC -o .libs/serv-args.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/src -I.. -I/home/alimon/repos/poky/build-x86-64-m=
ultilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl =
-I./gl -I./../lib/includes -I/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../lib/incl=
udes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky=
-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/../libdane/includes -I/home/alimo=
n/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.=
14-r0/gnutls-3.3.14/src/../extra/includes -I/home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
src/libopts -O2 -pipe -g -feliminate-unused-debug-types -c /home/alimon/rep=
os/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0=
/gnutls-3.3.14/src/certtool-args.c  -fPIC -DPIC -o .libs/certtool-args.o
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/src/cli-debug.c: In function 'main':
/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/=
gnutls/3.3.14-r0/gnutls-3.3.14/src/cli-debug.c:262:35: warning: cast to poi=
nter from integer of different size [-Wint-to-pointer-cast]
   gnutls_transport_set_ptr(state, (gnutls_transport_ptr_t)
                                   ^
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o libcmd-cli-debug.la  cli-debug-args.lo =20
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o libcmd-psk.la  psktool-args.lo =20
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o libcmd-srp.la  srptool-args.lo =20
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o libcmd-cli.la  cli-args.lo =20
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o libcmd-ocsp.la  ocsptool-args.lo =20
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o libcmd-serv.la  serv-args.lo =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libcmd-cli-=
debug.a .libs/cli-debug-args.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libcmd-psk.=
a .libs/psktool-args.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libcmd-cli-=
debug.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libcmd-psk.=
a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libcmd-srp.=
a .libs/srptool-args.o=20
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libcmd-cli-debug.la=
" && ln -s "../libcmd-cli-debug.la" "libcmd-cli-debug.la" )
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libcmd-srp.=
a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libcmd-psk.la" && l=
n -s "../libcmd-psk.la" "libcmd-psk.la" )
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o psktool psk.o ../lib/libgnutls.la libcmd-psk.la libopts/lib=
opts.la ../gl/libgnu.la  gl/libgnu_gpl.la=20
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libcmd-srp.la" && l=
n -s "../libcmd-srp.la" "libcmd-srp.la" )
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o srptool srptool.o ../lib/libgnutls.la libcmd-srp.la libopts=
/libopts.la ../gl/libgnu.la  gl/libgnu_gpl.la=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libcmd-cli.=
a .libs/cli-args.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libcmd-ocsp=
.a .libs/ocsptool-args.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libcmd-cli.=
a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libcmd-ocsp=
.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libcmd-cli.la" && l=
n -s "../libcmd-cli.la" "libcmd-cli.la" )
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libcmd-ocsp.la" && =
ln -s "../libcmd-ocsp.la" "libcmd-ocsp.la" )
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libcmd-serv=
.a .libs/serv-args.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libcmd-serv=
.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libcmd-serv.la" && =
ln -s "../libcmd-serv.la" "libcmd-serv.la" )
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o ocsptool ocsptool.o ocsptool-common.o socket.o ../lib/libgn=
utls.la libcmd-ocsp.la libopts/libopts.la ../gl/libgnu.la   gl/libgnu_gpl.l=
a=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/psktoo=
l psk.o  ../lib/.libs/libgnutls.so -L/usr/lib64 -L/home/alimon/repos/poky/b=
uild-x86-64-multilib/tmp/sysroots/qemux86-64/usr/lib64 -lz -lnettle -lhogwe=
ed -lgmp ./.libs/libcmd-psk.a libopts/.libs/libopts.a ../gl/.libs/libgnu.a =
gl/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/srptoo=
l srptool.o  ../lib/.libs/libgnutls.so -L/usr/lib64 -L/home/alimon/repos/po=
ky/build-x86-64-multilib/tmp/sysroots/qemux86-64/usr/lib64 -lz -lnettle -lh=
ogweed -lgmp ./.libs/libcmd-srp.a libopts/.libs/libopts.a ../gl/.libs/libgn=
u.a gl/.libs/libgnu_gpl.a
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/ocspto=
ol ocsptool.o ocsptool-common.o socket.o  ../lib/.libs/libgnutls.so -L/usr/=
lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-=
64/usr/lib64 -lz -lnettle -lhogweed -lgmp ./.libs/libcmd-ocsp.a libopts/.li=
bs/libopts.a ../gl/.libs/libgnu.a gl/.libs/libgnu_gpl.a
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o gnutls-cli-debug cli-debug.o tests.o socket.o common.o ../l=
ib/libgnutls.la libcmd-cli-debug.la libopts/libopts.la ../gl/libgnu.la gl/l=
ibgnu_gpl.la   =20
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o gnutls-cli cli.o common.o socket.o ocsptool-common.o benchm=
ark-cipher.o benchmark.o benchmark-tls.o ../lib/libgnutls.la  libcmd-cli.la=
 libopts/libopts.la ../gl/libgnu.la      gl/libgnu_gpl.la=20
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o gnutls-serv serv.o udp-serv.o socket.o common.o ../lib/libg=
nutls.la libcmd-serv.la libopts/libopts.la ../gl/libgnu.la  gl/libgnu_gpl.l=
a  =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/gnutls=
-cli-debug cli-debug.o tests.o socket.o common.o  ../lib/.libs/libgnutls.so=
 -L/usr/lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/=
qemux86-64/usr/lib64 -lz -lnettle -lhogweed -lgmp ./.libs/libcmd-cli-debug.=
a libopts/.libs/libopts.a ../gl/.libs/libgnu.a gl/.libs/libgnu_gpl.a
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/gnutls=
-cli cli.o common.o socket.o ocsptool-common.o benchmark-cipher.o benchmark=
.o benchmark-tls.o  ../lib/.libs/libgnutls.so -L/usr/lib64 -L/home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64/usr/lib64 -lz -lnet=
tle -lhogweed -lgmp ./.libs/libcmd-cli.a libopts/.libs/libopts.a ../gl/.lib=
s/libgnu.a gl/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/gnutls=
-serv serv.o udp-serv.o socket.o common.o  ../lib/.libs/libgnutls.so -L/usr=
/lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86=
-64/usr/lib64 -lz -lnettle -lhogweed -lgmp ./.libs/libcmd-serv.a libopts/.l=
ibs/libopts.a ../gl/.libs/libgnu.a gl/.libs/libgnu_gpl.a
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o libcmd-certtool.la  certtool-args.lo certtool-cfg.lo ../lib=
/libgnutls.la gl/libgnu_gpl.la ../gl/libgnu.la libopts/libopts.la   gl/libg=
nu_gpl.la  =20
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o libcmd-danetool.la  danetool-args.lo certtool-cfg.lo ../lib=
/libgnutls.la gl/libgnu_gpl.la ../gl/libgnu.la libopts/libopts.la    =20
x86_64-poky-linux-libtool: link: (cd .libs/libcmd-danetool.lax/libgnu_gpl.a=
 && x86_64-poky-linux-ar x "/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/gl/.libs/libgnu_gpl.=
a")
x86_64-poky-linux-libtool: link: (cd .libs/libcmd-certtool.lax/libgnu_gpl.a=
 && x86_64-poky-linux-ar x "/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/gl/.libs/libgnu_gpl.=
a")
x86_64-poky-linux-libtool: link: (cd .libs/libcmd-danetool.lax/libgnu.a && =
x86_64-poky-linux-ar x "/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/../gl/.libs/libgnu.a")
x86_64-poky-linux-libtool: link: (cd .libs/libcmd-certtool.lax/libgnu.a && =
x86_64-poky-linux-ar x "/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/../gl/.libs/libgnu.a")
x86_64-poky-linux-libtool: link: (cd .libs/libcmd-danetool.lax/libopts.a &&=
 x86_64-poky-linux-ar x "/home/alimon/repos/poky/build-x86-64-multilib/tmp/=
work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/libopts/.libs/libopts.a=
")
x86_64-poky-linux-libtool: link: (cd .libs/libcmd-certtool.lax/libopts.a &&=
 x86_64-poky-linux-ar x "/home/alimon/repos/poky/build-x86-64-multilib/tmp/=
work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/libopts/.libs/libopts.a=
")
copying selected object files to avoid basename conflicts...
x86_64-poky-linux-libtool: link: ln .libs/libcmd-danetool.lax/libgnu.a/asnp=
rintf.o .libs/libcmd-danetool.lax/lt1-asnprintf.o || cp .libs/libcmd-daneto=
ol.lax/libgnu.a/asnprintf.o .libs/libcmd-danetool.lax/lt1-asnprintf.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-danetool.lax/libgnu.a/c-ct=
ype.o .libs/libcmd-danetool.lax/lt2-c-ctype.o || cp .libs/libcmd-danetool.l=
ax/libgnu.a/c-ctype.o .libs/libcmd-danetool.lax/lt2-c-ctype.o
x86_64-poky-linux-libtool: link: (cd .libs/libcmd-certtool.lax/lt1-libgnu_g=
pl.a && x86_64-poky-linux-ar x "/home/alimon/repos/poky/build-x86-64-multil=
ib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src/gl/.libs/libgnu_=
gpl.a")
x86_64-poky-linux-libtool: link: ln .libs/libcmd-danetool.lax/libgnu.a/memc=
hr.o .libs/libcmd-danetool.lax/lt3-memchr.o || cp .libs/libcmd-danetool.lax=
/libgnu.a/memchr.o .libs/libcmd-danetool.lax/lt3-memchr.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-danetool.lax/libgnu.a/prin=
tf-args.o .libs/libcmd-danetool.lax/lt4-printf-args.o || cp .libs/libcmd-da=
netool.lax/libgnu.a/printf-args.o .libs/libcmd-danetool.lax/lt4-printf-args=
.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-danetool.lax/libgnu.a/prin=
tf-parse.o .libs/libcmd-danetool.lax/lt5-printf-parse.o || cp .libs/libcmd-=
danetool.lax/libgnu.a/printf-parse.o .libs/libcmd-danetool.lax/lt5-printf-p=
arse.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-danetool.lax/libgnu.a/read=
-file.o .libs/libcmd-danetool.lax/lt6-read-file.o || cp .libs/libcmd-daneto=
ol.lax/libgnu.a/read-file.o .libs/libcmd-danetool.lax/lt6-read-file.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-danetool.lax/libgnu.a/sys_=
socket.o .libs/libcmd-danetool.lax/lt7-sys_socket.o || cp .libs/libcmd-dane=
tool.lax/libgnu.a/sys_socket.o .libs/libcmd-danetool.lax/lt7-sys_socket.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-danetool.lax/libgnu.a/unis=
td.o .libs/libcmd-danetool.lax/lt8-unistd.o || cp .libs/libcmd-danetool.lax=
/libgnu.a/unistd.o .libs/libcmd-danetool.lax/lt8-unistd.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-danetool.lax/libgnu.a/vasn=
printf.o .libs/libcmd-danetool.lax/lt9-vasnprintf.o || cp .libs/libcmd-dane=
tool.lax/libgnu.a/vasnprintf.o .libs/libcmd-danetool.lax/lt9-vasnprintf.o
copying selected object files to avoid basename conflicts...
x86_64-poky-linux-libtool: link: ln .libs/libcmd-danetool.lax/libgnu.a/xsiz=
e.o .libs/libcmd-danetool.lax/lt10-xsize.o || cp .libs/libcmd-danetool.lax/=
libgnu.a/xsize.o .libs/libcmd-danetool.lax/lt10-xsize.o
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libcmd-dane=
tool.a .libs/danetool-args.o .libs/certtool-cfg.o .libs/libcmd-danetool.lax=
/libgnu_gpl.a/asnprintf.o .libs/libcmd-danetool.lax/libgnu_gpl.a/c-ctype.o =
.libs/libcmd-danetool.lax/libgnu_gpl.a/dup2.o .libs/libcmd-danetool.lax/lib=
gnu_gpl.a/exitfail.o .libs/libcmd-danetool.lax/libgnu_gpl.a/fd-hook.o .libs=
/libcmd-danetool.lax/libgnu_gpl.a/gettime.o .libs/libcmd-danetool.lax/libgn=
u_gpl.a/malloca.o .libs/libcmd-danetool.lax/libgnu_gpl.a/memchr.o .libs/lib=
cmd-danetool.lax/libgnu_gpl.a/mktime.o .libs/libcmd-danetool.lax/libgnu_gpl=
.a/parse-datetime.o .libs/libcmd-danetool.lax/libgnu_gpl.a/printf-args.o .l=
ibs/libcmd-danetool.lax/libgnu_gpl.a/printf-parse.o .libs/libcmd-danetool.l=
ax/libgnu_gpl.a/progname.o .libs/libcmd-danetool.lax/libgnu_gpl.a/read-file=
.o .libs/libcmd-danetool.lax/libgnu_gpl.a/sockets.o .libs/libcmd-danetool.l=
ax/libgnu_gpl.a/sys_socket.o .libs/libcmd-danetool.lax/libgnu_gpl.a/timespe=
c.o .libs/libcmd-danetool.lax/libgnu_gpl.a/unistd.o .libs/libcmd-danetool.l=
ax/libgnu_gpl.a/vasnprintf.o .libs/libcmd-danetool.lax/libgnu_gpl.a/xalloc-=
die.o .libs/libcmd-danetool.lax/libgnu_gpl.a/xmalloc.o .libs/libcmd-danetoo=
l.lax/libgnu_gpl.a/xsize.o .libs/libcmd-danetool.lax/lt1-asnprintf.o .libs/=
libcmd-danetool.lax/libgnu.a/base64.o .libs/libcmd-danetool.lax/lt2-c-ctype=
.o .libs/libcmd-danetool.lax/libgnu.a/hash-pjw-bare.o .libs/libcmd-danetool=
.lax/lt3-memchr.o .libs/libcmd-danetool.lax/lt4-printf-args.o .libs/libcmd-=
danetool.lax/lt5-printf-parse.o .libs/libcmd-danetool.lax/lt6-read-file.o .=
libs/libcmd-danetool.lax/lt7-sys_socket.o .libs/libcmd-danetool.lax/libgnu.=
a/u64.o .libs/libcmd-danetool.lax/lt8-unistd.o .libs/libcmd-danetool.lax/lt=
9-vasnprintf.o .libs/libcmd-danetool.lax/lt10-xsize.o .libs/libcmd-danetool=
.lax/libopts.a/libopts_la-libopts.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/libgnu.a/asnp=
rintf.o .libs/libcmd-certtool.lax/lt1-asnprintf.o || cp .libs/libcmd-certto=
ol.lax/libgnu.a/asnprintf.o .libs/libcmd-certtool.lax/lt1-asnprintf.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/libgnu.a/c-ct=
ype.o .libs/libcmd-certtool.lax/lt2-c-ctype.o || cp .libs/libcmd-certtool.l=
ax/libgnu.a/c-ctype.o .libs/libcmd-certtool.lax/lt2-c-ctype.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/libgnu.a/memc=
hr.o .libs/libcmd-certtool.lax/lt3-memchr.o || cp .libs/libcmd-certtool.lax=
/libgnu.a/memchr.o .libs/libcmd-certtool.lax/lt3-memchr.o
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libcmd-dane=
tool.a
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/libgnu.a/prin=
tf-args.o .libs/libcmd-certtool.lax/lt4-printf-args.o || cp .libs/libcmd-ce=
rttool.lax/libgnu.a/printf-args.o .libs/libcmd-certtool.lax/lt4-printf-args=
.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/libgnu.a/prin=
tf-parse.o .libs/libcmd-certtool.lax/lt5-printf-parse.o || cp .libs/libcmd-=
certtool.lax/libgnu.a/printf-parse.o .libs/libcmd-certtool.lax/lt5-printf-p=
arse.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/libgnu.a/read=
-file.o .libs/libcmd-certtool.lax/lt6-read-file.o || cp .libs/libcmd-certto=
ol.lax/libgnu.a/read-file.o .libs/libcmd-certtool.lax/lt6-read-file.o
x86_64-poky-linux-libtool: link: rm -fr .libs/libcmd-danetool.lax .libs/lib=
cmd-danetool.lax
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/libgnu.a/sys_=
socket.o .libs/libcmd-certtool.lax/lt7-sys_socket.o || cp .libs/libcmd-cert=
tool.lax/libgnu.a/sys_socket.o .libs/libcmd-certtool.lax/lt7-sys_socket.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/libgnu.a/unis=
td.o .libs/libcmd-certtool.lax/lt8-unistd.o || cp .libs/libcmd-certtool.lax=
/libgnu.a/unistd.o .libs/libcmd-certtool.lax/lt8-unistd.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/libgnu.a/vasn=
printf.o .libs/libcmd-certtool.lax/lt9-vasnprintf.o || cp .libs/libcmd-cert=
tool.lax/libgnu.a/vasnprintf.o .libs/libcmd-certtool.lax/lt9-vasnprintf.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/libgnu.a/xsiz=
e.o .libs/libcmd-certtool.lax/lt10-xsize.o || cp .libs/libcmd-certtool.lax/=
libgnu.a/xsize.o .libs/libcmd-certtool.lax/lt10-xsize.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/asnprintf.o .libs/libcmd-certtool.lax/lt11-asnprintf.o || cp .libs/libc=
md-certtool.lax/lt1-libgnu_gpl.a/asnprintf.o .libs/libcmd-certtool.lax/lt11=
-asnprintf.o
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libcmd-danetool.la"=
 && ln -s "../libcmd-danetool.la" "libcmd-danetool.la" )
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/c-ctype.o .libs/libcmd-certtool.lax/lt12-c-ctype.o || cp .libs/libcmd-c=
erttool.lax/lt1-libgnu_gpl.a/c-ctype.o .libs/libcmd-certtool.lax/lt12-c-cty=
pe.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/dup2.o .libs/libcmd-certtool.lax/lt13-dup2.o || cp .libs/libcmd-certtoo=
l.lax/lt1-libgnu_gpl.a/dup2.o .libs/libcmd-certtool.lax/lt13-dup2.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/exitfail.o .libs/libcmd-certtool.lax/lt14-exitfail.o || cp .libs/libcmd=
-certtool.lax/lt1-libgnu_gpl.a/exitfail.o .libs/libcmd-certtool.lax/lt14-ex=
itfail.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/fd-hook.o .libs/libcmd-certtool.lax/lt15-fd-hook.o || cp .libs/libcmd-c=
erttool.lax/lt1-libgnu_gpl.a/fd-hook.o .libs/libcmd-certtool.lax/lt15-fd-ho=
ok.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/gettime.o .libs/libcmd-certtool.lax/lt16-gettime.o || cp .libs/libcmd-c=
erttool.lax/lt1-libgnu_gpl.a/gettime.o .libs/libcmd-certtool.lax/lt16-getti=
me.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/malloca.o .libs/libcmd-certtool.lax/lt17-malloca.o || cp .libs/libcmd-c=
erttool.lax/lt1-libgnu_gpl.a/malloca.o .libs/libcmd-certtool.lax/lt17-mallo=
ca.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/memchr.o .libs/libcmd-certtool.lax/lt18-memchr.o || cp .libs/libcmd-cer=
ttool.lax/lt1-libgnu_gpl.a/memchr.o .libs/libcmd-certtool.lax/lt18-memchr.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/mktime.o .libs/libcmd-certtool.lax/lt19-mktime.o || cp .libs/libcmd-cer=
ttool.lax/lt1-libgnu_gpl.a/mktime.o .libs/libcmd-certtool.lax/lt19-mktime.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/parse-datetime.o .libs/libcmd-certtool.lax/lt20-parse-datetime.o || cp =
.libs/libcmd-certtool.lax/lt1-libgnu_gpl.a/parse-datetime.o .libs/libcmd-ce=
rttool.lax/lt20-parse-datetime.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/printf-args.o .libs/libcmd-certtool.lax/lt21-printf-args.o || cp .libs/=
libcmd-certtool.lax/lt1-libgnu_gpl.a/printf-args.o .libs/libcmd-certtool.la=
x/lt21-printf-args.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/printf-parse.o .libs/libcmd-certtool.lax/lt22-printf-parse.o || cp .lib=
s/libcmd-certtool.lax/lt1-libgnu_gpl.a/printf-parse.o .libs/libcmd-certtool=
.lax/lt22-printf-parse.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/progname.o .libs/libcmd-certtool.lax/lt23-progname.o || cp .libs/libcmd=
-certtool.lax/lt1-libgnu_gpl.a/progname.o .libs/libcmd-certtool.lax/lt23-pr=
ogname.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/read-file.o .libs/libcmd-certtool.lax/lt24-read-file.o || cp .libs/libc=
md-certtool.lax/lt1-libgnu_gpl.a/read-file.o .libs/libcmd-certtool.lax/lt24=
-read-file.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/sockets.o .libs/libcmd-certtool.lax/lt25-sockets.o || cp .libs/libcmd-c=
erttool.lax/lt1-libgnu_gpl.a/sockets.o .libs/libcmd-certtool.lax/lt25-socke=
ts.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/sys_socket.o .libs/libcmd-certtool.lax/lt26-sys_socket.o || cp .libs/li=
bcmd-certtool.lax/lt1-libgnu_gpl.a/sys_socket.o .libs/libcmd-certtool.lax/l=
t26-sys_socket.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/timespec.o .libs/libcmd-certtool.lax/lt27-timespec.o || cp .libs/libcmd=
-certtool.lax/lt1-libgnu_gpl.a/timespec.o .libs/libcmd-certtool.lax/lt27-ti=
mespec.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/unistd.o .libs/libcmd-certtool.lax/lt28-unistd.o || cp .libs/libcmd-cer=
ttool.lax/lt1-libgnu_gpl.a/unistd.o .libs/libcmd-certtool.lax/lt28-unistd.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/vasnprintf.o .libs/libcmd-certtool.lax/lt29-vasnprintf.o || cp .libs/li=
bcmd-certtool.lax/lt1-libgnu_gpl.a/vasnprintf.o .libs/libcmd-certtool.lax/l=
t29-vasnprintf.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/xalloc-die.o .libs/libcmd-certtool.lax/lt30-xalloc-die.o || cp .libs/li=
bcmd-certtool.lax/lt1-libgnu_gpl.a/xalloc-die.o .libs/libcmd-certtool.lax/l=
t30-xalloc-die.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/xmalloc.o .libs/libcmd-certtool.lax/lt31-xmalloc.o || cp .libs/libcmd-c=
erttool.lax/lt1-libgnu_gpl.a/xmalloc.o .libs/libcmd-certtool.lax/lt31-xmall=
oc.o
x86_64-poky-linux-libtool: link: ln .libs/libcmd-certtool.lax/lt1-libgnu_gp=
l.a/xsize.o .libs/libcmd-certtool.lax/lt32-xsize.o || cp .libs/libcmd-certt=
ool.lax/lt1-libgnu_gpl.a/xsize.o .libs/libcmd-certtool.lax/lt32-xsize.o
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libcmd-cert=
tool.a .libs/certtool-args.o .libs/certtool-cfg.o .libs/libcmd-certtool.lax=
/libgnu_gpl.a/asnprintf.o .libs/libcmd-certtool.lax/libgnu_gpl.a/c-ctype.o =
.libs/libcmd-certtool.lax/libgnu_gpl.a/dup2.o .libs/libcmd-certtool.lax/lib=
gnu_gpl.a/exitfail.o .libs/libcmd-certtool.lax/libgnu_gpl.a/fd-hook.o .libs=
/libcmd-certtool.lax/libgnu_gpl.a/gettime.o .libs/libcmd-certtool.lax/libgn=
u_gpl.a/malloca.o .libs/libcmd-certtool.lax/libgnu_gpl.a/memchr.o .libs/lib=
cmd-certtool.lax/libgnu_gpl.a/mktime.o .libs/libcmd-certtool.lax/libgnu_gpl=
.a/parse-datetime.o .libs/libcmd-certtool.lax/libgnu_gpl.a/printf-args.o .l=
ibs/libcmd-certtool.lax/libgnu_gpl.a/printf-parse.o .libs/libcmd-certtool.l=
ax/libgnu_gpl.a/progname.o .libs/libcmd-certtool.lax/libgnu_gpl.a/read-file=
.o .libs/libcmd-certtool.lax/libgnu_gpl.a/sockets.o .libs/libcmd-certtool.l=
ax/libgnu_gpl.a/sys_socket.o .libs/libcmd-certtool.lax/libgnu_gpl.a/timespe=
c.o .libs/libcmd-certtool.lax/libgnu_gpl.a/unistd.o .libs/libcmd-certtool.l=
ax/libgnu_gpl.a/vasnprintf.o .libs/libcmd-certtool.lax/libgnu_gpl.a/xalloc-=
die.o .libs/libcmd-certtool.lax/libgnu_gpl.a/xmalloc.o .libs/libcmd-certtoo=
l.lax/libgnu_gpl.a/xsize.o .libs/libcmd-certtool.lax/lt1-asnprintf.o .libs/=
libcmd-certtool.lax/libgnu.a/base64.o .libs/libcmd-certtool.lax/lt2-c-ctype=
.o .libs/libcmd-certtool.lax/libgnu.a/hash-pjw-bare.o .libs/libcmd-certtool=
.lax/lt3-memchr.o .libs/libcmd-certtool.lax/lt4-printf-args.o .libs/libcmd-=
certtool.lax/lt5-printf-parse.o .libs/libcmd-certtool.lax/lt6-read-file.o .=
libs/libcmd-certtool.lax/lt7-sys_socket.o .libs/libcmd-certtool.lax/libgnu.=
a/u64.o .libs/libcmd-certtool.lax/lt8-unistd.o .libs/libcmd-certtool.lax/lt=
9-vasnprintf.o .libs/libcmd-certtool.lax/lt10-xsize.o .libs/libcmd-certtool=
.lax/libopts.a/libopts_la-libopts.o .libs/libcmd-certtool.lax/lt11-asnprint=
f.o .libs/libcmd-certtool.lax/lt12-c-ctype.o .libs/libcmd-certtool.lax/lt13=
-dup2.o .libs/libcmd-certtool.lax/lt14-exitfail.o .libs/libcmd-certtool.lax=
/lt15-fd-hook.o .libs/libcmd-certtool.lax/lt16-gettime.o .libs/libcmd-certt=
ool.lax/lt17-malloca.o .libs/libcmd-certtool.lax/lt18-memchr.o .libs/libcmd=
-certtool.lax/lt19-mktime.o .libs/libcmd-certtool.lax/lt20-parse-datetime.o=
 .libs/libcmd-certtool.lax/lt21-printf-args.o .libs/libcmd-certtool.lax/lt2=
2-printf-parse.o .libs/libcmd-certtool.lax/lt23-progname.o .libs/libcmd-cer=
ttool.lax/lt24-read-file.o .libs/libcmd-certtool.lax/lt25-sockets.o .libs/l=
ibcmd-certtool.lax/lt26-sys_socket.o .libs/libcmd-certtool.lax/lt27-timespe=
c.o .libs/libcmd-certtool.lax/lt28-unistd.o .libs/libcmd-certtool.lax/lt29-=
vasnprintf.o .libs/libcmd-certtool.lax/lt30-xalloc-die.o .libs/libcmd-certt=
ool.lax/lt31-xmalloc.o .libs/libcmd-certtool.lax/lt32-xsize.o
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libcmd-cert=
tool.a
x86_64-poky-linux-libtool: link: rm -fr .libs/libcmd-certtool.lax .libs/lib=
cmd-certtool.lax
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libcmd-certtool.la"=
 && ln -s "../libcmd-certtool.la" "libcmd-certtool.la" )
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o certtool certtool.o certtool-common.o certtool-extras.o com=
mon.o ../lib/libgnutls.la libcmd-certtool.la ../gl/libgnu.la gl/libgnu_gpl.=
la=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/certto=
ol certtool.o certtool-common.o certtool-extras.o common.o  ../lib/.libs/li=
bgnutls.so -L/usr/lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp=
/sysroots/qemux86-64/usr/lib64 ./.libs/libcmd-certtool.a /home/alimon/repos=
/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/b=
uild/lib/.libs/libgnutls.so -lz -lnettle -lhogweed -lgmp ../gl/.libs/libgnu=
.a gl/.libs/libgnu_gpl.a
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src'
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src'
make[2]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/src'
Making all in doc
make[2]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc'
make  all-recursive
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc'
Making all in examples
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/examples'
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/examples -I../..  =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/includes -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/sr=
c/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o ex-alert.lo /home/alimon/repos/poky/build-x=
86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/=
doc/examples/ex-alert.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/examples -I../..  =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/includes -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/sr=
c/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o ex-pkcs12.lo /home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/doc/examples/ex-pkcs12.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/examples -I../..  =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/includes -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/sr=
c/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o ex-session-info.lo /home/alimon/repos/poky/=
build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-=
3.3.14/doc/examples/ex-session-info.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/examples -I../..  =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/includes -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/sr=
c/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o ex-x509-info.lo /home/alimon/repos/poky/bui=
ld-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3=
.14/doc/examples/ex-x509-info.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/examples -I../..  =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/includes -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/sr=
c/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o ex-verify.lo /home/alimon/repos/poky/build-=
x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14=
/doc/examples/ex-verify.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/examples -I../..  =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/includes -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/sr=
c/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o tcp.lo /home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/e=
xamples/tcp.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/examples -I../..  =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/includes -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/sr=
c/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o udp.lo /home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/e=
xamples/udp.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/examples -I../..  =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/includes -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/sr=
c/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o ex-pkcs11-list.lo /home/alimon/repos/poky/b=
uild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3=
.3.14/doc/examples/ex-pkcs11-list.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/examples -I../..  =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/includes -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/sr=
c/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o verify.lo /home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/do=
c/examples/verify.c
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-=
linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysro=
ot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 =
-DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wor=
k/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/examples -I../..  =
-I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/includes -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/poky/build-x86=
-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/sr=
c/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 -pipe -g -feli=
minate-unused-debug-types -c -o ex-verify-ssh.lo /home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/doc/examples/ex-verify-ssh.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-client-resume.o /home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/doc/examples/ex-client-resume.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-client-dtls.o /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/doc/examples/ex-client-dtls.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-cert-select.o /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/doc/examples/ex-cert-select.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-client-x509.o /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/doc/examples/ex-client-x509.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-serv-dtls.o /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/doc/examples/ex-serv-dtls.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o print-ciphersuites.o /home/al=
imon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3=
.3.14-r0/gnutls-3.3.14/doc/examples/print-ciphersuites.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-serv-x509.o /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/doc/examples/ex-serv-x509.c
x86_64-poky-linux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL   -O2 -=
pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -c -o ex=
-cxx.o /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky=
-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/examples/ex-cxx.cpp
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-client-anon.o /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/doc/examples/ex-client-anon.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-serv-anon.o /home/alimon/r=
epos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-=
r0/gnutls-3.3.14/doc/examples/ex-serv-anon.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-serv-pgp.o /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/doc/examples/ex-serv-pgp.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-client-psk.o /home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/doc/examples/ex-client-psk.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-serv-psk.o /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/doc/examples/ex-serv-psk.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-client-srp.o /home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/doc/examples/ex-client-srp.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-serv-srp.o /home/alimon/re=
pos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r=
0/gnutls-3.3.14/doc/examples/ex-serv-srp.c
x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse --sysroot=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroo=
ts/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-mu=
ltilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/exam=
ples -I../..  -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core=
2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../../lib/inc=
ludes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I/home/alimon/repos/=
poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gn=
utls-3.3.14/src/gl -I../../src/gl -D_GL_NO_LARGE_FILES -DNO_LIBCURL    -O2 =
-pipe -g -feliminate-unused-debug-types -c -o ex-ocsp-client.o /home/alimon=
/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.1=
4-r0/gnutls-3.3.14/doc/examples/ex-ocsp-client.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/doc/examples -I../.. -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/includes -I../../lib/includes -I/home/alimon/repos/poky/build-x86-=
64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/ext=
ra/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-=
64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../../src/gl -D_GL_NO=
_LARGE_FILES -DNO_LIBCURL -O2 -pipe -g -feliminate-unused-debug-types -c /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/doc/examples/ex-verify.c  -fPIC -DPIC -o .libs=
/ex-verify.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/doc/examples -I../.. -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/includes -I../../lib/includes -I/home/alimon/repos/poky/build-x86-=
64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/ext=
ra/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-=
64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../../src/gl -D_GL_NO=
_LARGE_FILES -DNO_LIBCURL -O2 -pipe -g -feliminate-unused-debug-types -c /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/doc/examples/udp.c  -fPIC -DPIC -o .libs/udp.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/doc/examples -I../.. -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/includes -I../../lib/includes -I/home/alimon/repos/poky/build-x86-=
64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/ext=
ra/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-=
64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../../src/gl -D_GL_NO=
_LARGE_FILES -DNO_LIBCURL -O2 -pipe -g -feliminate-unused-debug-types -c /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/doc/examples/ex-pkcs11-list.c  -fPIC -DPIC -o =
.libs/ex-pkcs11-list.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/doc/examples -I../.. -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/includes -I../../lib/includes -I/home/alimon/repos/poky/build-x86-=
64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/ext=
ra/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-=
64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../../src/gl -D_GL_NO=
_LARGE_FILES -DNO_LIBCURL -O2 -pipe -g -feliminate-unused-debug-types -c /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/doc/examples/verify.c  -fPIC -DPIC -o .libs/ve=
rify.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/doc/examples -I../.. -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/includes -I../../lib/includes -I/home/alimon/repos/poky/build-x86-=
64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/ext=
ra/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-=
64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../../src/gl -D_GL_NO=
_LARGE_FILES -DNO_LIBCURL -O2 -pipe -g -feliminate-unused-debug-types -c /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/doc/examples/ex-verify-ssh.c  -fPIC -DPIC -o .=
libs/ex-verify-ssh.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/doc/examples -I../.. -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/includes -I../../lib/includes -I/home/alimon/repos/poky/build-x86-=
64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/ext=
ra/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-=
64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../../src/gl -D_GL_NO=
_LARGE_FILES -DNO_LIBCURL -O2 -pipe -g -feliminate-unused-debug-types -c /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/doc/examples/ex-alert.c  -fPIC -DPIC -o .libs/=
ex-alert.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/doc/examples -I../.. -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/includes -I../../lib/includes -I/home/alimon/repos/poky/build-x86-=
64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/ext=
ra/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-=
64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../../src/gl -D_GL_NO=
_LARGE_FILES -DNO_LIBCURL -O2 -pipe -g -feliminate-unused-debug-types -c /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/doc/examples/ex-x509-info.c  -fPIC -DPIC -o .l=
ibs/ex-x509-info.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/doc/examples -I../.. -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/includes -I../../lib/includes -I/home/alimon/repos/poky/build-x86-=
64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/ext=
ra/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-=
64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../../src/gl -D_GL_NO=
_LARGE_FILES -DNO_LIBCURL -O2 -pipe -g -feliminate-unused-debug-types -c /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/doc/examples/ex-pkcs12.c  -fPIC -DPIC -o .libs=
/ex-pkcs12.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/doc/examples -I../.. -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/includes -I../../lib/includes -I/home/alimon/repos/poky/build-x86-=
64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/ext=
ra/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-=
64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../../src/gl -D_GL_NO=
_LARGE_FILES -DNO_LIBCURL -O2 -pipe -g -feliminate-unused-debug-types -c /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/doc/examples/ex-session-info.c  -fPIC -DPIC -o=
 .libs/ex-session-info.o
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/doc/examples -I../.. -I/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.=
3.14/lib/includes -I../../lib/includes -I/home/alimon/repos/poky/build-x86-=
64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/ext=
ra/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-=
64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/src/gl -I../../src/gl -D_GL_NO=
_LARGE_FILES -DNO_LIBCURL -O2 -pipe -g -feliminate-unused-debug-types -c /h=
ome/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gn=
utls/3.3.14-r0/gnutls-3.3.14/doc/examples/tcp.c  -fPIC -DPIC -o .libs/tcp.o
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o libexamples.la  ex-alert.lo ex-pkcs12.lo ex-=
session-info.lo ex-x509-info.lo ex-verify.lo tcp.lo udp.lo ex-pkcs11-list.l=
o verify.lo ex-verify-ssh.lo =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libexamples=
.a .libs/ex-alert.o .libs/ex-pkcs12.o .libs/ex-session-info.o .libs/ex-x509=
-info.o .libs/ex-verify.o .libs/tcp.o .libs/udp.o .libs/ex-pkcs11-list.o .l=
ibs/verify.o .libs/ex-verify-ssh.o=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libexamples=
.a
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libexamples.la" && =
ln -s "../libexamples.la" "libexamples.la" )
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-client-resume ex-client-resume.o libexamp=
les.la ../../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la=
   =20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-client-dtls ex-client-dtls.o libexamples.=
la ../../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la   =
=20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-cert-select ex-cert-select.o libexamples.=
la ../../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la   =
=20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-client-x509 ex-client-x509.o libexamples.=
la ../../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la   =
=20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-serv-dtls ex-serv-dtls.o libexamples.la .=
./../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la   =20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o print-ciphersuites print-ciphersuites.o libe=
xamples.la ../../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gp=
l.la   =20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-serv-x509 ex-serv-x509.o libexamples.la .=
./../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la   =20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-client-anon ex-client-anon.o libexamples.=
la ../../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la   =
=20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-serv-anon ex-serv-anon.o libexamples.la .=
./../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la   =20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-serv-pgp ex-serv-pgp.o libexamples.la ../=
../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la   =20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-client-psk ex-client-psk.o libexamples.la=
 ../../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la   =20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-serv-psk ex-serv-psk.o libexamples.la ../=
../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la   =20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-client-srp ex-client-srp.o libexamples.la=
 ../../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la   =20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-serv-srp ex-serv-srp.o libexamples.la ../=
../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la   =20
../../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   =
-O2 -pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-=
style=3Dgnu -Wl,--as-needed -o ex-ocsp-client ex-ocsp-client.o libexamples.=
la ../../lib/libgnutls.la ../../gl/libgnu.la ../../src/gl/libgnu_gpl.la   =
=20
../../x86_64-poky-linux-libtool  --tag=3DCXX   --mode=3Dlink x86_64-poky-li=
nux-g++  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64  -=
O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -no-=
install -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-cxx ex-cxx.o .=
./../lib/libgnutlsxx.la libexamples.la ../../lib/libgnutls.la ../../gl/libg=
nu.la ../../src/gl/libgnu_gpl.la   =20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-client-re=
sume ex-client-resume.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so=
 -L/usr/lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/=
qemux86-64/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a .=
./../src/gl/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-client-dt=
ls ex-client-dtls.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -L/=
usr/lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemu=
x86-64/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a ../..=
/src/gl/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-cert-sele=
ct ex-cert-select.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -L/=
usr/lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemu=
x86-64/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a ../..=
/src/gl/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-serv-dtls=
 ex-serv-dtls.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -L/usr/=
lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-=
64/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a ../../src=
/gl/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-client-x5=
09 ex-client-x509.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -L/=
usr/lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemu=
x86-64/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a ../..=
/src/gl/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-serv-x509=
 ex-serv-x509.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -L/usr/=
lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-=
64/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a ../../src=
/gl/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-serv-pgp =
ex-serv-pgp.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -L/usr/li=
b64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64=
/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a ../../src/g=
l/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o print-cipher=
suites print-ciphersuites.o  ./.libs/libexamples.a ../../lib/.libs/libgnutl=
s.so -L/usr/lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysro=
ots/qemux86-64/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu=
.a ../../src/gl/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-serv-anon=
 ex-serv-anon.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -L/usr/=
lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-=
64/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a ../../src=
/gl/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-client-an=
on ex-client-anon.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -L/=
usr/lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemu=
x86-64/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a ../..=
/src/gl/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-serv-srp =
ex-serv-srp.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -L/usr/li=
b64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64=
/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a ../../src/g=
l/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-client-sr=
p ex-client-srp.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -L/us=
r/lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux8=
6-64/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a ../../s=
rc/gl/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-serv-psk =
ex-serv-psk.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -L/usr/li=
b64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64=
/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a ../../src/g=
l/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-client-ps=
k ex-client-psk.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -L/us=
r/lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux8=
6-64/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a ../../s=
rc/gl/.libs/libgnu_gpl.a
x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o ex-ocsp-clie=
nt ex-ocsp-client.o  ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -L/=
usr/lib64 -L/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemu=
x86-64/usr/lib64 -lz -lnettle -lhogweed -lgmp ../../gl/.libs/libgnu.a ../..=
/src/gl/.libs/libgnu_gpl.a
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux//gcc/x86_64home-poky/-alimonlinux//repos4.9.2//p=
okyld/build:- x86-warning:64 -librarymultilib/ tmpsearch/ sysrootspath/x86_=
64 -"linux//usrusr/lib64" /islibexec /unsafex86_64 -forpoky -cross-linux/co=
mpilationgcc
/x86_64-poky-linux/4.9.2/ld: warning: library search path "/usr/lib64" is u=
nsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
x86_64-poky-linux-libtool: link: x86_64-poky-linux-g++ -m64 -march=3Dcore2 =
-mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/poky/bu=
ild-x86-64-multilib/tmp/sysroots/qemux86-64 -O2 -pipe -g -feliminate-unused=
-debug-types -fvisibility-inlines-hidden -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl=
,--as-needed -o ex-cxx ex-cxx.o  ../../lib/.libs/libgnutlsxx.so -L/usr/lib6=
4 /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linu=
x/gnutls/3.3.14-r0/build/lib/.libs/libgnutls.so -L/home/alimon/repos/poky/b=
uild-x86-64-multilib/tmp/sysroots/qemux86-64/usr/lib64 /home/alimon/repos/p=
oky/build-x86-64-multilib/tmp/sysroots/qemux86-64/usr/lib64/libstdc++.so -l=
m ./.libs/libexamples.a ../../lib/.libs/libgnutls.so -lz -lnettle -lhogweed=
 -lgmp ../../gl/.libs/libgnu.a ../../src/gl/.libs/libgnu_gpl.a
/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/x86_64-linux/usr=
/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/4.9.2/ld: warning: library=
 search path "/usr/lib64" is unsafe for cross-compilation
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/examples'
Making all in cyclo
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/cyclo'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/cyclo'
Making all in scripts
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/scripts'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/scripts'
Making all in manpages
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/manpages'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/manpages'
Making all in credentials
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/credentials'
Making all in openpgp
make[5]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/credentials/openpgp=
'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/credentials/openpgp'
Making all in srp
make[5]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/credentials/srp'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/credentials/srp'
Making all in x509
make[5]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/credentials/x509'
make[5]: Nothing to be done for `all'.
make[5]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/credentials/x509'
make[5]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/credentials'
make[5]: Nothing to be done for `all-am'.
make[5]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/credentials'
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/credentials'
Making all in latex
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/latex'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc/latex'
make[4]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc'
make[4]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc'
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc'
make[2]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/doc'
Making all in tests
make[2]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests'
Making all in .
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests'
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dcompile x86_64-poky-lin=
ux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=
=3D/home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64 -D=
HAVE_CONFIG_H -I. -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/tests -I..  -I/home/alim=
on/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3=
.14-r0/gnutls-3.3.14/gl -I../gl -I/home/alimon/repos/poky/build-x86-64-mult=
ilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includ=
es -I../lib/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/wo=
rk/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/libdane/includes -I..=
/libdane/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/=
core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/extra/includes -I../extr=
a/includes -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-6=
4-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib -I/home/alimon/repos/poky/b=
uild-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3=
.3.14/doc/examples -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/tests/../lib/minitasn1 =
   -O2 -pipe -g -feliminate-unused-debug-types -c -o utils.lo /home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/tests/utils.c
x86_64-poky-linux-libtool: compile:  x86_64-poky-linux-gcc -m64 -march=3Dco=
re2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/alimon/repos/pok=
y/build-x86-64-multilib/tmp/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/tests -I.. -I/home/alimon/repos/poky/build-x86-64=
-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/gl -I=
../gl -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-pok=
y-linux/gnutls/3.3.14-r0/gnutls-3.3.14/lib/includes -I../lib/includes -I/ho=
me/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnu=
tls/3.3.14-r0/gnutls-3.3.14/libdane/includes -I../libdane/includes -I/home/=
alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls=
/3.3.14-r0/gnutls-3.3.14/extra/includes -I../extra/includes -I/home/alimon/=
repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14=
-r0/gnutls-3.3.14/lib -I/home/alimon/repos/poky/build-x86-64-multilib/tmp/w=
ork/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/doc/examples -I/home=
/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutl=
s/3.3.14-r0/gnutls-3.3.14/tests/../lib/minitasn1 -O2 -pipe -g -feliminate-u=
nused-debug-types -c /home/alimon/repos/poky/build-x86-64-multilib/tmp/work=
/core2-64-poky-linux/gnutls/3.3.14-r0/gnutls-3.3.14/tests/utils.c  -fPIC -D=
PIC -o .libs/utils.o
../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-poky-linux-=
gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/=
home/alimon/repos/poky/build-x86-64-multilib/tmp/sysroots/qemux86-64   -O2 =
-pipe -g -feliminate-unused-debug-types -no-install -Wl,-O1 -Wl,--hash-styl=
e=3Dgnu -Wl,--as-needed -o libutils.la  utils.lo ../gl/libgnu.la=20
x86_64-poky-linux-libtool: link: (cd .libs/libutils.lax/libgnu.a && x86_64-=
poky-linux-ar x "/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/cor=
e2-64-poky-linux/gnutls/3.3.14-r0/build/tests/../gl/.libs/libgnu.a")
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ar cru .libs/libutils.a =
.libs/utils.o   .libs/libutils.lax/libgnu.a/asnprintf.o .libs/libutils.lax/=
libgnu.a/base64.o .libs/libutils.lax/libgnu.a/c-ctype.o .libs/libutils.lax/=
libgnu.a/hash-pjw-bare.o .libs/libutils.lax/libgnu.a/memchr.o .libs/libutil=
s.lax/libgnu.a/printf-args.o .libs/libutils.lax/libgnu.a/printf-parse.o .li=
bs/libutils.lax/libgnu.a/read-file.o .libs/libutils.lax/libgnu.a/sys_socket=
.o .libs/libutils.lax/libgnu.a/u64.o .libs/libutils.lax/libgnu.a/unistd.o .=
libs/libutils.lax/libgnu.a/vasnprintf.o .libs/libutils.lax/libgnu.a/xsize.o=
=20
x86_64-poky-linux-libtool: link: x86_64-poky-linux-ranlib .libs/libutils.a
x86_64-poky-linux-libtool: link: rm -fr .libs/libutils.lax
x86_64-poky-linux-libtool: link: ( cd ".libs" && rm -f "libutils.la" && ln =
-s "../libutils.la" "libutils.la" )
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests'
Making all in rsa-md5-collision
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/rsa-md5-collision=
'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/rsa-md5-collision'
Making all in pkcs1-padding
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/pkcs1-padding'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/pkcs1-padding'
Making all in pkcs8-decode
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/pkcs8-decode'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/pkcs8-decode'
Making all in pkcs12-decode
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/pkcs12-decode'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/pkcs12-decode'
Making all in userid
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/userid'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/userid'
Making all in cert-tests
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/cert-tests'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/cert-tests'
Making all in key-tests
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/key-tests'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/key-tests'
Making all in sha2
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/sha2'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/sha2'
Making all in safe-renegotiation
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/safe-renegotiatio=
n'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/safe-renegotiation=
'
Making all in dsa
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/dsa'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/dsa'
Making all in scripts
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/scripts'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/scripts'
Making all in ecdsa
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/ecdsa'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/ecdsa'
Making all in slow
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/slow'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/slow'
Making all in dtls
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/dtls'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/dtls'
Making all in srp
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/srp'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/srp'
Making all in openpgp-certs
make[3]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/openpgp-certs'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests/openpgp-certs'
make[2]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build/tests'
make[2]: Entering directory `/home/alimon/repos/poky/build-x86-64-multilib/=
tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build'
make[2]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build'
make[1]: Leaving directory `/home/alimon/repos/poky/build-x86-64-multilib/t=
mp/work/core2-64-poky-linux/gnutls/3.3.14-r0/build'
DEBUG: Shell function do_compile finished

--------------030209080506070506030108
Content-Type: text/plain; charset=UTF-8;
 name="log.do_package_qa.25738"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="log.do_package_qa.25738"

DEBUG: Executing python function sstate_task_prefunc
DEBUG: Python function sstate_task_prefunc finished
DEBUG: Executing python function do_package_qa
NOTE: DO PACKAGE QA
DEBUG: Executing python function read_subpackage_metadata
DEBUG: Python function read_subpackage_metadata finished
ERROR: QA Issue: gnutls: The compile log indicates that host include and/or library paths were used.
         Please check the log '/home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/temp/log.do_compile' for more information. [compile-host-path]
NOTE: Checking Package: gnutls-openssl
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-openssl/usr/lib64/libgnutls-openssl.so.27.0.2
NOTE: Checking Package: gnutls-xx
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-xx/usr/lib64/libgnutlsxx.so.28.1.0
NOTE: Checking Package: gnutls-dbg
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-dbg/usr/bin/.debug/gnutls-serv
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-dbg/usr/bin/.debug/srptool
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-dbg/usr/bin/.debug/psktool
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-dbg/usr/bin/.debug/certtool
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-dbg/usr/bin/.debug/gnutls-cli-debug
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-dbg/usr/bin/.debug/ocsptool
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-dbg/usr/bin/.debug/gnutls-cli
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-dbg/usr/lib64/.debug/libgnutls.so.28.41.6
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-dbg/usr/lib64/.debug/libgnutlsxx.so.28.1.0
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-dbg/usr/lib64/.debug/libgnutls-openssl.so.27.0.2
NOTE: Checking Package: gnutls-staticdev
NOTE: Checking Package: gnutls-dev
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-dev/usr/bin/gnutls-cli-debug
NOTE: Checking Package: gnutls-doc
NOTE: Checking Package: gnutls-bin
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-bin/usr/bin/psktool
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-bin/usr/bin/certtool
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-bin/usr/bin/srptool
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-bin/usr/bin/ocsptool
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-bin/usr/bin/gnutls-serv
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls-bin/usr/bin/gnutls-cli
NOTE: Checking Package: gnutls
NOTE: x86_64-poky-linux-objdump -p /home/alimon/repos/poky/build-x86-64-multilib/tmp/work/core2-64-poky-linux/gnutls/3.3.14-r0/packages-split/gnutls/usr/lib64/libgnutls.so.28.41.6
NOTE: Checking Package: gnutls-locale-cs
NOTE: Checking Package: gnutls-locale-de
NOTE: Checking Package: gnutls-locale-en+boldquot
NOTE: Checking Package: gnutls-locale-en+quot
NOTE: Checking Package: gnutls-locale-eo
NOTE: Checking Package: gnutls-locale-fi
NOTE: Checking Package: gnutls-locale-fr
NOTE: Checking Package: gnutls-locale-it
NOTE: Checking Package: gnutls-locale-ms
NOTE: Checking Package: gnutls-locale-nl
NOTE: Checking Package: gnutls-locale-pl
NOTE: Checking Package: gnutls-locale-sv
NOTE: Checking Package: gnutls-locale-uk
NOTE: Checking Package: gnutls-locale-vi
NOTE: Checking Package: gnutls-locale-zh-cn
ERROR: QA run found fatal errors. Please consider fixing them.
DEBUG: Python function do_package_qa finished
ERROR: Function failed: do_package_qa

--------------030209080506070506030108--
