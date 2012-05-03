Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1SPoCQ-0005zs-4m
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 07:03:30 +0200
Received: by eaae1 with SMTP id e1so324730eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 21:53:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:x-originating-ip:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=1UMZ6fisqhRfRtZyYtOLfE/aP4CKUiV4pq01Ec7htPQ=;
	b=OR6GWFJgV+rYBgPf68kZeO/yD2UHKubhNN+DuNBZRF7hUEG2qGy7zvuZz1WHvFnYbR
	HtDTxsDuhTdyQ3HvgYyFWrKfiYlT41fsOZVGHvynhIRCzzEqYSl7U773PV2uQFSPpOCg
	TgscMZQJQEAjfUx3LRUTLIWYfI2oY6El2T1TwagrchAQ/cRc9DvIxUkGrEzs6Nh8BLbu
	VgN63EhfzdkfibfpFb9eMQ4LSct7xmUjce9eUJkcsbM4avBqxUON5oJQ5WQIb6tfABeT
	CquhDvTuU+V8IEUBcR8f9AaGKLmHkKaJ7t5fJEai/JLTDPR46+BwLEZRVvje4u3GrQzp
	l9CQ==
Received: by 10.14.187.1 with SMTP id x1mr96367eem.101.1336020824398; Wed, 02
	May 2012 21:53:44 -0700 (PDT)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.213.99.138 with HTTP; Wed, 2 May 2012 21:53:23 -0700 (PDT)
X-Originating-IP: [93.81.194.70]
In-Reply-To: <e8d5425f8ca14a0c0b7378a9202fd4c72761ea12.1335991900.git.raj.khem@gmail.com>
References: <cover.1335991900.git.raj.khem@gmail.com>
	<0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
	<e8d5425f8ca14a0c0b7378a9202fd4c72761ea12.1335991900.git.raj.khem@gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Thu, 3 May 2012 08:53:23 +0400
X-Google-Sender-Auth: -frkiq_2Kx4MKFc_x6mfdx-QhQY
Message-ID: <CAJG6M_NudM-_bL+Zp9CBkFGHqjnjRB1rQvNZz+FLnPA7aqrUYA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlO5zJ3Cy3ZluZznaPzv9SWs/5uC8iBAhYA19g9oQhWq4srdhC1OuFfz6x8RQIkwq0LPhOL
Subject: Re: [PATCH 7/7] Enable PARALLEL_MAKE for testing
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
X-List-Received-Date: Thu, 03 May 2012 05:03:30 -0000
Content-Type: multipart/alternative; boundary=bcaec517a774a69b7204bf1a9636

--bcaec517a774a69b7204bf1a9636
Content-Type: text/plain; charset=ISO-8859-1

Please remove following recipes from this list:
meta/recipes-core/eggdbus/eggdbus_0.6.bb
.../net-tools/net-tools_1.60-23.bb

I've seen failures on them with -j64 iirc.

2012/5/3 Khem Raj <raj.khem@gmail.com>

> From: Yuri Bushmelev <jay4mail@gmail.com>
>
> Signed-off-by: Yuri Bushmelev <jay4mail@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-bsp/pciutils/pciutils_3.1.9.bb        |    1 -
>  meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 -
>  meta/recipes-connectivity/iproute2/iproute2.inc    |    1 -
>  .../nfs-utils/nfs-utils_1.2.3.bb                   |    1 -
>  meta/recipes-core/eggdbus/eggdbus_0.6.bb           |    1 -
>  meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    1 -
>  meta/recipes-extended/groff/groff_1.20.1.bb        |    1 -
>  meta/recipes-extended/mailx/mailx_12.5.bb          |    1 -
>  .../net-tools/net-tools_1.60-23.bb                 |    1 -
>  meta/recipes-extended/sat-solver/sat-solver_git.bb |    1 -
>  .../fontconfig/fontconfig_2.8.0.bb                 |    1 -
>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    1 -
>  meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb  |    1 -
>  meta/recipes-graphics/xcb/xcb-util.inc             |    1 -
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 -
>  meta/recipes-multimedia/speex/speex_1.2rc1.bb      |    1 -
>  meta/recipes-support/icu/icu-3.6.inc               |    1 -
>  meta/recipes-support/libpcre/libpcre_8.21.bb       |    1 -
>  18 files changed, 0 insertions(+), 18 deletions(-)
>
> diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.9.bbb/meta/recipes-bsp/pciutils/
> pciutils_3.1.9.bb
> index 2c969d9..83c040d 100644
> --- a/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
> +++ b/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
> @@ -21,7 +21,6 @@ SRC_URI =
> "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
>  SRC_URI[md5sum] = "79cc1d0bff8603d3a550fa63802cd1db"
>  SRC_URI[sha256sum] =
> "e4ce5d56ae4a9611d51ba0cc2ea45806f9539a18aceb4aa70b8ded50f6923c4f"
>
> -PARALLEL_MAKE = ""
>
>  PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes"
>
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> index c0c1d0c..f303145 100644
> --- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> +++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> @@ -23,7 +23,6 @@ LD = "${CC}"
>  CFLAGS =+ "-I${S}/src"
>  CFLAGS =+ "-DPCMCIAUTILS_VERSION=\'${PV}\'"
>
> -PARALLEL_MAKE = ""
>  EXTRA_OEMAKE = "-e 'STRIP=echo' 'LIB_OBJS=-lc -lsysfs' 'LEX=flex'"
>
>  do_install () {
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
> b/meta/recipes-connectivity/iproute2/iproute2.inc
> index 86847ef..ef5d3c6 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -34,4 +34,3 @@ ALTERNATIVE_PATH = "${base_sbindir}/ip.iproute2"
>  ALTERNATIVE_LINK = "${base_bindir}/ip"
>  ALTERNATIVE_PRIORITY = "100"
>
> -PARALLEL_MAKE = ""
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bbb/meta/recipes-connectivity/nfs-utils/
> nfs-utils_1.2.3.bb
> index d047940..a45729d 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
> @@ -22,7 +22,6 @@ SRC_URI =
> "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
>  SRC_URI[md5sum] = "1131dc5f27c4f3905a6e7ee0d594fd4d"
>  SRC_URI[sha256sum] =
> "5575ece941097cbfa67fbe0d220dfa11b73f5e6d991e7939c9339bd72259ff19"
>
> -PARALLEL_MAKE = ""
>
>  # Only kernel-module-nfsd is required here (but can be built-in)  - the
> nfsd module will
>  # pull in the remainder of the dependencies.
> diff --git a/meta/recipes-core/eggdbus/eggdbus_0.6.bbb/meta/recipes-core/eggdbus/
> eggdbus_0.6.bb
> index 75f56de..acca5f0 100644
> --- a/meta/recipes-core/eggdbus/eggdbus_0.6.bb
> +++ b/meta/recipes-core/eggdbus/eggdbus_0.6.bb
> @@ -28,4 +28,3 @@ EXTRA_OECONF = " --disable-man-pages
> --disable-gtk-doc-html "
>
>  BBCLASSEXTEND = "native"
>
> -PARALLEL_MAKE = ""
> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bbb/meta/recipes-devtools/autoconf/
> autoconf_2.68.bb
> index 8d466e0..3f59aff 100644
> --- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
> +++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
> @@ -2,7 +2,6 @@ require autoconf.inc
>
>  PR = "r7"
>
> -PARALLEL_MAKE = ""
>
>  LICENSE = "GPLv2 & GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> diff --git a/meta/recipes-extended/groff/groff_1.20.1.bbb/meta/recipes-extended/groff/
> groff_1.20.1.bb
> index 6cb72bf..de20303 100644
> --- a/meta/recipes-extended/groff/groff_1.20.1.bb
> +++ b/meta/recipes-extended/groff/groff_1.20.1.bb
> @@ -19,7 +19,6 @@ DEPENDS_virtclass-native = ""
>  inherit autotools
>
>  EXTRA_OECONF = "--without-x"
> -PARALLEL_MAKE = ""
>
>  do_configure_prepend() {
>        if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
> diff --git a/meta/recipes-extended/mailx/mailx_12.5.bbb/meta/recipes-extended/mailx/
> mailx_12.5.bb
> index 2a08113..634d6da 100644
> --- a/meta/recipes-extended/mailx/mailx_12.5.bb
> +++ b/meta/recipes-extended/mailx/mailx_12.5.bb
> @@ -27,4 +27,3 @@ inherit autotools
>
>  CFLAGS_append = " -D_BSD_SOURCE -DDEBIAN -I${S}/EXT"
>
> -PARALLEL_MAKE = ""
> diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bbb/meta/recipes-extended/net-tools/
> net-tools_1.60-23.bb
> index b9a05c6..69dfca9 100644
> --- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
> +++ b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
> @@ -23,7 +23,6 @@ SRC_URI[patch.sha256sum] =
> "d678b3ea97d6c7ca548918994642bfc6b5511ab02f3a5881dfcc
>  inherit gettext
>
>  # The Makefile is lame, no parallel build
> -PARALLEL_MAKE = ""
>
>  # Unlike other Debian packages, net-tools *.diff.gz contains another
> series of
>  # patches maintained by quilt. So manually apply them before applying
> other local
> diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bbb/meta/recipes-extended/sat-solver/
> sat-solver_git.bb
> index 9d8422f..b796124 100644
> --- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
> +++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
> @@ -10,7 +10,6 @@ SRCREV = "0a7378d5f482f477a01cf1690d76871ab8bdcc32"
>  PV = "0.0-git${SRCPV}"
>  PR = "r13"
>
> -PARALLEL_MAKE=""
>
>  SRC_URI = "git://github.com/openSUSE/sat-solver.git;protocol=git \
>            file://sat-solver_rpm5.patch \
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bbb/meta/recipes-graphics/fontconfig/
> fontconfig_2.8.0.bb
> index 55c04cc..51f31ac 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
> @@ -39,7 +39,6 @@ RREPLACES_fontconfig-utils = "libfontconfig-utils"
>  RCONFLICTS_fontconfig-utils = "libfontconfig-utils"
>  DEBIAN_NOAUTONAME_fontconfig-utils = "1"
>
> -PARALLEL_MAKE = ""
>
>  inherit autotools pkgconfig
>
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bbb/meta/recipes-graphics/libsdl/
> libsdl_1.2.15.bb
> index 8b39442..3fbd584 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -49,7 +49,6 @@ EXTRA_OECONF = "--disable-static --disable-debug
> --enable-cdrom --enable-threads
>  PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa',
> '', d)}"
>  PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib,"
>
> -PARALLEL_MAKE = ""
>
>  EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
>
> diff --git a/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bbb/meta/recipes-graphics/xcb/
> libpthread-stubs_0.3.bb
> index c121bb9..44d9b79 100644
> --- a/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
> +++ b/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
> @@ -8,7 +8,6 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6edc1fea03d959f0c2d743fe5ca746ad"
>  PR = "r0"
>
> -PARALLEL_MAKE = ""
>  #DEPENDS = "xcb-proto xproto libxau libxslt-native"
>  # DEPENDS += "xsltproc-native gperf-native"
>
> diff --git a/meta/recipes-graphics/xcb/xcb-util.inc
> b/meta/recipes-graphics/xcb/xcb-util.inc
> index 7dad545..47e7198 100644
> --- a/meta/recipes-graphics/xcb/xcb-util.inc
> +++ b/meta/recipes-graphics/xcb/xcb-util.inc
> @@ -16,7 +16,6 @@ SECTION = "x11/libs"
>  DEPENDS = "libxcb"
>  DEPENDS += "gperf-native"
>
> -PARALLEL_MAKE = ""
>
>  SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.bz2"
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index a653af5..d2fdbe3 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -34,7 +34,6 @@ EXTRA_OECONF = "\
>                --with-access-group=audio \
>  "
>
> -PARALLEL_MAKE = ""
>
>  export TARGET_PFPU = "${TARGET_FPU}"
>
> diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bbb/meta/recipes-multimedia/speex/
> speex_1.2rc1.bb
> index 7370134..7da9645 100644
> --- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> +++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> @@ -14,7 +14,6 @@ SRC_URI = "
> http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.tar.gz"
>  SRC_URI[md5sum] = "c4438b22c08e5811ff10e2b06ee9b9ae"
>  SRC_URI[sha256sum] =
> "342f30dc57bd4a6dad41398365baaa690429660b10d866b7d508e8f1179cb7a6"
>
> -PARALLEL_MAKE = ""
>
>  inherit autotools pkgconfig
>
> diff --git a/meta/recipes-support/icu/icu-3.6.inc
> b/meta/recipes-support/icu/icu-3.6.inc
> index e3f9dd2..d3264ae 100644
> --- a/meta/recipes-support/icu/icu-3.6.inc
> +++ b/meta/recipes-support/icu/icu-3.6.inc
> @@ -17,7 +17,6 @@ DEPENDS_virtclass-native = ""
>
>  S = "${WORKDIR}/icu/source"
>
> -PARALLEL_MAKE = ""
>  FULL_OPTIMIZATION_arm = "-Os"
>
>  inherit autotools pkgconfig binconfig
> diff --git a/meta/recipes-support/libpcre/libpcre_8.21.bbb/meta/recipes-support/libpcre/
> libpcre_8.21.bb
> index f5fa4ef..9477c74 100644
> --- a/meta/recipes-support/libpcre/libpcre_8.21.bb
> +++ b/meta/recipes-support/libpcre/libpcre_8.21.bb
> @@ -22,7 +22,6 @@ DEPENDS = "bzip2 zlib readline"
>
>  inherit autotools binconfig
>
> -PARALLEL_MAKE = ""
>
>  CFLAGS_append = " -D_REENTRANT"
>  CXXFLAGS_powerpc += "-lstdc++"
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Yury Bushmelev

--bcaec517a774a69b7204bf1a9636
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">Please remove following recipes from this list:<=
br>meta/recipes-core/eggdbus/<a href=3D"http://eggdbus_0.6.bb" target=3D"_b=
lank">eggdbus_0.6.bb</a><br>.../net-tools/<a href=3D"http://net-tools_1.60-=
23.bb" target=3D"_blank">net-tools_1.60-23.bb</a><br>


<br>I&#39;ve seen failures on them with -j64 iirc.<br><br>2012/5/3 Khem Raj=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bla=
nk">raj.khem@gmail.com</a>&gt;</span><br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

From: Yuri Bushmelev &lt;<a href=3D"mailto:jay4mail@gmail.com">jay4mail@gma=
il.com</a>&gt;<br>
<br>
Signed-off-by: Yuri Bushmelev &lt;<a href=3D"mailto:jay4mail@gmail.com">jay=
4mail@gmail.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=A0meta/recipes-bsp/pciutils/<a href=3D"http://pciutils_3.1.9.bb" target=3D=
"_blank">pciutils_3.1.9.bb</a> =A0 =A0 =A0 =A0| =A0 =A01 -<br>
=A0meta/recipes-bsp/pcmciautils/pcmciautils.inc =A0 =A0 =A0 | =A0 =A01 -<br=
>
=A0meta/recipes-connectivity/iproute2/iproute2.inc =A0 =A0| =A0 =A01 -<br>
=A0.../nfs-utils/<a href=3D"http://nfs-utils_1.2.3.bb" target=3D"_blank">nf=
s-utils_1.2.3.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 -<br>
=A0meta/recipes-core/eggdbus/<a href=3D"http://eggdbus_0.6.bb" target=3D"_b=
lank">eggdbus_0.6.bb</a> =A0 =A0 =A0 =A0 =A0 | =A0 =A01 -<br>
=A0meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.68.bb" targe=
t=3D"_blank">autoconf_2.68.bb</a> =A0 =A0| =A0 =A01 -<br>
=A0meta/recipes-extended/groff/<a href=3D"http://groff_1.20.1.bb" target=3D=
"_blank">groff_1.20.1.bb</a> =A0 =A0 =A0 =A0| =A0 =A01 -<br>
=A0meta/recipes-extended/mailx/<a href=3D"http://mailx_12.5.bb" target=3D"_=
blank">mailx_12.5.bb</a> =A0 =A0 =A0 =A0 =A0| =A0 =A01 -<br>
=A0.../net-tools/<a href=3D"http://net-tools_1.60-23.bb" target=3D"_blank">=
net-tools_1.60-23.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 -<br>
=A0meta/recipes-extended/sat-solver/<a href=3D"http://sat-solver_git.bb" ta=
rget=3D"_blank">sat-solver_git.bb</a> | =A0 =A01 -<br>
=A0.../fontconfig/<a href=3D"http://fontconfig_2.8.0.bb" target=3D"_blank">=
fontconfig_2.8.0.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 -<br>
=A0meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_1.2.15.bb" target=
=3D"_blank">libsdl_1.2.15.bb</a> =A0 =A0 =A0| =A0 =A01 -<br>
=A0meta/recipes-graphics/xcb/<a href=3D"http://libpthread-stubs_0.3.bb" tar=
get=3D"_blank">libpthread-stubs_0.3.bb</a> =A0| =A0 =A01 -<br>
=A0meta/recipes-graphics/xcb/xcb-util.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
1 -<br>
=A0meta/recipes-multimedia/pulseaudio/pulseaudio.inc =A0| =A0 =A01 -<br>
=A0meta/recipes-multimedia/speex/<a href=3D"http://speex_1.2rc1.bb" target=
=3D"_blank">speex_1.2rc1.bb</a> =A0 =A0 =A0| =A0 =A01 -<br>
=A0meta/recipes-support/icu/icu-3.6.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 -<br>
=A0meta/recipes-support/libpcre/<a href=3D"http://libpcre_8.21.bb" target=
=3D"_blank">libpcre_8.21.bb</a> =A0 =A0 =A0 | =A0 =A01 -<br>
=A018 files changed, 0 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/meta/recipes-bsp/pciutils/<a href=3D"http://pciutils_3.1.9.bb"=
 target=3D"_blank">pciutils_3.1.9.bb</a> b/meta/recipes-bsp/pciutils/<a hre=
f=3D"http://pciutils_3.1.9.bb" target=3D"_blank">pciutils_3.1.9.bb</a><br>
index 2c969d9..83c040d 100644<br>
--- a/meta/recipes-bsp/pciutils/<a href=3D"http://pciutils_3.1.9.bb" target=
=3D"_blank">pciutils_3.1.9.bb</a><br>
+++ b/meta/recipes-bsp/pciutils/<a href=3D"http://pciutils_3.1.9.bb" target=
=3D"_blank">pciutils_3.1.9.bb</a><br>
@@ -21,7 +21,6 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/software/utils/pciu=
tils/pciutils-${PV}.tar.bz2 \<br>
=A0SRC_URI[md5sum] =3D &quot;79cc1d0bff8603d3a550fa63802cd1db&quot;<br>
=A0SRC_URI[sha256sum] =3D &quot;e4ce5d56ae4a9611d51ba0cc2ea45806f9539a18ace=
b4aa70b8ded50f6923c4f&quot;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
<br>
=A0PCI_CONF_FLAG =3D &quot;ZLIB=3Dyes DNS=3Dyes SHARED=3Dyes&quot;<br>
<br>
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bs=
p/pcmciautils/pcmciautils.inc<br>
index c0c1d0c..f303145 100644<br>
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc<br>
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc<br>
@@ -23,7 +23,6 @@ LD =3D &quot;${CC}&quot;<br>
=A0CFLAGS =3D+ &quot;-I${S}/src&quot;<br>
=A0CFLAGS =3D+ &quot;-DPCMCIAUTILS_VERSION=3D\&#39;${PV}\&#39;&quot;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
=A0EXTRA_OEMAKE =3D &quot;-e &#39;STRIP=3Decho&#39; &#39;LIB_OBJS=3D-lc -ls=
ysfs&#39; &#39;LEX=3Dflex&#39;&quot;<br>
<br>
=A0do_install () {<br>
diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes=
-connectivity/iproute2/iproute2.inc<br>
index 86847ef..ef5d3c6 100644<br>
--- a/meta/recipes-connectivity/iproute2/iproute2.inc<br>
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc<br>
@@ -34,4 +34,3 @@ ALTERNATIVE_PATH =3D &quot;${base_sbindir}/ip.iproute2&qu=
ot;<br>
=A0ALTERNATIVE_LINK =3D &quot;${base_bindir}/ip&quot;<br>
=A0ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
diff --git a/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-util=
s_1.2.3.bb" target=3D"_blank">nfs-utils_1.2.3.bb</a> b/meta/recipes-connect=
ivity/nfs-utils/<a href=3D"http://nfs-utils_1.2.3.bb" target=3D"_blank">nfs=
-utils_1.2.3.bb</a><br>


index d047940..a45729d 100644<br>
--- a/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-utils_1.2.3=
.bb" target=3D"_blank">nfs-utils_1.2.3.bb</a><br>
+++ b/meta/recipes-connectivity/nfs-utils/<a href=3D"http://nfs-utils_1.2.3=
.bb" target=3D"_blank">nfs-utils_1.2.3.bb</a><br>
@@ -22,7 +22,6 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${P=
V}.tar.bz2 \<br>
=A0SRC_URI[md5sum] =3D &quot;1131dc5f27c4f3905a6e7ee0d594fd4d&quot;<br>
=A0SRC_URI[sha256sum] =3D &quot;5575ece941097cbfa67fbe0d220dfa11b73f5e6d991=
e7939c9339bd72259ff19&quot;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
<br>
=A0# Only kernel-module-nfsd is required here (but can be built-in) =A0- th=
e nfsd module will<br>
=A0# pull in the remainder of the dependencies.<br>
diff --git a/meta/recipes-core/eggdbus/<a href=3D"http://eggdbus_0.6.bb" ta=
rget=3D"_blank">eggdbus_0.6.bb</a> b/meta/recipes-core/eggdbus/<a href=3D"h=
ttp://eggdbus_0.6.bb" target=3D"_blank">eggdbus_0.6.bb</a><br>
index 75f56de..acca5f0 100644<br>
--- a/meta/recipes-core/eggdbus/<a href=3D"http://eggdbus_0.6.bb" target=3D=
"_blank">eggdbus_0.6.bb</a><br>
+++ b/meta/recipes-core/eggdbus/<a href=3D"http://eggdbus_0.6.bb" target=3D=
"_blank">eggdbus_0.6.bb</a><br>
@@ -28,4 +28,3 @@ EXTRA_OECONF =3D &quot; --disable-man-pages --disable-gtk=
-doc-html &quot;<br>
<br>
=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
diff --git a/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.68=
.bb" target=3D"_blank">autoconf_2.68.bb</a> b/meta/recipes-devtools/autocon=
f/<a href=3D"http://autoconf_2.68.bb" target=3D"_blank">autoconf_2.68.bb</a=
><br>


index 8d466e0..3f59aff 100644<br>
--- a/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.68.bb" ta=
rget=3D"_blank">autoconf_2.68.bb</a><br>
+++ b/meta/recipes-devtools/autoconf/<a href=3D"http://autoconf_2.68.bb" ta=
rget=3D"_blank">autoconf_2.68.bb</a><br>
@@ -2,7 +2,6 @@ require autoconf.inc<br>
<br>
=A0PR =3D &quot;r7&quot;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
<br>
=A0LICENSE =3D &quot;GPLv2 &amp; GPLv3&quot;<br>
=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D751419260aa954499f7abaab=
aa882bbe \<br>
diff --git a/meta/recipes-extended/groff/<a href=3D"http://groff_1.20.1.bb"=
 target=3D"_blank">groff_1.20.1.bb</a> b/meta/recipes-extended/groff/<a hre=
f=3D"http://groff_1.20.1.bb" target=3D"_blank">groff_1.20.1.bb</a><br>
index 6cb72bf..de20303 100644<br>
--- a/meta/recipes-extended/groff/<a href=3D"http://groff_1.20.1.bb" target=
=3D"_blank">groff_1.20.1.bb</a><br>
+++ b/meta/recipes-extended/groff/<a href=3D"http://groff_1.20.1.bb" target=
=3D"_blank">groff_1.20.1.bb</a><br>
@@ -19,7 +19,6 @@ DEPENDS_virtclass-native =3D &quot;&quot;<br>
=A0inherit autotools<br>
<br>
=A0EXTRA_OECONF =3D &quot;--without-x&quot;<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
<br>
=A0do_configure_prepend() {<br>
 =A0 =A0 =A0 =A0if [ &quot;${BUILD_SYS}&quot; !=3D &quot;${HOST_SYS}&quot; =
]; then<br>
diff --git a/meta/recipes-extended/mailx/<a href=3D"http://mailx_12.5.bb" t=
arget=3D"_blank">mailx_12.5.bb</a> b/meta/recipes-extended/mailx/<a href=3D=
"http://mailx_12.5.bb" target=3D"_blank">mailx_12.5.bb</a><br>
index 2a08113..634d6da 100644<br>
--- a/meta/recipes-extended/mailx/<a href=3D"http://mailx_12.5.bb" target=
=3D"_blank">mailx_12.5.bb</a><br>
+++ b/meta/recipes-extended/mailx/<a href=3D"http://mailx_12.5.bb" target=
=3D"_blank">mailx_12.5.bb</a><br>
@@ -27,4 +27,3 @@ inherit autotools<br>
<br>
=A0CFLAGS_append =3D &quot; -D_BSD_SOURCE -DDEBIAN -I${S}/EXT&quot;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
diff --git a/meta/recipes-extended/net-tools/<a href=3D"http://net-tools_1.=
60-23.bb" target=3D"_blank">net-tools_1.60-23.bb</a> b/meta/recipes-extende=
d/net-tools/<a href=3D"http://net-tools_1.60-23.bb" target=3D"_blank">net-t=
ools_1.60-23.bb</a><br>


index b9a05c6..69dfca9 100644<br>
--- a/meta/recipes-extended/net-tools/<a href=3D"http://net-tools_1.60-23.b=
b" target=3D"_blank">net-tools_1.60-23.bb</a><br>
+++ b/meta/recipes-extended/net-tools/<a href=3D"http://net-tools_1.60-23.b=
b" target=3D"_blank">net-tools_1.60-23.bb</a><br>
@@ -23,7 +23,6 @@ SRC_URI[patch.sha256sum] =3D &quot;d678b3ea97d6c7ca548918=
994642bfc6b5511ab02f3a5881dfcc<br>
=A0inherit gettext<br>
<br>
=A0# The Makefile is lame, no parallel build<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
<br>
=A0# Unlike other Debian packages, net-tools *.diff.gz contains another ser=
ies of<br>
=A0# patches maintained by quilt. So manually apply them before applying ot=
her local<br>
diff --git a/meta/recipes-extended/sat-solver/<a href=3D"http://sat-solver_=
git.bb" target=3D"_blank">sat-solver_git.bb</a> b/meta/recipes-extended/sat=
-solver/<a href=3D"http://sat-solver_git.bb" target=3D"_blank">sat-solver_g=
it.bb</a><br>


index 9d8422f..b796124 100644<br>
--- a/meta/recipes-extended/sat-solver/<a href=3D"http://sat-solver_git.bb"=
 target=3D"_blank">sat-solver_git.bb</a><br>
+++ b/meta/recipes-extended/sat-solver/<a href=3D"http://sat-solver_git.bb"=
 target=3D"_blank">sat-solver_git.bb</a><br>
@@ -10,7 +10,6 @@ SRCREV =3D &quot;0a7378d5f482f477a01cf1690d76871ab8bdcc32=
&quot;<br>
=A0PV =3D &quot;0.0-git${SRCPV}&quot;<br>
=A0PR =3D &quot;r13&quot;<br>
<br>
-PARALLEL_MAKE=3D&quot;&quot;<br>
<br>
=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/openSUSE/sat-solver=
.git;protocol=3Dgit" target=3D"_blank">github.com/openSUSE/sat-solver.git;p=
rotocol=3Dgit</a> \<br>
 =A0 =A0 =A0 =A0 =A0 =A0file://sat-solver_rpm5.patch \<br>
diff --git a/meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig_=
2.8.0.bb" target=3D"_blank">fontconfig_2.8.0.bb</a> b/meta/recipes-graphics=
/fontconfig/<a href=3D"http://fontconfig_2.8.0.bb" target=3D"_blank">fontco=
nfig_2.8.0.bb</a><br>


index 55c04cc..51f31ac 100644<br>
--- a/meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig_2.8.0.b=
b" target=3D"_blank">fontconfig_2.8.0.bb</a><br>
+++ b/meta/recipes-graphics/fontconfig/<a href=3D"http://fontconfig_2.8.0.b=
b" target=3D"_blank">fontconfig_2.8.0.bb</a><br>
@@ -39,7 +39,6 @@ RREPLACES_fontconfig-utils =3D &quot;libfontconfig-utils&=
quot;<br>
=A0RCONFLICTS_fontconfig-utils =3D &quot;libfontconfig-utils&quot;<br>
=A0DEBIAN_NOAUTONAME_fontconfig-utils =3D &quot;1&quot;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
<br>
=A0inherit autotools pkgconfig<br>
<br>
diff --git a/meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_1.2.15.b=
b" target=3D"_blank">libsdl_1.2.15.bb</a> b/meta/recipes-graphics/libsdl/<a=
 href=3D"http://libsdl_1.2.15.bb" target=3D"_blank">libsdl_1.2.15.bb</a><br=
>
index 8b39442..3fbd584 100644<br>
--- a/meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_1.2.15.bb" targ=
et=3D"_blank">libsdl_1.2.15.bb</a><br>
+++ b/meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_1.2.15.bb" targ=
et=3D"_blank">libsdl_1.2.15.bb</a><br>
@@ -49,7 +49,6 @@ EXTRA_OECONF =3D &quot;--disable-static --disable-debug -=
-enable-cdrom --enable-threads<br>
=A0PACKAGECONFIG ??=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#=
39;alsa&#39;, &#39;alsa&#39;, &#39;&#39;, d)}&quot;<br>
=A0PACKAGECONFIG[alsa] =3D &quot;--enable-alsa,--disable-alsa,alsa-lib,&quo=
t;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
<br>
=A0EXTRA_AUTORECONF +=3D &quot;--include=3Dacinclude --exclude=3Dautoheader=
&quot;<br>
<br>
diff --git a/meta/recipes-graphics/xcb/<a href=3D"http://libpthread-stubs_0=
.3.bb" target=3D"_blank">libpthread-stubs_0.3.bb</a> b/meta/recipes-graphic=
s/xcb/<a href=3D"http://libpthread-stubs_0.3.bb" target=3D"_blank">libpthre=
ad-stubs_0.3.bb</a><br>


index c121bb9..44d9b79 100644<br>
--- a/meta/recipes-graphics/xcb/<a href=3D"http://libpthread-stubs_0.3.bb" =
target=3D"_blank">libpthread-stubs_0.3.bb</a><br>
+++ b/meta/recipes-graphics/xcb/<a href=3D"http://libpthread-stubs_0.3.bb" =
target=3D"_blank">libpthread-stubs_0.3.bb</a><br>
@@ -8,7 +8,6 @@ LICENSE =3D &quot;MIT&quot;<br>
=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6edc1fea03d959f0c2d743fe=
5ca746ad&quot;<br>
=A0PR =3D &quot;r0&quot;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
=A0#DEPENDS =3D &quot;xcb-proto xproto libxau libxslt-native&quot;<br>
=A0# DEPENDS +=3D &quot;xsltproc-native gperf-native&quot;<br>
<br>
diff --git a/meta/recipes-graphics/xcb/xcb-util.inc b/meta/recipes-graphics=
/xcb/xcb-util.inc<br>
index 7dad545..47e7198 100644<br>
--- a/meta/recipes-graphics/xcb/xcb-util.inc<br>
+++ b/meta/recipes-graphics/xcb/xcb-util.inc<br>
@@ -16,7 +16,6 @@ SECTION =3D &quot;x11/libs&quot;<br>
=A0DEPENDS =3D &quot;libxcb&quot;<br>
=A0DEPENDS +=3D &quot;gperf-native&quot;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
<br>
=A0SRC_URI =3D &quot;<a href=3D"http://xcb.freedesktop.org/dist/$%7BBPN%7D-=
$%7BPV%7D.tar.bz2" target=3D"_blank">http://xcb.freedesktop.org/dist/${BPN}=
-${PV}.tar.bz2</a>&quot;<br>
<br>
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recip=
es-multimedia/pulseaudio/pulseaudio.inc<br>
index a653af5..d2fdbe3 100644<br>
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
@@ -34,7 +34,6 @@ EXTRA_OECONF =3D &quot;\<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-access-group=3Daudio \<br>
=A0&quot;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
<br>
=A0export TARGET_PFPU =3D &quot;${TARGET_FPU}&quot;<br>
<br>
diff --git a/meta/recipes-multimedia/speex/<a href=3D"http://speex_1.2rc1.b=
b" target=3D"_blank">speex_1.2rc1.bb</a> b/meta/recipes-multimedia/speex/<a=
 href=3D"http://speex_1.2rc1.bb" target=3D"_blank">speex_1.2rc1.bb</a><br>
index 7370134..7da9645 100644<br>
--- a/meta/recipes-multimedia/speex/<a href=3D"http://speex_1.2rc1.bb" targ=
et=3D"_blank">speex_1.2rc1.bb</a><br>
+++ b/meta/recipes-multimedia/speex/<a href=3D"http://speex_1.2rc1.bb" targ=
et=3D"_blank">speex_1.2rc1.bb</a><br>
@@ -14,7 +14,6 @@ SRC_URI =3D &quot;<a href=3D"http://downloads.us.xiph.org=
/releases/speex/speex-1.2rc1.tar.gz" target=3D"_blank">http://downloads.us.=
xiph.org/releases/speex/speex-1.2rc1.tar.gz</a>&quot;<br>
=A0SRC_URI[md5sum] =3D &quot;c4438b22c08e5811ff10e2b06ee9b9ae&quot;<br>
=A0SRC_URI[sha256sum] =3D &quot;342f30dc57bd4a6dad41398365baaa690429660b10d=
866b7d508e8f1179cb7a6&quot;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
<br>
=A0inherit autotools pkgconfig<br>
<br>
diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/ic=
u/icu-3.6.inc<br>
index e3f9dd2..d3264ae 100644<br>
--- a/meta/recipes-support/icu/icu-3.6.inc<br>
+++ b/meta/recipes-support/icu/icu-3.6.inc<br>
@@ -17,7 +17,6 @@ DEPENDS_virtclass-native =3D &quot;&quot;<br>
<br>
=A0S =3D &quot;${WORKDIR}/icu/source&quot;<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
=A0FULL_OPTIMIZATION_arm =3D &quot;-Os&quot;<br>
<br>
=A0inherit autotools pkgconfig binconfig<br>
diff --git a/meta/recipes-support/libpcre/<a href=3D"http://libpcre_8.21.bb=
" target=3D"_blank">libpcre_8.21.bb</a> b/meta/recipes-support/libpcre/<a h=
ref=3D"http://libpcre_8.21.bb" target=3D"_blank">libpcre_8.21.bb</a><br>
index f5fa4ef..9477c74 100644<br>
--- a/meta/recipes-support/libpcre/<a href=3D"http://libpcre_8.21.bb" targe=
t=3D"_blank">libpcre_8.21.bb</a><br>
+++ b/meta/recipes-support/libpcre/<a href=3D"http://libpcre_8.21.bb" targe=
t=3D"_blank">libpcre_8.21.bb</a><br>
@@ -22,7 +22,6 @@ DEPENDS =3D &quot;bzip2 zlib readline&quot;<br>
<br>
=A0inherit autotools binconfig<br>
<br>
-PARALLEL_MAKE =3D &quot;&quot;<br>
<br>
=A0CFLAGS_append =3D &quot; -D_REENTRANT&quot;<br>
=A0CXXFLAGS_powerpc +=3D &quot;-lstdc++&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.5.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br>Yury Bush=
melev<br>

--bcaec517a774a69b7204bf1a9636--
