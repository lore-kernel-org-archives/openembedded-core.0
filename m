Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web11.10257.1608034889501512070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 04:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OZAFIFF5;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id t15so6619172ual.6
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 04:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C6eWbDVm4pdRRjY2cVXBa1FqvdWf0mHpMrX6lwzSMXk=;
        b=OZAFIFF5rregFdQWfxUgHpJ5kGQE9zudH3xbJKkUB8GLDHmkXtJbnxKAqKp0O1xOZ8
         zcmcY/8QpLGhs1aQrYgT10wCohWjX+gnr2aToWumKbBXdUmBGB0wWXsm4zLY+UM1QqVQ
         C/1SOWtK1C8pPSMLtbWh4kY/DO9vv0TRt5XrTPdPEb67FG+PRIccPJj286kUp8cfoqoW
         6ZEhn23cPc1F0Mkm5NMFl2o1cyH5ROVK4M4GIJO1p9ZY1i/kua1YjM7r5xK4JnkzFFgU
         ZQXTys6N8lpep3c9MqEfBaN23N9b7sQ592Xsi+XbT5+WO8ZY2jg9x+34JG2Nf1dkKGAh
         tsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C6eWbDVm4pdRRjY2cVXBa1FqvdWf0mHpMrX6lwzSMXk=;
        b=CPAkgnpRt4pNJ2QJ64r5n3mlzXbQPm/9xXB/xni49cUh3sWOkeN+WFJAfpJ1J6hB8p
         D/xJCho3HIMj5DUVsSEPeppLNWgnxSXezGyTADt4HnGxsp45+tzHrDToirtLMyhCMBTQ
         2xh7n3L1puTFkxI7gsOwkLWTV6cJOEn/T9ZEo+y2J0eINbJtiV8PwV2YPBA0AYrbAROh
         jXuKQGK2eFu0F/vvg1peo0+5kePwTZon+tDkxLHhn6B3OwJphelTHozLcZKXZCX6hDtD
         ww1KrJB0yxCGPv2BZTc2tBpU1+degXbMSTfSUeo1L80l7DXxdlqjxj5x9sTs7XU1NydS
         JKSg==
X-Gm-Message-State: AOAM5301oU3d1khYOd+fJliTeHLvU5lRvm39zUe3MA5Vj4JuR0mFCVsJ
	P3RNBkF5ZevsgojmiEZ5tidyAO1bazOkoFY28zQ=
X-Google-Smtp-Source: ABdhPJxG9mhdGHrCL7T9mkv6M6+MBBZb2gL3Bik6UW3jFMPb/D/NDzgDTeZxjhcH93B1T6BG+nELioMJ1BAGiwb84X8=
X-Received: by 2002:ab0:4597:: with SMTP id u23mr28246613uau.100.1608034888566;
 Tue, 15 Dec 2020 04:21:28 -0800 (PST)
MIME-Version: 1.0
References: <1608032871-33027-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
In-Reply-To: <1608032871-33027-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 15 Dec 2020 13:21:17 +0100
Message-ID: <CANNYZj8Ng53g6adFFHyLJHft_+9DHg6WmCi4UJ2nJa8LZ2Ponw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Update 1.1.1h -> 1.1.1i
To: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000051cbcd05b67fcc16"

--00000000000051cbcd05b67fcc16
Content-Type: text/plain; charset="UTF-8"

Please set up git so that it detects file renames - the patch is impossible
to review.

Alex

On Tue, 15 Dec 2020 at 12:48, Jamaluddin, Khairul Rohaizzat <
khairul.rohaizzat.jamaluddin@intel.com> wrote:

> From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com
> >
>
> update version to 1.1.1i
>
> openssl 1.1.1i Fixed NULL pointer deref in GENERAL_NAME_cmp (CVE-2020-1971)
>
> updates include fix for CVE:
> CVE-2020-1971
>
> Signed-off-by: Khairul Rohaizzat Jamaluddin <
> khairul.rohaizzat.jamaluddin@intel.com>
> ---
>  .../recipes-connectivity/openssl/openssl_1.1.1h.bb | 216
> ---------------------
>  .../recipes-connectivity/openssl/openssl_1.1.1i.bb | 216
> +++++++++++++++++++++
>  2 files changed, 216 insertions(+), 216 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
>  create mode 100644 meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
> deleted file mode 100644
> index 1827167..0000000
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
> +++ /dev/null
> @@ -1,216 +0,0 @@
> -SUMMARY = "Secure Socket Layer"
> -DESCRIPTION = "Secure Socket Layer (SSL) binary and related cryptographic
> tools."
> -HOMEPAGE = "http://www.openssl.org/"
> -BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
> -SECTION = "libs/network"
> -
> -# "openssl" here actually means both OpenSSL and SSLeay licenses apply
> -# (see meta/files/common-licenses/OpenSSL to which "openssl" is
> SPDXLICENSEMAPped)
> -LICENSE = "openssl"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"
> -
> -DEPENDS = "hostperl-runtime-native"
> -
> -SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
> -           file://run-ptest \
> -           file://0001-skip-test_symbol_presence.patch \
> -
>  file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
> -           file://afalg.patch \
> -           file://reproducible.patch \
> -           "
> -
> -SRC_URI_append_class-nativesdk = " \
> -           file://environment.d-openssl.sh \
> -           "
> -
> -SRC_URI[sha256sum] =
> "5c9ca8774bd7b03e5784f26ae9e9e6d749c9da2438545077e6b3d755a06595d9"
> -
> -inherit lib_package multilib_header multilib_script ptest
> -MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
> -
> -PACKAGECONFIG ?= ""
> -PACKAGECONFIG_class-native = ""
> -PACKAGECONFIG_class-nativesdk = ""
> -
> -PACKAGECONFIG[cryptodev-linux] =
> "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
> -
> -B = "${WORKDIR}/build"
> -do_configure[cleandirs] = "${B}"
> -
> -#| ./libcrypto.so: undefined reference to `getcontext'
> -#| ./libcrypto.so: undefined reference to `setcontext'
> -#| ./libcrypto.so: undefined reference to `makecontext'
> -EXTRA_OECONF_append_libc-musl = " no-async"
> -EXTRA_OECONF_append_libc-musl_powerpc64 = " no-asm"
> -
> -# adding devrandom prevents openssl from using getrandom() which is not
> available on older glibc versions
> -# (native versions can be built with newer glibc, but then relocated onto
> a system with older glibc)
> -EXTRA_OECONF_class-native = "--with-rand-seed=os,devrandom"
> -EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
> -
> -# Relying on hardcoded built-in paths causes openssl-native to not be
> relocateable from sstate.
> -CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin
> -DENGINESDIR=/not/builtin"
> -CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin
> -DENGINESDIR=/not/builtin"
> -
> -do_configure () {
> -       os=${HOST_OS}
> -       case $os in
> -       linux-gnueabi |\
> -       linux-gnuspe |\
> -       linux-musleabi |\
> -       linux-muslspe |\
> -       linux-musl )
> -               os=linux
> -               ;;
> -       *)
> -               ;;
> -       esac
> -       target="$os-${HOST_ARCH}"
> -       case $target in
> -       linux-arm*)
> -               target=linux-armv4
> -               ;;
> -       linux-aarch64*)
> -               target=linux-aarch64
> -               ;;
> -       linux-i?86 | linux-viac3)
> -               target=linux-x86
> -               ;;
> -       linux-gnux32-x86_64 | linux-muslx32-x86_64 )
> -               target=linux-x32
> -               ;;
> -       linux-gnu64-x86_64)
> -               target=linux-x86_64
> -               ;;
> -       linux-mips | linux-mipsel)
> -               # specifying TARGET_CC_ARCH prevents openssl from
> (incorrectly) adding target architecture flags
> -               target="linux-mips32 ${TARGET_CC_ARCH}"
> -               ;;
> -       linux-gnun32-mips*)
> -               target=linux-mips64
> -               ;;
> -       linux-*-mips64 | linux-mips64 | linux-*-mips64el | linux-mips64el)
> -               target=linux64-mips64
> -               ;;
> -       linux-microblaze* | linux-nios2* | linux-sh3 | linux-sh4 |
> linux-arc*)
> -               target=linux-generic32
> -               ;;
> -       linux-powerpc)
> -               target=linux-ppc
> -               ;;
> -       linux-powerpc64)
> -               target=linux-ppc64
> -               ;;
> -       linux-powerpc64le)
> -               target=linux-ppc64le
> -               ;;
> -       linux-riscv32)
> -               target=linux-generic32
> -               ;;
> -       linux-riscv64)
> -               target=linux-generic64
> -               ;;
> -       linux-sparc | linux-supersparc)
> -               target=linux-sparcv9
> -               ;;
> -       esac
> -
> -       useprefix=${prefix}
> -       if [ "x$useprefix" = "x" ]; then
> -               useprefix=/
> -       fi
> -       # WARNING: do not set compiler/linker flags (-I/-D etc.) in
> EXTRA_OECONF, as they will fully replace the
> -       # environment variables set by bitbake. Adjust the environment
> variables instead.
> -       HASHBANGPERL="/usr/bin/env perl" PERL=perl
> PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
> -       perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS}
> --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir}
> $target
> -       perl ${B}/configdata.pm --dump
> -}
> -
> -do_install () {
> -       oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
> -
> -       oe_multilib_header openssl/opensslconf.h
> -
> -       # Create SSL structure for packages such as ca-certificates which
> -       # contain hard-coded paths to /etc/ssl. Debian does the same.
> -       install -d ${D}${sysconfdir}/ssl
> -       mv ${D}${libdir}/ssl-1.1/certs \
> -          ${D}${libdir}/ssl-1.1/private \
> -          ${D}${libdir}/ssl-1.1/openssl.cnf \
> -          ${D}${sysconfdir}/ssl/
> -
> -       # Although absolute symlinks would be OK for the target, they
> become
> -       # invalid if native or nativesdk are relocated from sstate.
> -       ln -sf ${@oe.path.relative('${libdir}/ssl-1.1',
> '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl-1.1/certs
> -       ln -sf ${@oe.path.relative('${libdir}/ssl-1.1',
> '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl-1.1/private
> -       ln -sf ${@oe.path.relative('${libdir}/ssl-1.1',
> '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-1.1/openssl.cnf
> -}
> -
> -do_install_append_class-native () {
> -       create_wrapper ${D}${bindir}/openssl \
> -           OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
> -           SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
> -           SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
> -           OPENSSL_ENGINES=${libdir}/engines-1.1
> -}
> -
> -do_install_append_class-nativesdk () {
> -       mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> -       install -m 644 ${WORKDIR}/environment.d-openssl.sh
> ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
> -       sed 's|/usr/lib/ssl/|/usr/lib/ssl-1.1/|g' -i
> ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
> -}
> -
> -PTEST_BUILD_HOST_FILES += "configdata.pm"
> -PTEST_BUILD_HOST_PATTERN = "perl_version ="
> -do_install_ptest () {
> -       # Prune the build tree
> -       rm -f ${B}/fuzz/*.* ${B}/test/*.*
> -
> -       cp ${S}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
> -       cp -r ${S}/external ${B}/test ${S}/test ${B}/fuzz ${S}/util
> ${B}/util ${D}${PTEST_PATH}
> -
> -       # For test_shlibload
> -       ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/
> -       ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH}/
> -
> -       install -d ${D}${PTEST_PATH}/apps
> -       ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
> -       install -m644 ${S}/apps/*.pem ${S}/apps/*.srl
> ${S}/apps/openssl.cnf ${D}${PTEST_PATH}/apps
> -       install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
> -
> -       install -d ${D}${PTEST_PATH}/engines
> -       install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
> -}
> -
> -# Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
> -# package RRECOMMENDS on this package. This will enable the configuration
> -# file to be installed for both the openssl-bin package and the libcrypto
> -# package since the openssl-bin package depends on the libcrypto package.
> -
> -PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
> -
> -FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
> -FILES_libssl = "${libdir}/libssl${SOLIBS}"
> -FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf \
> -                      ${libdir}/ssl-1.1/openssl.cnf* \
> -                      "
> -FILES_${PN}-engines = "${libdir}/engines-1.1"
> -FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
> -FILES_${PN} =+ "${libdir}/ssl-1.1/*"
> -FILES_${PN}_append_class-nativesdk = "
> ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
> -
> -CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
> -
> -RRECOMMENDS_libcrypto += "openssl-conf"
> -RDEPENDS_${PN}-misc = "perl"
> -RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"
> -
> -RDEPENDS_${PN}-bin += "openssl-conf"
> -
> -BBCLASSEXTEND = "native nativesdk"
> -
> -CVE_PRODUCT = "openssl:openssl"
> -
> -# Only affects OpenSSL >= 1.1.1 in combination with Apache < 2.4.37
> -# Apache in meta-webserver is already recent enough
> -CVE_CHECK_WHITELIST += "CVE-2019-0190"
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> new file mode 100644
> index 0000000..52dbdf5
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> @@ -0,0 +1,216 @@
> +SUMMARY = "Secure Socket Layer"
> +DESCRIPTION = "Secure Socket Layer (SSL) binary and related cryptographic
> tools."
> +HOMEPAGE = "http://www.openssl.org/"
> +BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
> +SECTION = "libs/network"
> +
> +# "openssl" here actually means both OpenSSL and SSLeay licenses apply
> +# (see meta/files/common-licenses/OpenSSL to which "openssl" is
> SPDXLICENSEMAPped)
> +LICENSE = "openssl"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"
> +
> +DEPENDS = "hostperl-runtime-native"
> +
> +SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
> +           file://run-ptest \
> +           file://0001-skip-test_symbol_presence.patch \
> +
>  file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
> +           file://afalg.patch \
> +           file://reproducible.patch \
> +           "
> +
> +SRC_URI_append_class-nativesdk = " \
> +           file://environment.d-openssl.sh \
> +           "
> +
> +SRC_URI[sha256sum] =
> "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
> +
> +inherit lib_package multilib_header multilib_script ptest
> +MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
> +
> +PACKAGECONFIG ?= ""
> +PACKAGECONFIG_class-native = ""
> +PACKAGECONFIG_class-nativesdk = ""
> +
> +PACKAGECONFIG[cryptodev-linux] =
> "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
> +
> +B = "${WORKDIR}/build"
> +do_configure[cleandirs] = "${B}"
> +
> +#| ./libcrypto.so: undefined reference to `getcontext'
> +#| ./libcrypto.so: undefined reference to `setcontext'
> +#| ./libcrypto.so: undefined reference to `makecontext'
> +EXTRA_OECONF_append_libc-musl = " no-async"
> +EXTRA_OECONF_append_libc-musl_powerpc64 = " no-asm"
> +
> +# adding devrandom prevents openssl from using getrandom() which is not
> available on older glibc versions
> +# (native versions can be built with newer glibc, but then relocated onto
> a system with older glibc)
> +EXTRA_OECONF_class-native = "--with-rand-seed=os,devrandom"
> +EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
> +
> +# Relying on hardcoded built-in paths causes openssl-native to not be
> relocateable from sstate.
> +CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin
> -DENGINESDIR=/not/builtin"
> +CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin
> -DENGINESDIR=/not/builtin"
> +
> +do_configure () {
> +       os=${HOST_OS}
> +       case $os in
> +       linux-gnueabi |\
> +       linux-gnuspe |\
> +       linux-musleabi |\
> +       linux-muslspe |\
> +       linux-musl )
> +               os=linux
> +               ;;
> +       *)
> +               ;;
> +       esac
> +       target="$os-${HOST_ARCH}"
> +       case $target in
> +       linux-arm*)
> +               target=linux-armv4
> +               ;;
> +       linux-aarch64*)
> +               target=linux-aarch64
> +               ;;
> +       linux-i?86 | linux-viac3)
> +               target=linux-x86
> +               ;;
> +       linux-gnux32-x86_64 | linux-muslx32-x86_64 )
> +               target=linux-x32
> +               ;;
> +       linux-gnu64-x86_64)
> +               target=linux-x86_64
> +               ;;
> +       linux-mips | linux-mipsel)
> +               # specifying TARGET_CC_ARCH prevents openssl from
> (incorrectly) adding target architecture flags
> +               target="linux-mips32 ${TARGET_CC_ARCH}"
> +               ;;
> +       linux-gnun32-mips*)
> +               target=linux-mips64
> +               ;;
> +       linux-*-mips64 | linux-mips64 | linux-*-mips64el | linux-mips64el)
> +               target=linux64-mips64
> +               ;;
> +       linux-microblaze* | linux-nios2* | linux-sh3 | linux-sh4 |
> linux-arc*)
> +               target=linux-generic32
> +               ;;
> +       linux-powerpc)
> +               target=linux-ppc
> +               ;;
> +       linux-powerpc64)
> +               target=linux-ppc64
> +               ;;
> +       linux-powerpc64le)
> +               target=linux-ppc64le
> +               ;;
> +       linux-riscv32)
> +               target=linux-generic32
> +               ;;
> +       linux-riscv64)
> +               target=linux-generic64
> +               ;;
> +       linux-sparc | linux-supersparc)
> +               target=linux-sparcv9
> +               ;;
> +       esac
> +
> +       useprefix=${prefix}
> +       if [ "x$useprefix" = "x" ]; then
> +               useprefix=/
> +       fi
> +       # WARNING: do not set compiler/linker flags (-I/-D etc.) in
> EXTRA_OECONF, as they will fully replace the
> +       # environment variables set by bitbake. Adjust the environment
> variables instead.
> +       HASHBANGPERL="/usr/bin/env perl" PERL=perl
> PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
> +       perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS}
> --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir}
> $target
> +       perl ${B}/configdata.pm --dump
> +}
> +
> +do_install () {
> +       oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
> +
> +       oe_multilib_header openssl/opensslconf.h
> +
> +       # Create SSL structure for packages such as ca-certificates which
> +       # contain hard-coded paths to /etc/ssl. Debian does the same.
> +       install -d ${D}${sysconfdir}/ssl
> +       mv ${D}${libdir}/ssl-1.1/certs \
> +          ${D}${libdir}/ssl-1.1/private \
> +          ${D}${libdir}/ssl-1.1/openssl.cnf \
> +          ${D}${sysconfdir}/ssl/
> +
> +       # Although absolute symlinks would be OK for the target, they
> become
> +       # invalid if native or nativesdk are relocated from sstate.
> +       ln -sf ${@oe.path.relative('${libdir}/ssl-1.1',
> '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl-1.1/certs
> +       ln -sf ${@oe.path.relative('${libdir}/ssl-1.1',
> '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl-1.1/private
> +       ln -sf ${@oe.path.relative('${libdir}/ssl-1.1',
> '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-1.1/openssl.cnf
> +}
> +
> +do_install_append_class-native () {
> +       create_wrapper ${D}${bindir}/openssl \
> +           OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
> +           SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
> +           SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
> +           OPENSSL_ENGINES=${libdir}/engines-1.1
> +}
> +
> +do_install_append_class-nativesdk () {
> +       mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
> +       install -m 644 ${WORKDIR}/environment.d-openssl.sh
> ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
> +       sed 's|/usr/lib/ssl/|/usr/lib/ssl-1.1/|g' -i
> ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
> +}
> +
> +PTEST_BUILD_HOST_FILES += "configdata.pm"
> +PTEST_BUILD_HOST_PATTERN = "perl_version ="
> +do_install_ptest () {
> +       # Prune the build tree
> +       rm -f ${B}/fuzz/*.* ${B}/test/*.*
> +
> +       cp ${S}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
> +       cp -r ${S}/external ${B}/test ${S}/test ${B}/fuzz ${S}/util
> ${B}/util ${D}${PTEST_PATH}
> +
> +       # For test_shlibload
> +       ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/
> +       ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH}/
> +
> +       install -d ${D}${PTEST_PATH}/apps
> +       ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
> +       install -m644 ${S}/apps/*.pem ${S}/apps/*.srl
> ${S}/apps/openssl.cnf ${D}${PTEST_PATH}/apps
> +       install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
> +
> +       install -d ${D}${PTEST_PATH}/engines
> +       install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
> +}
> +
> +# Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
> +# package RRECOMMENDS on this package. This will enable the configuration
> +# file to be installed for both the openssl-bin package and the libcrypto
> +# package since the openssl-bin package depends on the libcrypto package.
> +
> +PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
> +
> +FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
> +FILES_libssl = "${libdir}/libssl${SOLIBS}"
> +FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf \
> +                      ${libdir}/ssl-1.1/openssl.cnf* \
> +                      "
> +FILES_${PN}-engines = "${libdir}/engines-1.1"
> +FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
> +FILES_${PN} =+ "${libdir}/ssl-1.1/*"
> +FILES_${PN}_append_class-nativesdk = "
> ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
> +
> +CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
> +
> +RRECOMMENDS_libcrypto += "openssl-conf"
> +RDEPENDS_${PN}-misc = "perl"
> +RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"
> +
> +RDEPENDS_${PN}-bin += "openssl-conf"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +CVE_PRODUCT = "openssl:openssl"
> +
> +# Only affects OpenSSL >= 1.1.1 in combination with Apache < 2.4.37
> +# Apache in meta-webserver is already recent enough
> +CVE_CHECK_WHITELIST += "CVE-2019-0190"
> --
> 2.7.4
>
>
> 
>
>

--00000000000051cbcd05b67fcc16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please set up git so that it detects file renames - t=
he patch is impossible to review.</div><div><br></div><div>Alex<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, 15 Dec 2020 at 12:48, Jamaluddin, Khairul Rohaizzat &lt;<a href=3D"ma=
ilto:khairul.rohaizzat.jamaluddin@intel.com">khairul.rohaizzat.jamaluddin@i=
ntel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Khairul Rohaizzat Jamaluddin &lt;<a href=3D"mailto:khairul.ro=
haizzat.jamaluddin@intel.com" target=3D"_blank">khairul.rohaizzat.jamaluddi=
n@intel.com</a>&gt;<br>
<br>
update version to 1.1.1i<br>
<br>
openssl 1.1.1i Fixed NULL pointer deref in GENERAL_NAME_cmp (CVE-2020-1971=
)<br>
<br>
updates include fix for CVE:<br>
CVE-2020-1971<br>
<br>
Signed-off-by: Khairul Rohaizzat Jamaluddin &lt;<a href=3D"mailto:khairul.=
rohaizzat.jamaluddin@intel.com" target=3D"_blank">khairul.rohaizzat.jamalud=
din@intel.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1h.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1h.bb</a> | 216 --------=
-------------<br>
=C2=A0.../recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1i.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1i.bb</a> | 216 ++++++++=
+++++++++++++<br>
=C2=A02 files changed, 216 insertions(+), 216 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/openssl/<a href=3D"http=
://openssl_1.1.1h.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1h.b=
b</a><br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssl/<a href=3D"http=
://openssl_1.1.1i.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1i.b=
b</a><br>
<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1=
.1.1h.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1h.bb</a> b/meta=
/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1h.bb" rel=3D"n=
oreferrer" target=3D"_blank">openssl_1.1.1h.bb</a><br>
deleted file mode 100644<br>
index 1827167..0000000<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1h.b=
b" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1h.bb</a><br>
+++ /dev/null<br>
@@ -1,216 +0,0 @@<br>
-SUMMARY =3D &quot;Secure Socket Layer&quot;<br>
-DESCRIPTION =3D &quot;Secure Socket Layer (SSL) binary and related crypto=
graphic tools.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://www.openssl.org/" rel=3D"noreferrer"=
 target=3D"_blank">http://www.openssl.org/</a>&quot;<br>
-BUGTRACKER =3D &quot;<a href=3D"http://www.openssl.org/news/vulnerabiliti=
es.html" rel=3D"noreferrer" target=3D"_blank">http://www.openssl.org/news/v=
ulnerabilities.html</a>&quot;<br>
-SECTION =3D &quot;libs/network&quot;<br>
-<br>
-# &quot;openssl&quot; here actually means both OpenSSL and SSLeay license=
s apply<br>
-# (see meta/files/common-licenses/OpenSSL to which &quot;openssl&quot; is=
 SPDXLICENSEMAPped)<br>
-LICENSE =3D &quot;openssl&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd343e62fc9c833710bbbed25f=
27364c8&quot;<br>
-<br>
-DEPENDS =3D &quot;hostperl-runtime-native&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://www.openssl.org/source/openssl-$%7BPV=
%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.openssl.org/sou=
rce/openssl-${PV}.tar.gz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-skip-test_symbol_pre=
sence.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-buildinfo-strip-sysr=
oot-and-debug-prefix-map-from-co.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://afalg.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://reproducible.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-SRC_URI_append_class-nativesdk =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http://environ=
ment.d-openssl.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-opens=
sl.sh</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-<br>
-SRC_URI[sha256sum] =3D &quot;5c9ca8774bd7b03e5784f26ae9e9e6d749c9da243854=
5077e6b3d755a06595d9&quot;<br>
-<br>
-inherit lib_package multilib_header multilib_script ptest<br>
-MULTILIB_SCRIPTS =3D &quot;${PN}-bin:${bindir}/c_rehash&quot;<br>
-<br>
-PACKAGECONFIG ?=3D &quot;&quot;<br>
-PACKAGECONFIG_class-native =3D &quot;&quot;<br>
-PACKAGECONFIG_class-nativesdk =3D &quot;&quot;<br>
-<br>
-PACKAGECONFIG[cryptodev-linux] =3D &quot;enable-devcryptoeng,disable-devc=
ryptoeng,cryptodev-linux,,cryptodev-module&quot;<br>
-<br>
-B =3D &quot;${WORKDIR}/build&quot;<br>
-do_configure[cleandirs] =3D &quot;${B}&quot;<br>
-<br>
-#| ./libcrypto.so: undefined reference to `getcontext&#39;<br>
-#| ./libcrypto.so: undefined reference to `setcontext&#39;<br>
-#| ./libcrypto.so: undefined reference to `makecontext&#39;<br>
-EXTRA_OECONF_append_libc-musl =3D &quot; no-async&quot;<br>
-EXTRA_OECONF_append_libc-musl_powerpc64 =3D &quot; no-asm&quot;<br>
-<br>
-# adding devrandom prevents openssl from using getrandom() which is not a=
vailable on older glibc versions<br>
-# (native versions can be built with newer glibc, but then relocated onto=
 a system with older glibc)<br>
-EXTRA_OECONF_class-native =3D &quot;--with-rand-seed=3Dos,devrandom&quot;=
<br>
-EXTRA_OECONF_class-nativesdk =3D &quot;--with-rand-seed=3Dos,devrandom&qu=
ot;<br>
-<br>
-# Relying on hardcoded built-in paths causes openssl-native to not be rel=
ocateable from sstate.<br>
-CFLAGS_append_class-native =3D &quot; -DOPENSSLDIR=3D/not/builtin -DENGIN=
ESDIR=3D/not/builtin&quot;<br>
-CFLAGS_append_class-nativesdk =3D &quot; -DOPENSSLDIR=3D/not/builtin -DEN=
GINESDIR=3D/not/builtin&quot;<br>
-<br>
-do_configure () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0os=3D${HOST_OS}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case $os in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-gnueabi |\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-gnuspe |\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-musleabi |\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-muslspe |\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-musl )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os=3Dlinux<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0target=3D&quot;$os-${HOST_ARCH}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case $target in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-arm*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-arm=
v4<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-aarch64*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-aar=
ch64<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-i?86 | linux-viac3)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-x86=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-gnux32-x86_64 | linux-muslx32-x86_64 )<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-x32=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-gnu64-x86_64)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-x86=
_64<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-mips | linux-mipsel)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# specifying TARGE=
T_CC_ARCH prevents openssl from (incorrectly) adding target architecture fl=
ags<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3D&quot;lin=
ux-mips32 ${TARGET_CC_ARCH}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-gnun32-mips*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-mip=
s64<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-*-mips64 | linux-mips64 | linux-*-mips64=
el | linux-mips64el)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux64-m=
ips64<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-microblaze* | linux-nios2* | linux-sh3 |=
 linux-sh4 | linux-arc*)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-gen=
eric32<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-powerpc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-ppc=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-powerpc64)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-ppc=
64<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-powerpc64le)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-ppc=
64le<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-riscv32)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-gen=
eric32<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-riscv64)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-gen=
eric64<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-sparc | linux-supersparc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-spa=
rcv9<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0useprefix=3D${prefix}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;x$useprefix&quot; =3D &quot;x&quot;=
 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0useprefix=3D/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# WARNING: do not set compiler/linker flags (-=
I/-D etc.) in EXTRA_OECONF, as they will fully replace the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# environment variables set by bitbake. Adjust=
 the environment variables instead.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0HASHBANGPERL=3D&quot;/usr/bin/env perl&quot; P=
ERL=3Dperl PERL5LIB=3D&quot;${S}/external/perl/Text-Template-1.46/lib/&quot=
; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGEC=
ONFIG_CONFARGS} --prefix=3D$useprefix --openssldir=3D${libdir}/ssl-1.1 --li=
bdir=3D${libdir} $target<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0perl ${B}/<a href=3D"http://configdata.pm" rel=
=
=3D"noreferrer" target=3D"_blank">configdata.pm</a> --dump<br>
-}<br>
-<br>
-do_install () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DESTDIR=3D&quot;${D}&quot; MANDIR=
=3D&quot;${mandir}&quot; MANSUFFIX=3Dssl install<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header openssl/opensslconf.h<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Create SSL structure for packages such as ca=
-certificates which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# contain hard-coded paths to /etc/ssl. Debian=
 does the same.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/ssl<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D}${libdir}/ssl-1.1/certs \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/ssl-1.1/private \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/ssl-1.1/openssl.cnf \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sysconfdir}/ssl/<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Although absolute symlinks would be OK for t=
he target, they become<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# invalid if native or nativesdk are relocated=
 from sstate.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${@oe.path.relative(&#39;${libdir}/ssl-=
1.1&#39;, &#39;${sysconfdir}/ssl/certs&#39;)} ${D}${libdir}/ssl-1.1/certs<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${@oe.path.relative(&#39;${libdir}/ssl-=
1.1&#39;, &#39;${sysconfdir}/ssl/private&#39;)} ${D}${libdir}/ssl-1.1/priva=
te<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${@oe.path.relative(&#39;${libdir}/ssl-=
1.1&#39;, &#39;${sysconfdir}/ssl/openssl.cnf&#39;)} ${D}${libdir}/ssl-1.1/o=
penssl.cnf<br>
-}<br>
-<br>
-do_install_append_class-native () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0create_wrapper ${D}${bindir}/openssl \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPENSSL_CONF=3D${libdir}/ssl-1.1=
/openssl.cnf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SSL_CERT_DIR=3D${libdir}/ssl-1.1=
/certs \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SSL_CERT_FILE=3D${libdir}/ssl-1.=
1/cert.pem \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPENSSL_ENGINES=3D${libdir}/engi=
nes-1.1<br>
-}<br>
-<br>
-do_install_append_class-nativesdk () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${SDKPATHNATIVE}/environment-setu=
p.d<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${WORKDIR}/<a href=3D"http://en=
vironment.d-openssl.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-=
openssl.sh</a> ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s|/usr/lib/ssl/|/usr/lib/ssl-1.1/|g&#=
39; -i ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh<br>
-}<br>
-<br>
-PTEST_BUILD_HOST_FILES +=3D &quot;<a href=3D"http://configdata.pm" rel=3D=
"noreferrer" target=3D"_blank">configdata.pm</a>&quot;<br>
-PTEST_BUILD_HOST_PATTERN =3D &quot;perl_version =3D&quot;<br>
-do_install_ptest () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Prune the build tree<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${B}/fuzz/*.* ${B}/test/*.*<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/Configure ${B}/<a href=3D"http://confi=
gdata.pm" rel=3D"noreferrer" target=3D"_blank">configdata.pm</a> ${D}${PTES=
T_PATH}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${S}/external ${B}/test ${S}/test ${B}/f=
uzz ${S}/util ${B}/util ${D}${PTEST_PATH}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# For test_shlibload<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_P=
ATH}/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH=
}/<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/apps<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m644 ${S}/apps/*.pem ${S}/apps/*.srl =
${S}/apps/openssl.cnf ${D}${PTEST_PATH}/apps<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH=
}/apps<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/engines<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m755 ${B}/engines/ossltest.so ${D}${P=
TEST_PATH}/engines<br>
-}<br>
-<br>
-# Add the openssl.cnf file to the openssl-conf package. Make the libcrypt=
o<br>
-# package RRECOMMENDS on this package. This will enable the configuration=
<br>
-# file to be installed for both the openssl-bin package and the libcrypto=
<br>
-# package since the openssl-bin package depends on the libcrypto package.=
<br>
-<br>
-PACKAGES =3D+ &quot;libcrypto libssl openssl-conf ${PN}-engines ${PN}-mis=
c&quot;<br>
-<br>
-FILES_libcrypto =3D &quot;${libdir}/libcrypto${SOLIBS}&quot;<br>
-FILES_libssl =3D &quot;${libdir}/libssl${SOLIBS}&quot;<br>
-FILES_openssl-conf =3D &quot;${sysconfdir}/ssl/openssl.cnf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${libdir}/ssl-1.1/openssl.cnf* \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 &quot;<br>
-FILES_${PN}-engines =3D &quot;${libdir}/engines-1.1&quot;<br>
-FILES_${PN}-misc =3D &quot;${libdir}/ssl-1.1/misc ${bindir}/c_rehash&quot=
;<br>
-FILES_${PN} =3D+ &quot;${libdir}/ssl-1.1/*&quot;<br>
-FILES_${PN}_append_class-nativesdk =3D &quot; ${SDKPATHNATIVE}/environmen=
t-setup.d/openssl.sh&quot;<br>
-<br>
-CONFFILES_openssl-conf =3D &quot;${sysconfdir}/ssl/openssl.cnf&quot;<br>
-<br>
-RRECOMMENDS_libcrypto +=3D &quot;openssl-conf&quot;<br>
-RDEPENDS_${PN}-misc =3D &quot;perl&quot;<br>
-RDEPENDS_${PN}-ptest +=3D &quot;openssl-bin perl perl-modules bash&quot;<=
br>
-<br>
-RDEPENDS_${PN}-bin +=3D &quot;openssl-conf&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-CVE_PRODUCT =3D &quot;openssl:openssl&quot;<br>
-<br>
-# Only affects OpenSSL &gt;=3D 1.1.1 in combination with Apache &lt; 2.4.=
37<br>
-# Apache in meta-webserver is already recent enough<br>
-CVE_CHECK_WHITELIST +=3D &quot;CVE-2019-0190&quot;<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1=
.1.1i.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1i.bb</a> b/meta=
/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1i.bb" rel=3D"n=
oreferrer" target=3D"_blank">openssl_1.1.1i.bb</a><br>
new file mode 100644<br>
index 0000000..52dbdf5<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_1.1.1i.b=
b" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1i.bb</a><br>
@@ -0,0 +1,216 @@<br>
+SUMMARY =3D &quot;Secure Socket Layer&quot;<br>
+DESCRIPTION =3D &quot;Secure Socket Layer (SSL) binary and related crypto=
graphic tools.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.openssl.org/" rel=3D"noreferrer"=
 target=3D"_blank">http://www.openssl.org/</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"http://www.openssl.org/news/vulnerabiliti=
es.html" rel=3D"noreferrer" target=3D"_blank">http://www.openssl.org/news/v=
ulnerabilities.html</a>&quot;<br>
+SECTION =3D &quot;libs/network&quot;<br>
+<br>
+# &quot;openssl&quot; here actually means both OpenSSL and SSLeay license=
s apply<br>
+# (see meta/files/common-licenses/OpenSSL to which &quot;openssl&quot; is=
 SPDXLICENSEMAPped)<br>
+LICENSE =3D &quot;openssl&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd343e62fc9c833710bbbed25f=
27364c8&quot;<br>
+<br>
+DEPENDS =3D &quot;hostperl-runtime-native&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://www.openssl.org/source/openssl-$%7BPV=
%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.openssl.org/sou=
rce/openssl-${PV}.tar.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-skip-test_symbol_pre=
sence.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-buildinfo-strip-sysr=
oot-and-debug-prefix-map-from-co.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://afalg.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://reproducible.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+SRC_URI_append_class-nativesdk =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http://environ=
ment.d-openssl.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-opens=
sl.sh</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;e8be6a35fe41d10603c3cc635e93289ed00bf34b7967=
1a3a4de64fcee00d5242&quot;<br>
+<br>
+inherit lib_package multilib_header multilib_script ptest<br>
+MULTILIB_SCRIPTS =3D &quot;${PN}-bin:${bindir}/c_rehash&quot;<br>
+<br>
+PACKAGECONFIG ?=3D &quot;&quot;<br>
+PACKAGECONFIG_class-native =3D &quot;&quot;<br>
+PACKAGECONFIG_class-nativesdk =3D &quot;&quot;<br>
+<br>
+PACKAGECONFIG[cryptodev-linux] =3D &quot;enable-devcryptoeng,disable-devc=
ryptoeng,cryptodev-linux,,cryptodev-module&quot;<br>
+<br>
+B =3D &quot;${WORKDIR}/build&quot;<br>
+do_configure[cleandirs] =3D &quot;${B}&quot;<br>
+<br>
+#| ./libcrypto.so: undefined reference to `getcontext&#39;<br>
+#| ./libcrypto.so: undefined reference to `setcontext&#39;<br>
+#| ./libcrypto.so: undefined reference to `makecontext&#39;<br>
+EXTRA_OECONF_append_libc-musl =3D &quot; no-async&quot;<br>
+EXTRA_OECONF_append_libc-musl_powerpc64 =3D &quot; no-asm&quot;<br>
+<br>
+# adding devrandom prevents openssl from using getrandom() which is not a=
vailable on older glibc versions<br>
+# (native versions can be built with newer glibc, but then relocated onto=
 a system with older glibc)<br>
+EXTRA_OECONF_class-native =3D &quot;--with-rand-seed=3Dos,devrandom&quot;=
<br>
+EXTRA_OECONF_class-nativesdk =3D &quot;--with-rand-seed=3Dos,devrandom&qu=
ot;<br>
+<br>
+# Relying on hardcoded built-in paths causes openssl-native to not be rel=
ocateable from sstate.<br>
+CFLAGS_append_class-native =3D &quot; -DOPENSSLDIR=3D/not/builtin -DENGIN=
ESDIR=3D/not/builtin&quot;<br>
+CFLAGS_append_class-nativesdk =3D &quot; -DOPENSSLDIR=3D/not/builtin -DEN=
GINESDIR=3D/not/builtin&quot;<br>
+<br>
+do_configure () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0os=3D${HOST_OS}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case $os in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-gnueabi |\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-gnuspe |\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-musleabi |\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-muslspe |\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-musl )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os=3Dlinux<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0target=3D&quot;$os-${HOST_ARCH}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case $target in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-arm*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-arm=
v4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-aarch64*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-aar=
ch64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-i?86 | linux-viac3)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-x86=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-gnux32-x86_64 | linux-muslx32-x86_64 )<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-x32=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-gnu64-x86_64)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-x86=
_64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-mips | linux-mipsel)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# specifying TARGE=
T_CC_ARCH prevents openssl from (incorrectly) adding target architecture fl=
ags<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3D&quot;lin=
ux-mips32 ${TARGET_CC_ARCH}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-gnun32-mips*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-mip=
s64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-*-mips64 | linux-mips64 | linux-*-mips64=
el | linux-mips64el)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux64-m=
ips64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-microblaze* | linux-nios2* | linux-sh3 |=
 linux-sh4 | linux-arc*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-gen=
eric32<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-powerpc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-ppc=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-powerpc64)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-ppc=
64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-powerpc64le)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-ppc=
64le<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-riscv32)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-gen=
eric32<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-riscv64)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-gen=
eric64<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linux-sparc | linux-supersparc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3Dlinux-spa=
rcv9<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0useprefix=3D${prefix}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;x$useprefix&quot; =3D &quot;x&quot;=
 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0useprefix=3D/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# WARNING: do not set compiler/linker flags (-=
I/-D etc.) in EXTRA_OECONF, as they will fully replace the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# environment variables set by bitbake. Adjust=
 the environment variables instead.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HASHBANGPERL=3D&quot;/usr/bin/env perl&quot; P=
ERL=3Dperl PERL5LIB=3D&quot;${S}/external/perl/Text-Template-1.46/lib/&quot=
; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGEC=
ONFIG_CONFARGS} --prefix=3D$useprefix --openssldir=3D${libdir}/ssl-1.1 --li=
bdir=3D${libdir} $target<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0perl ${B}/<a href=3D"http://configdata.pm" rel=
=
=3D"noreferrer" target=3D"_blank">configdata.pm</a> --dump<br>
+}<br>
+<br>
+do_install () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DESTDIR=3D&quot;${D}&quot; MANDIR=
=3D&quot;${mandir}&quot; MANSUFFIX=3Dssl install<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_multilib_header openssl/opensslconf.h<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Create SSL structure for packages such as ca=
-certificates which<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# contain hard-coded paths to /etc/ssl. Debian=
 does the same.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/ssl<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D}${libdir}/ssl-1.1/certs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/ssl-1.1/private \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/ssl-1.1/openssl.cnf \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sysconfdir}/ssl/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Although absolute symlinks would be OK for t=
he target, they become<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# invalid if native or nativesdk are relocated=
 from sstate.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${@oe.path.relative(&#39;${libdir}/ssl-=
1.1&#39;, &#39;${sysconfdir}/ssl/certs&#39;)} ${D}${libdir}/ssl-1.1/certs<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${@oe.path.relative(&#39;${libdir}/ssl-=
1.1&#39;, &#39;${sysconfdir}/ssl/private&#39;)} ${D}${libdir}/ssl-1.1/priva=
te<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ${@oe.path.relative(&#39;${libdir}/ssl-=
1.1&#39;, &#39;${sysconfdir}/ssl/openssl.cnf&#39;)} ${D}${libdir}/ssl-1.1/o=
penssl.cnf<br>
+}<br>
+<br>
+do_install_append_class-native () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0create_wrapper ${D}${bindir}/openssl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPENSSL_CONF=3D${libdir}/ssl-1.1=
/openssl.cnf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SSL_CERT_DIR=3D${libdir}/ssl-1.1=
/certs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SSL_CERT_FILE=3D${libdir}/ssl-1.=
1/cert.pem \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OPENSSL_ENGINES=3D${libdir}/engi=
nes-1.1<br>
+}<br>
+<br>
+do_install_append_class-nativesdk () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${D}${SDKPATHNATIVE}/environment-setu=
p.d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${WORKDIR}/<a href=3D"http://en=
vironment.d-openssl.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-=
openssl.sh</a> ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed &#39;s|/usr/lib/ssl/|/usr/lib/ssl-1.1/|g&#=
39; -i ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh<br>
+}<br>
+<br>
+PTEST_BUILD_HOST_FILES +=3D &quot;<a href=3D"http://configdata.pm" rel=3D=
"noreferrer" target=3D"_blank">configdata.pm</a>&quot;<br>
+PTEST_BUILD_HOST_PATTERN =3D &quot;perl_version =3D&quot;<br>
+do_install_ptest () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Prune the build tree<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${B}/fuzz/*.* ${B}/test/*.*<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/Configure ${B}/<a href=3D"http://confi=
gdata.pm" rel=3D"noreferrer" target=3D"_blank">configdata.pm</a> ${D}${PTES=
T_PATH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${S}/external ${B}/test ${S}/test ${B}/f=
uzz ${S}/util ${B}/util ${D}${PTEST_PATH}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# For test_shlibload<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_P=
ATH}/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH=
}/<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/apps<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m644 ${S}/apps/*.pem ${S}/apps/*.srl =
${S}/apps/openssl.cnf ${D}${PTEST_PATH}/apps<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH=
}/apps<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/engines<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m755 ${B}/engines/ossltest.so ${D}${P=
TEST_PATH}/engines<br>
+}<br>
+<br>
+# Add the openssl.cnf file to the openssl-conf package. Make the libcrypt=
o<br>
+# package RRECOMMENDS on this package. This will enable the configuration=
<br>
+# file to be installed for both the openssl-bin package and the libcrypto=
<br>
+# package since the openssl-bin package depends on the libcrypto package.=
<br>
+<br>
+PACKAGES =3D+ &quot;libcrypto libssl openssl-conf ${PN}-engines ${PN}-mis=
c&quot;<br>
+<br>
+FILES_libcrypto =3D &quot;${libdir}/libcrypto${SOLIBS}&quot;<br>
+FILES_libssl =3D &quot;${libdir}/libssl${SOLIBS}&quot;<br>
+FILES_openssl-conf =3D &quot;${sysconfdir}/ssl/openssl.cnf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ${libdir}/ssl-1.1/openssl.cnf* \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 &quot;<br>
+FILES_${PN}-engines =3D &quot;${libdir}/engines-1.1&quot;<br>
+FILES_${PN}-misc =3D &quot;${libdir}/ssl-1.1/misc ${bindir}/c_rehash&quot=
;<br>
+FILES_${PN} =3D+ &quot;${libdir}/ssl-1.1/*&quot;<br>
+FILES_${PN}_append_class-nativesdk =3D &quot; ${SDKPATHNATIVE}/environmen=
t-setup.d/openssl.sh&quot;<br>
+<br>
+CONFFILES_openssl-conf =3D &quot;${sysconfdir}/ssl/openssl.cnf&quot;<br>
+<br>
+RRECOMMENDS_libcrypto +=3D &quot;openssl-conf&quot;<br>
+RDEPENDS_${PN}-misc =3D &quot;perl&quot;<br>
+RDEPENDS_${PN}-ptest +=3D &quot;openssl-bin perl perl-modules bash&quot;<=
br>
+<br>
+RDEPENDS_${PN}-bin +=3D &quot;openssl-conf&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+CVE_PRODUCT =3D &quot;openssl:openssl&quot;<br>
+<br>
+# Only affects OpenSSL &gt;=3D 1.1.1 in combination with Apache &lt; 2.4.=
37<br>
+# Apache in meta-webserver is already recent enough<br>
+CVE_CHECK_WHITELIST +=3D &quot;CVE-2019-0190&quot;<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000051cbcd05b67fcc16--
