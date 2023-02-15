Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4308C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 22:28:23 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.7183.1676500099912758153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 14:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ewHx18Gq;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8184D100003;
	Wed, 15 Feb 2023 22:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676500097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+QKk55VxBOGuwhnuXNdHIghhNTSG7385Bi4//2kBsw=;
	b=ewHx18Gqi3+mEN5b4G+XZ3odiiEW4LzUn+JqWsd6UPw5sn+2G0bj08aBgQ7N//KAq2XZBf
	IikqiOjSlf14EZQNgfGGLStWhkS3auCooT1oBfp2TVJpT1FUv+UgVkmxs1buD0Q5u/Bw4+
	uWm5M7t6cz0eoSi68y1KPAwozG9sX/1uEB4zxdXRqTxduf6O3hJQy03DXl0sIJ6+i0hIUA
	tbOEKFjauOmwtq8cywKrck3Io1cbPNuASrqsDHD7ih0LsHL1ZsH350j6AmveIonjgDPOgp
	MLdgg1FDn1Mej5KezlKXQSuVrfTABiDBRSJQw3DSkjzgCICNdHQ9kmfBChPwtA==
Date: Wed, 15 Feb 2023 23:28:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 1/4] dtc: version bump and add python wrapper
Message-ID: <Y+1cgctCRNo/Yaao@mail.local>
References: <20230214183101.33761-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230214183101.33761-1-twoerner@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 22:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177221

Hello,

The series caused different build failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/6713/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/6727/steps/11/logs/stdio

| /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/git/pylibfdt/../setup.py --quiet --top-builddir /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/build build_ext --build-lib=/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/build/pylibfdt
| In file included from /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/recipe-sysroot-native/usr/include/python3.11/Python.h:38,
|                  from /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/git/pylibfdt/../pylibfdt/libfdt_wrap.c:168:
| /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/recipe-sysroot-native/usr/include/python3.11/pyport.h:601:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
|   601 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
|       |  ^~~~~
| error: command '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/recipe-sysroot-native/usr/bin/i686-pokysdk-linux/i686-pokysdk-linux-gcc' failed with exit code 1
| ninja: build stopped: subcommand failed.


https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/4495/steps/11/logs/stdio

WARNING: dtc-1.7.0+gitAUTOINC+039a99414e-r0 do_package_qa: QA Issue: File /usr/lib/python3.11/site-packages/_libfdt.cpython-311-aarch64-linux-gnu.so in package dtc-pylibfdt contains reference to TMPDIR


https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/6703/steps/13/logs/stdio

| FAILED: pylibfdt/_libfdt.so
| /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/git/pylibfdt/../setup.py --quiet --top-builddir /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/build build_ext --build-lib=/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/build/pylibfdt
| In file included from /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/recipe-sysroot-native/usr/include/python3.11/Python.h:38,
|                  from /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/git/pylibfdt/../pylibfdt/libfdt_wrap.c:168:
| /home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/recipe-sysroot-native/usr/include/python3.11/pyport.h:236:10: fatal error: sys/select.h: No such file or directory
|   236 | #include <sys/select.h>
|       |          ^~~~~~~~~~~~~~
| compilation terminated.
| error: command '/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-dtc/1.7.0+gitAUTOINC+039a99414e-r0/recipe-sysroot-native/usr/bin/i686-w64-mingw32/i686-w64-mingw32-gcc' failed with exit code 1
| ninja: build stopped: subcommand failed.


https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2403/steps/12/logs/stdio

AssertionError: The following deb packages are missing or different and not in exclusion list: /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/deb/./core2-64/dtc-dbg_1.7.0+git0+039a99414e-r0_amd64.deb
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/deb/./core2-64/dtc-pylibfdt_1.7.0+git0+039a99414e-r0_amd64.deb
The following ipk packages are missing or different and not in exclusion list: /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/dtc-dbg_1.7.0+git0+039a99414e-r0_core2-64.ipk
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/dtc-pylibfdt_1.7.0+git0+039a99414e-r0_core2-64.ipk
The following rpm packages are missing or different and not in exclusion list: /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/rpm/./core2_64/dtc-dbg-1.7.0+git0+039a99414e-r0.core2_64.rpm
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/rpm/./core2_64/dtc-pylibfdt-1.7.0+git0+039a99414e-r0.core2_64.rpm




On 14/02/2023 13:30:58-0500, Trevor Woerner wrote:
> Bump the version of dtc from 1.6.1 to to 1.7.0.
> 
> Add support for building the python wrapper around libfdt.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  ...tdump-fix-Werror-int-to-pointer-cast.patch | 40 -------------------
>  meta/recipes-kernel/dtc/dtc/0001-meson.patch  | 37 +++++++++++++++++
>  .../dtc/{dtc_1.6.1.bb => dtc_1.7.0.bb}        | 18 +++++----
>  3 files changed, 48 insertions(+), 47 deletions(-)
>  delete mode 100644 meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch
>  create mode 100644 meta/recipes-kernel/dtc/dtc/0001-meson.patch
>  rename meta/recipes-kernel/dtc/{dtc_1.6.1.bb => dtc_1.7.0.bb} (51%)
> 
> diff --git a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch b/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch
> deleted file mode 100644
> index 4c3e34b1ffd2..000000000000
> --- a/meta/recipes-kernel/dtc/dtc/0001-fdtdump-fix-Werror-int-to-pointer-cast.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -Fix the build of fdtdump with mingw.
> -
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
> -From ae0ce1fa7f4d679b5f8df1fc0e797246e43547fe Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
> -Date: Wed, 25 Aug 2021 16:13:50 +0400
> -Subject: [PATCH] fdtdump: fix -Werror=int-to-pointer-cast
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -With mingw64-gcc, the compiler complains with various warnings:
> -error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> -
> -Signed-off-by: Marc-Andr� Lureau <marcandre.lureau@redhat.com>
> -Message-Id: <20210825121350.213551-1-marcandre.lureau@redhat.com>
> -Acked-by: Rob Herring <robh@kernel.org>
> -Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ----
> - fdtdump.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/fdtdump.c b/fdtdump.c
> -index d9fb374..483f367 100644
> ---- a/fdtdump.c
> -+++ b/fdtdump.c
> -@@ -21,7 +21,7 @@
> - #define MAX_VERSION 17
> - 
> - #define ALIGN(x, a)	(((x) + ((a) - 1)) & ~((a) - 1))
> --#define PALIGN(p, a)	((void *)(ALIGN((unsigned long)(p), (a))))
> -+#define PALIGN(p, a)	((void *)(ALIGN((uintptr_t)(p), (a))))
> - #define GET_CELL(p)	(p += 4, *((const fdt32_t *)(p-4)))
> - 
> - static const char *tagname(uint32_t tag)
> --- 
> -2.25.1
> -
> diff --git a/meta/recipes-kernel/dtc/dtc/0001-meson.patch b/meta/recipes-kernel/dtc/dtc/0001-meson.patch
> new file mode 100644
> index 000000000000..10c4f8706194
> --- /dev/null
> +++ b/meta/recipes-kernel/dtc/dtc/0001-meson.patch
> @@ -0,0 +1,37 @@
> +From faa02d4a60859089017bf92e0e3f49d600c44d73 Mon Sep 17 00:00:00 2001
> +From: Trevor Woerner <twoerner@gmail.com>
> +Date: Sun, 12 Feb 2023 14:37:04 -0500
> +Subject: [PATCH] allow pylibfdt in cross
> +
> +Allow pylibfdt to be built even in cross-development scenarios.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> +---
> + meson.build | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index b23ea1b159b2..34a21a6dc783 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -118,11 +118,11 @@ if get_option('tools')
> +   )
> + endif
> + 
> +-if not meson.is_cross_build()
> +-  if py.found() and swig.found()
> +-    subdir('pylibfdt')
> +-  endif
> ++if py.found() and swig.found()
> ++  subdir('pylibfdt')
> ++endif
> + 
> ++if not meson.is_cross_build()
> +   if get_option('tools')
> +     subdir('tests')
> +   endif
> +-- 
> +2.36.0.rc2.17.g4027e30c53
> +
> diff --git a/meta/recipes-kernel/dtc/dtc_1.6.1.bb b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
> similarity index 51%
> rename from meta/recipes-kernel/dtc/dtc_1.6.1.bb
> rename to meta/recipes-kernel/dtc/dtc_1.7.0.bb
> index 2a6ac089a338..445bf54f8581 100644
> --- a/meta/recipes-kernel/dtc/dtc_1.6.1.bb
> +++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
> @@ -1,15 +1,18 @@
>  SUMMARY = "Device Tree Compiler"
>  HOMEPAGE = "https://devicetree.org/"
> -DESCRIPTION = "The Device Tree Compiler is a tool used to manipulate the Open-Firmware-like device tree used by PowerPC kernels."
> +DESCRIPTION = "The Device Tree Compiler is a toolchain for working with device tree source and binary files."
> +DEPENDS = "bison-native python3-setuptools-scm-native swig-native libyaml"
>  SECTION = "bootloader"
>  LICENSE = "GPL-2.0-only | BSD-2-Clause"
>  
>  LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
> +                    file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
> +                    file://README.license;md5=a1eb22e37f09df5b5511b8a278992d0e"
>  
>  SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master \
> -           file://0001-fdtdump-fix-Werror-int-to-pointer-cast.patch"
> -SRCREV = "b6910bec11614980a21e46fbccc35934b671bd81"
> +           file://0001-meson.patch"
> +PV = "1.7.0+git${SRCPV}"
> +SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
>  
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>  
> @@ -17,14 +20,15 @@ S = "${WORKDIR}/git"
>  
>  inherit meson pkgconfig
>  
> -EXTRA_OEMESON = "-Dpython=disabled -Dvalgrind=disabled"
> +EXTRA_OEMESON = "-Dvalgrind=disabled"
>  
>  PACKAGECONFIG ??= "tools"
> -PACKAGECONFIG[tools] = "-Dtools=true,-Dtools=false,flex-native bison-native"
> +PACKAGECONFIG[tools] = "-Dtools=true,-Dtools=false,flex-native"
>  PACKAGECONFIG[yaml] = "-Dyaml=enabled,-Dyaml=disabled,libyaml"
>  
> -PACKAGES =+ "${PN}-misc"
> +PACKAGES =+ "${PN}-misc ${PN}-pylibfdt"
>  FILES:${PN}-misc = "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}/dtdiff"
> +FILES:${PN}-pylibfdt = "${PYTHON_SITEPACKAGES_DIR}"
>  RDEPENDS:${PN}-misc += "${@bb.utils.contains('PACKAGECONFIG', 'tools', 'bash diffutils', '', d)}"
>  
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.36.0.rc2.17.g4027e30c53
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177170): https://lists.openembedded.org/g/openembedded-core/message/177170
> Mute This Topic: https://lists.openembedded.org/mt/96966808/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

