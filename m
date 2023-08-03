Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D07C001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 13:51:08 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.15368.1691070662154680012
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 06:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RaOnKA/1;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so15182021fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691070660; x=1691675460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2/hHWGux58/iqh7+Ni6FMbOW1pZPfmRaq8+o37e4bno=;
        b=RaOnKA/17Zfde2mmZ1pUrZLovo0O3a/BsGMi+n2bQHThNNvN+DbxR1dNJM9nQvjjLZ
         yIwpR0noNOgspSZrhgvTRQXYnZjWXf2JfBkeuy495t+k9QtYn4159QfCsRDXdXXmMMUQ
         ebPK/zWRmEcYgF22QwlE+sAoDDzVRSfKGOWd2zRsh3a2Cg0ZlLIKSvKA22+oH2EqzYgo
         9KYGL8gyO8PqRnRdcSkFT2tV6Lfoz0+0HqpdwRiF7d95AK8Xd9Mdt4X7WRZi744pCpfi
         cucda3sGm/wKUjcXnF1CEq7mZ9wqcMl6PYchu07HI8mUJnqI8SH1WWohGkLUrkHJUtIw
         lwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691070660; x=1691675460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/hHWGux58/iqh7+Ni6FMbOW1pZPfmRaq8+o37e4bno=;
        b=OQHkOul9WREWnY/gTYzXABv9QS5XNv9Pbe5WOEs2kBfTTFDH/UGourgd/MevqgmRnd
         GYZ7T/ovCCu2t3SpZKOIbWrOQFy9ZBeerJERyd2wZLFdfbqEdurh+xswuTNoCxFBUyCj
         v2S9GMoPnvikBUD9IZv6lPvgJBepLF4VwsvyWhtZ7PP7BLwMySXzoDzFOu2V3X9gFwDX
         tWuAZd5LU79WEuqyyHG5SmK4IUietsaGZr+IEkubGpP5B7CscylbCHlNp9QiU61mb4s+
         JOBS5l4sTIf7B/2tCazTiXUIGp+027whZ55XumNV1T3Nq/oHdX2obkYejeMUZfuMQBZT
         RGHg==
X-Gm-Message-State: ABy/qLb0yuactKR/V95QpbkkhCQ6d4hg7kFKwUIQ13o055CEXaAbzMb4
	eqQsBTwNLfoUB2hPvTpYVXRKr9YrzdvGwQfmbWk=
X-Google-Smtp-Source: APBJJlHZjss9SVyGmyFkulusmNqpQb3JpT7704Uik6w5XdF9+BSwi8Jzv88wEtSw/RANVBvjaqHyiH0G8lAmFF+Jlo8=
X-Received: by 2002:a2e:980c:0:b0:2b9:b41a:aa66 with SMTP id
 a12-20020a2e980c000000b002b9b41aaa66mr8485159ljj.20.1691070659965; Thu, 03
 Aug 2023 06:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230803132908.4134002-1-jstephan@baylibre.com> <20230803132908.4134002-2-jstephan@baylibre.com>
In-Reply-To: <20230803132908.4134002-2-jstephan@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Aug 2023 15:50:48 +0200
Message-ID: <CANNYZj8=HDJrMyF21pGbNRD3L6G-_cVdMMQ=_CU0ev_GgAzjcA@mail.gmail.com>
Subject: Re: [OE-core] [RESEND 1/1] libexif: add ptest support
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 13:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185478

What do the tests actually do? If they test libexif functionality in
isolation, is there a need to run them, if upstream does this anyway?
ptests are primarily meant for integration testing, e.g. exposing
issues that arise in a complete customized system.

Alex

On Thu, 3 Aug 2023 at 15:29, Julien Stephan <jstephan@baylibre.com> wrote:
>
> adds ptest support for libexif
>
> Ptest was executed on a core-image-minimal:
> root@qemux86-64:~# ptest-runner libexif
> START: ptest-runner
> 2023-07-12T15:45
> BEGIN: /usr/lib/libexif/ptest
> [...]
> i====================
> All 13 tests passed
> (1 test was not run)
> ====================
> [...]
> DURATION: 35
> END: /usr/lib/libexif/ptest
> 2023-07-12T15:45
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  ...-serial-tests-config-needed-by-ptest.patch | 26 ++++++++++++++++
>  .../recipes-support/libexif/libexif/run-ptest |  3 ++
>  .../recipes-support/libexif/libexif_0.6.24.bb | 30 ++++++++++++++++++-
>  4 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
>  create mode 100644 meta/recipes-support/libexif/libexif/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 6250cf081e0..bbbef5b0431 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -75,6 +75,7 @@ PTESTS_FAST = "\
>      slang \
>      wayland \
>      zlib \
> +    libexif \
>  "
>  PTESTS_FAST:append:libc-glibc = " glibc-tests"
>  PTESTS_PROBLEMS:remove:libc-glibc = "glibc-tests"
> diff --git a/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch b/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
> new file mode 100644
> index 00000000000..505aa073309
> --- /dev/null
> +++ b/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config-needed-by-ptest.patch
> @@ -0,0 +1,26 @@
> +From 1ee7217c8ae724d793f9a9876c3608057a2ccbf8 Mon Sep 17 00:00:00 2001
> +From: Julien Stephan <jstephan@baylibre.com>
> +Date: Tue, 11 Jul 2023 16:07:54 +0200
> +Subject: [PATCH] Add serial-tests config needed by ptest
> +
> +Add serial-tests support, ptest needs it.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> +---
> + configure.ac | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index cd48047..5413907 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -16,6 +16,7 @@ AM_INIT_AUTOMAKE([
> +   dist-zip
> +   check-news
> +   subdir-objects
> ++  serial-tests
> + ])
> + AM_MAINTAINER_MODE
> +
> diff --git a/meta/recipes-support/libexif/libexif/run-ptest b/meta/recipes-support/libexif/libexif/run-ptest
> new file mode 100644
> index 00000000000..2d23159eb03
> --- /dev/null
> +++ b/meta/recipes-support/libexif/libexif/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +make -o Makefile runtest-TESTS
> diff --git a/meta/recipes-support/libexif/libexif_0.6.24.bb b/meta/recipes-support/libexif/libexif_0.6.24.bb
> index 367f012f8cf..27e369a89a5 100644
> --- a/meta/recipes-support/libexif/libexif_0.6.24.bb
> +++ b/meta/recipes-support/libexif/libexif_0.6.24.bb
> @@ -11,12 +11,40 @@ def version_underscore(v):
>      return "_".join(v.split("."))
>
>  SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 \
> +           file://0001-Add-serial-tests-config-needed-by-ptest.patch \
> +           file://run-ptest \
>             "
>
>  SRC_URI[sha256sum] = "d47564c433b733d83b6704c70477e0a4067811d184ec565258ac563d8223f6ae"
>
> -inherit autotools gettext github-releases
> +inherit autotools gettext github-releases ptest
>
>  EXTRA_OECONF += "--disable-docs"
>
> +do_compile_ptest() {
> +    oe_runmake -C test buildtest-TESTS
> +}
> +
> +do_install_ptest() {
> +    install ${B}/test/test*[!\.o] ${D}${PTEST_PATH}
> +    for f in ${D}${PTEST_PATH}/test*; do
> +        sed -i "s/\(LD_LIBRARY_PATH=\).*\(:\$LD_LIBRARY_PATH\)\"/\1.\2/" $f
> +    done
> +
> +    install ${B}/test/Makefile ${D}${PTEST_PATH}
> +    sed -i -e "/^srcdir/c srcdir = \$\{PWD\}" ${D}${PTEST_PATH}/Makefile
> +
> +    install -d ${D}${PTEST_PATH}/nls
> +    install ${B}/test/nls/*[!\.o] ${D}${PTEST_PATH}/nls
> +    install -d ${D}${PTEST_PATH}/.libs
> +    install ${B}/test/.libs/* ${D}${PTEST_PATH}/.libs
> +
> +    install ${S}/test/*.sh ${D}${PTEST_PATH}
> +
> +    install -d ${D}${PTEST_PATH}/testdata
> +    install ${S}/test/testdata/* ${D}${PTEST_PATH}/testdata
> +}
> +
> +RDEPENDS:${PN}-ptest += "make bash"
> +
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185477): https://lists.openembedded.org/g/openembedded-core/message/185477
> Mute This Topic: https://lists.openembedded.org/mt/100525801/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

