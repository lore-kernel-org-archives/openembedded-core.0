Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 658357017B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 23:47:13 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id y139-v6so138650wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 16:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jXbkXnCQkxSz1d5gGQsFbmq8R109LOSP+eliSP9/Ibk=;
	b=n6nY+Utyn/nhaYK4uGsG33FwLfFHcQQ0y0eiSju7pI+0Wp3uP5No+F+yGtC9naw+C7
	JGEWSqrG4nhQT/WYKCTs2HBffd2E6bM7il4IMnVmvtbNq7VABs47MGkuXGCE/9qlWQvb
	7W2zhxjRrJ6ygYH3oAHGY5eOxC0IO5oSMyBc8RuQGylh481idtJrvLIMB1z/MsvdMium
	eAfc+fC4lmiMg+ukVPrNiifR4nFcxy2W0HgsVrrRn4iC/m9DZv5Srv52CEXZCuf2WzdR
	IFD27jv7htH6qzibzlPRvd1i4RQK0SRjju+Bc4hHacTXBDZYxgj0MGF6rA/bqz0DItM0
	sfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jXbkXnCQkxSz1d5gGQsFbmq8R109LOSP+eliSP9/Ibk=;
	b=hte7HBUUUnkG2tv765XjEWiQZPYu034xus0stu3zwfCcO+7CYwuy+uBzxQvnz4/x7q
	qQbKtAPMr7z/rTIXAkZ7mkFBNPwsCzxsWd3R/Re8kyWc/XMjfAcLt3TgRHfYBhbngxAV
	uQumSV63W2uhZ/W31Ms2u6CTZ0JzwQ1Y24vnUN+skSCsoxC7HGszlljTL4TV+HrqZ7NC
	zaqyhQEuPg1IFlZqY6lsXZvzmfMTbZsZVJ5nWtGvVo+0JNpFj4wsPZAGJY4Ralkeu38x
	th3/SXA16Q8DGJ1oh/PxZ3CHiXon+AALahJyAjTWwsBzzA/tQPsrkNC/Dhvn8W7J57zm
	X1Gg==
X-Gm-Message-State: APzg51CfcCJgSN62Bw7zKA+TAd85MZxBffkwqiknkQHkdMPytIUrKNq4
	f38Un/XUGLRjigSqCsx2+f+UiIeIR1I78sKC05ZHFGZN
X-Google-Smtp-Source: ANB0VdZNFI191LgMxKkjlDo8vRqT4hT3upGolPv3JWHg43hc/B1xM8nDDXZeI9jfFkTmJ3WIRZKd2mberXfUtiIeTwQ=
X-Received: by 2002:a1c:8f0e:: with SMTP id r14-v6mr133891wmd.79.1535586433855;
	Wed, 29 Aug 2018 16:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <1535434045-243085-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1535434045-243085-1-git-send-email-changqing.li@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 30 Aug 2018 01:47:02 +0200
Message-ID: <CA+chaQe_aCKVNZnxJbpTibeBYnxTePVbFo=sTC2K=b_ZFYBpkg@mail.gmail.com>
To: changqing.li@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libjpeg-turbo: Upgrade 1.5.3 -> 2.0.0
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
X-List-Received-Date: Wed, 29 Aug 2018 23:47:13 -0000
Content-Type: multipart/alternative; boundary="000000000000e9758705749b93d9"

--000000000000e9758705749b93d9
Content-Type: text/plain; charset="UTF-8"

This change is breaking spice build and might break some other components
as well.

It was discussed in 2008 here:
https://bugzilla.redhat.com/show_bug.cgi?id=427616

And now HAVE_STDLIB_H is here again with the upgrade from 1.5.3 to 2.0

spice-native fails like this:
| In file included from ../../git/spice-common/common/mem.h:27:0, | from
../../git/spice-common/common/marshaller.h:25, | from
../../git/server/red-common.h:30, | from
../../git/server/jpeg-encoder.c:24: | ../config.h:65:0: error:
"HAVE_STDLIB_H" redefined [-Werror] | #define HAVE_STDLIB_H 1 | | In file
included
fromx86_64-linux/spice-native/0.14.0+gitAUTOINC+f1050bfc76_95743f40a2-r0/recipe-sysroot-native/usr/include/jpeglib.h:29:0,
| from ../../git/server/jpeg-encoder.c:22:
|x86_64-linux/spice-native/0.14.0+gitAUTOINC+f1050bfc76_95743f40a2-r0/recipe-sysroot-native/usr/include/jconfig.h:42:0:
note: this is the location of the previous definition | #define
HAVE_STDLIB_H

It used to define it with 1 to match the rest of the world, here is the
relevant part of jconfig.h diff between 1.5.3 and 2.0.0:

@@ -28,43 +33,37 @@
 #define BITS_IN_JSAMPLE  8      /* use 8 or 12 */



 /* Define to 1 if you have the <locale.h> header file. */


-#define HAVE_LOCALE_H 1
+#define HAVE_LOCALE_H



 /* Define to 1 if you have the <stddef.h> header file. */


-#define HAVE_STDDEF_H 1
+#define HAVE_STDDEF_H



 /* Define to 1 if you have the <stdlib.h> header file. */
-#define HAVE_STDLIB_H 1
+#define HAVE_STDLIB_H
+
+/* Define if you need to include <sys/types.h> to get size_t. */
+#define NEED_SYS_TYPES_H
+

Can you check why it was redefined like this and if we can change it back?

On Tue, Aug 28, 2018 at 7:27 AM <changqing.li@windriver.com> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> License-Update: Copyright Year Update
>
> 1. Upgrade from 1.5.3 -> 2.0.0, change from autools to cmake
> 2. Add a patch for fix package qa error
> 3. remove --with-build-date since 2.0.0 not support config build date
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../0001-libjpeg-turbo-fix-package_qa-error.patch  | 32
> ++++++++++++++++++++++
>  ...bjpeg-turbo_1.5.3.bb => libjpeg-turbo_2.0.0.bb} | 29
> ++++++++------------
>  2 files changed, 43 insertions(+), 18 deletions(-)
>  create mode 100644
> meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
>  rename meta/recipes-graphics/jpeg/{libjpeg-turbo_1.5.3.bb =>
> libjpeg-turbo_2.0.0.bb} (61%)
>
> diff --git
> a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
> b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
> new file mode 100644
> index 0000000..44c2c76
> --- /dev/null
> +++
> b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
> @@ -0,0 +1,32 @@
> +From 0a24f03a67425a7b58b3fd40d965c0c9801ae7a1 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Mon, 27 Aug 2018 16:10:55 +0800
> +Subject: [PATCH] libjpeg-turbo: fix package_qa error
> +
> +Fix package qa errors like below:
> +libjpeg.so.62.3.0 contains probably-redundant RPATH /usr/lib
> [useless-rpaths]
> +usr/bin/cjpeg contains probably-redundant RPATH /usr/lib
> +
> +Upstream-Status: Inappropriate[oe-specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + CMakeLists.txt | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 1719522..682cef1 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -109,8 +109,6 @@ endif()
> +
> + include(cmakescripts/GNUInstallDirs.cmake)
> +
> +-set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})
> +-
> + macro(report_directory var)
> +   if(CMAKE_INSTALL_${var} STREQUAL CMAKE_INSTALL_FULL_${var})
> +     message(STATUS "CMAKE_INSTALL_${var} = ${CMAKE_INSTALL_${var}}")
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
> b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
> similarity index 61%
> rename from meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
> rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
> index 6be6aa5..7737a59 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
> @@ -4,16 +4,17 @@ HOMEPAGE = "http://libjpeg-turbo.org/"
>
>  LICENSE = "BSD-3-Clause"
>  LIC_FILES_CHKSUM =
> "file://cdjpeg.h;endline=13;md5=8184bcc7c4ac7b9edc6a7bc00f231d0b \
> -
> file://jpeglib.h;endline=16;md5=f67d70e547a2662c079781c72f877f72 \
> +
> file://jpeglib.h;endline=16;md5=7ea97dc83b0f59052ee837e61ef0e08f \
>
>  file://djpeg.c;endline=11;md5=c59e19811c006cb38f82d6477134d314 \
>  "
>  DEPENDS_append_x86-64_class-target = " nasm-native"
>  DEPENDS_append_x86_class-target    = " nasm-native"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
> +           file://0001-libjpeg-turbo-fix-package_qa-error.patch"
>
> -SRC_URI[md5sum] = "7c82f0f6a3130ec06b8a4d0b321cbca3"
> -SRC_URI[sha256sum] =
> "b24890e2bb46e12e72a79f7e965f409f4e16466d00e1dd15d93d73ee6b592523"
> +SRC_URI[md5sum] = "b12a3fcf1d078db38410f27718a91b83"
> +SRC_URI[sha256sum] =
> "778876105d0d316203c928fd2a0374c8c01f755d0a00b12a1c8934aeccff8868"
>  UPSTREAM_CHECK_URI = "
> http://sourceforge.net/projects/libjpeg-turbo/files/"
>  UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
>
> @@ -25,32 +26,24 @@ RPROVIDES_${PN} += "jpeg"
>  RREPLACES_${PN} += "jpeg"
>  RCONFLICTS_${PN} += "jpeg"
>
> -inherit autotools pkgconfig
> +inherit cmake pkgconfig
>
>  # Add nasm-native dependency consistently for all build arches is hard
> -EXTRA_OECONF_append_class-native = " --without-simd"
> +EXTRA_OECMAKE_append_class-native = " -DWITH_SIMD=False"
>
>  # Work around missing x32 ABI support
> -EXTRA_OECONF_append_class-target = "
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--without-simd", "", d)}"
> +EXTRA_OECMAKE_append_class-target = "
> ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-DWITH_SIMD=False", "", d)}"
>
>  # Work around missing non-floating point ABI support in MIPS
> -EXTRA_OECONF_append_class-target = "
> ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "--without-simd", "", d)}"
> +EXTRA_OECMAKE_append_class-target = "
> ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "-DWITH_SIMD=False", "", d)}"
>
>  # Provide a workaround if Altivec unit is not present in PPC
> -EXTRA_OECONF_append_class-target_powerpc = "
> ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
> -EXTRA_OECONF_append_class-target_powerpc64 = "
> ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
> +EXTRA_OECMAKE_append_class-target_powerpc = "
> ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False",
> d)}"
> +EXTRA_OECMAKE_append_class-target_powerpc64 = "
> ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "-DWITH_SIMD=False",
> d)}"
>
>  DEBUG_OPTIMIZATION_append_armv4 = " ${@bb.utils.contains('TUNE_CCARGS',
> '-mthumb', '-fomit-frame-pointer', '', d)}"
>  DEBUG_OPTIMIZATION_append_armv5 = " ${@bb.utils.contains('TUNE_CCARGS',
> '-mthumb', '-fomit-frame-pointer', '', d)}"
>
> -def get_build_time(d):
> -    if d.getVar('SOURCE_DATE_EPOCH') != None:
> -        import datetime
> -        return " --with-build-date="+
> datetime.datetime.utcfromtimestamp(float(d.getVar('SOURCE_DATE_EPOCH'))).strftime("%Y%m%d")
> -    return ""
> -
> -EXTRA_OECONF_append_class-target = "${@get_build_time(d)}"
> -
>  PACKAGES =+ "jpeg-tools libturbojpeg"
>
>  DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs
> to access libjpeg functionality.  These tools allow for the compression,
> decompression, transformation and display of JPEG files and benchmarking of
> the libjpeg library."
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e9758705749b93d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This change is breaking spice build and might break some o=
ther components as well.<div><br></div><div>It was discussed in 2008 here:<=
/div><div><a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D427616">=
https://bugzilla.redhat.com/show_bug.cgi?id=3D427616</a><br></div><div><br>=
</div><div>And now=C2=A0<span style=3D"color:rgb(0,0,0);white-space:pre-wra=
p">HAVE_STDLIB_H is here again with the upgrade from 1.5.3 to 2.0</span></d=
iv><div><span style=3D"color:rgb(0,0,0);white-space:pre-wrap"><br></span></=
div><div><span style=3D"color:rgb(0,0,0);white-space:pre-wrap">spice-native=
 fails like this:</span></div><div><font color=3D"#000000"><span style=3D"w=
hite-space:pre-wrap">| In file included from ../../git/spice-common/common/=
mem.h:27:0,                                                                =
                                           =20
|                  from ../../git/spice-common/common/marshaller.h:25,
|                  from ../../git/server/red-common.h:30,                  =
                                                                           =
                      =20
|                  from ../../git/server/jpeg-encoder.c:24:
| ../config.h:65:0: error: &quot;HAVE_STDLIB_H&quot; redefined [-Werror]   =
                                                                           =
                                =20
|  #define HAVE_STDLIB_H 1   =20
|                                                                          =
                                                                           =
                      =20
| In file included fromx86_64-linux/spice-native/0.14.0+gitAUTOINC+f1050bfc=
76_95743f40a2-r0/recipe-sysroot-native/usr/include/jpeglib.h:29:0,         =
                                                                           =
                                                                      =20
|                  from ../../git/server/jpeg-encoder.c:22:
|x86_64-linux/spice-native/0.14.0+gitAUTOINC+f1050bfc76_95743f40a2-r0/recip=
e-sysroot-native/usr/include/jconfig.h:42:0: note: this is the location of =
the previous definition
|  #define HAVE_STDLIB_H                               </span></font><br></=
div><div><font color=3D"#000000"><span style=3D"white-space:pre-wrap"><br><=
/span></font></div><div><font color=3D"#000000"><span style=3D"white-space:=
pre-wrap">It used to define it with 1 to match the rest of the world, here =
is the relevant part of jconfig.h diff between 1.5.3 and 2.0.0:</span></fon=
t></div><div><font color=3D"#000000"><span style=3D"white-space:pre-wrap"><=
br></span></font></div><div><font color=3D"#000000"><div><span style=3D"whi=
te-space:pre-wrap">@@ -28,43 +33,37 @@=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0</span></div><div><span style=3D"white-space:pre-wrap">=C2=A0#define =
BITS_IN_JSAMPLE=C2=A0 8=C2=A0 =C2=A0 =C2=A0 /* use 8 or 12 */=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span></div><div><span=
 style=3D"white-space:pre-wrap">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</span>=
</div><div><span style=3D"white-space:pre-wrap">=C2=A0/* Define to 1 if you=
 have the &lt;locale.h&gt; header file. */=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0</span></div><div><span style=3D"white-space:pre-wrap">-#define HAVE_=
LOCALE_H 1=C2=A0 =C2=A0 =C2=A0=C2=A0</span></div><div><span style=3D"white-=
space:pre-wrap">+#define HAVE_LOCALE_H=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span></div><div><s=
pan style=3D"white-space:pre-wrap">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</s=
pan></div><div><span style=3D"white-space:pre-wrap">=C2=A0/* Define to 1 if=
 you have the &lt;stddef.h&gt; header file. */=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0</span></div><div><span style=3D"white-space:pre-wrap">-#define H=
AVE_STDDEF_H 1=C2=A0 =C2=A0 =C2=A0=C2=A0</span></div><div><span style=3D"wh=
ite-space:pre-wrap">+#define HAVE_STDDEF_H=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span></div><di=
v><span style=3D"white-space:pre-wrap">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=
</span></div><div><span style=3D"white-space:pre-wrap">=C2=A0/* Define to 1=
 if you have the &lt;stdlib.h&gt; header file. */</span></div><div><span st=
yle=3D"white-space:pre-wrap">-#define HAVE_STDLIB_H 1</span></div><div><spa=
n style=3D"white-space:pre-wrap">+#define HAVE_STDLIB_H</span></div><div><s=
pan style=3D"white-space:pre-wrap">+</span></div><div><span style=3D"white-=
space:pre-wrap">+/* Define if you need to include &lt;sys/types.h&gt; to ge=
t size_t. */</span></div><div><span style=3D"white-space:pre-wrap">+#define=
 NEED_SYS_TYPES_H</span></div><div><span style=3D"white-space:pre-wrap">+</=
span></div><div style=3D"white-space:pre-wrap"><br></div><div style=3D"whit=
e-space:pre-wrap">Can you check why it was redefined like this and if we ca=
n change it back?</div></font></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr">On Tue, Aug 28, 2018 at 7:27 AM &lt;<a href=3D"mailto:changq=
ing.li@windriver.com">changqing.li@windriver.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">From: Changqing Li &lt;<a href=3D"mailto:chang=
qing.li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;=
<br>
<br>
License-Update: Copyright Year Update<br>
<br>
1. Upgrade from 1.5.3 -&gt; 2.0.0, change from autools to cmake<br>
2. Add a patch for fix package qa error<br>
3. remove --with-build-date since 2.0.0 not support config build date<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../0001-libjpeg-turbo-fix-package_qa-error.patch=C2=A0 | 32 ++++++++=
++++++++++++++<br>
=C2=A0...<a href=3D"http://bjpeg-turbo_1.5.3.bb" rel=3D"noreferrer" target=
=3D"_blank">bjpeg-turbo_1.5.3.bb</a> =3D&gt; <a href=3D"http://libjpeg-turb=
o_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">libjpeg-turbo_2.0.0.bb</a>=
} | 29 ++++++++------------<br>
=C2=A02 files changed, 43 insertions(+), 18 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/jpeg/files/0001-libjpeg-turb=
o-fix-package_qa-error.patch<br>
=C2=A0rename meta/recipes-graphics/jpeg/{<a href=3D"http://libjpeg-turbo_1.=
5.3.bb" rel=3D"noreferrer" target=3D"_blank">libjpeg-turbo_1.5.3.bb</a> =3D=
&gt; <a href=3D"http://libjpeg-turbo_2.0.0.bb" rel=3D"noreferrer" target=3D=
"_blank">libjpeg-turbo_2.0.0.bb</a>} (61%)<br>
<br>
diff --git a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-packag=
e_qa-error.patch b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-=
package_qa-error.patch<br>
new file mode 100644<br>
index 0000000..44c2c76<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-er=
ror.patch<br>
@@ -0,0 +1,32 @@<br>
+From 0a24f03a67425a7b58b3fd40d965c0c9801ae7a1 Mon Sep 17 00:00:00 2001<br>
+From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targe=
t=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+Date: Mon, 27 Aug 2018 16:10:55 +0800<br>
+Subject: [PATCH] libjpeg-turbo: fix package_qa error<br>
+<br>
+Fix package qa errors like below:<br>
+libjpeg.so.62.3.0 contains probably-redundant RPATH /usr/lib [useless-rpat=
hs]<br>
+usr/bin/cjpeg contains probably-redundant RPATH /usr/lib<br>
+<br>
+Upstream-Status: Inappropriate[oe-specific]<br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ CMakeLists.txt | 2 --<br>
+ 1 file changed, 2 deletions(-)<br>
+<br>
+diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
+index 1719522..682cef1 100644<br>
+--- a/CMakeLists.txt<br>
++++ b/CMakeLists.txt<br>
+@@ -109,8 +109,6 @@ endif()<br>
+ <br>
+ include(cmakescripts/GNUInstallDirs.cmake)<br>
+ <br>
+-set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})<br>
+-<br>
+ macro(report_directory var)<br>
+=C2=A0 =C2=A0if(CMAKE_INSTALL_${var} STREQUAL CMAKE_INSTALL_FULL_${var})<b=
r>
+=C2=A0 =C2=A0 =C2=A0message(STATUS &quot;CMAKE_INSTALL_${var} =3D ${CMAKE_=
INSTALL_${var}}&quot;)<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-graphics/jpeg/<a href=3D"http://libjpeg-turbo_1.5=
.3.bb" rel=3D"noreferrer" target=3D"_blank">libjpeg-turbo_1.5.3.bb</a> b/me=
ta/recipes-graphics/jpeg/<a href=3D"http://libjpeg-turbo_2.0.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libjpeg-turbo_2.0.0.bb</a><br>
similarity index 61%<br>
rename from meta/recipes-graphics/jpeg/<a href=3D"http://libjpeg-turbo_1.5.=
3.bb" rel=3D"noreferrer" target=3D"_blank">libjpeg-turbo_1.5.3.bb</a><br>
rename to meta/recipes-graphics/jpeg/<a href=3D"http://libjpeg-turbo_2.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">libjpeg-turbo_2.0.0.bb</a><br>
index 6be6aa5..7737a59 100644<br>
--- a/meta/recipes-graphics/jpeg/<a href=3D"http://libjpeg-turbo_1.5.3.bb" =
rel=3D"noreferrer" target=3D"_blank">libjpeg-turbo_1.5.3.bb</a><br>
+++ b/meta/recipes-graphics/jpeg/<a href=3D"http://libjpeg-turbo_2.0.0.bb" =
rel=3D"noreferrer" target=3D"_blank">libjpeg-turbo_2.0.0.bb</a><br>
@@ -4,16 +4,17 @@ HOMEPAGE =3D &quot;<a href=3D"http://libjpeg-turbo.org/" =
rel=3D"noreferrer" target=3D"_blank">http://libjpeg-turbo.org/</a>&quot;<br=
>
<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://cdjpeg.h;endline=3D13;md5=3D8184bcc=
7c4ac7b9edc6a7bc00f231d0b \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://jpeglib.h;endline=3D16;md5=3Df67d70e547a2662c079781c72f877f72 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://jpeglib.h;endline=3D16;md5=3D7ea97dc83b0f59052ee837e61ef0e08f \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://djpeg.c;endline=3D11;md5=3Dc59e19811c006cb38f82d6477134d314 \<br>
=C2=A0&quot;<br>
=C2=A0DEPENDS_append_x86-64_class-target =3D &quot; nasm-native&quot;<br>
=C2=A0DEPENDS_append_x86_class-target=C2=A0 =C2=A0 =3D &quot; nasm-native&q=
uot;<br>
<br>
-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz&quot;<b=
r>
+SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-libjpeg-turbo-fix-pac=
kage_qa-error.patch&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;7c82f0f6a3130ec06b8a4d0b321cbca3&quot;<br>
-SRC_URI[sha256sum] =3D &quot;b24890e2bb46e12e72a79f7e965f409f4e16466d00e1d=
d15d93d73ee6b592523&quot;<br>
+SRC_URI[md5sum] =3D &quot;b12a3fcf1d078db38410f27718a91b83&quot;<br>
+SRC_URI[sha256sum] =3D &quot;778876105d0d316203c928fd2a0374c8c01f755d0a00b=
12a1c8934aeccff8868&quot;<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://sourceforge.net/projec=
ts/libjpeg-turbo/files/" rel=3D"noreferrer" target=3D"_blank">http://source=
forge.net/projects/libjpeg-turbo/files/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;/libjpeg-turbo/files/(?P&lt;pver&gt;(\=
d+[\.\-_]*)+)/&quot;<br>
<br>
@@ -25,32 +26,24 @@ RPROVIDES_${PN} +=3D &quot;jpeg&quot;<br>
=C2=A0RREPLACES_${PN} +=3D &quot;jpeg&quot;<br>
=C2=A0RCONFLICTS_${PN} +=3D &quot;jpeg&quot;<br>
<br>
-inherit autotools pkgconfig<br>
+inherit cmake pkgconfig<br>
<br>
=C2=A0# Add nasm-native dependency consistently for all build arches is har=
d<br>
-EXTRA_OECONF_append_class-native =3D &quot; --without-simd&quot;<br>
+EXTRA_OECMAKE_append_class-native =3D &quot; -DWITH_SIMD=3DFalse&quot;<br>
<br>
=C2=A0# Work around missing x32 ABI support<br>
-EXTRA_OECONF_append_class-target =3D &quot; ${@bb.utils.contains(&quot;TUN=
E_FEATURES&quot;, &quot;mx32&quot;, &quot;--without-simd&quot;, &quot;&quot=
;, d)}&quot;<br>
+EXTRA_OECMAKE_append_class-target =3D &quot; ${@bb.utils.contains(&quot;TU=
NE_FEATURES&quot;, &quot;mx32&quot;, &quot;-DWITH_SIMD=3DFalse&quot;, &quot=
;&quot;, d)}&quot;<br>
<br>
=C2=A0# Work around missing non-floating point ABI support in MIPS<br>
-EXTRA_OECONF_append_class-target =3D &quot; ${@bb.utils.contains(&quot;MIP=
SPKGSFX_FPU&quot;, &quot;-nf&quot;, &quot;--without-simd&quot;, &quot;&quot=
;, d)}&quot;<br>
+EXTRA_OECMAKE_append_class-target =3D &quot; ${@bb.utils.contains(&quot;MI=
PSPKGSFX_FPU&quot;, &quot;-nf&quot;, &quot;-DWITH_SIMD=3DFalse&quot;, &quot=
;&quot;, d)}&quot;<br>
<br>
=C2=A0# Provide a workaround if Altivec unit is not present in PPC<br>
-EXTRA_OECONF_append_class-target_powerpc =3D &quot; ${@bb.utils.contains(&=
quot;TUNE_FEATURES&quot;, &quot;altivec&quot;, &quot;&quot;, &quot;--withou=
t-simd&quot;, d)}&quot;<br>
-EXTRA_OECONF_append_class-target_powerpc64 =3D &quot; ${@bb.utils.contains=
(&quot;TUNE_FEATURES&quot;, &quot;altivec&quot;, &quot;&quot;, &quot;--with=
out-simd&quot;, d)}&quot;<br>
+EXTRA_OECMAKE_append_class-target_powerpc =3D &quot; ${@bb.utils.contains(=
&quot;TUNE_FEATURES&quot;, &quot;altivec&quot;, &quot;&quot;, &quot;-DWITH_=
SIMD=3DFalse&quot;, d)}&quot;<br>
+EXTRA_OECMAKE_append_class-target_powerpc64 =3D &quot; ${@bb.utils.contain=
s(&quot;TUNE_FEATURES&quot;, &quot;altivec&quot;, &quot;&quot;, &quot;-DWIT=
H_SIMD=3DFalse&quot;, d)}&quot;<br>
<br>
=C2=A0DEBUG_OPTIMIZATION_append_armv4 =3D &quot; ${@bb.utils.contains(&#39;=
TUNE_CCARGS&#39;, &#39;-mthumb&#39;, &#39;-fomit-frame-pointer&#39;, &#39;&=
#39;, d)}&quot;<br>
=C2=A0DEBUG_OPTIMIZATION_append_armv5 =3D &quot; ${@bb.utils.contains(&#39;=
TUNE_CCARGS&#39;, &#39;-mthumb&#39;, &#39;-fomit-frame-pointer&#39;, &#39;&=
#39;, d)}&quot;<br>
<br>
-def get_build_time(d):<br>
-=C2=A0 =C2=A0 if d.getVar(&#39;SOURCE_DATE_EPOCH&#39;) !=3D None:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 import datetime<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot; --with-build-date=3D&quot;+ date=
time.datetime.utcfromtimestamp(float(d.getVar(&#39;SOURCE_DATE_EPOCH&#39;))=
).strftime(&quot;%Y%m%d&quot;)<br>
-=C2=A0 =C2=A0 return &quot;&quot;<br>
-<br>
-EXTRA_OECONF_append_class-target =3D &quot;${@get_build_time(d)}&quot;<br>
-<br>
=C2=A0PACKAGES =3D+ &quot;jpeg-tools libturbojpeg&quot;<br>
<br>
=C2=A0DESCRIPTION_jpeg-tools =3D &quot;The jpeg-tools package includes clie=
nt programs to access libjpeg functionality.=C2=A0 These tools allow for th=
e compression, decompression, transformation and display of JPEG files and =
benchmarking of the libjpeg library.&quot;<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000e9758705749b93d9--
