Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQBsL-0001H0-AA
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 08:20:21 +0200
Received: by laai10 with SMTP id i10so1093599laa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 23:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=rBm+7iwUCG5Ykd9kIPjQNm+G2IhWSadaCLqUdESS0wg=;
	b=EOBgdZdXya0ext1FFLzlRai81IKauoHAEC7gMoTPm56lL3+jEFQ/l+KR8vVd5YGPuz
	HSNvRFFNZpR6nbARAgGZLOCgcjMV4CzZq1hiXyj049DxyQ7jIsufe+l/tUaonPYOIQKr
	8W9avV8ywZD1eQlpojH9mzxg2EJVnKu2MBmACqyQp2ozN0wwEnC2lfNkpQUGu3a+vkSy
	kAi54wCWSfyO/eXwBquImc9xJiBRAh9WXyRV3xqd/kyFEpC9FF5yS+fPDVbbyXQ/mbVr
	miL6A3PwFLKHtElcMTVr4mQHZkkIy7fSPcgxyUaeNsJ3gTE8/W5/83joe0bxy89U8xeN
	tGVg==
Received: by 10.152.111.198 with SMTP id ik6mr4477860lab.38.1336111834865;
	Thu, 03 May 2012 23:10:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 3 May 2012 23:10:04 -0700 (PDT)
In-Reply-To: <CAMKF1so5LJRMx-fJPOasquEheq9Rk8PGPKFkbv4DSWZ=PJnLwQ@mail.gmail.com>
References: <cover.1335991900.git.raj.khem@gmail.com>
	<0c57b76bc47680ccf576d412a3dc7e726f1daba2.1335991900.git.raj.khem@gmail.com>
	<e8d5425f8ca14a0c0b7378a9202fd4c72761ea12.1335991900.git.raj.khem@gmail.com>
	<CAJG6M_NudM-_bL+Zp9CBkFGHqjnjRB1rQvNZz+FLnPA7aqrUYA@mail.gmail.com>
	<CAMKF1so5LJRMx-fJPOasquEheq9Rk8PGPKFkbv4DSWZ=PJnLwQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 May 2012 23:10:04 -0700
Message-ID: <CAMKF1sr+uGUpy9hFcak_pY2QbX542XRRfiZAzwbOD_wGXuH6iw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 04 May 2012 06:20:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 3, 2012 at 10:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, May 2, 2012 at 9:53 PM, Yury Bushmelev <jay4mail@gmail.com> wrote=
:
>> Please remove following recipes from this list:
>> meta/recipes-core/eggdbus/eggdbus_0.6.bb
>> .../net-tools/net-tools_1.60-23.bb
>>
>> I've seen failures on them with -j64 iirc.
>>
>
> ok removed


I have updated kraj/misc-updates branch to reflect this change

>
>> 2012/5/3 Khem Raj <raj.khem@gmail.com>
>>>
>>> From: Yuri Bushmelev <jay4mail@gmail.com>
>>>
>>> Signed-off-by: Yuri Bushmelev <jay4mail@gmail.com>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> =C2=A0meta/recipes-bsp/pciutils/pciutils_3.1.9.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A01 -
>>> =C2=A0meta/recipes-bsp/pcmciautils/pcmciautils.inc =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A01 -
>>> =C2=A0meta/recipes-connectivity/iproute2/iproute2.inc =C2=A0 =C2=A0| =
=C2=A0 =C2=A01 -
>>> =C2=A0.../nfs-utils/nfs-utils_1.2.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 -
>>> =C2=A0meta/recipes-core/eggdbus/eggdbus_0.6.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A01 -
>>> =C2=A0meta/recipes-devtools/autoconf/autoconf_2.68.bb =C2=A0 =C2=A0| =
=C2=A0 =C2=A01 -
>>> =C2=A0meta/recipes-extended/groff/groff_1.20.1.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A01 -
>>> =C2=A0meta/recipes-extended/mailx/mailx_12.5.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A01 -
>>> =C2=A0.../net-tools/net-tools_1.60-23.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 -
>>> =C2=A0meta/recipes-extended/sat-solver/sat-solver_git.bb | =C2=A0 =C2=
=A01 -
>>> =C2=A0.../fontconfig/fontconfig_2.8.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 -
>>> =C2=A0meta/recipes-graphics/libsdl/libsdl_1.2.15.bb =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A01 -
>>> =C2=A0meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb =C2=A0| =C2=A0 =
=C2=A01 -
>>> =C2=A0meta/recipes-graphics/xcb/xcb-util.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 -
>>> =C2=A0meta/recipes-multimedia/pulseaudio/pulseaudio.inc =C2=A0| =C2=A0 =
=C2=A01 -
>>> =C2=A0meta/recipes-multimedia/speex/speex_1.2rc1.bb =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A01 -
>>> =C2=A0meta/recipes-support/icu/icu-3.6.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 -
>>> =C2=A0meta/recipes-support/libpcre/libpcre_8.21.bb =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A01 -
>>> =C2=A018 files changed, 0 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
>>> b/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
>>> index 2c969d9..83c040d 100644
>>> --- a/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
>>> +++ b/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
>>> @@ -21,7 +21,6 @@ SRC_URI =3D
>>> "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
>>> =C2=A0SRC_URI[md5sum] =3D "79cc1d0bff8603d3a550fa63802cd1db"
>>> =C2=A0SRC_URI[sha256sum] =3D
>>> "e4ce5d56ae4a9611d51ba0cc2ea45806f9539a18aceb4aa70b8ded50f6923c4f"
>>>
>>> -PARALLEL_MAKE =3D ""
>>>
>>> =C2=A0PCI_CONF_FLAG =3D "ZLIB=3Dyes DNS=3Dyes SHARED=3Dyes"
>>>
>>> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
>>> b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
>>> index c0c1d0c..f303145 100644
>>> --- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
>>> +++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
>>> @@ -23,7 +23,6 @@ LD =3D "${CC}"
>>> =C2=A0CFLAGS =3D+ "-I${S}/src"
>>> =C2=A0CFLAGS =3D+ "-DPCMCIAUTILS_VERSION=3D\'${PV}\'"
>>>
>>> -PARALLEL_MAKE =3D ""
>>> =C2=A0EXTRA_OEMAKE =3D "-e 'STRIP=3Decho' 'LIB_OBJS=3D-lc -lsysfs' 'LEX=
=3Dflex'"
>>>
>>> =C2=A0do_install () {
>>> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
>>> b/meta/recipes-connectivity/iproute2/iproute2.inc
>>> index 86847ef..ef5d3c6 100644
>>> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
>>> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
>>> @@ -34,4 +34,3 @@ ALTERNATIVE_PATH =3D "${base_sbindir}/ip.iproute2"
>>> =C2=A0ALTERNATIVE_LINK =3D "${base_bindir}/ip"
>>> =C2=A0ALTERNATIVE_PRIORITY =3D "100"
>>>
>>> -PARALLEL_MAKE =3D ""
>>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
>>> b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
>>> index d047940..a45729d 100644
>>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
>>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.3.bb
>>> @@ -22,7 +22,6 @@ SRC_URI =3D
>>> "${SOURCEFORGE_MIRROR}/nfs/nfs-utils-${PV}.tar.bz2 \
>>> =C2=A0SRC_URI[md5sum] =3D "1131dc5f27c4f3905a6e7ee0d594fd4d"
>>> =C2=A0SRC_URI[sha256sum] =3D
>>> "5575ece941097cbfa67fbe0d220dfa11b73f5e6d991e7939c9339bd72259ff19"
>>>
>>> -PARALLEL_MAKE =3D ""
>>>
>>> =C2=A0# Only kernel-module-nfsd is required here (but can be built-in) =
=C2=A0- the
>>> nfsd module will
>>> =C2=A0# pull in the remainder of the dependencies.
>>> diff --git a/meta/recipes-core/eggdbus/eggdbus_0.6.bb
>>> b/meta/recipes-core/eggdbus/eggdbus_0.6.bb
>>> index 75f56de..acca5f0 100644
>>> --- a/meta/recipes-core/eggdbus/eggdbus_0.6.bb
>>> +++ b/meta/recipes-core/eggdbus/eggdbus_0.6.bb
>>> @@ -28,4 +28,3 @@ EXTRA_OECONF =3D " --disable-man-pages
>>> --disable-gtk-doc-html "
>>>
>>> =C2=A0BBCLASSEXTEND =3D "native"
>>>
>>> -PARALLEL_MAKE =3D ""
>>> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
>>> b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
>>> index 8d466e0..3f59aff 100644
>>> --- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
>>> +++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
>>> @@ -2,7 +2,6 @@ require autoconf.inc
>>>
>>> =C2=A0PR =3D "r7"
>>>
>>> -PARALLEL_MAKE =3D ""
>>>
>>> =C2=A0LICENSE =3D "GPLv2 & GPLv3"
>>> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7aba=
abaa882bbe \
>>> diff --git a/meta/recipes-extended/groff/groff_1.20.1.bb
>>> b/meta/recipes-extended/groff/groff_1.20.1.bb
>>> index 6cb72bf..de20303 100644
>>> --- a/meta/recipes-extended/groff/groff_1.20.1.bb
>>> +++ b/meta/recipes-extended/groff/groff_1.20.1.bb
>>> @@ -19,7 +19,6 @@ DEPENDS_virtclass-native =3D ""
>>> =C2=A0inherit autotools
>>>
>>> =C2=A0EXTRA_OECONF =3D "--without-x"
>>> -PARALLEL_MAKE =3D ""
>>>
>>> =C2=A0do_configure_prepend() {
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ "${BUILD_SYS}" !=3D "${HOST_SYS}" ]; th=
en
>>> diff --git a/meta/recipes-extended/mailx/mailx_12.5.bb
>>> b/meta/recipes-extended/mailx/mailx_12.5.bb
>>> index 2a08113..634d6da 100644
>>> --- a/meta/recipes-extended/mailx/mailx_12.5.bb
>>> +++ b/meta/recipes-extended/mailx/mailx_12.5.bb
>>> @@ -27,4 +27,3 @@ inherit autotools
>>>
>>> =C2=A0CFLAGS_append =3D " -D_BSD_SOURCE -DDEBIAN -I${S}/EXT"
>>>
>>> -PARALLEL_MAKE =3D ""
>>> diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
>>> b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
>>> index b9a05c6..69dfca9 100644
>>> --- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
>>> +++ b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
>>> @@ -23,7 +23,6 @@ SRC_URI[patch.sha256sum] =3D
>>> "d678b3ea97d6c7ca548918994642bfc6b5511ab02f3a5881dfcc
>>> =C2=A0inherit gettext
>>>
>>> =C2=A0# The Makefile is lame, no parallel build
>>> -PARALLEL_MAKE =3D ""
>>>
>>> =C2=A0# Unlike other Debian packages, net-tools *.diff.gz contains anot=
her
>>> series of
>>> =C2=A0# patches maintained by quilt. So manually apply them before appl=
ying
>>> other local
>>> diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb
>>> b/meta/recipes-extended/sat-solver/sat-solver_git.bb
>>> index 9d8422f..b796124 100644
>>> --- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
>>> +++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
>>> @@ -10,7 +10,6 @@ SRCREV =3D "0a7378d5f482f477a01cf1690d76871ab8bdcc32"
>>> =C2=A0PV =3D "0.0-git${SRCPV}"
>>> =C2=A0PR =3D "r13"
>>>
>>> -PARALLEL_MAKE=3D""
>>>
>>> =C2=A0SRC_URI =3D "git://github.com/openSUSE/sat-solver.git;protocol=3D=
git \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sat-solver_rpm5.patch \
>>> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
>>> b/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
>>> index 55c04cc..51f31ac 100644
>>> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
>>> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.8.0.bb
>>> @@ -39,7 +39,6 @@ RREPLACES_fontconfig-utils =3D "libfontconfig-utils"
>>> =C2=A0RCONFLICTS_fontconfig-utils =3D "libfontconfig-utils"
>>> =C2=A0DEBIAN_NOAUTONAME_fontconfig-utils =3D "1"
>>>
>>> -PARALLEL_MAKE =3D ""
>>>
>>> =C2=A0inherit autotools pkgconfig
>>>
>>> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>>> b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>>> index 8b39442..3fbd584 100644
>>> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>>> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
>>> @@ -49,7 +49,6 @@ EXTRA_OECONF =3D "--disable-static --disable-debug
>>> --enable-cdrom --enable-threads
>>> =C2=A0PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'alsa', =
'alsa',
>>> '', d)}"
>>> =C2=A0PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib,"
>>>
>>> -PARALLEL_MAKE =3D ""
>>>
>>> =C2=A0EXTRA_AUTORECONF +=3D "--include=3Dacinclude --exclude=3Dautohead=
er"
>>>
>>> diff --git a/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
>>> b/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
>>> index c121bb9..44d9b79 100644
>>> --- a/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
>>> +++ b/meta/recipes-graphics/xcb/libpthread-stubs_0.3.bb
>>> @@ -8,7 +8,6 @@ LICENSE =3D "MIT"
>>> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6edc1fea03d959f0c2d743=
fe5ca746ad"
>>> =C2=A0PR =3D "r0"
>>>
>>> -PARALLEL_MAKE =3D ""
>>> =C2=A0#DEPENDS =3D "xcb-proto xproto libxau libxslt-native"
>>> =C2=A0# DEPENDS +=3D "xsltproc-native gperf-native"
>>>
>>> diff --git a/meta/recipes-graphics/xcb/xcb-util.inc
>>> b/meta/recipes-graphics/xcb/xcb-util.inc
>>> index 7dad545..47e7198 100644
>>> --- a/meta/recipes-graphics/xcb/xcb-util.inc
>>> +++ b/meta/recipes-graphics/xcb/xcb-util.inc
>>> @@ -16,7 +16,6 @@ SECTION =3D "x11/libs"
>>> =C2=A0DEPENDS =3D "libxcb"
>>> =C2=A0DEPENDS +=3D "gperf-native"
>>>
>>> -PARALLEL_MAKE =3D ""
>>>
>>> =C2=A0SRC_URI =3D "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.bz2=
"
>>>
>>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>>> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>>> index a653af5..d2fdbe3 100644
>>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>>> @@ -34,7 +34,6 @@ EXTRA_OECONF =3D "\
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-access-gr=
oup=3Daudio \
>>> =C2=A0"
>>>
>>> -PARALLEL_MAKE =3D ""
>>>
>>> =C2=A0export TARGET_PFPU =3D "${TARGET_FPU}"
>>>
>>> diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
>>> b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
>>> index 7370134..7da9645 100644
>>> --- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
>>> +++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
>>> @@ -14,7 +14,6 @@ SRC_URI =3D
>>> "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.tar.gz"
>>> =C2=A0SRC_URI[md5sum] =3D "c4438b22c08e5811ff10e2b06ee9b9ae"
>>> =C2=A0SRC_URI[sha256sum] =3D
>>> "342f30dc57bd4a6dad41398365baaa690429660b10d866b7d508e8f1179cb7a6"
>>>
>>> -PARALLEL_MAKE =3D ""
>>>
>>> =C2=A0inherit autotools pkgconfig
>>>
>>> diff --git a/meta/recipes-support/icu/icu-3.6.inc
>>> b/meta/recipes-support/icu/icu-3.6.inc
>>> index e3f9dd2..d3264ae 100644
>>> --- a/meta/recipes-support/icu/icu-3.6.inc
>>> +++ b/meta/recipes-support/icu/icu-3.6.inc
>>> @@ -17,7 +17,6 @@ DEPENDS_virtclass-native =3D ""
>>>
>>> =C2=A0S =3D "${WORKDIR}/icu/source"
>>>
>>> -PARALLEL_MAKE =3D ""
>>> =C2=A0FULL_OPTIMIZATION_arm =3D "-Os"
>>>
>>> =C2=A0inherit autotools pkgconfig binconfig
>>> diff --git a/meta/recipes-support/libpcre/libpcre_8.21.bb
>>> b/meta/recipes-support/libpcre/libpcre_8.21.bb
>>> index f5fa4ef..9477c74 100644
>>> --- a/meta/recipes-support/libpcre/libpcre_8.21.bb
>>> +++ b/meta/recipes-support/libpcre/libpcre_8.21.bb
>>> @@ -22,7 +22,6 @@ DEPENDS =3D "bzip2 zlib readline"
>>>
>>> =C2=A0inherit autotools binconfig
>>>
>>> -PARALLEL_MAKE =3D ""
>>>
>>> =C2=A0CFLAGS_append =3D " -D_REENTRANT"
>>> =C2=A0CXXFLAGS_powerpc +=3D "-lstdc++"
>>> --
>>> 1.7.5.4
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>>
>> --
>> Yury Bushmelev
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>


