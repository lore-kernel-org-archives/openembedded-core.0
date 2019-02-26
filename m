Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3381C7CC81
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 10:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 71C48184A3;
	Tue, 26 Feb 2019 11:09:19 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id voh9beknoPOg; Tue, 26 Feb 2019 11:09:17 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9B418180EA;
	Tue, 26 Feb 2019 11:09:17 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89F031A0A2;
	Tue, 26 Feb 2019 11:09:17 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EC291A082;
	Tue, 26 Feb 2019 11:09:17 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 26 Feb 2019 11:09:17 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 7313A1E4C;
	Tue, 26 Feb 2019 11:09:17 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 26 Feb 2019 11:09:17 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Tue, 26 Feb 2019 11:09:17 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH V3] default-distrovars: Drop
	DISTRO_FEATURES_LIBC
Thread-Index: AQHUzbH4C3ll0Ec/1UaJjmjWBHSYMaXx1X8g
Date: Tue, 26 Feb 2019 10:09:17 +0000
Message-ID: <c9ee294cf1ba4ae1a94c2242fcab1579@XBOX04.axis.com>
References: <20190226090047.34817-1-raj.khem@gmail.com>
In-Reply-To: <20190226090047.34817-1-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH V3] default-distrovars: Drop DISTRO_FEATURES_LIBC
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
X-List-Received-Date: Tue, 26 Feb 2019 10:09:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 26 februari 2019 10:01
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH V3] default-distrovars: Drop
> DISTRO_FEATURES_LIBC
>=20
> After eglibc was merged into glibc, Kconfig support was also dropped so
> these libc features therefore are not effective anymore and can be
> removed
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2:
> - Add ipv4 and ipv6 to default distro features, they are not libc
>   specific anyway
> - Remove DISTRO_FEATURES_DEFAULT as this is redundant now
>=20
> v3:
> - Remove the use of libc-* overrides in metadata
>=20
>  meta/classes/image.bbclass                       |  1 -
>  meta/classes/libc-package.bbclass                |  5 +----
>  meta/conf/bitbake.conf                           |  4 ++--
>  meta/conf/distro/include/default-distrovars.inc  | 11 +----------
>  meta/conf/distro/include/tclibc-glibc.inc        |  5 +----
>  meta/conf/local.conf.sample.extended             | 16 ++--------------
>  meta/recipes-core/glib-2.0/glib.inc              |  2 --
>  meta/recipes-core/glibc/glibc_2.29.bb            |  3 +--
>  meta/recipes-core/libxml/libxml2_2.9.8.bb        |  2 --
>  meta/recipes-devtools/mtools/mtools_4.0.19.bb    |  2 --
>  .../findutils/findutils_4.6.0.bb                 |  2 +-
>  meta/recipes-extended/shadow/shadow.inc          |  2 +-
>  meta/recipes-extended/shadow/shadow_4.6.bb       |  2 +-
>  13 files changed, 11 insertions(+), 46 deletions(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 11927f39f5..6baccb4bb5 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -177,7 +177,6 @@ IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
>  LINGUAS_INSTALL ?=3D "${@" ".join(map(lambda s: "locale-base-%s" % s,
> d.getVar('IMAGE_LINGUAS').split()))}"
>=20
>  python () {
> -    if not bb.utils.contains('DISTRO_FEATURES', 'libc-charsets libc-loca=
le-code libc-locales', True, False, d):
>          d.setVar('IMAGE_LINGUAS', '')
>  }

Change the above anonymous Python block to:

IMAGE_LINGUAS =3D ""

>=20
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-
> package.bbclass
> index 34c9151ae9..06d4984081 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -39,10 +39,7 @@ python __anonymous () {
>                  break
>=20
>      # try to fix disable charsets/locales/locale-code compile fail
> -    if bb.utils.contains('DISTRO_FEATURES', 'libc-charsets libc-locales =
libc-locale-code', True, False, d):
> -        d.setVar('PACKAGE_NO_GCONV', '0')
> -    else:
> -        d.setVar('PACKAGE_NO_GCONV', '1')
> +    d.setVar('PACKAGE_NO_GCONV', '0')

This can now be changed to a normal variable assignment outside the anonymo=
us=20
Python block:

PACKAGE_NO_GCONV =3D "0"

>  }
>=20
>  OVERRIDES_append =3D ":${TARGET_ARCH}-${TARGET_OS}"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 435646a946..1c5369ec98 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -123,7 +123,7 @@ TUNE_ASARGS ??=3D ""
>  TUNE_FEATURES ??=3D "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
>  LIBCEXTENSION ??=3D ""
>  ABIEXTENSION ??=3D ""
> -USE_NLS ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'libc-locale-code=
', 'yes', 'no', d)}"
> +USE_NLS ??=3D "yes"
>  SDKUSE_NLS ??=3D "yes"
>=20
>  TARGET_ARCH =3D "${TUNE_ARCH}"
> @@ -820,7 +820,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
>  # Native distro features (will always be used for -native, even if they
>  # are not enabled for target)
>  DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> -DISTRO_FEATURES_NATIVESDK ?=3D "x11 libc-charsets libc-locales libc-loca=
le-code"
> +DISTRO_FEATURES_NATIVESDK ?=3D "x11"
>=20
>  # Normally target distro features will not be applied to native builds:
>  # Native distro features on this list will use the target feature value
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
> index 76edff6480..d57329ec17 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -10,16 +10,7 @@ LOCALE_UTF8_ONLY ?=3D "0"
>  LOCALE_UTF8_IS_DEFAULT ?=3D "1"
>  LOCALE_UTF8_IS_DEFAULT_class-nativesdk =3D "0"
>=20
> -DISTRO_FEATURES_DEFAULT ?=3D "acl alsa argp bluetooth ext2 irda largefil=
e pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
> -DISTRO_FEATURES_LIBC_DEFAULT ?=3D "ipv4 ipv6 libc-backtrace libc-big-mac=
ros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> -					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc=
-fstab libc-ftraverse \
> -					libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales libc-lo=
cale-code \
> -					libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn li=
bc-streams \
> -					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix=
-regexp libc-posix-regexp-glibc \
> -					libc-posix-wchar-io"
> -DISTRO_FEATURES_LIBC ?=3D "${DISTRO_FEATURES_LIBC_DEFAULT}"
> -DISTRO_FEATURES_LIBC_class-nativesdk =3D "${DISTRO_FEATURES_LIBC_DEFAULT=
}"
> -DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}=
"
> +DISTRO_FEATURES ?=3D "acl alsa argp bluetooth ext2 ipv4 ipv6 irda largef=
ile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
>=20
>  IMAGE_FEATURES ?=3D ""
>=20
> diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro=
/include/tclibc-glibc.inc
> index abe619aaac..253d64383e 100644
> --- a/meta/conf/distro/include/tclibc-glibc.inc
> +++ b/meta/conf/distro/include/tclibc-glibc.inc
> @@ -32,7 +32,4 @@ LIBC_LOCALE_DEPENDENCIES =3D "\
>  	glibc-gconv-iso8859-15"
>=20
>  def get_libc_locales_dependencies(d):
> -    if bb.utils.contains('DISTRO_FEATURES', 'libc-charsets libc-locale-c=
ode libc-locales', True, False, d):
> -        return d.getVar('LIBC_LOCALE_DEPENDENCIES') or ''
> -    else:
> -        return ''
> +    return d.getVar('LIBC_LOCALE_DEPENDENCIES') or ''

Replace ${@get_libc_locales_dependencies(d)} earlier in the file with=20
${LIBC_LOCALE_DEPENDENCIES} and remove this function. Actually, you can jus=
t=20
as well remove LIBC_LOCALE_DEPENDENCIES too, and just add its contents=20
directly to LIBC_DEPENDENCIES.

> diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.=
sample.extended
> index 010bf6ca6f..0743fefece 100644
> --- a/meta/conf/local.conf.sample.extended
> +++ b/meta/conf/local.conf.sample.extended
> @@ -24,22 +24,10 @@
>  # For a quad-core machine, BB_NUMBER_THREADS =3D "4", PARALLEL_MAKE =3D =
"-j 4" would
>  # be appropriate for example.
>=20
> -
> -# glibc configurability is used to reduce minimal image's size.
> -# the all supported glibc options are listed in DISTRO_FEATURES_LIBC
> -# and disabled by default. Uncomment and copy the DISTRO_FEATURES_LIBC
> -# and DISTRO_FEATURES definitions to local.conf to enable the options.
> -#DISTRO_FEATURES_LIBC =3D "ipv6 libc-backtrace libc-big-macros libc-bsd =
libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> -#               libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-=
fmtmsg libc-fstab libc-ftraverse \
> -#               libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm=
 libc-locales libc-locale-code \
> -#               libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug li=
bc-spawn libc-streams \
> -#               libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar=
 libc-posix-regexp libc-posix-regexp-glibc \
> -#               libc-posix-wchar-io"
> -
> -#DISTRO_FEATURES =3D "alsa bluetooth ext2 irda pcmcia usbgadget usbhost =
wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
> +#DISTRO_FEATURES =3D "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadge=
t usbhost wifi nfs zeroconf pci"
>=20
>  # If you want to get an image based on directfb without x11, Please copy=
 this variable to build/conf/local.conf
> -#DISTRO_FEATURES =3D "alsa argp bluetooth ext2 irda largefile pcmcia usb=
gadget usbhost wifi xattr nfs zeroconf pci 3g directfb ${DISTRO_FEATURES_LI=
BC}"
> +#DISTRO_FEATURES =3D "alsa argp bluetooth ext2 irda ipv4 ipv6 largefile =
pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb"
>=20
>  # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary loca=
le
>  # packages at build time using qemu-native. Disabling it (by setting it =
to 0)
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
> index 6305f553b4..3c2440db0e 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -41,8 +41,6 @@ EXTRA_OEMESON_append_class-target =3D "
> ${@bb.utils.contains('GTKDOC_ENABLED', 'Tr
>  # meson's python configuration pokes into python3 configuration, so this=
 provides the native config to it.
>  unset _PYTHON_SYSCONFIGDATA_NAME
>=20
> -REQUIRED_DISTRO_FEATURES_libc-glibc =3D "${@'libc-charsets libc-locale-c=
ode libc-locales' if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, Fa=
lse, d) else ''}"
> -
>  S =3D "${WORKDIR}/glib-${PV}"
>=20
>  PACKAGECONFIG ??=3D "system-pcre libmount"
> diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/gl=
ibc/glibc_2.29.bb
> index beddbffee2..bd8aa6d503 100644
> --- a/meta/recipes-core/glibc/glibc_2.29.bb
> +++ b/meta/recipes-core/glibc/glibc_2.29.bb
> @@ -89,12 +89,11 @@ EXTRA_OECONF =3D "--enable-kernel=3D${OLDEST_KERNEL} =
\
>                  --enable-stackguard-randomization \
>                  --disable-crypt \
>                  --with-default-link \
> +                --enable-nscd \
>                  ${GLIBCPIE} \
>                  ${GLIBC_EXTRA_OECONF}"
>=20
>  EXTRA_OECONF +=3D "${@get_libc_fpu_setting(bb, d)}"
> -EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'libc-inet-an=
l', '--enable-nscd', '--disable-nscd', d)}"
> -
>=20
>  do_patch_append() {
>      bb.build.exec_func('do_fix_readlib_c', d)
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-cor=
e/libxml/libxml2_2.9.8.bb
> index 0e2461154b..62643bc764 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
> @@ -42,8 +42,6 @@ inherit autotools pkgconfig binconfig-disabled ptest
> distro_features_check
>=20
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native',=
 '', d)}
>=20
> -REQUIRED_DISTRO_FEATURES_libc-glibc =3D "${@'libc-charsets libc-locale-c=
ode libc-locales' if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, Fa=
lse, d) else ''}"
> -
>  RDEPENDS_${PN}-ptest +=3D "make ${@bb.utils.contains('PACKAGECONFIG', 'p=
ython', 'libgcc python3-core python3-logging python3-shell  python3-stringo=
ld python3-threading python3-unittest ${PN}-python', '', d)}"
>=20
>  RDEPENDS_${PN}-python +=3D "${@bb.utils.contains('PACKAGECONFIG', 'pytho=
n', 'python3-core', '', d)}"
> diff --git a/meta/recipes-devtools/mtools/mtools_4.0.19.bb b/meta/recipes=
-devtools/mtools/mtools_4.0.19.bb
> index 9972762b4e..7d59d93a81 100644
> --- a/meta/recipes-devtools/mtools/mtools_4.0.19.bb
> +++ b/meta/recipes-devtools/mtools/mtools_4.0.19.bb
> @@ -39,8 +39,6 @@ SRC_URI_append_class-native =3D " file://disable-
> hardcoded-configs.patch"
>=20
>  inherit autotools texinfo distro_features_check
>=20
> -REQUIRED_DISTRO_FEATURES_libc-glibc =3D "libc-charsets libc-locale-code =
libc-locales"
> -
>  EXTRA_OECONF =3D "--without-x"
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-extended/findutils/findutils_4.6.0.bb b/meta/re=
cipes-extended/findutils/findutils_4.6.0.bb
> index 5e4ca94868..3b62ed9962 100644
> --- a/meta/recipes-extended/findutils/findutils_4.6.0.bb
> +++ b/meta/recipes-extended/findutils/findutils_4.6.0.bb
> @@ -16,6 +16,6 @@ SRC_URI[md5sum] =3D "9936aa8009438ce185bea2694a997fc1"
>  SRC_URI[sha256sum] =3D "ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612=
e16cf1431bb1169d"
>=20
>  # http://savannah.gnu.org/bugs/?27299
> -CACHED_CONFIGUREVARS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'libc=
-posix-clang-wchar', 'gl_cv_func_wcwidth_works=3Dyes', '', d)}"
> +CACHED_CONFIGUREVARS +=3D "gl_cv_func_wcwidth_works=3Dyes"
>=20
>  EXTRA_OECONF +=3D "ac_cv_path_SORT=3D${bindir}/sort"
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-exten=
ded/shadow/shadow.inc
> index 09c37ef8a3..2b20bdcb25 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -57,7 +57,7 @@ EXTRA_OECONF +=3D "--without-audit \
>  NSCDOPT =3D ""
>  NSCDOPT_class-native =3D "--without-nscd"
>  NSCDOPT_class-nativesdk =3D "--without-nscd"
> -NSCDOPT_libc-glibc =3D "${@bb.utils.contains('DISTRO_FEATURES', 'libc-sp=
awn', '--with-nscd', '--without-nscd', d)}"
> +NSCDOPT_libc-glibc =3D "--with-nscd"
>=20
>  PAM_PLUGINS =3D "libpam-runtime \
>                 pam-plugin-faildelay \
> diff --git a/meta/recipes-extended/shadow/shadow_4.6.bb b/meta/recipes-ex=
tended/shadow/shadow_4.6.bb
> index 5675cb8cc9..c975395ff8 100644
> --- a/meta/recipes-extended/shadow/shadow_4.6.bb
> +++ b/meta/recipes-extended/shadow/shadow_4.6.bb
> @@ -2,7 +2,7 @@ require shadow.inc
>=20
>  # Build falsely assumes that if --enable-libpam is set, we don't need to=
 link against
>  # libcrypt. This breaks chsh.
> -BUILD_LDFLAGS_append_class-target =3D " ${@bb.utils.contains('DISTRO_FEA=
TURES', 'pam', bb.utils.contains('DISTRO_FEATURES', 'libc-crypt',  '-lcrypt=
', '', d), '', d)}"
> +BUILD_LDFLAGS_append_class-target =3D " ${@bb.utils.contains('DISTRO_FEA=
TURES', 'pam', '-lcrypt', '', d)}"
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
>=20
> --
> 2.21.0

//Peter


