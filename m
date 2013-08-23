Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA1761EC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 04:09:39 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so163527pdi.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 21:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=tnMrxmGsU0VDmt267P4wvNIWnXa3aXUJi0ut5AsiZBQ=;
	b=XuZ92X/dlvLSf8SEGCZvR3rUaw3zF+u+Axu5/MFuD1o/BrPFz4un8vj1Ysg6L3b790
	kGm8ScJtRPbu8xrMV+5fcLMRQPZ7ZzUe8O1YzDp2NnzhV6RZvej2U9+cqpi3Jsba16ZW
	JLUm40XAI8sePRkbJx6FOrJNNrpLqiiB7Uw26ACEvCEVnI/LHpD0wORkSSiTz5kB4rBS
	Zkp+Anmk5Xlg2lgQd4gaK8TN4qYLKef41DEnJYRZgZtZCYedyVVdSQCBC5DelrtscIC9
	sqON71aeiu/P3IOjRZa/ZBEOHS+vYeAPAkOS2sbwGnXcatJxJcq2O4deXe3CqEixaFRD
	FFDA==
X-Received: by 10.66.192.132 with SMTP id hg4mr9053458pac.84.1377230980322;
	Thu, 22 Aug 2013 21:09:40 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	pu5sm20449949pac.21.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 21:09:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5216888A.6050200@linux.intel.com>
Date: Thu, 22 Aug 2013 21:09:36 -0700
Message-Id: <DBCC9871-A9D3-438D-95B2-7F6797313633@gmail.com>
References: <cover.1377145501.git.raj.khem@gmail.com>
	<39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
	<5216888A.6050200@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] kmod: Upgrade to version 14
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
X-List-Received-Date: Fri, 23 Aug 2013 04:09:39 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 22, 2013, at 2:54 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 08/21/2013 09:31 PM, Khem Raj wrote:
>> The update is a requirement for systemd-206
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-kernel/kmod/kmod-native_git.bb        |  1 -
>>  meta/recipes-kernel/kmod/kmod.inc                  |  9 ++++----
>>  ...-man-page-generation-because-we-don-t-hav.patch | 26 =
----------------------
>>  .../kmod/kmod/fix-undefined-O_CLOEXEC.patch        | 16 =
++++++-------
>>  meta/recipes-kernel/kmod/kmod_git.bb               |  3 +--
>>  5 files changed, 13 insertions(+), 42 deletions(-)
>>  delete mode 100644 =
meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-because=
-we-don-t-hav.patch
>>=20
>=20
> Did you build the native version?  I am seeing failures in MUT on the =
autobuilder. It did pass my "sniff" test on my 2 local world builds.


yes and multiple times. what distro do you run on your build boxes ? I =
wonder if its some sort of race condition
I use -j20 and -j16


% bitbake kmod-native=20
Loading cache: 100% |###########################################| ETA:  =
00:00:00
Loaded 1197 entries from dependency cache.

Build Configuration:
BB_VERSION        =3D "1.19.1"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Ubuntu-12.04"
TARGET_SYS        =3D "x86_64-oe-linux"
MACHINE           =3D "qemux86-64"
DISTRO_VERSION    =3D "oe-core.0"
TUNE_FEATURES     =3D "m64"
TARGET_FPU        =3D ""
meta              =3D "master:2176bfd1099287056432780d0ee6b202e94bd1ee"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 72 tasks of which 60 didn't need to be =
rerun and all succeeded.



>=20
>> | x86_64-linux-libtool: link: gcc -std=3Dgnu99 -pipe =
-DANOTHER_BRICK_IN_THE -Wall -W -Wextra -Wno-inline -Wvla -Wundef =
-Wformat=3D2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs =
-Wold-style-definition -Wpointer-arith -Winit-self =
-Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes =
-Wstrict-prototypes -Wredundant-decls -Wmissing-declarations =
-Wmissing-noreturn -Wshadow -Wendif-labels -Wstrict-aliasing=3D2 =
-Wwrite-strings -Wno-long-long -Wno-overlength-strings =
-Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result =
-Wnested-externs -Wchar-subscripts -Wtype-limits -Wuninitialized =
-fno-common -fdiagnostics-show-option -fvisibility=3Dhidden =
-ffunction-sections -fdata-sections =
-isystem/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/=
build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe =
-Wl,--as-needed -Wl,--gc-sections -Wl,-rpath-link =
-Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/buil=
d/build/tmp/sysroots/x86_64-linux
> /usr/lib -Wl,-rpath-link =
-Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/buil=
d/build/tmp/sysroots/x86_64-linux/lib -Wl,-rpath =
-Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/buil=
d/build/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath =
-Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/buil=
d/build/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o tools/test/kmod =
tools/kmod.o tools/lsmod.o tools/rmmod.o tools/insmod.o tools/modinfo.o =
tools/modprobe.o tools/depmod.o tools/log.o tools/static-nodes.o  =
-L/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/=
build/tmp/sysroots/x86_64-linux/usr/lib =
-L/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/=
build/tmp/sysroots/x86_64-linux/lib libkmod/.libs/libkmod-util.a =
libkmod/.libs/libkmod-private.a
>                       Nice ester egg                ^^^^^^^^^^^^^^^^
>> | tools/kmod.o: In function `kmod_help':
>> | kmod.c:(.text.kmod_help+0x27): undefined reference to =
`_Static_assert'
>> | kmod.c:(.text.kmod_help+0x5c): undefined reference to =
`_Static_assert'
>> | kmod.c:(.text.kmod_help+0x7f): undefined reference to =
`_Static_assert'
>> | kmod.c:(.text.kmod_help+0xb9): undefined reference to =
`_Static_assert'
>> | tools/kmod.o: In function `main':
>> | kmod.c:(.text.main+0x5b): undefined reference to `_Static_assert'
>> | tools/kmod.o:kmod.c:(.text.main+0x8c): more undefined references to =
`_Static_assert' follow
>> | collect2: ld returned 1 exit status
>> | make[2]: *** [tools/test/kmod] Error 1
>> | make[2]: *** Waiting for unfinished jobs....
>> | x86_64-linux-libtool: link: gcc -std=3Dgnu99 -pipe =
-DANOTHER_BRICK_IN_THE -Wall -W -Wextra -Wno-inline -Wvla -Wundef =
-Wformat=3D2 -Wlogical-op -Wsign-compare -Wmissing-include-dirs =
-Wold-style-definition -Wpointer-arith -Winit-self =
-Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes =
-Wstrict-prototypes -Wredundant-decls -Wmissing-declarations =
-Wmissing-noreturn -Wshadow -Wendif-labels -Wstrict-aliasing=3D2 =
-Wwrite-strings -Wno-long-long -Wno-overlength-strings =
-Wno-unused-parameter -Wno-missing-field-initializers -Wno-unused-result =
-Wnested-externs -Wchar-subscripts -Wtype-limits -Wuninitialized =
-fno-common -fdiagnostics-show-option -fvisibility=3Dhidden =
-ffunction-sections -fdata-sections =
-isystem/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/=
build/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe =
-Wl,--as-needed -Wl,--gc-sections -Wl,-rpath-link =
-Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/buil=
d/build/tmp/sysroots/x86_64-linux
> /usr/lib -Wl,-rpath-link =
-Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/buil=
d/build/tmp/sysroots/x86_64-linux/lib -Wl,-rpath =
-Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/buil=
d/build/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath =
-Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/buil=
d/build/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o tools/.libs/kmod =
tools/kmod.o tools/lsmod.o tools/rmmod.o tools/insmod.o tools/modinfo.o =
tools/modprobe.o tools/depmod.o tools/log.o tools/static-nodes.o  =
-L/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/=
build/tmp/sysroots/x86_64-linux/usr/lib =
-L/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/build/=
build/tmp/sysroots/x86_64-linux/lib libkmod/.libs/libkmod-util.a =
libkmod/.libs/libkmod.so -Wl,-rpath =
-Wl,/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-x86/buil=
d/build/tmp/sysroots/x86_64-linux/usr/lib
>> | tools/kmod.o: In function `kmod_help':
>> | kmod.c:(.text.kmod_help+0x27): undefined reference to =
`_Static_assert'
>> | kmod.c:(.text.kmod_help+0x5c): undefined reference to =
`_Static_assert'
>> | kmod.c:(.text.kmod_help+0x7f): undefined reference to =
`_Static_assert'
>> | kmod.c:(.text.kmod_help+0xb9): undefined reference to =
`_Static_assert'
>> | tools/kmod.o: In function `main':
>> | kmod.c:(.text.main+0x5b): undefined reference to `_Static_assert'
>> | tools/kmod.o:kmod.c:(.text.main+0x8c): more undefined references to =
`_Static_assert' follow
>> | collect2: ld returned 1 exit status
>> | make[2]: *** [tools/kmod] Error 1
>=20
>=20
> Sau!
>=20
>=20
>> diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb =
b/meta/recipes-kernel/kmod/kmod-native_git.bb
>> index 8cbcdf8..afa3ad0 100644
>> --- a/meta/recipes-kernel/kmod/kmod-native_git.bb
>> +++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
>> @@ -4,7 +4,6 @@
>>  require kmod.inc
>>  inherit native
>>=20
>> -PR =3D "${INC_PR}.1"
>>  SRC_URI +=3D "file://fix-undefined-O_CLOEXEC.patch"
>>=20
>>  do_install_append (){
>> diff --git a/meta/recipes-kernel/kmod/kmod.inc =
b/meta/recipes-kernel/kmod/kmod.inc
>> index a780b6c..1728a4e 100644
>> --- a/meta/recipes-kernel/kmod/kmod.inc
>> +++ b/meta/recipes-kernel/kmod/kmod.inc
>> @@ -7,8 +7,6 @@ HOMEPAGE =3D "http://packages.profusion.mobi/kmod/"
>>  LICENSE =3D "GPL-2.0+ & LGPL-2.1+"
>>  LICENSE_libkmod =3D "LGPL-2.1+"
>>  SECTION =3D "base"
>> -PV =3D "9"
>> -INC_PR =3D "r0"
>>=20
>>  DEPENDS +=3D "pkgconfig-native"
>>=20
>> @@ -19,17 +17,18 @@ inherit autotools gtk-doc ptest
>>=20
>>  SRC_URI =3D "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git =
\
>>             file://depmod-search.conf \
>> -           =
file://0001-man-disable-man-page-generation-because-we-don-t-hav.patch \
>>             file://run-ptest \
>>             file://ptest.patch \
>>            "
>>=20
>> -SRCREV =3D "62081c0f68905b22f375156d4532fd37fa5c8d33"
>> +SRCREV =3D "3b38c7fcb58be4ddc34f90454c5f5dc3693d2d85"
>> +# Lookout for PV bump too when SRCREV is changed
>> +PV =3D "14"
>>=20
>>  S =3D "${WORKDIR}/git"
>>=20
>>  EXTRA_AUTORECONF +=3D "--install --symlink"
>> -EXTRA_OECONF +=3D"--enable-debug --enable-logging --enable-tools"
>> +EXTRA_OECONF +=3D"--enable-debug --enable-logging --enable-tools =
--disable-manpages"
>>=20
>>  do_configure_prepend () {
>>          gtkdocize --docdir ${S}/libkmod/docs || touch =
${S}/libkmod/docs/gtk-doc.make
>> diff --git =
a/meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-becau=
se-we-don-t-hav.patch =
b/meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-becau=
se-we-don-t-hav.patch
>> deleted file mode 100644
>> index 5361b84..0000000
>> --- =
a/meta/recipes-kernel/kmod/kmod/0001-man-disable-man-page-generation-becau=
se-we-don-t-hav.patch
>> +++ /dev/null
>> @@ -1,26 +0,0 @@
>> -=46rom ce6f0cabb65e67dd4d31e1e555db8bc6eaf435d3 Mon Sep 17 00:00:00 =
2001
>> -From: Martin Jansa <Martin.Jansa@gmail.com>
>> -Date: Fri, 24 Feb 2012 07:35:38 +0100
>> -Subject: [PATCH] man: disable man page generation because we don't =
have
>> - working xsltproc
>> -
>> -Upstream-Status: Inappropriate [build system specific change]
>> -
>> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ----
>> - Makefile.am |    2 +-
>> - 1 files changed, 1 insertions(+), 1 deletions(-)
>> -
>> -diff --git a/Makefile.am b/Makefile.am
>> -index 141c102..a8bdfd1 100644
>> ---- a/Makefile.am
>> -+++ b/Makefile.am
>> -@@ -1,4 +1,4 @@
>> --SUBDIRS =3D . libkmod/docs man
>> -+SUBDIRS =3D . libkmod/docs
>> -
>> - DISTCLEAN_LOCAL_HOOKS =3D
>> - EXTRA_DIST =3D
>> ---
>> -1.7.8.4
>> -
>> diff --git =
a/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch =
b/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
>> index 3177e9a..0268216 100644
>> --- a/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
>> +++ b/meta/recipes-kernel/kmod/kmod/fix-undefined-O_CLOEXEC.patch
>> @@ -2,16 +2,16 @@ Upstream-Status: Not applicable
>>=20
>>  Index: git/libkmod/libkmod-private.h
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- git.orig/libkmod/libkmod-private.h
>> -+++ git/libkmod/libkmod-private.h
>> -@@ -1,6 +1,10 @@
>> - #ifndef _LIBKMOD_PRIVATE_H_
>> - #define _LIBKMOD_PRIVATE_H_
>> +--- git.orig/libkmod/libkmod-private.h	2013-08-21 =
10:07:51.000000000 -0700
>> ++++ git/libkmod/libkmod-private.h	2013-08-21 14:34:04.558278849 =
-0700
>> +@@ -9,6 +9,10 @@
>> + #include "macro.h"
>> + #include "libkmod.h"
>>=20
>>  +#ifndef O_CLOEXEC
>>  +# define O_CLOEXEC 0
>>  +#endif
>>  +
>> - #include <stdbool.h>
>> - #include <stdio.h>
>> - #include <syslog.h>
>> + static _always_inline_ _printf_format_(2, 3) void
>> + 	kmod_log_null(struct kmod_ctx *ctx, const char *format, ...) {}
>> +
>> diff --git a/meta/recipes-kernel/kmod/kmod_git.bb =
b/meta/recipes-kernel/kmod/kmod_git.bb
>> index f92ff72..b07c06e 100644
>> --- a/meta/recipes-kernel/kmod/kmod_git.bb
>> +++ b/meta/recipes-kernel/kmod/kmod_git.bb
>> @@ -3,8 +3,7 @@
>>=20
>>  require kmod.inc
>>=20
>> -PR =3D "${INC_PR}.0"
>> -PV =3D "9+git${SRCPV}"
>> +PV_append =3D "+git${SRCPV}"
>>=20
>>  PROVIDES +=3D "module-init-tools-insmod-static =
module-init-tools-depmod module-init-tools"
>>  RPROVIDES_${PN} +=3D "module-init-tools-insmod-static =
module-init-tools-depmod module-init-tools"
>>=20


