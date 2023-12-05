Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516ACC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 09:59:19 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.97085.1701770349744974324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 01:59:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JMTzuSMo;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c9efa1ab7fso35912511fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 01:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701770348; x=1702375148; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kBltWcSp3usIgGXnKm/b2+CctOq3mXZuzinS+pAzQmU=;
        b=JMTzuSMov21VhBsKmQLVONpgWiD8Ac9gMPuqx6eNPFNKN4msI8MNne8KpyaKeuoz6K
         VPFNjZc1wdd5PMjLsK+j/kPRrOWFpq1P6kmUQipYnpSVT3F0Bz7xaeyWkj4/mfv9TwJx
         nL/QN6czrdHXaPn6jzTywUKQ3ZYQ4Ygse981n5YmN1QoIYQVuZ0No05eUvz6IlFFi/I5
         6UbOhjZbzkYsRifRkprySNI3gqVPCx+zPKnp2X9Xom3hfa72zTyqAgEHUpWaKCxB5Ktn
         s8XFdwzFREBfjz/F6uu3B9gE5o/MEk2Vx1HH/TrXvUsz770DERZ8QxprvRkpdiwyrpPS
         UMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701770348; x=1702375148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBltWcSp3usIgGXnKm/b2+CctOq3mXZuzinS+pAzQmU=;
        b=nq2xW9Et0/rM2mKUo+uugQGs3AB0gpoBYLjk2tfrmIhpZDo8Uh5zs+sz6AbjYaPO9Y
         oljDVuhX5gKBKJpq/FhhMUeC1urwjhfy2jMszzNHTRobl4xu7zBxgKnbS8p6CjWvrMHg
         h8stCa7t0XiMJ7d6PihlphBxEo7JnzOU4GYWv8ghSPeDgPv4vfVcG2rjwc/IhV1Ne4Ay
         s+jk5SECeTCUSTaIaenUOvJzpxbWGnZB82whVblqHSsBBoo6pq1DXEg1Qyv9F6Ax7eTO
         PVWcUfQiwUYMbdbmZPADtGHEtoQ/YWIVeoH5fRoM2A49lbYQRBoCyNXJl/TOosQhojQr
         oqmw==
X-Gm-Message-State: AOJu0YyR/z+6ZzSxih940wT3cAQtssfeK/PLZqPp4Ao4zBUTcJykdbPu
	jwT6jdejPblxejlEBQvDj2u+Gxp27vpkvFQMFqZvyIBz
X-Google-Smtp-Source: AGHT+IHTC+lzCSkXqqdZ3LWXmLhu+fsijhk0CzQTsMi2XKcklMLvkNXC6ttny0RTZAz8Ammcx/VxCP2r9JbPTOAmW3M=
X-Received: by 2002:a05:6512:3e07:b0:50b:eadf:f173 with SMTP id
 i7-20020a0565123e0700b0050beadff173mr1375992lfv.73.1701770347372; Tue, 05 Dec
 2023 01:59:07 -0800 (PST)
MIME-Version: 1.0
References: <20231204193621.3974827-1-joe.slater@windriver.com>
In-Reply-To: <20231204193621.3974827-1-joe.slater@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Dec 2023 10:58:56 +0100
Message-ID: <CANNYZj8yjmeQLT_oho-n0bBG=_pGqcbfq_bQQqArBj19FOwxBg@mail.gmail.com>
Subject: Re: [mickledore][oe-core][PATCH 1/1] gnutls: update to version 3.8.2
To: joe.slater@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 09:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191813

mickledore is already end of life I think?

Alex

On Mon, 4 Dec 2023 at 20:36, Joe Slater via lists.openembedded.org
<joe.slater=windriver.com@lists.openembedded.org> wrote:
>
> From: Joe Slater <joe.slater@windriver.com>
>
> De-fuzz existing patches.
> Do not update PACKAGECONFIG to match master.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  ...ile-should-be-excuted-in-target-envi.patch |  2 --
>  .../gnutls/gnutls/Add-ptest-support.patch     | 10 ++-----
>  .../gnutls/gnutls/arm_eabi.patch              |  6 ++--
>  .../{gnutls_3.8.0.bb => gnutls_3.8.2.bb}      | 30 +++++++++++--------
>  4 files changed, 22 insertions(+), 26 deletions(-)
>  rename meta/recipes-support/gnutls/{gnutls_3.8.0.bb => gnutls_3.8.2.bb} (79%)
>
> diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
> index 4bdc40d932..da89d7faa1 100644
> --- a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
> +++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
> @@ -11,8 +11,6 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
>   lib/Makefile.am | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> -diff --git a/lib/Makefile.am b/lib/Makefile.am
> -index 6d4e8d2..24ef108 100644
>  --- a/lib/Makefile.am
>  +++ b/lib/Makefile.am
>  @@ -206,8 +206,7 @@ hmac_file = .libs/.$(gnutls_so).hmac
> diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> index f87cf536fa..b9b75888ff 100644
> --- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> +++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
> @@ -12,8 +12,6 @@ Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
>   tests/Makefile.am | 6 ++++++
>   3 files changed, 11 insertions(+)
>
> -diff --git a/Makefile.am b/Makefile.am
> -index 843193f..816b09f 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
>  @@ -191,6 +191,9 @@ dist-hook:
> @@ -26,11 +24,9 @@ index 843193f..816b09f 100644
>   .PHONY: abi-check abi-dump-versioned abi-dump-latest pic-check symbol-check local-code-coverage-output files-update AUTHORS
>
>   include $(top_srcdir)/cligen/cligen.mk
> -diff --git a/configure.ac b/configure.ac
> -index b25ba14..860ddef 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1150,6 +1150,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
> +@@ -1194,6 +1194,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
>
>   AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
>
> @@ -39,11 +35,9 @@ index b25ba14..860ddef 100644
>   AC_DEFINE([GNUTLS_INTERNAL_BUILD], 1, [We allow temporarily usage of deprecated functions - until they are removed.])
>
>   hw_features=
> -diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index d530ad0..71c592f 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -648,6 +648,12 @@ SH_LOG_COMPILER = $(SHELL)
> +@@ -657,6 +657,12 @@ SH_LOG_COMPILER = $(SHELL)
>   AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
>   LOG_COMPILER = $(LOG_VALGRIND)
>
> diff --git a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
> index 2b61a703cb..2de9258a8a 100644
> --- a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
> +++ b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
> @@ -14,11 +14,9 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
>   tests/seccomp.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> -diff --git a/tests/seccomp.c b/tests/seccomp.c
> -index a3148fe..443bc5f 100644
>  --- a/tests/seccomp.c
>  +++ b/tests/seccomp.c
> -@@ -52,7 +52,9 @@ int disable_system_calls(void)
> +@@ -55,7 +55,9 @@ int disable_system_calls(void)
>
>         ADD_SYSCALL(nanosleep, 0);
>         ADD_SYSCALL(clock_nanosleep, 0);
> @@ -27,4 +25,4 @@ index a3148fe..443bc5f 100644
>  +#endif
>         ADD_SYSCALL(getpid, 0);
>         ADD_SYSCALL(gettimeofday, 0);
> - # if defined(HAVE_CLOCK_GETTIME)
> + #if defined(HAVE_CLOCK_GETTIME)
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.0.bb b/meta/recipes-support/gnutls/gnutls_3.8.2.bb
> similarity index 79%
> rename from meta/recipes-support/gnutls/gnutls_3.8.0.bb
> rename to meta/recipes-support/gnutls/gnutls_3.8.2.bb
> index 7ddd2420bd..dc975317c8 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.0.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.2.bb
> @@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
>                      file://doc/COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
>
>  DEPENDS = "nettle gmp virtual/libiconv libunistring"
> -DEPENDS:append:libc-musl = " argp-standalone"
>
>  SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
>
> @@ -26,24 +25,31 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
>             file://Add-ptest-support.patch \
>             "
>
> -SRC_URI[sha256sum] = "0ea0d11a1660a1e63f960f157b197abe6d0c8cb3255be24e1fb3815930b9bdc5"
> +SRC_URI[sha256sum] = "e765e5016ffa9b9dd243e363a0460d577074444ee2491267db2e96c9c2adef77"
>
>  inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
>
> -PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
> +# do not use the updated default PACKAGECONFIG from master branch
> +#
> +# PACKAGECONFIG ??= "libidn libtasn1 ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
> +PACKAGECONFIG ??= "libidn ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
>
>  # You must also have CONFIG_SECCOMP enabled in the kernel for
>  # seccomp to work.
>  PACKAGECONFIG[seccomp] = "--with-libseccomp-prefix=${STAGING_EXECPREFIXDIR},ac_cv_libseccomp=no,libseccomp"
>  PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
> -PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
> +PACKAGECONFIG[libtasn1] = "--without-included-libtasn1,--with-included-libtasn1,libtasn1"
>  PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
>  PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
>  PACKAGECONFIG[fips] = "--enable-fips140-mode --with-libdl-prefix=${STAGING_BASELIBDIR}"
> +PACKAGECONFIG[dane] = "--enable-libdane,--disable-libdane,unbound"
> +# Certificate compression
> +PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
> +PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
> +PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
>
>  EXTRA_OECONF = " \
>      --enable-doc \
> -    --disable-libdane \
>      --disable-rpath \
>      --enable-openssl-compatibility \
>      --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
> @@ -54,14 +60,16 @@ EXTRA_OECONF = " \
>  # Otherwise the tools try and use HOSTTOOLS_DIR/bash as a shell.
>  export POSIX_SHELL="${base_bindir}/sh"
>
> -LDFLAGS:append:libc-musl = " -largp"
> -
>  do_configure:prepend() {
>         for dir in . lib; do
>                 rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
>         done
>  }
>
> +do_compile_ptest() {
> +    oe_runmake -C tests buildtest-TESTS
> +}
> +
>  do_install:append:class-target() {
>          if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
>            install -d ${D}${bindir}/bin
> @@ -69,13 +77,11 @@ do_install:append:class-target() {
>          fi
>  }
>
> -do_compile:append() {
> -        oe_runmake ${PARALLEL_MAKE} -C tests buildtest-TESTS
> -}
> -
> -PACKAGES =+ "${PN}-openssl ${PN}-xx ${PN}-fips"
> +PACKAGES =+ "${PN}-dane ${PN}-openssl ${PN}-xx ${PN}-fips"
>
>  FILES:${PN}-dev += "${bindir}/gnutls-cli-debug"
> +
> +FILES:${PN}-dane = "${libdir}/libgnutls-dane.so.*"
>  FILES:${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
>  FILES:${PN}-xx = "${libdir}/libgnutlsxx.so.*"
>  FILES:${PN}-fips = "${bindir}/fipshmac"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191768): https://lists.openembedded.org/g/openembedded-core/message/191768
> Mute This Topic: https://lists.openembedded.org/mt/102977748/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

