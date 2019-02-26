Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id EED147C83A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 18:06:19 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id h58so11535707edb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 10:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jpblCkREqoKNojRBL1TEe9bsH6lOK6xgoqzAuU0qFjs=;
	b=HGv3xHra+8RuoIRGNQhMHXXsbggADdoeGKjUyRsevQOIWIYQEozKbt4+bOOqTlf1E6
	sq+Wmg543NyxlilAoXxmWGXTBFGltaiwnmRaSLz880bvM2PofGlN9Vz9Z4h1kYwHu8uQ
	5OB4d75QbNyp0IIHYzqppircisLhiTY0pbRfbpx8pxQuymb6rvkWia5vQP9wtoJF2Py+
	bdj9SwR+yIZiDZw7L40uwQXAueK8gVrLYQ3Ltztrl0jnoR24KGUPZMP2ljwzUHWgqDOU
	8K+l/ffT+sClxPoPkEsN+H71Y/c4nt6cYDbfEPslOa608nPmSXjwyYUtsCkkPNkgnbHr
	U3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jpblCkREqoKNojRBL1TEe9bsH6lOK6xgoqzAuU0qFjs=;
	b=EV/brI4zAkR0w58n0d+qixTJ8jKWibm/tclrCaZv4nOXWPxv/Zl8EeXTa3gsVQ2GZP
	0As2QcbSQv+txmlM8NG4AZMWyobCfoUf3MaDhjRTzb0u7JJ8hYUcihtCk9LuCQiSdITM
	b9su6Y1J139TfGEoQlAhSJCVldl6LtwnzItasXa1P7Wo4T7MeJhxmq0G3D3bn0/BoyCc
	uKebghyyCX95TuPE1qvdUInFqy45EIKVlxCRQGnfN4pSIqyAOkatBl/hV7YwcOhh0N2Z
	WA8s2aizc06Fw//EG8+pwpLNh9FzLC0i7FnH5M5Mx90aH9SLRZ7Peka8/lJzeqKZUDlW
	cbVA==
X-Gm-Message-State: AHQUAubuZf5VCPRkbuuS5OzOYHvatTM+U1xtYcqsx2mXa+CUbxC2b9Qi
	LLOu+pp/j4HRHTURXad54a23n4fLmvIGLOLZAOY=
X-Google-Smtp-Source: AHgI3IbbtyHDmFbQepd7bF+eeTKoNxG968A6GSliI/IbXepnLIKQsllRav7sz53LyRXO/dQ+KeG4pmBaHfuLIvk+5UE=
X-Received: by 2002:a17:906:f87:: with SMTP id
	q7mr7809628ejj.237.1551204380347; 
	Tue, 26 Feb 2019 10:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20190226180314.16870-1-raj.khem@gmail.com>
In-Reply-To: <20190226180314.16870-1-raj.khem@gmail.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Tue, 26 Feb 2019 10:06:08 -0800
Message-ID: <CAFNP8OtX5i0kHXt1pj0v2HgP+bWUgKUVdkTRfJ=e6cYk=Duhvg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4] default-distrovars: Drop DISTRO_FEATURES_LIBC
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
X-List-Received-Date: Tue, 26 Feb 2019 18:06:20 -0000
Content-Type: multipart/alternative; boundary="0000000000001091a30582cfea1a"

--0000000000001091a30582cfea1a
Content-Type: text/plain; charset="UTF-8"

Hi,

DISTRO_FEATURES_DEFAULT appears in the YP reference manual.  I am going to
remove it for 2.7.

Scott

On Tue, Feb 26, 2019 at 10:03 AM Khem Raj <raj.khem@gmail.com> wrote:

> After eglibc was merged into glibc, Kconfig support was also dropped so
> these libc features therefore are not effective anymore and can be
> removed
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2:
> - Add ipv4 and ipv6 to default distro features, they are not libc
>   specific anyway
> - Remove DISTRO_FEATURES_DEFAULT as this is redundant now
>
> v3:
> - Remove the use of libc-* overrides in metadata
>
> v4:
> - Cleanup further to simplify variable assignments
>
>  meta/classes/image.bbclass                    |  5 -----
>  meta/classes/libc-package.bbclass             |  9 +++------
>  meta/conf/bitbake.conf                        |  4 ++--
>  .../distro/include/default-distrovars.inc     | 11 +----------
>  meta/conf/distro/include/tclibc-glibc.inc     | 19 +++++--------------
>  meta/conf/local.conf.sample.extended          | 16 ++--------------
>  meta/recipes-core/glib-2.0/glib.inc           |  2 --
>  meta/recipes-core/glibc/glibc_2.29.bb         |  3 +--
>  meta/recipes-core/libxml/libxml2_2.9.8.bb     |  2 --
>  meta/recipes-devtools/mtools/mtools_4.0.19.bb |  2 --
>  .../findutils/findutils_4.6.0.bb              |  2 +-
>  meta/recipes-extended/shadow/shadow.inc       |  2 +-
>  meta/recipes-extended/shadow/shadow_4.6.bb    |  2 +-
>  13 files changed, 17 insertions(+), 62 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 11927f39f5..276d0d31f4 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -176,11 +176,6 @@ IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
>
>  LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s,
> d.getVar('IMAGE_LINGUAS').split()))}"
>
> -python () {
> -    if not bb.utils.contains('DISTRO_FEATURES', 'libc-charsets
> libc-locale-code libc-locales', True, False, d):
> -        d.setVar('IMAGE_LINGUAS', '')
> -}
> -
>  # Prefer image, but use the fallback files for lookups if the image ones
>  # aren't yet available.
>  PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
> diff --git a/meta/classes/libc-package.bbclass
> b/meta/classes/libc-package.bbclass
> index 34c9151ae9..8859dad566 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -37,14 +37,11 @@ python __anonymous () {
>                  d.setVar("DEPENDS", depends)
>                  d.setVar("GLIBC_INTERNAL_USE_BINARY_LOCALE", "compile")
>                  break
> -
> -    # try to fix disable charsets/locales/locale-code compile fail
> -    if bb.utils.contains('DISTRO_FEATURES', 'libc-charsets libc-locales
> libc-locale-code', True, False, d):
> -        d.setVar('PACKAGE_NO_GCONV', '0')
> -    else:
> -        d.setVar('PACKAGE_NO_GCONV', '1')
>  }
>
> +# try to fix disable charsets/locales/locale-code compile fail
> +PACKAGE_NO_GCONV ?= "0"
> +
>  OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
>
>  locale_base_postinst_ontarget() {
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 435646a946..1c5369ec98 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -123,7 +123,7 @@ TUNE_ASARGS ??= ""
>  TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
>  LIBCEXTENSION ??= ""
>  ABIEXTENSION ??= ""
> -USE_NLS ??= "${@bb.utils.contains('DISTRO_FEATURES', 'libc-locale-code',
> 'yes', 'no', d)}"
> +USE_NLS ??= "yes"
>  SDKUSE_NLS ??= "yes"
>
>  TARGET_ARCH = "${TUNE_ARCH}"
> @@ -820,7 +820,7 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
>  # Native distro features (will always be used for -native, even if they
>  # are not enabled for target)
>  DISTRO_FEATURES_NATIVE ?= "x11 ipv6 xattr"
> -DISTRO_FEATURES_NATIVESDK ?= "x11 libc-charsets libc-locales
> libc-locale-code"
> +DISTRO_FEATURES_NATIVESDK ?= "x11"
>
>  # Normally target distro features will not be applied to native builds:
>  # Native distro features on this list will use the target feature value
> diff --git a/meta/conf/distro/include/default-distrovars.inc
> b/meta/conf/distro/include/default-distrovars.inc
> index 76edff6480..d57329ec17 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -10,16 +10,7 @@ LOCALE_UTF8_ONLY ?= "0"
>  LOCALE_UTF8_IS_DEFAULT ?= "1"
>  LOCALE_UTF8_IS_DEFAULT_class-nativesdk = "0"
>
> -DISTRO_FEATURES_DEFAULT ?= "acl alsa argp bluetooth ext2 irda largefile
> pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
> -DISTRO_FEATURES_LIBC_DEFAULT ?= "ipv4 ipv6 libc-backtrace libc-big-macros
> libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> -                                       libc-crypt-ufc libc-db-aliases
> libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
> -                                       libc-getlogin libc-idn
> libc-inet-anl libc-libm libc-locales libc-locale-code \
> -                                       libc-memusage libc-nsswitch
> libc-rcmd libc-rtld-debug libc-spawn libc-streams \
> -                                       libc-utmp libc-utmpx libc-wordexp
> libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
> -                                       libc-posix-wchar-io"
> -DISTRO_FEATURES_LIBC ?= "${DISTRO_FEATURES_LIBC_DEFAULT}"
> -DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
> -DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
> +DISTRO_FEATURES ?= "acl alsa argp bluetooth ext2 ipv4 ipv6 irda largefile
> pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
>
>  IMAGE_FEATURES ?= ""
>
> diff --git a/meta/conf/distro/include/tclibc-glibc.inc
> b/meta/conf/distro/include/tclibc-glibc.inc
> index abe619aaac..3246490997 100644
> --- a/meta/conf/distro/include/tclibc-glibc.inc
> +++ b/meta/conf/distro/include/tclibc-glibc.inc
> @@ -22,17 +22,8 @@ LIBC_DEPENDENCIES = "libsegfault \
>                      glibc-dev \
>                      glibc-utils \
>                      glibc-thread-db \
> -                    ${@get_libc_locales_dependencies(d)}"
> -
> -LIBC_LOCALE_DEPENDENCIES = "\
> -       glibc-localedata-i18n \
> -       glibc-gconv-ibm850 \
> -       glibc-gconv-cp1252 \
> -       glibc-gconv-iso8859-1 \
> -       glibc-gconv-iso8859-15"
> -
> -def get_libc_locales_dependencies(d):
> -    if bb.utils.contains('DISTRO_FEATURES', 'libc-charsets
> libc-locale-code libc-locales', True, False, d):
> -        return d.getVar('LIBC_LOCALE_DEPENDENCIES') or ''
> -    else:
> -        return ''
> +                    glibc-localedata-i18n \
> +                    glibc-gconv-ibm850 \
> +                    glibc-gconv-cp1252 \
> +                    glibc-gconv-iso8859-1 \
> +                    glibc-gconv-iso8859-15"
> diff --git a/meta/conf/local.conf.sample.extended
> b/meta/conf/local.conf.sample.extended
> index 010bf6ca6f..0743fefece 100644
> --- a/meta/conf/local.conf.sample.extended
> +++ b/meta/conf/local.conf.sample.extended
> @@ -24,22 +24,10 @@
>  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE = "-j
> 4" would
>  # be appropriate for example.
>
> -
> -# glibc configurability is used to reduce minimal image's size.
> -# the all supported glibc options are listed in DISTRO_FEATURES_LIBC
> -# and disabled by default. Uncomment and copy the DISTRO_FEATURES_LIBC
> -# and DISTRO_FEATURES definitions to local.conf to enable the options.
> -#DISTRO_FEATURES_LIBC = "ipv6 libc-backtrace libc-big-macros libc-bsd
> libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> -#               libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt
> libc-fmtmsg libc-fstab libc-ftraverse \
> -#               libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm
> libc-locales libc-locale-code \
> -#               libc-memusage libc-nsswitch libc-rcmd libc-rtld-debug
> libc-spawn libc-streams \
> -#               libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar
> libc-posix-regexp libc-posix-regexp-glibc \
> -#               libc-posix-wchar-io"
> -
> -#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost
> wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
> +#DISTRO_FEATURES = "alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbgadget
> usbhost wifi nfs zeroconf pci"
>
>  # If you want to get an image based on directfb without x11, Please copy
> this variable to build/conf/local.conf
> -#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia
> usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb
> ${DISTRO_FEATURES_LIBC}"
> +#DISTRO_FEATURES = "alsa argp bluetooth ext2 irda ipv4 ipv6 largefile
> pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb"
>
>  # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary locale
>  # packages at build time using qemu-native. Disabling it (by setting it
> to 0)
> diff --git a/meta/recipes-core/glib-2.0/glib.inc
> b/meta/recipes-core/glib-2.0/glib.inc
> index 6305f553b4..3c2440db0e 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -41,8 +41,6 @@ EXTRA_OEMESON_append_class-target = "
> ${@bb.utils.contains('GTKDOC_ENABLED', 'Tr
>  # meson's python configuration pokes into python3 configuration, so this
> provides the native config to it.
>  unset _PYTHON_SYSCONFIGDATA_NAME
>
> -REQUIRED_DISTRO_FEATURES_libc-glibc = "${@'libc-charsets libc-locale-code
> libc-locales' if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False,
> d) else ''}"
> -
>  S = "${WORKDIR}/glib-${PV}"
>
>  PACKAGECONFIG ??= "system-pcre libmount"
> diff --git a/meta/recipes-core/glibc/glibc_2.29.bb
> b/meta/recipes-core/glibc/glibc_2.29.bb
> index beddbffee2..bd8aa6d503 100644
> --- a/meta/recipes-core/glibc/glibc_2.29.bb
> +++ b/meta/recipes-core/glibc/glibc_2.29.bb
> @@ -89,12 +89,11 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>                  --enable-stackguard-randomization \
>                  --disable-crypt \
>                  --with-default-link \
> +                --enable-nscd \
>                  ${GLIBCPIE} \
>                  ${GLIBC_EXTRA_OECONF}"
>
>  EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
> -EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'libc-inet-anl',
> '--enable-nscd', '--disable-nscd', d)}"
> -
>
>  do_patch_append() {
>      bb.build.exec_func('do_fix_readlib_c', d)
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb
> b/meta/recipes-core/libxml/libxml2_2.9.8.bb
> index 0e2461154b..62643bc764 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
> @@ -42,8 +42,6 @@ inherit autotools pkgconfig binconfig-disabled ptest
> distro_features_check
>
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3native',
> '', d)}
>
> -REQUIRED_DISTRO_FEATURES_libc-glibc = "${@'libc-charsets libc-locale-code
> libc-locales' if bb.utils.contains('DISTRO_FEATURES', 'ptest', True, False,
> d) else ''}"
> -
>  RDEPENDS_${PN}-ptest += "make ${@bb.utils.contains('PACKAGECONFIG',
> 'python', 'libgcc python3-core python3-logging python3-shell
> python3-stringold python3-threading python3-unittest ${PN}-python', '', d)}"
>
>  RDEPENDS_${PN}-python += "${@bb.utils.contains('PACKAGECONFIG', 'python',
> 'python3-core', '', d)}"
> diff --git a/meta/recipes-devtools/mtools/mtools_4.0.19.bb
> b/meta/recipes-devtools/mtools/mtools_4.0.19.bb
> index 9972762b4e..7d59d93a81 100644
> --- a/meta/recipes-devtools/mtools/mtools_4.0.19.bb
> +++ b/meta/recipes-devtools/mtools/mtools_4.0.19.bb
> @@ -39,8 +39,6 @@ SRC_URI_append_class-native = "
> file://disable-hardcoded-configs.patch"
>
>  inherit autotools texinfo distro_features_check
>
> -REQUIRED_DISTRO_FEATURES_libc-glibc = "libc-charsets libc-locale-code
> libc-locales"
> -
>  EXTRA_OECONF = "--without-x"
>
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-extended/findutils/findutils_4.6.0.bb
> b/meta/recipes-extended/findutils/findutils_4.6.0.bb
> index 5e4ca94868..3b62ed9962 100644
> --- a/meta/recipes-extended/findutils/findutils_4.6.0.bb
> +++ b/meta/recipes-extended/findutils/findutils_4.6.0.bb
> @@ -16,6 +16,6 @@ SRC_URI[md5sum] = "9936aa8009438ce185bea2694a997fc1"
>  SRC_URI[sha256sum] =
> "ded4c9f73731cd48fec3b6bdaccce896473b6d8e337e9612e16cf1431bb1169d"
>
>  # http://savannah.gnu.org/bugs/?27299
> -CACHED_CONFIGUREVARS += "${@bb.utils.contains('DISTRO_FEATURES',
> 'libc-posix-clang-wchar', 'gl_cv_func_wcwidth_works=yes', '', d)}"
> +CACHED_CONFIGUREVARS += "gl_cv_func_wcwidth_works=yes"
>
>  EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
> diff --git a/meta/recipes-extended/shadow/shadow.inc
> b/meta/recipes-extended/shadow/shadow.inc
> index 09c37ef8a3..2b20bdcb25 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -57,7 +57,7 @@ EXTRA_OECONF += "--without-audit \
>  NSCDOPT = ""
>  NSCDOPT_class-native = "--without-nscd"
>  NSCDOPT_class-nativesdk = "--without-nscd"
> -NSCDOPT_libc-glibc = "${@bb.utils.contains('DISTRO_FEATURES',
> 'libc-spawn', '--with-nscd', '--without-nscd', d)}"
> +NSCDOPT_libc-glibc = "--with-nscd"
>
>  PAM_PLUGINS = "libpam-runtime \
>                 pam-plugin-faildelay \
> diff --git a/meta/recipes-extended/shadow/shadow_4.6.bb
> b/meta/recipes-extended/shadow/shadow_4.6.bb
> index 5675cb8cc9..c975395ff8 100644
> --- a/meta/recipes-extended/shadow/shadow_4.6.bb
> +++ b/meta/recipes-extended/shadow/shadow_4.6.bb
> @@ -2,7 +2,7 @@ require shadow.inc
>
>  # Build falsely assumes that if --enable-libpam is set, we don't need to
> link against
>  # libcrypt. This breaks chsh.
> -BUILD_LDFLAGS_append_class-target = "
> ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> bb.utils.contains('DISTRO_FEATURES', 'libc-crypt',  '-lcrypt', '', d), '',
> d)}"
> +BUILD_LDFLAGS_append_class-target = "
> ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '-lcrypt', '', d)}"
>
>  BBCLASSEXTEND = "native nativesdk"
>
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001091a30582cfea1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, <br></div><div><br></div><div>DISTRO_FEATURES_DEF=
AULT appears in the YP reference manual.=C2=A0 I am going to remove it for =
2.7.</div><div><br></div><div>Scott<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 26, 2019 at 10:03 =
AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Aft=
er eglibc was merged into glibc, Kconfig support was also dropped so<br>
these libc features therefore are not effective anymore and can be<br>
removed<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v2:<br>
- Add ipv4 and ipv6 to default distro features, they are not libc<br>
=C2=A0 specific anyway<br>
- Remove DISTRO_FEATURES_DEFAULT as this is redundant now<br>
<br>
v3:<br>
- Remove the use of libc-* overrides in metadata<br>
<br>
v4:<br>
- Cleanup further to simplify variable assignments<br>
<br>
=C2=A0meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 -----<br>
=C2=A0meta/classes/libc-package.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 9 +++------<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0.../distro/include/default-distrovars.inc=C2=A0 =C2=A0 =C2=A0| 11 +--=
--------<br>
=C2=A0meta/conf/distro/include/tclibc-glibc.inc=C2=A0 =C2=A0 =C2=A0| 19 +++=
++--------------<br>
=C2=A0meta/conf/local.conf.sample.extended=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 16 ++--------------<br>
=C2=A0meta/recipes-core/glib-2.0/glib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 --<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.29.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.29.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 3 +--<br>
=C2=A0meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">libxml2_2.9.8.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 --<br>
=C2=A0meta/recipes-devtools/mtools/<a href=3D"http://mtools_4.0.19.bb" rel=
=3D"noreferrer" target=3D"_blank">mtools_4.0.19.bb</a> |=C2=A0 2 --<br>
=C2=A0.../findutils/<a href=3D"http://findutils_4.6.0.bb" rel=3D"noreferrer=
" target=3D"_blank">findutils_4.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-extended/shadow/shadow.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0meta/recipes-extended/shadow/<a href=3D"http://shadow_4.6.bb" rel=3D"=
noreferrer" target=3D"_blank">shadow_4.6.bb</a>=C2=A0 =C2=A0 |=C2=A0 2 +-<b=
r>
=C2=A013 files changed, 17 insertions(+), 62 deletions(-)<br>
<br>
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>
index 11927f39f5..276d0d31f4 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -176,11 +176,6 @@ IMAGE_LINGUAS ?=3D &quot;de-de fr-fr en-gb&quot;<br>
<br>
=C2=A0LINGUAS_INSTALL ?=3D &quot;${@&quot; &quot;.join(map(lambda s: &quot;=
locale-base-%s&quot; % s, d.getVar(&#39;IMAGE_LINGUAS&#39;).split()))}&quot=
;<br>
<br>
-python () {<br>
-=C2=A0 =C2=A0 if not bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;lib=
c-charsets libc-locale-code libc-locales&#39;, True, False, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;IMAGE_LINGUAS&#39;, &#39;&#39;)<=
br>
-}<br>
-<br>
=C2=A0# Prefer image, but use the fallback files for lookups if the image o=
nes<br>
=C2=A0# aren&#39;t yet available.<br>
=C2=A0PSEUDO_PASSWD =3D &quot;${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}&quot;<b=
r>
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.=
bbclass<br>
index 34c9151ae9..8859dad566 100644<br>
--- a/meta/classes/libc-package.bbclass<br>
+++ b/meta/classes/libc-package.bbclass<br>
@@ -37,14 +37,11 @@ python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quo=
t;DEPENDS&quot;, depends)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&quo=
t;GLIBC_INTERNAL_USE_BINARY_LOCALE&quot;, &quot;compile&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
-<br>
-=C2=A0 =C2=A0 # try to fix disable charsets/locales/locale-code compile fa=
il<br>
-=C2=A0 =C2=A0 if bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;libc-ch=
arsets libc-locales libc-locale-code&#39;, True, False, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;PACKAGE_NO_GCONV&#39;, &#39;0&#3=
9;)<br>
-=C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;PACKAGE_NO_GCONV&#39;, &#39;1&#3=
9;)<br>
=C2=A0}<br>
<br>
+# try to fix disable charsets/locales/locale-code compile fail<br>
+PACKAGE_NO_GCONV ?=3D &quot;0&quot;<br>
+<br>
=C2=A0OVERRIDES_append =3D &quot;:${TARGET_ARCH}-${TARGET_OS}&quot;<br>
<br>
=C2=A0locale_base_postinst_ontarget() {<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 435646a946..1c5369ec98 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -123,7 +123,7 @@ TUNE_ASARGS ??=3D &quot;&quot;<br>
=C2=A0TUNE_FEATURES ??=3D &quot;${TUNE_FEATURES_tune-${DEFAULTTUNE}}&quot;<=
br>
=C2=A0LIBCEXTENSION ??=3D &quot;&quot;<br>
=C2=A0ABIEXTENSION ??=3D &quot;&quot;<br>
-USE_NLS ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;l=
ibc-locale-code&#39;, &#39;yes&#39;, &#39;no&#39;, d)}&quot;<br>
+USE_NLS ??=3D &quot;yes&quot;<br>
=C2=A0SDKUSE_NLS ??=3D &quot;yes&quot;<br>
<br>
=C2=A0TARGET_ARCH =3D &quot;${TUNE_ARCH}&quot;<br>
@@ -820,7 +820,7 @@ IMAGE_FEATURES +=3D &quot;${EXTRA_IMAGE_FEATURES}&quot;=
<br>
=C2=A0# Native distro features (will always be used for -native, even if th=
ey<br>
=C2=A0# are not enabled for target)<br>
=C2=A0DISTRO_FEATURES_NATIVE ?=3D &quot;x11 ipv6 xattr&quot;<br>
-DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11 libc-charsets libc-locales libc-l=
ocale-code&quot;<br>
+DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br>
<br>
=C2=A0# Normally target distro features will not be applied to native build=
s:<br>
=C2=A0# Native distro features on this list will use the target feature val=
ue<br>
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/di=
stro/include/default-distrovars.inc<br>
index 76edff6480..d57329ec17 100644<br>
--- a/meta/conf/distro/include/default-distrovars.inc<br>
+++ b/meta/conf/distro/include/default-distrovars.inc<br>
@@ -10,16 +10,7 @@ LOCALE_UTF8_ONLY ?=3D &quot;0&quot;<br>
=C2=A0LOCALE_UTF8_IS_DEFAULT ?=3D &quot;1&quot;<br>
=C2=A0LOCALE_UTF8_IS_DEFAULT_class-nativesdk =3D &quot;0&quot;<br>
<br>
-DISTRO_FEATURES_DEFAULT ?=3D &quot;acl alsa argp bluetooth ext2 irda large=
file pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11&quot;<=
br>
-DISTRO_FEATURES_LIBC_DEFAULT ?=3D &quot;ipv4 ipv6 libc-backtrace libc-big-=
macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-cryp=
t-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftrav=
erse \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-getl=
ogin libc-idn libc-inet-anl libc-libm libc-locales libc-locale-code \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-memu=
sage libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-utmp=
 libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posi=
x-regexp-glibc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-posi=
x-wchar-io&quot;<br>
-DISTRO_FEATURES_LIBC ?=3D &quot;${DISTRO_FEATURES_LIBC_DEFAULT}&quot;<br>
-DISTRO_FEATURES_LIBC_class-nativesdk =3D &quot;${DISTRO_FEATURES_LIBC_DEFA=
ULT}&quot;<br>
-DISTRO_FEATURES ?=3D &quot;${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LI=
BC}&quot;<br>
+DISTRO_FEATURES ?=3D &quot;acl alsa argp bluetooth ext2 ipv4 ipv6 irda lar=
gefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11&quot=
;<br>
<br>
=C2=A0IMAGE_FEATURES ?=3D &quot;&quot;<br>
<br>
diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/i=
nclude/tclibc-glibc.inc<br>
index abe619aaac..3246490997 100644<br>
--- a/meta/conf/distro/include/tclibc-glibc.inc<br>
+++ b/meta/conf/distro/include/tclibc-glibc.inc<br>
@@ -22,17 +22,8 @@ LIBC_DEPENDENCIES =3D &quot;libsegfault \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0glibc-dev \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0glibc-utils \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0glibc-thread-db \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@g=
et_libc_locales_dependencies(d)}&quot;<br>
-<br>
-LIBC_LOCALE_DEPENDENCIES =3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-localedata-i18n \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv-ibm850 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv-cp1252 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv-iso8859-1 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv-iso8859-15&quot;<br>
-<br>
-def get_libc_locales_dependencies(d):<br>
-=C2=A0 =C2=A0 if bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;libc-ch=
arsets libc-locale-code libc-locales&#39;, True, False, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return d.getVar(&#39;LIBC_LOCALE_DEPENDENCIES&=
#39;) or &#39;&#39;<br>
-=C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib=
c-localedata-i18n \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib=
c-gconv-ibm850 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib=
c-gconv-cp1252 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib=
c-gconv-iso8859-1 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib=
c-gconv-iso8859-15&quot;<br>
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sa=
mple.extended<br>
index 010bf6ca6f..0743fefece 100644<br>
--- a/meta/conf/local.conf.sample.extended<br>
+++ b/meta/conf/local.conf.sample.extended<br>
@@ -24,22 +24,10 @@<br>
=C2=A0# For a quad-core machine, BB_NUMBER_THREADS =3D &quot;4&quot;, PARAL=
LEL_MAKE =3D &quot;-j 4&quot; would<br>
=C2=A0# be appropriate for example.<br>
<br>
-<br>
-# glibc configurability is used to reduce minimal image&#39;s size.<br>
-# the all supported glibc options are listed in DISTRO_FEATURES_LIBC<br>
-# and disabled by default. Uncomment and copy the DISTRO_FEATURES_LIBC<br>
-# and DISTRO_FEATURES definitions to local.conf to enable the options.<br>
-#DISTRO_FEATURES_LIBC =3D &quot;ipv6 libc-backtrace libc-big-macros libc-b=
sd libc-cxx-tests libc-catgets libc-charsets libc-crypt \<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-crypt-ufc lib=
c-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \<br=
>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-getlogin libc=
-idn libc-inet libc-inet-anl libc-libm libc-locales libc-locale-code \<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-memusage libc=
-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams \<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-utmp libc-utm=
px libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-=
glibc \<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libc-posix-wchar-i=
o&quot;<br>
-<br>
-#DISTRO_FEATURES =3D &quot;alsa bluetooth ext2 irda pcmcia usbgadget usbho=
st wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}&quot;<br>
+#DISTRO_FEATURES =3D &quot;alsa bluetooth ext2 irda ipv4 ipv6 pcmcia usbga=
dget usbhost wifi nfs zeroconf pci&quot;<br>
<br>
=C2=A0# If you want to get an image based on directfb without x11, Please c=
opy this variable to build/conf/local.conf<br>
-#DISTRO_FEATURES =3D &quot;alsa argp bluetooth ext2 irda largefile pcmcia =
usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb ${DISTRO_FEATURES=
_LIBC}&quot;<br>
+#DISTRO_FEATURES =3D &quot;alsa argp bluetooth ext2 irda ipv4 ipv6 largefi=
le pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g directfb&quot;<b=
r>
<br>
=C2=A0# ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary l=
ocale<br>
=C2=A0# packages at build time using qemu-native. Disabling it (by setting =
it to 0)<br>
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc<br>
index 6305f553b4..3c2440db0e 100644<br>
--- a/meta/recipes-core/glib-2.0/glib.inc<br>
+++ b/meta/recipes-core/glib-2.0/glib.inc<br>
@@ -41,8 +41,6 @@ EXTRA_OEMESON_append_class-target =3D &quot; ${@bb.utils.=
contains(&#39;GTKDOC_ENABLED&#39;, &#39;Tr<br>
=C2=A0# meson&#39;s python configuration pokes into python3 configuration, =
so this provides the native config to it.<br>
=C2=A0unset _PYTHON_SYSCONFIGDATA_NAME<br>
<br>
-REQUIRED_DISTRO_FEATURES_libc-glibc =3D &quot;${@&#39;libc-charsets libc-l=
ocale-code libc-locales&#39; if bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;ptest&#39;, True, False, d) else &#39;&#39;}&quot;<br>
-<br>
=C2=A0S =3D &quot;${WORKDIR}/glib-${PV}&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;system-pcre libmount&quot;<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.29.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.29.bb</a> b/meta/recipes-core/gli=
bc/<a href=3D"http://glibc_2.29.bb" rel=3D"noreferrer" target=3D"_blank">gl=
ibc_2.29.bb</a><br>
index beddbffee2..bd8aa6d503 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.29.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.29.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.29.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.29.bb</a><br>
@@ -89,12 +89,11 @@ EXTRA_OECONF =3D &quot;--enable-kernel=3D${OLDEST_KERNE=
L} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-stac=
kguard-randomization \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-cry=
pt \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-defaul=
t-link \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-nscd \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GLIBCPIE} \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${GLIBC_EXTRA=
_OECONF}&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;${@get_libc_fpu_setting(bb, d)}&quot;<br>
-EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;libc-inet-anl&#39;, &#39;--enable-nscd&#39;, &#39;--disable-nscd&#39;, d=
)}&quot;<br>
-<br>
<br>
=C2=A0do_patch_append() {<br>
=C2=A0 =C2=A0 =C2=A0bb.build.exec_func(&#39;do_fix_readlib_c&#39;, d)<br>
diff --git a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.8.bb" r=
el=3D"noreferrer" target=3D"_blank">libxml2_2.9.8.bb</a> b/meta/recipes-cor=
e/libxml/<a href=3D"http://libxml2_2.9.8.bb" rel=3D"noreferrer" target=3D"_=
blank">libxml2_2.9.8.bb</a><br>
index 0e2461154b..62643bc764 100644<br>
--- a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">libxml2_2.9.8.bb</a><br>
+++ b/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">libxml2_2.9.8.bb</a><br>
@@ -42,8 +42,6 @@ inherit autotools pkgconfig binconfig-disabled ptest dist=
ro_features_check<br>
<br>
=C2=A0inherit ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;python&#39=
;, &#39;python3native&#39;, &#39;&#39;, d)}<br>
<br>
-REQUIRED_DISTRO_FEATURES_libc-glibc =3D &quot;${@&#39;libc-charsets libc-l=
ocale-code libc-locales&#39; if bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;ptest&#39;, True, False, d) else &#39;&#39;}&quot;<br>
-<br>
=C2=A0RDEPENDS_${PN}-ptest +=3D &quot;make ${@bb.utils.contains(&#39;PACKAG=
ECONFIG&#39;, &#39;python&#39;, &#39;libgcc python3-core python3-logging py=
thon3-shell=C2=A0 python3-stringold python3-threading python3-unittest ${PN=
}-python&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0RDEPENDS_${PN}-python +=3D &quot;${@bb.utils.contains(&#39;PACKAGECON=
FIG&#39;, &#39;python&#39;, &#39;python3-core&#39;, &#39;&#39;, d)}&quot;<b=
r>
diff --git a/meta/recipes-devtools/mtools/<a href=3D"http://mtools_4.0.19.b=
b" rel=3D"noreferrer" target=3D"_blank">mtools_4.0.19.bb</a> b/meta/recipes=
-devtools/mtools/<a href=3D"http://mtools_4.0.19.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mtools_4.0.19.bb</a><br>
index 9972762b4e..7d59d93a81 100644<br>
--- a/meta/recipes-devtools/mtools/<a href=3D"http://mtools_4.0.19.bb" rel=
=3D"noreferrer" target=3D"_blank">mtools_4.0.19.bb</a><br>
+++ b/meta/recipes-devtools/mtools/<a href=3D"http://mtools_4.0.19.bb" rel=
=3D"noreferrer" target=3D"_blank">mtools_4.0.19.bb</a><br>
@@ -39,8 +39,6 @@ SRC_URI_append_class-native =3D &quot; file://disable-har=
dcoded-configs.patch&quot;<br>
<br>
=C2=A0inherit autotools texinfo distro_features_check<br>
<br>
-REQUIRED_DISTRO_FEATURES_libc-glibc =3D &quot;libc-charsets libc-locale-co=
de libc-locales&quot;<br>
-<br>
=C2=A0EXTRA_OECONF =3D &quot;--without-x&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta/recipes-extended/findutils/<a href=3D"http://findutils_4.=
6.0.bb" rel=3D"noreferrer" target=3D"_blank">findutils_4.6.0.bb</a> b/meta/=
recipes-extended/findutils/<a href=3D"http://findutils_4.6.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">findutils_4.6.0.bb</a><br>
index 5e4ca94868..3b62ed9962 100644<br>
--- a/meta/recipes-extended/findutils/<a href=3D"http://findutils_4.6.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">findutils_4.6.0.bb</a><br>
+++ b/meta/recipes-extended/findutils/<a href=3D"http://findutils_4.6.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">findutils_4.6.0.bb</a><br>
@@ -16,6 +16,6 @@ SRC_URI[md5sum] =3D &quot;9936aa8009438ce185bea2694a997fc=
1&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ded4c9f73731cd48fec3b6bdaccce896473b6d8e=
337e9612e16cf1431bb1169d&quot;<br>
<br>
=C2=A0# <a href=3D"http://savannah.gnu.org/bugs/?27299" rel=3D"noreferrer" =
target=3D"_blank">http://savannah.gnu.org/bugs/?27299</a><br>
-CACHED_CONFIGUREVARS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&=
#39;, &#39;libc-posix-clang-wchar&#39;, &#39;gl_cv_func_wcwidth_works=3Dyes=
&#39;, &#39;&#39;, d)}&quot;<br>
+CACHED_CONFIGUREVARS +=3D &quot;gl_cv_func_wcwidth_works=3Dyes&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;ac_cv_path_SORT=3D${bindir}/sort&quot;<br>
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extende=
d/shadow/shadow.inc<br>
index 09c37ef8a3..2b20bdcb25 100644<br>
--- a/meta/recipes-extended/shadow/shadow.inc<br>
+++ b/meta/recipes-extended/shadow/shadow.inc<br>
@@ -57,7 +57,7 @@ EXTRA_OECONF +=3D &quot;--without-audit \<br>
=C2=A0NSCDOPT =3D &quot;&quot;<br>
=C2=A0NSCDOPT_class-native =3D &quot;--without-nscd&quot;<br>
=C2=A0NSCDOPT_class-nativesdk =3D &quot;--without-nscd&quot;<br>
-NSCDOPT_libc-glibc =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;libc-spawn&#39;, &#39;--with-nscd&#39;, &#39;--without-nscd&#39;, d=
)}&quot;<br>
+NSCDOPT_libc-glibc =3D &quot;--with-nscd&quot;<br>
<br>
=C2=A0PAM_PLUGINS =3D &quot;libpam-runtime \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pam-plugin-faildela=
y \<br>
diff --git a/meta/recipes-extended/shadow/<a href=3D"http://shadow_4.6.bb" =
rel=3D"noreferrer" target=3D"_blank">shadow_4.6.bb</a> b/meta/recipes-exten=
ded/shadow/<a href=3D"http://shadow_4.6.bb" rel=3D"noreferrer" target=3D"_b=
lank">shadow_4.6.bb</a><br>
index 5675cb8cc9..c975395ff8 100644<br>
--- a/meta/recipes-extended/shadow/<a href=3D"http://shadow_4.6.bb" rel=3D"=
noreferrer" target=3D"_blank">shadow_4.6.bb</a><br>
+++ b/meta/recipes-extended/shadow/<a href=3D"http://shadow_4.6.bb" rel=3D"=
noreferrer" target=3D"_blank">shadow_4.6.bb</a><br>
@@ -2,7 +2,7 @@ require shadow.inc<br>
<br>
=C2=A0# Build falsely assumes that if --enable-libpam is set, we don&#39;t =
need to link against<br>
=C2=A0# libcrypt. This breaks chsh.<br>
-BUILD_LDFLAGS_append_class-target =3D &quot; ${@bb.utils.contains(&#39;DIS=
TRO_FEATURES&#39;, &#39;pam&#39;, bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;libc-crypt&#39;,=C2=A0 &#39;-lcrypt&#39;, &#39;&#39;, d), &#39;&#3=
9;, d)}&quot;<br>
+BUILD_LDFLAGS_append_class-target =3D &quot; ${@bb.utils.contains(&#39;DIS=
TRO_FEATURES&#39;, &#39;pam&#39;, &#39;-lcrypt&#39;, &#39;&#39;, d)}&quot;<=
br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-- <br>
2.21.0<br>
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

--0000000000001091a30582cfea1a--
