Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5290660102
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 01:21:24 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id n14so2715043pfh.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 18:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=73vK+TNkpzSzkehGuQ5ZilX00BqV9RMHvdckLEz8Aao=;
	b=rSryhbC0J/CUWCQYTyWLPxtnHe+Ae36UCoY8dHnZ7Ic4fsXw5HGFAkwMnqyV9/Dkbb
	Ii+yDCjub4bQsvXQROYTEJs2csfDMQOl6UHksEMEF+WYxgu/e67fQu8qlZ/NQUdU623F
	iDCq3kpgzOYiyvH5UnTnIB+cB+So1ddSRK45GQ/b9EDGkcghSDa8bMkJtQlw1FLLRpcX
	sFDBFbLqN6kP5jlloEDcuqHHxTW7xWMyla05leSPlIIE3PUTeR1GwGt3+Q6Kh8DOWXRj
	PpJmTKUcF6f3z1DFZwZgvph9Kpz/WKY2qvoJn3wXyhr5DDqCYlKC76aAxg0i3zabGtRX
	odnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=73vK+TNkpzSzkehGuQ5ZilX00BqV9RMHvdckLEz8Aao=;
	b=FDVcG2gfu4PEh3zBarV3MVtKvWRrRJFjXOxZFuwv5lUjsTnLUVNyoZiL+VL3vKh0VG
	+CS2hlrgPH4Vx9PJ/q/sAV0mWkBcYqLYuWEl2UU3XTBseZSFl5W0D5mxHMXBRZP5Ltje
	6rhRBouXsIp14K0x5jPQE1FdOvL0M3K6iWspsEWi0/rq+lnhQTISwKQooXqmEFhdG9kk
	BNxKx1qV+6IXfhqZQXg8dK6RRE8KAncbYVKphPoI/XhEuEngWaXkUWFHHdhHZISjbWyc
	52e3xKJE7Bzs0j66MSuCPKisfplFOxM3+uwgDwlPw9/SLXtF4qIe9y4MyiV4vZBqitqs
	880A==
X-Gm-Message-State: AMCzsaWCcVp7FYyRfQ7uzqN/hzye9TGPNhIfoQ5TWa1oqm1k0SbdRQtb
	2jQfrEg9XqKc823vE7CJbTZYT6X/xt3d8TrwlFQ=
X-Google-Smtp-Source: AOwi7QCOsRPVvHlLtXmgPYHhgAaP78DM1HRQ/ouq8IpXIcYi/1wsrpWvEEHRpQrvS2933SyOuZCzW/mJjfUjDRkhVkU=
X-Received: by 10.84.177.129 with SMTP id x1mr716653plb.161.1507771285465;
	Wed, 11 Oct 2017 18:21:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Wed, 11 Oct 2017 18:20:54 -0700 (PDT)
In-Reply-To: <20171012010909.GH9221@denix.org>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
	<cf33ac88e28b8e91f25d750de9a1385808d5e1f7.1507735448.git.alexander.kanavin@linux.intel.com>
	<20171012010909.GH9221@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Oct 2017 18:20:54 -0700
Message-ID: <CAMKF1sod4hD68FsK8VqGRk7LGhzb55EEbRjijcePvaP2oXkxVg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/50] oprofile: remove the recipe
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
X-List-Received-Date: Thu, 12 Oct 2017 01:21:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2017 at 6:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Oct 11, 2017 at 06:33:53PM +0300, Alexander Kanavin wrote:
>> Perf is the preferred solution, and oprofile is difficult to
>> maintain against musl.
>
> Can we consider moving it to meta-openembedded and maybe relaxing
> requirements, such as musl compatibility?

I think, if someone maintains it there, it should be fine. Since perf
offers same
functionality and supports more machines and maintained better. We
probably can maintain it in OE-Core.

>
>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>  meta/conf/distro/include/distro_alias.inc          |   1 -
>>  meta/conf/layer.conf                               |   1 -
>>  meta/recipes-kernel/oprofile/oprofile.inc          |  65 ---
>>  ...Add-rmb-definition-for-NIOS2-architecture.patch |  30 --
>>  .../0001-Fix-FTBFS-problem-with-GCC-6.patch        |  51 --
>>  meta/recipes-kernel/oprofile/oprofile/acinclude.m4 | 581 --------------=
-------
>>  .../oprofile/oprofile/automake-foreign.patch       |  12 -
>>  meta/recipes-kernel/oprofile/oprofile/musl.patch   |  46 --
>>  .../oprofile/oprofile-cross-compile-tests.patch    |  98 ----
>>  .../oprofile/oprofile/root-home-dir.patch          |  44 --
>>  meta/recipes-kernel/oprofile/oprofile/run-ptest    |  19 -
>>  meta/recipes-kernel/oprofile/oprofile_1.1.0.bb     |  10 -
>>  12 files changed, 958 deletions(-)
>>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile.inc
>>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-d=
efinition-for-NIOS2-architecture.patch
>>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS=
-problem-with-GCC-6.patch
>>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/acinclude.m4
>>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/automake-forei=
gn.patch
>>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/musl.patch
>>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-cross=
-compile-tests.patch
>>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/root-home-dir.=
patch
>>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile/run-ptest
>>  delete mode 100644 meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
>>
>> diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distr=
o/include/distro_alias.inc
>> index f7c8b4a6bda..3b0411c3547 100644
>> --- a/meta/conf/distro/include/distro_alias.inc
>> +++ b/meta/conf/distro/include/distro_alias.inc
>> @@ -278,7 +278,6 @@ DISTRO_PN_ALIAS_pn-opkg-collateral =3D "OE-Core"
>>  DISTRO_PN_ALIAS_pn-opkg-keyrings =3D "OSPDT upstream=3Dgit://git.yoctop=
roject.org/opkg-utils"
>>  DISTRO_PN_ALIAS_pn-opkg-nogpg =3D "OSPDT upstream=3Dgit://git.yoctoproj=
ect.org/opkg-utils"
>>  DISTRO_PN_ALIAS_pn-opkg-utils =3D "OSPDT upstream=3Dgit://git.yoctoproj=
ect.org/opkg-utils"
>> -DISTRO_PN_ALIAS_pn-oprofile =3D "Debian=3Doprofile Fedora=3Doprofile"
>>  DISTRO_PN_ALIAS_pn-os-release =3D "OE-Core"
>>  DISTRO_PN_ALIAS_pn-packagegroup-base =3D "OE-Core"
>>  DISTRO_PN_ALIAS_pn-packagegroup-core =3D "OE-Core"
>> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>> index 6be2a57a70a..034232474fe 100644
>> --- a/meta/conf/layer.conf
>> +++ b/meta/conf/layer.conf
>> @@ -63,7 +63,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
>>    font-alias->font-util \
>>    weston-init->weston \
>>    weston-init->kbd \
>> -  oprofile->virtual/kernel \
>>  "
>>
>>  # We need to keep bitbake tools in PATH
>> diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-ke=
rnel/oprofile/oprofile.inc
>> deleted file mode 100644
>> index 4b01654fa3e..00000000000
>> --- a/meta/recipes-kernel/oprofile/oprofile.inc
>> +++ /dev/null
>> @@ -1,65 +0,0 @@
>> -SUMMARY =3D "System-Wide Profiler"
>> -DESCRIPTION =3D "OProfile is a system-wide profiler for Linux systems, =
capable \
>> -of profiling all running code at low overhead."
>> -HOMEPAGE =3D "http://oprofile.sourceforge.net/news/"
>> -BUGTRACKER =3D "http://sourceforge.net/tracker/?group_id=3D16191&atid=
=3D116191"
>> -
>> -LICENSE =3D "LGPLv2.1+ & GPLv2"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079ba=
e19f \
>> -                    file://libopagent/opagent.h;beginline=3D5;endline=
=3D26;md5=3D4f16f72c7a493d8a4704aa18d03d15c6 \
>> -                   "
>> -SECTION =3D "devel"
>> -
>> -DEPENDS =3D "popt binutils"
>> -RDEPENDS_${PN} =3D "binutils-symlinks"
>> -RRECOMMENDS_${PN} =3D "kernel-vmlinux"
>> -
>> -FILES_${PN} =3D "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${=
BPN}"
>> -FILES_${PN}-dev +=3D "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN=
}/lib*.la"
>> -FILES_${PN}-staticdev +=3D "${libdir}/${BPN}/lib*.a"
>> -
>> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
>> -           file://acinclude.m4 \
>> -           file://automake-foreign.patch \
>> -           file://oprofile-cross-compile-tests.patch \
>> -           file://run-ptest \
>> -           file://root-home-dir.patch \
>> -           file://0001-Add-rmb-definition-for-NIOS2-architecture.patch =
\
>> -           file://0001-Fix-FTBFS-problem-with-GCC-6.patch \
>> -"
>> -UPSTREAM_CHECK_REGEX =3D "oprofile-(?P<pver>\d+(\.\d+)+)/"
>> -UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/oprofile/files=
/oprofile/"
>> -
>> -SRC_URI_append_libc-musl =3D " file://musl.patch"
>> -
>> -inherit autotools pkgconfig ptest
>> -
>> -EXTRA_OECONF =3D "--with-kernel=3D${STAGING_DIR_HOST}${prefix} --withou=
t-x ac_cv_prog_XSLTPROC=3D"
>> -do_configure () {
>> -     cp ${WORKDIR}/acinclude.m4 ${S}/
>> -     autotools_do_configure
>> -}
>> -
>> -EXTRA_OEMAKE =3D "SRCDIR=3D${PTEST_PATH}/libutil++/tests"
>> -do_compile_ptest() {
>> -     oe_runmake check
>> -}
>> -
>> -do_install_ptest() {
>> -     subdirs=3D"libdb/tests libutil++/tests libregex/tests libutil/test=
s libop/tests libdb/tests "
>> -     for tooltest in ${subdirs}
>> -     do
>> -             find ${tooltest} -perm /u=3Dx -type f| cpio -pvdu ${D}${PT=
EST_PATH}
>> -     done
>> -
>> -     # needed by some libop tests
>> -     cp -r events ${D}${PTEST_PATH}
>> -
>> -     # needed by libregex regex_test
>> -     cp libregex/stl.pat ${D}${PTEST_PATH}/libregex
>> -     cp libregex/tests/mangled-name ${D}${PTEST_PATH}/libregex/tests
>> -
>> -     # needed by litutil++ file_manip_tests
>> -     cp ${S}/libutil++/tests/file_manip_tests.cpp \
>> -             libutil++/tests/file_manip_tests.o ${D}${PTEST_PATH}/libut=
il++/tests
>> -}
>> diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definiti=
on-for-NIOS2-architecture.patch b/meta/recipes-kernel/oprofile/oprofile/000=
1-Add-rmb-definition-for-NIOS2-architecture.patch
>> deleted file mode 100644
>> index ae8562a231a..00000000000
>> --- a/meta/recipes-kernel/oprofile/oprofile/0001-Add-rmb-definition-for-=
NIOS2-architecture.patch
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -From 34b0d9b1a32fb404a30327a7ae8931c7c75583bf Mon Sep 17 00:00:00 2001
>> -From: Marek Vasut <marex@denx.de>
>> -Date: Tue, 9 Feb 2016 02:00:29 +0100
>> -Subject: [PATCH] Add rmb() definition for NIOS2 architecture
>> -
>> -Signed-off-by: Marek Vasut <marex@denx.de>
>> -Upstream-Status: Submitted [ http://marc.info/?l=3Doprofile-list&m=3D14=
5501915931874&w=3D2 ]
>> ----
>> - libperf_events/operf_utils.h | 5 +++++
>> - 1 file changed, 5 insertions(+)
>> -
>> -diff --git a/libperf_events/operf_utils.h b/libperf_events/operf_utils.=
h
>> -index 32954cc..8270e53 100644
>> ---- a/libperf_events/operf_utils.h
>> -+++ b/libperf_events/operf_utils.h
>> -@@ -178,6 +178,11 @@ void op_release_resources(void);
>> - #define cpu_relax() asm volatile("" ::: "memory")
>> - #endif
>> -
>> -+#ifdef __nios2__
>> -+#define rmb()               asm volatile("" ::: "memory")
>> -+#define cpu_relax() asm volatile("" ::: "memory")
>> -+#endif
>> -+
>> - #ifdef __tile__
>> - #include <asm/unistd.h>
>> - #define rmb()               __insn_mf()
>> ---
>> -2.7.0
>> -
>> diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-proble=
m-with-GCC-6.patch b/meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-p=
roblem-with-GCC-6.patch
>> deleted file mode 100644
>> index d372fd527ba..00000000000
>> --- a/meta/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-=
GCC-6.patch
>> +++ /dev/null
>> @@ -1,51 +0,0 @@
>> -From 39d4d46a0bd504ac708ffe72df87bf74cd12ad30 Mon Sep 17 00:00:00 2001
>> -From: William Cohen <wcohen@redhat.com>
>> -Date: Fri, 5 Feb 2016 17:30:19 -0500
>> -Subject: [PATCH] Fix FTBFS problem with GCC-6
>> -
>> -GCC-6 is pickier about some of the type conversions causing the Fedora
>> -24 mass rebuild the build of oprofile failed with:
>> -
>> -make[3]: Entering directory '/builddir/build/BUILD/oprofile-1.1.0/libut=
il++'
>> -g++ -DHAVE_CONFIG_H -I. -I..  -I ../libutil -I ../libop -I ../libpp   -=
W -Wall -fno-common -ftemplate-depth-50 -O2 -g -pipe -Wall -Werror=3Dformat=
-security -Wp,-D_FORTIFY_SOURCE=3D2 -fexceptions -fstack-protector-strong -=
-param=3Dssp-buffer-size=3D4 -grecord-gcc-switches -specs=3D/usr/lib/rpm/re=
dhat/redhat-hardened-cc1 -m32 -march=3Di686 -mtune=3Datom -fasynchronous-un=
wind-tables -c -o op_bfd.o op_bfd.cpp
>> -op_bfd.cpp: In member function 'void op_bfd::get_symbol_range(symbol_in=
dex_t, long long unsigned int&, long long unsigned int&) const':
>> -op_bfd.cpp:538:47: error: cannot convert 'std::ostream {aka std::basic_=
ostream<char>}' to 'const bool' in initialization
>> -  bool const verbose =3D cverb << (vbfd & vlevel1);
>> -                                               ^
>> -op_bfd.cpp:546:7: error: in argument to unary !
>> -  if (!verbose)
>> -       ^~~~~~~
>> -
>> -Avoid the intermediate bool type to make GCC-6 happy.
>> -
>> -Signed-off-by: William Cohen <wcohen@redhat.com>
>> ----
>> -Upstream-Status: Backport
>> -
>> - libutil++/op_bfd.cpp | 4 +---
>> - 1 file changed, 1 insertion(+), 3 deletions(-)
>> -
>> -diff --git a/libutil++/op_bfd.cpp b/libutil++/op_bfd.cpp
>> -index 389c920..f2eb42b 100644
>> ---- a/libutil++/op_bfd.cpp
>> -+++ b/libutil++/op_bfd.cpp
>> -@@ -535,15 +535,13 @@ void op_bfd::get_symbol_range(symbol_index_t sym_=
idx,
>> - {
>> -     op_bfd_symbol const & sym =3D syms[sym_idx];
>> -
>> --    bool const verbose =3D cverb << (vbfd & vlevel1);
>> --
>> -     if (anon_obj)
>> -             start =3D sym.vma();
>> -     else
>> -             start =3D sym.filepos();
>> -     end =3D start + sym.size();
>> -
>> --    if (!verbose)
>> -+    if (!(cverb << (vbfd & vlevel1)))
>> -             return;
>> -
>> -     io_state state(cverb << (vbfd & vlevel1));
>> ---
>> -1.9.1
>> -
>> diff --git a/meta/recipes-kernel/oprofile/oprofile/acinclude.m4 b/meta/r=
ecipes-kernel/oprofile/oprofile/acinclude.m4
>> deleted file mode 100644
>> index 95ecd91b5e2..00000000000
>> --- a/meta/recipes-kernel/oprofile/oprofile/acinclude.m4
>> +++ /dev/null
>> @@ -1,581 +0,0 @@
>> -dnl AX_KERNEL_OPTION(option, action-if-found, action-if-not-found)
>> -dnl see if autoconf.h defines the option
>> -AC_DEFUN([AX_KERNEL_OPTION], [
>> -SAVE_CFLAGS=3D$CFLAGS
>> -CFLAGS=3D"-I$KINC -O2 -D__KERNEL__"
>> -AC_TRY_COMPILE( [#include <linux/config.h>],
>> -[
>> -#ifndef $1
>> -break_me_hard(\\\);
>> -#endif
>> -],[$2],[$3],)
>> -CFLAGS=3D$SAVE_CFLAGS
>> -])
>> -
>> -dnl Handle the 2.4 module inside module/
>> -AC_DEFUN([AX_CONFIG_MODULE],
>> -[
>> -if test ! -f $KINC/linux/autoconf.h; then
>> -     AC_MSG_ERROR([no suitably configured kernel include tree found])
>> -fi
>> -
>> -dnl  --- Get Linux kernel version and compile parameters ---
>> -
>> -AC_SUBST(KVERS)
>> -AC_MSG_CHECKING([for kernel version])
>> -dnl it's like this to handle mandrake's fubar version.h - bug #471448
>> -eval KVERS=3D`gcc -I$KINC -E -dM $KINC/linux/version.h | grep -w UTS_RE=
LEASE | awk '{print $[]3}'`
>> -AC_MSG_RESULT([$KVERS])
>> -case "$KVERS" in
>> -2.2.*|2.4.*) ;;
>> -*) AC_MSG_ERROR([Unsupported kernel version])
>> -esac
>> -
>> -dnl Check for the minimal kernel version supported
>> -AC_MSG_CHECKING([kernel version])
>> -AX_KERNEL_VERSION(2, 2, 10, <=3D, AC_MSG_RESULT([ok]), AC_MSG_ERROR([ch=
eck html documentation install section]))
>> -
>> -dnl linux/spinlock.h added at some point in past
>> -AC_MSG_CHECKING([for $KINC/linux/spinlock.h])
>> -if test -f $KINC/linux/spinlock.h; then
>> -     EXTRA_CFLAGS_MODULE=3D"$EXTRA_CFLAGS_MODULE -DHAVE_LINUX_SPINLOCK_=
HEADER"
>> -     AC_MSG_RESULT([yes])
>> -else
>> -     AC_MSG_RESULT([no])
>> -fi
>> -
>> -AC_MSG_CHECKING([for rtc_lock])
>> -gcc -I$KINC -E $KINC/linux/mc146818rtc.h | grep rtc_lock >/dev/null
>> -if test "$?" -eq 0; then
>> -     EXTRA_CFLAGS_MODULE=3D"$EXTRA_CFLAGS_MODULE -DRTC_LOCK"
>> -     AC_MSG_RESULT([yes])
>> -else
>> -     AC_MSG_RESULT([no])
>> -fi
>> -
>> -arch=3D"unknown"
>> -AC_MSG_CHECKING(for x86-64 architecture)
>> -AX_KERNEL_OPTION(CONFIG_X86_64, x8664=3D1, x8664=3D0)
>> -AX_MSG_RESULT_YN($x8664)
>> -BUILD_HAMMER=3Dno
>> -if test "$x8664" -eq 1; then
>> -     arch=3D"x86"
>> -     BUILD_HAMMER=3Dyes
>> -else
>> -     AC_MSG_CHECKING(for x86 architecture)
>> -     AX_KERNEL_OPTION(CONFIG_X86, x86=3D1, x86=3D0)
>> -     AX_KERNEL_OPTION(CONFIG_X86_WP_WORKS_OK, x86=3D1, x86=3D$x86)
>> -     AX_MSG_RESULT_YN($x86)
>> -     test "$x86" =3D 1 && arch=3D"x86"
>> -
>> -     if test "$arch" =3D "unknown"; then
>> -             AC_MSG_CHECKING(for ia64 architecture)
>> -             AX_KERNEL_OPTION(CONFIG_IA64, ia64=3D1, ia64=3D0)
>> -             AX_MSG_RESULT_YN($ia64)
>> -             test "$ia64" =3D 1 && arch=3D"ia64"
>> -     fi
>> -
>> -fi
>> -AC_SUBST(BUILD_HAMMER)
>> -
>> -test "$arch" =3D "unknown" && AC_MSG_ERROR(Unsupported architecture)
>> -
>> -dnl check to see if kernel verion appropriate for arch
>> -AC_MSG_CHECKING(arch/kernel version combination)
>> -case "$arch" in
>> -ia64)
>> -     AX_KERNEL_VERSION(2, 4, 18, <, AC_MSG_RESULT([ok]),
>> -             AC_MSG_ERROR([unsupported arch/kernel])) ;;
>> -*) AC_MSG_RESULT([ok])
>> -esac
>> -
>> -dnl for now we do not support PREEMPT patch
>> -AC_MSG_CHECKING([for preempt patch])
>> -AX_KERNEL_OPTION(CONFIG_PREEMPT,preempt=3D1,preempt=3D0)
>> -AX_MSG_RESULT_YN([$preempt])
>> -test "$preempt" =3D 0 || AC_MSG_ERROR([unsupported kernel configuration=
 : CONFIG_PREEMPT])
>> -
>> -AC_SUBST(KINC)
>> -
>> -MODINSTALLDIR=3D/lib/modules/$KVERS
>> -
>> -OPROFILE_MODULE_ARCH=3D$arch
>> -AC_SUBST(OPROFILE_MODULE_ARCH)
>> -]
>> -)
>> -
>> -dnl AX_MSG_RESULT_YN(a)
>> -dnl results "yes" iff a=3D=3D1, "no" else
>> -AC_DEFUN([AX_MSG_RESULT_YN], [x=3Dno
>> -test "x$1" =3D "x1" && x=3Dyes
>> -AC_MSG_RESULT($x)])
>> -
>> -dnl AX_MALLOC_ATTRIBUTE - see if gcc will take __attribute__((malloc))
>> -AC_DEFUN([AX_MALLOC_ATTRIBUTE],
>> -[
>> -AC_MSG_CHECKING([whether malloc attribute is understood])
>> -SAVE_CFLAGS=3D$CFLAGS
>> -CFLAGS=3D"-Werror $CFLAGS"
>> -AC_TRY_COMPILE(,[
>> -void monkey() __attribute__((malloc));
>> -],AC_MSG_RESULT([yes]); AC_DEFINE(MALLOC_ATTRIBUTE_OK, 1, [whether mall=
oc attribute is understood]), AC_MSG_RESULT([no]))
>> -CFLAGS=3D$SAVE_CFLAGS
>> -]
>> -)
>> -
>> -dnl builtin_expect is used in module we can't add that in config.h
>> -AC_DEFUN([AX_BUILTIN_EXPECT],
>> -[
>> -AC_MSG_CHECKING([whether __builtin_expect is understood])
>> -SAVE_CFLAGS=3D$CFLAGS
>> -CFLAGS=3D"-Werror $CFLAGS"
>> -AC_TRY_LINK(,[
>> -int i;
>> -if (__builtin_expect(i, 0)) { }
>> -],
>> -AC_MSG_RESULT([yes]); EXTRA_CFLAGS_MODULE=3D"$EXTRA_CFLAGS_MODULE -DEXP=
ECT_OK",
>> -AC_MSG_RESULT([no]);)
>> -CFLAGS=3D$SAVE_CFLAGS
>> -]
>> -)
>> -
>> -dnl AX_EXTRA_DIRS - Let user specify extra dirs for include/libs
>> -AC_DEFUN([AX_EXTRA_DIRS],
>> -[
>> -AC_ARG_WITH(extra-includes,
>> -[  --with-extra-includes=3DDIR    add extra include paths],
>> -  use_extra_includes=3D"$withval",
>> -  use_extra_includes=3DNO
>> -)
>> -if test -n "$use_extra_includes" && \
>> -        test "$use_extra_includes" !=3D "NO"; then
>> -  ac_save_ifs=3D$IFS
>> -  IFS=3D':'
>> -  for dir in $use_extra_includes; do
>> -    extra_includes=3D"$extra_includes -I$dir"
>> -  done
>> -  IFS=3D$ac_save_ifs
>> -  CPPFLAGS=3D"$CPPFLAGS $extra_includes"
>> -fi
>> -
>> -AC_ARG_WITH(extra-libs,
>> -[  --with-extra-libs=3DDIR        add extra library paths],
>> -  use_extra_libs=3D$withval,
>> -  use_extra_libs=3DNO
>> -)
>> -if test -n "$use_extra_libs" && \
>> -        test "$use_extra_libs" !=3D "NO"; then
>> -   ac_save_ifs=3D$IFS
>> -   IFS=3D':'
>> -   for dir in $use_extra_libs; do
>> -     extra_libraries=3D"$extra_libraries -L$dir"
>> -   done
>> -   IFS=3D$ac_save_ifs
>> -   LDFLAGS=3D"$LDFLAGS $extra_libraries"
>> -fi
>> -]
>> -)
>> -
>> -dnl AX_POPT_CONST - check popt prototype
>> -AC_DEFUN([AX_POPT_CONST],
>> -[
>> -AC_MSG_CHECKING([popt prototype])
>> -SAVE_CXXFLAGS=3D$CXXFLAGS
>> -CXXFLAGS=3D"-Werror $CXXFLAGS"
>> -AC_TRY_COMPILE([#include <popt.h>],
>> -[
>> -int c; char **v;
>> -poptGetContext(0, c, v, 0, 0);
>> -],
>> -AC_MSG_RESULT([takes char **]);,
>> -AC_MSG_RESULT([takes const char **]); AC_DEFINE(CONST_POPT, 1, [whether=
 popt prototype takes a const char **]))
>> -CXXFLAGS=3D"$SAVE_CXXFLAGS"
>> -]
>> -)
>> -
>> -dnl AX_CHECK_SSTREAM - check if local sstream is needed to compile OK
>> -AC_DEFUN([AX_CHECK_SSTREAM],
>> -[
>> -AC_MSG_CHECKING([whether to use included sstream])
>> -AC_TRY_COMPILE([#include <sstream>], [],
>> -AC_MSG_RESULT([no]);,
>> -AC_MSG_RESULT([yes]); OP_CXXFLAGS=3D"$OP_CXXFLAGS -I\${top_srcdir}/incl=
ude")
>> -]
>> -)
>> -
>> -dnl AX_CHECK_TYPEDEF(typedef_name, type, action-if-true, action-if-fals=
e)
>> -dnl exec action-if-true if typedef_name is a typedef to type else exec
>> -dnl action-if-false
>> -dnl currently work only with type typedef'ed in stddef.h
>> -AC_DEFUN([AX_CHECK_TYPEDEF], [
>> -dnl AC_LANG_PUSH(C) not in autoconf 2.13
>> -AC_LANG_SAVE
>> -AC_LANG_C
>> -SAVE_CFLAGS=3D$CFLAGS
>> -CFLAGS=3D"-Werror $CFLAGS"
>> -
>> -AC_TRY_COMPILE(
>> -  [
>> -  #include <stddef.h>
>> -  ],
>> -  [
>> -  typedef void (*fct1)($1);
>> -  typedef void (*fct2)($2);
>> -  fct1 f1 =3D 0;
>> -  fct2 f2 =3D 0;
>> -  if (f1 =3D=3D f2) {}
>> -  ],
>> -[$3],[$4])
>> -
>> -CFLAGS=3D$SAVE_CFLAGS
>> -AC_LANG_RESTORE
>> -])
>> -
>> -
>> -dnl AX_TYPEDEFED_NAME(typedef_name, candidate_list, var_name)
>> -dnl set var_name to the typedef name of $1 which must be in canditate_l=
ist
>> -dnl else produce a fatal error
>> -AC_DEFUN([AX_TYPEDEFED_NAME], [
>> -     AC_MSG_CHECKING([type of $1])
>> -     for f in $2; do
>> -             AX_CHECK_TYPEDEF($1, $f, $3=3D"$f", $3=3D"")
>> -             if test -n "${$3}"; then
>> -                     break
>> -             fi
>> -     done
>> -     if test -n "${$3}"; then
>> -             AC_MSG_RESULT([${$3}])
>> -     else
>> -             AC_MSG_ERROR([not found])
>> -     fi
>> -])
>> -
>> -dnl find a binary in the path
>> -AC_DEFUN([QT_FIND_PATH],
>> -[
>> -     AC_MSG_CHECKING([for $1])
>> -     AC_CACHE_VAL(qt_cv_path_$1,
>> -     [
>> -             qt_cv_path_$1=3D"NONE"
>> -             if test -n "$$2"; then
>> -                     qt_cv_path_$1=3D"$$2";
>> -             else
>> -                     dirs=3D"$3"
>> -                     qt_save_IFS=3D$IFS
>> -                     IFS=3D':'
>> -                     for dir in $PATH; do
>> -                             dirs=3D"$dirs $dir"
>> -                     done
>> -                     IFS=3D$qt_save_IFS
>> -
>> -                     for dir in $dirs; do
>> -                             if test -x "$dir/$1"; then
>> -                                     if test -n "$5"; then
>> -                                             evalstr=3D"$dir/$1 $5 2>&1=
 "
>> -                                             if eval $evalstr; then
>> -                                                     qt_cv_path_$1=3D"$=
dir/$1"
>> -                                                     break
>> -                                             fi
>> -                                     else
>> -                                             qt_cv_path_$1=3D"$dir/$1"
>> -                                             break
>> -                                     fi
>> -                             fi
>> -                     done
>> -             fi
>> -     ])
>> -
>> -     if test -z "$qt_cv_path_$1" || test "$qt_cv_path_$1" =3D "NONE"; t=
hen
>> -             AC_MSG_RESULT(not found)
>> -             $4
>> -     else
>> -             AC_MSG_RESULT($qt_cv_path_$1)
>> -             $2=3D$qt_cv_path_$1
>> -     fi
>> -])
>> -
>> -dnl Find the uic compiler on the path or in qt_cv_dir
>> -AC_DEFUN([QT_FIND_UIC],
>> -[
>> -     QT_FIND_PATH(uic, ac_uic, $qt_cv_dir/bin)
>> -     if test -z "$ac_uic" -a "$FATAL" =3D 1; then
>> -             AC_MSG_ERROR([uic binary not found in \$PATH or $qt_cv_dir=
/bin !])
>> -     fi
>> -])
>> -
>> -dnl Find the right moc in path/qt_cv_dir
>> -AC_DEFUN([QT_FIND_MOC],
>> -[
>> -     QT_FIND_PATH(moc2, ac_moc2, $qt_cv_dir/bin)
>> -     QT_FIND_PATH(moc, ac_moc1, $qt_cv_dir/bin)
>> -
>> -     if test -n "$ac_moc1" -a -n "$ac_moc2"; then
>> -             dnl found both. Prefer Qt3's if it exists else moc2
>> -             $ac_moc1 -v 2>&1 | grep "Qt 3" >/dev/null
>> -             if test "$?" =3D 0; then
>> -                     ac_moc=3D$ac_moc1;
>> -             else
>> -                     ac_moc=3D$ac_moc2;
>> -             fi
>> -     else
>> -             if test -n "$ac_moc1"; then
>> -                     ac_moc=3D$ac_moc1;
>> -             else
>> -                     ac_moc=3D$ac_moc2;
>> -             fi
>> -     fi
>> -
>> -     if test -z "$ac_moc"  -a "$FATAL" =3D 1; then
>> -             AC_MSG_ERROR([moc binary not found in \$PATH or $qt_cv_dir=
/bin !])
>> -     fi
>> -])
>> -
>> -dnl check a particular libname
>> -AC_DEFUN([QT_TRY_LINK],
>> -[
>> -     SAVE_LIBS=3D"$LIBS"
>> -     LIBS=3D"$LIBS $1"
>> -     AC_TRY_LINK([
>> -     #include <qglobal.h>
>> -     #include <qstring.h>
>> -             ],
>> -     [
>> -     QString s("mangle_failure");
>> -     #if (QT_VERSION < 221)
>> -     break_me_(\\\);
>> -     #endif
>> -     ],
>> -     qt_cv_libname=3D$1,
>> -     )
>> -     LIBS=3D"$SAVE_LIBS"
>> -])
>> -
>> -dnl check we can do a compile
>> -AC_DEFUN([QT_CHECK_COMPILE],
>> -[
>> -     AC_MSG_CHECKING([for Qt library name])
>> -
>> -     AC_CACHE_VAL(qt_cv_libname,
>> -     [
>> -             AC_LANG_CPLUSPLUS
>> -             SAVE_CXXFLAGS=3D$CXXFLAGS
>> -             CXXFLAGS=3D"$CXXFLAGS $QT_INCLUDES $QT_LDFLAGS"
>> -
>> -             for libname in -lqt-mt -lqt3 -lqt2 -lqt;
>> -             do
>> -                     QT_TRY_LINK($libname)
>> -                     if test -n "$qt_cv_libname"; then
>> -                             break;
>> -                     fi
>> -             done
>> -
>> -             CXXFLAGS=3D$SAVE_CXXFLAGS
>> -     ])
>> -
>> -     if test -z "$qt_cv_libname"; then
>> -             AC_MSG_RESULT([failed])
>> -             if test "$FATAL" =3D 1 ; then
>> -                     AC_MSG_ERROR([Cannot compile a simple Qt executabl=
e. Check you have the right \$QTDIR !])
>> -             fi
>> -     else
>> -             AC_MSG_RESULT([$qt_cv_libname])
>> -     fi
>> -])
>> -
>> -dnl get Qt version we're using
>> -AC_DEFUN([QT_GET_VERSION],
>> -[
>> -     AC_CACHE_CHECK([Qt version],lyx_cv_qtversion,
>> -     [
>> -             AC_LANG_CPLUSPLUS
>> -             SAVE_CPPFLAGS=3D$CPPFLAGS
>> -             CPPFLAGS=3D"$CPPFLAGS $QT_INCLUDES"
>> -
>> -             cat > conftest.$ac_ext <<EOF
>> -#line __oline__ "configure"
>> -#include "confdefs.h"
>> -#include <qglobal.h>
>> -"%%%"QT_VERSION_STR"%%%"
>> -EOF
>> -             lyx_cv_qtversion=3D`(eval "$ac_cpp conftest.$ac_ext") 2>&5=
 | \
>> -                     grep '^"%%%"'  2>/dev/null | \
>> -                     sed -e 's/"%%%"//g' -e 's/"//g'`
>> -             rm -f conftest.$ac_ext
>> -             CPPFLAGS=3D$SAVE_CPPFLAGS
>> -     ])
>> -
>> -     QT_VERSION=3D$lyx_cv_qtversion
>> -     AC_SUBST(QT_VERSION)
>> -])
>> -
>> -dnl start here
>> -AC_DEFUN([QT_DO_IT_ALL],
>> -[
>> -     dnl Please leave this alone. I use this file in
>> -     dnl oprofile.
>> -     FATAL=3D0
>> -
>> -     AC_ARG_WITH(qt-dir, [  --with-qt-dir           where the root of Q=
t is installed ],
>> -             [ qt_cv_dir=3D`eval echo "$withval"/` ])
>> -
>> -     AC_ARG_WITH(qt-includes, [  --with-qt-includes      where the Qt i=
ncludes are. ],
>> -             [ qt_cv_includes=3D`eval echo "$withval"` ])
>> -
>> -     AC_ARG_WITH(qt-libraries, [  --with-qt-libraries     where the Qt =
library is installed.],
>> -             [  qt_cv_libraries=3D`eval echo "$withval"` ])
>> -
>> -     dnl pay attention to $QTDIR unless overridden
>> -     if test -z "$qt_cv_dir"; then
>> -             qt_cv_dir=3D$QTDIR
>> -     fi
>> -
>> -     dnl derive inc/lib if needed
>> -     if test -n "$qt_cv_dir"; then
>> -             if test -z "$qt_cv_includes"; then
>> -                     qt_cv_includes=3D$qt_cv_dir/include
>> -             fi
>> -             if test -z "$qt_cv_libraries"; then
>> -                     qt_cv_libraries=3D$qt_cv_dir/lib
>> -             fi
>> -     fi
>> -
>> -     dnl flags for compilation
>> -     QT_INCLUDES=3D
>> -     QT_LDFLAGS=3D
>> -     if test -n "$qt_cv_includes"; then
>> -             QT_INCLUDES=3D"-I$qt_cv_includes"
>> -     fi
>> -     if test -n "$qt_cv_libraries"; then
>> -             QT_LDFLAGS=3D"-L$qt_cv_libraries"
>> -     fi
>> -     AC_SUBST(QT_INCLUDES)
>> -     AC_SUBST(QT_LDFLAGS)
>> -
>> -     QT_FIND_MOC
>> -     MOC=3D$ac_moc
>> -     AC_SUBST(MOC)
>> -     QT_FIND_UIC
>> -     UIC=3D$ac_uic
>> -     AC_SUBST(UIC)
>> -
>> -     QT_CHECK_COMPILE
>> -
>> -     QT_LIB=3D$qt_cv_libname;
>> -     AC_SUBST(QT_LIB)
>> -
>> -     if test -n "$qt_cv_libname"; then
>> -             QT_GET_VERSION
>> -     fi
>> -])
>> -
>> -dnl AX_CXXFLAGS_OPTIONS(var-name, option)
>> -dnl add option to var-name if $CXX support it.
>> -AC_DEFUN([AX_CHECK_PRECOMPILED_HEADER], [
>> -AC_MSG_CHECKING([whether ${CXX} support precompiled header])
>> -AC_LANG_SAVE
>> -AC_LANG_CPLUSPLUS
>> -SAVE_CXXFLAGS=3D$CXXFLAGS
>> -dnl we consider than if -Winvalid-pch is accepted pch will works ...
>> -CXXFLAGS=3D-Winvalid-pch
>> -dnl but we don't want -Winvalid-pch else compilation will fail due -Wer=
ror and
>> -dnl the fact than some pch will be invalid for the given compilation op=
tion
>> -AC_TRY_COMPILE(,[;],AC_MSG_RESULT([yes]); $1=3D"${$1} -include bits/std=
c++.h", AC_MSG_RESULT([no]))
>> -CXXFLAGS=3D$SAVE_CXXFLAGS
>> -AC_LANG_RESTORE
>> -])
>> -
>> -dnl AX_CHECK_DOCBOOK
>> -AC_DEFUN([AX_CHECK_DOCBOOK], [
>> -# It's just rude to go over the net to build
>> -XSLTPROC_FLAGS=3D--nonet
>> -DOCBOOK_ROOT=3D
>> -if test ! -f /etc/xml/catalog; then
>> -     for i in /usr/share/sgml/docbook/stylesheet/xsl/nwalsh /usr/share/=
sgml/docbook/xsl-stylesheets/;
>> -     do
>> -             if test -d "$i"; then
>> -                     DOCBOOK_ROOT=3D$i
>> -             fi
>> -     done
>> -
>> -     # Last resort - try net
>> -     if test -z "$DOCBOOK_ROOT"; then
>> -             XSLTPROC_FLAGS=3D
>> -     fi
>> -else
>> -     XML_CATALOG=3D/etc/xml/catalog
>> -     CAT_ENTRY_START=3D'<!--'
>> -     CAT_ENTRY_END=3D'-->'
>> -fi
>> -
>> -AC_CHECK_PROG(XSLTPROC,xsltproc,xsltproc,)
>> -XSLTPROC_WORKS=3Dno
>> -if test -n "$XSLTPROC"; then
>> -     AC_MSG_CHECKING([whether xsltproc works])
>> -
>> -     if test -n "$XML_CATALOG"; then
>> -             DB_FILE=3D"http://docbook.sourceforge.net/release/xsl/curr=
ent/xhtml/docbook.xsl"
>> -     else
>> -             DB_FILE=3D"$DOCBOOK_ROOT/docbook.xsl"
>> -     fi
>> -
>> -     $XSLTPROC $XSLTPROC_FLAGS $DB_FILE >/dev/null 2>&1 << END
>> -<?xml version=3D"1.0" encoding=3D'ISO-8859-1'?>
>> -<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN" "http://ww=
w.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd">
>> -<book id=3D"test">
>> -</book>
>> -END
>> -     if test "$?" =3D 0; then
>> -             XSLTPROC_WORKS=3Dyes
>> -     fi
>> -     AC_MSG_RESULT($XSLTPROC_WORKS)
>> -fi
>> -AM_CONDITIONAL(have_xsltproc, test "$XSLTPROC_WORKS" =3D "yes")
>> -
>> -AC_SUBST(XML_CATALOG)
>> -AC_SUBST(XSLTPROC_FLAGS)
>> -AC_SUBST(DOCBOOK_ROOT)
>> -AC_SUBST(CAT_ENTRY_START)
>> -AC_SUBST(CAT_ENTRY_END)
>> -])
>> -
>> -dnl AX_CFLAGS_OPTIONS(var-name, option)
>> -dnl add option to var-name if $CC support it.
>> -AC_DEFUN([AX_CFLAGS_OPTION], [
>> -AC_MSG_CHECKING([whether ${CC} $2 is understood])
>> -AC_LANG_SAVE
>> -AC_LANG_C
>> -SAVE_CFLAGS=3D$CFLAGS
>> -CFLAGS=3D$2
>> -AC_TRY_COMPILE(,[;],AC_MSG_RESULT([yes]); $1=3D"${$1} $2",AC_MSG_RESULT=
([no]))
>> -CFLAGS=3D$SAVE_CFLAGS
>> -AC_LANG_RESTORE
>> -])
>> -
>> -
>> -dnl AX_CXXFLAGS_OPTIONS(var-name, option)
>> -dnl add option to var-name if $CXX support it.
>> -AC_DEFUN([AX_CXXFLAGS_OPTION], [
>> -AC_MSG_CHECKING([whether ${CXX} $2 is understood])
>> -AC_LANG_SAVE
>> -AC_LANG_CPLUSPLUS
>> -SAVE_CXXFLAGS=3D$CXXFLAGS
>> -CXXFLAGS=3D$2
>> -AC_TRY_COMPILE(,[;],AC_MSG_RESULT([yes]); $1=3D"${$1} $2",AC_MSG_RESULT=
([no]))
>> -CXXFLAGS=3D$SAVE_CXXFLAGS
>> -AC_LANG_RESTORE
>> -])
>> -
>> -dnl AX_COPY_IF_CHANGE(source, dest)
>> -dnl copy source to dest if they don't compare equally or if dest doesn'=
t exist
>> -AC_DEFUN([AX_COPY_IF_CHANGE], [
>> -if test -r $2; then
>> -     if cmp $1 $2 > /dev/null; then
>> -             echo $2 is unchanged
>> -     else
>> -             cp -f $1 $2
>> -     fi
>> -else
>> -     cp -f $1 $2
>> -fi
>> -])
>> -
>> diff --git a/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patc=
h b/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
>> deleted file mode 100644
>> index b9bb6c57799..00000000000
>> --- a/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
>> +++ /dev/null
>> @@ -1,12 +0,0 @@
>> -oprofile doesn't want GNU-levels of automake strictness so tell it to b=
e "foreign".
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index 5740585..cf6c316 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -16 +16 @@ AC_CONFIG_SRCDIR([libop/op_config.h])
>> --AM_INIT_AUTOMAKE
>> -+AM_INIT_AUTOMAKE([foreign])
>> diff --git a/meta/recipes-kernel/oprofile/oprofile/musl.patch b/meta/rec=
ipes-kernel/oprofile/oprofile/musl.patch
>> deleted file mode 100644
>> index 51db408454a..00000000000
>> --- a/meta/recipes-kernel/oprofile/oprofile/musl.patch
>> +++ /dev/null
>> @@ -1,46 +0,0 @@
>> -Fix glibc-isms so that oprofile builds with musl.
>> -
>> -Patch taken from openwrt (https://github.com/openwrt-mirror/openwrt/blo=
b/master/package/devel/oprofile/patches/100-musl.patch)
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> -
>> ---- a/pe_profiling/operf.cpp
>> -+++ b/pe_profiling/operf.cpp
>> -@@ -857,11 +857,14 @@ static int __delete_old_previous_sample_
>> -                                 int tflag  __attribute__((unused)),
>> -                                 struct FTW *ftwbuf __attribute__((unus=
ed)))
>> - {
>> -+    int err;
>> -+
>> -     if (remove(fpath)) {
>> -+            err =3D errno;
>> -             perror("sample data removal error");
>> --            return FTW_STOP;
>> -+            return err;
>> -     } else {
>> --            return FTW_CONTINUE;
>> -+            return 0;
>> -     }
>> - }
>> -
>> -@@ -896,7 +899,7 @@ static void convert_sample_data(void)
>> -             return;
>> -
>> -     if (!operf_options::append) {
>> --                int flags =3D FTW_DEPTH | FTW_ACTIONRETVAL;
>> -+                int flags =3D FTW_DEPTH;
>> -             errno =3D 0;
>> -             if (nftw(previous_sampledir.c_str(), __delete_old_previous=
_sample_data, 32, flags) !=3D0 &&
>> -                             errno !=3D ENOENT) {
>> ---- a/libop/op_events.c
>> -+++ b/libop/op_events.c
>> -@@ -83,7 +83,7 @@ static int parse_hex(char const * str)
>> - static u64 parse_long_hex(char const * str)
>> - {
>> -     u64 value;
>> --    if (sscanf(str, "%Lx", &value) !=3D 1)
>> -+    if (sscanf(str, "0x%llx", &value) !=3D 1)
>> -             parse_error("expected long hexadecimal value");
>> -
>> -     fflush(stderr);
>> diff --git a/meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compil=
e-tests.patch b/meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compil=
e-tests.patch
>> deleted file mode 100644
>> index aefa9548e1d..00000000000
>> --- a/meta/recipes-kernel/oprofile/oprofile/oprofile-cross-compile-tests=
.patch
>> +++ /dev/null
>> @@ -1,98 +0,0 @@
>> -Prevent running check tests on host if cross compiling
>> -
>> -This patch enables running the 'make check' tests on the target
>> -in a cross-compiled environment. If not cross-compiling, then 'make
>> - check' builds and executes the tests; no change from this patch.
>> -In a cross-compiling environment, the make variable CROSS_COMPILE is
>> -set which bypasses assiging tests to the makekfile variable TESTS.
>> -Since TESTS is empty, the 'make check' process never tries to run the
>> -tests on the hosts.  On the target, the tests must be run manually.
>> -
>> -Also, in the libutil++ tests, a makefile variable SRCDIR is passed into
>> -the compilation phase, pointing to the runtime location of the test
>> -'file-manip-tests'.  The mechanism used for a host test, based on
>> -'topdir' doesn't work.  Instead, if CROSS_COMPILE is set, the
>> -makefile takes the path of SRCDIR from the build environment and not
>> -from an expression based on the host path 'topdir'.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index 41ece64..ce5a16f 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -392,6 +392,7 @@ AC_ARG_ENABLE(account-check,
>> -     enable_account_check=3D$enableval, enable_account_check=3Dyes)
>> -
>> - AM_CONDITIONAL(CHECK_ACCOUNT, test "x$enable_account_check" =3D "xyes"=
)
>> -+AM_CONDITIONAL(CROSS_COMPILE, test "x$cross_compiling" =3D "xyes")
>> -
>> - AC_SUBST(OP_CFLAGS)
>> - AC_SUBST(OP_CXXFLAGS)
>> -diff --git a/libdb/tests/Makefile.am b/libdb/tests/Makefile.am
>> -index 8a69003..d820090 100644
>> ---- a/libdb/tests/Makefile.am
>> -+++ b/libdb/tests/Makefile.am
>> -@@ -13,4 +13,6 @@ check_PROGRAMS =3D db_test
>> - db_test_SOURCES =3D db_test.c
>> - db_test_LDADD =3D ../libodb.a ../../libutil/libutil.a
>> -
>> -+if ! CROSS_COMPILE
>> - TESTS =3D ${check_PROGRAMS}
>> -+endif
>> -diff --git a/libop/tests/Makefile.am b/libop/tests/Makefile.am
>> -index 8a79eb5..6d417c4 100644
>> ---- a/libop/tests/Makefile.am
>> -+++ b/libop/tests/Makefile.am
>> -@@ -33,4 +33,6 @@ load_events_files_tests_LDADD =3D ${COMMON_LIBS}
>> - mangle_tests_SOURCES =3D mangle_tests.c
>> - mangle_tests_LDADD =3D ${COMMON_LIBS}
>> -
>> -+if ! CROSS_COMPILE
>> - TESTS =3D ${check_PROGRAMS} utf8_checker.sh
>> -+endif
>> -diff --git a/libregex/tests/Makefile.am b/libregex/tests/Makefile.am
>> -index 6f19838..1d176f9 100644
>> ---- a/libregex/tests/Makefile.am
>> -+++ b/libregex/tests/Makefile.am
>> -@@ -18,4 +18,6 @@ java_test_LDADD =3D \
>> -
>> - EXTRA_DIST =3D mangled-name.in
>> -
>> -+if ! CROSS_COMPILE
>> - TESTS =3D ${check_PROGRAMS}
>> -+endif
>> -diff --git a/libutil++/tests/Makefile.am b/libutil++/tests/Makefile.am
>> -index 51af031..a01ea2d 100644
>> ---- a/libutil++/tests/Makefile.am
>> -+++ b/libutil++/tests/Makefile.am
>> -@@ -1,7 +1,9 @@
>> -
>> - REALPATH=3D readlink -f
>> -
>> -+if ! CROSS_COMPILE
>> - SRCDIR :=3D $(shell $(REALPATH) $(topdir)/libutil++/tests/ )
>> -+endif
>> -
>> - AM_CPPFLAGS =3D \
>> -     -I ${top_srcdir}/libutil++ -D SRCDIR=3D"\"$(SRCDIR)/\"" @OP_CPPFLA=
GS@
>> -@@ -46,4 +48,6 @@ cached_value_tests_LDADD =3D ${COMMON_LIBS}
>> - utility_tests_SOURCES =3D utility_tests.cpp
>> - utility_tests_LDADD =3D ${COMMON_LIBS}
>> -
>> -+if ! CROSS_COMPILE
>> - TESTS =3D ${check_PROGRAMS}
>> -+endif
>> -diff --git a/libutil/tests/Makefile.am b/libutil/tests/Makefile.am
>> -index dfcd6ec..e8831b5 100644
>> ---- a/libutil/tests/Makefile.am
>> -+++ b/libutil/tests/Makefile.am
>> -@@ -12,4 +12,6 @@ file_tests_LDADD =3D ../libutil.a
>> - string_tests_SOURCES =3D string_tests.c
>> - string_tests_LDADD =3D ../libutil.a
>> -
>> -+if ! CROSS_COMPILE
>> - TESTS =3D ${check_PROGRAMS}
>> -+endif
>> diff --git a/meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch b=
/meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch
>> deleted file mode 100644
>> index 3eaf6a794ad..00000000000
>> --- a/meta/recipes-kernel/oprofile/oprofile/root-home-dir.patch
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -oprofile: Determine the root home directory dynamically
>> -
>> -This commit detects the root home directory dynamically with changes to
>> -the oprofile gui app source.
>> -
>> -The commit replaces an earlier fix that detected and adjusted a
>> -'non-standard' root home directory at build time.  The advantage of thi=
s
>> -patch is that the oprofile tools are adjusted to the current run-time
>> -path to ~root, not the build time path.
>> -
>> -Upstream-Status: Inappropriate [OE specific]
>> -
>> -Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
>> -
>> -Index: oprofile-1.0.0/doc/oprofile.html
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- oprofile-1.0.0.orig/doc/oprofile.html    2014-11-03 17:55:31.511034=
857 +0000
>> -+++ oprofile-1.0.0/doc/oprofile.html 2014-11-03 17:57:26.415037988 +000=
0
>> -@@ -1563,8 +1563,8 @@
>> -             <span class=3D"emphasis"><em>must</em></span> stop it in a=
 controlled manner in order to process
>> -             the profile data it has collected.  Use <code class=3D"cod=
e">kill -SIGINT &lt;operf-PID&gt;</code>
>> -             for this purpose. It is recommended that when running <spa=
n class=3D"command"><strong>operf</strong></span>
>> --            with this option, your current working directory should be=
 <code class=3D"filename">/root</code> or a subdirectory
>> --            of <code class=3D"filename">/root</code> to avoid storing =
sample data files in locations accessible by regular users.
>> -+            with this option, your current working directory should be=
 <code class=3D"filename">~root</code> or a subdirectory
>> -+            of <code class=3D"filename">~root</code> to avoid storing =
sample data files in locations accessible by regular users.
>> -             </p>
>> -               </dd>
>> -               <dt>
>> -Index: oprofile-1.0.0/doc/oprofile.xml
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- oprofile-1.0.0.orig/doc/oprofile.xml     2014-11-03 17:55:31.515034=
857 +0000
>> -+++ oprofile-1.0.0/doc/oprofile.xml  2014-11-03 17:58:03.719039005 +000=
0
>> -@@ -654,8 +654,8 @@
>> -             <emphasis>must</emphasis> stop it in a controlled manner i=
n order to process
>> -             the profile data it has collected.  Use <code>kill -SIGINT=
 &lt;operf-PID&gt;</code>
>> -             for this purpose. It is recommended that when running <com=
mand>operf</command>
>> --            with this option, your current working directory should be=
 <filename>/root</filename> or a subdirectory
>> --            of <filename>/root</filename> to avoid storing sample data=
 files in locations accessible by regular users.
>> -+            with this option, your current working directory should be=
 <filename>~root</filename> or a subdirectory
>> -+            of <filename>~root</filename> to avoid storing sample data=
 files in locations accessible by regular users.
>> -             </para></listitem>
>> -     </varlistentry>
>> -     <varlistentry>
>> diff --git a/meta/recipes-kernel/oprofile/oprofile/run-ptest b/meta/reci=
pes-kernel/oprofile/oprofile/run-ptest
>> deleted file mode 100644
>> index 4814be652a7..00000000000
>> --- a/meta/recipes-kernel/oprofile/oprofile/run-ptest
>> +++ /dev/null
>> @@ -1,19 +0,0 @@
>> -#!/bin/sh
>> -
>> -saved_dir=3D$PWD
>> -for dir in */tests ; do
>> -     cd $dir
>> -     for atest in * ; do
>> -             if [ \( -x $atest \) -a \( -f $atest \) ] ; then
>> -                     ./$atest > ${atest}.stdout 2> ${atest}.stderr
>> -                     if [ $? =3D 0 ] ; then
>> -                             echo "PASS: $dir $atest"
>> -                             rm ${atest}.stdout ${atest}.stderr
>> -                     else
>> -                             echo "FAIL: ${dir}/${atest}"
>> -                     fi
>> -             fi
>> -     done
>> -     cd $saved_dir
>> -done
>> -
>> diff --git a/meta/recipes-kernel/oprofile/oprofile_1.1.0.bb b/meta/recip=
es-kernel/oprofile/oprofile_1.1.0.bb
>> deleted file mode 100644
>> index 92a94ad0d4d..00000000000
>> --- a/meta/recipes-kernel/oprofile/oprofile_1.1.0.bb
>> +++ /dev/null
>> @@ -1,10 +0,0 @@
>> -require oprofile.inc
>> -
>> -DEPENDS +=3D "virtual/kernel"
>> -DEPENDS_append_powerpc64 =3D " libpfm4"
>> -
>> -SRC_URI[md5sum] =3D "248c4c069f9476f427fa7195563f9867"
>> -SRC_URI[sha256sum] =3D "cf759a6de1a6033d5dfc93bda129a9f2e128aecc4238cc6=
57feb0801d1b0366c"
>> -
>> -S =3D "${WORKDIR}/oprofile-${PV}"
>> -
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

