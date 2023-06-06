Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7661BC7EE37
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 20:42:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.174.1686084172114074132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 13:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WKtjGnwI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686084169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hu/qpip9Sehdxa0MUjyH5d016O+HvpCIWdG1cY1YXPY=;
	b=WKtjGnwId60kE9c4jGiTztKmqQxdeveSS90RbHFW8C0ZKUV19q9OGwYF+ePVM5nS7szzXR
	2IR107lEdKpREhYGRqL7c2gKyf3kGKn/vmoZqxjc7p5LymoAUO7zQedERPWIv+gEBWfrre
	/fDArTugBQMSp8S7kdHwoJvMzNZiyqMxLPEjvRSv4weKEhD04KX6M9evWh9GJB2/VFcakB
	mpv8XHEEaHaz3hoCyZY+vQ6EuacxeQHh8aV5/qH8xJ4QCumcO2gt7Yek8E0PKPzI+xMpyL
	1fvn+JCcKhyKgmK7TTKRGx025EfJ9+2XMVb3t8ieebWkSdBZWinVLHcR86LnPQ==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4ED84FF805;
	Tue,  6 Jun 2023 20:42:49 +0000 (UTC)
Date: Tue, 6 Jun 2023 22:42:49 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v2] util-linux: upgrade 2.38.1 -> 2.39
Message-ID: <20230606204249afd53fbb@mail.local>
References: <20230602144124.923028-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230602144124.923028-1-tgamblin@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 20:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182451

Hello,

This causes multiple failures:

Mips and ppc:

https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/7198/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/7196/step=
s/13/logs/stdio

| mips-poky-linux-gcc  -meb -mabi=3D32 -mhard-float -march=3Dmips32r2 -fsta=
ck-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -=
Werror=3Dformat-security -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64 --sysro=
ot=3D/home/pokybuild/yocto-worker/qemumips/build/build/tmp/work/mips32r2-po=
ky-linux/util-linux/2.39-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../util-li=
nux-2.39  -include config.h -I../util-linux-2.39/include -DLOCALEDIR=3D\"/u=
sr/share/locale\" -D_PATH_RUNSTATEDIR=3D\"/run\" -D_PATH_SYSCONFSTATICDIR=
=3D\"/usr/lib\"    -fsigned-char -fno-common -Wall -Wextra -Waddress-of-pac=
ked-member -Wdiscarded-qualifiers -Wformat-security -Wimplicit-function-dec=
laration -Wmissing-declarations -Wmissing-parameter-type -Wmissing-prototyp=
es -Wnested-externs -Wno-missing-field-initializers -Wold-style-definition =
-Wpointer-arith -Wredundant-decls -Wsign-compare -Wstrict-prototypes -Wtype=
-limits -Wuninitialized -Wunused-but-set-parameter -Wunused-but-set-variabl=
e -Wunused-parameter -Wunused-result -Wunused-variable -Werror=3Dsequence-p=
oint -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacr=
o-prefix-map=3D/home/pokybuild/yocto-worker/qemumips/build/build/tmp/work/m=
ips32r2-poky-linux/util-linux/2.39-r0/util-linux-2.39=3D/usr/src/debug/util=
-linux/2.39-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/qemumips/=
build/build/tmp/work/mips32r2-poky-linux/util-linux/2.39-r0/util-linux-2.39=
=3D/usr/src/debug/util-linux/2.39-r0  -fmacro-prefix-map=3D/home/pokybuild/=
yocto-worker/qemumips/build/build/tmp/work/mips32r2-poky-linux/util-linux/2=
=2E39-r0/build=3D/usr/src/debug/util-linux/2.39-r0  -fdebug-prefix-map=3D/h=
ome/pokybuild/yocto-worker/qemumips/build/build/tmp/work/mips32r2-poky-linu=
x/util-linux/2.39-r0/build=3D/usr/src/debug/util-linux/2.39-r0  -fdebug-pre=
fix-map=3D/home/pokybuild/yocto-worker/qemumips/build/build/tmp/work/mips32=
r2-poky-linux/util-linux/2.39-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/h=
ome/pokybuild/yocto-worker/qemumips/build/build/tmp/work/mips32r2-poky-linu=
x/util-linux/2.39-r0/recipe-sysroot=3D  -fdebug-prefix-map=3D/home/pokybuil=
d/yocto-worker/qemumips/build/build/tmp/work/mips32r2-poky-linux/util-linux=
/2.39-r0/recipe-sysroot-native=3D  -c -o tests/helpers/test_enosys.o ../uti=
l-linux-2.39/tests/helpers/test_enosys.c
| ../util-linux-2.39/tests/helpers/test_enosys.c:57:6: error: #error Unknow=
n target architecture
|    57 | #    error Unknown target architecture
|       |      ^~~~~
| make: *** [Makefile:10075: tests/helpers/test_enosys.o] Error 1
| ERROR: oe_runmake failed


oe-selftest:

2023-06-05 23:49:03,868 - oe-selftest - INFO - incompatible_lic.NoGPL3InIma=
gesTests.test_core_image_full_cmdline_weston (subunit.RemotedTestCase)
2023-06-05 23:49:03,870 - oe-selftest - INFO -  ... FAIL

ERROR: core-image-weston-1.0-r0 do_rootfs: Package util-linux-sulogin canno=
t be installed into the image because it has incompatible license(s): GPL-3=
=2E0-or-later
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-selfte=
st-debian/build/build-st-2841616/tmp/work/qemux86_64-poky-linux/core-image-=
weston/1.0-r0/temp/log.do_rootfs.428774
NOTE: recipe core-image-weston-1.0-r0: task do_rootfs: Failed
ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/rec=
ipes-graphics/images/core-image-weston.bb:do_rootfs) failed with exit code =
'1'
ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Package util-linux cannot =
be installed into the image because it has incompatible license(s): GPL-3.0=
-or-later
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-selfte=
st-debian/build/build-st-2841616/tmp/work/qemux86_64-poky-linux/core-image-=
full-cmdline/1.0-r0/temp/log.do_rootfs.554152
NOTE: recipe core-image-full-cmdline-1.0-r0: task do_rootfs: Failed
ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/rec=
ipes-extended/images/core-image-full-cmdline.bb:do_rootfs) failed with exit=
 code '1'


On 02/06/2023 10:41:24-0400, Trevor Gamblin wrote:
> util-linux's ChangeLog file simply points to the git log, and there are
> numerous changes between 2.38.1 and 2.39:
>=20
> https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/log
>=20
> There is a notable license change - README.licensing adds the
> BSD-2-Clause variant between these versions, but there is no
> corresponding file in Documentation/licenses; it's been added it under
> LICENSE in the recipe along with a reference to the common-licenses
> version. The README.licensing file also lists GPL-3.0-or-later for
> some of the code, so add it as well and include a checksum.
>=20
> Two patches were removed since they're included in 2.39 upstream.
>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> v2 properly deletes the two patch files instead of simply removing them
> from the recipe.
>  ...d_2.38.1.bb =3D> util-linux-libuuid_2.39.bb} |  0
>  meta/recipes-core/util-linux/util-linux.inc   | 10 ++--
>  .../0001-check-for-sys-pidfd.h.patch          | 53 -------------------
>  ...configure.ac-Improve-check-for-magic.patch | 40 --------------
>  ...til-linux_2.38.1.bb =3D> util-linux_2.39.bb} |  0
>  5 files changed, 5 insertions(+), 98 deletions(-)
>  rename meta/recipes-core/util-linux/{util-linux-libuuid_2.38.1.bb =3D> u=
til-linux-libuuid_2.39.bb} (100%)
>  delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-check-fo=
r-sys-pidfd.h.patch
>  delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-configur=
e.ac-Improve-check-for-magic.patch
>  rename meta/recipes-core/util-linux/{util-linux_2.38.1.bb =3D> util-linu=
x_2.39.bb} (100%)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb b/=
meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb
> similarity index 100%
> rename from meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb
> rename to meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 3868b1c41d..f9e6fb7d21 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -6,16 +6,18 @@ disk partitioning, kernel message management, filesyste=
m creation, and system lo
> =20
>  SECTION =3D "base"
> =20
> -LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause & BSD-4=
-Clause"
> +LICENSE =3D "GPL-3.0-or-later & GPL-2.0-or-later & LGPL-2.1-or-later & B=
SD-2-Clause & BSD-3-Clause & BSD-4-Clause"
>  LICENSE:${PN}-libblkid =3D "LGPL-2.1-or-later"
>  LICENSE:${PN}-libfdisk =3D "LGPL-2.1-or-later"
>  LICENSE:${PN}-libmount =3D "LGPL-2.1-or-later"
>  LICENSE:${PN}-libsmartcols =3D "LGPL-2.1-or-later"
> =20
> -LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D0fd5c050c6187d2bf0a4=
492b7f4e33da \
> +LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D12ae7768a65ec8f2e44d=
930df9cb43fa \
>                      file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3 \
> +                    file://Documentation/licenses/COPYING.GPL-3.0-or-lat=
er;md5=3D1ebbd3e34237af26da5dc08a4e440464 \
>                      file://Documentation/licenses/COPYING.GPL-2.0-or-lat=
er;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://Documentation/licenses/COPYING.LGPL-2.1-or-la=
ter;md5=3D4fbd65380cdd255951079008b364516c \
> +                    file://${COREBASE}/meta/files/common-licenses/BSD-2-=
Clause;md5=3Dcb641bc04cda31daea161b1bc15da69f \
>                      file://Documentation/licenses/COPYING.BSD-3-Clause;m=
d5=3D58dcd8452651fc8b07d1f65ce07ca8af \
>                      file://Documentation/licenses/COPYING.BSD-4-Clause-U=
C;md5=3D263860f8968d8bafa5392cab74285262 \
>                      file://libuuid/COPYING;md5=3D6d2cafc999feb2c2de84d4d=
24b23290c \
> @@ -35,8 +37,6 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
>             file://run-ptest \
>             file://display_testname_for_subtest.patch \
>             file://avoid_parallel_tests.patch \
> -           file://0001-check-for-sys-pidfd.h.patch \
> -           file://0001-configure.ac-Improve-check-for-magic.patch \
>             "
> =20
> -SRC_URI[sha256sum] =3D "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6=
a0ecaa4c5117e84f"
> +SRC_URI[sha256sum] =3D "32b30a336cda903182ed61feb3e9b908b762a5e66fe14e43=
efb88d37162075cb"
> diff --git a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-p=
idfd.h.patch b/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-p=
idfd.h.patch
> deleted file mode 100644
> index 19f57f14bc..0000000000
> --- a/meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.=
patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 548bc568f3c735e53fb5b0a5ab6473a3f1457b91 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sun, 7 Aug 2022 14:39:19 -0700
> -Subject: [PATCH] check for sys/pidfd.h
> -
> -This header in newer glibc defines the signatures of functions
> -pidfd_send_signal() and pidfd_open() and when these functions are
> -defined by libc then we need to include the relevant header to get
> -the definitions. Clang 15+ has started to error out when function
> -signatures are missing.
> -
> -Fixes errors like
> -misc-utils/kill.c:402:6: error: call to undeclared function 'pidfd_send_=
signal'; ISO C99 and later do not support implicit function declarations [-=
Wimplicit-function-declaration]
> -        if (pidfd_send_signal(pfd, ctl->numsig, &info, 0) < 0)
> -
> -Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pul=
l/1769]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - configure.ac          | 1 +
> - include/pidfd-utils.h | 4 +++-
> - 2 files changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index a511e93de..fd7d9245f 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -342,6 +342,7 @@ AC_CHECK_HEADERS([ \
> - 	sys/mkdev.h \
> - 	sys/mount.h \
> - 	sys/param.h \
> -+	sys/pidfd.h \
> - 	sys/prctl.h \
> - 	sys/resource.h \
> - 	sys/sendfile.h \
> -diff --git a/include/pidfd-utils.h b/include/pidfd-utils.h
> -index eddede976..d9e33cbc5 100644
> ---- a/include/pidfd-utils.h
> -+++ b/include/pidfd-utils.h
> -@@ -4,8 +4,10 @@
> - #ifdef HAVE_SYS_SYSCALL_H
> - # include <sys/syscall.h>
> - # if defined(SYS_pidfd_send_signal) && defined(SYS_pidfd_open)
> -+#  ifdef HAVE_SYS_PIDFD_H
> -+#   include <sys/pidfd.h>
> -+#  endif
> - #  include <sys/types.h>
> --
> - #  ifndef HAVE_PIDFD_SEND_SIGNAL
> - static inline int pidfd_send_signal(int pidfd, int sig, siginfo_t *info,
> - 				    unsigned int flags)
> ---=20
> -2.37.1
> -
> diff --git a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Im=
prove-check-for-magic.patch b/meta/recipes-core/util-linux/util-linux/0001-=
configure.ac-Improve-check-for-magic.patch
> deleted file mode 100644
> index 00611fe578..0000000000
> --- a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-c=
heck-for-magic.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 263381ddd46eea2293c70bc811273b66bc52087b Mon Sep 17 00:00:00 2001
> -From: Mateusz Marciniec <mateuszmar2@gmail.com>
> -Date: Fri, 19 Aug 2022 14:47:49 +0200
> -Subject: [PATCH] configure.ac: Improve check for magic
> -
> -Check whether magic.h header exists before defining HAVE_MAGIC.
> -
> -Despite library availability there still can be missing header.
> -Current test doesn't cover that possibility which will lead compilation
> -to fail in case of separate sysroot.
> -
> -Upstream-Status: Backport
> -[https://github.com/util-linux/util-linux/commit/263381ddd46eea2293c70bc=
811273b66bc52087b]
> -
> -Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
> -Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ----
> - configure.ac | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index daa8f0dca..968a0daf0 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1570,8 +1570,10 @@ AC_ARG_WITH([libmagic],
> - )
> - AS_IF([test "x$with_libmagic" =3D xno], [have_magic=3Dno], [
> -   AC_CHECK_LIB([magic], [magic_open], [
> --    AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic =
present.])
> --    MAGIC_LIBS=3D"-lmagic"
> -+    AC_CHECK_HEADER(magic.h, [
> -+      AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagi=
c present.])
> -+      MAGIC_LIBS=3D"-lmagic"
> -+    ])
> -   ])
> - ])
> - AC_SUBST([MAGIC_LIBS])
> ---=20
> -2.37.1
> -
> diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.39.bb
> similarity index 100%
> rename from meta/recipes-core/util-linux/util-linux_2.38.1.bb
> rename to meta/recipes-core/util-linux/util-linux_2.39.bb
> --=20
> 2.40.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182333): https://lists.openembedded.org/g/openembedde=
d-core/message/182333
> Mute This Topic: https://lists.openembedded.org/mt/99287629/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

